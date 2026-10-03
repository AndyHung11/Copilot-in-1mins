# Pre-session setup guide (for the instructor)

> This is what the **instructor or self-learner does before the session**, not something
> learners read during the exercises.
> ⚠️ Finish all of it first. Six of the seven scenarios have Cowork fetch material from
> OneDrive itself, and without this they simply do not run.

## 0. How dates work in this material

The material is set on **2026-10-08**, the registers are cut off at **2026-10-05**, and the
reliability month is **2026-09**.

⚠️ These are **fixed simulated dates**. They do not move with the day you practise.
If Cowork works from today's real date and produces something odd, add
"use the data cut-off date on the register as the baseline" to the prompt.

## 1. Create the OneDrive folders and upload the material

Under `Documents/Cowork_Lab/` in OneDrive, create the parent folder and seven subfolders:

```
AirlineEngineering/
├─ Contact_List.md
├─ AIR1_Airworthiness_Directives/
├─ AIR2_Deferred_Items/
├─ AIR3_Check_Slot/
├─ AIR4_AOG_Event/
├─ AIR5_Service_Bulletin/
├─ AIR6_Reliability_Report/
└─ AIR7_Applicability_Skill/
```

What goes in each subfolder:

| Subfolder | Files |
|---|---|
| AIR1_Airworthiness_Directives | AIR1_Airworthiness_Directive_Register.xlsx、AIR1_AD_Management_Procedure.md |
| AIR2_Deferred_Items | AIR2_Deferred_Defect_Register.xlsx、AIR2_Deferred_Item_Extension_Rules.md |
| AIR3_Check_Slot | AIR3_Check_Slot_Options.xlsx、AIR3_Check_Slot_Planning_Guide.md |
| AIR4_AOG_Event | AIR4_Freighter_Schedule_and_Load.xlsx、AIR4_Cold_Chain_Handling_Standard.md |
| AIR5_Service_Bulletin | AIR5_Fleet_Configuration.xlsx、AIR5_Engineering_Order_Writing_Standard.md |
| AIR6_Reliability_Report | AIR6_Fleet_Reliability_Data.xlsx、AIR6_Reliability_Programme_Summary.md |
| AIR7_Applicability_Skill | AIR7_Applicability_Decision_Rules.md |

## 2. Put the contact list in the parent folder, with addresses that receive mail

`Contact_List.md` belongs in the **parent folder**, not in any subfolder.

Fill the email column with **your own address** or a **colleague's** agreed in advance:
scenario 3 really sends a meeting invitation, scenario 4 really sends a notification and
scenario 6 really sends the monthly report email. All three look recipients up here.
Leave it blank and those steps stall at "recipient not found".

⚠️ Do not delete the note that external organisations are never contacted. One of the
things scenario 4 tests is whether the consignee ends up in the recipient list.

## 3. Send yourself one email (background for scenario 4)

Send it to yourself from your own account, copying the subject exactly:

```
[MOC] Night shift handover 2026-10-08 07:00
```

Use the body in `信箱_種入用/AIR4_MOC_Shift_Handover_Note.md`. Check it lands in the inbox, not in junk.

⚠️ **Do not send** `AIR4_AOG_Notification_Email.md` from the same folder yet. That is the message you use in
scenario 4 to prove the event trigger actually fires. Send it now and there is nothing
left to test.

## 4. Create the Teams channel and post the first message

Create a channel called **Maintenance Alerts** in any team you have rights to, and make sure you
are a member.

Post the contents of `Teams_種入用/AIR4_Maintenance_Channel_Background_Post.md` into it.
Scenario 4 ends by having Cowork post its conclusion back to this channel.

## 5. Download the two upload files to your PC, and keep them out of OneDrive

| File | Used in |
|---|---|
| AIR5_Service_Bulletin_NW350-28-1142.pdf | Scenario 5: the service bulletin, uploaded live |
| AIR7_B-99107_Configuration_Handover.csv | Scenario 7: the handover record used to test the skill |

Both are **uploaded during the exercise**. Putting them in OneDrive defeats the point:
scenario 5 turns on this manufacturer document not being in our system yet, and
scenario 7 on the aircraft having just arrived with incomplete records.

## 6. Check the skills path is writable, and do scenario 7 on desktop

Scenario 7 has Cowork create a custom skill at
`OneDrive/Documents/Cowork/skills/sb-applicability-check/SKILL.md`.
You do not need to create the folder in advance; just confirm the path is writable and
that no skill of that name already exists.

⚠️ `技能/AIR7_SKILL_Example.md` is a **reference answer**. Do not put it in OneDrive beforehand, or
scenario 7 becomes a copying exercise.

⚠️ Custom skills are **not supported on mobile**. Do scenario 7 on desktop or in a browser.

## 7. Clear out leftover automations

If the Automations page still holds scheduled prompts or event triggers from a previous
run, pause or delete them. They interfere with scenario 1 (schedule) and scenario 4
(event trigger).

## Pre-session checklist

- [ ] All seven subfolders exist in OneDrive and the files open
- [ ] The contact list sits in the **parent folder**, not inside a subfolder, and the email column contains addresses that actually receive mail
- [ ] The MOC night shift handover note is in the inbox, not in junk
- [ ] **The AIR4 AOG notification email has not been sent yet**
- [ ] The maintenance alerts channel exists, you are a member, and the background message is posted
- [ ] The two upload files are on your PC and **not** in OneDrive
- [ ] There is no skill called sb-applicability-check under `Cowork/skills/`
- [ ] No leftover scheduled or event-driven tasks on the Automations page
- [ ] No sensitivity labels on the files, and your account can send mail

## Scenarios and their material

| # | Scenario | Primary capability | What to prepare |
|---|---|---|---|
| 1 | The AD radar | Daily Briefing | Upload the two AIR1 files |
| 2 | Deferred item extension window | Excel + edit existing file | Upload the two AIR2 files |
| 3 | Three check slots compared | Adaptive Cards | Upload the two AIR3 files |
| 4 | AOG response | Event trigger | Upload the two AIR4 files, send the MOC handover, create the Teams channel |
| 5 | Bulletin to engineering order | Word | Upload the two AIR5 files; keep the SB PDF on your PC |
| 6 | Monthly reliability report | Communications + PowerPoint | Upload the two AIR6 files |
| 7 | Applicability test as a skill | Custom skill | Upload the one AIR7 file; keep the handover CSV on your PC |

## The numbers this material is built on

(Instructor reference — **do not show learners**)

- Scenario 1: the nearest deadline is **B-99101 AD-2026-11-03** at **35 days**; instinct picks B-99103 with 45 calendar days showing
- Scenario 2: the blocking item is **MEL-243** (Cat C, already extended), not the strictest category MEL-241
- Scenario 3: only option **Option C** works; the cheapest is blocked by the hangar and the other runs past the AD deadline 2026-11-09
- Scenario 4: a 4-hour delay alone stays inside the window (70h <= 72h); missing the truck is what overruns it by **12 hours**
- Scenario 5: **4** aircraft are affected (B-99101, B-99103, B-99104, B-99106); reading the MSN alone misses B-99106
- Scenario 6: headline 1.48% -> 1.31% (improvement), like-for-like 1.17% -> 1.31% (deterioration)
- Scenario 7: across seven tails, 4 applicable / 2 not / 1 manual review (B-99107 has no component serial)
