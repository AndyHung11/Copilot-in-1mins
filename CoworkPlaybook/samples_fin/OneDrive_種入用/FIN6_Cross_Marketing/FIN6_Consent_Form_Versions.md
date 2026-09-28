# Cross-Marketing Consent — Versions and Scope

Version: 2026 ｜ Maintained by: Group Compliance Office
Use: the basis for checking cross-subsidiary campaign lists

---

## 1. Consent is not a checkbox

Once a customer signs the cross-marketing consent, the system sets a "consented" flag.
**That flag is not on its own grounds to market to them.**

What the form actually records is **three independent scopes**, and all three must hold:

| Dimension | Field on the form | The question to ask |
|---|---|---|
| **① Data categories** | Categories of customer data that may be shared | Is the data this campaign needs within scope? |
| **② Product scope** | Classes of product that may be marketed | Is the product being marketed within scope? |
| **③ Recipient entities** | Subsidiaries that may receive the data | Is the subsidiary running this campaign within scope? |

**All three must hold at once.** Fail any one and the customer cannot be marketed to.

## 2. Data categories

| Code | Category | Content |
|---|---|---|
| B | Basic | Name, contact details, year and month of birth |
| A | Account | Deposit balance band, transaction history |
| C | Credit | Credit relationships, credit score |
| I | Investment profile | Risk tolerance, investment experience |

## 3. Product scope

| Code | Product class | Covers |
|---|---|---|
| DEP | Deposits and payments | Time deposits, digital accounts, credit cards |
| INS | Protection insurance | Life, health, accident |
| **INV** | **Investment products** | Funds, investment-linked policies, structured products, sub-brokerage |
| LOAN | Lending | Mortgages, personal loans, car loans |

> ⚠️ **INV is a class of its own.** Ticking DEP, INS and LOAN does not reach it.
>
> This is what gets the most rows rejected during list checking — most customers signed
> the form while opening a deposit account or taking a credit card, so the scope they
> ticked naturally excludes investment products.

## 4. Recipient entities

The form lists each subsidiary that may receive the data, and the customer ticks them
individually:

Zava Commercial Bank ／ Zava Life ／ Zava Securities ／ Zava Investment Trust

> ⚠️ Ticking "I consent to cross-marketing" is **not** consent to all four. A
> subsidiary that was not ticked may not receive the data and may not run the campaign.

## 5. Version differences

| Version | In use from | Difference |
|---|---|---|
| V3 | January 2024 | Product scope split only into "general products" and "investment products" |
| **V4** | **January 2026** | Product scope split into four classes (DEP / INS / INV / LOAN); recipient entities ticked individually |

"General products" under V3 maps to DEP + INS + LOAN under V4. It **does not include INV**.

## 6. Withdrawal

1. A customer may withdraw consent at any time, in writing or electronically. **Once
   withdrawn, no further marketing.**
2. Withdrawals are recorded in the Opt-Out Register, dated by **date of withdrawal**.
3. Where the withdrawal date falls **before the campaign execution date**, the customer
   must not be included.
4. Withdrawal is **absolute**. It is not qualified by product class or by subsidiary.

## 7. How to check a list

1. Is there consent at all? (No → exclude.)
2. Where there is, test all three dimensions. (Any failure → exclude.)
3. Cross-check the Opt-Out Register. (Withdrawn → exclude.)
4. **Mind the overlap when you count**: one customer may fail more than one test, so a
   breakdown by reason must not double-count.
