# Organizational-Insights-with-SQL

# 📊 SQL Project: Organization Database

This project demonstrates fundamental to advanced SQL operations using a simulated **Organization Database**. The database includes three core tables: `Worker`, `Title`, and `Bonus`. The project consists of **50+ SQL queries** that cover a wide range of operations such as data retrieval, aggregation, filtering, joins, subqueries, and string/date functions.

---

## 📁 Tables Used

- **Worker**  
  Columns: `worker_id`, `first_name`, `last_name`, `salary`, `joining_date`, `department`

- **Title**  
  Columns: `worker_ref_id`, `worker_title`, `affected_from`

- **Bonus**  
  Columns: `worker_ref_id`, `bonus_amount`, `bonus_date`

---

## 🛠 Technologies

- SQL (MySQL syntax)
- MySQL workbench 8.0 CE
- Relational Database concepts

---

## 🧠 Key Learning Areas

- Alias and string functions (`AS`, `UPPER`, `SUBSTRING`, `REPLACE`, `LTRIM`, `RTRIM`)
- Aggregate functions (`COUNT`, `SUM`, `MAX`, `MIN`)
- Conditional filtering (`LIKE`, `IN`, `BETWEEN`)
- Joins (`INNER JOIN`, `LEFT JOIN`)
- Date and time queries
- Advanced queries (Nth highest salary, duplicate records, correlated subqueries)
- Table cloning, union, and set operations

---

## 📌 Sample Queries Included

| #   | Query Description |
|-----|-------------------|
| 1   | Fetch `FIRST_NAME` using alias `<WORKER_NAME>` |
| 3   | Fetch unique values of `DEPARTMENT` |
| 10  | Concatenate `FIRST_NAME` and `LAST_NAME` into `COMPLETE_NAME` |
| 20  | Workers who joined in February 2014 |
| 24  | Workers who are also Managers |
| 33  | Nth (e.g., 5th) highest salary |
| 45  | Employee(s) with the highest salary in each department |
| 48  | Nth maximum salary using correlated subquery |
| 50  | Name(s) of worker(s) earning the highest salary |

> A full list of **50+ queries** is provided in the SQL script in this repository.

---

## 📂 Folder Structure

Organizational-Insights-with-SQL/

├── Organizational-Insights-with-SQL.sql

└── README.md

