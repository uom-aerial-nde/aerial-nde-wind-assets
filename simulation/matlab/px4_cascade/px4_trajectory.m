function [pos_ref, vel_ref, acc_ref, yaw_ref] = px4_trajectory(t)
% The path the drone is asked to fly (what a ROS 2 node would send PX4 in
% offboard mode): take off to 2 m and hover, then fly a 2 m radius circle.
% Returns position, velocity and acceleration setpoints (world frame, z up).

h  = 2.0;            % flying height [m]
r  = 2.0;            % circle radius [m]
Tc = 12;             % time for one lap [s]  (about 1 m/s)
t0 = 5;              % start the circle after 5 s of hover

yaw_ref = 0;

if t < t0
    pos_ref = [0; 0; h];
    vel_ref = [0; 0; 0];
    acc_ref = [0; 0; 0];
else
    w  = 2*pi/Tc;
    tt = t - t0;
    % circle centred at (-r, 0) so it starts where the drone is hovering
    pos_ref = [-r + r*cos(w*tt);  r*sin(w*tt);       h];
    vel_ref = [-r*w*sin(w*tt);    r*w*cos(w*tt);     0];
    acc_ref = [-r*w^2*cos(w*tt); -r*w^2*sin(w*tt);   0];
end
end
