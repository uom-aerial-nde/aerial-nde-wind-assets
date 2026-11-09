# Autonomous Aerial NDE of Wind Generation Assets

## Week 3 Supervisor Meeting — Minutes

Date: \[15/10/2026\] Supervisors: Dr Fletcher, Dr Tang

*(Week 3 meeting.)*

**1. Eddy current sensors — follow-up from last week**

- A professor has a pulsed system with an array of sensors; it is enclosed, so hard to extract just the parts we need. He may have spares we can couple something together from.

- may have spares with the differential eddy-current sensor, so we could get a signal and start where last year's team finished (they were doing differential).

- Suggested approach: start simpler and work up towards the array system rather than aiming for it immediately.

- Building and designing Eddy current is a good use of our skills but may not be the best use of our time if the drone contact problem is too hard.

**2. Welds as inspection target**

- Welds are not ideal for eddy current because the welding heat deforms the metal and gives magnetic noise.

- However, EC inspection of welded joints is semi-routine in industry — there are plenty of commercial systems and a long history, so it is feasible.

- If we go for welds, we need to decide: how we will inspect, what size of defect we are after, and the strategy that follows from that.

**3. ACFM (Alternating Current Field Measurement)**

- Lydia presented this: in industry use on wind turbines, injects a current into the structure and reads the field.

- Better than conventional EC for overall / larger cracks and welds; works through paint and coatings; can estimate crack length and depth via mathematical modelling.

- From the slide shown, ACFM looks very similar to EC — may just use a GMR or TMR sensor instead of a coil. If so, it is probably feasible to build.

- Dr Fletcher will look at it and come back to us.

**4. Microwave sensors**

- Another team is doing microwave sensing for blades; if they get a blade sample, we may be able to share.

- FMCW microwave radar: works at around 10 cm standoff and is less sensitive to tilt than EC. Someone on the team has one at home.

- Depends on what we want to inspect — microwave does not penetrate the steel of the tower but is good for blades.

- Dr Tang flagged this as potentially novel for NDT: "we've not tried that for any NDT applications — that might be interesting."

**5. Ultrasonic sensors**

- Contact-based NDT, suited to the steel transition piece where there are a lot of cracks and steel loss (and internal corrosion that current methods can't detect).

- Already used on drones in industry for tanks, piping and offshore infrastructure. Strathclyde did a drone UT system using Vicon for control.

- Problems: drone must stay in contact; requires a couplant gel; needs enough force on the piece. Strathclyde used a rubber interface.

- Dr Fletcher has an ultrasound system but it would not be suitable for this.

- If no real turbine piece is available, we can mimic test samples ourselves. He has already asked contacts and will approach Omentum (consultancy).

**6. Thermal cameras**

- Good for composite materials and widely used in industry for wind turbine blades.

- Works by checking change in thermal conductivity. Active heating with a laser is out of scope for us; passive (checking at different times as the sun hits the blades) is realistic.

- Does not need close standoff — plays to drone strengths.

- Downside: very expensive. Rough estimate ~£500 to build one; a commercial unit is far more.

- A good option if we go blade-focused.

**7. RGB cameras**

- Good for surface cracks and erosion. Standard approaches: edge detection, feature-contrast methods, or machine-learning algorithms.

- Prone to lighting changes but mature in industry.

- Team agreed cameras should be used for navigation and large-feature spotting, not fine defect detection.

**8. Sensor comparison and direction**

- Cameras: navigation and large defects only, not fine defect detection.

- Thermal: expensive, blade focused.

- Eddy current: good sensing but the control problem (standoff / contact) is the real issue.

- Microwave: depends on blade vs tower focus.

- Two options on the table — leaning towards microwave, but final choice depends on what hardware the supervisors can provide. We plan can request both microwave and EC and test them.

- Dr fletcher also added in we should not rule out IR sensors so we are doing research on it

**9. Multi-drone concept and area definition**

- Drone needs to find the object (e.g. plate or blade section) and define a boundary around it, giving a bounded coordinate system so we are not scanning the whole room.

- Parent / child formation: one overview drone, one close-inspection drone. Identification stickers on the target could help the drone recognise what it is looking at and run the inspection routine.

- Because we buy the same drone kit, we can modify the flight controller STM to control the dynamics.

- A larger overview drone with a camera would spot large defects; smaller drone handles close inspection.

- First step: knowing there is a defect and roughly where — categorising it is a later step.

**10. Drone platform, weight and modelling**

- Drone payload capacity is around 4 kg, so sensor weight is not expected to be an issue.

- Important: do not change the centre of mass. If we add weight, we need to consider where it goes and remodel the dynamics / tune the controller.

- Flight controller is an STM; the code is open to us, so we can modify it.

- Buying the same drone kit was a deliberate choice: cheaper and we don't need the extra 1 kg payload the alternative kit offered.

**11. GPS-denied clarification**

- GPS cannot give correct position information near structures — buildings and other turbines block / distort the signal, and precision is poor.

- The project requires local onboard sensors (laser, microwave, camera) for localisation.

- Vicon in the drone lab is fine to use as part of the setup — it keeps us within the spirit of the brief. Dr Tang: "that's fine, within the spirit of the thing."

**12. Contact approach and compliance**

- If the sensor needs to be within millimetres of the surface, pure hover control is not feasible with our drone — you would need a manipulator.

- Simplest fix: a sprung / compliant arm or bumper so the drone keeps slightly away while the sensor stays in contact. Last year's team used 3D-printed plastic bellows / posts.

- Impedance control on contact is possible (similar to a haptic glove) but adds significant modelling complexity.

- Important for safety: controlled contact only. Intentional high-speed collisions are off the table — the drone could be destroyed.

- Range sensor between drone and surface would help the controller switch between non-contact and contact modes.

**13. Virtual demonstration as a staged approach**

- Dr Tang suggested a virtual-first approach: build the drone, mount a dummy weight for the sensor, prove the drone can hold position next to a virtual surface, and feed in pre-recorded or simulated sensor data.

- This decouples the sensor problem from the flight-control problem and still counts as a legitimate demonstration.

- If the real-sensor integration works later, that is a bonus; if not, the drone platform and control are still shown.

- Advice: go step by step. First a virtual surface, then a real surface at relaxed tolerance, then just maybe the full integrated system.

**14. Admin and next steps**

- Drone-nest induction booked with Callum for Tuesday.

- UAV society friend (ex-president) coming tomorrow to give the team a walk-through of ArduPilot software.

- Dr Tang will look for relevant papers on contact / impedance control for drones.

**Action Items**

| **Owner** | **Action** | **Status** |
|---|---|---|
| Dr Fletcher | Look into ACFM feasibility (one slide suggests it is similar enough to eddy current to be buildable) |  |
| Team | Confirm whether the other team (Tony's) sharing a blade sample would clash with our demo day |  |
| Team | Look at papers on drone contact / impedance control (last year's Strathclyde-style approach) |  |
| Team | Decide between contact differential EC and non-contact microwave at next meeting (including IR sensors now) |  |
| Team | Research the IR AND FMCW microwave radar sensor (10 cm standoff, less tilt-sensitive) for NDT use |  |
| Team | Sort GRP samples from the lab (Dr Fletcher confirmed availability) and request a steel offcut from workshop |  |
| Team | Build out the drone control plan: boundary definition, parent/child formation, use of identification stickers |  |
| Team | Consider spring-loaded / compliant mounting (3D-printed bellows like last year) for contact-based sensors |  |
| Team | Attend drone-nest induction with Callum (booked for Wednesday) |  |
| Team | Session with UAV friend on Friday on ArduPilot software |  |
| Team | Plan a step-by-step build |  |
