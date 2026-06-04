mysql> SELECT COUNT(*) from books;
+----------+
| COUNT(*) |
+----------+
|       19 |
+----------+
1 row in set (0.005 sec)

mysql> Select title,author_fname , count(*) from books;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'book_shop.books.title'; this is incompatible with sql_mode=only_full_group_by
mysql>   CELECT COUNT(DISTINCT author_fnames) from boooks;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CELECT COUNT(DISTINCT author_fnames) from boooks' at line 1
mysql>   SELECT COUNT(DISTINCT author_fnames) from boooks;
ERROR 1146 (42S02): Table 'book_shop.boooks' doesn't exist
mysql>   SELECT COUNT(DISTINCT author_fnames) from books;
ERROR 1054 (42S22): Unknown column 'author_fnames' in 'field list'
mysql>   SELECT COUNT(DISTINCT author_fname) from books;
+------------------------------+
| COUNT(DISTINCT author_fname) |
+------------------------------+
|                           12 |
+------------------------------+
1 row in set (0.005 sec)

mysql> SELECT title from books where title like '%the%';
+-------------------------------------------+
| title                                     |
+-------------------------------------------+
| The Namesake                              |
| A Hologram for the King: A Novel          |
| The Circle                                |
| The Amazing Adventures of Kavalier & Clay |
| Consider the Lobster                      |
| Lincoln In The Bardo                      |
+-------------------------------------------+
6 rows in set (0.000 sec)

mysql> SELECT COUNT(titl)e from books where title like '%the%';
ERROR 1054 (42S22): Unknown column 'titl' in 'field list'
mysql> SELECT COUNT(title) from books where title like '%the%';
+--------------+
| COUNT(title) |
+--------------+
|            6 |
+--------------+
1 row in set (0.000 sec)

mysql> SELECT COUNT(*) from books where title like '%the%';
+----------+
| COUNT(*) |
+----------+
|        6 |
+----------+
1 row in set (0.001 sec)

mysql> SELECT author_lname from books;
+----------------+
| author_lname   |
+----------------+
| Lahiri         |
| Gaiman         |
| Gaiman         |
| Lahiri         |
| Eggers         |
| Eggers         |
| Chabon         |
| Smith          |
| Eggers         |
| Gaiman         |
| Carver         |
| Carver         |
| DeLillo        |
| Steinbeck      |
| Foster Wallace |
| Foster Wallace |
| Harris         |
| Harris         |
| Saunders       |
+----------------+
19 rows in set (0.000 sec)

mysql> SELECT author_lname from books GROUP BY author_lname;
+----------------+
| author_lname   |
+----------------+
| Lahiri         |
| Gaiman         |
| Eggers         |
| Chabon         |
| Smith          |
| Carver         |
| DeLillo        |
| Steinbeck      |
| Foster Wallace |
| Harris         |
| Saunders       |
+----------------+
11 rows in set (0.001 sec)

mysql> SELECT author_lname,COUNT(*) from books GROUP BY author_lname;
+----------------+----------+
| author_lname   | COUNT(*) |
+----------------+----------+
| Lahiri         |        2 |
| Gaiman         |        3 |
| Eggers         |        3 |
| Chabon         |        1 |
| Smith          |        1 |
| Carver         |        2 |
| DeLillo        |        1 |
| Steinbeck      |        1 |
| Foster Wallace |        2 |
| Harris         |        2 |
| Saunders       |        1 |
+----------------+----------+
11 rows in set (0.000 sec)

mysql> SELECT author_lname,COUNT(*) AS books_written from books GROUP BY author_lname ORDER BY books_written ASC;
+----------------+---------------+
| author_lname   | books_written |
+----------------+---------------+
| Chabon         |             1 |
| Smith          |             1 |
| DeLillo        |             1 |
| Steinbeck      |             1 |
| Saunders       |             1 |
| Lahiri         |             2 |
| Carver         |             2 |
| Foster Wallace |             2 |
| Harris         |             2 |
| Gaiman         |             3 |
| Eggers         |             3 |
+----------------+---------------+
11 rows in set (0.001 sec)

mysql> SELECT author_lname,COUNT(*) from books GROUP BY author_lname ORDER BY COUNT(*) ASC;
+----------------+----------+
| author_lname   | COUNT(*) |
+----------------+----------+
| Chabon         |        1 |
| Smith          |        1 |
| DeLillo        |        1 |
| Steinbeck      |        1 |
| Saunders       |        1 |
| Lahiri         |        2 |
| Carver         |        2 |
| Foster Wallace |        2 |
| Harris         |        2 |
| Gaiman         |        3 |
| Eggers         |        3 |
+----------------+----------+
11 rows in set (0.001 sec)

mysql> SELECT * FROM books;
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
| book_id | title                                               | author_fname | author_lname   | released_year | stock_quantity | pages |
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
|       1 | The Namesake                                        | Jhumpa       | Lahiri         |          2003 |             32 |   291 |
|       2 | Norse Mythology                                     | Neil         | Gaiman         |          2016 |             43 |   304 |
|       3 | American Gods                                       | Neil         | Gaiman         |          2001 |             12 |   465 |
|       4 | Interpreter of Maladies                             | Jhumpa       | Lahiri         |          1996 |             97 |   198 |
|       5 | A Hologram for the King: A Novel                    | Dave         | Eggers         |          2012 |            154 |   352 |
|       6 | The Circle                                          | Dave         | Eggers         |          2013 |             26 |   504 |
|       7 | The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon         |          2000 |             68 |   634 |
|       8 | Just Kids                                           | Patti        | Smith          |          2010 |             55 |   304 |
|       9 | A Heartbreaking Work of Staggering Genius           | Dave         | Eggers         |          2001 |            104 |   437 |
|      10 | Coraline                                            | Neil         | Gaiman         |          2003 |            100 |   208 |
|      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver         |          1981 |             23 |   176 |
|      12 | Where I'm Calling From: Selected Stories            | Raymond      | Carver         |          1989 |             12 |   526 |
|      13 | White Noise                                         | Don          | DeLillo        |          1985 |             49 |   320 |
|      14 | Cannery Row                                         | John         | Steinbeck      |          1945 |             95 |   181 |
|      15 | Oblivion: Stories                                   | David        | Foster Wallace |          2004 |            172 |   329 |
|      16 | Consider the Lobster                                | David        | Foster Wallace |          2005 |             92 |   343 |
|      17 | 10% Happier                                         | Dan          | Harris         |          2014 |             29 |   256 |
|      18 | fake_book                                           | Freida       | Harris         |          2001 |            287 |   428 |
|      19 | Lincoln In The Bardo                                | George       | Saunders       |          2017 |           1000 |   367 |
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
19 rows in set (0.000 sec)

mysql> SELECT MAX(pages) from books;
+------------+
| MAX(pages) |
+------------+
|        634 |
+------------+
1 row in set (0.004 sec)

mysql> SELECT MAX(author_fname) FROM BOOKS;
+-------------------+
| MAX(author_fname) |
+-------------------+
| Raymond           |
+-------------------+
1 row in set (0.001 sec)

mysql> SELECT MIN(author_fname) FROM BOOKS;
+-------------------+
| MIN(author_fname) |
+-------------------+
| Dan               |
+-------------------+
1 row in set (0.000 sec)

mysql> SELECT titele from books where pages=634;
ERROR 1054 (42S22): Unknown column 'titele' in 'field list'
mysql> SELECT title from books where pages=634;
+-------------------------------------------+
| title                                     |
+-------------------------------------------+
| The Amazing Adventures of Kavalier & Clay |
+-------------------------------------------+
1 row in set (0.000 sec)

mysql> INSERT INTO books (title,pages) VALUES ('the rookie',634);
Query OK, 1 row affected (0.005 sec)

mysql> SELECT title from books where pages=634;
+-------------------------------------------+
| title                                     |
+-------------------------------------------+
| The Amazing Adventures of Kavalier & Clay |
| the rookie                                |
+-------------------------------------------+
2 rows in set (0.000 sec)

mysql> SELECT title,pages from books where pages=634;
+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Amazing Adventures of Kavalier & Clay |   634 |
| the rookie                                |   634 |
+-------------------------------------------+-------+
2 rows in set (0.001 sec)

mysql> SELECT title,pages from books where pages=(SELECT MAX(pages) from books);
+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Amazing Adventures of Kavalier & Clay |   634 |
| the rookie                                |   634 |
+-------------------------------------------+-------+
2 rows in set (0.001 sec)
mysql> SELECT title,released_year from books where released_year =(SELECT min(realeased_year) from books);
ERROR 1054 (42S22): Unknown column 'realeased_year' in 'field list'
mysql> SELECT title,released_year from books where released_year =(SELECT min(released_year) from books);
+-------------+---------------+
| title       | released_year |
+-------------+---------------+
| Cannery Row |          1945 |
+-------------+---------------+
1 row in set (0.001 sec)

mysql> SELECT title,released_year from books where released_year =(SELECT min(released_year) from books LIMIT 2);
+-------------+---------------+
| title       | released_year |
+-------------+---------------+
| Cannery Row |          1945 |
+-------------+---------------+
1 row in set (0.001 sec)

mysql> SELECT title,released_year from books where released_year =(SELECT max(released_year) from books );
+----------------------+---------------+
| title                | released_year |
+----------------------+---------------+
| Lincoln In The Bardo |          2017 |
+----------------------+---------------+
1 row in set (0.001 sec)

mysql> use vamsi;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> INSERT testing(name) VALUES(vamsi),(Harshith),(gautham),(dhanesh),(aditya),(rithwik);
ERROR 1054 (42S22): Unknown column 'vamsi' in 'field list'
mysql> SELECT book_shop;
ERROR 1054 (42S22): Unknown column 'book_shop' in 'field list'
mysql> USE book_shop;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SELECT DATABASE();
+------------+
| DATABASE() |
+------------+
| book_shop  |
+------------+
1 row in set (0.000 sec)

mysql> SELECT authoe_lname,count(*) from books GROUP BY authoe_lname;
ERROR 1054 (42S22): Unknown column 'authoe_lname' in 'field list'
mysql> SELECT authoe_lname,count(*) from books GROUP BY author_lname;
ERROR 1054 (42S22): Unknown column 'authoe_lname' in 'field list'
mysql> SELECT author_lname,count(*) from books GROUP BY author_lname;
+----------------+----------+
| author_lname   | count(*) |
+----------------+----------+
| Lahiri         |        2 |
| Gaiman         |        3 |
| Eggers         |        3 |
| Chabon         |        1 |
| Smith          |        1 |
| Carver         |        2 |
| DeLillo        |        1 |
| Steinbeck      |        1 |
| Foster Wallace |        2 |
| Harris         |        2 |
| Saunders       |        1 |
| NULL           |        1 |
+----------------+----------+
12 rows in set (0.001 sec)

mysql> SELECT author_lname,count(*) from books GROUP BY author_lname,authoe_fname;
ERROR 1054 (42S22): Unknown column 'authoe_fname' in 'group statement'
mysql> SELECT author_lname,count(*) from books GROUP BY author_lname,author_fname;
+----------------+----------+
| author_lname   | count(*) |
+----------------+----------+
| Lahiri         |        2 |
| Gaiman         |        3 |
| Eggers         |        3 |
| Chabon         |        1 |
| Smith          |        1 |
| Carver         |        2 |
| DeLillo        |        1 |
| Steinbeck      |        1 |
| Foster Wallace |        2 |
| Harris         |        1 |
| Harris         |        1 |
| Saunders       |        1 |
| NULL           |        1 |
+----------------+----------+
13 rows in set (0.001 sec)

mysql> SELECT author_fname,author_lname,count(*) from books GROUP BY author_lname,author_fname;
+--------------+----------------+----------+
| author_fname | author_lname   | count(*) |
+--------------+----------------+----------+
| Jhumpa       | Lahiri         |        2 |
| Neil         | Gaiman         |        3 |
| Dave         | Eggers         |        3 |
| Michael      | Chabon         |        1 |
| Patti        | Smith          |        1 |
| Raymond      | Carver         |        2 |
| Don          | DeLillo        |        1 |
| John         | Steinbeck      |        1 |
| David        | Foster Wallace |        2 |
| Dan          | Harris         |        1 |
| Freida       | Harris         |        1 |
| George       | Saunders       |        1 |
| NULL         | NULL           |        1 |
+--------------+----------------+----------+
13 rows in set (0.001 sec)

mysql> SELECT CONCAT(author_fname,author_lname) as author_name,select(*) from books GROUP BY author;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select(*) from books GROUP BY author' at line 1
mysql> SELECT CONCAT(author_fname,author_lname) as author_name,COUNT(*) from books GROUP BY author;
ERROR 1054 (42S22): Unknown column 'author' in 'group statement'
mysql> SELECT CONCAT(author_fname,author_lname) as author_name,COUNT(*) from books GROUP BY author_name;
+---------------------+----------+
| author_name         | COUNT(*) |
+---------------------+----------+
| JhumpaLahiri        |        2 |
| NeilGaiman          |        3 |
| DaveEggers          |        3 |
| MichaelChabon       |        1 |
| PattiSmith          |        1 |
| RaymondCarver       |        2 |
| DonDeLillo          |        1 |
| JohnSteinbeck       |        1 |
| DavidFoster Wallace |        2 |
| DanHarris           |        1 |
| FreidaHarris        |        1 |
| GeorgeSaunders      |        1 |
| NULL                |        1 |
+---------------------+----------+
13 rows in set (0.001 sec)

mysql> SELECT CONCAT(author_fname,' ',author_lname) as author_name,COUNT(*) from books GROUP BY author_name;
+----------------------+----------+
| author_name          | COUNT(*) |
+----------------------+----------+
| Jhumpa Lahiri        |        2 |
| Neil Gaiman          |        3 |
| Dave Eggers          |        3 |
| Michael Chabon       |        1 |
| Patti Smith          |        1 |
| Raymond Carver       |        2 |
| Don DeLillo          |        1 |
| John Steinbeck       |        1 |
| David Foster Wallace |        2 |
| Dan Harris           |        1 |
| Freida Harris        |        1 |
| George Saunders      |        1 |
| NULL                 |        1 |
+----------------------+----------+
13 rows in set (0.001 sec)

mysql> SELECT author_l
    -> ;
ERROR 1054 (42S22): Unknown column 'author_l' in 'field list'
mysql> SELECT author_fname,author_lname,MIN(published_year) from books ORDER BY author_fname,author_lname;
ERROR 1054 (42S22): Unknown column 'published_year' in 'field list'
mysql> SELECT author_fname,author_lname,MIN(released_year) from books ORDER BY author_fname,author_lname;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'book_shop.books.author_fname'; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT author_fname,author_lname,MIN(released_year) from books GROUP BY author_fname,author_lname;
+--------------+----------------+--------------------+
| author_fname | author_lname   | MIN(released_year) |
+--------------+----------------+--------------------+
| Jhumpa       | Lahiri         |               1996 |
| Neil         | Gaiman         |               2001 |
| Dave         | Eggers         |               2001 |
| Michael      | Chabon         |               2000 |
| Patti        | Smith          |               2010 |
| Raymond      | Carver         |               1981 |
| Don          | DeLillo        |               1985 |
| John         | Steinbeck      |               1945 |
| David        | Foster Wallace |               2004 |
| Dan          | Harris         |               2014 |
| Freida       | Harris         |               2001 |
| George       | Saunders       |               2017 |
| NULL         | NULL           |               NULL |
+--------------+----------------+--------------------+
13 rows in set (0.003 sec)

mysql> SELECT CONCAT(author_fname,' ',author_lname) as author_name,MIN(released_year) from books GROUP BY author_name;
+----------------------+--------------------+
| author_name          | MIN(released_year) |
+----------------------+--------------------+
| Jhumpa Lahiri        |               1996 |
| Neil Gaiman          |               2001 |
| Dave Eggers          |               2001 |
| Michael Chabon       |               2000 |
| Patti Smith          |               2010 |
| Raymond Carver       |               1981 |
| Don DeLillo          |               1985 |
| John Steinbeck       |               1945 |
| David Foster Wallace |               2004 |
| Dan Harris           |               2014 |
| Freida Harris        |               2001 |
| George Saunders      |               2017 |
| NULL                 |               NULL |
+----------------------+--------------------+
13 rows in set (0.000 sec)

mysql> SELECT CONCAT(author_fname,' ',author_lname) as author_name,MAX(released_year) from books GROUP BY author_name;
+----------------------+--------------------+
| author_name          | MAX(released_year) |
+----------------------+--------------------+
| Jhumpa Lahiri        |               2003 |
| Neil Gaiman          |               2016 |
| Dave Eggers          |               2013 |
| Michael Chabon       |               2000 |
| Patti Smith          |               2010 |
| Raymond Carver       |               1989 |
| Don DeLillo          |               1985 |
| John Steinbeck       |               1945 |
| David Foster Wallace |               2005 |
| Dan Harris           |               2014 |
| Freida Harris        |               2001 |
| George Saunders      |               2017 |
| NULL                 |               NULL |
+----------------------+--------------------+
13 rows in set (0.001 sec)

mysql> SELECT CONCAT(author_fname,' ',author_lname) as author_name,MAX(released_year),MIN(released_year) from books GROUP BY author_name;
+----------------------+--------------------+--------------------+
| author_name          | MAX(released_year) | MIN(released_year) |
+----------------------+--------------------+--------------------+
| Jhumpa Lahiri        |               2003 |               1996 |
| Neil Gaiman          |               2016 |               2001 |
| Dave Eggers          |               2013 |               2001 |
| Michael Chabon       |               2000 |               2000 |
| Patti Smith          |               2010 |               2010 |
| Raymond Carver       |               1989 |               1981 |
| Don DeLillo          |               1985 |               1985 |
| John Steinbeck       |               1945 |               1945 |
| David Foster Wallace |               2005 |               2004 |
| Dan Harris           |               2014 |               2014 |
| Freida Harris        |               2001 |               2001 |
| George Saunders      |               2017 |               2017 |
| NULL                 |               NULL |               NULL |
+----------------------+--------------------+--------------------+
13 rows in set (0.000 sec)

mysql> SELECT CONCAT(author_fname,' ',author_lname) as author_name,MAX(released_year) as earliest_release,MAX(released_year) as latest_release from books GROUP BY author_name;
+----------------------+------------------+----------------+
| author_name          | earliest_release | latest_release |
+----------------------+------------------+----------------+
| Jhumpa Lahiri        |             2003 |           2003 |
| Neil Gaiman          |             2016 |           2016 |
| Dave Eggers          |             2013 |           2013 |
| Michael Chabon       |             2000 |           2000 |
| Patti Smith          |             2010 |           2010 |
| Raymond Carver       |             1989 |           1989 |
| Don DeLillo          |             1985 |           1985 |
| John Steinbeck       |             1945 |           1945 |
| David Foster Wallace |             2005 |           2005 |
| Dan Harris           |             2014 |           2014 |
| Freida Harris        |             2001 |           2001 |
| George Saunders      |             2017 |           2017 |
| NULL                 |             NULL |           NULL |
+----------------------+------------------+----------------+
13 rows in set (0.000 sec)

mysql> SELECT CONCAT(author_fname,' ',author_lname) as author_name,MAX(released_year) as earliest_release,MAX(released_year) as latest_release,MAX(pages) as page_count from books GROUP BY author_name;
+----------------------+------------------+----------------+------------+
| author_name          | earliest_release | latest_release | page_count |
+----------------------+------------------+----------------+------------+
| Jhumpa Lahiri        |             2003 |           2003 |        291 |
| Neil Gaiman          |             2016 |           2016 |        465 |
| Dave Eggers          |             2013 |           2013 |        504 |
| Michael Chabon       |             2000 |           2000 |        634 |
| Patti Smith          |             2010 |           2010 |        304 |
| Raymond Carver       |             1989 |           1989 |        526 |
| Don DeLillo          |             1985 |           1985 |        320 |
| John Steinbeck       |             1945 |           1945 |        181 |
| David Foster Wallace |             2005 |           2005 |        343 |
| Dan Harris           |             2014 |           2014 |        256 |
| Freida Harris        |             2001 |           2001 |        428 |
| George Saunders      |             2017 |           2017 |        367 |
| NULL                 |             NULL |           NULL |        634 |
+----------------------+------------------+----------------+------------+
13 rows in set (0.001 sec)

mysql> 
mysql> SELECT author_lname, MIN(released_year) FROM books GROUP BY author_lname;
+----------------+--------------------+
| author_lname   | MIN(released_year) |
+----------------+--------------------+
| Lahiri         |               1996 |
| Gaiman         |               2001 |
| Eggers         |               2001 |
| Chabon         |               2000 |
| Smith          |               2010 |
| Carver         |               1981 |
| DeLillo        |               1985 |
| Steinbeck      |               1945 |
| Foster Wallace |               2004 |
| Harris         |               2001 |
| Saunders       |               2017 |
| NULL           |               NULL |
+----------------+--------------------+
12 rows in set (0.001 sec)

mysql>  
    -> SELECT author_lname, MAX(released_year), MIN(released_year) FROM books GROUP BY author_lname;
+----------------+--------------------+--------------------+
| author_lname   | MAX(released_year) | MIN(released_year) |
+----------------+--------------------+--------------------+
| Lahiri         |               2003 |               1996 |
| Gaiman         |               2016 |               2001 |
| Eggers         |               2013 |               2001 |
| Chabon         |               2000 |               2000 |
| Smith          |               2010 |               2010 |
| Carver         |               1989 |               1981 |
| DeLillo        |               1985 |               1985 |
| Steinbeck      |               1945 |               1945 |
| Foster Wallace |               2005 |               2004 |
| Harris         |               2014 |               2001 |
| Saunders       |               2017 |               2017 |
| NULL           |               NULL |               NULL |
+----------------+--------------------+--------------------+
12 rows in set (0.000 sec)

mysql>  
    -> SELECT 
    -> author_lname, 
    -> COUNT(*) as books_written, 
    -> MAX(released_year) AS latest_release,
    -> MIN(released_year)  AS earliest_release,
    ->       MAX(pages) AS longest_page_count
    -> FROM books GROUP BY author_lname;
+----------------+---------------+----------------+------------------+--------------------+
| author_lname   | books_written | latest_release | earliest_release | longest_page_count |
+----------------+---------------+----------------+------------------+--------------------+
| Lahiri         |             2 |           2003 |             1996 |                291 |
| Gaiman         |             3 |           2016 |             2001 |                465 |
| Eggers         |             3 |           2013 |             2001 |                504 |
| Chabon         |             1 |           2000 |             2000 |                634 |
| Smith          |             1 |           2010 |             2010 |                304 |
| Carver         |             2 |           1989 |             1981 |                526 |
| DeLillo        |             1 |           1985 |             1985 |                320 |
| Steinbeck      |             1 |           1945 |             1945 |                181 |
| Foster Wallace |             2 |           2005 |             2004 |                343 |
| Harris         |             2 |           2014 |             2001 |                428 |
| Saunders       |             1 |           2017 |             2017 |                367 |
| NULL           |             1 |           NULL |             NULL |                634 |
+----------------+---------------+----------------+------------------+--------------------+
12 rows in set (0.000 sec)

mysql>  
    ->  
    -> SELECT 
    -> author_lname, 
    ->         author_fname,
    -> COUNT(*) as books_written, 
    -> MAX(released_year) AS latest_release,
    -> MIN(released_year)  AS earliest_release
    -> FROM books GROUP BY author_lname, author_fname;
+----------------+--------------+---------------+----------------+------------------+
| author_lname   | author_fname | books_written | latest_release | earliest_release |
+----------------+--------------+---------------+----------------+------------------+
| Lahiri         | Jhumpa       |             2 |           2003 |             1996 |
| Gaiman         | Neil         |             3 |           2016 |             2001 |
| Eggers         | Dave         |             3 |           2013 |             2001 |
| Chabon         | Michael      |             1 |           2000 |             2000 |
| Smith          | Patti        |             1 |           2010 |             2010 |
| Carver         | Raymond      |             2 |           1989 |             1981 |
| DeLillo        | Don          |             1 |           1985 |             1985 |
| Steinbeck      | John         |             1 |           1945 |             1945 |
| Foster Wallace | David        |             2 |           2005 |             2004 |
| Harris         | Dan          |             1 |           2014 |             2014 |
| Harris         | Freida       |             1 |           2001 |             2001 |
| Saunders       | George       |             1 |           2017 |             2017 |
| NULL           | NULL         |             1 |           NULL |             NULL |
+----------------+--------------+---------------+----------------+------------------+
13 rows in set (0.000 sec)

mysql> SELECT author_lname,sum(pages) FROM books GROUP BY author_fname;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'book_shop.books.author_lname' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT author_lname,sum(pages) FROM books GROUP BY author_lname;
+----------------+------------+
| author_lname   | sum(pages) |
+----------------+------------+
| Lahiri         |        489 |
| Gaiman         |        977 |
| Eggers         |       1293 |
| Chabon         |        634 |
| Smith          |        304 |
| Carver         |        702 |
| DeLillo        |        320 |
| Steinbeck      |        181 |
| Foster Wallace |        672 |
| Harris         |        684 |
| Saunders       |        367 |
| NULL           |        634 |
+----------------+------------+
12 rows in set (0.003 sec)

mysql> SELECT CONCAT(author_fname,' ',author_lname) as author_name,SUM(pages) from books GROUP BY author_name;
+----------------------+------------+
| author_name          | SUM(pages) |
+----------------------+------------+
| Jhumpa Lahiri        |        489 |
| Neil Gaiman          |        977 |
| Dave Eggers          |       1293 |
| Michael Chabon       |        634 |
| Patti Smith          |        304 |
| Raymond Carver       |        702 |
| Don DeLillo          |        320 |
| John Steinbeck       |        181 |
| David Foster Wallace |        672 |
| Dan Harris           |        256 |
| Freida Harris        |        428 |
| George Saunders      |        367 |
| NULL                 |        634 |
+----------------------+------------+
13 rows in set (0.000 sec)

mysql> SELECT SUM(pages) FROM books;
+------------+
| SUM(pages) |
+------------+
|       7257 |
+------------+
1 row in set (0.000 sec)

mysql>  
    ->  
    -> SELECT author_lname, COUNT(*), SUM(pages)
    -> FROM books
    -> GROUP BY author_lname;
+----------------+----------+------------+
| author_lname   | COUNT(*) | SUM(pages) |
+----------------+----------+------------+
| Lahiri         |        2 |        489 |
| Gaiman         |        3 |        977 |
| Eggers         |        3 |       1293 |
| Chabon         |        1 |        634 |
| Smith          |        1 |        304 |
| Carver         |        2 |        702 |
| DeLillo        |        1 |        320 |
| Steinbeck      |        1 |        181 |
| Foster Wallace |        2 |        672 |
| Harris         |        2 |        684 |
| Saunders       |        1 |        367 |
| NULL           |        1 |        634 |
+----------------+----------+------------+
12 rows in set (0.000 sec)
