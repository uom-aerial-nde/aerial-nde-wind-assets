function xdot = quad_dynamics(state, f, p)

% state  = [pos(3); vel(3); euler(3)=[phi;theta;psi]; omega(3)(roll, pitch, and yaw rates)]
% f  = actual motor thrusts [N], 4x1 (after saturation and motor lag)
% p  = parameter struct from uav_init.m 

vel = state(4:6);  phi = state(7); th = state(8); psi = state(9);  w = state(10:12);

% Vector for the thrust and roll, pitch, and yaw torques
u   = p.A * f;                 % [T; tx; ty; tz]
T   = u(1);   tau = u(2:4);

% ZYX rotation body -> world
cph=cos(phi); sph=sin(phi); cth=cos(th); sth=sin(th); cps=cos(psi); sps=sin(psi);
R = [cps*cth, cps*sth*sph - sps*cph, cps*sth*cph + sps*sph;
     sps*cth, sps*sth*sph + cps*cph, sps*sth*cph - cps*sph;
     -sth,    cth*sph,               cth*cph];

acc  = [0;0;-p.g] + R*[0;0;T]/p.m;          % translation (z up)
wdot = p.J \ (tau - cross(w, p.J*w));       % rotation

% Euler-angle kinematics 
% !!!singular at theta = +/-90 deg
E = [1, sph*tan(th),  cph*tan(th);
     0, cph,         -sph;
     0, sph/cth,      cph/cth];
eul_dot = E * w;

xdot = [vel; acc; eul_dot; wdot];
end
