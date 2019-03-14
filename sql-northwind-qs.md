## SQL Questions

These questions were developed for the attached northwind database. This can be run on any computer that has docker installed on it


![https://ras-blogdb.restdb.io/media/594a33ce72b4cf350000130d](https://ras-blogdb.restdb.io/media/594a33ce72b4cf350000130d)

### Basic Questions

```sql
/*
What sales order has the most distinct items?
*/
SELECT * FROM orders;
```


```sql
/*
How many employees were born after Jan 21 1960?
*/
SELECT * FROM employees;


```


### Advanced Questions


```sql
/*
What is the 2nd largest (by dollar amount) order from each city?
*/

SELECT * FROM orders;
```

```sql
/*
How many days was more than 1 person hired? 
*/

SELECT * FROM employees;
```