# Multi Currency Revenue Reporter

## Objective

This project converts hotel booking revenue from INR to USD using a live exchange-rate API and analyzes revenue trends across currencies.

The goal is to demonstrate data extraction, API integration, currency conversion, and business reporting capabilities.

---

## Business Problem

Revenue is recorded in INR, but business stakeholders often require reporting in international currencies for financial analysis and decision-making.

This project automates the conversion process and provides comparative revenue visualizations.

---

## Technologies Used

- Python
- Pandas
- Requests
- Matplotlib
- Frankfurter Exchange Rate API

---

## Project Files

- multi_currency_reporter.ipynb
- README.md
- insight.md
- ai_usage_note.md

---

## Workflow

1. Load hotel booking dataset.
2. Aggregate monthly revenue in INR.
3. Fetch current INR → USD exchange rate using API.
4. Convert revenue values.
5. Generate comparative visualizations.
6. Produce business insights.

---

## How To Run

1. Open `multi_currency_reporter.ipynb`
2. Install required libraries:

```bash
pip install pandas requests matplotlib