# Pre-Session Setup Guide (for the instructor)

> All six scenarios share one environment — set it up once. About 15 minutes.
> The learner-facing version is the "Setting up" tab in the playbook; this is the full
> checklist for the instructor.

## 1 OneDrive folder tree

Under `Documents/Cowork_Lab/` in OneDrive:

```
AdvancedPackaging/
├─ Contact_List.md
├─ MFGX1_Shift_Handover/
│    ├─ MFGX1_Night_Shift_Handover.md
│    ├─ MFGX1_Queue_Time_Control_Standard.md
│    └─ MFGX1_Hold_Lot_List.xlsx
├─ MFGX2_Yield_Excursion/
│    ├─ MFGX2_Yield_Excursion_Procedure.md
│    └─ MFGX2_Equipment_Maintenance_Log.xlsx
├─ MFGX3_Quarterly_Review/
│    ├─ MFGX3_Customer_QBR_Deck_Standard.md
│    ├─ MFGX3_Customer_Complaint_8D_Master.xlsx
│    └─ MFGX3_Quarterly_Yield_Trend.xlsx
├─ MFGX4_Part_Discontinuation/
│    ├─ MFGX4_NPI_Production_Ramp_Plan.md
│    ├─ MFGX4_PCN_Handling_Standard.md
│    └─ MFGX4_Critical_Material_BOM_Usage.xlsx
├─ MFGX5_Customer_Audit/
│    ├─ MFGX5_Engineering_Change_Control_Procedure.md
│    ├─ MFGX5_Customer_Audit_Response_Standard.md
│    └─ MFGX5_Audit_Response_Contacts.md
└─ MFGX6_Sample_Release/
     ├─ MFGX6_Engineering_Sample_Release_Criteria.md
     └─ MFGX6_Specification_Deviation_List.xlsx
```

⚠️ `Contact_List.md` goes in the **parent folder**, not in a subfolder.
⚠️ The Email column must contain addresses that **really receive mail** (your own, or a
   colleague's agreed in advance). Scenario 4 really sends a mail and scenario 5 really
   sends a meeting invite; both look the recipient up here.

## 2 Send yourself one email

Copy the subject exactly; use `信箱_種入用/MFGX4_Supplier_PCN_Notice.md` as the body:

```
[PCN-2609-KY07] BW-25AU discontinuation - last time buy by 30 Nov 2026
```

Check it lands in the inbox, not in junk.

⚠️ **Do not send** `MFGX4_Trigger_Test_Email.md` before the session — that one goes out
after the event trigger is armed in scenario 4, to prove it fires. Send it early and
there is nothing left to test.

## 3 Teams channel

Create a channel called `Quality War Room` in any team you have rights to, and make
sure you are a member. The last step of scenario 2 posts the investigation summary
there. Nothing needs to be posted beforehand.

## 4 Upload files (download to the PC — do not put them in OneDrive)

```
  - MFGX2_FB820_Lot_Yield_Detail.csv
  - MFGX5_Fabrikam_Audit_Findings_Report.pdf
  - MFGX6_Sample_Shipment_Requests_0921.csv
```

These three are uploaded live during the exercise. Putting them in OneDrive defeats the
point — a customer's file does not arrive already sitting in your cloud drive.

## 5 Custom skill path

Scenario 6 has Cowork write a skill to
`OneDrive/Documents/Cowork/skills/<skill-name>/SKILL.md`.
You do not need to create the folder in advance — just confirm the path is writable.

⚠️ **Custom skills are not supported on mobile.** Do scenario 6 on a desktop or in a
browser.

## 6 After the session (important)

Scenario 1 creates a **daily schedule** and scenario 4 creates an **event trigger**.
When the session is over, **pause both** on the Automations page in the left
navigation, or they will keep running.

## Checklist

- [ ] All six subfolders created, files in the right places
- [ ] Contact_List.md in the parent folder, with addresses that receive mail
- [ ] PCN notice in the inbox, subject copied exactly
- [ ] Trigger test email **not yet sent**
- [ ] `Quality War Room` channel exists and you are a member
- [ ] The three upload files are on the PC, **not** in OneDrive
- [ ] Scenario 6 planned for desktop or browser
