# Pre-Session Setup Guide — Financial Holding HQ · Compliance & Risk

For the instructor, or anyone working through this alone. All seven scenarios share
one environment, so **you only set it up once** — about 20 minutes. Six of the seven
have Cowork fetch material from OneDrive itself, so without this they will not run.

---

## 1. OneDrive folders

Create `Documents/Cowork_Lab/GroupCompliance/` in OneDrive with seven subfolders:

```
Documents/Cowork_Lab/GroupCompliance/
├─ Compliance_Contact_Roster.md      ← ⚠️ parent folder, not a subfolder
├─ FIN1_Mailbox_Triage/
│   ├─ FIN1_Filing_vs_Approval_Matrix.md
│   └─ FIN1_Signoff_Turnaround_Rules.md
├─ FIN2_Training/
│   ├─ FIN2_Fair_Treatment_Teaching_Points.md
│   ├─ FIN2_Training_Policy.md
│   ├─ FIN2_Completion_Statistics.xlsx
│   └─ FIN2_New_Hire_List.md
├─ FIN3_Coordination_Meeting/
│   ├─ FIN3_Quarterly_Agenda.md
│   └─ FIN3_Information_Barrier_Rules.md
├─ FIN4_Group_Exposure/
│   ├─ FIN4_Affiliation_Table.xlsx
│   └─ FIN4_Exposure_Limit_Policy.md
├─ FIN5_Incident_Report/
│   ├─ FIN5_Incident_Reporting_Procedure.md
│   └─ FIN5_Supervisory_Bureau_Matrix.md
├─ FIN6_Cross_Marketing/
│   ├─ FIN6_Consent_Form_Versions.md
│   └─ FIN6_Opt_Out_Register.xlsx
└─ FIN7_Product_Signoff/
    ├─ FIN7_Product_Signoff_Checklist.md
    ├─ FIN7_Channel_Requirements.md
    └─ FIN7_Industry_Case_Library.md
```

## 2. The contact roster — the step people skip

`Compliance_Contact_Roster.md` goes in the **GroupCompliance parent folder**, not in a subfolder.

Fill the email column with **your own address** or a **colleague's** agreed in advance.
Don't leave the `(your own or a colleague's mailbox)` placeholder in place:

| Scenario | What it really does |
|---|---|
| Scenario 2 | Sends a reminder email |
| Scenario 3 | Sends two meeting invitations |
| Scenario 6 | Sends a rejection notice |

Leave it blank and those three steps stall at "recipient not found".

⚠️ **Do not delete** the line noting that the Zava Investment Trust compliance head role is held
concurrently by the Zava Securities compliance head — that is the whole point of scenario 3.

## 3. Send yourself five emails (the start of scenario 1)

Send them from your own account to yourself. Subjects and bodies are all in
`信箱_種入用/FIN1_Product_Confirmation_Mails.md`.

**Copy the subjects exactly.** Case numbers ZVL-2609-071 through
ZVL-2609-075 must survive — scenario 1 uses them to find the emails.
Check all five land in the inbox rather than junk.

⚠️ **Do not send** `FIN5_Incident_Notification_Mail.md` from the same folder yet.
That one goes out **after** the event trigger is armed in scenario 5, to prove the
trigger really fires. Send it now and there is nothing left to test.

## 4. Keep the five upload files off OneDrive

The five files under `上傳用/` are uploaded **during** the exercise:

| File | Used in |
|---|---|
| FIN4_Bank_Credit_Balances.xlsx | Scenario 4 |
| FIN4_Life_Investment_Positions.xlsx | Scenario 4 |
| FIN4_Securities_Secured_Lending.xlsx | Scenario 4 |
| FIN6_Campaign_List.csv | Scenario 6 |
| FIN7_New_Product_Submission_Global_Multi_Asset.md | Scenario 7 |

They stand for material a subsidiary has just sent up that is not yet in any group
system. Keep them somewhere local you can find quickly. **Don't put them in OneDrive** —
Cowork would find them by itself and there would be no upload left to practise.

## 5. Final check before you start

- [ ] All seven subfolders exist, with each scenario's files in the right one
- [ ] The contact roster is in the **parent folder**, with reachable addresses
- [ ] All five product confirmation emails are in the inbox, case numbers intact
- [ ] Scenario 5's incident email has **not** been sent
- [ ] The five upload files are still off OneDrive

---

## About this material

Zava Financial Holdings, its four subsidiaries, every person named, every customer group, every
amount and every customer ID are **fictional**. They correspond to no real institution
or individual.

The regulatory framework reflects how financial supervision actually works in Taiwan,
but every threshold and deadline is stated as a **group internal rule**. In practice a
financial holding company's internal rules are stricter than the statutory floor, and
writing them as internal rules avoids putting wrong statutory figures in a training
handbook. Apply your own institution's rules and the law in force when you do this
work for real.
