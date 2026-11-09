# Autonomous Aerial NDE of Wind Generation Assets

## Week 6 Supervisor Meeting — Minutes

Date: 05/11/2026 Supervisors: Dr Fletcher, Dr Tang

**1. Gantt chart (Kunjan)**

- Good to include all official deadlines and holidays: they are hard stops that drive the plan.

- Present it on A3 and make sure it is readable at 100% zoom.

- Balance detail and the big picture: there are a lot of tasks. Group them into higher-level tasks, or have a high-level chart plus a detailed version in the appendix.

- Include testing tasks: they show we expect things not to go to plan and have feedback built in.

- Identify the critical path.

**2. Public description of scope and aim (Lidia)**

- Pitched well for a non-expert reader; it is at the word limit.

- Could be more specific on the aims, e.g. what counts as success or failure when evaluating an NDT method.

- Not necessary to explain further why it needs to be autonomous.

- The scope says “decide a sensor” while the Grant Pack questions name the thermal sensor: fine, as long as the work already done is pointed out somewhere (e.g. Q3).

**3. Q1 Project idea and innovation (David)**

- David noted Q1 needs updating: the demo is a proof of concept with heating off the drone, not active heating on the drone. The innovation is combining thermography, drones and autonomy; the two-drone approach (from Calum) can reduce reflections and false positives.

- The technical specification was in a separate document. Dr Fletcher: keep it high level and don’t tie the team to anything too specific at this stage (e.g. “must be able to avoid obstacles”).

- Answer covers the marking points; turn the bullet points into more continuous prose as final polish. Currently at about 500 words.

**4. Risk register (Stan)**

- 31 risks across technical, commercial, managerial, supply chain, health and safety and regulatory categories, with causes, impacts, mitigation and status.

- Usually score each risk before and after mitigation.

- Avoid words like “meaningless”; use “insufficient” or “unusable data”.

- Payload risk (Dr Tang): if the payload exceeds what the drone can carry, mitigate by making the sensor external infrastructure, or flying with a “virtual” sensor while still keeping the stand-off distance and doing the task. Reword the impact as “redesign”.

- Check Canvas for an official risk register template. Using “we” in the writing is fine.

**5. Q2 Market, impact and benefits (Calum)**

- Good: it avoids overstating how valuable the project is.

- Dollar figures from sources are fine; don’t convert them, as a conversion is only valid on the day it is done.

- Could say more on the environmental side, e.g. blades that cannot be recycled end up in landfill.

**6. Q3 Delivering the project**

- Use this section to state work already completed (e.g. sensor chosen).

- Add a sentence explaining the initials used.

- No need to mention individual sessions: that is procedural. Stay focused on project deliverables.

- Dr Tang: add the control system work. Understand the navigation and control first, then in December (or sooner) find a suitable navigation and control algorithm before simulating.

**7. Drone selection and control architecture**

- The team has chosen a 5 inch drone after talking to the drone lab: there are power and speed limits, and payload is not listed, so it will need testing. Its flight controller will be replaced with a small Holybro one compatible with PX4.

- Dr Tang: before buying, verify the control architecture: what the control input is, which parts we can edit (inner loop, outer loop or both) and what the firmware allows. Some drones only allow outer-loop changes.

- Dr Fletcher: the Pixhawk / PX4 firmware is open source (based on an STM microcontroller), so the C code can be edited and reflashed.

- Dr Tang: in the usual hierarchical structure, focus on the outer loop with acceleration as the input; the inner loop only needs changing for aggressive flight, but being able to edit it is better.

**8. System architecture (Michael)**

- Roughly the right level. Don’t add more boxes, but add a little more information in each (e.g. supply voltages, 5 V or 3.3 V).

- Show communication paths and protocols (e.g. SPI to the sensor, Wi-Fi to the ground station) and distinguish types of signal.

- Integration is where most problems happen, so show how the blocks talk to each other and the boundaries between them.

- Navigation processing will be done on the ground laptop, with data sent from the drone.

- Dr Tang: navigation is a proper problem. Sending set positions to PX4 is trivial; the contribution should be reactive navigation in an unknown, GPS-denied environment (e.g. avoiding an obstacle that appears), with navigation and estimation coupled. Add navigation to the architecture.

**9. Software flow chart and budget**

- Think about the message the reader should take away: show the major components, how they interact and how the team will make sure they can talk to each other, not every function.

- Budget (Calum) to be reviewed next week.

- Dr Fletcher’s inverse problems lecture was recorded and can be shared.

**Action Items**

| Owner | Action | Status |
|---|---|---|
| Kunjan | Gantt chart: group tasks, add testing, identify the critical path, make it readable on A3 |  |
| Lidia | Public description: make the aims more specific (success / failure criteria) |  |
| David | Q1: update for off-drone heating and two drones, write as continuous prose, keep the specification high level |  |
| Stan | Risk register: score before and after mitigation, reword “meaningless”, update payload mitigation, check Canvas for a template |  |
| Calum | Q2: add environmental benefits; prepare budget for next week |  |
|  | Q3: add completed work, control system work and a sentence on initials |  |
| Control group | Verify the drone / flight controller control architecture (editable loops, inputs) before buying |  |
| Control group | Research a suitable reactive navigation and control algorithm |  |
| Michael | System architecture: add power details, communication protocols, signal types and navigation |  |
|  | Software flow chart: show major components and how they interact |  |
