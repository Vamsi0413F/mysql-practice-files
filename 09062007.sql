mysql> create database shop;
Query OK, 1 row affected (0.003 sec)

mysql> use shop;
Database changed
mysql> select database();
+------------+
| database() |
+------------+
| shop       |
+------------+
1 row in set (0.000 sec)

mysql> CREATE TABLE customers (
    ->     id INT PRIMARY KEY AUTO_INCREMENT,
    ->     first_name VARCHAR(50),
    ->     last_name VARCHAR(50),
    ->     email VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.011 sec)

mysql>  
    -> CREATE TABLE orders (
    ->     id INT PRIMARY KEY AUTO_INCREMENT,
    ->     order_date DATE,
    ->     amount DECIMAL(8,2),
    ->     customer_id INT,
    ->     FOREIGN KEY (customer_id) REFERENCES customers(id)
    -> );
Query OK, 0 rows affected (0.007 sec)

mysql>  
    -> INSERT INTO customers (first_name, last_name, email) 
    -> VALUES ('Boy', 'George', 'george@gmail.com'),
    ->        ('George', 'Michael', 'gm@gmail.com'),
    ->        ('David', 'Bowie', 'david@gmail.com'),
    ->        ('Blue', 'Steele', 'blue@gmail.com'),
    ->        ('Bette', 'Davis', 'bette@aol.com');
Query OK, 5 rows affected (0.001 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>        
    ->        
    -> INSERT INTO orders (order_date, amount, customer_id)
    -> VALUES ('2016-02-10', 99.99, 1),
    ->        ('2017-11-11', 35.50, 1),
    ->        ('2014-12-12', 800.67, 2),
    ->        ('2015-01-03', 12.50, 2),
    ->        ('1999-04-11', 450.25, 5);
Query OK, 5 rows affected (0.003 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> DESC orders;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int          | NO   | PRI | NULL    | auto_increment |
| order_date  | date         | YES  |     | NULL    |                |
| amount      | decimal(8,2) | YES  |     | NULL    |                |
| customer_id | int          | YES  | MUL | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
4 rows in set (0.003 sec)

mysql> DESC customers;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| id         | int         | NO   | PRI | NULL    | auto_increment |
| first_name | varchar(50) | YES  |     | NULL    |                |
| last_name  | varchar(50) | YES  |     | NULL    |                |
| email      | varchar(50) | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
4 rows in set (0.002 sec)

mysql> select id from costemers where last_name = 'george';
ERROR 1146 (42S02): Table 'shop.costemers' doesn't exist
mysql> select id from customers  where last_name = 'george';
+----+
| id |
+----+
|  1 |
+----+
1 row in set (0.001 sec)

mysql> select * from orders where customers_id =1;
ERROR 1054 (42S22): Unknown column 'customers_id' in 'where clause'
mysql> select * from orders where id = 1;
+----+------------+--------+-------------+
| id | order_date | amount | customer_id |
+----+------------+--------+-------------+
|  1 | 2016-02-10 |  99.99 |           1 |
+----+------------+--------+-------------+
1 row in set (0.003 sec)

mysql> select * from orders;
+----+------------+--------+-------------+
| id | order_date | amount | customer_id |
+----+------------+--------+-------------+
|  1 | 2016-02-10 |  99.99 |           1 |
|  2 | 2017-11-11 |  35.50 |           1 |
|  3 | 2014-12-12 | 800.67 |           2 |
|  4 | 2015-01-03 |  12.50 |           2 |
|  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+--------+-------------+
5 rows in set (0.000 sec)

mysql> select * from customers;
+----+------------+-----------+------------------+
| id | first_name | last_name | email            |
+----+------------+-----------+------------------+
|  1 | Boy        | George    | george@gmail.com |
|  2 | George     | Michael   | gm@gmail.com     |
|  3 | David      | Bowie     | david@gmail.com  |
|  4 | Blue       | Steele    | blue@gmail.com   |
|  5 | Bette      | Davis     | bette@aol.com    |
+----+------------+-----------+------------------+
5 rows in set (0.000 sec)

mysql> select * from orders where custemer_id = 1;
ERROR 1054 (42S22): Unknown column 'custemer_id' in 'where clause'
mysql> select * from orders where customer_id=1;
+----+------------+--------+-------------+
| id | order_date | amount | customer_id |
+----+------------+--------+-------------+
|  1 | 2016-02-10 |  99.99 |           1 |
|  2 | 2017-11-11 |  35.50 |           1 |
+----+------------+--------+-------------+
2 rows in set (0.003 sec)

mysql> SELECT * From Orders where customer_id=(SELECT * from costemers where last_name ='george');
ERROR 1146 (42S02): Table 'shop.costemers' doesn't exist
mysql> SELECT * From Orders where customer_id=(SELECT * from customer  where last_name ='george');
ERROR 1146 (42S02): Table 'shop.customer' doesn't exist
mysql> SELECT * From Orders where customer_id=(SELECT * from customers  where last_name ='george');
ERROR 1241 (21000): Operand should contain 1 column(s)
mysql> SELECT * From Orders where customer_id=(SELECT id from customers  where last_name ='george');
+----+------------+--------+-------------+
| id | order_date | amount | customer_id |
+----+------------+--------+-------------+
|  1 | 2016-02-10 |  99.99 |           1 |
|  2 | 2017-11-11 |  35.50 |           1 |
+----+------------+--------+-------------+
2 rows in set (0.003 sec)

mysql> SELECT * FROM cosemers,orders;
ERROR 1146 (42S02): Table 'shop.cosemers' doesn't exist
mysql> SELECT * FROM costemers,orders;
ERROR 1146 (42S02): Table 'shop.costemers' doesn't exist
mysql> SELECT * FROM costomers,orders;
ERROR 1146 (42S02): Table 'shop.costomers' doesn't exist
mysql> SELECT * FROM customers,orders;
+----+------------+-----------+------------------+----+------------+--------+-------------+
| id | first_name | last_name | email            | id | order_date | amount | customer_id |
+----+------------+-----------+------------------+----+------------+--------+-------------+
|  5 | Bette      | Davis     | bette@aol.com    |  1 | 2016-02-10 |  99.99 |           1 |
|  4 | Blue       | Steele    | blue@gmail.com   |  1 | 2016-02-10 |  99.99 |           1 |
|  3 | David      | Bowie     | david@gmail.com  |  1 | 2016-02-10 |  99.99 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|  5 | Bette      | Davis     | bette@aol.com    |  2 | 2017-11-11 |  35.50 |           1 |
|  4 | Blue       | Steele    | blue@gmail.com   |  2 | 2017-11-11 |  35.50 |           1 |
|  3 | David      | Bowie     | david@gmail.com  |  2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  2 | 2017-11-11 |  35.50 |           1 |
|  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|  5 | Bette      | Davis     | bette@aol.com    |  3 | 2014-12-12 | 800.67 |           2 |
|  4 | Blue       | Steele    | blue@gmail.com   |  3 | 2014-12-12 | 800.67 |           2 |
|  3 | David      | Bowie     | david@gmail.com  |  3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|  1 | Boy        | George    | george@gmail.com |  3 | 2014-12-12 | 800.67 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |  4 | 2015-01-03 |  12.50 |           2 |
|  4 | Blue       | Steele    | blue@gmail.com   |  4 | 2015-01-03 |  12.50 |           2 |
|  3 | David      | Bowie     | david@gmail.com  |  4 | 2015-01-03 |  12.50 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|  1 | Boy        | George    | george@gmail.com |  4 | 2015-01-03 |  12.50 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
|  4 | Blue       | Steele    | blue@gmail.com   |  5 | 1999-04-11 | 450.25 |           5 |
|  3 | David      | Bowie     | david@gmail.com  |  5 | 1999-04-11 | 450.25 |           5 |
|  2 | George     | Michael   | gm@gmail.com     |  5 | 1999-04-11 | 450.25 |           5 |
|  1 | Boy        | George    | george@gmail.com |  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+-----------+------------------+----+------------+--------+-------------+
25 rows in set (0.001 sec)

mysql>  insert into orders(id,order_date,amount, customer_id) values(7,'11-11-2022',78.99,3);
ERROR 1292 (22007): Incorrect date value: '11-11-2022' for column 'order_date' at row 1
mysql>  insert into orders(id,order_date,amount, customer_id) values(7,'2022-11-11',78.99,3);
Query OK, 1 row affected (0.006 sec)

mysql> SELECT * FROM customers,orders;
+----+------------+-----------+------------------+----+------------+--------+-------------+
| id | first_name | last_name | email            | id | order_date | amount | customer_id |
+----+------------+-----------+------------------+----+------------+--------+-------------+
|  5 | Bette      | Davis     | bette@aol.com    |  1 | 2016-02-10 |  99.99 |           1 |
|  4 | Blue       | Steele    | blue@gmail.com   |  1 | 2016-02-10 |  99.99 |           1 |
|  3 | David      | Bowie     | david@gmail.com  |  1 | 2016-02-10 |  99.99 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|  5 | Bette      | Davis     | bette@aol.com    |  2 | 2017-11-11 |  35.50 |           1 |
|  4 | Blue       | Steele    | blue@gmail.com   |  2 | 2017-11-11 |  35.50 |           1 |
|  3 | David      | Bowie     | david@gmail.com  |  2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  2 | 2017-11-11 |  35.50 |           1 |
|  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|  5 | Bette      | Davis     | bette@aol.com    |  3 | 2014-12-12 | 800.67 |           2 |
|  4 | Blue       | Steele    | blue@gmail.com   |  3 | 2014-12-12 | 800.67 |           2 |
|  3 | David      | Bowie     | david@gmail.com  |  3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|  1 | Boy        | George    | george@gmail.com |  3 | 2014-12-12 | 800.67 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |  4 | 2015-01-03 |  12.50 |           2 |
|  4 | Blue       | Steele    | blue@gmail.com   |  4 | 2015-01-03 |  12.50 |           2 |
|  3 | David      | Bowie     | david@gmail.com  |  4 | 2015-01-03 |  12.50 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|  1 | Boy        | George    | george@gmail.com |  4 | 2015-01-03 |  12.50 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
|  4 | Blue       | Steele    | blue@gmail.com   |  5 | 1999-04-11 | 450.25 |           5 |
|  3 | David      | Bowie     | david@gmail.com  |  5 | 1999-04-11 | 450.25 |           5 |
|  2 | George     | Michael   | gm@gmail.com     |  5 | 1999-04-11 | 450.25 |           5 |
|  1 | Boy        | George    | george@gmail.com |  5 | 1999-04-11 | 450.25 |           5 |
|  5 | Bette      | Davis     | bette@aol.com    |  7 | 2022-11-11 |  78.99 |           3 |
|  4 | Blue       | Steele    | blue@gmail.com   |  7 | 2022-11-11 |  78.99 |           3 |
|  3 | David      | Bowie     | david@gmail.com  |  7 | 2022-11-11 |  78.99 |           3 |
|  2 | George     | Michael   | gm@gmail.com     |  7 | 2022-11-11 |  78.99 |           3 |
|  1 | Boy        | George    | george@gmail.com |  7 | 2022-11-11 |  78.99 |           3 |
+----+------------+-----------+------------------+----+------------+--------+-------------+
30 rows in set (0.001 sec)

mysql>  select *fram orders;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'fram orders' at line 1
mysql>  select * from orders;
+----+------------+--------+-------------+
| id | order_date | amount | customer_id |
+----+------------+--------+-------------+
|  1 | 2016-02-10 |  99.99 |           1 |
|  2 | 2017-11-11 |  35.50 |           1 |
|  3 | 2014-12-12 | 800.67 |           2 |
|  4 | 2015-01-03 |  12.50 |           2 |
|  5 | 1999-04-11 | 450.25 |           5 |
|  7 | 2022-11-11 |  78.99 |           3 |
+----+------------+--------+-------------+
6 rows in set (0.000 sec)

mysql> select * from customers;
+----+------------+-----------+------------------+
| id | first_name | last_name | email            |
+----+------------+-----------+------------------+
|  1 | Boy        | George    | george@gmail.com |
|  2 | George     | Michael   | gm@gmail.com     |
|  3 | David      | Bowie     | david@gmail.com  |
|  4 | Blue       | Steele    | blue@gmail.com   |
|  5 | Bette      | Davis     | bette@aol.com    |
+----+------------+-----------+------------------+
5 rows in set (0.000 sec)

mysql> SELECT * FROM customers 
    -> JOIN orders
    -> ON customers=customers_id;
ERROR 1054 (42S22): Unknown column 'customers' in 'on clause'
mysql> SELECT * FROM customers  JOIN orders ON customers=customer_id;
ERROR 1054 (42S22): Unknown column 'customers' in 'on clause'
mysql> SELECT * FROM customers  JOIN orders ON customers=orders.customer_id;
ERROR 1054 (42S22): Unknown column 'customers' in 'on clause'
mysql> SELECT * FROM customers  JOIN orders ON customers.id=orders.customer_id;
+----+------------+-----------+------------------+----+------------+--------+-------------+
| id | first_name | last_name | email            | id | order_date | amount | customer_id |
+----+------------+-----------+------------------+----+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
|  3 | David      | Bowie     | david@gmail.com  |  7 | 2022-11-11 |  78.99 |           3 |
+----+------------+-----------+------------------+----+------------+--------+-------------+
6 rows in set (0.001 sec)

mysql> SELECT * FROM customers JOIN orders ON customers.id=orders.customer_id;
+----+------------+-----------+------------------+----+------------+--------+-------------+
| id | first_name | last_name | email            | id | order_date | amount | customer_id |
+----+------------+-----------+------------------+----+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
|  3 | David      | Bowie     | david@gmail.com  |  7 | 2022-11-11 |  78.99 |           3 |
+----+------------+-----------+------------------+----+------------+--------+-------------+
6 rows in set (0.001 sec)

mysql> SELECT * FROM customers JOIN orders,customers  ON customers.id=orders.customer_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ON customers.id=orders.customer_id' at line 1
mysql> SELECT * FROM orders JOIN customers  ON customers.id=orders.customer_id;
+----+------------+--------+-------------+----+------------+-----------+------------------+
| id | order_date | amount | customer_id | id | first_name | last_name | email            |
+----+------------+--------+-------------+----+------------+-----------+------------------+
|  1 | 2016-02-10 |  99.99 |           1 |  1 | Boy        | George    | george@gmail.com |
|  2 | 2017-11-11 |  35.50 |           1 |  1 | Boy        | George    | george@gmail.com |
|  3 | 2014-12-12 | 800.67 |           2 |  2 | George     | Michael   | gm@gmail.com     |
|  4 | 2015-01-03 |  12.50 |           2 |  2 | George     | Michael   | gm@gmail.com     |
|  5 | 1999-04-11 | 450.25 |           5 |  5 | Bette      | Davis     | bette@aol.com    |
|  7 | 2022-11-11 |  78.99 |           3 |  3 | David      | Bowie     | david@gmail.com  |
+----+------------+--------+-------------+----+------------+-----------+------------------+
6 rows in set (0.001 sec)

mysql> SELECT * FROM orders JOIN customers  ON customers.id=orders.customer_id group by email;;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'shop.orders.id' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
ERROR: 
No query specified

mysql> SELECT * FROM orders JOIN customers  ON customers.id=orders.customer_id group by email;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'shop.orders.id' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT email,* FROM orders JOIN customers  ON customers.id=orders.customer_id group by email;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '* FROM orders JOIN customers  ON customers.id=orders.customer_id group by email' at line 1
mysql> SELECT email,count(*) FROM orders JOIN customers  ON customers.id=orders.customer_id group by email;
+------------------+----------+
| email            | count(*) |
+------------------+----------+
| george@gmail.com |        2 |
| gm@gmail.com     |        2 |
| david@gmail.com  |        1 |
| bette@aol.com    |        1 |
+------------------+----------+
4 rows in set (0.004 sec)

mysql> SELECT email, orders.id
    -> FROM orders
    -> JOIN customers
    -> ON customers.id = orders.customer_id
    -> GROUP BY email, orders.id;
+------------------+----+
| email            | id |
+------------------+----+
| george@gmail.com |  1 |
| george@gmail.com |  2 |
| gm@gmail.com     |  3 |
| gm@gmail.com     |  4 |
| david@gmail.com  |  7 |
| bette@aol.com    |  5 |
+------------------+----+
6 rows in set (0.001 sec)

mysql> SELECT | id | order_date | amount | customer_id | id | first_name | last_name | email            |
    -> SELECT | id | order_date | amount | customer_id | id | first_name | last_name | email            |;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '| id | order_date | amount | customer_id | id | first_name | last_name | email  ' at line 1
mysql> SELECT id,order_date,amount,customer_id,id,first_name,last_name,email     
    -> FROM orders
    -> JOIN customers
    -> ON customers.id = orders.customer_id
    -> GROUP BY email;
ERROR 1052 (23000): Column 'id' in field list is ambiguous
mysql> SELECT id,order_date,amount,customer_id,id,first_name,last_name,email     
    ->     -> FROM orders
    ->     -> JOIN customers
    ->     -> ON customers.id = orders.customer_id
    ->     -> GROUP BY amount;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FROM orders
    -> JOIN customers
    -> ON customers.id = orders.customer_id
  ' at line 2
mysql> SELECT id,order_date,amount,customer_id,id,first_name,last_name,email    
    -> FROM orders
    -> JOIN customers
    ->  ON customers.id = orders.customer_id
    ->  GROUP BY amount;
ERROR 1052 (23000): Column 'id' in field list is ambiguous
mysql> SELECT * FROM orders
    -> JOIN customers
    ->  ON customers.id = orders.customer_id
    ->  GROUP BY amount;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'shop.orders.id' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT 
    ->     first_name, last_name, SUM(amount) AS total
    -> FROM
    ->     customers
    ->         JOIN
    ->     orders ON orders.customer_id = customers.id
    -> GROUP BY first_name , last_name
    -> ORDER BY total;
+------------+-----------+--------+
| first_name | last_name | total  |
+------------+-----------+--------+
| David      | Bowie     |  78.99 |
| Boy        | George    | 135.49 |
| Bette      | Davis     | 450.25 |
| George     | Michael   | 813.17 |
+------------+-----------+--------+
4 rows in set (0.001 sec)

mysql> SELECT      first_name, last_name, SUM(amount) AS total FROM     customers  LEFT  JOIN     orders ON orders.customer_id = customers.id GROUP BY first_name , last_name ORDER BY total;
+------------+-----------+--------+
| first_name | last_name | total  |
+------------+-----------+--------+
| Blue       | Steele    |   NULL |
| David      | Bowie     |  78.99 |
| Boy        | George    | 135.49 |
| Bette      | Davis     | 450.25 |
| George     | Michael   | 813.17 |
+------------+-----------+--------+
5 rows in set (0.001 sec)

mysql> SELECT      first_name, last_name, SUM(amount) AS total FROM     customers  RIGHT JOIN     orders ON orders.customer_id = customers.id GROUP BY first_name , last_name ORDER BY total;
+------------+-----------+--------+
| first_name | last_name | total  |
+------------+-----------+--------+
| David      | Bowie     |  78.99 |
| Boy        | George    | 135.49 |
| Bette      | Davis     | 450.25 |
| George     | Michael   | 813.17 |
+------------+-----------+--------+
4 rows in set (0.001 sec)

mysql> SELECT      first_name, last_name, SUM(amount) AS total FROM     customers INNER LEFT  JOIN     orders ON orders.customer_id = customers.id GROUP BY first_name , last_name ORDER BY total;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'LEFT  JOIN     orders ON orders.customer_id = customers.id GROUP BY first_name ,' at line 1
mysql> SELECT * FROM orders    JOIN customers  ON customers.id = orders.customer_id  GROUP BY amount;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'shop.orders.id' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT * FROM orders    JOIN customers  ON customers.id = orders.customer_id  GROUP BY amount;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'shop.orders.id' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT 
    ->     first_name, last_name, order_date, amount
    -> FROM
    ->     customers
    ->         LEFT JOIN
    ->     orders ON orders.customer_id = customers.id;
+------------+-----------+------------+--------+
| first_name | last_name | order_date | amount |
+------------+-----------+------------+--------+
| Boy        | George    | 2016-02-10 |  99.99 |
| Boy        | George    | 2017-11-11 |  35.50 |
| George     | Michael   | 2014-12-12 | 800.67 |
| George     | Michael   | 2015-01-03 |  12.50 |
| David      | Bowie     | 2022-11-11 |  78.99 |
| Blue       | Steele    | NULL       |   NULL |
| Bette      | Davis     | 1999-04-11 | 450.25 |
+------------+-----------+------------+--------+
7 rows in set (0.001 sec)

mysql>  
    ->  
    -> SELECT 
    ->     order_date, amount, first_name, last_name
    -> FROM
    ->     orders
    ->         LEFT JOIN
    ->     customers ON orders.customer_id = customers.id;
+------------+--------+------------+-----------+
| order_date | amount | first_name | last_name |
+------------+--------+------------+-----------+
| 2016-02-10 |  99.99 | Boy        | George    |
| 2017-11-11 |  35.50 | Boy        | George    |
| 2014-12-12 | 800.67 | George     | Michael   |
| 2015-01-03 |  12.50 | George     | Michael   |
| 1999-04-11 | 450.25 | Bette      | Davis     |
| 2022-11-11 |  78.99 | David      | Bowie     |
+------------+--------+------------+-----------+
6 rows in set (0.000 sec)

mysql> SELECT 
    ->     first_name, 
    ->     last_name, 
    ->     IFNULL(SUM(amount), 0) AS money_spent
    -> FROM
    ->     customers
    ->         LEFT JOIN
    ->     orders ON customers.id = orders.customer_id
    -> GROUP BY first_name , last_name;
+------------+-----------+-------------+
| first_name | last_name | money_spent |
+------------+-----------+-------------+
| Boy        | George    |      135.49 |
| George     | Michael   |      813.17 |
| David      | Bowie     |       78.99 |
| Blue       | Steele    |        0.00 |
| Bette      | Davis     |      450.25 |
+------------+-----------+-------------+
5 rows in set (0.005 sec)

mysql> SELECT      first_name,      last_name,      IFNULL(SUM(amount), 0) AS money_spent FROM     customers         LEFT JOIN     orders ON customers.id = orders.customer_id GROUP BY sum;
ERROR 1054 (42S22): Unknown column 'sum' in 'group statement'
mysql> SELECT      first_name,      last_name,      IFNULL(SUM(amount), 0) AS money_spent FROM     customers         LEFT JOIN     orders ON customers.id = orders.customer_id GROUP BY money_spent;
ERROR 1056 (42000): Can't group on 'money_spent'
mysql> SELECT      first_name,      last_name,      IFNULL(SUM(amount), 0) AS money_spent FROM     customers         LEFT JOIN     orders ON customers.id = orders.customer_id GROUP BY money_spent;
ERROR 1056 (42000): Can't group on 'money_spent'
mysql> SELECT 
    ->     first_name, last_name, order_date, amount
    -> FROM
    ->     customers
    ->         RIGHT JOIN
    ->     orders ON customers.id = orders.customer_id;
+------------+-----------+------------+--------+
| first_name | last_name | order_date | amount |
+------------+-----------+------------+--------+
| Boy        | George    | 2016-02-10 |  99.99 |
| Boy        | George    | 2017-11-11 |  35.50 |
| George     | Michael   | 2014-12-12 | 800.67 |
| George     | Michael   | 2015-01-03 |  12.50 |
| Bette      | Davis     | 1999-04-11 | 450.25 |
| David      | Bowie     | 2022-11-11 |  78.99 |
+------------+-----------+------------+--------+
6 rows in set (0.000 sec)

mysql> REATE TABLE students (
    ->     id INT PRIMARY KEY AUTO_INCREMENT,
    ->     first_name VARCHAR(50)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'REATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VAR' at line 1
mysql>  
    ->  
    -> CREATE TABLE papers (
    ->     title VARCHAR(50),
    ->     grade INT,
    ->     student_id INT,
    ->     FOREIGN KEY (student_id)
    ->         REFERENCES students (id)
    -> );
ERROR 1824 (HY000): Failed to open the referenced table 'students'
mysql>  
    ->  
    -> SELECT 
    ->     first_name, title, grade
    -> FROM
    ->     students
    ->         JOIN
    ->     papers ON papers.student_id = students.id
    -> ORDER BY grade DESC;
ERROR 1146 (42S02): Table 'shop.students' doesn't exist
mysql>  
    ->  
    ->  
    -> SELECT 
    ->     first_name, title, grade
    -> FROM
    ->     students
    ->         LEFT JOIN
    ->     papers ON papers.student_id = students.id;
ERROR 1146 (42S02): Table 'shop.students' doesn't exist
mysql>  
    ->  
    ->  
    -> SELECT 
    ->     first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0)
    -> FROM
    ->     students
    ->         LEFT JOIN
    ->     papers ON papers.student_id = students.id;
ERROR 1146 (42S02): Table 'shop.students' doesn't exist
mysql>  
    ->  
    ->  
    -> SELECT 
    ->     first_name, IFNULL(AVG(grade), 0) AS average
    -> FROM
    ->     students
    ->         LEFT JOIN
    ->     papers ON students.id = papers.student_id
    -> GROUP BY first_name
    -> ORDER BY average DESC;
ERROR 1146 (42S02): Table 'shop.students' doesn't exist
mysql>  
    ->  
    ->  
    -> SELECT 
    ->     first_name,
    ->     IFNULL(AVG(grade), 0) AS average,
    ->     CASE
    ->         WHEN IFNULL(AVG(grade), 0) >= 75 THEN 'passing'
    ->         ELSE 'failing'
    ->     END AS passing_status
    -> FROM
    ->     students
    ->         LEFT JOIN
    ->     papers ON students.id = papers.student_id
    -> GROUP BY first_name
    -> ORDER BY average DESC;
ERROR 1146 (42S02): Table 'shop.students' doesn't exist
mysql> 
mysql> 
mysql> 
