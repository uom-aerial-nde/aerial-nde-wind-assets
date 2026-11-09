# PX4-style controller simulation

A MATLAB copy of PX4's cascaded multicopter controller, in front of the teammate's
unchanged physics (`../altitude_model`). Not official PX4 code.

Cascade: position P -> velocity PID -> acceleration -> thrust + tilt (rotation matrix)
-> attitude P -> body-rate PID -> torques -> mixer -> motors. Runs at 1 kHz.

| File | What it does |
|---|---|
| `px4_init.m` | Runs `uav_init` and adds PX4 gains (labelled with PX4 parameter names) |
| `px4_controller.m` | The controller |
| `px4_trajectory.m` | The path: take off to 2 m, hover, then a 2 m circle. **Edit this to fly other paths.** |
| `run_px4_sim.m` | Plain MATLAB version |
| `run_px4_simulink.m` | Simulink version (builds the model the first time) |
| `build_px4_model.m` | Builds `px4_model.slx` from scratch |
| `px4_plots.m` | Four result plots and printed tracking error |

Result (circle test): 6.4 cm RMS tracking error after t = 10 s, 10.3 deg max tilt,
motors 3.1 to 6.2 N.

To try our own outer loop: replace the OUTER LOOP section of `px4_controller.m`
so it outputs `acc_sp` (desired acceleration). Everything below stays as PX4.
