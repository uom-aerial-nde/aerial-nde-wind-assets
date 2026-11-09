function [f_cmd, att_ref] = px4_controller(pos_ref, vel_ref, acc_ref, yaw_ref, state, p)
% PX4-style cascaded multicopter controller, run every p.Ts_rate seconds (1 kHz).
%
%   position P  ->  velocity PID  ->  acceleration setpoint
%   -> thrust + desired attitude (uses the rotation matrix)
%   -> attitude P  ->  body-rate PID  ->  torques  ->  mixer  ->  motor thrusts
%
% Inputs : setpoints from px4_trajectory, state = [pos; vel; euler; omega]
% Outputs: f_cmd   = 4 commanded motor thrusts [N] (before motor lag)
%          att_ref = desired [roll; pitch; yaw] [rad], for plotting
%
% Integrators are kept in persistent variables. In a MATLAB script call
% "clear px4_controller" before each new run to reset them.

persistent int_vel int_rate vel_prev w_prev
if isempty(int_vel)
    int_vel  = zeros(3,1);
    int_rate = zeros(3,1);
    vel_prev = zeros(3,1);
    w_prev   = zeros(3,1);
end

dt  = p.Ts_rate;
c   = p.px4;
pos = state(1:3);  vel = state(4:6);
phi = state(7);    th  = state(8);   psi = state(9);
w   = state(10:12);

%% ---------------- OUTER LOOP ----------------
% 1) Position P -> velocity setpoint (plus feed-forward), with speed limits
vel_sp = c.Kp_pos .* (pos_ref - pos) + vel_ref;
vel_sp(1:2) = max(min(vel_sp(1:2), c.vxy_max), -c.vxy_max);
vel_sp(3)   = max(min(vel_sp(3),   c.vz_up),   -c.vz_dn);

% 2) Velocity PID -> acceleration setpoint (plus feed-forward)
e_vel   = vel_sp - vel;
dvel    = (vel - vel_prev) / dt;   vel_prev = vel;
acc_sp  = c.Kp_vel .* e_vel + c.Ki_vel .* int_vel - c.Kd_vel .* dvel + acc_ref;

% 3) Acceleration -> thrust vector (world frame), F = m (a + g z)
F = p.m * (acc_sp + [0; 0; p.g]);
F(3) = max(F(3), 0.1*p.m*p.g);                 % never ask for negative lift

% Tilt limit: horizontal part of F can be at most F_z * tan(tilt_max)
F_xy = norm(F(1:2));  F_xy_max = F(3) * tan(c.tilt_max);
if F_xy > F_xy_max
    F(1:2) = F(1:2) * F_xy_max / F_xy;         % saturated: freeze integrator
else
    int_vel = int_vel + e_vel * dt;
end

%% ---- ACCELERATION -> ATTITUDE (rotation matrix step) ----
% Desired body z-axis points along F; desired heading sets body x-axis.
zb = F / norm(F);
xc = [cos(yaw_ref); sin(yaw_ref); 0];
yb = cross(zb, xc);  yb = yb / norm(yb);
xb = cross(yb, zb);
R_des = [xb, yb, zb];                          % desired body->world rotation

% Current rotation matrix (same ZYX matrix as quad_dynamics.m)
cph=cos(phi); sph=sin(phi); cth=cos(th); sth=sin(th); cps=cos(psi); sps=sin(psi);
R = [cps*cth, cps*sth*sph - sps*cph, cps*sth*cph + sps*sph;
     sps*cth, sps*sth*sph + cps*cph, sps*sth*cph - cps*sph;
     -sth,    cth*sph,               cth*cph];

% Collective thrust = component of F along the CURRENT body z-axis
T = F' * R(:,3);
T = max(min(T, 4*p.fmax), 0);

% Desired Euler angles (for plots only)
att_ref = [atan2(R_des(3,2), R_des(3,3)); -asin(R_des(3,1)); atan2(R_des(2,1), R_des(1,1))];

%% ---------------- INNER LOOP ----------------
% 4) Attitude error on SO(3):  e_R = 1/2 vee(R_des' R - R' R_des)
E = R_des' * R - R' * R_des;
e_R = 0.5 * [E(3,2); E(1,3); E(2,1)];
w_sp = -c.Kp_att .* e_R;                       % body-rate setpoint [rad/s]

% 5) Body-rate PID -> angular acceleration -> torque
e_w      = w_sp - w;
int_rate = max(min(int_rate + e_w*dt, c.rate_int_lim), -c.rate_int_lim);
dw       = (w - w_prev) / dt;   w_prev = w;
alpha    = c.Kp_rate .* e_w + c.Ki_rate .* int_rate - c.Kd_rate .* dw;
tau      = p.J * alpha + cross(w, p.J * w);

%% ---------------- MIXER ----------------
f_cmd = p.Minv * [T; tau];
f_cmd = max(min(f_cmd, p.fmax), 0);
end
