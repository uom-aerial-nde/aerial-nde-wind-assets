% px4_init.m  -  run this instead of uav_init before simulating the PX4 version
% Loads the drone parameters from uav_init.m, then adds the PX4-style
% controller gains in p.px4.  Names in brackets are the matching PX4 parameters.

% use the teammate's drone model files from ../altitude_model
addpath(fullfile(fileparts(mfilename('fullpath')), '..', 'altitude_model'));

uav_init;                       % teammate's file: mass, inertia, mixer, p.Ts_rate etc.

% ---------- Outer loop (PX4 "mc_pos_control") ----------
p.px4.Kp_pos   = [0.95; 0.95; 1.0];   % position P        [MPC_XY_P, MPC_Z_P]
p.px4.Kp_vel   = [1.8; 1.8; 4.0];     % velocity P        [MPC_XY_VEL_P_ACC, MPC_Z_VEL_P_ACC]
p.px4.Ki_vel   = [0.4; 0.4; 2.0];     % velocity I        [MPC_XY_VEL_I_ACC, MPC_Z_VEL_I_ACC]
p.px4.Kd_vel   = [0.2; 0.2; 0.0];     % velocity D        [MPC_XY_VEL_D_ACC, MPC_Z_VEL_D_ACC]
p.px4.vxy_max  = 12;                  % max horizontal speed [m/s]   [MPC_XY_VEL_MAX]
p.px4.vz_up    = 3.0;                 % max climb rate   [m/s]       [MPC_Z_VEL_MAX_UP]
p.px4.vz_dn    = 1.5;                 % max descent rate [m/s]       [MPC_Z_VEL_MAX_DN]
p.px4.tilt_max = deg2rad(45);         % max tilt angle               [MPC_TILTMAX_AIR]

% ---------- Inner loop (PX4 "mc_att_control" + "mc_rate_control") ----------
p.px4.Kp_att   = [6.5; 6.5; 2.8];     % attitude P [1/s]  [MC_ROLL_P, MC_PITCH_P, MC_YAW_P]
% PX4's rate gains are in normalised units for its own mixer. Here the rate
% loop outputs angular acceleration [rad/s^2] and is multiplied by the
% inertia J, so the gains below are the physical-unit equivalents for THIS drone.
p.px4.Kp_rate  = [18; 18; 10];        % rate P   [MC_ROLLRATE_P, MC_PITCHRATE_P, MC_YAWRATE_P]
p.px4.Ki_rate  = [5; 5; 2];           % rate I   [MC_ROLLRATE_I, ...]
p.px4.Kd_rate  = [0; 0; 0];           % rate D   [MC_ROLLRATE_D, ...] (not needed here)
p.px4.rate_int_lim = 1;               % anti-windup limit on rate integrator

p.Tstop = 30;                         % simulation length [s]
