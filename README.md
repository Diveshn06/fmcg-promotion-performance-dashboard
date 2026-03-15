# FMCG Promotion Performance Dashboard

## Project Overview
This project analyzes promotional campaigns conducted by AtliQ Mart across multiple stores during festive seasons.  
The objective is to identify which promotional strategies generated the highest revenue and units sold.

The dashboard helps business stakeholders evaluate the performance of promotional campaigns and make data-driven decisions.

---

## Tools & Technologies Used
- Power BI
- SQL
- DAX
- Data Modeling
- Business Intelligence

---

## Business Problem
Retail companies frequently run promotional campaigns to increase sales. However, it is difficult to determine which promotion types actually generate incremental revenue and improve product sales.

This project analyzes promotional campaign data to identify high-performing campaigns and provide actionable insights for business teams.

---

## Business Questions Answered

1. Which promotional campaigns generated the highest revenue?
2. Which stores contributed the most to incremental sales?
3. Which product categories benefited most from promotions?
4. Which promotion type drove maximum units sold?
5. How did festive campaigns perform across different regions?

---

## Data Model

This project follows a **Star Schema Data Model** for efficient analytics.

Fact Table:
- fact_events

Dimension Tables:
- dim_products
- dim_stores
- dim_campaigns

The fact table captures promotional events and connects with dimension tables to analyze product, store and campaign performance.

---

## SQL Analysis

SQL was used to explore the dataset and answer key business questions such as:

- Which promotion generated the highest revenue
- Which product categories performed best
- Which stores generated the most incremental sales
- Which campaigns drove maximum unit sales

All SQL queries used for analysis are available in the **sql folder**.

---

## Dashboard Features

- Campaign performance tracking
- Store-level sales analysis
- Promotion type comparison
- Revenue and unit sales insights
- Interactive filters and drill-through analysis

---

## Key Insights

- Cashback promotions generated the highest incremental revenue
- BOGOF promotions drove the highest unit sales
- 25% discount campaigns negatively impacted revenue
- Diwali campaigns outperformed Sankranti across categories

---

## Dashboard Preview

### Promotion Performance Overview
![Dashboard](images/Screenshot%202026-02-10%20204155.png)

### Revenue and Campaign Insights
![Dashboard](images/Screenshot%202026-02-10%20204212.png)

### Store Performance Analysis
![Dashboard](images/Screenshot%202026-02-10%20204229.png)

### Product Category Performance
![Dashboard](images/Screenshot%202026-02-10%20204249.png)

---

## Project Structure
