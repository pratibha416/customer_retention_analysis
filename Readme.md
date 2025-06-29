# 📊 Customer Retention Analysis Dashboard

This project provides a complete analysis of customer churn and retention using **SQL**, **Power BI**, and **CSV data exports**. It calculates churn rates, retention rates, lifetime value, and more, visualized in an interactive dashboard.

---

## 📁 Project Structure

customer-retention-analysis/
│
├── churn_analysis.pbix ← Power BI dashboard file
├── dashboard-report.pdf ← PDF version of the dashboard
│
├── csv/ ← Data files used in Power BI
│ ├── churn_by_month.csv
│ ├── cltv_by_channel.csv
│ ├── customer_summary.csv
│ └── retention_by_channel.csv
│
├── sql/ ← SQL logic used to generate the CSVs
│ ├── churn_by_month.sql
│ ├── cltv_by_channel.sql
│ ├── customer_summary.sql
│ └── retention_by_channel.sql
---

## 📈 Dashboard Metrics & KPIs

- **Churn Rate by Signup Month** (e.g. Jan–May 2025)
- **Customer Lifetime Value (CLTV)** by acquisition channel
- **Customer Summary Table**: revenue, orders, avg. order value, lifetime
- **Retention Rate by Channel**

---
## 🗃️ Datasets and Tables Used

| Table Name | Description |
|------------|-------------|
| `customers` | Customer details including `customer_id`, `signup_date`, and acquisition `channel` |
| `orders` | Order transactions with `order_id`, `customer_id`, `order_amount`, and `order_date` |
| `logins` | Login activity with `customer_id` and `login_date` |

> These tables power the SQL logic for churn analysis and were used to generate the `.csv` files.
## 🛠 Tools Used

- **SQL (MySQL)**: For churn detection, LTV, retention queries
- **Power BI**: Interactive dashboard and visuals
- **CSV (Excel)**: Data transport layer for Power BI
- **GitHub**: Version control and publishing

---

## 📄 Dashboard Preview

📎 [Download Full Report](dashboard-report.pdf)

---

## 🧠 How to Use

1. Clone or download this repository
2. Open `.pbix` in Power BI Desktop
3. Load `.csv` files from the `csv/` folder
4. Use `.sql` files to regenerate data from your database

---

## 📫 Contact

For questions, improvements, or collaborations — feel free to reach out on [LinkedIn](https://linkedin.com).
