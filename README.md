# Autonomous Aerial NDE of Wind Generation Assets

MEng Team Project (EEEN40330), University of Manchester, 2026/27.
Supervisors: Dr Adam Fletcher and Dr Zhiqi Tang.

Two autonomous drones that find hidden damage inside wind turbine blade material using
thermal cameras, flying close to the structure without GPS. In the drone lab, a lamp
simulates the sun warming the blade so tests can be repeated.

## Team

| Initials | Name | Role |
|---|---|---|
| LL | Lidia Lonergan | Project Manager |
| DE | David Edu | Secretary |
| CB | Calum Bristow | Auditor |
| KJ | Kunjan Janamatti | Team member |
| MM | Michael Mcdonagh | Team member |
| IBR | Irene Barreiro Redondo | Team member |
| SB | Stanley Briers | Team member |

## Where everything is

| Folder | What goes in it | Owners |
|---|---|---|
| `docs/` | Requirements, Grant Pack notes, links to minutes and research | All |
| `simulation/matlab/` | MATLAB / Simulink drone models | Control team |
| `simulation/gazebo/` | PX4 software-in-the-loop (Gazebo) setup, later | Control team |
| `control/` | Our own outer-loop controller (acceleration setpoints) | Control team |
| `navigation/` | GPS-denied positioning, obstacle avoidance, path planning | Control team |
| `ros2_ws/` | ROS 2 workspace: offboard node that talks to PX4 | Control team |
| `sensing/thermal/` | Thermal camera (Lepton 3.5 + PureThermal 3) capture code | Sensors team |
| `sensing/image_processing/` | AprilTags, defect detection, two-drone cross-checking | Sensors team |
| `hardware/` | Parts list, wiring, drone and flight controller setup | All |
| `testing/` | Test plans and test logs | All |
| `results/` | Saved plots, figures and data used in reports | All |

Control team: IBR (lead), KJ, SB, DE. Sensors team: CB, MM, LL, DE.

## Quick start (MATLAB)

```matlab
% Teammate's altitude-only model
cd simulation/matlab/altitude_model
uav_init
open_system('bad_model')      % then press Run

% PX4-style controller flying a 2 m circle
cd ../px4_cascade
run_px4_sim                   % plain MATLAB version
run_px4_simulink              % Simulink version (builds px4_model.slx first time)
```

Note: `bad_model.slx` was saved in MATLAB R2026a. Use MATLAB Online or R2026a to open it.

## Documents that live elsewhere

Meeting minutes, the Grant Pack and research documents are kept in the team OneDrive
(Lidia's "Team 2 Personal Folder"). This repo is for code, models and technical files.
See `docs/README.md` for what is where.

See `CONTRIBUTING.md` for how to add work to this repo.
