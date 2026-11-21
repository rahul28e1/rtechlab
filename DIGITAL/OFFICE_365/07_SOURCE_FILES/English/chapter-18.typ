#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#059669"))[PART 2: MICROSOFT EXCEL 365 ENTERPRISE MASTERY · CHAPTER 18]
= Date, Time, Financial Engineering & Advanced Statistical Analysis

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Date and time handling, statutory financial amortization, capital budgeting (NPV/IRR), and empirical statistical analysis form the backbone of corporate decision-making. Excel's serial number engine and advanced financial algorithms guarantee mathematical precision across global multi-currency operations.
]

#v(2pt)

== 18.1 The Excel Serial Date & Time Representation Architecture

Underneath all user formatting, Excel treats dates strictly as sequential positive integers and times as fractional decimals:
- *Serial Base System*: Day `1` corresponds precisely to `January 1, 1900`.
- Every subsequent calendar day increments the integer by `1`. For example, `January 1, 2027` is stored internally as integer `46388`.
- *Time as Decimals*: A standard 24-hour day equals `1.0`. Therefore:
  - `6:00 AM` = 6 / 24 = `0.25`
  - `12:00 PM (Noon)` = 12 / 24 = `0.50`
  - `6:00 PM` = 18 / 24 = `0.75`
- A compound timestamp like `2027-01-01 12:00 PM` is represented internally as floating-point `46388.50`.

#v(2pt)
#formula-specimen(title: "CURRENT DYNAMIC TIMESTAMPS", formula: "=TODAY() [Volatile Date]   |   =NOW() [Volatile Date + Time]", note: "Recalculates dynamically every time the workbook is computed or any cell value changes.")
#v(2pt)

== 18.2 Date & Time Decomposition & Assembly: YEAR, MONTH, DAY, DATE

- `=YEAR(date)`: Returns the 4-digit integer year (e.g., `2027`).
- `=MONTH(date)`: Returns integer month (1 for January to 12 for December).
- `=DAY(date)`: Returns day of the month (1 to 31).
- `=HOUR(time)`, `=MINUTE(time)`, `=SECOND(time)`: Extract temporal components.
- *Safe Date Assembly*: Never write dates as text strings like `"04/05/2027"` (which causes fatal bugs between US MM/DD and Indian/UK DD/MM OS regional formats). Always build dates programmatically using `=DATE(year, month, day)`:
  ```
  =DATE(2027, 4, 15)
  ```

#table(
  columns: (1.2fr, 2.5fr, 2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*Function*], [*Operational Syntax & Behavior*], [*Production Financial Use Case*]),
  [`=DATE(Y, M, D)`], [Constructs a serial date safely from integer tokens.], [Generating standardized contract start dates.],
  [`=TIME(H, M, S)`], [Constructs a serial time fraction safely.], [Calculating standard factory shift boundaries.],
  [`=WEEKDAY(dt, [type])`], [Returns 1-7 indicating day of week.], [Audit checks for unauthorized weekend transactions.],
  [`=ISOWEEKNUM(dt)`], [Returns ISO-8601 calendar week number (1-53).], [Enterprise supply chain batch tracking.]
)

#pagebreak()

== 18.3 The Secret DATEDIF Function: Exact Age & Tenure Calculations

The undocumented, yet universally supported, `=DATEDIF` function calculates the exact elapsed time between two dates across discrete units:

```
Syntax: =DATEDIF( start_date , end_date , "unit" )
```

#table(
  columns: (1fr, 1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Unit*], [*Interval Measured*], [*Operational Output Description*], [*Production Specimen*]),
  [`"Y"`], [Complete Years], [Total elapsed full years between dates.], [Employee completed service tenure.],
  [`"M"`], [Complete Months], [Total elapsed full months across the span.], [Loan amortization term elapsed.],
  [`"D"`], [Complete Days], [Total calendar elapsed days (identical to `end - start`).], [Project duration tally.],
  [`"YM"`], [Remaining Months], [Months remaining after subtracting complete years.], [Age calculation: Months component.],
  [`"MD"`], [Remaining Days], [Days remaining after subtracting complete months.], [Age calculation: Days component.]
)

#v(2pt)
#formula-specimen(title: "COMPREHENSIVE EMPLOYEE AGE / TENURE STRING", formula: "=DATEDIF(DOB, TODAY(), \"Y\") & \" Yrs, \" & DATEDIF(DOB, TODAY(), \"YM\") & \" Mos, \" & DATEDIF(DOB, TODAY(), \"MD\") & \" Days\"", note: "Outputs perfect Human Resources tenure string: '28 Yrs, 4 Mos, 12 Days'.")
#v(2pt)

== 18.4 Business Days & Project Scheduling: WORKDAY & NETWORKDAYS

Standard calendar arithmetic includes weekends. Corporate project management requires calculating working days only:
- `=NETWORKDAYS(start_date, end_date, [holidays])`: Computes net working days between dates, automatically excluding Saturdays and Sundays. Passing a range of declared public corporate holidays subtracts them from the total.
- `=NETWORKDAYS.INTL(start, end, [weekend], [holidays])`: Allows custom weekend configurations (e.g., Sunday-only weekends or Middle-East Friday/Saturday weekends).
- `=WORKDAY(start_date, days, [holidays])`: Takes a project start date and adds $N$ working days, returning the exact projected completion date.
- `=EDATE(start_date, months)`: Jumps exactly $N$ months into the future or past (essential for bond coupon dates or warranty expiration).
- `=EOMONTH(start_date, months)`: Calculates the exact last calendar day of the month (e.g. `=EOMONTH(TODAY(), 0)` returns the final day of the current billing cycle).

#pagebreak()

== 18.5 Enterprise Financial Engineering: Loan Amortization (PMT, IPMT, PPMT)

Corporate finance requires exact monthly installment calculations and loan schedule separation:
- `=PMT(rate, nper, pv, [fv], [type])`: Calculates the fixed periodic payment for an annuity or loan.
  - *Rate*: Interest rate per period (for annual rate $12\%$, monthly rate is `12% / 12` = `1%`).
  - *Nper*: Total number of payment periods (e.g., 5-year loan = `5 * 12` = `60` months).
  - *PV*: Present value / Principal amount (entered as positive or negative cash flow).
- `=IPMT(rate, per, nper, pv)`: Returns the *interest portion* of a specific payment period `per`.
- `=PPMT(rate, per, nper, pv)`: Returns the *principal repayment portion* of a specific payment period `per`.
- *Mathematical Identity*: `=PMT(...) = IPMT(...) + PPMT(...)` holds exactly for every single installment period.

#v(2pt)
#formula-specimen(title: "MONTHLY EMI FORMULA FOR RS. 10 LAKH CORPORATE LOAN", formula: "=PMT(9.5%/12, 5*12, -1000000)", note: "Outputs exact monthly EMI of Rs. 21,001.91 at 9.5% annual rate over 60 months.")
#v(2pt)

== 18.6 Capital Budgeting & Investment Valuation: NPV & IRR

When evaluating corporate capital projects, investments, or corporate acquisitions:
- `=NPV(discount_rate, value1, [value2], ...)`: Calculates Net Present Value based on discounted future cash inflows.
  - *Warning*: In Excel, `NPV` assumes the first cash flow arrives at period 1. The initial period 0 investment must be subtracted *outside* the function: `=NPV(rate, Year1:Year5) + Initial_Outlay_Yr0`.
- `=IRR(values, [guess])`: Calculates Internal Rate of Return where Net Present Value equals zero.

#table(
  columns: (1fr, 1.5fr, 1.5fr, 1.8fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 4pt, y: 2.5pt),
  table.header([*Period*], [*Project Alpha Cash Flow*], [*Discounted @ 10%*], [*Cumulative Position*]),
  [Year 0], [-₹10,00,000 (Capex)], [-₹10,00,000], [-₹10,00,000 (Initial Outlay)],
  [Year 1], [+₹3,00,000], [+₹2,72,727], [-₹7,27,273],
  [Year 2], [+₹4,00,000], [+₹3,30,579], [-₹3,96,694],
  [Year 3], [+₹5,00,000], [+₹3,75,657], [-₹21,037],
  [Year 4], [+₹4,00,000], [+₹2,73,205], [+₹2,52,168 (NPV = +₹2.52L, Accept!)]
)

#pagebreak()

== 18.7 Statistical Analysis: Variance, Standard Deviation & Normality

Executive decision-making relies on statistical validation of datasets:
- `=AVERAGE(range)` / `=MEDIAN(range)` / `=MODE.SNGL(range)`: Central tendency metrics.
- `=STDEV.S(range)`: Sample standard deviation (used when evaluating a sample of transactions).
- `=STDEV.P(range)`: Population standard deviation (used when measuring 100% of the complete dataset).
- `=VAR.S(range)` / `=VAR.P(range)`: Variance measurement of data dispersion.
- `=PERCENTILE.INC(range, k)`: Returns the $k$-th percentile (e.g. $k = 0.90$ reveals 90th percentile performance).
- `=CORREL(array1, array2)`: Computes Pearson correlation coefficient between two numeric variables (-1 to +1).

#v(2pt)

== 18.8 Evaluation Dashboard: Technical MCQs & Knowledge Check

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "What integer serial number represents January 1, 1900 in Excel?", ans: "Serial number 1.")
    #short-qa(num: 2, q: "Which DATEDIF unit code calculates remaining months excluding complete years?", ans: "\"YM\" unit code.")
    #short-qa(num: 3, q: "Why must initial year 0 outlay be added outside Excel's =NPV() function?", ans: "Because NPV assumes cash flows begin at period 1.")
    #short-qa(num: 4, q: "What is the mathematical relationship between PMT, IPMT, and PPMT?", ans: "PMT = IPMT + PPMT for every period.")
  ],
  [
    #mcq(num: 1, q: "In Excel's serial date system, what decimal value represents 12:00 PM (Noon)?", a: "0.12", b: "0.50", c: "12.0", d: "0.24", ans: "B", expl: "A 24-hour day equals 1.0; 12 hours is exactly half a day (0.50).")
    #mcq(num: 2, q: "Which function calculates project completion date after 45 business working days excluding weekends?", a: "=DATEADD", b: "=WORKDAY", c: "=EDATE", d: "=EOMONTH", ans: "B", expl: "=WORKDAY adds working business days skipping weekends and holidays.")
    #mcq(num: 3, q: "Which function calculates the principal repayment component of an EMI in month 12?", a: "=PMT", b: "=PPMT", c: "=IPMT", d: "=PV", ans: "B", expl: "PPMT extracts the exact principal repayment portion for period per.")
  ]
)

#v(2pt)

#spotlight-box("2027 CLOUD REAL-TIME MONTE CARLO RISK SIMULATIONS", [
  Excel 365 Enterprise integrates Python in Excel (`=PY`) and cloud Monte Carlo simulations. Financial analysts can simulate 10,000 project cash flow scenarios with stochastic interest rates and inflation variables in seconds, calculating probabilistic Value at Risk (VaR) without third-party legacy add-ins.
])
