mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| movie_ratings      |
| mysql              |
| performance_schema |
| shop               |
| sys                |
+--------------------+
6 rows in set (0.001 sec)

mysql> use movie_ratings;
Database changed
mysql> show tables;
Empty set (0.002 sec)

mysql> create table reviewers(
    -> id primary key auto_increment,
    -> first_name VARCHAR(100) not null,
    -> last_name VARCHAR(100) not null);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'primary key auto_increment,
first_name VARCHAR(100) not null,
last_name VARCHAR(' at line 2
mysql> create table reviewers( id INT  primary key auto_increment, first_name VARCHAR(100) NOT NULL, last_name VARCHAR(100) NOT NULL);
Query OK, 0 rows affected (0.017 sec)

mysql> create table series(
    -> id int primary key AUTO_INCREMENT,
    -> title VARCHAR(100) not null,
    -> released_year year,
    -> gerne VARCHAR(100);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 5
mysql> create table series( id int primary key AUTO_INCREMENT, title VARCHAR(100) not null, released_year year, gerne VARCHAR(100));
Query OK, 0 rows affected (0.007 sec)

mysql> create table reviews(
    -> id int primary key auto_increment,
    -> rating DECIMAL(2,1),
    -> series_id int,
    -> reviewer_id int,
    -> foreign key(series_id) references series(id),
    -> foreign key(reviewer_id) references reviewers(id));
Query OK, 0 rows affected (0.013 sec)

mysql> show tables;
+-------------------------+
| Tables_in_movie_ratings |
+-------------------------+
| reviewers               |
| reviews                 |
| series                  |
+-------------------------+
3 rows in set (0.004 sec)

mysql> DESC reviewers;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| id         | int          | NO   | PRI | NULL    | auto_increment |
| first_name | varchar(100) | NO   |     | NULL    |                |
| last_name  | varchar(100) | NO   |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+
3 rows in set (0.007 sec)

mysql> desc reviews;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int          | NO   | PRI | NULL    | auto_increment |
| rating      | decimal(2,1) | YES  |     | NULL    |                |
| series_id   | int          | YES  | MUL | NULL    |                |
| reviewer_id | int          | YES  | MUL | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
4 rows in set (0.002 sec)

mysql> desc series;
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| id            | int          | NO   | PRI | NULL    | auto_increment |
| title         | varchar(100) | NO   |     | NULL    |                |
| released_year | year         | YES  |     | NULL    |                |
| gerne         | varchar(100) | YES  |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+
4 rows in set (0.002 sec)

mysql> INSERT INTO series (title, released_year, genre) VALUES
    ->     ('Archer', 2009, 'Animation'),
    ->     ('Arrested Development', 2003, 'Comedy'),
    ->     ("Bob's Burgers", 2011, 'Animation'),
    ->     ('Bojack Horseman', 2014, 'Animation'),
    ->     ("Breaking Bad", 2008, 'Drama'),
    ->     ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ->     ("Fargo", 2014, 'Drama'),
    ->     ('Freaks and Geeks', 1999, 'Comedy'),
    ->     ('General Hospital', 1963, 'Drama'),
    ->     ('Halt and Catch Fire', 2014, 'Drama'),
    ->     ('Malcolm In The Middle', 2000, 'Comedy'),
    ->     ('Pushing Daisies', 2007, 'Comedy'),
    ->     ('Seinfeld', 1989, 'Comedy'),
    ->     ('Stranger Things', 2016, 'Drama');
ERROR 1054 (42S22): Unknown column 'genre' in 'field list'
mysql>  
    ->  
    -> INSERT INTO reviewers (first_name, last_name) VALUES
    ->     ('Thomas', 'Stoneman'),
    ->     ('Wyatt', 'Skaggs'),
    ->     ('Kimbra', 'Masters'),
    ->     ('Domingo', 'Cortes'),
    ->     ('Colt', 'Steele'),
    ->     ('Pinkie', 'Petit'),
    ->     ('Marlon', 'Crafford');
Query OK, 7 rows affected (0.002 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql>     
    ->  
    -> INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    ->     (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    ->     (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    ->     (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    ->     (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    ->     (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    ->     (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    ->     (7,2,9.1),(7,5,9.7),
    ->     (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    ->     (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    ->     (10,5,9.9),
    ->     (13,3,8.0),(13,4,7.2),
    ->     (14,2,8.5),(14,3,8.9),(14,4,8.9);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`movie_ratings`.`reviews`, CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `series` (`id`))
mysql> 
mysql> INSERT INTO series (title, released_year, genre) VALUES
    ->     ('Archer', 2009, 'Animation'),
    ->     ('Arrested Development', 2003, 'Comedy'),
    ->     ("Bob's Burgers", 2011, 'Animation'),
    ->     ('Bojack Horseman', 2014, 'Animation'),
    ->     ("Breaking Bad", 2008, 'Drama'),
    ->     ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ->     ("Fargo", 2014, 'Drama'),
    ->     ('Freaks and Geeks', 1999, 'Comedy'),
    ->     ('General Hospital', 1963, 'Drama'),
    ->     ('Halt and Catch Fire', 2014, 'Drama'),
    ->     ('Malcolm In The Middle', 2000, 'Comedy'),
    ->     ('Pushing Daisies', 2007, 'Comedy'),
    ->     ('Seinfeld', 1989, 'Comedy'),
    ->     ('Stranger Things', 2016, 'Drama');
Query OK, 14 rows affected (0.001 sec)
Records: 14  Duplicates: 0  Warnings: 0

mysql> INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    ->     (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    ->     (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    ->     (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    ->     (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    ->     (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    ->     (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    ->     (7,2,9.1),(7,5,9.7),
    ->     (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    ->     (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    ->     (10,5,9.9),
    ->     (13,3,8.0),(13,4,7.2),
    ->     (14,2,8.5),(14,3,8.9),(14,4,8.9);
Query OK, 47 rows affected (0.004 sec)
Records: 47  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM series;
+----+-----------------------+---------------+-----------+
| id | title                 | released_year | genre     |
+----+-----------------------+---------------+-----------+
|  1 | Archer                |          2009 | Animation |
|  2 | Arrested Development  |          2003 | Comedy    |
|  3 | Bob's Burgers         |          2011 | Animation |
|  4 | Bojack Horseman       |          2014 | Animation |
|  5 | Breaking Bad          |          2008 | Drama     |
|  6 | Curb Your Enthusiasm  |          2000 | Comedy    |
|  7 | Fargo                 |          2014 | Drama     |
|  8 | Freaks and Geeks      |          1999 | Comedy    |
|  9 | General Hospital      |          1963 | Drama     |
| 10 | Halt and Catch Fire   |          2014 | Drama     |
| 11 | Malcolm In The Middle |          2000 | Comedy    |
| 12 | Pushing Daisies       |          2007 | Comedy    |
| 13 | Seinfeld              |          1989 | Comedy    |
| 14 | Stranger Things       |          2016 | Drama     |
+----+-----------------------+---------------+-----------+
14 rows in set (0.000 sec)

mysql> select * from reveiws;
ERROR 1146 (42S02): Table 'movie_ratings.reveiws' doesn't exist
mysql> select * from reveiw;
ERROR 1146 (42S02): Table 'movie_ratings.reveiw' doesn't exist
mysql> select * from reviews;
+----+--------+-----------+-------------+
| id | rating | series_id | reviewer_id |
+----+--------+-----------+-------------+
|  1 |    8.0 |         1 |           1 |
|  2 |    7.5 |         1 |           2 |
|  3 |    8.5 |         1 |           3 |
|  4 |    7.7 |         1 |           4 |
|  5 |    8.9 |         1 |           5 |
|  6 |    8.1 |         2 |           1 |
|  7 |    6.0 |         2 |           4 |
|  8 |    8.0 |         2 |           3 |
|  9 |    8.4 |         2 |           6 |
| 10 |    9.9 |         2 |           5 |
| 11 |    7.0 |         3 |           1 |
| 12 |    7.5 |         3 |           6 |
| 13 |    8.0 |         3 |           4 |
| 14 |    7.1 |         3 |           3 |
| 15 |    8.0 |         3 |           5 |
| 16 |    7.5 |         4 |           1 |
| 17 |    7.8 |         4 |           3 |
| 18 |    8.3 |         4 |           4 |
| 19 |    7.6 |         4 |           2 |
| 20 |    8.5 |         4 |           5 |
| 21 |    9.5 |         5 |           1 |
| 22 |    9.0 |         5 |           3 |
| 23 |    9.1 |         5 |           4 |
| 24 |    9.3 |         5 |           2 |
| 25 |    9.9 |         5 |           5 |
| 26 |    6.5 |         6 |           2 |
| 27 |    7.8 |         6 |           3 |
| 28 |    8.8 |         6 |           4 |
| 29 |    8.4 |         6 |           2 |
| 30 |    9.1 |         6 |           5 |
| 31 |    9.1 |         7 |           2 |
| 32 |    9.7 |         7 |           5 |
| 33 |    8.5 |         8 |           4 |
| 34 |    7.8 |         8 |           2 |
| 35 |    8.8 |         8 |           6 |
| 36 |    9.3 |         8 |           5 |
| 37 |    5.5 |         9 |           2 |
| 38 |    6.8 |         9 |           3 |
| 39 |    5.8 |         9 |           4 |
| 40 |    4.3 |         9 |           6 |
| 41 |    4.5 |         9 |           5 |
| 42 |    9.9 |        10 |           5 |
| 43 |    8.0 |        13 |           3 |
| 44 |    7.2 |        13 |           4 |
| 45 |    8.5 |        14 |           2 |
| 46 |    8.9 |        14 |           3 |
| 47 |    8.9 |        14 |           4 |
+----+--------+-----------+-------------+
47 rows in set (0.000 sec)

mysql> select * from reviewers;
+----+------------+-----------+
| id | first_name | last_name |
+----+------------+-----------+
|  1 | Thomas     | Stoneman  |
|  2 | Wyatt      | Skaggs    |
|  3 | Kimbra     | Masters   |
|  4 | Domingo    | Cortes    |
|  5 | Colt       | Steele    |
|  6 | Pinkie     | Petit     |
|  7 | Marlon     | Crafford  |
+----+------------+-----------+
7 rows in set (0.000 sec)

mysql> SELECT title from series;
+-----------------------+
| title                 |
+-----------------------+
| Archer                |
| Arrested Development  |
| Bob's Burgers         |
| Bojack Horseman       |
| Breaking Bad          |
| Curb Your Enthusiasm  |
| Fargo                 |
| Freaks and Geeks      |
| General Hospital      |
| Halt and Catch Fire   |
| Malcolm In The Middle |
| Pushing Daisies       |
| Seinfeld              |
| Stranger Things       |
+-----------------------+
14 rows in set (0.000 sec)

mysql> SELECT rating from rewies;
ERROR 1146 (42S02): Table 'movie_ratings.rewies' doesn't exist
mysql> SELECT rating from reviews;
+--------+
| rating |
+--------+
|    8.0 |
|    7.5 |
|    8.5 |
|    7.7 |
|    8.9 |
|    8.1 |
|    6.0 |
|    8.0 |
|    8.4 |
|    9.9 |
|    7.0 |
|    7.5 |
|    8.0 |
|    7.1 |
|    8.0 |
|    7.5 |
|    7.8 |
|    8.3 |
|    7.6 |
|    8.5 |
|    9.5 |
|    9.0 |
|    9.1 |
|    9.3 |
|    9.9 |
|    6.5 |
|    7.8 |
|    8.8 |
|    8.4 |
|    9.1 |
|    9.1 |
|    9.7 |
|    8.5 |
|    7.8 |
|    8.8 |
|    9.3 |
|    5.5 |
|    6.8 |
|    5.8 |
|    4.3 |
|    4.5 |
|    9.9 |
|    8.0 |
|    7.2 |
|    8.5 |
|    8.9 |
|    8.9 |
+--------+
47 rows in set (0.001 sec)

mysql> SELECT title from series;
+-----------------------+
| title                 |
+-----------------------+
| Archer                |
| Arrested Development  |
| Bob's Burgers         |
| Bojack Horseman       |
| Breaking Bad          |
| Curb Your Enthusiasm  |
| Fargo                 |
| Freaks and Geeks      |
| General Hospital      |
| Halt and Catch Fire   |
| Malcolm In The Middle |
| Pushing Daisies       |
| Seinfeld              |
| Stranger Things       |
+-----------------------+
14 rows in set (0.000 sec)

mysql> SELECT title from series
    -> join reviews on series.id=reviews.series_id
    -> ;
+----------------------+
| title                |
+----------------------+
| Archer               |
| Archer               |
| Archer               |
| Archer               |
| Archer               |
| Arrested Development |
| Arrested Development |
| Arrested Development |
| Arrested Development |
| Arrested Development |
| Bob's Burgers        |
| Bob's Burgers        |
| Bob's Burgers        |
| Bob's Burgers        |
| Bob's Burgers        |
| Bojack Horseman      |
| Bojack Horseman      |
| Bojack Horseman      |
| Bojack Horseman      |
| Bojack Horseman      |
| Breaking Bad         |
| Breaking Bad         |
| Breaking Bad         |
| Breaking Bad         |
| Breaking Bad         |
| Curb Your Enthusiasm |
| Curb Your Enthusiasm |
| Curb Your Enthusiasm |
| Curb Your Enthusiasm |
| Curb Your Enthusiasm |
| Fargo                |
| Fargo                |
| Freaks and Geeks     |
| Freaks and Geeks     |
| Freaks and Geeks     |
| Freaks and Geeks     |
| General Hospital     |
| General Hospital     |
| General Hospital     |
| General Hospital     |
| General Hospital     |
| Halt and Catch Fire  |
| Seinfeld             |
| Seinfeld             |
| Stranger Things      |
| Stranger Things      |
| Stranger Things      |
+----------------------+
47 rows in set (0.001 sec)

mysql> SELECT * from series join reviews on series.id=reviews.series_id;
+----+----------------------+---------------+-----------+----+--------+-----------+-------------+
| id | title                | released_year | genre     | id | rating | series_id | reviewer_id |
+----+----------------------+---------------+-----------+----+--------+-----------+-------------+
|  1 | Archer               |          2009 | Animation |  1 |    8.0 |         1 |           1 |
|  1 | Archer               |          2009 | Animation |  2 |    7.5 |         1 |           2 |
|  1 | Archer               |          2009 | Animation |  3 |    8.5 |         1 |           3 |
|  1 | Archer               |          2009 | Animation |  4 |    7.7 |         1 |           4 |
|  1 | Archer               |          2009 | Animation |  5 |    8.9 |         1 |           5 |
|  2 | Arrested Development |          2003 | Comedy    |  6 |    8.1 |         2 |           1 |
|  2 | Arrested Development |          2003 | Comedy    |  7 |    6.0 |         2 |           4 |
|  2 | Arrested Development |          2003 | Comedy    |  8 |    8.0 |         2 |           3 |
|  2 | Arrested Development |          2003 | Comedy    |  9 |    8.4 |         2 |           6 |
|  2 | Arrested Development |          2003 | Comedy    | 10 |    9.9 |         2 |           5 |
|  3 | Bob's Burgers        |          2011 | Animation | 11 |    7.0 |         3 |           1 |
|  3 | Bob's Burgers        |          2011 | Animation | 12 |    7.5 |         3 |           6 |
|  3 | Bob's Burgers        |          2011 | Animation | 13 |    8.0 |         3 |           4 |
|  3 | Bob's Burgers        |          2011 | Animation | 14 |    7.1 |         3 |           3 |
|  3 | Bob's Burgers        |          2011 | Animation | 15 |    8.0 |         3 |           5 |
|  4 | Bojack Horseman      |          2014 | Animation | 16 |    7.5 |         4 |           1 |
|  4 | Bojack Horseman      |          2014 | Animation | 17 |    7.8 |         4 |           3 |
|  4 | Bojack Horseman      |          2014 | Animation | 18 |    8.3 |         4 |           4 |
|  4 | Bojack Horseman      |          2014 | Animation | 19 |    7.6 |         4 |           2 |
|  4 | Bojack Horseman      |          2014 | Animation | 20 |    8.5 |         4 |           5 |
|  5 | Breaking Bad         |          2008 | Drama     | 21 |    9.5 |         5 |           1 |
|  5 | Breaking Bad         |          2008 | Drama     | 22 |    9.0 |         5 |           3 |
|  5 | Breaking Bad         |          2008 | Drama     | 23 |    9.1 |         5 |           4 |
|  5 | Breaking Bad         |          2008 | Drama     | 24 |    9.3 |         5 |           2 |
|  5 | Breaking Bad         |          2008 | Drama     | 25 |    9.9 |         5 |           5 |
|  6 | Curb Your Enthusiasm |          2000 | Comedy    | 26 |    6.5 |         6 |           2 |
|  6 | Curb Your Enthusiasm |          2000 | Comedy    | 27 |    7.8 |         6 |           3 |
|  6 | Curb Your Enthusiasm |          2000 | Comedy    | 28 |    8.8 |         6 |           4 |
|  6 | Curb Your Enthusiasm |          2000 | Comedy    | 29 |    8.4 |         6 |           2 |
|  6 | Curb Your Enthusiasm |          2000 | Comedy    | 30 |    9.1 |         6 |           5 |
|  7 | Fargo                |          2014 | Drama     | 31 |    9.1 |         7 |           2 |
|  7 | Fargo                |          2014 | Drama     | 32 |    9.7 |         7 |           5 |
|  8 | Freaks and Geeks     |          1999 | Comedy    | 33 |    8.5 |         8 |           4 |
|  8 | Freaks and Geeks     |          1999 | Comedy    | 34 |    7.8 |         8 |           2 |
|  8 | Freaks and Geeks     |          1999 | Comedy    | 35 |    8.8 |         8 |           6 |
|  8 | Freaks and Geeks     |          1999 | Comedy    | 36 |    9.3 |         8 |           5 |
|  9 | General Hospital     |          1963 | Drama     | 37 |    5.5 |         9 |           2 |
|  9 | General Hospital     |          1963 | Drama     | 38 |    6.8 |         9 |           3 |
|  9 | General Hospital     |          1963 | Drama     | 39 |    5.8 |         9 |           4 |
|  9 | General Hospital     |          1963 | Drama     | 40 |    4.3 |         9 |           6 |
|  9 | General Hospital     |          1963 | Drama     | 41 |    4.5 |         9 |           5 |
| 10 | Halt and Catch Fire  |          2014 | Drama     | 42 |    9.9 |        10 |           5 |
| 13 | Seinfeld             |          1989 | Comedy    | 43 |    8.0 |        13 |           3 |
| 13 | Seinfeld             |          1989 | Comedy    | 44 |    7.2 |        13 |           4 |
| 14 | Stranger Things      |          2016 | Drama     | 45 |    8.5 |        14 |           2 |
| 14 | Stranger Things      |          2016 | Drama     | 46 |    8.9 |        14 |           3 |
| 14 | Stranger Things      |          2016 | Drama     | 47 |    8.9 |        14 |           4 |
+----+----------------------+---------------+-----------+----+--------+-----------+-------------+
47 rows in set (0.001 sec)

mysql> SELECT title,id from series join reviews on series.id=reviews.series_id;
ERROR 1052 (23000): Column 'id' in field list is ambiguous
mysql> SELECT title,ratings from series join reviews on series.id=reviews.series_id;
ERROR 1054 (42S22): Unknown column 'ratings' in 'field list'
mysql> SELECT title,rating from series join reviews on series.id=reviews.series_id;
+----------------------+--------+
| title                | rating |
+----------------------+--------+
| Archer               |    8.0 |
| Archer               |    7.5 |
| Archer               |    8.5 |
| Archer               |    7.7 |
| Archer               |    8.9 |
| Arrested Development |    8.1 |
| Arrested Development |    6.0 |
| Arrested Development |    8.0 |
| Arrested Development |    8.4 |
| Arrested Development |    9.9 |
| Bob's Burgers        |    7.0 |
| Bob's Burgers        |    7.5 |
| Bob's Burgers        |    8.0 |
| Bob's Burgers        |    7.1 |
| Bob's Burgers        |    8.0 |
| Bojack Horseman      |    7.5 |
| Bojack Horseman      |    7.8 |
| Bojack Horseman      |    8.3 |
| Bojack Horseman      |    7.6 |
| Bojack Horseman      |    8.5 |
| Breaking Bad         |    9.5 |
| Breaking Bad         |    9.0 |
| Breaking Bad         |    9.1 |
| Breaking Bad         |    9.3 |
| Breaking Bad         |    9.9 |
| Curb Your Enthusiasm |    6.5 |
| Curb Your Enthusiasm |    7.8 |
| Curb Your Enthusiasm |    8.8 |
| Curb Your Enthusiasm |    8.4 |
| Curb Your Enthusiasm |    9.1 |
| Fargo                |    9.1 |
| Fargo                |    9.7 |
| Freaks and Geeks     |    8.5 |
| Freaks and Geeks     |    7.8 |
| Freaks and Geeks     |    8.8 |
| Freaks and Geeks     |    9.3 |
| General Hospital     |    5.5 |
| General Hospital     |    6.8 |
| General Hospital     |    5.8 |
| General Hospital     |    4.3 |
| General Hospital     |    4.5 |
| Halt and Catch Fire  |    9.9 |
| Seinfeld             |    8.0 |
| Seinfeld             |    7.2 |
| Stranger Things      |    8.5 |
| Stranger Things      |    8.9 |
| Stranger Things      |    8.9 |
+----------------------+--------+
47 rows in set (0.001 sec)

mysql> SELECT title,SUM(rating) from series join reviews on series.id=reviews.series_id;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'movie_ratings.series.title'; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT title,SUM(rating) from series join reviews on series.id=reviews.series_id group by title;
+----------------------+-------------+
| title                | SUM(rating) |
+----------------------+-------------+
| Archer               |        40.6 |
| Arrested Development |        40.4 |
| Bob's Burgers        |        37.6 |
| Bojack Horseman      |        39.7 |
| Breaking Bad         |        46.8 |
| Curb Your Enthusiasm |        40.6 |
| Fargo                |        18.8 |
| Freaks and Geeks     |        34.4 |
| General Hospital     |        26.9 |
| Halt and Catch Fire  |         9.9 |
| Seinfeld             |        15.2 |
| Stranger Things      |        26.3 |
+----------------------+-------------+
12 rows in set (0.003 sec)

mysql> SELECT title,avg(rating) as average_rating from series join reviews on series.id=reviews.series_id group by title;
+----------------------+----------------+
| title                | average_rating |
+----------------------+----------------+
| Archer               |        8.12000 |
| Arrested Development |        8.08000 |
| Bob's Burgers        |        7.52000 |
| Bojack Horseman      |        7.94000 |
| Breaking Bad         |        9.36000 |
| Curb Your Enthusiasm |        8.12000 |
| Fargo                |        9.40000 |
| Freaks and Geeks     |        8.60000 |
| General Hospital     |        5.38000 |
| Halt and Catch Fire  |        9.90000 |
| Seinfeld             |        7.60000 |
| Stranger Things      |        8.76667 |
+----------------------+----------------+
12 rows in set (0.001 sec)

mysql> SELECT title,avg(rating) as average_rating from series join reviews on series.id=reviews.series_id group by average_rating;
ERROR 1056 (42000): Can't group on 'average_rating'
mysql> SELECT title,avg(rating) as average_rating from series join reviews on series.id=reviews.series_id group by title order by average_rating;
+----------------------+----------------+
| title                | average_rating |
+----------------------+----------------+
| General Hospital     |        5.38000 |
| Bob's Burgers        |        7.52000 |
| Seinfeld             |        7.60000 |
| Bojack Horseman      |        7.94000 |
| Arrested Development |        8.08000 |
| Archer               |        8.12000 |
| Curb Your Enthusiasm |        8.12000 |
| Freaks and Geeks     |        8.60000 |
| Stranger Things      |        8.76667 |
| Breaking Bad         |        9.36000 |
| Fargo                |        9.40000 |
| Halt and Catch Fire  |        9.90000 |
+----------------------+----------------+
12 rows in set (0.001 sec)

mysql> SELECT title,round(avg(rating)) as average_rating from series join reviews on series.id=reviews.series_id group by title order by average_rating;
+----------------------+----------------+
| title                | average_rating |
+----------------------+----------------+
| General Hospital     |              5 |
| Archer               |              8 |
| Arrested Development |              8 |
| Bob's Burgers        |              8 |
| Bojack Horseman      |              8 |
| Curb Your Enthusiasm |              8 |
| Seinfeld             |              8 |
| Breaking Bad         |              9 |
| Fargo                |              9 |
| Freaks and Geeks     |              9 |
| Stranger Things      |              9 |
| Halt and Catch Fire  |             10 |
+----------------------+----------------+
12 rows in set (0.004 sec)

mysql> SELECT title,round(avg(rating),2) as average_rating from series join reviews on series.id=reviews.series_id group by title order by average_rating;
+----------------------+----------------+
| title                | average_rating |
+----------------------+----------------+
| General Hospital     |           5.38 |
| Bob's Burgers        |           7.52 |
| Seinfeld             |           7.60 |
| Bojack Horseman      |           7.94 |
| Arrested Development |           8.08 |
| Archer               |           8.12 |
| Curb Your Enthusiasm |           8.12 |
| Freaks and Geeks     |           8.60 |
| Stranger Things      |           8.77 |
| Breaking Bad         |           9.36 |
| Fargo                |           9.40 |
| Halt and Catch Fire  |           9.90 |
+----------------------+----------------+
12 rows in set (0.001 sec)

mysql> SSELECT * FROM reviewers
    -> JOIN reviews on reviewers.id = reviews.reviewer_id ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SSELECT * FROM reviewers
JOIN reviews on reviewers.id = reviews.reviewer_id' at line 1
mysql> SELECT * FROM reviewers JOIN reviews on reviewers.id = reviews.reviewer_id;
+----+------------+-----------+----+--------+-----------+-------------+
| id | first_name | last_name | id | rating | series_id | reviewer_id |
+----+------------+-----------+----+--------+-----------+-------------+
|  1 | Thomas     | Stoneman  |  1 |    8.0 |         1 |           1 |
|  1 | Thomas     | Stoneman  |  6 |    8.1 |         2 |           1 |
|  1 | Thomas     | Stoneman  | 11 |    7.0 |         3 |           1 |
|  1 | Thomas     | Stoneman  | 16 |    7.5 |         4 |           1 |
|  1 | Thomas     | Stoneman  | 21 |    9.5 |         5 |           1 |
|  2 | Wyatt      | Skaggs    |  2 |    7.5 |         1 |           2 |
|  2 | Wyatt      | Skaggs    | 19 |    7.6 |         4 |           2 |
|  2 | Wyatt      | Skaggs    | 24 |    9.3 |         5 |           2 |
|  2 | Wyatt      | Skaggs    | 26 |    6.5 |         6 |           2 |
|  2 | Wyatt      | Skaggs    | 29 |    8.4 |         6 |           2 |
|  2 | Wyatt      | Skaggs    | 31 |    9.1 |         7 |           2 |
|  2 | Wyatt      | Skaggs    | 34 |    7.8 |         8 |           2 |
|  2 | Wyatt      | Skaggs    | 37 |    5.5 |         9 |           2 |
|  2 | Wyatt      | Skaggs    | 45 |    8.5 |        14 |           2 |
|  3 | Kimbra     | Masters   |  3 |    8.5 |         1 |           3 |
|  3 | Kimbra     | Masters   |  8 |    8.0 |         2 |           3 |
|  3 | Kimbra     | Masters   | 14 |    7.1 |         3 |           3 |
|  3 | Kimbra     | Masters   | 17 |    7.8 |         4 |           3 |
|  3 | Kimbra     | Masters   | 22 |    9.0 |         5 |           3 |
|  3 | Kimbra     | Masters   | 27 |    7.8 |         6 |           3 |
|  3 | Kimbra     | Masters   | 38 |    6.8 |         9 |           3 |
|  3 | Kimbra     | Masters   | 43 |    8.0 |        13 |           3 |
|  3 | Kimbra     | Masters   | 46 |    8.9 |        14 |           3 |
|  4 | Domingo    | Cortes    |  4 |    7.7 |         1 |           4 |
|  4 | Domingo    | Cortes    |  7 |    6.0 |         2 |           4 |
|  4 | Domingo    | Cortes    | 13 |    8.0 |         3 |           4 |
|  4 | Domingo    | Cortes    | 18 |    8.3 |         4 |           4 |
|  4 | Domingo    | Cortes    | 23 |    9.1 |         5 |           4 |
|  4 | Domingo    | Cortes    | 28 |    8.8 |         6 |           4 |
|  4 | Domingo    | Cortes    | 33 |    8.5 |         8 |           4 |
|  4 | Domingo    | Cortes    | 39 |    5.8 |         9 |           4 |
|  4 | Domingo    | Cortes    | 44 |    7.2 |        13 |           4 |
|  4 | Domingo    | Cortes    | 47 |    8.9 |        14 |           4 |
|  5 | Colt       | Steele    |  5 |    8.9 |         1 |           5 |
|  5 | Colt       | Steele    | 10 |    9.9 |         2 |           5 |
|  5 | Colt       | Steele    | 15 |    8.0 |         3 |           5 |
|  5 | Colt       | Steele    | 20 |    8.5 |         4 |           5 |
|  5 | Colt       | Steele    | 25 |    9.9 |         5 |           5 |
|  5 | Colt       | Steele    | 30 |    9.1 |         6 |           5 |
|  5 | Colt       | Steele    | 32 |    9.7 |         7 |           5 |
|  5 | Colt       | Steele    | 36 |    9.3 |         8 |           5 |
|  5 | Colt       | Steele    | 41 |    4.5 |         9 |           5 |
|  5 | Colt       | Steele    | 42 |    9.9 |        10 |           5 |
|  6 | Pinkie     | Petit     |  9 |    8.4 |         2 |           6 |
|  6 | Pinkie     | Petit     | 12 |    7.5 |         3 |           6 |
|  6 | Pinkie     | Petit     | 35 |    8.8 |         8 |           6 |
|  6 | Pinkie     | Petit     | 40 |    4.3 |         9 |           6 |
+----+------------+-----------+----+--------+-----------+-------------+
47 rows in set (0.001 sec)

mysql> SELECT first_name,last_name,rating FROM reviewers JOIN reviews on reviewers.id = reviews.reviewer_id group by first_name ;
ERROR 1055 (42000): Expression #2 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'movie_ratings.reviewers.last_name' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT first_name,last_name,rating FROM reviewers JOIN reviews on reviewers.id = reviews.reviewer_id ;
+------------+-----------+--------+
| first_name | last_name | rating |
+------------+-----------+--------+
| Thomas     | Stoneman  |    8.0 |
| Thomas     | Stoneman  |    8.1 |
| Thomas     | Stoneman  |    7.0 |
| Thomas     | Stoneman  |    7.5 |
| Thomas     | Stoneman  |    9.5 |
| Wyatt      | Skaggs    |    7.5 |
| Wyatt      | Skaggs    |    7.6 |
| Wyatt      | Skaggs    |    9.3 |
| Wyatt      | Skaggs    |    6.5 |
| Wyatt      | Skaggs    |    8.4 |
| Wyatt      | Skaggs    |    9.1 |
| Wyatt      | Skaggs    |    7.8 |
| Wyatt      | Skaggs    |    5.5 |
| Wyatt      | Skaggs    |    8.5 |
| Kimbra     | Masters   |    8.5 |
| Kimbra     | Masters   |    8.0 |
| Kimbra     | Masters   |    7.1 |
| Kimbra     | Masters   |    7.8 |
| Kimbra     | Masters   |    9.0 |
| Kimbra     | Masters   |    7.8 |
| Kimbra     | Masters   |    6.8 |
| Kimbra     | Masters   |    8.0 |
| Kimbra     | Masters   |    8.9 |
| Domingo    | Cortes    |    7.7 |
| Domingo    | Cortes    |    6.0 |
| Domingo    | Cortes    |    8.0 |
| Domingo    | Cortes    |    8.3 |
| Domingo    | Cortes    |    9.1 |
| Domingo    | Cortes    |    8.8 |
| Domingo    | Cortes    |    8.5 |
| Domingo    | Cortes    |    5.8 |
| Domingo    | Cortes    |    7.2 |
| Domingo    | Cortes    |    8.9 |
| Colt       | Steele    |    8.9 |
| Colt       | Steele    |    9.9 |
| Colt       | Steele    |    8.0 |
| Colt       | Steele    |    8.5 |
| Colt       | Steele    |    9.9 |
| Colt       | Steele    |    9.1 |
| Colt       | Steele    |    9.7 |
| Colt       | Steele    |    9.3 |
| Colt       | Steele    |    4.5 |
| Colt       | Steele    |    9.9 |
| Pinkie     | Petit     |    8.4 |
| Pinkie     | Petit     |    7.5 |
| Pinkie     | Petit     |    8.8 |
| Pinkie     | Petit     |    4.3 |
+------------+-----------+--------+
47 rows in set (0.001 sec)

mysql> SELECT first_name,last_name,AVG(SUM(rating),2) AS ratings FROM reviewers JOIN reviews on reviewers.id = reviews.reviewer_id GROUP BY first_name,last name order by ratings ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',2) AS ratings FROM reviewers JOIN reviews on reviewers.id = reviews.reviewer_id' at line 1
mysql> SELECT first_name,last_name,AVG(SUM(rating),2) AS ratings FROM reviewers JOIN reviews on reviewers.id = reviews.reviewer_id GROUP BY first_name,last_name order by ratings ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',2) AS ratings FROM reviewers JOIN reviews on reviewers.id = reviews.reviewer_id' at line 1
mysql> SELECT first_name,last_name,AVG(SUM(rating),2) AS ratings FROM reviewers JOIN reviews on reviewers.id = reviews.reviewer_id GROUP BY first_name order by ratings ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',2) AS ratings FROM reviewers JOIN reviews on reviewers.id = reviews.reviewer_id' at line 1
mysql> SELECT CONCAT(first_name, ' ',last_name) as name,AVG(SUM(rating),2) AS 
    -> ratings FROM reviewers JOIN
    ->  reviews on reviewers.id = reviews.reviewer_id GROUP BY  
    -> name  order by ratings ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',2) AS 
ratings FROM reviewers JOIN
 reviews on reviewers.id = reviews.reviewer_' at line 1
mysql> SELECT 
    ->     CONCAT(first_name, ' ', last_name) AS name,
    ->     AVG(rating) AS ratings 
    -> FROM 
    ->     reviewers 
    -> JOIN 
    ->     reviews ON reviewers.id = reviews.reviewer_id 
    -> GROUP BY 
    ->     first_name, last_name 
    -> ORDER BY 
    ->     ratings;
+-----------------+---------+
| name            | ratings |
+-----------------+---------+
| Pinkie Petit    | 7.25000 |
| Wyatt Skaggs    | 7.80000 |
| Domingo Cortes  | 7.83000 |
| Kimbra Masters  | 7.98889 |
| Thomas Stoneman | 8.02000 |
| Colt Steele     | 8.77000 |
+-----------------+---------+
6 rows in set (0.005 sec)

mysql> SELECT CONCAT(first_name, ' ',last_name) as name,AVG(rating,2) AS 
    -> ratings FROM reviewers JOIN
    ->  reviews on reviewers.id = reviews.reviewer_id GROUP BY  
    -> name  order by ratings ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',2) AS 
ratings FROM reviewers JOIN
 reviews on reviewers.id = reviews.reviewer_' at line 1
mysql> SELECT CONCAT(first_name, ' ',last_name) as name,AVG(rating) AS 
    -> ratings FROM reviewers JOIN
    ->  reviews on reviewers.id = reviews.reviewer_id GROUP BY  
    -> name  order by ratings ;
+-----------------+---------+
| name            | ratings |
+-----------------+---------+
| Pinkie Petit    | 7.25000 |
| Wyatt Skaggs    | 7.80000 |
| Domingo Cortes  | 7.83000 |
| Kimbra Masters  | 7.98889 |
| Thomas Stoneman | 8.02000 |
| Colt Steele     | 8.77000 |
+-----------------+---------+
6 rows in set (0.001 sec)

mysql> SELECT CONCAT(first_name, ' ',last_name) as name,AVG(rating,2) AS 
    -> ratings FROM reviewers JOIN
    ->  reviews on reviewers.id = reviews.reviewer_id GROUP BY  
    -> name  order by ratings ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',2) AS 
ratings FROM reviewers JOIN
 reviews on reviewers.id = reviews.reviewer_' at line 1
mysql> SE    
    -> SELECT  gerne,ratings from series
    -> JOIN reviews on series.id = reviewa.series_id group by grene;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SE    
SELECT  gerne,ratings from series
JOIN reviews on series.id = reviewa.ser' at line 1
mysql>     
    -> SELECT  gerne,ratings from series
    -> JOIN reviews on series.id = reviewa.series_id group by grene;
ERROR 1054 (42S22): Unknown column 'gerne' in 'field list'
mysql>      SELECT  gerne,ratings from series JOIN reviews on series.id = reviewa.series_id group by gernee;
ERROR 1054 (42S22): Unknown column 'gerne' in 'field list'
mysql>      SELECT  gerne,ratings from series JOIN reviews on series.id = reviewa.series_id group by genre;
ERROR 1054 (42S22): Unknown column 'gerne' in 'field list'
mysql> DESC series;
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| id            | int          | NO   | PRI | NULL    | auto_increment |
| title         | varchar(100) | NO   |     | NULL    |                |
| released_year | year         | YES  |     | NULL    |                |
| genre         | varchar(100) | YES  |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+
4 rows in set (0.002 sec)

mysql>      SELECT  gerne,ratings from series JOIN reviews on series.id = reviewa.series_id group by genre;
ERROR 1054 (42S22): Unknown column 'gerne' in 'field list'
mysql>      SELECT  * from series JOIN reviews on series.id = reviewa.series_id group by genre;
ERROR 1054 (42S22): Unknown column 'reviewa.series_id' in 'on clause'
mysql>      SELECT  * from series JOIN reviews on series.id = reviews.series_id group by genre;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'movie_ratings.series.id' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql>      SELECT  * from series JOIN reviews on series.id = reviews.series_id ;
+----+----------------------+---------------+-----------+----+--------+-----------+-------------+
| id | title                | released_year | genre     | id | rating | series_id | reviewer_id |
+----+----------------------+---------------+-----------+----+--------+-----------+-------------+
|  1 | Archer               |          2009 | Animation |  1 |    8.0 |         1 |           1 |
|  1 | Archer               |          2009 | Animation |  2 |    7.5 |         1 |           2 |
|  1 | Archer               |          2009 | Animation |  3 |    8.5 |         1 |           3 |
|  1 | Archer               |          2009 | Animation |  4 |    7.7 |         1 |           4 |
|  1 | Archer               |          2009 | Animation |  5 |    8.9 |         1 |           5 |
|  2 | Arrested Development |          2003 | Comedy    |  6 |    8.1 |         2 |           1 |
|  2 | Arrested Development |          2003 | Comedy    |  7 |    6.0 |         2 |           4 |
|  2 | Arrested Development |          2003 | Comedy    |  8 |    8.0 |         2 |           3 |
|  2 | Arrested Development |          2003 | Comedy    |  9 |    8.4 |         2 |           6 |
|  2 | Arrested Development |          2003 | Comedy    | 10 |    9.9 |         2 |           5 |
|  3 | Bob's Burgers        |          2011 | Animation | 11 |    7.0 |         3 |           1 |
|  3 | Bob's Burgers        |          2011 | Animation | 12 |    7.5 |         3 |           6 |
|  3 | Bob's Burgers        |          2011 | Animation | 13 |    8.0 |         3 |           4 |
|  3 | Bob's Burgers        |          2011 | Animation | 14 |    7.1 |         3 |           3 |
|  3 | Bob's Burgers        |          2011 | Animation | 15 |    8.0 |         3 |           5 |
|  4 | Bojack Horseman      |          2014 | Animation | 16 |    7.5 |         4 |           1 |
|  4 | Bojack Horseman      |          2014 | Animation | 17 |    7.8 |         4 |           3 |
|  4 | Bojack Horseman      |          2014 | Animation | 18 |    8.3 |         4 |           4 |
|  4 | Bojack Horseman      |          2014 | Animation | 19 |    7.6 |         4 |           2 |
|  4 | Bojack Horseman      |          2014 | Animation | 20 |    8.5 |         4 |           5 |
|  5 | Breaking Bad         |          2008 | Drama     | 21 |    9.5 |         5 |           1 |
|  5 | Breaking Bad         |          2008 | Drama     | 22 |    9.0 |         5 |           3 |
|  5 | Breaking Bad         |          2008 | Drama     | 23 |    9.1 |         5 |           4 |
|  5 | Breaking Bad         |          2008 | Drama     | 24 |    9.3 |         5 |           2 |
|  5 | Breaking Bad         |          2008 | Drama     | 25 |    9.9 |         5 |           5 |
|  6 | Curb Your Enthusiasm |          2000 | Comedy    | 26 |    6.5 |         6 |           2 |
|  6 | Curb Your Enthusiasm |          2000 | Comedy    | 27 |    7.8 |         6 |           3 |
|  6 | Curb Your Enthusiasm |          2000 | Comedy    | 28 |    8.8 |         6 |           4 |
|  6 | Curb Your Enthusiasm |          2000 | Comedy    | 29 |    8.4 |         6 |           2 |
|  6 | Curb Your Enthusiasm |          2000 | Comedy    | 30 |    9.1 |         6 |           5 |
|  7 | Fargo                |          2014 | Drama     | 31 |    9.1 |         7 |           2 |
|  7 | Fargo                |          2014 | Drama     | 32 |    9.7 |         7 |           5 |
|  8 | Freaks and Geeks     |          1999 | Comedy    | 33 |    8.5 |         8 |           4 |
|  8 | Freaks and Geeks     |          1999 | Comedy    | 34 |    7.8 |         8 |           2 |
|  8 | Freaks and Geeks     |          1999 | Comedy    | 35 |    8.8 |         8 |           6 |
|  8 | Freaks and Geeks     |          1999 | Comedy    | 36 |    9.3 |         8 |           5 |
|  9 | General Hospital     |          1963 | Drama     | 37 |    5.5 |         9 |           2 |
|  9 | General Hospital     |          1963 | Drama     | 38 |    6.8 |         9 |           3 |
|  9 | General Hospital     |          1963 | Drama     | 39 |    5.8 |         9 |           4 |
|  9 | General Hospital     |          1963 | Drama     | 40 |    4.3 |         9 |           6 |
|  9 | General Hospital     |          1963 | Drama     | 41 |    4.5 |         9 |           5 |
| 10 | Halt and Catch Fire  |          2014 | Drama     | 42 |    9.9 |        10 |           5 |
| 13 | Seinfeld             |          1989 | Comedy    | 43 |    8.0 |        13 |           3 |
| 13 | Seinfeld             |          1989 | Comedy    | 44 |    7.2 |        13 |           4 |
| 14 | Stranger Things      |          2016 | Drama     | 45 |    8.5 |        14 |           2 |
| 14 | Stranger Things      |          2016 | Drama     | 46 |    8.9 |        14 |           3 |
| 14 | Stranger Things      |          2016 | Drama     | 47 |    8.9 |        14 |           4 |
+----+----------------------+---------------+-----------+----+--------+-----------+-------------+
47 rows in set (0.000 sec)

mysql>      SELECT  genre,rating from series JOIN reviews on series.id = reviews.series_id ;
+-----------+--------+
| genre     | rating |
+-----------+--------+
| Animation |    8.0 |
| Animation |    7.5 |
| Animation |    8.5 |
| Animation |    7.7 |
| Animation |    8.9 |
| Comedy    |    8.1 |
| Comedy    |    6.0 |
| Comedy    |    8.0 |
| Comedy    |    8.4 |
| Comedy    |    9.9 |
| Animation |    7.0 |
| Animation |    7.5 |
| Animation |    8.0 |
| Animation |    7.1 |
| Animation |    8.0 |
| Animation |    7.5 |
| Animation |    7.8 |
| Animation |    8.3 |
| Animation |    7.6 |
| Animation |    8.5 |
| Drama     |    9.5 |
| Drama     |    9.0 |
| Drama     |    9.1 |
| Drama     |    9.3 |
| Drama     |    9.9 |
| Comedy    |    6.5 |
| Comedy    |    7.8 |
| Comedy    |    8.8 |
| Comedy    |    8.4 |
| Comedy    |    9.1 |
| Drama     |    9.1 |
| Drama     |    9.7 |
| Comedy    |    8.5 |
| Comedy    |    7.8 |
| Comedy    |    8.8 |
| Comedy    |    9.3 |
| Drama     |    5.5 |
| Drama     |    6.8 |
| Drama     |    5.8 |
| Drama     |    4.3 |
| Drama     |    4.5 |
| Drama     |    9.9 |
| Comedy    |    8.0 |
| Comedy    |    7.2 |
| Drama     |    8.5 |
| Drama     |    8.9 |
| Drama     |    8.9 |
+-----------+--------+
47 rows in set (0.001 sec)

mysql>      SELECT  genre,SUM(rating) from series JOIN reviews on series.id = reviews.series_id group by genre;
+-----------+-------------+
| genre     | SUM(rating) |
+-----------+-------------+
| Animation |       117.9 |
| Comedy    |       130.6 |
| Drama     |       128.7 |
+-----------+-------------+
3 rows in set (0.001 sec)

mysql>      SELECT  genre,AVG(SUM(rating)) from series JOIN reviews on series.id = reviews.series_id group by genre;
ERROR 1111 (HY000): Invalid use of group function
mysql>      SELECT  genre,AVG(rating) from series JOIN reviews on series.id = reviews.series_id group by genre;
+-----------+-------------+
| genre     | AVG(rating) |
+-----------+-------------+
| Animation |     7.86000 |
| Comedy    |     8.16250 |
| Drama     |     8.04375 |
+-----------+-------------+
3 rows in set (0.001 sec)

mysql> SELECT 
    ->     first_name,
    ->     last_name,
    ->     COUNT(rating) AS count,
    ->     IFNULL(MIN(rating), 0) AS min,
    ->     IFNULL(MAX(rating), 0) AS max,
    ->     ROUND(IFNULL(AVG(rating), 0), 2) AS average,
    ->     CASE
    ->         WHEN COUNT(rating) >= 10 THEN 'POWERUSER'
    ->         WHEN COUNT(rating) > 0 THEN 'ACTIVE'
    ->         ELSE 'INACTIVE'
    ->     END AS status
    -> FROM
    ->     reviewers
    ->         LEFT JOIN
    ->     reviews ON reviewers.id = reviews.reviewer_id
    -> GROUP BY first_name , last_name;
+------------+-----------+-------+-----+-----+---------+-----------+
| first_name | last_name | count | min | max | average | status    |
+------------+-----------+-------+-----+-----+---------+-----------+
| Thomas     | Stoneman  |     5 | 7.0 | 9.5 |    8.02 | ACTIVE    |
| Wyatt      | Skaggs    |     9 | 5.5 | 9.3 |    7.80 | ACTIVE    |
| Kimbra     | Masters   |     9 | 6.8 | 9.0 |    7.99 | ACTIVE    |
| Domingo    | Cortes    |    10 | 5.8 | 9.1 |    7.83 | POWERUSER |
| Colt       | Steele    |    10 | 4.5 | 9.9 |    8.77 | POWERUSER |
| Pinkie     | Petit     |     4 | 4.3 | 8.8 |    7.25 | ACTIVE    |
| Marlon     | Crafford  |     0 | 0.0 | 0.0 |    0.00 | INACTIVE  |
+------------+-----------+-------+-----+-----+---------+-----------+
7 rows in set (0.002 sec)

mysql>  SELECT 
    ->     first_name,
    ->     last_name,
    ->     COUNT(rating) AS count,
    ->     IFNULL(MIN(rating), 0) AS min,
    ->     IFNULL(MAX(rating), 0) AS max,
    ->     ROUND(IFNULL(AVG(rating), 0), 2) AS average,
    ->     IF(COUNT(rating) > 0,
    ->         'ACTIVE',
    ->         'INACTIVE') AS status
    -> FROM
    ->     reviewers
    ->         LEFT JOIN
    ->     reviews ON reviewers.id = reviews.reviewer_id
    -> GROUP BY first_name , last_name;
+------------+-----------+-------+-----+-----+---------+----------+
| first_name | last_name | count | min | max | average | status   |
+------------+-----------+-------+-----+-----+---------+----------+
| Thomas     | Stoneman  |     5 | 7.0 | 9.5 |    8.02 | ACTIVE   |
| Wyatt      | Skaggs    |     9 | 5.5 | 9.3 |    7.80 | ACTIVE   |
| Kimbra     | Masters   |     9 | 6.8 | 9.0 |    7.99 | ACTIVE   |
| Domingo    | Cortes    |    10 | 5.8 | 9.1 |    7.83 | ACTIVE   |
| Colt       | Steele    |    10 | 4.5 | 9.9 |    8.77 | ACTIVE   |
| Pinkie     | Petit     |     4 | 4.3 | 8.8 |    7.25 | ACTIVE   |
| Marlon     | Crafford  |     0 | 0.0 | 0.0 |    0.00 | INACTIVE |
+------------+-----------+-------+-----+-----+---------+----------+
7 rows in set (0.001 sec)

mysql> SELECT 
    ->     title,
    ->     rating,
    ->     CONCAT(first_name, ' ', last_name) AS reviewer
    -> FROM
    ->     reviews
    ->         INNER JOIN
    ->     series ON reviews.series_id = series.id
    ->         INNER JOIN
    ->     reviewers ON reviews.reviewer_id = reviewers.id;
+----------------------+--------+-----------------+
| title                | rating | reviewer        |
+----------------------+--------+-----------------+
| Archer               |    8.0 | Thomas Stoneman |
| Arrested Development |    8.1 | Thomas Stoneman |
| Bob's Burgers        |    7.0 | Thomas Stoneman |
| Bojack Horseman      |    7.5 | Thomas Stoneman |
| Breaking Bad         |    9.5 | Thomas Stoneman |
| Archer               |    7.5 | Wyatt Skaggs    |
| Bojack Horseman      |    7.6 | Wyatt Skaggs    |
| Breaking Bad         |    9.3 | Wyatt Skaggs    |
| Curb Your Enthusiasm |    6.5 | Wyatt Skaggs    |
| Curb Your Enthusiasm |    8.4 | Wyatt Skaggs    |
| Fargo                |    9.1 | Wyatt Skaggs    |
| Freaks and Geeks     |    7.8 | Wyatt Skaggs    |
| General Hospital     |    5.5 | Wyatt Skaggs    |
| Stranger Things      |    8.5 | Wyatt Skaggs    |
| Archer               |    8.5 | Kimbra Masters  |
| Arrested Development |    8.0 | Kimbra Masters  |
| Bob's Burgers        |    7.1 | Kimbra Masters  |
| Bojack Horseman      |    7.8 | Kimbra Masters  |
| Breaking Bad         |    9.0 | Kimbra Masters  |
| Curb Your Enthusiasm |    7.8 | Kimbra Masters  |
| General Hospital     |    6.8 | Kimbra Masters  |
| Seinfeld             |    8.0 | Kimbra Masters  |
| Stranger Things      |    8.9 | Kimbra Masters  |
| Archer               |    7.7 | Domingo Cortes  |
| Arrested Development |    6.0 | Domingo Cortes  |
| Bob's Burgers        |    8.0 | Domingo Cortes  |
| Bojack Horseman      |    8.3 | Domingo Cortes  |
| Breaking Bad         |    9.1 | Domingo Cortes  |
| Curb Your Enthusiasm |    8.8 | Domingo Cortes  |
| Freaks and Geeks     |    8.5 | Domingo Cortes  |
| General Hospital     |    5.8 | Domingo Cortes  |
| Seinfeld             |    7.2 | Domingo Cortes  |
| Stranger Things      |    8.9 | Domingo Cortes  |
| Archer               |    8.9 | Colt Steele     |
| Arrested Development |    9.9 | Colt Steele     |
| Bob's Burgers        |    8.0 | Colt Steele     |
| Bojack Horseman      |    8.5 | Colt Steele     |
| Breaking Bad         |    9.9 | Colt Steele     |
| Curb Your Enthusiasm |    9.1 | Colt Steele     |
| Fargo                |    9.7 | Colt Steele     |
| Freaks and Geeks     |    9.3 | Colt Steele     |
| General Hospital     |    4.5 | Colt Steele     |
| Halt and Catch Fire  |    9.9 | Colt Steele     |
| Arrested Development |    8.4 | Pinkie Petit    |
| Bob's Burgers        |    7.5 | Pinkie Petit    |
| Freaks and Geeks     |    8.8 | Pinkie Petit    |
| General Hospital     |    4.3 | Pinkie Petit    |
+----------------------+--------+-----------------+
47 rows in set (0.001 sec)

mysql>  
    ->  
    ->  
    -> SELECT 
    ->     title,
    ->     rating,
    ->     CONCAT(first_name, ' ', last_name) AS reviewer
    -> FROM
    ->     series
    ->         INNER JOIN
    ->     reviews ON reviews.series_id = series.id
    ->         INNER JOIN
    ->     reviewers ON reviews.reviewer_id = reviewers.id;
+----------------------+--------+-----------------+
| title                | rating | reviewer        |
+----------------------+--------+-----------------+
| Archer               |    8.0 | Thomas Stoneman |
| Arrested Development |    8.1 | Thomas Stoneman |
| Bob's Burgers        |    7.0 | Thomas Stoneman |
| Bojack Horseman      |    7.5 | Thomas Stoneman |
| Breaking Bad         |    9.5 | Thomas Stoneman |
| Archer               |    7.5 | Wyatt Skaggs    |
| Bojack Horseman      |    7.6 | Wyatt Skaggs    |
| Breaking Bad         |    9.3 | Wyatt Skaggs    |
| Curb Your Enthusiasm |    6.5 | Wyatt Skaggs    |
| Curb Your Enthusiasm |    8.4 | Wyatt Skaggs    |
| Fargo                |    9.1 | Wyatt Skaggs    |
| Freaks and Geeks     |    7.8 | Wyatt Skaggs    |
| General Hospital     |    5.5 | Wyatt Skaggs    |
| Stranger Things      |    8.5 | Wyatt Skaggs    |
| Archer               |    8.5 | Kimbra Masters  |
| Arrested Development |    8.0 | Kimbra Masters  |
| Bob's Burgers        |    7.1 | Kimbra Masters  |
| Bojack Horseman      |    7.8 | Kimbra Masters  |
| Breaking Bad         |    9.0 | Kimbra Masters  |
| Curb Your Enthusiasm |    7.8 | Kimbra Masters  |
| General Hospital     |    6.8 | Kimbra Masters  |
| Seinfeld             |    8.0 | Kimbra Masters  |
| Stranger Things      |    8.9 | Kimbra Masters  |
| Archer               |    7.7 | Domingo Cortes  |
| Arrested Development |    6.0 | Domingo Cortes  |
| Bob's Burgers        |    8.0 | Domingo Cortes  |
| Bojack Horseman      |    8.3 | Domingo Cortes  |
| Breaking Bad         |    9.1 | Domingo Cortes  |
| Curb Your Enthusiasm |    8.8 | Domingo Cortes  |
| Freaks and Geeks     |    8.5 | Domingo Cortes  |
| General Hospital     |    5.8 | Domingo Cortes  |
| Seinfeld             |    7.2 | Domingo Cortes  |
| Stranger Things      |    8.9 | Domingo Cortes  |
| Archer               |    8.9 | Colt Steele     |
| Arrested Development |    9.9 | Colt Steele     |
| Bob's Burgers        |    8.0 | Colt Steele     |
| Bojack Horseman      |    8.5 | Colt Steele     |
| Breaking Bad         |    9.9 | Colt Steele     |
| Curb Your Enthusiasm |    9.1 | Colt Steele     |
| Fargo                |    9.7 | Colt Steele     |
| Freaks and Geeks     |    9.3 | Colt Steele     |
| General Hospital     |    4.5 | Colt Steele     |
| Halt and Catch Fire  |    9.9 | Colt Steele     |
| Arrested Development |    8.4 | Pinkie Petit    |
| Bob's Burgers        |    7.5 | Pinkie Petit    |
| Freaks and Geeks     |    8.8 | Pinkie Petit    |
| General Hospital     |    4.3 | Pinkie Petit    |
+----------------------+--------+-----------------+
47 rows in set (0.000 sec)

mysql>  
    ->  
    ->  
    -> SELECT 
    ->     title,
    ->     rating,
    ->     CONCAT(first_name, ' ', last_name) AS reviewer
    -> FROM
    ->     reviewers
    ->         INNER JOIN
    ->     reviews ON reviews.reviewer_id = reviewers.id
    ->         INNER JOIN
    ->     series ON reviews.series_id = series.id;
+----------------------+--------+-----------------+
| title                | rating | reviewer        |
+----------------------+--------+-----------------+
| Archer               |    8.0 | Thomas Stoneman |
| Arrested Development |    8.1 | Thomas Stoneman |
| Bob's Burgers        |    7.0 | Thomas Stoneman |
| Bojack Horseman      |    7.5 | Thomas Stoneman |
| Breaking Bad         |    9.5 | Thomas Stoneman |
| Archer               |    7.5 | Wyatt Skaggs    |
| Bojack Horseman      |    7.6 | Wyatt Skaggs    |
| Breaking Bad         |    9.3 | Wyatt Skaggs    |
| Curb Your Enthusiasm |    6.5 | Wyatt Skaggs    |
| Curb Your Enthusiasm |    8.4 | Wyatt Skaggs    |
| Fargo                |    9.1 | Wyatt Skaggs    |
| Freaks and Geeks     |    7.8 | Wyatt Skaggs    |
| General Hospital     |    5.5 | Wyatt Skaggs    |
| Stranger Things      |    8.5 | Wyatt Skaggs    |
| Archer               |    8.5 | Kimbra Masters  |
| Arrested Development |    8.0 | Kimbra Masters  |
| Bob's Burgers        |    7.1 | Kimbra Masters  |
| Bojack Horseman      |    7.8 | Kimbra Masters  |
| Breaking Bad         |    9.0 | Kimbra Masters  |
| Curb Your Enthusiasm |    7.8 | Kimbra Masters  |
| General Hospital     |    6.8 | Kimbra Masters  |
| Seinfeld             |    8.0 | Kimbra Masters  |
| Stranger Things      |    8.9 | Kimbra Masters  |
| Archer               |    7.7 | Domingo Cortes  |
| Arrested Development |    6.0 | Domingo Cortes  |
| Bob's Burgers        |    8.0 | Domingo Cortes  |
| Bojack Horseman      |    8.3 | Domingo Cortes  |
| Breaking Bad         |    9.1 | Domingo Cortes  |
| Curb Your Enthusiasm |    8.8 | Domingo Cortes  |
| Freaks and Geeks     |    8.5 | Domingo Cortes  |
| General Hospital     |    5.8 | Domingo Cortes  |
| Seinfeld             |    7.2 | Domingo Cortes  |
| Stranger Things      |    8.9 | Domingo Cortes  |
| Archer               |    8.9 | Colt Steele     |
| Arrested Development |    9.9 | Colt Steele     |
| Bob's Burgers        |    8.0 | Colt Steele     |
| Bojack Horseman      |    8.5 | Colt Steele     |
| Breaking Bad         |    9.9 | Colt Steele     |
| Curb Your Enthusiasm |    9.1 | Colt Steele     |
| Fargo                |    9.7 | Colt Steele     |
| Freaks and Geeks     |    9.3 | Colt Steele     |
| General Hospital     |    4.5 | Colt Steele     |
| Halt and Catch Fire  |    9.9 | Colt Steele     |
| Arrested Development |    8.4 | Pinkie Petit    |
| Bob's Burgers        |    7.5 | Pinkie Petit    |
| Freaks and Geeks     |    8.8 | Pinkie Petit    |
| General Hospital     |    4.3 | Pinkie Petit    |
+----------------------+--------+-----------------+
47 rows in set (0.000 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| movie_ratings      |
| mysql              |
| performance_schema |
| shop               |
| sys                |
+--------------------+
6 rows in set (0.008 sec)

mysql> use movie_ratings;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SELECT 
    ->     title, released_year, genre, rating, first_name, last_name
    -> FROM
    ->     reviews
    ->         JOIN
    ->     series ON series.id = reviews.series_id
    ->         JOIN
    ->     reviewers ON reviewers.id = reviews.reviewer_id;
+----------------------+---------------+-----------+--------+------------+-----------+
| title                | released_year | genre     | rating | first_name | last_name |
+----------------------+---------------+-----------+--------+------------+-----------+
| Archer               |          2009 | Animation |    8.0 | Thomas     | Stoneman  |
| Arrested Development |          2003 | Comedy    |    8.1 | Thomas     | Stoneman  |
| Bob's Burgers        |          2011 | Animation |    7.0 | Thomas     | Stoneman  |
| Bojack Horseman      |          2014 | Animation |    7.5 | Thomas     | Stoneman  |
| Breaking Bad         |          2008 | Drama     |    9.5 | Thomas     | Stoneman  |
| Archer               |          2009 | Animation |    7.5 | Wyatt      | Skaggs    |
| Bojack Horseman      |          2014 | Animation |    7.6 | Wyatt      | Skaggs    |
| Breaking Bad         |          2008 | Drama     |    9.3 | Wyatt      | Skaggs    |
| Curb Your Enthusiasm |          2000 | Comedy    |    6.5 | Wyatt      | Skaggs    |
| Curb Your Enthusiasm |          2000 | Comedy    |    8.4 | Wyatt      | Skaggs    |
| Fargo                |          2014 | Drama     |    9.1 | Wyatt      | Skaggs    |
| Freaks and Geeks     |          1999 | Comedy    |    7.8 | Wyatt      | Skaggs    |
| General Hospital     |          1963 | Drama     |    5.5 | Wyatt      | Skaggs    |
| Stranger Things      |          2016 | Drama     |    8.5 | Wyatt      | Skaggs    |
| Archer               |          2009 | Animation |    8.5 | Kimbra     | Masters   |
| Arrested Development |          2003 | Comedy    |    8.0 | Kimbra     | Masters   |
| Bob's Burgers        |          2011 | Animation |    7.1 | Kimbra     | Masters   |
| Bojack Horseman      |          2014 | Animation |    7.8 | Kimbra     | Masters   |
| Breaking Bad         |          2008 | Drama     |    9.0 | Kimbra     | Masters   |
| Curb Your Enthusiasm |          2000 | Comedy    |    7.8 | Kimbra     | Masters   |
| General Hospital     |          1963 | Drama     |    6.8 | Kimbra     | Masters   |
| Seinfeld             |          1989 | Comedy    |    8.0 | Kimbra     | Masters   |
| Stranger Things      |          2016 | Drama     |    8.9 | Kimbra     | Masters   |
| Archer               |          2009 | Animation |    7.7 | Domingo    | Cortes    |
| Arrested Development |          2003 | Comedy    |    6.0 | Domingo    | Cortes    |
| Bob's Burgers        |          2011 | Animation |    8.0 | Domingo    | Cortes    |
| Bojack Horseman      |          2014 | Animation |    8.3 | Domingo    | Cortes    |
| Breaking Bad         |          2008 | Drama     |    9.1 | Domingo    | Cortes    |
| Curb Your Enthusiasm |          2000 | Comedy    |    8.8 | Domingo    | Cortes    |
| Freaks and Geeks     |          1999 | Comedy    |    8.5 | Domingo    | Cortes    |
| General Hospital     |          1963 | Drama     |    5.8 | Domingo    | Cortes    |
| Seinfeld             |          1989 | Comedy    |    7.2 | Domingo    | Cortes    |
| Stranger Things      |          2016 | Drama     |    8.9 | Domingo    | Cortes    |
| Archer               |          2009 | Animation |    8.9 | Colt       | Steele    |
| Arrested Development |          2003 | Comedy    |    9.9 | Colt       | Steele    |
| Bob's Burgers        |          2011 | Animation |    8.0 | Colt       | Steele    |
| Bojack Horseman      |          2014 | Animation |    8.5 | Colt       | Steele    |
| Breaking Bad         |          2008 | Drama     |    9.9 | Colt       | Steele    |
| Curb Your Enthusiasm |          2000 | Comedy    |    9.1 | Colt       | Steele    |
| Fargo                |          2014 | Drama     |    9.7 | Colt       | Steele    |
| Freaks and Geeks     |          1999 | Comedy    |    9.3 | Colt       | Steele    |
| General Hospital     |          1963 | Drama     |    4.5 | Colt       | Steele    |
| Halt and Catch Fire  |          2014 | Drama     |    9.9 | Colt       | Steele    |
| Arrested Development |          2003 | Comedy    |    8.4 | Pinkie     | Petit     |
| Bob's Burgers        |          2011 | Animation |    7.5 | Pinkie     | Petit     |
| Freaks and Geeks     |          1999 | Comedy    |    8.8 | Pinkie     | Petit     |
| General Hospital     |          1963 | Drama     |    4.3 | Pinkie     | Petit     |
+----------------------+---------------+-----------+--------+------------+-----------+
47 rows in set (0.001 sec)

mysql>  
    -> 
    -> CREATE VIEW full_reviews AS
    -> SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
    -> JOIN series ON series.id = reviews.series_id
    -> JOIN reviewers ON reviewers.id = reviews.reviewer_id;
Query OK, 0 rows affected (0.004 sec)

mysql>  
    -> SELECT * FROM full_reviews;
+----------------------+---------------+-----------+--------+------------+-----------+
| title                | released_year | genre     | rating | first_name | last_name |
+----------------------+---------------+-----------+--------+------------+-----------+
| Archer               |          2009 | Animation |    8.0 | Thomas     | Stoneman  |
| Arrested Development |          2003 | Comedy    |    8.1 | Thomas     | Stoneman  |
| Bob's Burgers        |          2011 | Animation |    7.0 | Thomas     | Stoneman  |
| Bojack Horseman      |          2014 | Animation |    7.5 | Thomas     | Stoneman  |
| Breaking Bad         |          2008 | Drama     |    9.5 | Thomas     | Stoneman  |
| Archer               |          2009 | Animation |    7.5 | Wyatt      | Skaggs    |
| Bojack Horseman      |          2014 | Animation |    7.6 | Wyatt      | Skaggs    |
| Breaking Bad         |          2008 | Drama     |    9.3 | Wyatt      | Skaggs    |
| Curb Your Enthusiasm |          2000 | Comedy    |    6.5 | Wyatt      | Skaggs    |
| Curb Your Enthusiasm |          2000 | Comedy    |    8.4 | Wyatt      | Skaggs    |
| Fargo                |          2014 | Drama     |    9.1 | Wyatt      | Skaggs    |
| Freaks and Geeks     |          1999 | Comedy    |    7.8 | Wyatt      | Skaggs    |
| General Hospital     |          1963 | Drama     |    5.5 | Wyatt      | Skaggs    |
| Stranger Things      |          2016 | Drama     |    8.5 | Wyatt      | Skaggs    |
| Archer               |          2009 | Animation |    8.5 | Kimbra     | Masters   |
| Arrested Development |          2003 | Comedy    |    8.0 | Kimbra     | Masters   |
| Bob's Burgers        |          2011 | Animation |    7.1 | Kimbra     | Masters   |
| Bojack Horseman      |          2014 | Animation |    7.8 | Kimbra     | Masters   |
| Breaking Bad         |          2008 | Drama     |    9.0 | Kimbra     | Masters   |
| Curb Your Enthusiasm |          2000 | Comedy    |    7.8 | Kimbra     | Masters   |
| General Hospital     |          1963 | Drama     |    6.8 | Kimbra     | Masters   |
| Seinfeld             |          1989 | Comedy    |    8.0 | Kimbra     | Masters   |
| Stranger Things      |          2016 | Drama     |    8.9 | Kimbra     | Masters   |
| Archer               |          2009 | Animation |    7.7 | Domingo    | Cortes    |
| Arrested Development |          2003 | Comedy    |    6.0 | Domingo    | Cortes    |
| Bob's Burgers        |          2011 | Animation |    8.0 | Domingo    | Cortes    |
| Bojack Horseman      |          2014 | Animation |    8.3 | Domingo    | Cortes    |
| Breaking Bad         |          2008 | Drama     |    9.1 | Domingo    | Cortes    |
| Curb Your Enthusiasm |          2000 | Comedy    |    8.8 | Domingo    | Cortes    |
| Freaks and Geeks     |          1999 | Comedy    |    8.5 | Domingo    | Cortes    |
| General Hospital     |          1963 | Drama     |    5.8 | Domingo    | Cortes    |
| Seinfeld             |          1989 | Comedy    |    7.2 | Domingo    | Cortes    |
| Stranger Things      |          2016 | Drama     |    8.9 | Domingo    | Cortes    |
| Archer               |          2009 | Animation |    8.9 | Colt       | Steele    |
| Arrested Development |          2003 | Comedy    |    9.9 | Colt       | Steele    |
| Bob's Burgers        |          2011 | Animation |    8.0 | Colt       | Steele    |
| Bojack Horseman      |          2014 | Animation |    8.5 | Colt       | Steele    |
| Breaking Bad         |          2008 | Drama     |    9.9 | Colt       | Steele    |
| Curb Your Enthusiasm |          2000 | Comedy    |    9.1 | Colt       | Steele    |
| Fargo                |          2014 | Drama     |    9.7 | Colt       | Steele    |
| Freaks and Geeks     |          1999 | Comedy    |    9.3 | Colt       | Steele    |
| General Hospital     |          1963 | Drama     |    4.5 | Colt       | Steele    |
| Halt and Catch Fire  |          2014 | Drama     |    9.9 | Colt       | Steele    |
| Arrested Development |          2003 | Comedy    |    8.4 | Pinkie     | Petit     |
| Bob's Burgers        |          2011 | Animation |    7.5 | Pinkie     | Petit     |
| Freaks and Geeks     |          1999 | Comedy    |    8.8 | Pinkie     | Petit     |
| General Hospital     |          1963 | Drama     |    4.3 | Pinkie     | Petit     |
+----------------------+---------------+-----------+--------+------------+-----------+
47 rows in set (0.001 sec)

mysql> 
mysql>   SELECT * FROM full_reviews wheregenre = 'animation';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '= 'animation'' at line 1
mysql>   SELECT * FROM full_reviews wheregenre =like 'animation';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '=like 'animation'' at line 1
mysql>   SELECT * FROM full_reviews wheregenre =like 'Animation';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '=like 'Animation'' at line 1
mysql>   SELECT * FROM full_reviews wheregenre = 'Animation';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '= 'Animation'' at line 1
mysql>   SELECT * FROM full_reviews where genre = 'Animation';
+-----------------+---------------+-----------+--------+------------+-----------+
| title           | released_year | genre     | rating | first_name | last_name |
+-----------------+---------------+-----------+--------+------------+-----------+
| Archer          |          2009 | Animation |    8.0 | Thomas     | Stoneman  |
| Archer          |          2009 | Animation |    7.5 | Wyatt      | Skaggs    |
| Archer          |          2009 | Animation |    8.5 | Kimbra     | Masters   |
| Archer          |          2009 | Animation |    7.7 | Domingo    | Cortes    |
| Archer          |          2009 | Animation |    8.9 | Colt       | Steele    |
| Bob's Burgers   |          2011 | Animation |    7.0 | Thomas     | Stoneman  |
| Bob's Burgers   |          2011 | Animation |    7.5 | Pinkie     | Petit     |
| Bob's Burgers   |          2011 | Animation |    8.0 | Domingo    | Cortes    |
| Bob's Burgers   |          2011 | Animation |    7.1 | Kimbra     | Masters   |
| Bob's Burgers   |          2011 | Animation |    8.0 | Colt       | Steele    |
| Bojack Horseman |          2014 | Animation |    7.5 | Thomas     | Stoneman  |
| Bojack Horseman |          2014 | Animation |    7.8 | Kimbra     | Masters   |
| Bojack Horseman |          2014 | Animation |    8.3 | Domingo    | Cortes    |
| Bojack Horseman |          2014 | Animation |    7.6 | Wyatt      | Skaggs    |
| Bojack Horseman |          2014 | Animation |    8.5 | Colt       | Steele    |
+-----------------+---------------+-----------+--------+------------+-----------+
15 rows in set (0.001 sec)

mysql>   SELECT * FROM full_reviews where genre = 'animation';
+-----------------+---------------+-----------+--------+------------+-----------+
| title           | released_year | genre     | rating | first_name | last_name |
+-----------------+---------------+-----------+--------+------------+-----------+
| Archer          |          2009 | Animation |    8.0 | Thomas     | Stoneman  |
| Archer          |          2009 | Animation |    7.5 | Wyatt      | Skaggs    |
| Archer          |          2009 | Animation |    8.5 | Kimbra     | Masters   |
| Archer          |          2009 | Animation |    7.7 | Domingo    | Cortes    |
| Archer          |          2009 | Animation |    8.9 | Colt       | Steele    |
| Bob's Burgers   |          2011 | Animation |    7.0 | Thomas     | Stoneman  |
| Bob's Burgers   |          2011 | Animation |    7.5 | Pinkie     | Petit     |
| Bob's Burgers   |          2011 | Animation |    8.0 | Domingo    | Cortes    |
| Bob's Burgers   |          2011 | Animation |    7.1 | Kimbra     | Masters   |
| Bob's Burgers   |          2011 | Animation |    8.0 | Colt       | Steele    |
| Bojack Horseman |          2014 | Animation |    7.5 | Thomas     | Stoneman  |
| Bojack Horseman |          2014 | Animation |    7.8 | Kimbra     | Masters   |
| Bojack Horseman |          2014 | Animation |    8.3 | Domingo    | Cortes    |
| Bojack Horseman |          2014 | Animation |    7.6 | Wyatt      | Skaggs    |
| Bojack Horseman |          2014 | Animation |    8.5 | Colt       | Steele    |
+-----------------+---------------+-----------+--------+------------+-----------+
15 rows in set (0.001 sec)

mysql> show tables;
+-------------------------+
| Tables_in_movie_ratings |
+-------------------------+
| full_reviews            |
| reviewers               |
| reviews                 |
| series                  |
+-------------------------+
4 rows in set (0.002 sec)

mysql> -- full reviews are there
Query OK, 0 rows affected (0.000 sec)

mysql> exit
Bye
vamsi@vamsis-MacBook-Air ~ % mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 9.7.0 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use movie_ratings
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+-------------------------+
| Tables_in_movie_ratings |
+-------------------------+
| full_reviews            |
| reviewers               |
| reviews                 |
| series                  |
+-------------------------+
4 rows in set (0.002 sec)

mysql> select * from full_reviews;
+----------------------+---------------+-----------+--------+------------+-----------+
| title                | released_year | genre     | rating | first_name | last_name |
+----------------------+---------------+-----------+--------+------------+-----------+
| Archer               |          2009 | Animation |    8.0 | Thomas     | Stoneman  |
| Arrested Development |          2003 | Comedy    |    8.1 | Thomas     | Stoneman  |
| Bob's Burgers        |          2011 | Animation |    7.0 | Thomas     | Stoneman  |
| Bojack Horseman      |          2014 | Animation |    7.5 | Thomas     | Stoneman  |
| Breaking Bad         |          2008 | Drama     |    9.5 | Thomas     | Stoneman  |
| Archer               |          2009 | Animation |    7.5 | Wyatt      | Skaggs    |
| Bojack Horseman      |          2014 | Animation |    7.6 | Wyatt      | Skaggs    |
| Breaking Bad         |          2008 | Drama     |    9.3 | Wyatt      | Skaggs    |
| Curb Your Enthusiasm |          2000 | Comedy    |    6.5 | Wyatt      | Skaggs    |
| Curb Your Enthusiasm |          2000 | Comedy    |    8.4 | Wyatt      | Skaggs    |
| Fargo                |          2014 | Drama     |    9.1 | Wyatt      | Skaggs    |
| Freaks and Geeks     |          1999 | Comedy    |    7.8 | Wyatt      | Skaggs    |
| General Hospital     |          1963 | Drama     |    5.5 | Wyatt      | Skaggs    |
| Stranger Things      |          2016 | Drama     |    8.5 | Wyatt      | Skaggs    |
| Archer               |          2009 | Animation |    8.5 | Kimbra     | Masters   |
| Arrested Development |          2003 | Comedy    |    8.0 | Kimbra     | Masters   |
| Bob's Burgers        |          2011 | Animation |    7.1 | Kimbra     | Masters   |
| Bojack Horseman      |          2014 | Animation |    7.8 | Kimbra     | Masters   |
| Breaking Bad         |          2008 | Drama     |    9.0 | Kimbra     | Masters   |
| Curb Your Enthusiasm |          2000 | Comedy    |    7.8 | Kimbra     | Masters   |
| General Hospital     |          1963 | Drama     |    6.8 | Kimbra     | Masters   |
| Seinfeld             |          1989 | Comedy    |    8.0 | Kimbra     | Masters   |
| Stranger Things      |          2016 | Drama     |    8.9 | Kimbra     | Masters   |
| Archer               |          2009 | Animation |    7.7 | Domingo    | Cortes    |
| Arrested Development |          2003 | Comedy    |    6.0 | Domingo    | Cortes    |
| Bob's Burgers        |          2011 | Animation |    8.0 | Domingo    | Cortes    |
| Bojack Horseman      |          2014 | Animation |    8.3 | Domingo    | Cortes    |
| Breaking Bad         |          2008 | Drama     |    9.1 | Domingo    | Cortes    |
| Curb Your Enthusiasm |          2000 | Comedy    |    8.8 | Domingo    | Cortes    |
| Freaks and Geeks     |          1999 | Comedy    |    8.5 | Domingo    | Cortes    |
| General Hospital     |          1963 | Drama     |    5.8 | Domingo    | Cortes    |
| Seinfeld             |          1989 | Comedy    |    7.2 | Domingo    | Cortes    |
| Stranger Things      |          2016 | Drama     |    8.9 | Domingo    | Cortes    |
| Archer               |          2009 | Animation |    8.9 | Colt       | Steele    |
| Arrested Development |          2003 | Comedy    |    9.9 | Colt       | Steele    |
| Bob's Burgers        |          2011 | Animation |    8.0 | Colt       | Steele    |
| Bojack Horseman      |          2014 | Animation |    8.5 | Colt       | Steele    |
| Breaking Bad         |          2008 | Drama     |    9.9 | Colt       | Steele    |
| Curb Your Enthusiasm |          2000 | Comedy    |    9.1 | Colt       | Steele    |
| Fargo                |          2014 | Drama     |    9.7 | Colt       | Steele    |
| Freaks and Geeks     |          1999 | Comedy    |    9.3 | Colt       | Steele    |
| General Hospital     |          1963 | Drama     |    4.5 | Colt       | Steele    |
| Halt and Catch Fire  |          2014 | Drama     |    9.9 | Colt       | Steele    |
| Arrested Development |          2003 | Comedy    |    8.4 | Pinkie     | Petit     |
| Bob's Burgers        |          2011 | Animation |    7.5 | Pinkie     | Petit     |
| Freaks and Geeks     |          1999 | Comedy    |    8.8 | Pinkie     | Petit     |
| General Hospital     |          1963 | Drama     |    4.3 | Pinkie     | Petit     |
+----------------------+---------------+-----------+--------+------------+-----------+
47 rows in set (0.001 sec)

mysql> drop full_reviews;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'full_reviews' at line 1
mysql> drop table full_reviews;
ERROR 1051 (42S02): Unknown table 'movie_ratings.full_reviews'
mysql> drop table full_reviews;
ERROR 1051 (42S02): Unknown table 'movie_ratings.full_reviews'
mysql> SELECT * FROM full_reviews;
+----------------------+---------------+-----------+--------+------------+-----------+
| title                | released_year | genre     | rating | first_name | last_name |
+----------------------+---------------+-----------+--------+------------+-----------+
| Archer               |          2009 | Animation |    8.0 | Thomas     | Stoneman  |
| Arrested Development |          2003 | Comedy    |    8.1 | Thomas     | Stoneman  |
| Bob's Burgers        |          2011 | Animation |    7.0 | Thomas     | Stoneman  |
| Bojack Horseman      |          2014 | Animation |    7.5 | Thomas     | Stoneman  |
| Breaking Bad         |          2008 | Drama     |    9.5 | Thomas     | Stoneman  |
| Archer               |          2009 | Animation |    7.5 | Wyatt      | Skaggs    |
| Bojack Horseman      |          2014 | Animation |    7.6 | Wyatt      | Skaggs    |
| Breaking Bad         |          2008 | Drama     |    9.3 | Wyatt      | Skaggs    |
| Curb Your Enthusiasm |          2000 | Comedy    |    6.5 | Wyatt      | Skaggs    |
| Curb Your Enthusiasm |          2000 | Comedy    |    8.4 | Wyatt      | Skaggs    |
| Fargo                |          2014 | Drama     |    9.1 | Wyatt      | Skaggs    |
| Freaks and Geeks     |          1999 | Comedy    |    7.8 | Wyatt      | Skaggs    |
| General Hospital     |          1963 | Drama     |    5.5 | Wyatt      | Skaggs    |
| Stranger Things      |          2016 | Drama     |    8.5 | Wyatt      | Skaggs    |
| Archer               |          2009 | Animation |    8.5 | Kimbra     | Masters   |
| Arrested Development |          2003 | Comedy    |    8.0 | Kimbra     | Masters   |
| Bob's Burgers        |          2011 | Animation |    7.1 | Kimbra     | Masters   |
| Bojack Horseman      |          2014 | Animation |    7.8 | Kimbra     | Masters   |
| Breaking Bad         |          2008 | Drama     |    9.0 | Kimbra     | Masters   |
| Curb Your Enthusiasm |          2000 | Comedy    |    7.8 | Kimbra     | Masters   |
| General Hospital     |          1963 | Drama     |    6.8 | Kimbra     | Masters   |
| Seinfeld             |          1989 | Comedy    |    8.0 | Kimbra     | Masters   |
| Stranger Things      |          2016 | Drama     |    8.9 | Kimbra     | Masters   |
| Archer               |          2009 | Animation |    7.7 | Domingo    | Cortes    |
| Arrested Development |          2003 | Comedy    |    6.0 | Domingo    | Cortes    |
| Bob's Burgers        |          2011 | Animation |    8.0 | Domingo    | Cortes    |
| Bojack Horseman      |          2014 | Animation |    8.3 | Domingo    | Cortes    |
| Breaking Bad         |          2008 | Drama     |    9.1 | Domingo    | Cortes    |
| Curb Your Enthusiasm |          2000 | Comedy    |    8.8 | Domingo    | Cortes    |
| Freaks and Geeks     |          1999 | Comedy    |    8.5 | Domingo    | Cortes    |
| General Hospital     |          1963 | Drama     |    5.8 | Domingo    | Cortes    |
| Seinfeld             |          1989 | Comedy    |    7.2 | Domingo    | Cortes    |
| Stranger Things      |          2016 | Drama     |    8.9 | Domingo    | Cortes    |
| Archer               |          2009 | Animation |    8.9 | Colt       | Steele    |
| Arrested Development |          2003 | Comedy    |    9.9 | Colt       | Steele    |
| Bob's Burgers        |          2011 | Animation |    8.0 | Colt       | Steele    |
| Bojack Horseman      |          2014 | Animation |    8.5 | Colt       | Steele    |
| Breaking Bad         |          2008 | Drama     |    9.9 | Colt       | Steele    |
| Curb Your Enthusiasm |          2000 | Comedy    |    9.1 | Colt       | Steele    |
| Fargo                |          2014 | Drama     |    9.7 | Colt       | Steele    |
| Freaks and Geeks     |          1999 | Comedy    |    9.3 | Colt       | Steele    |
| General Hospital     |          1963 | Drama     |    4.5 | Colt       | Steele    |
| Halt and Catch Fire  |          2014 | Drama     |    9.9 | Colt       | Steele    |
| Arrested Development |          2003 | Comedy    |    8.4 | Pinkie     | Petit     |
| Bob's Burgers        |          2011 | Animation |    7.5 | Pinkie     | Petit     |
| Freaks and Geeks     |          1999 | Comedy    |    8.8 | Pinkie     | Petit     |
| General Hospital     |          1963 | Drama     |    4.3 | Pinkie     | Petit     |
+----------------------+---------------+-----------+--------+------------+-----------+
47 rows in set (0.001 sec)

