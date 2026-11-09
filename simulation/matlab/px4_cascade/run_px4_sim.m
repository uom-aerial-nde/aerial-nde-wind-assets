% run_px4_sim.m  -  quadrotor with a PX4-style controller, as a plain MATLAB script
% Uses the teammate's quad_dynamics.m (physics) and uav_init.m (parameters).
% Controller runs at 1 kHz like PX4; the drone is integrated with RK4 at the same step.

clear; clc;
px4_init;                          % parameters + PX4 gains -> struct p
clear px4_controller               % reset the controller's integrators

dt = p.Ts_rate;                    % 1 ms
N  = round(p.Tstop/dt);

state = p.state0;                  % [pos; vel; euler; omega]
f     = p.m*p.g/4*ones(4,1);       % actual motor thrusts (start at hover)

% logs (every 10 ms)
k_log = 10;  n_log = floor(N/k_log)+1;
t_log = zeros(n_log,1); ref_log = zeros(n_log,3); x_log = zeros(n_log,12);
f_log = zeros(n_log,4); attref_log = zeros(n_log,3); j = 0;

for k = 0:N-1
    t = k*dt;
    [pos_ref, vel_ref, acc_ref, yaw_ref] = px4_trajectory(t);
    [f_cmd, att_ref] = px4_controller(pos_ref, vel_ref, acc_ref, yaw_ref, state, p);

    % plant = rigid body (quad_dynamics) + first-order motor lag, RK4 step
    x  = [state; f];
    fx = @(x) [quad_dynamics(x(1:12), x(13:16), p); (f_cmd - x(13:16))/p.tau_m];
    k1 = fx(x); k2 = fx(x + dt/2*k1); k3 = fx(x + dt/2*k2); k4 = fx(x + dt*k3);
    x  = x + dt/6*(k1 + 2*k2 + 2*k3 + k4);
    state = x(1:12);  f = x(13:16);

    if mod(k, k_log) == 0
        j = j+1; t_log(j) = t; ref_log(j,:) = pos_ref'; x_log(j,:) = state';
        f_log(j,:) = f'; attref_log(j,:) = att_ref';
    end
end
t_log = t_log(1:j); ref_log = ref_log(1:j,:); x_log = x_log(1:j,:);
f_log = f_log(1:j,:); attref_log = attref_log(1:j,:);

px4_plots(t_log, ref_log, x_log, f_log, attref_log, p, 'MATLAB script');
