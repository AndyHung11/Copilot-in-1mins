# Major Incident Notification Guide (extract)

> Document owner: Network Engineering　|　ZVT-REG-P-0301　|　Revision 2.4

## 1. Two independent reporting triggers

| Trigger | Condition | Deadline |
|---|---|---|
| **General** | **10,000** or more subscribers affected **and** lasting **30** minutes or more | **24** hours from awareness |
| **Emergency services** | Access to **emergency calls (119／110)** is affected, **regardless of the number of subscribers** | **2** hours from awareness |

⚠️ **The two are independent. Either one triggers the obligation.**
　 The most common error is to find that the subscriber count falls short of the
　 general threshold and conclude no report is needed — without ever checking
　 whether emergency calling was affected.

⚠️ The emergency trigger has **no subscriber floor**. An incident affecting 119
　 access at a single hospital emergency department must be reported, on the
　 shorter deadline, even if only a few hundred subscribers were affected.

## 2. When awareness begins

2.1 The deadline runs from the time the company becomes **aware** of the incident.

2.2 **Awareness is the alarm time recorded by the Network Operations Centre**, not
　 the time at which legal or regulatory affairs received internal notification.

⚠️ These two times are often tens of minutes apart. By the time regulatory affairs
　 picks it up, half the window may already be gone. **Check how much time remains
　 before drafting**, and decide whether to file an initial report first.

## 3. What the notification must state

1. Time of occurrence, time of discovery, time of restoration
2. Services, areas and subscriber numbers affected
3. **Whether emergency call access was affected** — mandatory, never omit
4. Preliminary assessment of cause
5. Action taken and action planned
6. Measures to prevent recurrence

## 4. Prohibited

- Do not decide reportability on subscriber numbers alone.
- Do not run the deadline from the time regulatory affairs was notified.
- Do not delay a report because the cause is not yet established; file an initial
  report and say so.
