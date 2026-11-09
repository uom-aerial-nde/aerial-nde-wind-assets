# Control

Our own controller design. PX4 handles the inner loop (attitude and body rates) on the
real drone. We design the outer loop: position and velocity in, desired acceleration out,
as Dr Tang asked.

- `outer_loop/`: outer-loop designs (start with PID, then compare with PX4's on the same path).

Test new designs first in `simulation/matlab/px4_cascade` by replacing its outer loop.
