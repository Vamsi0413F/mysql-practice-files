
mysql> SELECT DATABASE();
+------------+
| DATABASE() |
+------------+
| book_shop  |
+------------+
1 row in set (0.000 sec)

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
|      20 | the rookie                                          | NULL         | NULL           |          NULL |           NULL |   634 |
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
20 rows in set (0.005 sec)

mysql>  SELECT AVG(released_year) FROM books;
+--------------------+
| AVG(released_year) |
+--------------------+
|          1999.7895 |
+--------------------+
1 row in set (0.004 sec)

mysql> SELECT AVG(PAGES) FROM books;
+------------+
| AVG(PAGES) |
+------------+
|   362.8500 |
+------------+
1 row in set (0.000 sec)

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
|      20 | the rookie                                          | vamsi        | krishna        |          2025 |            100 |   634 |
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
20 rows in set (0.001 sec)

mysql> SELECT released_year,AVG(stock_quantity) as avg_stock FROM books GROUP BY released_year;
+---------------+-----------+
| released_year | avg_stock |
+---------------+-----------+
|          2003 |   66.0000 |
|          2016 |   43.0000 |
|          2001 |  134.3333 |
|          1996 |   97.0000 |
|          2012 |  154.0000 |
|          2013 |   26.0000 |
|          2000 |   68.0000 |
|          2010 |   55.0000 |
|          1981 |   23.0000 |
|          1989 |   12.0000 |
|          1985 |   49.0000 |
|          1945 |   95.0000 |
|          2004 |  172.0000 |
|          2005 |   92.0000 |
|          2014 |   29.0000 |
|          2017 | 1000.0000 |
|          2025 |  100.0000 |
+---------------+-----------+
17 rows in set (0.003 sec)

mysql> SELECT * FROM books WHERE released_year=2021
    -> ;
Empty set (0.001 sec)

mysql> SELECT * FROM books WHERE released_year=2001;
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                                     | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
|       3 | American Gods                             | Neil         | Gaiman       |          2001 |             12 |   465 |
|       9 | A Heartbreaking Work of Staggering Genius | Dave         | Eggers       |          2001 |            104 |   437 |
|      18 | fake_book                                 | Freida       | Harris       |          2001 |            287 |   428 |
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
3 rows in set (0.001 sec)

mysql> SELECT AVG(pages) FROM books;
+------------+
| AVG(pages) |
+------------+
|   362.8500 |
+------------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT AVG(released_year) FROM books;
+--------------------+
| AVG(released_year) |
+--------------------+
|          2001.0500 |
+--------------------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT 
    ->     released_year, 
    ->     AVG(stock_quantity), 
    ->     COUNT(*) FROM books
    -> GROUP BY released_year;
+---------------+---------------------+----------+
| released_year | AVG(stock_quantity) | COUNT(*) |
+---------------+---------------------+----------+
|          2003 |             66.0000 |        2 |
|          2016 |             43.0000 |        1 |
|          2001 |            134.3333 |        3 |
|          1996 |             97.0000 |        1 |
|          2012 |            154.0000 |        1 |
|          2013 |             26.0000 |        1 |
|          2000 |             68.0000 |        1 |
|          2010 |             55.0000 |        1 |
|          1981 |             23.0000 |        1 |
|          1989 |             12.0000 |        1 |
|          1985 |             49.0000 |        1 |
|          1945 |             95.0000 |        1 |
|          2004 |            172.0000 |        1 |
|          2005 |             92.0000 |        1 |
|          2014 |             29.0000 |        1 |
|          2017 |           1000.0000 |        1 |
|          2025 |            100.0000 |        1 |
+---------------+---------------------+----------+
17 rows in set (0.000 sec)

mysql> SELECT SUM(SELECT AVG(pages) FROM books;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELECT AVG(pages) FROM books' at line 1
mysql>  
    -> SELECT AVG(released_year) FROM books;
+--------------------+
| AVG(released_year) |
+--------------------+
|          2001.0500 |
+--------------------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT 
    ->     released_year, 
    ->     AVG(stock_quantity), 
    ->     COUNT(*) FROM books
    -> GROUP BY released_year;wfcvwf
+---------------+---------------------+----------+
| released_year | AVG(stock_quantity) | COUNT(*) |
+---------------+---------------------+----------+
|          2003 |             66.0000 |        2 |
|          2016 |             43.0000 |        1 |
|          2001 |            134.3333 |        3 |
|          1996 |             97.0000 |        1 |
|          2012 |            154.0000 |        1 |
|          2013 |             26.0000 |        1 |
|          2000 |             68.0000 |        1 |
|          2010 |             55.0000 |        1 |
|          1981 |             23.0000 |        1 |
|          1989 |             12.0000 |        1 |
|          1985 |             49.0000 |        1 |
|          1945 |             95.0000 |        1 |
|          2004 |            172.0000 |        1 |
|          2005 |             92.0000 |        1 |
|          2014 |             29.0000 |        1 |
|          2017 |           1000.0000 |        1 |
|          2025 |            100.0000 |        1 |
+---------------+---------------------+----------+
17 rows in set (0.001 sec)

    -> 
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'wfcvwf' at line 1
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
|      20 | the rookie                                          | vamsi        | krishna        |          2025 |            100 |   634 |
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
20 rows in set (0.000 sec)

mysql> SELECT SUM(stock_quantity) as total_number_of_books FROM books;
+-----------------------+
| total_number_of_books |
+-----------------------+
|                  2550 |
+-----------------------+
1 row in set (0.000 sec)

mysql> SELECT released_year,SUM(stock_quantity) FROM BOOKS GROUP BY released_year;
+---------------+---------------------+
| released_year | SUM(stock_quantity) |
+---------------+---------------------+
|          2003 |                 132 |
|          2016 |                  43 |
|          2001 |                 403 |
|          1996 |                  97 |
|          2012 |                 154 |
|          2013 |                  26 |
|          2000 |                  68 |
|          2010 |                  55 |
|          1981 |                  23 |
|          1989 |                  12 |
|          1985 |                  49 |
|          1945 |                  95 |
|          2004 |                 172 |
|          2005 |                  92 |
|          2014 |                  29 |
|          2017 |                1000 |
|          2025 |                 100 |
+---------------+---------------------+
17 rows in set (0.001 sec)

mysql> SELECT released_year,SUM(stock_quantity) FROM BOOKS GROUP BY released_year ASC;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ASC' at line 1
mysql> SELECT released_year,SUM(stock_quantity) FROM BOOKS GROUP BY released_year DESC;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DESC' at line 1
mysql> SELECT released_year,SUM(stock_quantity) FROM BOOKS ORDER BY released_year ASC;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'book_shop.BOOKS.released_year'; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT CONCAT(author_fname,' ',author_lname),AVG(released_year) FROM books GROUP BY author_fname,author_lname;
+---------------------------------------+--------------------+
| CONCAT(author_fname,' ',author_lname) | AVG(released_year) |
+---------------------------------------+--------------------+
| Jhumpa Lahiri                         |          1999.5000 |
| Neil Gaiman                           |          2006.6667 |
| Dave Eggers                           |          2008.6667 |
| Michael Chabon                        |          2000.0000 |
| Patti Smith                           |          2010.0000 |
| Raymond Carver                        |          1985.0000 |
| Don DeLillo                           |          1985.0000 |
| John Steinbeck                        |          1945.0000 |
| David Foster Wallace                  |          2004.5000 |
| Dan Harris                            |          2014.0000 |
| Freida Harris                         |          2001.0000 |
| George Saunders                       |          2017.0000 |
| vamsi krishna                         |          2025.0000 |
+---------------------------------------+--------------------+
13 rows in set (0.003 sec)

mysql> SELECT CONCAT(author_fname,' ',author_lname),MAX(pages) FROM books;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'book_shop.books.author_fname'; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT CONCAT(author_fname,' ',author_lname),MAX(pages) FROM books;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'book_shop.books.author_fname'; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT CONCAT(author_fname,' ',author_lname),MAX(pages) FROM books GROPU BY author_fname,author_lname;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'BY author_fname,author_lname' at line 1
mysql> SELECT CONCAT(author_fname,' ',author_lname),MAX(pages) FROM books GROPU BY author_fname;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'BY author_fname' at line 1
mysql> SELECT CONCAT(author_fname,' ',author_lname),MAX(pages) FROM books GROPU BY author_lname;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'BY author_lname' at line 1
mysql> SELECT CONCAT(author_fname,' ',author_lname),MAX(pages) FROM books GROUP BY author_fname,author_lname;
+---------------------------------------+------------+
| CONCAT(author_fname,' ',author_lname) | MAX(pages) |
+---------------------------------------+------------+
| Jhumpa Lahiri                         |        291 |
| Neil Gaiman                           |        465 |
| Dave Eggers                           |        504 |
| Michael Chabon                        |        634 |
| Patti Smith                           |        304 |
| Raymond Carver                        |        526 |
| Don DeLillo                           |        320 |
| John Steinbeck                        |        181 |
| David Foster Wallace                  |        343 |
| Dan Harris                            |        256 |
| Freida Harris                         |        428 |
| George Saunders                       |        367 |
| vamsi krishna                         |        634 |
+---------------------------------------+------------+
13 rows in set (0.001 sec)

mysql> SELECT CONCAT(author_fname,' ',author_lname),MAX(pages) FROM books GROUP BY author_fname,author_lname DESC LIMIT 2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DESC LIMIT 2' at line 1
mysql> SELECT CONCAT(author_fname,' ',author_lname),MAX(pages) FROM books GROUP BY author_fname,author_lname  LIMIT 2;
+---------------------------------------+------------+
| CONCAT(author_fname,' ',author_lname) | MAX(pages) |
+---------------------------------------+------------+
| Jhumpa Lahiri                         |        291 |
| Neil Gaiman                           |        465 |
+---------------------------------------+------------+
2 rows in set (0.001 sec)

mysql> SELECT CONCAT(author_fname,' ',author_lname),MAX(pages) FROM books GROUP DESC  LIMIT 2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DESC  LIMIT 2' at line 1
mysql> SELECT CONCAT(author_fname,' ',author_lname),MAX(pages) FROM books  DESC  LIMIT 2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DESC  LIMIT 2' at line 1
mysql> SELECT CONCAT(author_fname,' ',author_lname),MAX(pages) FROM books ORDER BY BY author_fname,author_lname DESC  LIMIT 2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'BY author_fname,author_lname DESC  LIMIT 2' at line 1
mysql> SELECT CONCAT(author_fname,' ',author_lname),MAX(pages) FROM books ORDER BY author_fname,author_lname DESC  LIMIT 2;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'book_shop.books.author_fname'; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT CONCAT(author_fname,' ',author_lname),MAX(pages) FROM books ORDER BY pages DESC  LIMIT 2;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'book_shop.books.author_fname'; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT CONCAT(author_fname,' ',author_lname),MAX(pages) FROM books ORDER BY pages DESC ;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'book_shop.books.author_fname'; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT CONCAT(author_fname,' ',author_lname),MAX(pages) FROM books ;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'book_shop.books.author_fname'; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT CONCAT(author_fname,' ',author_lname) AS author, pages
    -> FROM books
    -> ORDER BY pages DESC
    -> LIMIT 2;
+----------------+-------+
| author         | pages |
+----------------+-------+
| Michael Chabon |   634 |
| vamsi krishna  |   634 |
+----------------+-------+
2 rows in set (0.000 sec)

mysql> SELECT relesased_year AS year, 1 AS #books,AVG(pages) FROM books ORDER BY released_year;
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> SELECT relesased_year AS year, SUM(released_year) AS #books,AVG(pages) FROM books ORDER BY released_year GROUP BY released;
    -> 
    -> 
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> SELECT relesased_year AS year, SUM(released_year) AS #books,AVG(pages) FROM books ORDER BY released_year GROUP BY released_year;
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> SELECT relesased_year AS year, SUM(*) AS #books,AVG(pages) FROM books GROUP BY released_year  ORDER BY released_year;
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '*) AS #books,AVG(pages) FROM books GROUP BY released_year  ORDER BY released_yea' at line 1
mysql> SELECT released_year AS year, SUM(*) AS #books,AVG(pages) FROM books GROUP BY released_year  ORDER BY released_year;
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '*) AS #books,AVG(pages) FROM books GROUP BY released_year  ORDER BY released_yea' at line 1
mysql> SELECT released_year AS year, SUM(*) AS #books,AVG(pages) FROM books GROUP BY released_year ORDER BY released_year
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '*) AS #books,AVG(pages) FROM books GROUP BY released_year ORDER BY released_year' at line 1
mysql> SELECT released_year AS year, COUNT(*) AS #books,AVG(pages) FROM books GROUP BY released_year ORDER BY released_year
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> SELECT released_year AS year, COUNT(*) AS '#books',AVG(pages) FROM books GROUP BY released_year ORDER BY released_year;
+------+--------+------------+
| year | #books | AVG(pages) |
+------+--------+------------+
| 1945 |      1 |   181.0000 |
| 1981 |      1 |   176.0000 |
| 1985 |      1 |   320.0000 |
| 1989 |      1 |   526.0000 |
| 1996 |      1 |   198.0000 |
| 2000 |      1 |   634.0000 |
| 2001 |      3 |   443.3333 |
| 2003 |      2 |   249.5000 |
| 2004 |      1 |   329.0000 |
| 2005 |      1 |   343.0000 |
| 2010 |      1 |   304.0000 |
| 2012 |      1 |   352.0000 |
| 2013 |      1 |   504.0000 |
| 2014 |      1 |   256.0000 |
| 2016 |      1 |   304.0000 |
| 2017 |      1 |   367.0000 |
| 2025 |      1 |   634.0000 |
+------+--------+------------+
17 rows in set (0.001 sec)

mysql> SELECT released_year, COUNT(*) 
    -> FROM books GROUP BY released_year;
+---------------+----------+
| released_year | COUNT(*) |
+---------------+----------+
|          2003 |        2 |
|          2016 |        1 |
|          2001 |        3 |
|          1996 |        1 |
|          2012 |        1 |
|          2013 |        1 |
|          2000 |        1 |
|          2010 |        1 |
|          1981 |        1 |
|          1989 |        1 |
|          1985 |        1 |
|          1945 |        1 |
|          2004 |        1 |
|          2005 |        1 |
|          2014 |        1 |
|          2017 |        1 |
|          2025 |        1 |
+---------------+----------+
17 rows in set (0.000 sec)

mysql> SHOW WARNINGS;
Empty set (0.000 sec)

mysql> CREATE TABLE decimals 
    -> 
Display all 778 possibilities? (y or n) 
    -> 
    -> ;
ERROR 4028 (HY000): A table must have at least one visible column.
mysql> create table decimale
    ->     (number INT DECIMAL(5,3));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DECIMAL(5,3))' at line 2
mysql> create table decimale     (number INT decimal(5,3));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'decimal(5,3))' at line 1
mysql> create table decimal     (number  decimal(5,3));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'decimal     (number  decimal(5,3))' at line 1
mysql> CREATE TABLE products(price DECIMAL(5,2))
    -> ;
Query OK, 0 rows affected (0.013 sec)

mysql> INSERT INTO products(price) VALUE(24.12434),(234.788787);
Query OK, 2 rows affected, 2 warnings (0.005 sec)
Records: 2  Duplicates: 0  Warnings: 2

mysql> show warnings;
+-------+------+--------------------------------------------+
| Level | Code | Message                                    |
+-------+------+--------------------------------------------+
| Note  | 1265 | Data truncated for column 'price' at row 1 |
| Note  | 1265 | Data truncated for column 'price' at row 2 |
+-------+------+--------------------------------------------+
2 rows in set (0.000 sec)

mysql> show * in products
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '* in products' at line 1
mysql> select * in products
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'in products' at line 1
mysql> SELECT * FROM products;
+--------+
| price  |
+--------+
|  24.12 |
| 234.79 |
+--------+
2 rows in set (0.000 sec)

mysql> SELECT NOW();
+---------------------+
| NOW()               |
+---------------------+
| 2026-06-05 10:41:10 |
+---------------------+
1 row in set (0.003 sec)

mysql> select date_format(now(),'%Y-%m-%d');
+-------------------------------+
| date_format(now(),'%Y-%m-%d') |
+-------------------------------+
| 2026-06-05                    |
+-------------------------------+
1 row in set (0.003 sec)

mysql> select date_format(now(),'%y-%m-%d');
+-------------------------------+
| date_format(now(),'%y-%m-%d') |
+-------------------------------+
| 26-06-05                      |
+-------------------------------+
1 row in set (0.000 sec)

mysql> select date_format(now(),'%y-%b-%d');
+-------------------------------+
| date_format(now(),'%y-%b-%d') |
+-------------------------------+
| 26-Jun-05                     |
+-------------------------------+
1 row in set (0.003 sec)

mysql> select date_format(now(),'%d-%b-%y');
+-------------------------------+
| date_format(now(),'%d-%b-%y') |
+-------------------------------+
| 05-Jun-26                     |
+-------------------------------+
1 row in set (0.000 sec)

mysql> CREATE TABLE people (
    -> name VARCHAR(100),
    ->     birthdate DATE,
    ->     birthtime TIME,
    ->     birthdt DATETIME
    -> );
Query OK, 0 rows affected (0.008 sec)

mysql>  
    -> INSERT INTO people (name, birthdate, birthtime, birthdt)
    -> VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');
Query OK, 1 row affected (0.001 sec)

mysql>  
    -> INSERT INTO people (name, birthdate, birthtime, birthdt)
    -> VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');
Query OK, 1 row affected (0.000 sec)

mysql>  
    -> INSERT INTO people (name, birthdate, birthtime, birthdt)
    -> VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');
Query OK, 1 row affected (0.002 sec)

mysql> DESC peaple
    -> ;
ERROR 1146 (42S02): Table 'book_shop.peaple' doesn't exist
mysql> DESC people;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| name      | varchar(100) | YES  |     | NULL    |       |
| birthdate | date         | YES  |     | NULL    |       |
| birthtime | time         | YES  |     | NULL    |       |
| birthdt   | datetime     | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.005 sec)

mysql> SELECT * FROM people
    -> ;
+-------+------------+-----------+---------------------+
| name  | birthdate  | birthtime | birthdt             |
+-------+------------+-----------+---------------------+
| Elton | 2000-12-25 | 11:00:00  | 2000-12-25 11:00:00 |
| Lulu  | 1985-04-11 | 09:45:10  | 1985-04-11 09:45:10 |
| Juan  | 2020-08-15 | 23:59:00  | 2020-08-15 23:59:00 |
+-------+------------+-----------+---------------------+
3 rows in set (0.000 sec)

mysql> SELECT CURTIME)(;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')(' at line 1
mysql> SELECT CURTIME();
+-----------+
| CURTIME() |
+-----------+
| 12:51:27  |
+-----------+
1 row in set (0.003 sec)

mysql> SELECT CURTIME();
+-----------+
| CURTIME() |
+-----------+
| 12:51:30  |
+-----------+
1 row in set (0.000 sec)

mysql> SELECT CURTIME();
+-----------+
| CURTIME() |
+-----------+
| 12:51:31  |
+-----------+
1 row in set (0.000 sec)

mysql> SELECT CURTIME();
+-----------+
| CURTIME() |
+-----------+
| 12:51:31  |
+-----------+
1 row in set (0.000 sec)

mysql> SELECT CURTIME();
+-----------+
| CURTIME() |
+-----------+
| 12:51:33  |
+-----------+
1 row in set (0.000 sec)

mysql> SELECT CURDATE();
+------------+
| CURDATE()  |
+------------+
| 2026-06-05 |
+------------+
1 row in set (0.000 sec)

mysql> CREATE TABLE peoples
    -> (name VARCHAR(100),
    ->  DOB DATE DEFAULT=CURDATE() ,
    ->  DOT TIME DEFAULT=CURTIME());
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '=CURDATE() ,
 DOT TIME DEFAULT=CURTIME())' at line 3
mysql> CREATE TABLE peoples (name VARCHAR(100),  DOB DATE DEFAULT CURDATE() ,  DOT TIME DEFAULT CURTIME());
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CURDATE() ,  DOT TIME DEFAULT CURTIME())' at line 1
mysql> CREATE TABLE peoples (name VARCHAR(100),  DOB DATE DEFAULT CURDATE ,  DOT TIME DEFAULT CURTIME);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CURDATE ,  DOT TIME DEFAULT CURTIME)' at line 1
mysql> CREATE TABLE peoples (name VARCHAR(100),  DOB DATE DEFAULT (CURDATE()) ,  DOT TIME DEFAULT (CURTIME()));
Query OK, 0 rows affected (0.009 sec)

mysql> INSERT INTO poples(name) VALUES('Vamsi');
ERROR 1146 (42S02): Table 'book_shop.poples' doesn't exist
mysql> INSERT INTO peoples(name) VALUES('Vamsi');
Query OK, 1 row affected (0.002 sec)

mysql> SELECT * FROM peoples
    -> ;
+-------+------------+----------+
| name  | DOB        | DOT      |
+-------+------------+----------+
| Vamsi | 2026-06-05 | 12:55:16 |
+-------+------------+----------+
1 row in set (0.000 sec)

mysql> INSERT INTO peoples(name) VALUES('Vamsi');
Query OK, 1 row affected (0.003 sec)

mysql> SELECT * FROM peoples;
+-------+------------+----------+
| name  | DOB        | DOT      |
+-------+------------+----------+
| Vamsi | 2026-06-05 | 12:55:16 |
| Vamsi | 2026-06-05 | 12:58:50 |
+-------+------------+----------+
2 rows in set (0.000 sec)

mysql> SELECT NOW();;
+---------------------+
| NOW()               |
+---------------------+
| 2026-06-05 13:03:06 |
+---------------------+
1 row in set (0.000 sec)

ERROR: 
No query specified

mysql> DROP TABLE peoples;
Query OK, 0 rows affected (0.008 sec)

mysql> SELECT CURTIME();
+-----------+
| CURTIME() |
+-----------+
| 13:04:33  |
+-----------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT CURDATE();
+------------+
| CURDATE()  |
+------------+
| 2026-06-05 |
+------------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT NOW();
+---------------------+
| NOW()               |
+---------------------+
| 2026-06-05 13:04:33 |
+---------------------+
1 row in set (0.000 sec)

mysql>  
    -> INSERT INTO people (name, birthdate, birthtime, birthdt)
    -> VALUES ('Hazel', CURDATE(), CURTIME(), NOW());
Query OK, 1 row affected (0.001 sec)

mysql> SELECT * FROM people;
+-------+------------+-----------+---------------------+
| name  | birthdate  | birthtime | birthdt             |
+-------+------------+-----------+---------------------+
| Elton | 2000-12-25 | 11:00:00  | 2000-12-25 11:00:00 |
| Lulu  | 1985-04-11 | 09:45:10  | 1985-04-11 09:45:10 |
| Juan  | 2020-08-15 | 23:59:00  | 2020-08-15 23:59:00 |
| Hazel | 2026-06-05 | 13:04:36  | 2026-06-05 13:04:36 |
+-------+------------+-----------+---------------------+
4 rows in set (0.000 sec)

mysql> 
mysql> SELECT birth_date from people;
ERROR 1054 (42S22): Unknown column 'birth_date' in 'field list'
mysql> SELECT birthdate from people;
+------------+
| birthdate  |
+------------+
| 2000-12-25 |
| 1985-04-11 |
| 2020-08-15 |
| 2026-06-05 |
+------------+
4 rows in set (0.000 sec)

mysql> SELECT day(birthdate) from people;
+----------------+
| day(birthdate) |
+----------------+
|             25 |
|             11 |
|             15 |
|              5 |
+----------------+
4 rows in set (0.003 sec)

mysql> SELECT day(birthdate),dayofweek(birthdate) from people;
+----------------+----------------------+
| day(birthdate) | dayofweek(birthdate) |
+----------------+----------------------+
|             25 |                    2 |
|             11 |                    5 |
|             15 |                    7 |
|              5 |                    6 |
+----------------+----------------------+
4 rows in set (0.001 sec)

mysql> SELECT birthdate,day(birthdate),dayofweek(birthdate) from people;
+------------+----------------+----------------------+
| birthdate  | day(birthdate) | dayofweek(birthdate) |
+------------+----------------+----------------------+
| 2000-12-25 |             25 |                    2 |
| 1985-04-11 |             11 |                    5 |
| 2020-08-15 |             15 |                    7 |
| 2026-06-05 |              5 |                    6 |
+------------+----------------+----------------------+
4 rows in set (0.000 sec)

mysql> SELECT birthdate,day(birthdate),dayofweek(birthdate),dayofyear(birthdate) from people;
+------------+----------------+----------------------+----------------------+
| birthdate  | day(birthdate) | dayofweek(birthdate) | dayofyear(birthdate) |
+------------+----------------+----------------------+----------------------+
| 2000-12-25 |             25 |                    2 |                  360 |
| 1985-04-11 |             11 |                    5 |                  101 |
| 2020-08-15 |             15 |                    7 |                  228 |
| 2026-06-05 |              5 |                    6 |                  156 |
+------------+----------------+----------------------+----------------------+
4 rows in set (0.000 sec)

mysql> SELECT birthdate,day(birthdate),dayofweek(birthdate),dayofyear(birthdate),monthname(birthdate) from people;
+------------+----------------+----------------------+----------------------+----------------------+
| birthdate  | day(birthdate) | dayofweek(birthdate) | dayofyear(birthdate) | monthname(birthdate) |
+------------+----------------+----------------------+----------------------+----------------------+
| 2000-12-25 |             25 |                    2 |                  360 | December             |
| 1985-04-11 |             11 |                    5 |                  101 | April                |
| 2020-08-15 |             15 |                    7 |                  228 | August               |
| 2026-06-05 |              5 |                    6 |                  156 | June                 |
+------------+----------------+----------------------+----------------------+----------------------+
4 rows in set (0.000 sec)

mysql> SELECT birthdate,day(birthdate),dayofweek(birthdate),dayofyear(birthdate),monthname(birthdate),week(birthdate) from people;
+------------+----------------+----------------------+----------------------+----------------------+-----------------+
| birthdate  | day(birthdate) | dayofweek(birthdate) | dayofyear(birthdate) | monthname(birthdate) | week(birthdate) |
+------------+----------------+----------------------+----------------------+----------------------+-----------------+
| 2000-12-25 |             25 |                    2 |                  360 | December             |              52 |
| 1985-04-11 |             11 |                    5 |                  101 | April                |              14 |
| 2020-08-15 |             15 |                    7 |                  228 | August               |              32 |
| 2026-06-05 |              5 |                    6 |                  156 | June                 |              22 |
+------------+----------------+----------------------+----------------------+----------------------+-----------------+
4 rows in set (0.000 sec)

mysql> SELECT birthtime,day(birthtime),dayofweek(birthtime),dayofyear(birthtime),monthname(birthtime),week(birthtime) from people;
+-----------+----------------+----------------------+----------------------+----------------------+-----------------+
| birthtime | day(birthtime) | dayofweek(birthtime) | dayofyear(birthtime) | monthname(birthtime) | week(birthtime) |
+-----------+----------------+----------------------+----------------------+----------------------+-----------------+
| 11:00:00  |              5 |                    6 |                  156 | June                 |              22 |
| 09:45:10  |              5 |                    6 |                  156 | June                 |              22 |
| 23:59:00  |              5 |                    6 |                  156 | June                 |              22 |
| 13:04:36  |              5 |                    6 |                  156 | June                 |              22 |
+-----------+----------------+----------------------+----------------------+----------------------+-----------------+
4 rows in set (0.001 sec)

mysql> SELECT birthdt,day(birthdt),dayofweek(birthdt),dayofyear(birthdt),monthname(birthdt),week(birthdt) from people;
+---------------------+--------------+--------------------+--------------------+--------------------+---------------+
| birthdt             | day(birthdt) | dayofweek(birthdt) | dayofyear(birthdt) | monthname(birthdt) | week(birthdt) |
+---------------------+--------------+--------------------+--------------------+--------------------+---------------+
| 2000-12-25 11:00:00 |           25 |                  2 |                360 | December           |            52 |
| 1985-04-11 09:45:10 |           11 |                  5 |                101 | April              |            14 |
| 2020-08-15 23:59:00 |           15 |                  7 |                228 | August             |            32 |
| 2026-06-05 13:04:36 |            5 |                  6 |                156 | June               |            22 |
+---------------------+--------------+--------------------+--------------------+--------------------+---------------+
4 rows in set (0.001 sec)

mysql> SELECT 
    ->     birthdate,
    ->     DAY(birthdate),
    ->     DAYOFWEEK(birthdate),
    ->     DAYOFYEAR(birthdate)
    -> FROM people;
+------------+----------------+----------------------+----------------------+
| birthdate  | DAY(birthdate) | DAYOFWEEK(birthdate) | DAYOFYEAR(birthdate) |
+------------+----------------+----------------------+----------------------+
| 2000-12-25 |             25 |                    2 |                  360 |
| 1985-04-11 |             11 |                    5 |                  101 |
| 2020-08-15 |             15 |                    7 |                  228 |
| 2026-06-05 |              5 |                    6 |                  156 |
+------------+----------------+----------------------+----------------------+
4 rows in set (0.000 sec)

mysql>  
    -> SELECT 
    ->     birthdate,
    ->     MONTHNAME(birthdate),
    ->     YEAR(birthdate)
    -> FROM people;
+------------+----------------------+-----------------+
| birthdate  | MONTHNAME(birthdate) | YEAR(birthdate) |
+------------+----------------------+-----------------+
| 2000-12-25 | December             |            2000 |
| 1985-04-11 | April                |            1985 |
| 2020-08-15 | August               |            2020 |
| 2026-06-05 | June                 |            2026 |
+------------+----------------------+-----------------+
4 rows in set (0.000 sec)

mysql> SELECT 
    ->     birthtime,
    ->     HOUR(birthtime),
    ->     MINUTE(birthtime)
    -> FROM people;
+-----------+-----------------+-------------------+
| birthtime | HOUR(birthtime) | MINUTE(birthtime) |
+-----------+-----------------+-------------------+
| 11:00:00  |              11 |                 0 |
| 09:45:10  |               9 |                45 |
| 23:59:00  |              23 |                59 |
| 13:04:36  |              13 |                 4 |
+-----------+-----------------+-------------------+
4 rows in set (0.000 sec)

mysql>  
    -> SELECT 
    ->     birthdt,
    ->     MONTH(birthdt),
    ->     DAY(birthdt),
    ->     HOUR(birthdt),
    ->     MINUTE(birthdt)
    -> FROM people;
+---------------------+----------------+--------------+---------------+-----------------+
| birthdt             | MONTH(birthdt) | DAY(birthdt) | HOUR(birthdt) | MINUTE(birthdt) |
+---------------------+----------------+--------------+---------------+-----------------+
| 2000-12-25 11:00:00 |             12 |           25 |            11 |               0 |
| 1985-04-11 09:45:10 |              4 |           11 |             9 |              45 |
| 2020-08-15 23:59:00 |              8 |           15 |            23 |              59 |
| 2026-06-05 13:04:36 |              6 |            5 |            13 |               4 |
+---------------------+----------------+--------------+---------------+-----------------+
4 rows in set (0.000 sec)

mysql> 
mysql> SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %D') FROM people;
+------------+------------------------------------+
| birthdate  | DATE_FORMAT(birthdate, '%a %b %D') |
+------------+------------------------------------+
| 2000-12-25 | Mon Dec 25th                       |
| 1985-04-11 | Thu Apr 11th                       |
| 2020-08-15 | Sat Aug 15th                       |
| 2026-06-05 | Fri Jun 5th                        |
+------------+------------------------------------+
4 rows in set (0.000 sec)

mysql>  
    -> SELECT birthdt, DATE_FORMAT(birthdt, '%H:%i') FROM people;
+---------------------+-------------------------------+
| birthdt             | DATE_FORMAT(birthdt, '%H:%i') |
+---------------------+-------------------------------+
| 2000-12-25 11:00:00 | 11:00                         |
| 1985-04-11 09:45:10 | 09:45                         |
| 2020-08-15 23:59:00 | 23:59                         |
| 2026-06-05 13:04:36 | 13:04                         |
+---------------------+-------------------------------+
4 rows in set (0.000 sec)

mysql>  
    -> SELECT birthdt, DATE_FORMAT(birthdt, 'BORN ON: %r') FROM people;
+---------------------+-------------------------------------+
| birthdt             | DATE_FORMAT(birthdt, 'BORN ON: %r') |
+---------------------+-------------------------------------+
| 2000-12-25 11:00:00 | BORN ON: 11:00:00 AM                |
| 1985-04-11 09:45:10 | BORN ON: 09:45:10 AM                |
| 2020-08-15 23:59:00 | BORN ON: 11:59:00 PM                |
| 2026-06-05 13:04:36 | BORN ON: 01:04:36 PM                |
+---------------------+-------------------------------------+
4 rows in set (0.000 sec)

mysql> SELECT MAX(BIRTHDATE) from people;
+----------------+
| MAX(BIRTHDATE) |
+----------------+
| 2026-06-05     |
+----------------+
1 row in set (0.000 sec)

mysql> SELECT MIN(BIRTHDATE) from people;
+----------------+
| MIN(BIRTHDATE) |
+----------------+
| 1985-04-11     |
+----------------+
1 row in set (0.000 sec)

mysql> SELECT DATEDIFF(MAX(BIRTHDATE) ,MIN(BIRTHDATE));
ERROR 1054 (42S22): Unknown column 'BIRTHDATE' in 'field list'
mysql> SELECT DATEDIFF(MAX(BIRTHDATE) ,MIN(BIRTHDATE)) FROM people;
+------------------------------------------+
| DATEDIFF(MAX(BIRTHDATE) ,MIN(BIRTHDATE)) |
+------------------------------------------+
|                                    15030 |
+------------------------------------------+
1 row in set (0.001 sec)

mysql> SELECT DATEDIFF(CURDATE,BIRTHDATE) from people;
ERROR 1054 (42S22): Unknown column 'CURDATE' in 'field list'
mysql> SELECT DATEDIFF(CURDATE(),BIRTHDATE) from people;
+-------------------------------+
| DATEDIFF(CURDATE(),BIRTHDATE) |
+-------------------------------+
|                          9293 |
|                         15030 |
|                          2120 |
|                             0 |
+-------------------------------+
4 rows in set (0.000 sec)

mysql> SELECT TIMEDIFF(CURTIME(),BIRTHDT) from people;
+-----------------------------+
| TIMEDIFF(CURTIME(),BIRTHDT) |
+-----------------------------+
| NULL                        |
| NULL                        |
| NULL                        |
| NULL                        |
+-----------------------------+
4 rows in set (0.003 sec)

mysql> SELECT DATE_ADD(BIRTHDATE, INERVAL18 year) as MAJOR_AGE FROM people;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'INERVAL18 year) as MAJOR_AGE FROM people' at line 1
mysql> SELECT DATE_ADD(BIRTHDATE, INERVAL 18 year) as MAJOR_AGE FROM people;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'INERVAL 18 year) as MAJOR_AGE FROM people' at line 1
mysql> SELECT DATE_ADD(BIRTHDATE, INTERVAL 18 year) as MAJOR_AGE FROM people;
+------------+
| MAJOR_AGE  |
+------------+
| 2018-12-25 |
| 2003-04-11 |
| 2038-08-15 |
| 2044-06-05 |
+------------+
4 rows in set (0.000 sec)

mysql> SELECT BIRTHDATE<DATE_ADD(BIRTHDATE, INTERVAL 18 year) as MAJOR_AGE FROM people;
+-----------+
| MAJOR_AGE |
+-----------+
|         1 |
|         1 |
|         1 |
|         1 |
+-----------+
4 rows in set (0.000 sec)

mysql> SELECT BIRTHDATE,DATE_ADD(BIRTHDATE, INTERVAL 18 year) as MAJOR_AGE FROM people;
+------------+------------+
| BIRTHDATE  | MAJOR_AGE  |
+------------+------------+
| 2000-12-25 | 2018-12-25 |
| 1985-04-11 | 2003-04-11 |
| 2020-08-15 | 2038-08-15 |
| 2026-06-05 | 2044-06-05 |
+------------+------------+
4 rows in set (0.000 sec)

mysql> SELECT TIMESTAMP
    -> ();
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 2
mysql> SELECT TIMESTAMP ();
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> SELECT TIMESTAMP();
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> SELECT TIMESTAMP;
ERROR 1054 (42S22): Unknown column 'TIMESTAMP' in 'field list'
mysql> TIMESTAMP;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'TIMESTAMP' at line 1
mysql> create table captions
    -> 
    -> 
    -> ;
ERROR 4028 (HY000): A table must have at least one visible column.
mysql>  create table captions
    ->     (time TIMESTAMP);
Query OK, 0 rows affected (0.006 sec)

mysql> DRop table captions;
Query OK, 0 rows affected (0.003 sec)

mysql> create table captions
    ->     (name VARCHAR(100
    -> 
    -> 
    -> 
    -> 
    -> 
    -> ),time TIMESTAMP);
Query OK, 0 rows affected (0.006 sec)

mysql> INSERT INTO captions VALUES('vamsi',current_timestamp);
Query OK, 1 row affected (0.001 sec)

mysql> select * from captiions;
ERROR 1146 (42S02): Table 'book_shop.captiions' doesn't exist
mysql> select * from captions;
+-------+---------------------+
| name  | time                |
+-------+---------------------+
| vamsi | 2026-06-05 13:48:59 |
+-------+---------------------+
1 row in set (0.000 sec)

mysql> CREATE TABLE captions2 (
    ->   text VARCHAR(150),
    ->   created_at TIMESTAMP default CURRENT_TIMESTAMP,
    ->   updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    -> );
Query OK, 0 rows affected (0.008 sec)

mysql> -- What's a good use case for CHAR?
Query OK, 0 rows affected (0.000 sec)

mysql>  
    -> -- Used for text that we know has a fixed length, e.g., State abbreviations, 
    -> -- abbreviated company names, etc.
    ->  
    -> CREATE TABLE inventory (
    ->     item_name VARCHAR(100),
    ->     price DECIMAL(8,2),
    ->     quantity INT
    -> );
Query OK, 0 rows affected (0.004 sec)

mysql>  
    -> -- What's the difference between DATETIME and TIMESTAMP?
    ->  
    -> -- They both store datetime information, but there's a difference in the range, 
    -> -- TIMESTAMP has a smaller range. TIMESTAMP also takes up less space. 
    -> -- TIMESTAMP is used for things like meta-data about when something is created
    -> -- or updated.
    ->  
    ->  
    -> SELECT CURTIME();
+-----------+
| CURTIME() |
+-----------+
| 14:00:25  |
+-----------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT CURDATE();
+------------+
| CURDATE()  |
+------------+
| 2026-06-05 |
+------------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT DAYOFWEEK(CURDATE());
+----------------------+
| DAYOFWEEK(CURDATE()) |
+----------------------+
|                    6 |
+----------------------+
1 row in set (0.000 sec)

mysql> SELECT DAYOFWEEK(NOW());
+------------------+
| DAYOFWEEK(NOW()) |
+------------------+
|                6 |
+------------------+
1 row in set (0.000 sec)

mysql> SELECT DATE_FORMAT(NOW(), '%w') + 1;
+------------------------------+
| DATE_FORMAT(NOW(), '%w') + 1 |
+------------------------------+
|                            6 |
+------------------------------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT DAYNAME(NOW());
+----------------+
| DAYNAME(NOW()) |
+----------------+
| Friday         |
+----------------+
1 row in set (0.000 sec)

mysql> SELECT DATE_FORMAT(NOW(), '%W');
+--------------------------+
| DATE_FORMAT(NOW(), '%W') |
+--------------------------+
| Friday                   |
+--------------------------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');
+------------------------------------+
| DATE_FORMAT(CURDATE(), '%m/%d/%Y') |
+------------------------------------+
| 06/05/2026                         |
+------------------------------------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT DATE_FORMAT(NOW(), '%M %D at %k:%i');
+--------------------------------------+
| DATE_FORMAT(NOW(), '%M %D at %k:%i') |
+--------------------------------------+
| June 5th at 14:00                    |
+--------------------------------------+
1 row in set (0.000 sec)

mysql>  
    -> CREATE TABLE tweets(
    ->     content VARCHAR(140),
    ->     username VARCHAR(20),
    ->     created_at TIMESTAMP DEFAULT NOW()
    -> );
Query OK, 0 rows affected (0.002 sec)

mysql>  
    -> INSERT INTO tweets (content, username) VALUES('this is my first tweet', 'coltscat');
Query OK, 1 row affected (0.002 sec)

mysql> SELECT * FROM tweets;
+------------------------+----------+---------------------+
| content                | username | created_at          |
+------------------------+----------+---------------------+
| this is my first tweet | coltscat | 2026-06-05 14:00:25 |
+------------------------+----------+---------------------+
1 row in set (0.000 sec)

mysql>  
    -> INSERT INTO tweets (content, username) VALUES('this is my second tweet', 'coltscat');
Query OK, 1 row affected (0.000 sec)

mysql> SELECT * FROM tweets;
+-------------------------+----------+---------------------+
| content                 | username | created_at          |
+-------------------------+----------+---------------------+
| this is my first tweet  | coltscat | 2026-06-05 14:00:25 |
| this is my second tweet | coltscat | 2026-06-05 14:00:25 |
+-------------------------+----------+---------------------+
2 rows in set (0.000 sec)

mysql> mysql>  
    ->     -> INSERT INTO tweets (content, username) VALUES('this is my first tweet', 'coltscat');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'mysql>  
    -> INSERT INTO tweets (content, username) VALUES('this is my first ' at line 1
mysql> Query OK, 1 row affected (0.002 sec)
    -> 
    -> mysql> SELECT * FROM tweets;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Query OK, 1 row affected (0.002 sec)

mysql> SELECT * FROM tweets' at line 1
mysql> +------------------------+----------+---------------------+
    -> | content                | username | created_at          |
    -> +------------------------+----------+---------------------+
    -> | this is my first tweet | coltscat | 2026-06-05 14:00:25 |
    -> +------------------------+----------+---------------------+
    -> 1 row in set (0.000 sec)
    -> 
    -> mysql>  
    ->     -> INSERT INTO tweets (content, username) VALUES('this is my second tweet', 'coltscat');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '+------------------------+----------+---------------------+
| content           ' at line 1
mysql> Query OK, 1 row affected (0.000 sec)
    -> 
    -> mysql> SELECT * FROM tweets;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Query OK, 1 row affected (0.000 sec)

mysql> SELECT * FROM tweets' at line 1
mysql> +-------------------------+----------+---------------------+
    -> | content                 | username | created_at          |
    -> +-------------------------+----------+---------------------+
    -> | this is my first tweet  | coltscat | 2026-06-05 14:00:25 |
    -> | this is my second tweet | coltscat | 2026-06-05 14:00:25 |
    -> +-------------------------+----------+---------------------+
    -> 2 rows in set (0.000 sec)
