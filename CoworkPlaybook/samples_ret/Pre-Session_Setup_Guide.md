# Pre-Session Setup Guide (for the instructor)

> This is what the instructor or a self-learner does before the session; learners do not read it during the exercises.
> ⚠️ Finish everything before you start. All seven scenarios make Cowork fetch data from OneDrive, the mailbox, Teams and Planner, and nothing runs without this setup.

## 0. Date settings for this course

Dates in the materials are fixed simulated dates and do not move with the day you practise:

- Data cut-off 2026-10-12; Anniversary sale launch T = 2026-11-06 (Friday); POS price configuration cut-off 2026-11-03 18:00.
- Scenario as-of dates: ret1 2026-10-26, ret3 2026-10-13, ret4 2026-11-03 (T-3), ret5 2026-10-13, ret6 2026-10-12 (Monday), ret7 2026-10-14.
- ret2 is a live scenario; it uses the time the trigger email is sent.

If Cowork compares against today's real date, add: "The dates in the files are simulated; use the dates in the files only."

## 1. Language reminders

- The three language sets (Traditional Chinese, English, Simplified Chinese) use different folder and file names. Prepare one language per environment; do not mix them in the same OneDrive parent folder.
- Before filming or practising, switch the Microsoft 365 display language and the Cowork interface language to that language, then build the environment.
- Teams channel and Planner plan names also differ by language (sections 4 and 6). Prompts spell the names out; if they do not match, Cowork cannot find them or picks the wrong one.

## 2. Create the OneDrive folders and upload the files

Under Documents/Cowork_Lab/RetailChannels/ in OneDrive, create the parent folder and sub-folders as below (generated from the file list, so it matches the materials one to one):

```
Documents/Cowork_Lab/
└─ RetailChannels/
   ├─ Contact_List.md
   ├─ RET1_Anniversary_WarRoom/
   │  ├─ RET1_Readiness_Tracker.xlsx
   │  ├─ RET1_Campaign_Deck.pptx
   │  └─ RET1_Last_WarRoom_Decisions.docx
   ├─ RET2_Stockout_Check/
   │  ├─ RET2_Stock_Extract.xlsx
   │  ├─ RET2_Receiving_Quarantine_List.xlsx
   │  └─ RET2_Transfer_Procedure.docx
   ├─ RET3_Receiving_Variance/
   │  ├─ RET3_Variance_Ledger.xlsx
   │  ├─ RET3_Goods_Receipt_Log.xlsx
   │  └─ RET3_PO_Claim_Terms.docx
   ├─ RET4_Pickup_Staffing/
   │  ├─ RET4_Shift_Roster.xlsx
   │  ├─ RET4_Pickup_Forecast.csv
   │  ├─ RET4_Cold_Pickup_Authorized_Staff.xlsx
   │  └─ RET4_Staffing_and_Training_Policy.docx
   ├─ RET5_Overdue_Orders/
   │  ├─ RET5_Overdue_Escalation_Policy.docx
   │  └─ RET5_Customer_Notice_Template.docx
   ├─ RET6_Monday_Briefing/
   │  ├─ RET6_Weekly_Sales.xlsx
   │  ├─ RET6_Last_Week_Briefing.pptx
   │  └─ RET6_Weekly_Meeting_Agenda.docx
   ├─ RET7_Channel_Discount_Exceptions/
   │  ├─ RET7_Channel_Pricing_Policy.docx
   │  ├─ RET7_Margin_Floor.xlsx
   │  └─ RET7_Discount_Exception_Log.xlsx
   └─ _Upload/
      ├─ RET3_Supplier_Invoice_Lines.csv
      ├─ RET5_OMS_Overdue_Export.csv
      └─ RET7_Supplier_Subsidy_Agreement.pdf
```

Files for each folder:

| Folder | Files |
|---|---|
| RET1_Anniversary_WarRoom | RET1_Readiness_Tracker.xlsx, RET1_Campaign_Deck.pptx, RET1_Last_WarRoom_Decisions.docx |
| RET2_Stockout_Check | RET2_Stock_Extract.xlsx, RET2_Receiving_Quarantine_List.xlsx, RET2_Transfer_Procedure.docx |
| RET3_Receiving_Variance | RET3_Variance_Ledger.xlsx, RET3_Goods_Receipt_Log.xlsx, RET3_PO_Claim_Terms.docx |
| RET4_Pickup_Staffing | RET4_Shift_Roster.xlsx, RET4_Pickup_Forecast.csv, RET4_Cold_Pickup_Authorized_Staff.xlsx, RET4_Staffing_and_Training_Policy.docx |
| RET5_Overdue_Orders | RET5_Overdue_Escalation_Policy.docx, RET5_Customer_Notice_Template.docx |
| RET6_Monday_Briefing | RET6_Weekly_Sales.xlsx, RET6_Last_Week_Briefing.pptx, RET6_Weekly_Meeting_Agenda.docx |
| RET7_Channel_Discount_Exceptions | RET7_Channel_Pricing_Policy.docx, RET7_Margin_Floor.xlsx, RET7_Discount_Exception_Log.xlsx |
| _Upload | RET3_Supplier_Invoice_Lines.csv, RET5_OMS_Overdue_Export.csv, RET7_Supplier_Subsidy_Agreement.pdf |

Local source: samples_ret\OneDrive_種入用\ in the matching sub-folder; the files for _Upload are in samples_ret\上傳用\.

Note: the files in _Upload are meant to be dragged into the chat by the learner. Automated filming cannot really drag files, so they are seeded in OneDrive and prompts use the path. In manual practice you can also keep them locally and drag them in.

## 3. Put the contact list in the parent folder and fill in real mailboxes

Place Contact_List.md in the RetailChannels/ parent folder (source: samples_ret\OneDrive_種入用\), not in a sub-folder. Replace the placeholder "(your own or a colleague's mailbox)" in the Email column with your own mailbox or a colleague who agreed to take part. Keep the external section (drafts only, no outbound mail).

## 4. Teams channel

In the team "Copilot Cowork" of the test tenant, create the channel "Zava Anniversary War Room" and make sure you are a member. Paste the content of Teams_種入用\RET1_WarRoom_Background_Post.md as the first background post.

## 5. Mailbox and calendar

- Mailbox: samples_ret\信箱_種入用\RET2_Stock_Alert_Email.md is the ret2 alert email template. Do not send it before the session; send it to yourself only at the trigger step, otherwise the event trigger cannot be verified.
- Calendar (create in OWA):
  - "Zava Anniversary War Room #3": 2026-10-19 (Monday) 10:00-11:00, agenda in the event body.
  - "Monday Ops Review": recurring every Monday 09:30 (the ret6 weekly meeting).
- Do not add attendees, so no invitations are actually sent.

## 6. Planner plan

Create a group plan named "Zava Anniversary Prep" under the team above. Tasks from ret2 and ret4 are created in this plan.

## 7. Skills and automations

- samples_ret\技能\RET7_SKILL_Example.md is the reference answer for ret7. Do not put it in OneDrive before the session, or ret7 becomes copying.
- Custom skills are not supported on mobile; use desktop or browser for ret7. After creating a skill you must open a new task to call it.
- If the Automations page has leftovers from a previous round (the ret2 trigger, the ret6 Monday schedule), disable or delete them first.

## Pre-session checklist

- [ ] The RetailChannels/ parent folder and all seven sub-folders exist, and files match the tree in section 2
- [ ] The _Upload folder holds 3 files
- [ ] Contact_List.md is in the parent folder and the Email column holds mailboxes that really receive mail
- [ ] Teams channel "Zava Anniversary War Room" exists with the background post
- [ ] Planner group plan "Zava Anniversary Prep" exists
- [ ] Both calendar events exist with no attendees
- [ ] The ret2 alert email has not been sent; the skill reference answer is not in OneDrive
- [ ] The Automations page has no leftover schedules or event triggers
- [ ] Microsoft 365 and Cowork are set to this round's language

## Key numbers buried in this round

(For the instructor; do not show to learners)

- ret1: readiness by store count is 91.7%, which looks like it clears the 90% gate; weighted by forecast revenue it is only 85.9%, and 3 of the top 10 are not ready (S014, S008, S056). The only minimal fix set is those 3 stores.
- ret2: SKU-A is released 2026-10-31 and reaches stores 2026-11-02, before the shelving deadline, so transfer works; SKU-B is released 2026-11-06 and arrives 2026-11-08, 3 days late, so use store-to-store transfer (surplus stock 200 in total).
- ret3: B-07 has the largest receipt-vs-invoice gap (120) but it is gift stock and not claimable; the claimable one is B-04 short 70.
- ret4: total hours are enough, but no qualified person is in the store for 17:00-19:00 cold pickups; the only fix is extending B by 2 hours (8 hours that day, cap 10); training takes 5 days, too late.
- ret5: of 100 orders, 71 are not picked, 18 are carrier delays and 11 have address issues; sending the carrier-delay notice to all gives 82 wrong explanations.
- ret6: sale-week index +38%, but the four-week net increase is only +6.0%; sale-week margin is 21%, the four-week overall margin 25.7%, and gross profit -2.6%.
- ret7: online -25% with a subsidy of 40 (the agreement covers online only) gives 20.0%, compliant; store -20% gives 20.0%, compliant; franchise -24% with no subsidy gives 15.8%, breach. New exceptions via the skill: EX-04 online -30% gives 14.3%, breach; EX-05 store -15% gives 24.7%, compliant.
