# Engineering Order Writing Standard (extract)

> Document owner: Engineering · Technical Services　|　ZV-ENG-P-0523　|　Revision 3.1

## 1. When an Engineering Order is required

On receipt of a manufacturer's Service Bulletin (SB), **do not simply reissue the
bulletin**. Determine which aircraft in our own fleet are affected, then raise an
Engineering Order (EO) covering those tails. Tails assessed as not affected must also
be recorded, with the reasoning, for audit.

## 2. Determining applicability — where this most often goes wrong

A Service Bulletin usually defines its scope using **two separate serial numbers**,
and both must be checked:

| Serial | What it defines | Does it change? |
|---|---|---|
| MSN | The build standard at delivery from the manufacturer | Fixed for life |
| Component S/N | The unit **actually installed right now** | Changes on replacement |

⚠️ **The deciding factor is the component serial number, not the MSN.** The MSN range
is written against the delivery build standard. Once an aircraft has had the
component replaced, the two decouple:

- MSN **outside** the range, but the installed component serial **inside** the
  affected range → **still applicable**
- MSN **inside** the range, but the modification kit has been embodied → **not
  applicable**

Both conditions must be checked. Reading the MSN alone misses every aircraft that
has had the part changed.

## 3. The six things an EO must contain

1. Source reference (bulletin number, revision, issue date)
2. **The list of applicable tails, with the reasoning for each** (MSN, modification
   status, installed component serial)
3. The list of tails assessed as not applicable, with the reason
4. Compliance deadline, derived from the bulletin, stating the date it runs from
5. Summary of work and estimated man-hours
6. Tests and records required on completion

## 4. Prohibited

- Do not write "applies to the whole fleet" or "comply per the bulletin" without
  listing tails.
- Do not omit the reasoning. An audit looks at the reasoning, not the conclusion.
- Do not relax or shorten the compliance period set by the bulletin.
- **Where a component change record has no serial number, do not infer applicability
  either way.** List it as outstanding and confirm it manually.

## 5. Numbering

Engineering Order number format: `ZV-EO-2610-<sequence>`. One bulletin, one EO.
