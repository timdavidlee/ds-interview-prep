## SQL Questions

These questions were developed using the basic schema from coderpad.io, all the questions are original, and developed for some tutoring sections I used to teach.


- Please explain the difference between the different types of joins `LEFT`, `RIGHT`, `OUTER` , `INNER`, and `CROSS`.


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


+-----------------------------------------------------+
|Id   |User_Id|Post_type_id|Date    |Content|Parent_id|
+-----------------------------------------------------+
|10001|1      |1           |1/1/2017|~      |         |
|10002|2      |1           |1/1/2017|~      |         |
|10003|3      |2           |1/2/2017|~      |10001    |
+-----------------------------------------------------+
```

### 2.1 Questions

```
Question 1: How to get total posts by type?
Question 2: How would you make a histogram of posts?
Question 3: Write a query to delete duplicate rows in the posting table
Question 4: How would you find popular posts?
Question 4: how would you identify users that excessively comment on their own posts? 
Question 5: How to determine the most popular posts?
Question 6: How would you profile user activity? How would you compare similar users?
```

## 3. Social Media

### 3.1 Given an activity table

```
+-------------------------------------------------------+
|Id   |User_Id|Event_type_id|Date    |Parent_id|Duration|
+-------------------------------------------------------+
|10001|1      |1            |1/1/2017|         |        |
|10002|2      |1            |1/1/2017|         |        |
|10003|3      |2            |1/2/2017|10001    |        |
+-------------------------------------------------------+

+----------------+
|id   |Event_name|
+----------------+
|1    |View ad   |
|2    |Click     |
|3    |Download  |
|4    |Usage     |
+----------------+

```

### 3.2 Questions

```
1. How many of each type of event is there?
2. How would you determine the biggest (event) barrier to installation?
3. Considering real-life user behavior (with ads), how would you determine the % ad conversion? (% of ads that lead to clicks?
4. What can go wrong in the installation processes? Name 2 How would you write a query to check each of those 2 testsf
5. Whats the breakdown of view→ click / per day?
6. Biggest obstacle in funnel
7. How to tell if funnel is broken
```

## 4 Warehouse


### 4.1 Schema

```
Given a Orders and Inventory Table:

Orders
-------------
Id
line_id
Product_id
Quantity
Date
Customers_id
Sales_price

Inventory (stocking and shipment)
-------------
Id
Product_id
Quantity
Date
Transaction_type

Product_Table
-------------
Id
Name
List_price
```

### 4.2 Questions

```
1. Which month is the busiest for sales?
2. How would you determine if there is enough inventory to ship an order on specific date?
3. How would you identify products sold at a loss?
4. How would you identify Customers getting preferential discounts?
```

## 5 Shipping Company

### 5.1 Schema

```
Given a Customer Table
--------------
Id 
Customer_Name
Creation_date
Update_date
Industry

Sales Table
--------------
Id
Invoice
Date
Product_id
Customer_id
Units
Price
```

### 5.2 Questions

```
1. How would you get a distinct list of customers?
2. Given that customers change, how would you generate “total sales per customer”?
3. How would you check to ensure customers are not double charged?
4. How would you identify which customers bought the largest variety of products?
5. Think of a way of categorizing your customers
```

## 6 Real Estate Company

### 6.1 Schema

```
Given a Posting Table
----------------------
Id
User_id
Date
Building_ID
Asking price
Region_id

Building Table
----------------------
Id
Building_type
Bedroom
Sqft
Pool
Yard
Lot size


Sales Table
----------------------
Id
User_id
Post_id
Date
Offer_price
Closed
Final_offer

```

### 6.2 Questions

```
1. How would you find total posts?
2. What region has the most posts?
3. Which building type has the highest average asking price?
4. What whats the average asking price of having a pool vs. not?
5. Show me posts with no offers
6. Average offer price per bedroom?
7. How would you find out most dense region of posts?
8. What other features would be good to know? 
9. A user might be trying to generate more activity for his own benefit (how would you find this fraud)
```