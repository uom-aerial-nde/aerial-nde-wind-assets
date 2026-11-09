# Altitude model (teammate's original)

Height-only quadrotor model. The roll, pitch and yaw torques are fixed at zero.

| File | What it does |
|---|---|
| `uav_init.m` | Drone parameters (mass, inertia, arm length, motor limits), mixer matrix, gains. **Run first.** |
| `quad_dynamics.m` | The physics: rotation matrix, translation and rotation equations. |
| `bad_model.slx` | Simulink model: PD altitude controller -> mixer -> motor lag -> rigid body. Saved in R2026a. |

How to run: `uav_init`, then `open_system('bad_model')` and press Run. Open the scope "Real - desired z".

Results: with Kp = 1, Kd = 1 the drone overshoots to 1.25 m and is not settled at 10 s.
With Kp = 13.5, Kd = 7.2 (set after `uav_init`) it reaches 1 m in about 1.5 s with almost no overshoot.
Parameters are placeholders and need replacing with the real drone's values.
