
% !!! run before simulating 
% !!! Placeholder values
 
% world: ENU-style, z up. 
% Body: x forward, y left, z up (FLU).

p.m   = 1.5;          % mass [kg]
p.g   = 9.81;         % gravity [m/s^2]
p.L   = 0.25;         % arm length, centre to motor [m]
p.kT  = 8.5e-6;       % thrust coeff  T = kT*w^2   [N/(rad/s)^2]
p.kQ  = 1.4e-7;       % torque coeff  Q = kQ*w^2   [N*m/(rad/s)^2]
p.J   = diag([0.0125 0.0125 0.025]);   % inertia [kg*m^2]
p.tau_m = 0.03;       % motor time constant [s]
p.fmax  = 8.0;        % max thrust per motor [N]

d = p.L/sqrt(2);      % effective moment arm (X config)
c = p.kQ/p.kT;        % yaw torque per unit thrust



% M1 front-left, M2 front-right, M3 rear-right, M4 rear-left
% diagonal pairs spin the same way: M1,M3 = -c ; M2,M4 = +c

% [T; tx; ty; tz] = A * [f1; f2; f3; f4]

A = [ 1   1   1   1;
      d  -d  -d   d;
     -d  -d   d   d;
     -c   c  -c   c];

p.A    = A;
p.Minv = inv(A);      % mixer: f = Minv * [T; tx; ty; tz]

p.Ts_rate = 1/1000;   % rate loop sample time [s]
p.state0 = zeros(12,1);   % [pos(3); vel(3); euler(3); omega(3)]



% altitude controller PID values:
p.Kp_AltCon = 1;
p.Kd_AltCon = 1;