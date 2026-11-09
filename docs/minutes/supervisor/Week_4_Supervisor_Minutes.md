# Autonomous Aerial NDE of Wind Generation Assets

## Week 4 Supervisor Meeting — Minutes

Date: \[date\] Supervisors: Dr Fletcher, Dr Tang

**1. Drone lab induction feedback**

- The drone lab does not want us to use last year’s drone as it is too big. New rule: small drones only (around 3–3.5 inch propellers). Two large drones would be too dangerous in the space.

- They showed us a drone of about 3 inches. A thermal camera and a regular camera should fit with the battery, and the Raspberry Pi companion computer can be off-board.

- A supervisor must be present for the first few flights.

- Dr Fletcher will email the drone lab to confirm their requirements and ask if flying the existing drone tethered (like last year) would be acceptable, since it has already been bought.

- For now we assume we have to stick to the small drone rule and prepare for two small drones. This can be justified as a proof of concept with the scope restricted by the lab requirements.

**2. Thermography research (David)**

- The thermal camera sees infrared (heat). Defects like air gaps conduct heat about 10 times worse than the blade, which is how they show up.

- Industry mostly uses passive thermography (inspect in the day, come back at night), which we can’t do in a technical demo, so we would likely need active heating. Cranfield have done this using 250 W lamps.

- Dr Fletcher: we could simulate passive heating with something like a heat gun.

- The suggested sensor is light (good for small drones): 160 x 120 pixels (~19,000 temperature readings) and a 57 degree field of view, so it can work 0.5–2 m from the blade. At 0.5 m each pixel is about 3.4 mm.

- Dr Fletcher: we may not need a radiometric sensor if we only care about temperature differences, worth considering. Image processing toolboxes can be used more or less off the shelf.

- On-drone heating would add roughly 1 kg (based on Cranfield) and needs longer heating, more battery and affects the flight dynamics. Off-drone heating adds almost no weight. Dr Fletcher thought off-drone is the clear choice, Dr Tang said it depends on what works.

- One test needs roughly 3 minutes of flight (document on OneDrive). With off-drone heating the drone needs to reach the heated area in about 10 seconds or the readings fade.

- Need a safe heating method. Supervisors noted holding a stable distance is much easier for thermal than for microwave or contact sensors.

**3. Kinematic model and control (Dr Tang)**

- Michael asked whether we need to build our own kinematic model or use the one from PX4.

- Dr Tang: a small drone should be similar to the model in her paper. Normally the inner loop (attitude) is fast enough that we only design the outer loop (translational position and velocity).

- PX4’s normal mode takes a position and tracks it, which is basically manual. For autonomous navigation, cooperation between drones and avoiding obstacles, we should design the feedback control ourselves with acceleration as the control input. This is the main thing to do for the project.

- We need to read her paper (focusing on the quadrotor model), understand the control input and output, and simulate it.

- Before buying drones, check the drone architecture: whether the outer loop can be modified and what commands can be sent from a computer or onboard computer.

- Next week: present our understanding of the model, the control, and what commands are sent to the drone, so she can check it makes sense.

**4. Vision-based navigation (IBVS)**

- Lidia’s idea: a gradient descent approach that matches the camera image to a target image taken beforehand, reducing the error to move the drone. Dr Fletcher: this can be stacked (one for position, one for velocity).

- Dr Tang: in her window paper she used spherical image features from markers (projecting points as unit vectors), which avoids worrying about the camera intrinsic matrix. Corner points of a shape can be used as features.

- Recognising the point of interest (e.g. machine learning) and controlling the drone to it are two separate problems: first recognise, then use it for control.

- Dr Fletcher: look at the OpenMV and OpenCV toolboxes. Tracking QR codes / AprilTags is standard.

- Dr Fletcher is giving an introductory lecture on inverse problems on Thursday 5 November (reading week), optional. He will ask if it can be recorded and can share the slides.

**5. Requirements capture**

- The drone lab suggested sitting down with the supervisors to capture requirements. Draft spreadsheet is on the OneDrive (assumptions, constraints, sources, requirements for each subsystem, must/may).

- GPS-denied: required, but can be relaxed at the start by using lab position data, moving to onboard sensors later.

- Must keep a safe distance and avoid obstacles in the environment (obstacles can be included in the demo), and must not collide with the second drone. A geometric formation is not essential.

- Must keep a desired distance from the object to observe it and follow a controlled path (e.g. a raster pattern) over a sub-region. Pre-programmed is fine.

- Identifying the object: QR codes or AprilTags on the object are acceptable as the easiest way. More advanced methods are optional.

- Communication: streaming images or sensor data back from the drone would be nice. Communication between drones is not a requirement, it is a means to an end. Running everything on a computer and sending commands to the drones is acceptable.

- Use "object under test" rather than "blade", as another group has the blade.

- Do not name the technique in the requirements. The requirement is to identify suitable inspection techniques to detect defects, then deploy one.

- The drone size limit is a constraint from the drone lab rules, not a requirement.

- Final demo location to be confirmed. Last year’s was not in the drone lab.

- Dr Tang’s minimum demonstration: fly to the area of interest, hover stably at the desired distance and take the measurement, ideally with trajectory tracking.

**6. How the project is marked**

- It is not a tick-box list. Marks also come from how well we present and communicate what we have done, the report, the analysis, and peer scores.

- Attempting difficult things and explaining why they didn’t work and what we tried can still get a very good mark. It is assessed more like professional engineering work.

- Supervisors advised following the work step by step, starting with understanding the model.

**7. Simulation and software**

- Start with MATLAB/Simulink: a block for the drone with its inputs and outputs, a controller and feedback, possibly a simulated camera. Then move to ROS.

- Isaac Sim is fine to look into if we want.

- Laptops: Dr Fletcher will ask Dr Murilo whether we can keep the laptops for the second semester. He may have a spare laptop, or we could speak to IT about Linux on one of the computers.

**8. Sensors to buy**

- Dr Fletcher has sent links. The thermal sensor module is about £130 and can be interfaced over SPI.

- Many drone kits come with cameras.

- Dr Fletcher showed an OpenMV camera module: it runs MicroPython and can do image processing on the module itself. Install the OpenMV IDE and try it.

**Action Items**

| Owner | Action | Status |
|---|---|---|
| Dr Fletcher | Email the drone lab to confirm their requirements and whether a tethered flight with the existing drone is acceptable |  |
| Dr Fletcher | Ask if the inverse problems lecture (Thu 5 Nov) can be recorded and send the details/slides |  |
| Dr Fletcher | Ask Dr Murilo whether we can keep the laptops for the second semester |  |
| Team | Read Dr Tang’s paper, focusing on the quadrotor model, and start a simple simulation in MATLAB/Simulink |  |
| Team | Present our understanding of the model, the control inputs/outputs and the commands sent to the drone at next week’s meeting |  |
| Team | Check the drone architecture (outer loop access, command interface) before buying |  |
| Team | Update the requirements (must/may, constraints, "object under test", technique-neutral wording) |  |
| Team | Try the OpenMV IDE and look at OpenCV |  |
| Team | Decide whether a radiometric thermal sensor is needed |  |
