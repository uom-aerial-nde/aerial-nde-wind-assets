# Autonomous Aerial NDE of Wind Generation Assets

## Week 5 Supervisor Meeting — Minutes

Date: 29/10/2026 Supervisors: Dr Fletcher, Dr Tang

**1. Admin**

- Next week is reading week. Meeting is happening, but the plan is to go through the Grant Pack draft at next Thursday’s meeting so the supervisors can look at it before submission.

- Supervisors are happy to arrange extra meetings outside the usual slot if needed (e.g. to go through the control work).

**2. Thermal sensor**

- The Lepton 3.5 is the best option. Other sensors were either out of stock or did not have the resolution / frame rate needed for good thermal imaging.

- The PureThermal breakout board simplifies a lot of the coding. Plan is to buy the Lepton 3.5 + PureThermal and start testing. It is within budget: drones look like about £300 each, leaving about £600 spare.

- A heater cannot go on the small drones, so heating has to be done off the drone. Heat from surface-level cracks dissipates in roughly 10–20 seconds (deeper cracks take longer), so the drone must reach the heated area quickly.

- Proposed demo: heat the object off-drone, then fly the drone close past it as a proof of concept, since indoor space is limited. Supervisors had no problem with this.

**3. Control model (Dr Tang)**

- The kinematics group showed the current MATLAB model: it hovers and holds position, controlling height (z) only with a PD controller. Blocks for roll, pitch and yaw control can be added.

- Dr Tang asked for x, y, z and attitude (orientation) to be controlled, and to see the position error and the attitude error both converging to zero. The attitude error should converge much faster than the position error.

- The desired thrust should not be a step input: it must come from the outer loop. Follow the control structure in her paper: the outer loop gives the desired thrust and desired attitude to the inner attitude controller.

- A quadrotor can only push along its body z-axis, so to move in x or y it has to change attitude. The outer loop works out the desired force direction, and from that the desired attitude and thrust.

- Check the rotation matrix direction: the one shown maps inertial to body, but it should be body to inertial.

- Write down the equations of the model and of the controller so she can check them, and so we can check we have implemented what we intended.

- She needs to see that we understand the model and control, not just that it runs. She will not let us fly until she and we are confident.

- Later, a controller other than PD will be designed (needed for cooperative control).

**4. Drone selection**

- The drone lab suggested around 3.5 inch drones. We are hoping for up to 5 inch, as smaller drones only fly for about 3–9 minutes. Payload is not given on most spec sheets.

- The drone lab’s new restrictions are not finalised (weight limit, size limit or both). Dr Fletcher will chase them by email. 5 inch may be acceptable with a cage.

- Drones under 250 g have fewer regulations for flying outside.

- Dr Tang: decide what to buy only after understanding the control architecture, i.e. what the control input is, what can be edited or changed, and that the drone matches the model.

- Drones that come with cameras are mainly for racing / FPV. We need a camera that can stream to a computer in real time for image analysis and feature-based control. A Raspberry Pi with a camera is supported.

**5. Image processing and navigation**

- Kunjan and Lidia looked at AprilTags for the starting position and for finding the blade. Simple equations give the distance to the blade from the tag; the control team then keeps the drone stable at that distance.

- Machine learning and edge detection were looked at but seem harder to implement. Edge detection does not need machine learning: there are simpler algorithms worth looking at.

**6. Grant Pack**

- Each team will mark another group’s supervisor Grant Pack.

- It is fine to say in the Grant Pack that we have chosen a thermal sensor. Lay out the decision process: what decision we are making and how we made it.

**Action Items**

| Owner | Action | Status |
|---|---|---|
| Kinematics group | Extend the MATLAB model to control x, y, z and attitude, with the outer loop providing desired thrust and attitude (not a step input) |  |
| Kinematics group | Plot position error and attitude error converging, to show Dr Tang |  |
| Kinematics group | Write down the model and controller equations for Dr Tang to check |  |
| Kinematics group | Check the rotation matrix direction (body to inertial) |  |
| Kinematics group | Read the control structure section of Dr Tang’s paper |  |
| Thermal sensing | Order the Lepton 3.5 + PureThermal board and start testing |  |
| Dr Fletcher | Chase the drone lab about the new size / weight restrictions |  |
| Drone selection | Hold off buying until the control architecture is understood; check the drone’s camera can stream to a computer |  |
| Kunjan, Lidia | Continue AprilTag distance work; look at simpler edge detection algorithms |  |
| All | Have the Grant Pack draft ready to go through at next Thursday’s meeting |  |
