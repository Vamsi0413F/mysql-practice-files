
mysql> use book_shop;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
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

mysql> select released_year +! 2017 from books;
+-----------------------+
| released_year +! 2017 |
+-----------------------+
|                  2003 |
|                  2016 |
|                  2001 |
|                  1996 |
|                  2012 |
|                  2013 |
|                  2000 |
|                  2010 |
|                  2001 |
|                  2003 |
|                  1981 |
|                  1989 |
|                  1985 |
|                  1945 |
|                  2004 |
|                  2005 |
|                  2014 |
|                  2001 |
|                  2017 |
|                  2025 |
+-----------------------+
20 rows in set, 1 warning (0.001 sec)

mysql> select released_year =! 2017 from books;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '=! 2017 from books' at line 1
mysql> SELECT * FROM books where released_year!=2017;
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
|      20 | the rookie                                          | vamsi        | krishna        |          2025 |            100 |   634 |
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
19 rows in set (0.001 sec)

mysql> -- lincon and the bardo is not there here
Query OK, 0 rows affected (0.000 sec)

mysql> select title,author_lname from books where author_lname!='Gaiman';
+-----------------------------------------------------+----------------+
| title                                               | author_lname   |
+-----------------------------------------------------+----------------+
| The Namesake                                        | Lahiri         |
| Interpreter of Maladies                             | Lahiri         |
| A Hologram for the King: A Novel                    | Eggers         |
| The Circle                                          | Eggers         |
| The Amazing Adventures of Kavalier & Clay           | Chabon         |
| Just Kids                                           | Smith          |
| A Heartbreaking Work of Staggering Genius           | Eggers         |
| What We Talk About When We Talk About Love: Stories | Carver         |
| Where I'm Calling From: Selected Stories            | Carver         |
| White Noise                                         | DeLillo        |
| Cannery Row                                         | Steinbeck      |
| Oblivion: Stories                                   | Foster Wallace |
| Consider the Lobster                                | Foster Wallace |
| 10% Happier                                         | Harris         |
| fake_book                                           | Harris         |
| Lincoln In The Bardo                                | Saunders       |
| the rookie                                          | krishna        |
+-----------------------------------------------------+----------------+
17 rows in set (0.003 sec)

mysql> select title,author_lname from books where author_lname='Gaiman';
+-----------------+--------------+
| title           | author_lname |
+-----------------+--------------+
| Norse Mythology | Gaiman       |
| American Gods   | Gaiman       |
| Coraline        | Gaiman       |
+-----------------+--------------+
3 rows in set (0.001 sec)

mysql> SELECt title FROM BOOKS WHERE title like '% %';
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| The Namesake                                        |
| Norse Mythology                                     |
| American Gods                                       |
| Interpreter of Maladies                             |
| A Hologram for the King: A Novel                    |
| The Circle                                          |
| The Amazing Adventures of Kavalier & Clay           |
| Just Kids                                           |
| A Heartbreaking Work of Staggering Genius           |
| What We Talk About When We Talk About Love: Stories |
| Where I'm Calling From: Selected Stories            |
| White Noise                                         |
| Cannery Row                                         |
| Oblivion: Stories                                   |
| Consider the Lobster                                |
| 10% Happier                                         |
| Lincoln In The Bardo                                |
| the rookie                                          |
+-----------------------------------------------------+
18 rows in set (0.005 sec)

mysql> SELECt title FROM BOOKS WHERE title like '%a %';
+-------------------------------------------+
| title                                     |
+-------------------------------------------+
| A Hologram for the King: A Novel          |
| A Heartbreaking Work of Staggering Genius |
+-------------------------------------------+
2 rows in set (0.001 sec)

mysql> SELECt title FROM BOOKS WHERE title not  like '%a %';
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| The Namesake                                        |
| Norse Mythology                                     |
| American Gods                                       |
| Interpreter of Maladies                             |
| The Circle                                          |
| The Amazing Adventures of Kavalier & Clay           |
| Just Kids                                           |
| Coraline                                            |
| What We Talk About When We Talk About Love: Stories |
| Where I'm Calling From: Selected Stories            |
| White Noise                                         |
| Cannery Row                                         |
| Oblivion: Stories                                   |
| Consider the Lobster                                |
| 10% Happier                                         |
| fake_book                                           |
| Lincoln In The Bardo                                |
| the rookie                                          |
+-----------------------------------------------------+
18 rows in set (0.001 sec)

mysql> SELECt title FROM BOOKS WHERE title not  like '%the%';
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| Norse Mythology                                     |
| American Gods                                       |
| Interpreter of Maladies                             |
| Just Kids                                           |
| A Heartbreaking Work of Staggering Genius           |
| Coraline                                            |
| What We Talk About When We Talk About Love: Stories |
| Where I'm Calling From: Selected Stories            |
| White Noise                                         |
| Cannery Row                                         |
| Oblivion: Stories                                   |
| 10% Happier                                         |
| fake_book                                           |
+-----------------------------------------------------+
13 rows in set (0.000 sec)

mysql> SELECt title FROM BOOKS WHERE title  like '%the%';
+-------------------------------------------+
| title                                     |
+-------------------------------------------+
| The Namesake                              |
| A Hologram for the King: A Novel          |
| The Circle                                |
| The Amazing Adventures of Kavalier & Clay |
| Consider the Lobster                      |
| Lincoln In The Bardo                      |
| the rookie                                |
+-------------------------------------------+
7 rows in set (0.000 sec)

mysql> SELECt title FROM BOOKS WHERE title  like '%%';
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| The Namesake                                        |
| Norse Mythology                                     |
| American Gods                                       |
| Interpreter of Maladies                             |
| A Hologram for the King: A Novel                    |
| The Circle                                          |
| The Amazing Adventures of Kavalier & Clay           |
| Just Kids                                           |
| A Heartbreaking Work of Staggering Genius           |
| Coraline                                            |
| What We Talk About When We Talk About Love: Stories |
| Where I'm Calling From: Selected Stories            |
| White Noise                                         |
| Cannery Row                                         |
| Oblivion: Stories                                   |
| Consider the Lobster                                |
| 10% Happier                                         |
| fake_book                                           |
| Lincoln In The Bardo                                |
| the rookie                                          |
+-----------------------------------------------------+
20 rows in set (0.000 sec)

mysql> SELECt title FROM BOOKS WHERE title not like '% %';
+-----------+
| title     |
+-----------+
| Coraline  |
| fake_book |
+-----------+
2 rows in set (0.000 sec)

mysql> SELECT * FROM books where released_year > 2000;
+---------+-------------------------------------------+--------------+----------------+---------------+----------------+-------+
| book_id | title                                     | author_fname | author_lname   | released_year | stock_quantity | pages |
+---------+-------------------------------------------+--------------+----------------+---------------+----------------+-------+
|       1 | The Namesake                              | Jhumpa       | Lahiri         |          2003 |             32 |   291 |
|       2 | Norse Mythology                           | Neil         | Gaiman         |          2016 |             43 |   304 |
|       3 | American Gods                             | Neil         | Gaiman         |          2001 |             12 |   465 |
|       5 | A Hologram for the King: A Novel          | Dave         | Eggers         |          2012 |            154 |   352 |
|       6 | The Circle                                | Dave         | Eggers         |          2013 |             26 |   504 |
|       8 | Just Kids                                 | Patti        | Smith          |          2010 |             55 |   304 |
|       9 | A Heartbreaking Work of Staggering Genius | Dave         | Eggers         |          2001 |            104 |   437 |
|      10 | Coraline                                  | Neil         | Gaiman         |          2003 |            100 |   208 |
|      15 | Oblivion: Stories                         | David        | Foster Wallace |          2004 |            172 |   329 |
|      16 | Consider the Lobster                      | David        | Foster Wallace |          2005 |             92 |   343 |
|      17 | 10% Happier                               | Dan          | Harris         |          2014 |             29 |   256 |
|      18 | fake_book                                 | Freida       | Harris         |          2001 |            287 |   428 |
|      19 | Lincoln In The Bardo                      | George       | Saunders       |          2017 |           1000 |   367 |
|      20 | the rookie                                | vamsi        | krishna        |          2025 |            100 |   634 |
+---------+-------------------------------------------+--------------+----------------+---------------+----------------+-------+
14 rows in set (0.001 sec)

mysql> SELECT * FROM books where pages>500;
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                                     | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
|       6 | The Circle                                | Dave         | Eggers       |          2013 |             26 |   504 |
|       7 | The Amazing Adventures of Kavalier & Clay | Michael      | Chabon       |          2000 |             68 |   634 |
|      12 | Where I'm Calling From: Selected Stories  | Raymond      | Carver       |          1989 |             12 |   526 |
|      20 | the rookie                                | vamsi        | krishna      |          2025 |            100 |   634 |
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
4 rows in set (0.001 sec)

mysql> SELECT 99>1;
+------+
| 99>1 |
+------+
|    1 |
+------+
1 row in set (0.000 sec)

mysql> SELECT 99<1;
+------+
| 99<1 |
+------+
|    0 |
+------+
1 row in set (0.000 sec)

mysql> SELECT title,pages,released_year from books where pages>500;
+-------------------------------------------+-------+---------------+
| title                                     | pages | released_year |
+-------------------------------------------+-------+---------------+
| The Circle                                |   504 |          2013 |
| The Amazing Adventures of Kavalier & Clay |   634 |          2000 |
| Where I'm Calling From: Selected Stories  |   526 |          1989 |
| the rookie                                |   634 |          2025 |
+-------------------------------------------+-------+---------------+
4 rows in set (0.000 sec)

mysql> 3+null;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '3+null' at line 1
mysql> 0>null;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '0>null' at line 1
mysql> 1>null;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '1>null' at line 1
mysql> select 1>null;
+--------+
| 1>null |
+--------+
|   NULL |
+--------+
1 row in set (0.003 sec)

mysql> select 3+null;
+--------+
| 3+null |
+--------+
|   NULL |
+--------+
1 row in set (0.000 sec)

mysql> SELECT title,pages,released_year from books where pages<500;
+-----------------------------------------------------+-------+---------------+
| title                                               | pages | released_year |
+-----------------------------------------------------+-------+---------------+
| The Namesake                                        |   291 |          2003 |
| Norse Mythology                                     |   304 |          2016 |
| American Gods                                       |   465 |          2001 |
| Interpreter of Maladies                             |   198 |          1996 |
| A Hologram for the King: A Novel                    |   352 |          2012 |
| Just Kids                                           |   304 |          2010 |
| A Heartbreaking Work of Staggering Genius           |   437 |          2001 |
| Coraline                                            |   208 |          2003 |
| What We Talk About When We Talk About Love: Stories |   176 |          1981 |
| White Noise                                         |   320 |          1985 |
| Cannery Row                                         |   181 |          1945 |
| Oblivion: Stories                                   |   329 |          2004 |
| Consider the Lobster                                |   343 |          2005 |
| 10% Happier                                         |   256 |          2014 |
| fake_book                                           |   428 |          2001 |
| Lincoln In The Bardo                                |   367 |          2017 |
+-----------------------------------------------------+-------+---------------+
16 rows in set (0.000 sec)

mysql> SELECT * FROM books where released_year < 2000;
+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                                               | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
|       4 | Interpreter of Maladies                             | Jhumpa       | Lahiri       |          1996 |             97 |   198 |
|      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver       |          1981 |             23 |   176 |
|      12 | Where I'm Calling From: Selected Stories            | Raymond      | Carver       |          1989 |             12 |   526 |
|      13 | White Noise                                         | Don          | DeLillo      |          1985 |             49 |   320 |
|      14 | Cannery Row                                         | John         | Steinbeck    |          1945 |             95 |   181 |
+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
5 rows in set (0.001 sec)

mysql> SELECT title,pages,released_year from books where pages<200;
+-----------------------------------------------------+-------+---------------+
| title                                               | pages | released_year |
+-----------------------------------------------------+-------+---------------+
| Interpreter of Maladies                             |   198 |          1996 |
| What We Talk About When We Talk About Love: Stories |   176 |          1981 |
| Cannery Row                                         |   181 |          1945 |
+-----------------------------------------------------+-------+---------------+
3 rows in set (0.000 sec)

mysql> SELECT title,pages,released_year from books where pages<=200;
+-----------------------------------------------------+-------+---------------+
| title                                               | pages | released_year |
+-----------------------------------------------------+-------+---------------+
| Interpreter of Maladies                             |   198 |          1996 |
| What We Talk About When We Talk About Love: Stories |   176 |          1981 |
| Cannery Row                                         |   181 |          1945 |
+-----------------------------------------------------+-------+---------------+
3 rows in set (0.001 sec)

mysql> SELECT title,pages,released_year from books where pages<=291;
+-----------------------------------------------------+-------+---------------+
| title                                               | pages | released_year |
+-----------------------------------------------------+-------+---------------+
| The Namesake                                        |   291 |          2003 |
| Interpreter of Maladies                             |   198 |          1996 |
| Coraline                                            |   208 |          2003 |
| What We Talk About When We Talk About Love: Stories |   176 |          1981 |
| Cannery Row                                         |   181 |          1945 |
| 10% Happier                                         |   256 |          2014 |
+-----------------------------------------------------+-------+---------------+
6 rows in set (0.001 sec)

mysql> SELECT * FROM books where author_last name='Gaiman' && released_year=2016;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'name='Gaiman' && released_year=2016' at line 1
mysql> SELECT * FROM books where author_last name='Gaiman' and released_year=2016;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'name='Gaiman' and released_year=2016' at line 1
mysql> SELECT * FROM books where author_lname='Gaiman' and released_year=2016;
+---------+-----------------+--------------+--------------+---------------+----------------+-------+
| book_id | title           | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-----------------+--------------+--------------+---------------+----------------+-------+
|       2 | Norse Mythology | Neil         | Gaiman       |          2016 |             43 |   304 |
+---------+-----------------+--------------+--------------+---------------+----------------+-------+
1 row in set (0.000 sec)

mysql> SELECT * FROM books where author_lname='Gaiman' and released_year=2046;
Empty set (0.001 sec)

mysql> SELECT 1> 2 AND 5>3;
+--------------+
| 1> 2 AND 5>3 |
+--------------+
|            0 |
+--------------+
1 row in set (0.000 sec)

mysql> SELECT title, author_lname, released_year FROM books
    -> WHERE released_year > 2010
    -> AND author_lname = 'Eggers';
+----------------------------------+--------------+---------------+
| title                            | author_lname | released_year |
+----------------------------------+--------------+---------------+
| A Hologram for the King: A Novel | Eggers       |          2012 |
| The Circle                       | Eggers       |          2013 |
+----------------------------------+--------------+---------------+
2 rows in set (0.000 sec)

mysql>  
    -> SELECT title, author_lname, released_year FROM books
    -> WHERE released_year > 2010
    -> AND author_lname = 'Eggers'
    -> AND title LIKE '%novel%';
+----------------------------------+--------------+---------------+
| title                            | author_lname | released_year |
+----------------------------------+--------------+---------------+
| A Hologram for the King: A Novel | Eggers       |          2012 |
+----------------------------------+--------------+---------------+
1 row in set (0.001 sec)

mysql> SELECT * FROM books where author_lname='Gaiman' or  released_year=2016;
+---------+-----------------+--------------+--------------+---------------+----------------+-------+
| book_id | title           | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-----------------+--------------+--------------+---------------+----------------+-------+
|       2 | Norse Mythology | Neil         | Gaiman       |          2016 |             43 |   304 |
|       3 | American Gods   | Neil         | Gaiman       |          2001 |             12 |   465 |
|      10 | Coraline        | Neil         | Gaiman       |          2003 |            100 |   208 |
+---------+-----------------+--------------+--------------+---------------+----------------+-------+
3 rows in set (0.001 sec)

mysql> SELECT * FROM books where author_lname='Gaiman' or  released_year>=2016;
+---------+----------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+----------------------+--------------+--------------+---------------+----------------+-------+
|       2 | Norse Mythology      | Neil         | Gaiman       |          2016 |             43 |   304 |
|       3 | American Gods        | Neil         | Gaiman       |          2001 |             12 |   465 |
|      10 | Coraline             | Neil         | Gaiman       |          2003 |            100 |   208 |
|      19 | Lincoln In The Bardo | George       | Saunders     |          2017 |           1000 |   367 |
|      20 | the rookie           | vamsi        | krishna      |          2025 |            100 |   634 |
+---------+----------------------+--------------+--------------+---------------+----------------+-------+
5 rows in set (0.001 sec)

mysql> SELECT 1> 2 OR  5>3;
+--------------+
| 1> 2 OR  5>3 |
+--------------+
|            1 |
+--------------+
1 row in set (0.000 sec)

mysql> 
mysql> SELECT title, pages FROM books 
    -> WHERE CHAR_LENGTH(title) > 30
    -> AND pages > 500;
+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Amazing Adventures of Kavalier & Clay |   634 |
| Where I'm Calling From: Selected Stories  |   526 |
+-------------------------------------------+-------+
2 rows in set (0.001 sec)

mysql>  
    -> SELECT title, author_lname FROM books
    -> WHERE author_lname='Eggers' AND
    -> released_year > 2010;
+----------------------------------+--------------+
| title                            | author_lname |
+----------------------------------+--------------+
| A Hologram for the King: A Novel | Eggers       |
| The Circle                       | Eggers       |
+----------------------------------+--------------+
2 rows in set (0.000 sec)

mysql>  
    -> SELECT title, author_lname, released_year FROM books
    -> WHERE author_lname='Eggers' OR
    -> released_year > 2010;
+-------------------------------------------+--------------+---------------+
| title                                     | author_lname | released_year |
+-------------------------------------------+--------------+---------------+
| Norse Mythology                           | Gaiman       |          2016 |
| A Hologram for the King: A Novel          | Eggers       |          2012 |
| The Circle                                | Eggers       |          2013 |
| A Heartbreaking Work of Staggering Genius | Eggers       |          2001 |
| 10% Happier                               | Harris       |          2014 |
| Lincoln In The Bardo                      | Saunders     |          2017 |
| the rookie                                | krishna      |          2025 |
+-------------------------------------------+--------------+---------------+
7 rows in set (0.000 sec)

mysql>  
    ->  
    -> SELECT title, pages FROM books
    -> WHERE pages < 200 
    -> OR title LIKE '%stories%';
+-----------------------------------------------------+-------+
| title                                               | pages |
+-----------------------------------------------------+-------+
| Interpreter of Maladies                             |   198 |
| What We Talk About When We Talk About Love: Stories |   176 |
| Where I'm Calling From: Selected Stories            |   526 |
| Cannery Row                                         |   181 |
| Oblivion: Stories                                   |   329 |
+-----------------------------------------------------+-------+
5 rows in set (0.000 sec)

mysql> SELCT title from books where released_year between 2005 and 2016;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELCT title from books where released_year between 2005 and 2016' at line 1
mysql> SELCT title from books where released_year > 2005 and released_year< 2016;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELCT title from books where released_year > 2005 and released_year< 2016' at line 1
mysql> SELCT title from books where released_year > 2005 and released_year< 2016;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELCT title from books where released_year > 2005 and released_year< 2016' at line 1
mysql> SELECT title from books where released_year > 2005 and released_year< 2016;
+----------------------------------+
| title                            |
+----------------------------------+
| A Hologram for the King: A Novel |
| The Circle                       |
| Just Kids                        |
| 10% Happier                      |
+----------------------------------+
4 rows in set (0.000 sec)

mysql> SELECT title from books where released_year between 2005 and 2016;
+----------------------------------+
| title                            |
+----------------------------------+
| Norse Mythology                  |
| A Hologram for the King: A Novel |
| The Circle                       |
| Just Kids                        |
| Consider the Lobster             |
| 10% Happier                      |
+----------------------------------+
6 rows in set (0.000 sec)

mysql> SELECT title from books where released_year not  between 2005 and 2016;
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| The Namesake                                        |
| American Gods                                       |
| Interpreter of Maladies                             |
| The Amazing Adventures of Kavalier & Clay           |
| A Heartbreaking Work of Staggering Genius           |
| Coraline                                            |
| What We Talk About When We Talk About Love: Stories |
| Where I'm Calling From: Selected Stories            |
| White Noise                                         |
| Cannery Row                                         |
| Oblivion: Stories                                   |
| fake_book                                           |
| Lincoln In The Bardo                                |
| the rookie                                          |
+-----------------------------------------------------+
14 rows in set (0.001 sec)

mysql>  
    -> SELECT title, released_year FROM books
    -> WHERE released_year <= 2015
    -> AND released_year >= 2004;
+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| A Hologram for the King: A Novel |          2012 |
| The Circle                       |          2013 |
| Just Kids                        |          2010 |
| Oblivion: Stories                |          2004 |
| Consider the Lobster             |          2005 |
| 10% Happier                      |          2014 |
+----------------------------------+---------------+
6 rows in set (0.000 sec)

mysql>  
    -> SELECT title, released_year FROM books
    -> WHERE released_year BETWEEN 2004 AND 2014;
+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| A Hologram for the King: A Novel |          2012 |
| The Circle                       |          2013 |
| Just Kids                        |          2010 |
| Oblivion: Stories                |          2004 |
| Consider the Lobster             |          2005 |
| 10% Happier                      |          2014 |
+----------------------------------+---------------+
6 rows in set (0.001 sec)

mysql> 
mysql> SELECT * FROM people WHERE birthtime 
    -> BETWEEN CAST('12:00:00' AS TIME) 
    -> AND CAST('16:00:00' AS TIME);
+-------+------------+-----------+---------------------+
| name  | birthdate  | birthtime | birthdt             |
+-------+------------+-----------+---------------------+
| Hazel | 2026-06-05 | 13:04:36  | 2026-06-05 13:04:36 |
+-------+------------+-----------+---------------------+
1 row in set (0.005 sec)

mysql>  
    ->  
    -> SELECT * FROM people WHERE HOUR(birthtime)
    -> BETWEEN 12 AND 16;
+-------+------------+-----------+---------------------+
| name  | birthdate  | birthtime | birthdt             |
+-------+------------+-----------+---------------------+
| Hazel | 2026-06-05 | 13:04:36  | 2026-06-05 13:04:36 |
+-------+------------+-----------+---------------------+
1 row in set (0.003 sec)

mysql> use book_shop;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SELECT title, author_lname FROM books
    -> WHERE author_lname = 'Carver' 
    -> OR author_lname = 'Lahiri'
    -> OR author_lname = 'Smith';
+-----------------------------------------------------+--------------+
| title                                               | author_lname |
+-----------------------------------------------------+--------------+
| The Namesake                                        | Lahiri       |
| Interpreter of Maladies                             | Lahiri       |
| Just Kids                                           | Smith        |
| What We Talk About When We Talk About Love: Stories | Carver       |
| Where I'm Calling From: Selected Stories            | Carver       |
+-----------------------------------------------------+--------------+
5 rows in set (0.000 sec)

mysql>  
    -> SELECT title, author_lname FROM books
    -> WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
+-----------------------------------------------------+--------------+
| title                                               | author_lname |
+-----------------------------------------------------+--------------+
| The Namesake                                        | Lahiri       |
| Interpreter of Maladies                             | Lahiri       |
| Just Kids                                           | Smith        |
| What We Talk About When We Talk About Love: Stories | Carver       |
| Where I'm Calling From: Selected Stories            | Carver       |
+-----------------------------------------------------+--------------+
5 rows in set (0.003 sec)

mysql>  
    -> SELECT title, author_lname FROM books
    -> WHERE author_lname NOT IN ('Carver', 'Lahiri', 'Smith');
+-------------------------------------------+----------------+
| title                                     | author_lname   |
+-------------------------------------------+----------------+
| Norse Mythology                           | Gaiman         |
| American Gods                             | Gaiman         |
| A Hologram for the King: A Novel          | Eggers         |
| The Circle                                | Eggers         |
| The Amazing Adventures of Kavalier & Clay | Chabon         |
| A Heartbreaking Work of Staggering Genius | Eggers         |
| Coraline                                  | Gaiman         |
| White Noise                               | DeLillo        |
| Cannery Row                               | Steinbeck      |
| Oblivion: Stories                         | Foster Wallace |
| Consider the Lobster                      | Foster Wallace |
| 10% Happier                               | Harris         |
| fake_book                                 | Harris         |
| Lincoln In The Bardo                      | Saunders       |
| the rookie                                | krishna        |
+-------------------------------------------+----------------+
15 rows in set (0.000 sec)

mysql>  
    ->  
    -> SELECT title, released_year FROM books
    -> WHERE released_year >= 2000 
    -> AND released_year % 2 = 1;
+-------------------------------------------+---------------+
| title                                     | released_year |
+-------------------------------------------+---------------+
| The Namesake                              |          2003 |
| American Gods                             |          2001 |
| The Circle                                |          2013 |
| A Heartbreaking Work of Staggering Genius |          2001 |
| Coraline                                  |          2003 |
| Consider the Lobster                      |          2005 |
| fake_book                                 |          2001 |
| Lincoln In The Bardo                      |          2017 |
| the rookie                                |          2025 |
+-------------------------------------------+---------------+
9 rows in set (0.000 sec)

mysql> SELECT title, released_year,
    -> CASE
    -> WHEN released_year >= 2000 THEN 'modern lit'
    ->     ELSE '20th century lit' 
    -> END AS genre
    -> FROM books;
+-----------------------------------------------------+---------------+------------------+
| title                                               | released_year | genre            |
+-----------------------------------------------------+---------------+------------------+
| The Namesake                                        |          2003 | modern lit       |
| Norse Mythology                                     |          2016 | modern lit       |
| American Gods                                       |          2001 | modern lit       |
| Interpreter of Maladies                             |          1996 | 20th century lit |
| A Hologram for the King: A Novel                    |          2012 | modern lit       |
| The Circle                                          |          2013 | modern lit       |
| The Amazing Adventures of Kavalier & Clay           |          2000 | modern lit       |
| Just Kids                                           |          2010 | modern lit       |
| A Heartbreaking Work of Staggering Genius           |          2001 | modern lit       |
| Coraline                                            |          2003 | modern lit       |
| What We Talk About When We Talk About Love: Stories |          1981 | 20th century lit |
| Where I'm Calling From: Selected Stories            |          1989 | 20th century lit |
| White Noise                                         |          1985 | 20th century lit |
| Cannery Row                                         |          1945 | 20th century lit |
| Oblivion: Stories                                   |          2004 | modern lit       |
| Consider the Lobster                                |          2005 | modern lit       |
| 10% Happier                                         |          2014 | modern lit       |
| fake_book                                           |          2001 | modern lit       |
| Lincoln In The Bardo                                |          2017 | modern lit       |
| the rookie                                          |          2025 | modern lit       |
+-----------------------------------------------------+---------------+------------------+
20 rows in set (0.000 sec)

mysql>  
    ->  
    -> SELECT 
    ->     title,
    ->     stock_quantity,
    ->     CASE
    ->         WHEN stock_quantity BETWEEN 0 AND 40 THEN '*'
    ->         WHEN stock_quantity BETWEEN 41 AND 70 THEN '**'
    ->         WHEN stock_quantity BETWEEN 71 AND 100 THEN '***'
    ->         WHEN stock_quantity BETWEEN 101 AND 140 THEN '****'
    ->         ELSE '*****'
    ->     END AS stock
    -> FROM
    ->     books;
+-----------------------------------------------------+----------------+-------+
| title                                               | stock_quantity | stock |
+-----------------------------------------------------+----------------+-------+
| The Namesake                                        |             32 | *     |
| Norse Mythology                                     |             43 | **    |
| American Gods                                       |             12 | *     |
| Interpreter of Maladies                             |             97 | ***   |
| A Hologram for the King: A Novel                    |            154 | ***** |
| The Circle                                          |             26 | *     |
| The Amazing Adventures of Kavalier & Clay           |             68 | **    |
| Just Kids                                           |             55 | **    |
| A Heartbreaking Work of Staggering Genius           |            104 | ****  |
| Coraline                                            |            100 | ***   |
| What We Talk About When We Talk About Love: Stories |             23 | *     |
| Where I'm Calling From: Selected Stories            |             12 | *     |
| White Noise                                         |             49 | **    |
| Cannery Row                                         |             95 | ***   |
| Oblivion: Stories                                   |            172 | ***** |
| Consider the Lobster                                |             92 | ***   |
| 10% Happier                                         |             29 | *     |
| fake_book                                           |            287 | ***** |
| Lincoln In The Bardo                                |           1000 | ***** |
| the rookie                                          |            100 | ***   |
+-----------------------------------------------------+----------------+-------+
20 rows in set (0.000 sec)

mysql>  
    ->  
    -> SELECT 
    ->     title,
    ->     stock_quantity,
    ->     CASE
    ->         WHEN stock_quantity <= 40 THEN '*'
    ->         WHEN stock_quantity <= 70 THEN '**'
    ->         WHEN stock_quantity <= 100 THEN '***'
    ->         WHEN stock_quantity <= 140 THEN '****'
    ->         ELSE '*****'
    ->     END AS stock
    -> FROM
    ->     books;
+-----------------------------------------------------+----------------+-------+
| title                                               | stock_quantity | stock |
+-----------------------------------------------------+----------------+-------+
| The Namesake                                        |             32 | *     |
| Norse Mythology                                     |             43 | **    |
| American Gods                                       |             12 | *     |
| Interpreter of Maladies                             |             97 | ***   |
| A Hologram for the King: A Novel                    |            154 | ***** |
| The Circle                                          |             26 | *     |
| The Amazing Adventures of Kavalier & Clay           |             68 | **    |
| Just Kids                                           |             55 | **    |
| A Heartbreaking Work of Staggering Genius           |            104 | ****  |
| Coraline                                            |            100 | ***   |
| What We Talk About When We Talk About Love: Stories |             23 | *     |
| Where I'm Calling From: Selected Stories            |             12 | *     |
| White Noise                                         |             49 | **    |
| Cannery Row                                         |             95 | ***   |
| Oblivion: Stories                                   |            172 | ***** |
| Consider the Lobster                                |             92 | ***   |
| 10% Happier                                         |             29 | *     |
| fake_book                                           |            287 | ***** |
| Lincoln In The Bardo                                |           1000 | ***** |
| the rookie                                          |            100 | ***   |
+-----------------------------------------------------+----------------+-------+
20 rows in set (0.000 sec)

mysql> insert into people(title) values('Everything is null');
ERROR 1054 (42S22): Unknown column 'title' in 'field list'
mysql> insert into people('title') values('Everything is null');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''title') values('Everything is null')' at line 1
mysql> insert into people('title') value('Everything is null');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''title') value('Everything is null')' at line 1
mysql> insert into books('title') value('Everything is null');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''title') value('Everything is null')' at line 1
mysql> insert into books(title) value('Everything is null');
Query OK, 1 row affected (0.010 sec)

mysql> SELECT * FROM people WHERE author_lname is null;
ERROR 1054 (42S22): Unknown column 'author_lname' in 'where clause'
mysql> SELECT * FROM books WHERE author_lname is null;
+---------+--------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title              | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+--------------------+--------------+--------------+---------------+----------------+-------+
|      21 | Everything is null | NULL         | NULL         |          NULL |           NULL |  NULL |
+---------+--------------------+--------------+--------------+---------------+----------------+-------+
1 row in set (0.001 sec)

mysql> SELECT * FROM books WHERE released_year < 1980;
+---------+-------------+--------------+--------------+---------------+----------------+-------+
| book_id | title       | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-------------+--------------+--------------+---------------+----------------+-------+
|      14 | Cannery Row | John         | Steinbeck    |          1945 |             95 |   181 |
+---------+-------------+--------------+--------------+---------------+----------------+-------+
1 row in set (0.001 sec)

mysql>  
    -> SELECT * FROM books 
    -> WHERE author_lname = 'Eggers'
    -> OR author_lname = 'Chabon';
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                                     | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
|       5 | A Hologram for the King: A Novel          | Dave         | Eggers       |          2012 |            154 |   352 |
|       6 | The Circle                                | Dave         | Eggers       |          2013 |             26 |   504 |
|       7 | The Amazing Adventures of Kavalier & Clay | Michael      | Chabon       |          2000 |             68 |   634 |
|       9 | A Heartbreaking Work of Staggering Genius | Dave         | Eggers       |          2001 |            104 |   437 |
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
4 rows in set (0.000 sec)

mysql>  
    -> SELECT * FROM books
    -> WHERE author_lname = 'Lahiri'
    -> AND released_year > 2000;
+---------+--------------+--------------+--------------+---------------+----------------+-------+
| book_id | title        | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+--------------+--------------+--------------+---------------+----------------+-------+
|       1 | The Namesake | Jhumpa       | Lahiri       |          2003 |             32 |   291 |
+---------+--------------+--------------+--------------+---------------+----------------+-------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT * FROM books
    -> WHERE pages >= 100 
    -> AND pages <= 200;
+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                                               | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
|       4 | Interpreter of Maladies                             | Jhumpa       | Lahiri       |          1996 |             97 |   198 |
|      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver       |          1981 |             23 |   176 |
|      14 | Cannery Row                                         | John         | Steinbeck    |          1945 |             95 |   181 |
+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
3 rows in set (0.000 sec)

mysql>  
    -> SELECT * FROM books
    -> WHERE pages BETWEEN 100 and 200;
+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                                               | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
|       4 | Interpreter of Maladies                             | Jhumpa       | Lahiri       |          1996 |             97 |   198 |
|      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver       |          1981 |             23 |   176 |
|      14 | Cannery Row                                         | John         | Steinbeck    |          1945 |             95 |   181 |
+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
3 rows in set (0.000 sec)

mysql>  
    -> SELECT title, author_lname FROM books
    -> WHERE author_lname LIKE 'C%'
    -> OR author_lname LIKE 'S%';
+-----------------------------------------------------+--------------+
| title                                               | author_lname |
+-----------------------------------------------------+--------------+
| The Amazing Adventures of Kavalier & Clay           | Chabon       |
| Just Kids                                           | Smith        |
| What We Talk About When We Talk About Love: Stories | Carver       |
| Where I'm Calling From: Selected Stories            | Carver       |
| Cannery Row                                         | Steinbeck    |
| Lincoln In The Bardo                                | Saunders     |
+-----------------------------------------------------+--------------+
6 rows in set (0.000 sec)

mysql>  
    -> SELECT title, author_lname
    -> FROM books WHERE SUBSTR(author_lname, 1, 1) in ('C', 'S');
+-----------------------------------------------------+--------------+
| title                                               | author_lname |
+-----------------------------------------------------+--------------+
| The Amazing Adventures of Kavalier & Clay           | Chabon       |
| Just Kids                                           | Smith        |
| What We Talk About When We Talk About Love: Stories | Carver       |
| Where I'm Calling From: Selected Stories            | Carver       |
| Cannery Row                                         | Steinbeck    |
| Lincoln In The Bardo                                | Saunders     |
+-----------------------------------------------------+--------------+
6 rows in set (0.001 sec)

mysql>  
    -> SELECT title, author_lname,
    -> CASE
    ->     WHEN title LIKE '%stories%' THEN 'Short Stories'
    ->     WHEN title = 'Just Kids' THEN 'Memoir' 
    ->     WHEN title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memior'
    ->     ELSE 'Novel'
    -> END AS type
    -> FROM books;
+-----------------------------------------------------+----------------+---------------+
| title                                               | author_lname   | type          |
+-----------------------------------------------------+----------------+---------------+
| The Namesake                                        | Lahiri         | Novel         |
| Norse Mythology                                     | Gaiman         | Novel         |
| American Gods                                       | Gaiman         | Novel         |
| Interpreter of Maladies                             | Lahiri         | Novel         |
| A Hologram for the King: A Novel                    | Eggers         | Novel         |
| The Circle                                          | Eggers         | Novel         |
| The Amazing Adventures of Kavalier & Clay           | Chabon         | Novel         |
| Just Kids                                           | Smith          | Memoir        |
| A Heartbreaking Work of Staggering Genius           | Eggers         | Memior        |
| Coraline                                            | Gaiman         | Novel         |
| What We Talk About When We Talk About Love: Stories | Carver         | Short Stories |
| Where I'm Calling From: Selected Stories            | Carver         | Short Stories |
| White Noise                                         | DeLillo        | Novel         |
| Cannery Row                                         | Steinbeck      | Novel         |
| Oblivion: Stories                                   | Foster Wallace | Short Stories |
| Consider the Lobster                                | Foster Wallace | Novel         |
| 10% Happier                                         | Harris         | Novel         |
| fake_book                                           | Harris         | Novel         |
| Lincoln In The Bardo                                | Saunders       | Novel         |
| the rookie                                          | krishna        | Novel         |
| Everything is null                                  | NULL           | Novel         |
+-----------------------------------------------------+----------------+---------------+
21 rows in set (0.000 sec)

mysql>  
    ->  
    -> SELECT author_fname, author_lname,
    -> CASE
    ->         WHEN COUNT(*) = 1 THEN '1 book'
    ->         ELSE CONCAT(COUNT(*), ' books')
    -> END AS count
    -> FROM books
    -> WHERE author_lname IS NOT NULL
    -> GROUP BY author_fname, author_lname;
+--------------+----------------+---------+
| author_fname | author_lname   | count   |
+--------------+----------------+---------+
| Jhumpa       | Lahiri         | 2 books |
| Neil         | Gaiman         | 3 books |
| Dave         | Eggers         | 3 books |
| Michael      | Chabon         | 1 book  |
| Patti        | Smith          | 1 book  |
| Raymond      | Carver         | 2 books |
| Don          | DeLillo        | 1 book  |
| John         | Steinbeck      | 1 book  |
| David        | Foster Wallace | 2 books |
| Dan          | Harris         | 1 book  |
| Freida       | Harris         | 1 book  |
| George       | Saunders       | 1 book  |
| vamsi        | krishna        | 1 book  |
+--------------+----------------+---------+
13 rows in set (0.004 sec)

mysql> 
