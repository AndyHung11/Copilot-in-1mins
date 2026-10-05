# Pre-session setup guide (for the instructor)

> This is what the **instructor or self-learner does before the session**, not something
> learners read during the exercises.
> ⚠️ Finish all of it first. All seven scenarios have Cowork fetch material from
> OneDrive itself, and without this they simply do not run.

## 0. How dates work in this material

The material is set on **2026-11-16**, the registers are cut off at **2026-11-13**, and the
KPI month is **2026-10**.

⚠️ These are **fixed simulated dates**. They do not move with the day you practise.
If Cowork works from today's real date and produces an odd amount of time remaining,
add "use the data cut-off date as the baseline" to the prompt.

## 1. Create the OneDrive folders and upload the material

Under `Documents/Cowork_Lab/` in OneDrive, create the parent folder and seven subfolders:

```
TelecomOps/
├─ Contact_List.md
├─ TEL1_Alarm_Correlation/
├─ TEL2_Maintenance_Window/
├─ TEL3_Circuit_SLA/
├─ TEL4_Regulator_Notification/
├─ TEL5_Tariff_Capacity/
├─ TEL6_Disclosure_Order/
└─ TEL7_Quality_Report/
```

What goes in each subfolder:

| Subfolder | Files |
|---|---|
| TEL1_Alarm_Correlation | TEL1_Alarm_List.xlsx, TEL1_Network_Topology.xlsx, TEL1_Alarm_Triage_and_Root_Cause_Procedure.md |
| TEL2_Maintenance_Window | TEL2_Maintenance_Window_Options.xlsx, TEL2_Maintenance_Window_Planning_Guide.md |
| TEL3_Circuit_SLA | TEL3_Circuit_Outage_Log.xlsx, TEL3_Enterprise_Circuit_SLA_Terms.md |
| TEL4_Regulator_Notification | TEL4_Incident_Timeline.xlsx, TEL4_Major_Incident_Notification_Guide.md |
| TEL5_Tariff_Capacity | TEL5_Regional_Capacity_and_Usage.xlsx, TEL5_Tariff_Capacity_Assessment_Standard.md |
| TEL6_Disclosure_Order | TEL6_Data_Retention_Schedule.xlsx, TEL6_Disclosure_Order_Handling_Standard.md |
| TEL7_Quality_Report | TEL7_Regional_KPI_Monthly.xlsx, TEL7_Network_Quality_Reporting_Guide.md |

## 2. Put the contact list in the parent folder, with addresses that receive mail

`Contact_List.md` belongs in the **parent folder**, not in any subfolder.

Fill the email column with **your own address** or a **colleague's** agreed in advance:
scenario 1 really posts its conclusion back to Teams and notifies the duty engineer,
scenario 2 really sends a meeting invitation and scenario 4 really sends the draft
notification. All of them look up recipients in this list; leave it blank and those
steps stop at "recipient not found".

⚠️ Do not delete the "never send to an external party" note. Part of the point of
scenarios 3 and 4 is whether it puts the enterprise customer or the regulator straight
into the To field.

## 3. Send yourself one email (background for scenario 1)

Send from your own account to yourself, with exactly this subject:

```
Night shift handover (2026-11-15 23:00 – 2026-11-16 07:00)
```

Use the body in `信箱_種入用/TEL1_Shift_Handover_Email.md`. Check it lands in the inbox, not in junk.

⚠️ **Do not send `TEL1_Alarm_Notification_Email.md` before the session.** That one is what you use to verify
the event trigger built in scenario 1 actually fires. Send it early and there is nothing
left to verify.

## 4. Create the Teams channel and post the first message

Under any team you have rights to, create a channel named **Network Operations** and make sure
you are a member.

Paste the content of `Teams_種入用/TEL1_Network_Ops_Channel_Background_Post.md` into it.
At the end of scenario 1, Cowork posts its triage conclusion back to this channel.

## 5. Download the "upload" files to your PC — do not put them in OneDrive

| File | Used in |
|---|---|
| TEL6_Disclosure_Order.pdf | Scenario 6: the disclosure order, uploaded during the exercise |
| TEL5_Existing_Plan_Usage.csv | Scenario 5: the existing plan usage distribution, uploaded during the exercise |

These two are uploaded **during** the exercise. Putting them in OneDrive defeats the
purpose of those steps: scenario 6 turns on "this order arrived today and is not in our
systems yet", and scenario 5 on "this is the raw export that just came out of BI".

## 6. Check the skills path is writable, and run scenario 3 on a desktop

Scenario 3 has Cowork build a custom skill at
`OneDrive/Documents/Cowork/skills/sla-breach-check/SKILL.md`.
You do not need to create the folder beforehand — just confirm the path is writable and
there is no skill of the same name already there.

⚠️ `技能/TEL3_SKILL_Example.md` is the **reference answer**. Keep it out of OneDrive before the
session, or scenario 3 becomes a copying exercise.

⚠️ Custom skills are **not supported on mobile**. Use a desktop or browser for scenario 3.

## 7. Clear out leftover automations

If the automations page still has schedules or event triggers from a previous run,
disable or delete them — they interfere with scenario 1 (event trigger) and scenario 4
(scheduled countdown).

## Pre-session checklist

- [ ] Parent folder and all seven subfolders created, files in place
- [ ] Contact_List.md is in the parent folder, with addresses that actually receive mail
- [ ] The handover email has been sent to yourself and is in the inbox (do **not** send the alarm notification yet)
- [ ] Teams channel "Network Operations" created with the background message posted
- [ ] TEL6_Disclosure_Order.pdf and TEL5_Existing_Plan_Usage.csv are on your PC and **not** in OneDrive
- [ ] The reference skill file is not in OneDrive
- [ ] No leftover schedules or event triggers on the automations page

## Scenarios and material

| # | Scenario | Primary capability | What to prepare |
|---|---|---|---|
| 1 | Overnight alarm triage | Adaptive Cards + event trigger | Upload three TEL1 files, send the handover email, create the Teams channel |
| 2 | Core network maintenance window | Scheduling | Upload two TEL2 files |
| 3 | Enterprise circuit SLA assessment | Excel + editing an existing file + custom skill | Upload two TEL3 files |
| 4 | Major incident regulatory notification | Communications + schedule | Upload two TEL4 files |
| 5 | Tariff capacity impact deck | PowerPoint | Upload two TEL5 files; keep the usage CSV on your PC |
| 6 | Disclosure order reply | Word | Upload two TEL6 files; keep the order PDF on your PC |
| 7 | Network quality monthly review | Daily Briefing + Search | Upload two TEL7 files |

## The numbers planted in this round of material

(instructor reference — **do not show learners**)

- Scenario 1: the root cause is **ZVT-TP-0042** (all 23 cells beneath it alarmed), not the element with the most alarms. The node raised 1 alarm; its cells raised 35. The decoy ZVT-TP-0043 has only some of its cells alarmed.
- Scenario 2: the viable window is **Option C (06:40–09:40)**, not the overnight option with the fewest consumers — overnight is the enterprise batch peak and sits inside the noise restriction.
- Scenario 3: 312 minutes of total interruption looks like a certain breach, but after the exclusions the counted outage is only 32 minutes — within the 44.6-minute allowance. The actual breach is the guaranteed window (18 > 15 minutes), compensation NTD 12,900.
- Scenario 4: the subscriber count is **below** the general threshold, but emergency call access at Proseware Hospital emergency department was affected — the emergency trigger applies, the deadline is 2 hours and it runs from the NOC alarm time, leaving only 50 minutes by the time regulatory affairs picks it up.
- Scenario 5: the average-usage calculation passes at network level, but **3 hotspot regions** (Xinyi, Taipei; Xitun, Taichung; Zuoying, Kaohsiung) exceed the heavy-user threshold with insufficient busy-hour headroom.
- Scenario 6: the order runs from 2026-02-01, but **internet session logs and cell site location records** are kept only six months (from 2026-05-12), so the reply must be partly disclosure and partly a statement that the earlier period is beyond retention — neither a flat refusal nor full disclosure.
- Scenario 7: the network drop rate of 0.43% **meets** the 0.5% target, but Taichung sits at 1.38% — 4.5× the other regions — and accounts for 59.6% of the month's complaints. Excluding it, the network figure is 0.31%: 0.12 points were being masked.
