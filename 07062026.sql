mysql> CREATE TABLE contacts (
    -> name VARCHAR(100) NOT NULL,
    ->     phone VARCHAR(15) NOT NULL UNIQUE
    -> );
ERROR 1050 (42S01): Table 'contacts' already exists
mysql>  
    -> INSERT INTO contacts (name, phone)
    -> VALUES ('billybob', '8781213455');
ERROR 1062 (23000): Duplicate entry '8781213455' for key 'contacts.phone'
mysql>  
    -> -- This insert would result in an error:
    -> INSERT INTO contacts (name, phone)
    -> VALUES ('billybob', '8781213455');
ERROR 1062 (23000): Duplicate entry '8781213455' for key 'contacts.phone'
mysql> 
mysql> select * from contacts;
+----------+------------+
| name     | phone      |
+----------+------------+
| billybob | 8781213455 |
+----------+------------+
1 row in set (0.000 sec)

mysql>  create table palindrome
    -> ( name VARCHAR(100) check(name=reverse(name)));
Query OK, 0 rows affected (0.009 sec)

mysql> INSERT INTO palindrome(name) VALUES(hiih);
ERROR 1054 (42S22): Unknown column 'hiih' in 'field list'
mysql> INSERT INTO palindrome(name) VALUES('hiih');
Query OK, 1 row affected (0.001 sec)

mysql> INSERT INTO palindrome(name) VALUES('hidfih');
ERROR 3819 (HY000): Check constraint 'palindrome_chk_1' is violated.
mysql> select * from palindrome;
+------+
| name |
+------+
| hiih |
+------+
1 row in set (0.000 sec)

mysql> create table ages 
    -> (name VARCHAR(30) NOT NULL ,
    ->  age INT,
    ->  CONSTRAINT major CHECK(age>18));
Query OK, 0 rows affected (0.007 sec)

mysql> INSERT INTO ages(name,age) VALUES('vamsi',19);
Query OK, 1 row affected (0.002 sec)

mysql> INSERT INTO ages(name,age) VALUES('karthikeya',12);
ERROR 3819 (HY000): Check constraint 'major' is violated.
mysql> CREATE TABLE contacts (
    -> name VARCHAR(100) NOT NULL,
    ->     phone VARCHAR(15) NOT NULL UNIQUE
    -> );
ERROR 1050 (42S01): Table 'contacts' already exists
mysql>  
    -> INSERT INTO contacts (name, phone)
    -> VALUES ('billybob', '8781213455');
ERROR 1062 (23000): Duplicate entry '8781213455' for key 'contacts.phone'
mysql>  
    -> -- This insert would result in an error:
    -> INSERT INTO contacts (name, phone)
    -> VALUES ('billybob', '8781213455');
ERROR 1062 (23000): Duplicate entry '8781213455' for key 'contacts.phone'
mysql> CREATE TABLE companies (
    ->     name VARCHAR(255) NOT NULL,
    ->     address VARCHAR(255) NOT NULL,
    ->     CONSTRAINT name_address UNIQUE (name , address)
    -> );
Query OK, 0 rows affected (0.005 sec)

mysql>  
    -> CREATE TABLE houses (
    ->   purchase_price INT NOT NULL,
    ->   sale_price INT NOT NULL,
    ->   CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
    -> );
Query OK, 0 rows affected (0.006 sec)

mysql> INSERT INTO houses VALUES(2000000000,3000000);
ERROR 3819 (HY000): Check constraint 'sprice_gt_pprice' is violated.
mysql> INSERT INTO houses VALUES(200000,3000000);
Query OK, 1 row affected (0.001 sec)

mysql> INSERT INTO companies VALUES(asb,123 oakwood);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'oakwood)' at line 1
mysql> INSERT INTO companies VALUES('asb','123 oakwood');
Query OK, 1 row affected (0.005 sec)

mysql> INSERT INTO companies VALUES('asbs','123 oakwood');
Query OK, 1 row affected (0.001 sec)

mysql> INSERT INTO companies VALUES('asbs','123 oakwod');
Query OK, 1 row affected (0.001 sec)

mysql> INSERT INTO companies VALUES('asbs','123 oakwood');
ERROR 1062 (23000): Duplicate entry 'asbs-123 oakwood' for key 'companies.name_address'
mysql> show tables;
+---------------------+
| Tables_in_book_shop |
+---------------------+
| ages                |
| books               |
| captions            |
| captions2           |
| companies           |
| contacts            |
| houses              |
| inventory           |
| palindrome          |
| people              |
| products            |
| tweets              |
+---------------------+
12 rows in set (0.002 sec)

mysql> select * from tables;
ERROR 1146 (42S02): Table 'book_shop.tables' doesn't exist
mysql> ALTER TABLE companies 
    -> ADD COLUMN phone VARCHAR(15);
Query OK, 0 rows affected (0.005 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>  
    -> ALTER TABLE companies
    -> ADD COLUMN employee_count INT NOT NULL DEFAULT 1;
Query OK, 0 rows affected (0.004 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from companies;;
+------+-------------+-------+----------------+
| name | address     | phone | employee_count |
+------+-------------+-------+----------------+
| asb  | 123 oakwood | NULL  |              1 |
| asbs | 123 oakwod  | NULL  |              1 |
| asbs | 123 oakwood | NULL  |              1 |
+------+-------------+-------+----------------+
3 rows in set (0.000 sec)

ERROR: 
No query specified

mysql> -- pphone column and employee count with default count as 1  is added 
Query OK, 0 rows affected (0.000 sec)

mysql> ALTER TABLE companies DROP COLUMN employee_count;
Query OK, 0 rows affected (0.006 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from companies;;
+------+-------------+-------+
| name | address     | phone |
+------+-------------+-------+
| asb  | 123 oakwood | NULL  |
| asbs | 123 oakwod  | NULL  |
| asbs | 123 oakwood | NULL  |
+------+-------------+-------+
3 rows in set (0.000 sec)

ERROR: 
No query specified

mysql> ALTER TABLE companies DROP COLUMN phone;
Query OK, 0 rows affected (0.007 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from companies;;
+------+-------------+
| name | address     |
+------+-------------+
| asb  | 123 oakwood |
| asbs | 123 oakwod  |
| asbs | 123 oakwood |
+------+-------------+
3 rows in set (0.000 sec)

ERROR: 
No query specified

mysql> -- pphone column and employee count with default count as 1  is dropped
Query OK, 0 rows affected (0.000 sec)

mysql> RENAME TABLE companies to suppliers;
Query OK, 0 rows affected (0.007 sec)

mysql> 
mysql> 
mysql> ALTER TABLE suppliers RENAME TO companies;
Query OK, 0 rows affected (0.004 sec)

mysql> 
mysql> 
mysql> ALTER TABLE companies
    -> RENAME COLUMN name TO company_name;
Query OK, 0 rows affected (0.006 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> selct * from companies;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'selct * from companies' at line 1
mysql> select * from companies;
+--------------+-------------+
| company_name | address     |
+--------------+-------------+
| asb          | 123 oakwood |
| asbs         | 123 oakwod  |
| asbs         | 123 oakwood |
+--------------+-------------+
3 rows in set (0.000 sec)

mysql> select * from suppliers;;
ERROR 1146 (42S02): Table 'book_shop.suppliers' doesn't exist
ERROR: 
No query specified

mysql> ALTER TABLE companies
    -> MODIFY company_name VARCHAR(100) DEFAULT 'unknown';
Query OK, 3 rows affected (0.013 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> 
mysql> 
mysql> ALTER TABLE suppliers
    -> CHANGE business biz_name VARCHAR(50);
ERROR 1146 (42S02): Table 'book_shop.suppliers' doesn't exist
mysql> select * from suppliers;
ERROR 1146 (42S02): Table 'book_shop.suppliers' doesn't exist
mysql> ALTER TABLE houses 
    -> ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);
Query OK, 1 row affected (0.015 sec)
Records: 1  Duplicates: 0  Warnings: 0

mysql> 
mysql> 
mysql> ALTER TABLE houses DROP CONSTRAINT positive_pprice;
Query OK, 0 rows affected (0.004 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> show tables
    -> ;
+---------------------+
| Tables_in_book_shop |
+---------------------+
| ages                |
| books               |
| captions            |
| captions2           |
| companies           |
| contacts            |
| houses              |
| inventory           |
| palindrome          |
| people              |
| products            |
| tweets              |
+---------------------+
12 rows in set (0.002 sec)

mysql> drop table nages,books,captions,captions2,companies,contacts,inventory,houses;
ERROR 1051 (42S02): Unknown table 'book_shop.nages'
mysql> drop table ages,books,captions,captions2,companies,contacts,inventory,houses;
Query OK, 0 rows affected (0.022 sec)

mysql> drop table palindrome,people,tweets,products;
Query OK, 0 rows affected (0.011 sec)

mysql> show tables;
Empty set (0.002 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| book_shop          |
| information_schema |
| mysql              |
| performance_schema |
| shirts_db          |
| sys                |
| vamsi              |
+--------------------+
7 rows in set (0.001 sec)

mysql> drop database book_shop;
Query OK, 0 rows affected (0.010 sec)

mysql> use shirts_db;
Database changed
mysql> show tables;
Empty set (0.002 sec)

mysql> drop shirts_db;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'shirts_db' at line 1
mysql> drop database shirts_db;
Query OK, 0 rows affected (0.004 sec)

mysql> use database; vamsi
ERROR 1049 (42000): Unknown database 'database'
    -> use database vamsi;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'vamsi
use database vamsi' at line 1
mysql> vamsi use database vamsi;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'vamsi use database vamsi' at line 1
mysql> 
mysql> use database vamsi;
ERROR 1049 (42000): Unknown database 'database'
mysql> use  vamsi;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> shot tables;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'shot tables' at line 1
mysql> show tables;
+-----------------+
| Tables_in_vamsi |
+-----------------+
| vamsi_friends   |
+-----------------+
1 row in set (0.002 sec)

mysql> SELECT * FROM vamsi_friends;
Empty set (0.004 sec)

mysql> drop database vamsi;;
Query OK, 1 row affected (0.005 sec)

ERROR: 
No query specified

mysql> drop database vamsi;
ERROR 1008 (HY000): Can't drop database 'vamsi'; database doesn't exist
mysql> select database();
+------------+
| database() |
+------------+
| NULL       |
+------------+
1 row in set (0.000 sec)

mysql> mysql> show databases;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'mysql> show databases' at line 1
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.001 sec)

mysql> 
