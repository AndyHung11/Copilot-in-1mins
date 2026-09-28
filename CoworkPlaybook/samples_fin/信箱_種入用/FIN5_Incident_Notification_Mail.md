# Trigger test email — major incident notification

⚠️ **Do not send this before the session.** It goes out **after** the event trigger is
armed in scenario 5, to prove the trigger really fires. Send it early and there is
nothing left to test.

---

**Subject**: `Major incident notification ZVS-IR-2609-03 unauthorised access to customer database`

**Body**:

> Group Compliance Office,
>
> We are notifying a major incident. Details follow.
>
> **Case**: ZVS-IR-2609-03
> **Entity**: Zava Securities, IT Department
> **Time of occurrence**: **2026-11-18 02:40**
> **Type**: unauthorised access to an information system
>
> **What happened**:
> An outsourced IT vendor's maintenance account was compromised and used to access the customer master database.
> We received a system alert on 18 November, assessed it initially as a
> scheduled-job failure and handled it as an ordinary fault. On 19 November, while
> reconciling logs, we identified an anomalous access pattern, and
> **following confirmation with our security vendor the incident was confirmed at
> 2026-11-19 14:10**.
>
> **Scope**:
> Log reconciliation indicates approximately **1,860 customer
> records** were accessed, covering name, national ID number and transaction records.
>
> **Action taken**:
> 1. The maintenance account has been disabled and all vendor credentials reset
> 2. Source IP blocked; logs preserved
> 3. Security vendor engaged for full forensics
>
> **Next**:
> The full forensic report is expected within three business days and will follow.
>
> IT Department, Zava Securities

---

## How to send it

From your own account, to yourself. Copy the subject exactly — it must contain
"Major incident notification", which is what the trigger matches on.

Once sent, go back to Cowork. The trigger runs by itself, which may take a minute or two.
Run history is under **Automations → open the trigger card → bottom of its detail page**.

> 📌 This email deliberately puts the **time of occurrence** first and in bold, while
> the **time of awareness** sits inside the narrative. That is the main thing scenario 5
> is testing.
