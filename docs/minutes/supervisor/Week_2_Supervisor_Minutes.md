# Autonomous Aerial NDE of Wind Generation Assets

## Week 2 Supervisor Meeting — Minutes

**Date:** \[08/10/2026\] **Supervisors:** Dr Fletcher, Dr Tang

*(Week 2 meeting.)*

**1. Inspection target, and Orientation**

- Concept discussed: set up a coordinate system along the structure (e.g. X = 0 where the shape starts, 100 where it finishes), with drones sharing position information so they can maintain formation and divide the inspection.

- Edge/feature detection is easier where there is strong contrast (e.g. an object standing out against its background); detection between two close, similar surfaces is harder.

- Question: what should our test object be? Last year used a flat sample (a sheet with rebar underneath). Dr Tang: from the robotics side, simplify it to any detectable feature (e.g. a coloured box/marker) that represents the defect you need to track, which can later be replaced with a real feature or vision target.

- Build on this with relative localisation: estimate own position relative to the target feature and to the neighbouring drone, which can also be observing from the other side, so the drones keep formation.

- Orientation matters: a vertical structure means side-facing sensors; a horizontal one means sensors can face down. Camera range is not the main issue (a tilting camera could help), but eddy current needs ~15 mm stand-off, which is very hard on a vertical structure, especially near moving blades.

**2. What are we inspecting? Defects & failure mechanisms**

- Dr Fletcher asked what research we have done on defects/failure mechanisms in offshore turbines. Team: the steel transition piece/foundation is the most common critical failure point; the tower was our likely starting point.

- Dr Fletcher: there is strong interest in blades because they cannot be recycled (e.g. blade 'graveyards' in the US where they are buried), so extending blade life is high value. The main blade failure is cracking/damage at the leading edge.

- This is one high-value area, not necessarily the only or the right one; it is up to us to decide.

**3. Test samples & sourcing**

- If we go down the blade route, Dr Fletcher can ask people he knows about samples, and will also speak to his contacts/mentor.

- Worth considering surrogates/analogues: last year rebar was available, but the team chose to manufacture their own plastic sample with defects inside as a better demonstration. We might be able to get composite or carbon-fibre material and introduce artificial defects.

- Think about what can be achieved in the demo space; a full blade will not fit in the lab.

- We are welcome to email companies that inspect or decommission wind farms, stating a research interest, to ask if they can supply anything (e.g. offcuts from already-damaged parts).

**4. Sensing techniques**

- Eddy current on composites is already challenging, and detecting sub-surface defects in composites with eddy current is very challenging, so that would not be where to start.

- Look for where the really high-value problems are but where there is scope for this kind of work, e.g. rebar or degradation of foundation bolts.

- Composites are less conductive than steel, but high-frequency eddy-current measurements are possible. Other options: thermography, optical systems or infrared.

**5. Multi-drone cooperation for inspection**

- Drones can still cooperate even if they use different sensors, e.g. a vision drone informing the other drone's position to improve its position control, and vice versa.

- Different inspection techniques can be split across drones: for magnetic inspection, one drone emits a field and another measures it remotely (similar to ACPD — alternating current potential drop — where a field is injected at one point and measured further along; a crack disturbs the field).

- Thermography: one system does the heating, the other the infrared/temperature measurement. Microwave: one drone transmits, the other receives (backscatter-type approaches).

**6. Combining sensors**

- Question: can one sensor flag a likely problem area (e.g. a thermal survey of a large area) and a second, more precise sensor (e.g. eddy current) then check it? Yes, definitely, and this is a good idea.

- Dr Fletcher suggested thinking of it the other way round if anything: eddy-current/magnetic fields fill space and give the bigger picture, whereas microwave is very focused, so they could be used cooperatively that way.

- Thermal sensing does not have to be active (heater + camera); passive systems also exist.

- Suggested we chat to the workshop technicians downstairs: when reworking PCBs they pass a large current through the board and look for hotspots with thermal cameras, which shows how these work in practice.

**7. Eddy-current arrays**

- Concern raised: holding the drone stable while moving 1–2 cm at a time is hard, so we asked about using multiple eddy-current probes to reduce how often the drone has to move.

- Dr Fletcher was designing an array before changing jobs, but it would be too big for this project. Wuliang Yin has array systems that might be borrowed (a professional, boxed-up system, but possibly usable for the parts we are most interested in).

- Multi-probe arrays are a valid and very current approach and give much better coverage. Dr Fletcher to chase this week.

**8. Drone stability, altitude & localisation**

- Hovering stability: challenging but possible. Last year's team focused more on sensors; they needed more time to tune the control-system parameters. With control-focused team members we should get further. Dr Fletcher to look for last year's flight videos.

- Last year the barometer (pressure-based altimeter) gave false readings indoors (advice from the aerospace drone specialists, Kieran), so they switched to Vicon motion capture.

- Dr Tang: nothing is forbidden. Vicon can be used for testing, and camera sensing can be simulated from Vicon positions (generate image features from known positions), then swapped for a real camera once it works, a step-by-step approach.

- Altitude alternatives: a downward-facing camera with a pattern (e.g. dots) on the floor, as commercial drones do; range sensors are also an option. A wide range of near off-the-shelf options will come up in research.

- Suggested first step: assume own localisation is provided (GPS/Vicon) and focus on relative localisation to the crack/target and to the neighbouring drone, maintaining a desired stand-off distance and avoiding obstacles. Once that works, remove the assumption.

**9. Communication between drones**

- Inter-drone communication is secondary, not the main focus. If we need extra hardware, research what is available and make a case for buying it.

- For experiments, Wi-Fi is fine; algorithms can initially run on a laptop and later move on board.

- Start from simple things and build up; do not add everything at the beginning.

**10. Test drone, budget & procurement**

- Recommended to start testing on last year's drone before buying more.

- Orders are processed quickly by the school; lead time depends on the supplier (last year's UK supplier took ~3 days).

- Last year's drone cost ~£500 in total: frame (with blades and motors), ESC, a separately bought flight controller, batteries and other parts. With a budget of ~£1,700, we could use it as a test drone and still afford two more.

- Buying parts separately means a breakage only needs a part replaced, not a whole drone.

- Advice: try and grow out rather than throw everything in at once. Read last year's report, understand the issues they had with their control system, and use that to guide where we go next.

**11. Drone nest access & risk assessment**

- Dr Fletcher has messaged Callum, the technician who runs the drone nest downstairs (team copied in). He will help us get organised; the booking process is not yet known.

- A separate risk assessment for the drone nest will likely be needed, in addition to the project-room one, and there may be training. This can be started before we have the drone.

- Option to go over after the meeting to collect the drone and keep it in the meantime.

- Risk assessment review: based on last year's template. Add project-specific hazards: spinning propellers/motors; desk work (repetitive strain injury, eye strain from long screen time); manual handling of equipment (e.g. sandbags used to tether the drone, which could be dropped on toes; moving kit on trolleys; lifting limits up to 25 kg).

- It is a live document; add new hazards as they come up. Needs submitting by tomorrow. The image release form and the accompanying Canvas quiz also need completing.

**12. Report, commercial aspects & admin**

- The main part of the project is proof of concept. Dr Fletcher does not think commercial aspects are assessed as such (to double-check). They can be included, but with a page limit they may be a waste of space. Team to check the handbook.

- Auditor and secretary training days are listed as week commencing the 12th, but no details yet. Ask the unit lead (at the workshop after this meeting).

**13. Next meeting**

- Could use the team project room instead once we have access, which we should have by then. – **we now have access to our Meng room**

**Action Items**

| Owner | Action | Status |
|---|---|---|
| Dr Fletcher | Ask contacts/mentor about blade or composite test samples |  |
| Dr Fletcher | Chase borrowing an eddy-current array system (Wuliang Yin) this week |  |
| Dr Fletcher | Find videos of last year's drone flights |  |
| Dr Fletcher | Double-check whether commercial aspects are assessed |  |
| Team | Research defects/failure mechanisms and choose target (blade leading edge vs transition piece/foundation) |  |
| Team | Research surrogate test samples (composite/carbon fibre with artificial defects) |  |
| Team | Email wind farm inspection/decommissioning companies about samples |  |
| Team | Read last year's report and identify their control-system issues |  |
| Team | Start testing on last year's drone; plan parts to buy separately within budget |  |
| Team | Research altitude/localisation options (downward camera + floor pattern, range sensors); use a simple marker as stand-in target |  |
| Team | Speak to workshop technicians about thermal cameras |  |
| Team | Contact Callum re drone-nest booking, training and drone-nest risk assessment |  |
| Team | Update project risk assessment with project-specific hazards and submit (by tomorrow) | Done |
| Team | Complete image release form and Canvas quiz |  |
| Team | Check handbook on commercial aspects / page limit |  |
| Team | Ask unit lead about auditor & secretary training dates |  |
| Team | Book a room (or use project room) for next meeting | Solved |
