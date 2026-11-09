# ROS 2 workspace

Code that runs on the companion computer / ground station and sends setpoints to PX4
in offboard mode.

Safety: PX4 leaves offboard mode if it stops receiving setpoints at the expected rate
(heartbeat), so the node must keep publishing.

Build: `cd ros2_ws && colcon build`. Packages go in `src/`.
