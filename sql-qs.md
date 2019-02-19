## SQL Questions

These questions were developed using the basic schema from coderpad.io, all the questions are original, and developed for some tutoring sections I used to teach.



## 1.1 Coderpad Schema

```SQL
/*
CoderPad provides a basic SQL sandbox with the following schema.
You can also use commands like `show tables` and `desc employees`

employees                             projects
+---------------+---------+           +---------------+---------+
| id            | int     |<----+  +->| id            | int     |
| first_name    | varchar |     |  |  | title         | varchar |
| last_name     | varchar |     |  |  | start_date    | date    |
| salary        | int     |     |  |  | end_date      | date    |
| department_id | int     |--+  |  |  | budget        | int     |
+---------------+---------+  |  |  |  +---------------+---------+
                             |  |  |
departments                  |  |  |  employees_projects
+---------------+---------+  |  |  |  +---------------+---------+
| id            | int     |<-+  |  +--| project_id    | int     |
| name          | varchar |     +-----| employee_id   | int     |
+---------------+---------+           +---------------+---------+


+------------------+---------------+
| product_id       | int(11)       |
| store_id         | int(11)       |
| customer_id      | int(11)       |
| promotion_id     | int(11)       |
| store_sales      | decimal(10,4) |
| store_cost       | decimal(10,4) |
| units_sold       | decimal(10,4) |
| transaction_date | date          |
+------------------+---------------+


*/

```
### 1.2 Questions

```python
# whats the average salary
# how many people per salary
# And how many people above 50k
# total sales
# total profit
# total profit excluding Promotions
# stores over xxx profit / under xxx profit
# tota units sold
# any products with no units sold
# histogram of units sold
# stores that sell less than 3 units for 80% or more of sales
# show project title, the number of unique departments represented
# What's the 2nd highest salary among employees
# which projects are over budget and by how much?
# who has the highest salary by department?
# Create a rolling sum of sales by day
# create a table of dates by
# whats the % of promoted sales vs. non -> by store? whats the most profitable by transaction?
# Which store has sold items for 7 consectutive days?
# What's the longest dat to tday streak a store has sold items?
# which tores sell both "tri-state" and "top measure" brands. (use SALES, PRODUCTS, tables)
# Who are the top 3 customers by education brand?
# give the common statistics of the customer's age. Are there outliers? How do you find them with SQL?
# Which product has the greatest diversity of customers (slightly open-ended)
# What's the sales by month?
# What's the change in sales by month?
# What's the change in sales by month?
# Which store has the most drops in sales month to month?
# WHich state has teh highestt expected sales fro next year?

# Salary - certain portion goes to 401k
# profile is for stores over 50k salary
# .70% Takehome
# .30%  401k

# profile is for stores under <50k Salary
# .60% Takehome
# .45%  401k
```

## 2. Schema 2

```
Given a Table as follows:

Posts
----
Id
User_Id
Post_type_id
Date
Content
Parent_Id


Post Type Id Table
----------
Id
Name
```