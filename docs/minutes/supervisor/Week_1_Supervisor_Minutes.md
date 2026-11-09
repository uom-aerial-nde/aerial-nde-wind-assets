# Autonomous Aerial NDE of Wind Generation Assets

## Week 1 Supervisor Meeting — Minutes

**Date:** \[01/10/2026\] **Supervisors:** Dr Fletcher, Dr Tang

*(Week 1 meeting.)*

**1. Power, battery life & the demo**

- Drone battery life is inherently limited (~10–20 min), so a full-duration real-world flight is not the goal.

- For the demo we only need to show proof of concept on a limited battery; a real system would need far more power for the required endurance.

- Acknowledge the limitation in the report rather than try to solve it , e.g. "for the demo we carried X capacity; a deployed system would need Y for this lifetime." Real systems would swap/recharge batteries or re-dock automatically.

- This is not a focus of the project we can acknowledge it and move on.

**2. Payload, risk & pushing the drone**

- Question: once the core system works (~a month out), can we explore heavier loads / extra batteries to extend flight? Yes, but it carries risk.

- Bigger payload increases the chance of losing control and crashing. Once the drone (hardware) is chosen, design everything within its payload/moment limits , this becomes a fixed project constraint. If you genuinely need more, you change the platform.

- Even within limits, every test flight carries a small risk of damage. Weighing that risk against the demo (the top priority) is itself part of managing the project.

**3. Hardware, breakages & budget reserve**

- Last year the damage was to a 3D-printed sensor mount on the underside (what it landed on), not the core drone.

- Budgeting is part of project management: last year’s team set money aside for the drone and additional hardware, and kept a reserve/contingency in case they had to replace the drone. Suggested we do the same.

**4. Drones & drone-nest access**

- Sensors and the drone to be brought over to the lab.

- Supervisor to send the email of Kieran Wood, who manages the drone nest (very helpful, understands the project).

- We need to write a risk assessment for operating the drone in the nest — Kevin and Kieran sign it off.

- Time for lab then must be scheduled around their teaching, and this is a bit tricky.

- No outdoor testing: the answer is no. Our drone is potentially heavy, which pushes it into higher regulatory categories (would need a drone licence to fly outside). Indoors there are crash mats in the nest; last year it was also tethered to sandbags.

**5. Sensors — what’s available**

- No specific catalogue; it is old research projects, kit lying around, or favours. Once we know what we want to detect and in what material, that will guide the sensor choice.

- Prototypes are available free-issue (as last year) if we go that route; try not to break them.

- Metal detectors: plenty available, no problem. Radar: relatively easy to get hold of. Microwave: trickier, could possibly be borrowed. Thermal imaging: little in Dr Fletcher’s group, but he can ask around.

- Eddy current is Dr Fletcher’s specialty and there is direct support available if we go down the eddy-current route.

**6. Eddy current — the core challenge**

- Eddy current can detect very small (sub-millimetre) defects, but only with very tight, controlled scanning; traditionally a pen-sized probe moved precisely over the component.

- That tight tolerance is exactly what we are NOT set up to do from a drone, which is why control is central to the project.

- Some features will never be visible; others we hope might be. The big research question: can we fly/control the drone precisely enough to replicate some of these tightly-toleranced inspections with how much positional and sensor information is needed to get that feedback? (Background framing, not all for us to answer.)

**7. Predictive / structural-integrity modelling**

- Idea raised: a company that models turbines to predict future cracks (predictive, not just finding existing defects). Could drone-gathered data feed that modelling?

- There is a real feedback loop here (feeding NDE data back into structural-integrity models), but that closed loop is distinct from this project’s aim. Good big-picture context / another use of the technology, not our target.

**8. Sensor configuration**

- More sensors = more weight and power - always a trade-off.

- Options floated: modular sensors swapped at a base station (e.g. return and switch to a thermal camera); two of the same sensor working in tandem; or two different sensors.

- No right or wrong answer and it is up to us. Like industry: take the problem statement and break it into steps and challenges. Do the weight/power calculations and let them answer the configuration question for us.

**9. Project planning & Gantt chart**

- We do not need to decide everything now, real projects are iterative: do something, learn, tweak. The plan should be adaptable: de-risk the big challenges, take the quick wins.

- A Gantt chart is worth doing. We are NOT marked on how closely we follow it (that can’t be assessed) , we are marked on how realistic it looks. Avoid both extremes: not every task listed to the day, but not just "build a drone" either.

- Build in tolerance on each bar, identify the critical path and task dependencies, and use it as a living document which updates dates as work moves, bring tasks forward or push them back. Use it to identify risks and mitigations.

**10. Common mistakes to avoid**

- The biggest key to success is working well together with one shared goal. The worst outcome is the team splitting off on unrelated work that won’t join up later.

- The best projects think clearly about what they want to achieve and pull towards it together.

**11. Industry sponsors & funding**

- Industry involvement is mentioned in the proposal ("industrial / end-user involvement") but nothing is definite and it is not required. Nice to have ; many projects have it, some (e.g. Formula Student) have none. Distinct from the VIP visit.

- Adam knows people who might be interested and will keep it ticking over in the background (possible source of test samples).

- If a sponsor offered support: donated equipment or test samples is within the rules (has happened before). Actual cash is uncertain — the university may not have a mechanism to receive money. Fletcher to double-check.

- Test samples: Dr Fletcher to sort a few bits available soon, the rest more likely next term (semester 2).

**12. Report & grading**

- For the final report, the easiest starting point is to look at last year’s dissertation (already shared).

- Last year’s grades can’t be shared (personal info). MEng teams generally do well; everyone is already high achieving (entry bar -2:1 and above).

- Marks are spread across the grant pack/proposal, final report and demo, plus peer scoring. Teams get broadly similar scores on shared deliverables, nudged up or down slightly by within-team weightings — only a few percent, mainly to catch someone not contributing or pulling far ahead. The full (complex) formula and worked examples are in the handbook.

**13. Drone control — lessons from last year**

- The drone is ~0.3 m square and lifts ~5 kg ; quite heavy. The sensors themselves worked fine (including eddy current).

- They did not get as far as integrating sensor feedback into the flight control.

- Main control problem: the altimeter uses a barometer (pressure sensor), which is unreliable indoors (no GPS, less stable pressure) , a common indoor-drone issue. They therefore relied mainly on the Vicon motion-capture camera system for control.

- Suggested we study/understand these drone-control nuances.

**14. Progress tracking & communication**

- A shared log of who has done what is for us to set up as a team.

- For progress meetings, a few informal slides (talking points, pictures) are helpful, not a formal presentation, and they don’t need to be tidy; just enough to show we’re heading the right way.

- Secretary: minutes don’t need to be verbatim, and the main thing is a clear record of actions.

**15. Next meeting & scheduling**

- Adam is still negotiating the slot with timetabling; teaching not yet finalised. Mondays are a write-off.

- An over-lunch slot was suggested and would probably work — we suggest a time and supervisors confirm yes/no.

- Dr Tang: the current time works this semester; teaching starts in November (Tue/Wed), available before then.

- Control and sensor sub-teams can meet supervisors separately for more technical sessions depending on if supervisors are happy with that.

**Action Items**

| Owner | Action | Status |
|---|---|---|
| Supervisor | Bring sensors + drone to the lab |  |
| Supervisor | Send Kieran Wood’s email (drone-nest manager) |  |
| Team | Write risk assessment for drone operation in the nest (sign-off: Kevin & Kieran) |  |
| Team | Schedule drone-nest time around teaching |  |
| Team | Do weight/power calculations to decide sensor number & configuration |  |
| Team | Decide target defects/materials to guide sensor choice |  |
| Team | Read last year’s dissertation as a report template |  |
| Team | Set up a shared progress log |  |
| Team | Prepare a few informal slides for progress meetings |  |
| Team | Produce an adaptable Gantt chart (tolerances + critical path) |  |
| Team | Suggest a recurring meeting time (over lunch; not Monday) |  |
| Dr Fletcher | Double-check whether the university can receive sponsor money |  |
| Dr Fletcher | Confirm whether more than one Gantt version can be submitted |  |
| Dr Fletcher | Ask around for a thermal camera () |  |
| Dr Fletcher | Sort test samples (some tomorrow, rest next term) |  |
