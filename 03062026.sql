mysql> select * from books;
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
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
16 rows in set (0.004 sec)

mysql>  INSERT INTO books
    ->     (title, author_fname, author_lname, released_year, stock_quantity, pages)
    ->     VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
    ->            ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
    ->            ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
Query OK, 3 rows affected (0.008 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from books;
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
19 rows in set (0.001 sec)

mysql> SELECT DISTINCT author_lname from books;
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
11 rows in set (0.003 sec)

mysql> select released_year from books;
+---------------+
| released_year |
+---------------+
|          2003 |
|          2016 |
|          2001 |
|          1996 |
|          2012 |
|          2013 |
|          2000 |
|          2010 |
|          2001 |
|          2003 |
|          1981 |
|          1989 |
|          1985 |
|          1945 |
|          2004 |
|          2005 |
|          2014 |
|          2001 |
|          2017 |
+---------------+
19 rows in set (0.000 sec)

mysql> select distinct released_year from books;
+---------------+
| released_year |
+---------------+
|          2003 |
|          2016 |
|          2001 |
|          1996 |
|          2012 |
|          2013 |
|          2000 |
|          2010 |
|          1981 |
|          1989 |
|          1985 |
|          1945 |
|          2004 |
|          2005 |
|          2014 |
|          2017 |
+---------------+
16 rows in set (0.001 sec)

mysql> select suthor_fname,author_lname from books;
ERROR 1054 (42S22): Unknown column 'suthor_fname' in 'field list'
mysql> select author_fname,author_lname from books;
+--------------+----------------+
| author_fname | author_lname   |
+--------------+----------------+
| Jhumpa       | Lahiri         |
| Neil         | Gaiman         |
| Neil         | Gaiman         |
| Jhumpa       | Lahiri         |
| Dave         | Eggers         |
| Dave         | Eggers         |
| Michael      | Chabon         |
| Patti        | Smith          |
| Dave         | Eggers         |
| Neil         | Gaiman         |
| Raymond      | Carver         |
| Raymond      | Carver         |
| Don          | DeLillo        |
| John         | Steinbeck      |
| David        | Foster Wallace |
| David        | Foster Wallace |
| Dan          | Harris         |
| Freida       | Harris         |
| George       | Saunders       |
+--------------+----------------+
19 rows in set (0.000 sec)

mysql> SELECT CONCAT(author_fname,' ',author_lname) from books
    -> ;
+---------------------------------------+
| CONCAT(author_fname,' ',author_lname) |
+---------------------------------------+
| Jhumpa Lahiri                         |
| Neil Gaiman                           |
| Neil Gaiman                           |
| Jhumpa Lahiri                         |
| Dave Eggers                           |
| Dave Eggers                           |
| Michael Chabon                        |
| Patti Smith                           |
| Dave Eggers                           |
| Neil Gaiman                           |
| Raymond Carver                        |
| Raymond Carver                        |
| Don DeLillo                           |
| John Steinbeck                        |
| David Foster Wallace                  |
| David Foster Wallace                  |
| Dan Harris                            |
| Freida Harris                         |
| George Saunders                       |
+---------------------------------------+
19 rows in set (0.005 sec)

mysql> SELECT distinct CONCAT(author_fname,' ',author_lname) from books
    -> ;
+---------------------------------------+
| CONCAT(author_fname,' ',author_lname) |
+---------------------------------------+
| Jhumpa Lahiri                         |
| Neil Gaiman                           |
| Dave Eggers                           |
| Michael Chabon                        |
| Patti Smith                           |
| Raymond Carver                        |
| Don DeLillo                           |
| John Steinbeck                        |
| David Foster Wallace                  |
| Dan Harris                            |
| Freida Harris                         |
| George Saunders                       |
+---------------------------------------+
12 rows in set (0.001 sec)

mysql> select distinct author_fname,author_lname from books;
+--------------+----------------+
| author_fname | author_lname   |
+--------------+----------------+
| Jhumpa       | Lahiri         |
| Neil         | Gaiman         |
| Dave         | Eggers         |
| Michael      | Chabon         |
| Patti        | Smith          |
| Raymond      | Carver         |
| Don          | DeLillo        |
| John         | Steinbeck      |
| David        | Foster Wallace |
| Dan          | Harris         |
| Freida       | Harris         |
| George       | Saunders       |
+--------------+----------------+
12 rows in set (0.001 sec)

mysql> SELECT author_lname FROM books;
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

mysql>  
    -> SELECT DISTINCT author_lname FROM books;
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
11 rows in set (0.000 sec)

mysql>  
    -> SELECT author_fname, author_lname FROM books;
+--------------+----------------+
| author_fname | author_lname   |
+--------------+----------------+
| Jhumpa       | Lahiri         |
| Neil         | Gaiman         |
| Neil         | Gaiman         |
| Jhumpa       | Lahiri         |
| Dave         | Eggers         |
| Dave         | Eggers         |
| Michael      | Chabon         |
| Patti        | Smith          |
| Dave         | Eggers         |
| Neil         | Gaiman         |
| Raymond      | Carver         |
| Raymond      | Carver         |
| Don          | DeLillo        |
| John         | Steinbeck      |
| David        | Foster Wallace |
| David        | Foster Wallace |
| Dan          | Harris         |
| Freida       | Harris         |
| George       | Saunders       |
+--------------+----------------+
19 rows in set (0.000 sec)

mysql>  
    -> SELECT DISTINCT CONCAT(author_fname,' ', author_lname) FROM books;
+----------------------------------------+
| CONCAT(author_fname,' ', author_lname) |
+----------------------------------------+
| Jhumpa Lahiri                          |
| Neil Gaiman                            |
| Dave Eggers                            |
| Michael Chabon                         |
| Patti Smith                            |
| Raymond Carver                         |
| Don DeLillo                            |
| John Steinbeck                         |
| David Foster Wallace                   |
| Dan Harris                             |
| Freida Harris                          |
| George Saunders                        |
+----------------------------------------+
12 rows in set (0.000 sec)
mysql> SELECT book_id,title,author_fname from books;
+---------+-----------------------------------------------------+--------------+
| book_id | title                                               | author_fname |
+---------+-----------------------------------------------------+--------------+
|       1 | The Namesake                                        | Jhumpa       |
|       2 | Norse Mythology                                     | Neil         |
|       3 | American Gods                                       | Neil         |
|       4 | Interpreter of Maladies                             | Jhumpa       |
|       5 | A Hologram for the King: A Novel                    | Dave         |
|       6 | The Circle                                          | Dave         |
|       7 | The Amazing Adventures of Kavalier & Clay           | Michael      |
|       8 | Just Kids                                           | Patti        |
|       9 | A Heartbreaking Work of Staggering Genius           | Dave         |
|      10 | Coraline                                            | Neil         |
|      11 | What We Talk About When We Talk About Love: Stories | Raymond      |
|      12 | Where I'm Calling From: Selected Stories            | Raymond      |
|      13 | White Noise                                         | Don          |
|      14 | Cannery Row                                         | John         |
|      15 | Oblivion: Stories                                   | David        |
|      16 | Consider the Lobster                                | David        |
|      17 | 10% Happier                                         | Dan          |
|      18 | fake_book                                           | Freida       |
|      19 | Lincoln In The Bardo                                | George       |
+---------+-----------------------------------------------------+--------------+
19 rows in set (0.001 sec)

mysql> SELECT book_id,title,author_fname from books ORDER BY author_fname;
+---------+-----------------------------------------------------+--------------+
| book_id | title                                               | author_fname |
+---------+-----------------------------------------------------+--------------+
|      17 | 10% Happier                                         | Dan          |
|       5 | A Hologram for the King: A Novel                    | Dave         |
|       6 | The Circle                                          | Dave         |
|       9 | A Heartbreaking Work of Staggering Genius           | Dave         |
|      15 | Oblivion: Stories                                   | David        |
|      16 | Consider the Lobster                                | David        |
|      13 | White Noise                                         | Don          |
|      18 | fake_book                                           | Freida       |
|      19 | Lincoln In The Bardo                                | George       |
|       1 | The Namesake                                        | Jhumpa       |
|       4 | Interpreter of Maladies                             | Jhumpa       |
|      14 | Cannery Row                                         | John         |
|       7 | The Amazing Adventures of Kavalier & Clay           | Michael      |
|       2 | Norse Mythology                                     | Neil         |
|       3 | American Gods                                       | Neil         |
|      10 | Coraline                                            | Neil         |
|       8 | Just Kids                                           | Patti        |
|      11 | What We Talk About When We Talk About Love: Stories | Raymond      |
|      12 | Where I'm Calling From: Selected Stories            | Raymond      |
+---------+-----------------------------------------------------+--------------+
19 rows in set (0.003 sec)

mysql> SELECT book_id,title,author_fname from books ORDER BY author_fname,title;
+---------+-----------------------------------------------------+--------------+
| book_id | title                                               | author_fname |
+---------+-----------------------------------------------------+--------------+
|      17 | 10% Happier                                         | Dan          |
|       9 | A Heartbreaking Work of Staggering Genius           | Dave         |
|       5 | A Hologram for the King: A Novel                    | Dave         |
|       6 | The Circle                                          | Dave         |
|      16 | Consider the Lobster                                | David        |
|      15 | Oblivion: Stories                                   | David        |
|      13 | White Noise                                         | Don          |
|      18 | fake_book                                           | Freida       |
|      19 | Lincoln In The Bardo                                | George       |
|       4 | Interpreter of Maladies                             | Jhumpa       |
|       1 | The Namesake                                        | Jhumpa       |
|      14 | Cannery Row                                         | John         |
|       7 | The Amazing Adventures of Kavalier & Clay           | Michael      |
|       3 | American Gods                                       | Neil         |
|      10 | Coraline                                            | Neil         |
|       2 | Norse Mythology                                     | Neil         |
|       8 | Just Kids                                           | Patti        |
|      11 | What We Talk About When We Talk About Love: Stories | Raymond      |
|      12 | Where I'm Calling From: Selected Stories            | Raymond      |
+---------+-----------------------------------------------------+--------------+
19 rows in set (0.000 sec)

mysql> SELECT book_id,title,author_fname from books ORDER BY author_fname,title,nook_id;;
ERROR 1054 (42S22): Unknown column 'nook_id' in 'order clause'
ERROR: 
No query specified

mysql> SELECT book_id,author_fname,author_lname from books;
+---------+--------------+----------------+
| book_id | author_fname | author_lname   |
+---------+--------------+----------------+
|       1 | Jhumpa       | Lahiri         |
|       2 | Neil         | Gaiman         |
|       3 | Neil         | Gaiman         |
|       4 | Jhumpa       | Lahiri         |
|       5 | Dave         | Eggers         |
|       6 | Dave         | Eggers         |
|       7 | Michael      | Chabon         |
|       8 | Patti        | Smith          |
|       9 | Dave         | Eggers         |
|      10 | Neil         | Gaiman         |
|      11 | Raymond      | Carver         |
|      12 | Raymond      | Carver         |
|      13 | Don          | DeLillo        |
|      14 | John         | Steinbeck      |
|      15 | David        | Foster Wallace |
|      16 | David        | Foster Wallace |
|      17 | Dan          | Harris         |
|      18 | Freida       | Harris         |
|      19 | George       | Saunders       |
+---------+--------------+----------------+
19 rows in set (0.000 sec)

mysql> SELECT book_id,author_fname,author_lname from books ORDER BY author_lname;
+---------+--------------+----------------+
| book_id | author_fname | author_lname   |
+---------+--------------+----------------+
|      11 | Raymond      | Carver         |
|      12 | Raymond      | Carver         |
|       7 | Michael      | Chabon         |
|      13 | Don          | DeLillo        |
|       5 | Dave         | Eggers         |
|       6 | Dave         | Eggers         |
|       9 | Dave         | Eggers         |
|      15 | David        | Foster Wallace |
|      16 | David        | Foster Wallace |
|       2 | Neil         | Gaiman         |
|       3 | Neil         | Gaiman         |
|      10 | Neil         | Gaiman         |
|      17 | Dan          | Harris         |
|      18 | Freida       | Harris         |
|       1 | Jhumpa       | Lahiri         |
|       4 | Jhumpa       | Lahiri         |
|      19 | George       | Saunders       |
|       8 | Patti        | Smith          |
|      14 | John         | Steinbeck      |
+---------+--------------+----------------+
19 rows in set (0.000 sec)

mysql> SELECT book_id,author_fname,author_lname from books ORDER BY author_lname,book_id;
+---------+--------------+----------------+
| book_id | author_fname | author_lname   |
+---------+--------------+----------------+
|      11 | Raymond      | Carver         |
|      12 | Raymond      | Carver         |
|       7 | Michael      | Chabon         |
|      13 | Don          | DeLillo        |
|       5 | Dave         | Eggers         |
|       6 | Dave         | Eggers         |
|       9 | Dave         | Eggers         |
|      15 | David        | Foster Wallace |
|      16 | David        | Foster Wallace |
|       2 | Neil         | Gaiman         |
|       3 | Neil         | Gaiman         |
|      10 | Neil         | Gaiman         |
|      17 | Dan          | Harris         |
|      18 | Freida       | Harris         |
|       1 | Jhumpa       | Lahiri         |
|       4 | Jhumpa       | Lahiri         |
|      19 | George       | Saunders       |
|       8 | Patti        | Smith          |
|      14 | John         | Steinbeck      |
+---------+--------------+----------------+
19 rows in set (0.000 sec)

mysql> SELECT book_id,author_fname,author_lname from books ORDER BY author_lname,book_id DESC;
+---------+--------------+----------------+
| book_id | author_fname | author_lname   |
+---------+--------------+----------------+
|      12 | Raymond      | Carver         |
|      11 | Raymond      | Carver         |
|       7 | Michael      | Chabon         |
|      13 | Don          | DeLillo        |
|       9 | Dave         | Eggers         |
|       6 | Dave         | Eggers         |
|       5 | Dave         | Eggers         |
|      16 | David        | Foster Wallace |
|      15 | David        | Foster Wallace |
|      10 | Neil         | Gaiman         |
|       3 | Neil         | Gaiman         |
|       2 | Neil         | Gaiman         |
|      18 | Freida       | Harris         |
|      17 | Dan          | Harris         |
|       4 | Jhumpa       | Lahiri         |
|       1 | Jhumpa       | Lahiri         |
|      19 | George       | Saunders       |
|       8 | Patti        | Smith          |
|      14 | John         | Steinbeck      |
+---------+--------------+----------------+
19 rows in set (0.001 sec)

mysql> SELECT book_id,author_fname,author_lname from books ORDER BY author_lname DESC;
+---------+--------------+----------------+
| book_id | author_fname | author_lname   |
+---------+--------------+----------------+
|      14 | John         | Steinbeck      |
|       8 | Patti        | Smith          |
|      19 | George       | Saunders       |
|       1 | Jhumpa       | Lahiri         |
|       4 | Jhumpa       | Lahiri         |
|      17 | Dan          | Harris         |
|      18 | Freida       | Harris         |
|       2 | Neil         | Gaiman         |
|       3 | Neil         | Gaiman         |
|      10 | Neil         | Gaiman         |
|      15 | David        | Foster Wallace |
|      16 | David        | Foster Wallace |
|       5 | Dave         | Eggers         |
|       6 | Dave         | Eggers         |
|       9 | Dave         | Eggers         |
|      13 | Don          | DeLillo        |
|       7 | Michael      | Chabon         |
|      11 | Raymond      | Carver         |
|      12 | Raymond      | Carver         |
+---------+--------------+----------------+
19 rows in set (0.001 sec)

mysql> SELECT book_id,author_fname,author_lname from books ORDER BY author_lname ASCE;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ASCE' at line 1
mysql> SELECT book_id,author_fname,author_lname from books ORDER BY author_lname ASC;
+---------+--------------+----------------+
| book_id | author_fname | author_lname   |
+---------+--------------+----------------+
|      11 | Raymond      | Carver         |
|      12 | Raymond      | Carver         |
|       7 | Michael      | Chabon         |
|      13 | Don          | DeLillo        |
|       5 | Dave         | Eggers         |
|       6 | Dave         | Eggers         |
|       9 | Dave         | Eggers         |
|      15 | David        | Foster Wallace |
|      16 | David        | Foster Wallace |
|       2 | Neil         | Gaiman         |
|       3 | Neil         | Gaiman         |
|      10 | Neil         | Gaiman         |
|      17 | Dan          | Harris         |
|      18 | Freida       | Harris         |
|       1 | Jhumpa       | Lahiri         |
|       4 | Jhumpa       | Lahiri         |
|      19 | George       | Saunders       |
|       8 | Patti        | Smith          |
|      14 | John         | Steinbeck      |
+---------+--------------+----------------+
19 rows in set (0.001 sec)

mysql> DESC books;
+----------------+--------------+------+-----+---------+----------------+
| Field          | Type         | Null | Key | Default | Extra          |
+----------------+--------------+------+-----+---------+----------------+
| book_id        | int          | NO   | PRI | NULL    | auto_increment |
| title          | varchar(100) | YES  |     | NULL    |                |
| author_fname   | varchar(100) | YES  |     | NULL    |                |
| author_lname   | varchar(100) | YES  |     | NULL    |                |
| released_year  | int          | YES  |     | NULL    |                |
| stock_quantity | int          | YES  |     | NULL    |                |
| pages          | int          | YES  |     | NULL    |                |
+----------------+--------------+------+-----+---------+----------------+
7 rows in set (0.008 sec)

mysql>  SELECT title,pages from books;
+-----------------------------------------------------+-------+
| title                                               | pages |
+-----------------------------------------------------+-------+
| The Namesake                                        |   291 |
| Norse Mythology                                     |   304 |
| American Gods                                       |   465 |
| Interpreter of Maladies                             |   198 |
| A Hologram for the King: A Novel                    |   352 |
| The Circle                                          |   504 |
| The Amazing Adventures of Kavalier & Clay           |   634 |
| Just Kids                                           |   304 |
| A Heartbreaking Work of Staggering Genius           |   437 |
| Coraline                                            |   208 |
| What We Talk About When We Talk About Love: Stories |   176 |
| Where I'm Calling From: Selected Stories            |   526 |
| White Noise                                         |   320 |
| Cannery Row                                         |   181 |
| Oblivion: Stories                                   |   329 |
| Consider the Lobster                                |   343 |
| 10% Happier                                         |   256 |
| fake_book                                           |   428 |
| Lincoln In The Bardo                                |   367 |
+-----------------------------------------------------+-------+
19 rows in set (0.000 sec)

mysql>  SELECT title,pages from books order by pages ASC;
+-----------------------------------------------------+-------+
| title                                               | pages |
+-----------------------------------------------------+-------+
| What We Talk About When We Talk About Love: Stories |   176 |
| Cannery Row                                         |   181 |
| Interpreter of Maladies                             |   198 |
| Coraline                                            |   208 |
| 10% Happier                                         |   256 |
| The Namesake                                        |   291 |
| Norse Mythology                                     |   304 |
| Just Kids                                           |   304 |
| White Noise                                         |   320 |
| Oblivion: Stories                                   |   329 |
| Consider the Lobster                                |   343 |
| A Hologram for the King: A Novel                    |   352 |
| Lincoln In The Bardo                                |   367 |
| fake_book                                           |   428 |
| A Heartbreaking Work of Staggering Genius           |   437 |
| American Gods                                       |   465 |
| The Circle                                          |   504 |
| Where I'm Calling From: Selected Stories            |   526 |
| The Amazing Adventures of Kavalier & Clay           |   634 |
+-----------------------------------------------------+-------+
19 rows in set (0.000 sec)

mysql>  SELECT title,pages from books order by pages released_year;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'released_year' at line 1
mysql>  SELECT title,pages from books order by released_year;
+-----------------------------------------------------+-------+
| title                                               | pages |
+-----------------------------------------------------+-------+
| Cannery Row                                         |   181 |
| What We Talk About When We Talk About Love: Stories |   176 |
| White Noise                                         |   320 |
| Where I'm Calling From: Selected Stories            |   526 |
| Interpreter of Maladies                             |   198 |
| The Amazing Adventures of Kavalier & Clay           |   634 |
| American Gods                                       |   465 |
| A Heartbreaking Work of Staggering Genius           |   437 |
| fake_book                                           |   428 |
| The Namesake                                        |   291 |
| Coraline                                            |   208 |
| Oblivion: Stories                                   |   329 |
| Consider the Lobster                                |   343 |
| Just Kids                                           |   304 |
| A Hologram for the King: A Novel                    |   352 |
| The Circle                                          |   504 |
| 10% Happier                                         |   256 |
| Norse Mythology                                     |   304 |
| Lincoln In The Bardo                                |   367 |
+-----------------------------------------------------+-------+
19 rows in set (0.001 sec)

mysql>  SELECT * FROM books
    -> ORDER BY author_lname;
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
| book_id | title                                               | author_fname | author_lname   | released_year | stock_quantity | pages |
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
|      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver         |          1981 |             23 |   176 |
|      12 | Where I'm Calling From: Selected Stories            | Raymond      | Carver         |          1989 |             12 |   526 |
|       7 | The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon         |          2000 |             68 |   634 |
|      13 | White Noise                                         | Don          | DeLillo        |          1985 |             49 |   320 |
|       5 | A Hologram for the King: A Novel                    | Dave         | Eggers         |          2012 |            154 |   352 |
|       6 | The Circle                                          | Dave         | Eggers         |          2013 |             26 |   504 |
|       9 | A Heartbreaking Work of Staggering Genius           | Dave         | Eggers         |          2001 |            104 |   437 |
|      15 | Oblivion: Stories                                   | David        | Foster Wallace |          2004 |            172 |   329 |
|      16 | Consider the Lobster                                | David        | Foster Wallace |          2005 |             92 |   343 |
|       2 | Norse Mythology                                     | Neil         | Gaiman         |          2016 |             43 |   304 |
|       3 | American Gods                                       | Neil         | Gaiman         |          2001 |             12 |   465 |
|      10 | Coraline                                            | Neil         | Gaiman         |          2003 |            100 |   208 |
|      17 | 10% Happier                                         | Dan          | Harris         |          2014 |             29 |   256 |
|      18 | fake_book                                           | Freida       | Harris         |          2001 |            287 |   428 |
|       1 | The Namesake                                        | Jhumpa       | Lahiri         |          2003 |             32 |   291 |
|       4 | Interpreter of Maladies                             | Jhumpa       | Lahiri         |          1996 |             97 |   198 |
|      19 | Lincoln In The Bardo                                | George       | Saunders       |          2017 |           1000 |   367 |
|       8 | Just Kids                                           | Patti        | Smith          |          2010 |             55 |   304 |
|      14 | Cannery Row                                         | John         | Steinbeck      |          1945 |             95 |   181 |
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
19 rows in set (0.000 sec)

mysql>  
    -> SELECT * FROM books
    -> ORDER BY author_lname DESC;
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
| book_id | title                                               | author_fname | author_lname   | released_year | stock_quantity | pages |
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
|      14 | Cannery Row                                         | John         | Steinbeck      |          1945 |             95 |   181 |
|       8 | Just Kids                                           | Patti        | Smith          |          2010 |             55 |   304 |
|      19 | Lincoln In The Bardo                                | George       | Saunders       |          2017 |           1000 |   367 |
|       1 | The Namesake                                        | Jhumpa       | Lahiri         |          2003 |             32 |   291 |
|       4 | Interpreter of Maladies                             | Jhumpa       | Lahiri         |          1996 |             97 |   198 |
|      17 | 10% Happier                                         | Dan          | Harris         |          2014 |             29 |   256 |
|      18 | fake_book                                           | Freida       | Harris         |          2001 |            287 |   428 |
|       2 | Norse Mythology                                     | Neil         | Gaiman         |          2016 |             43 |   304 |
|       3 | American Gods                                       | Neil         | Gaiman         |          2001 |             12 |   465 |
|      10 | Coraline                                            | Neil         | Gaiman         |          2003 |            100 |   208 |
|      15 | Oblivion: Stories                                   | David        | Foster Wallace |          2004 |            172 |   329 |
|      16 | Consider the Lobster                                | David        | Foster Wallace |          2005 |             92 |   343 |
|       5 | A Hologram for the King: A Novel                    | Dave         | Eggers         |          2012 |            154 |   352 |
|       6 | The Circle                                          | Dave         | Eggers         |          2013 |             26 |   504 |
|       9 | A Heartbreaking Work of Staggering Genius           | Dave         | Eggers         |          2001 |            104 |   437 |
|      13 | White Noise                                         | Don          | DeLillo        |          1985 |             49 |   320 |
|       7 | The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon         |          2000 |             68 |   634 |
|      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver         |          1981 |             23 |   176 |
|      12 | Where I'm Calling From: Selected Stories            | Raymond      | Carver         |          1989 |             12 |   526 |
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
19 rows in set (0.000 sec)

mysql>  
    -> SELECT * FROM books
    -> ORDER BY released_year;
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
| book_id | title                                               | author_fname | author_lname   | released_year | stock_quantity | pages |
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
|      14 | Cannery Row                                         | John         | Steinbeck      |          1945 |             95 |   181 |
|      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver         |          1981 |             23 |   176 |
|      13 | White Noise                                         | Don          | DeLillo        |          1985 |             49 |   320 |
|      12 | Where I'm Calling From: Selected Stories            | Raymond      | Carver         |          1989 |             12 |   526 |
|       4 | Interpreter of Maladies                             | Jhumpa       | Lahiri         |          1996 |             97 |   198 |
|       7 | The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon         |          2000 |             68 |   634 |
|       3 | American Gods                                       | Neil         | Gaiman         |          2001 |             12 |   465 |
|       9 | A Heartbreaking Work of Staggering Genius           | Dave         | Eggers         |          2001 |            104 |   437 |
|      18 | fake_book                                           | Freida       | Harris         |          2001 |            287 |   428 |
|       1 | The Namesake                                        | Jhumpa       | Lahiri         |          2003 |             32 |   291 |
|      10 | Coraline                                            | Neil         | Gaiman         |          2003 |            100 |   208 |
|      15 | Oblivion: Stories                                   | David        | Foster Wallace |          2004 |            172 |   329 |
|      16 | Consider the Lobster                                | David        | Foster Wallace |          2005 |             92 |   343 |
|       8 | Just Kids                                           | Patti        | Smith          |          2010 |             55 |   304 |
|       5 | A Hologram for the King: A Novel                    | Dave         | Eggers         |          2012 |            154 |   352 |
|       6 | The Circle                                          | Dave         | Eggers         |          2013 |             26 |   504 |
|      17 | 10% Happier                                         | Dan          | Harris         |          2014 |             29 |   256 |
|       2 | Norse Mythology                                     | Neil         | Gaiman         |          2016 |             43 |   304 |
|      19 | Lincoln In The Bardo                                | George       | Saunders       |          2017 |           1000 |   367 |
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
19 rows in set (0.000 sec)

mysql> SELECT SELECT book_id, author_fname, author_lname, pages
    -> FROM books ORDER BY 2 desc;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELECT book_id, author_fname, author_lname, pages
FROM books ORDER BY 2 desc' at line 1
mysql>  
    -> SELECT book_id, author_fname, author_lname, pages
    -> FROM books ORDER BY author_lname, author_fname;SELECT book_id, author_fname, author_lname, pages
+---------+--------------+----------------+-------+
| book_id | author_fname | author_lname   | pages |
+---------+--------------+----------------+-------+
|      11 | Raymond      | Carver         |   176 |
|      12 | Raymond      | Carver         |   526 |
|       7 | Michael      | Chabon         |   634 |
|      13 | Don          | DeLillo        |   320 |
|       5 | Dave         | Eggers         |   352 |
|       6 | Dave         | Eggers         |   504 |
|       9 | Dave         | Eggers         |   437 |
|      15 | David        | Foster Wallace |   329 |
|      16 | David        | Foster Wallace |   343 |
|       2 | Neil         | Gaiman         |   304 |
|       3 | Neil         | Gaiman         |   465 |
|      10 | Neil         | Gaiman         |   208 |
|      17 | Dan          | Harris         |   256 |
|      18 | Freida       | Harris         |   428 |
|       1 | Jhumpa       | Lahiri         |   291 |
|       4 | Jhumpa       | Lahiri         |   198 |
|      19 | George       | Saunders       |   367 |
|       8 | Patti        | Smith          |   304 |
|      14 | John         | Steinbeck      |   181 |
+---------+--------------+----------------+-------+
19 rows in set (0.000 sec)

    -> FROM books ORDER BY 2 desc;
+---------+--------------+----------------+-------+
| book_id | author_fname | author_lname   | pages |
+---------+--------------+----------------+-------+
|      11 | Raymond      | Carver         |   176 |
|      12 | Raymond      | Carver         |   526 |
|       8 | Patti        | Smith          |   304 |
|       2 | Neil         | Gaiman         |   304 |
|       3 | Neil         | Gaiman         |   465 |
|      10 | Neil         | Gaiman         |   208 |
|       7 | Michael      | Chabon         |   634 |
|      14 | John         | Steinbeck      |   181 |
|       1 | Jhumpa       | Lahiri         |   291 |
|       4 | Jhumpa       | Lahiri         |   198 |
|      19 | George       | Saunders       |   367 |
|      18 | Freida       | Harris         |   428 |
|      13 | Don          | DeLillo        |   320 |
|      15 | David        | Foster Wallace |   329 |
|      16 | David        | Foster Wallace |   343 |
|       5 | Dave         | Eggers         |   352 |
|       6 | Dave         | Eggers         |   504 |
|       9 | Dave         | Eggers         |   437 |
|      17 | Dan          | Harris         |   256 |
+---------+--------------+----------------+-------+
19 rows in set (0.000 sec)

mysql>  
    -> SELECT book_id, author_fname, author_lname, pages
    -> FROM books ORDER BY author_lname, author_fname;
+---------+--------------+----------------+-------+
| book_id | author_fname | author_lname   | pages |
+---------+--------------+----------------+-------+
|      11 | Raymond      | Carver         |   176 |
|      12 | Raymond      | Carver         |   526 |
|       7 | Michael      | Chabon         |   634 |
|      13 | Don          | DeLillo        |   320 |
|       5 | Dave         | Eggers         |   352 |
|       6 | Dave         | Eggers         |   504 |
|       9 | Dave         | Eggers         |   437 |
|      15 | David        | Foster Wallace |   329 |
|      16 | David        | Foster Wallace |   343 |
|       2 | Neil         | Gaiman         |   304 |
|       3 | Neil         | Gaiman         |   465 |
|      10 | Neil         | Gaiman         |   208 |
|      17 | Dan          | Harris         |   256 |
|      18 | Freida       | Harris         |   428 |
|       1 | Jhumpa       | Lahiri         |   291 |
|       4 | Jhumpa       | Lahiri         |   198 |
|      19 | George       | Saunders       |   367 |
|       8 | Patti        | Smith          |   304 |
|      14 | John         | Steinbeck      |   181 |
+---------+--------------+----------------+-------+
19 rows in set (0.000 sec)

mysql> SELECT book_id, author_fname, author_lname, pages
    -> FROM books ORDER BY 2 desc;
+---------+--------------+----------------+-------+
| book_id | author_fname | author_lname   | pages |
+---------+--------------+----------------+-------+
|      11 | Raymond      | Carver         |   176 |
|      12 | Raymond      | Carver         |   526 |
|       8 | Patti        | Smith          |   304 |
|       2 | Neil         | Gaiman         |   304 |
|       3 | Neil         | Gaiman         |   465 |
|      10 | Neil         | Gaiman         |   208 |
|       7 | Michael      | Chabon         |   634 |
|      14 | John         | Steinbeck      |   181 |
|       1 | Jhumpa       | Lahiri         |   291 |
|       4 | Jhumpa       | Lahiri         |   198 |
|      19 | George       | Saunders       |   367 |
|      18 | Freida       | Harris         |   428 |
|      13 | Don          | DeLillo        |   320 |
|      15 | David        | Foster Wallace |   329 |
|      16 | David        | Foster Wallace |   343 |
|       5 | Dave         | Eggers         |   352 |
|       6 | Dave         | Eggers         |   504 |
|       9 | Dave         | Eggers         |   437 |
|      17 | Dan          | Harris         |   256 |
+---------+--------------+----------------+-------+
19 rows in set (0.000 sec)

mysql>  
    -> SELECT book_id, author_fname, author_lname, pages
    -> FROM books ORDER BY author_lname, author_fname;
+---------+--------------+----------------+-------+
| book_id | author_fname | author_lname   | pages |
+---------+--------------+----------------+-------+
|      11 | Raymond      | Carver         |   176 |
|      12 | Raymond      | Carver         |   526 |
|       7 | Michael      | Chabon         |   634 |
|      13 | Don          | DeLillo        |   320 |
|       5 | Dave         | Eggers         |   352 |
|       6 | Dave         | Eggers         |   504 |
|       9 | Dave         | Eggers         |   437 |
|      15 | David        | Foster Wallace |   329 |
|      16 | David        | Foster Wallace |   343 |
|       2 | Neil         | Gaiman         |   304 |
|       3 | Neil         | Gaiman         |   465 |
|      10 | Neil         | Gaiman         |   208 |
|      17 | Dan          | Harris         |   256 |
|      18 | Freida       | Harris         |   428 |
|       1 | Jhumpa       | Lahiri         |   291 |
|       4 | Jhumpa       | Lahiri         |   198 |
|      19 | George       | Saunders       |   367 |
|       8 | Patti        | Smith          |   304 |
|      14 | John         | Steinbeck      |   181 |
+---------+--------------+----------------+-------+
19 rows in set (0.000 sec)

mysql> 
mysql> SELECT title FROM books LIMIT 3;
+-----------------+
| title           |
+-----------------+
| The Namesake    |
| Norse Mythology |
| American Gods   |
+-----------------+
3 rows in set (0.000 sec)

mysql>  
    -> SELECT title FROM books LIMIT 1;
+--------------+
| title        |
+--------------+
| The Namesake |
+--------------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT title FROM books LIMIT 10;
+-------------------------------------------+
| title                                     |
+-------------------------------------------+
| The Namesake                              |
| Norse Mythology                           |
| American Gods                             |
| Interpreter of Maladies                   |
| A Hologram for the King: A Novel          |
| The Circle                                |
| The Amazing Adventures of Kavalier & Clay |
| Just Kids                                 |
| A Heartbreaking Work of Staggering Genius |
| Coraline                                  |
+-------------------------------------------+
10 rows in set (0.000 sec)

mysql>  
    -> SELECT * FROM books LIMIT 1;
+---------+--------------+--------------+--------------+---------------+----------------+-------+
| book_id | title        | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+--------------+--------------+--------------+---------------+----------------+-------+
|       1 | The Namesake | Jhumpa       | Lahiri       |          2003 |             32 |   291 |
+---------+--------------+--------------+--------------+---------------+----------------+-------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT title, released_year FROM books 
    -> ORDER BY released_year DESC LIMIT 5;
+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| Lincoln In The Bardo             |          2017 |
| Norse Mythology                  |          2016 |
| 10% Happier                      |          2014 |
| The Circle                       |          2013 |
| A Hologram for the King: A Novel |          2012 |
+----------------------------------+---------------+
5 rows in set (0.000 sec)

mysql>  
    -> SELECT title, released_year FROM books 
    -> ORDER BY released_year DESC LIMIT 1;
+----------------------+---------------+
| title                | released_year |
+----------------------+---------------+
| Lincoln In The Bardo |          2017 |
+----------------------+---------------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT title, released_year FROM books 
    -> ORDER BY released_year DESC LIMIT 14;
+-------------------------------------------+---------------+
| title                                     | released_year |
+-------------------------------------------+---------------+
| Lincoln In The Bardo                      |          2017 |
| Norse Mythology                           |          2016 |
| 10% Happier                               |          2014 |
| The Circle                                |          2013 |
| A Hologram for the King: A Novel          |          2012 |
| Just Kids                                 |          2010 |
| Consider the Lobster                      |          2005 |
| Oblivion: Stories                         |          2004 |
| The Namesake                              |          2003 |
| Coraline                                  |          2003 |
| American Gods                             |          2001 |
| A Heartbreaking Work of Staggering Genius |          2001 |
| fake_book                                 |          2001 |
| The Amazing Adventures of Kavalier & Clay |          2000 |
+-------------------------------------------+---------------+
14 rows in set (0.000 sec)

mysql>  
    -> SELECT title, released_year FROM books 
    -> ORDER BY released_year DESC LIMIT 0,5;
+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| Lincoln In The Bardo             |          2017 |
| Norse Mythology                  |          2016 |
| 10% Happier                      |          2014 |
| The Circle                       |          2013 |
| A Hologram for the King: A Novel |          2012 |
+----------------------------------+---------------+
5 rows in set (0.000 sec)

mysql>  
    -> SELECT title, released_year FROM books 
    -> ORDER BY released_year DESC LIMIT 0,3;
+----------------------+---------------+
| title                | released_year |
+----------------------+---------------+
| Lincoln In The Bardo |          2017 |
| Norse Mythology      |          2016 |
| 10% Happier          |          2014 |
+----------------------+---------------+
3 rows in set (0.000 sec)

mysql>  
    -> SELECT title, released_year FROM books 
    -> ORDER BY released_year DESC LIMIT 1,3;
+-----------------+---------------+
| title           | released_year |
+-----------------+---------------+
| Norse Mythology |          2016 |
| 10% Happier     |          2014 |
| The Circle      |          2013 |
+-----------------+---------------+
3 rows in set (0.000 sec)

mysql>  
    -> SELECT title, released_year FROM books 
    -> ORDER BY released_year DESC LIMIT 10,1;
+---------------+---------------+
| title         | released_year |
+---------------+---------------+
| American Gods |          2001 |
+---------------+---------------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT * FROM books LIMIT 95,18446744073709551615;
Empty set (0.000 sec)

mysql>  
    -> SELECT title FROM books LIMIT 5;
+----------------------------------+
| title                            |
+----------------------------------+
| The Namesake                     |
| Norse Mythology                  |
| American Gods                    |
| Interpreter of Maladies          |
| A Hologram for the King: A Novel |
+----------------------------------+
5 rows in set (0.000 sec)

mysql>  
    -> SELECT title FROM books LIMIT 5, 123219476457;
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
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
+-----------------------------------------------------+
14 rows in set (0.000 sec)

mysql>  
    -> SELECT title FROM books LIMIT 5, 50;
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
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
+-----------------------------------------------------+
14 rows in set (0.000 sec)

mysql> select title,author_fname,author_lname rom books where author_fname='david';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'books where author_fname='david'' at line 1
mysql> select title,author_fname,author_lname from books where author_fname='david';
+----------------------+--------------+----------------+
| title                | author_fname | author_lname   |
+----------------------+--------------+----------------+
| Oblivion: Stories    | David        | Foster Wallace |
| Consider the Lobster | David        | Foster Wallace |
+----------------------+--------------+----------------+
2 rows in set (0.003 sec)

mysql> select title,author_fname,author_lname from books where author_fname like 'da';
Empty set (0.005 sec)

mysql> select title,author_fname,author_lname from books where author_fname like '%da%';
+-------------------------------------------+--------------+----------------+
| title                                     | author_fname | author_lname   |
+-------------------------------------------+--------------+----------------+
| A Hologram for the King: A Novel          | Dave         | Eggers         |
| The Circle                                | Dave         | Eggers         |
| A Heartbreaking Work of Staggering Genius | Dave         | Eggers         |
| Oblivion: Stories                         | David        | Foster Wallace |
| Consider the Lobster                      | David        | Foster Wallace |
| 10% Happier                               | Dan          | Harris         |
| fake_book                                 | Freida       | Harris         |
+-------------------------------------------+--------------+----------------+
7 rows in set (0.001 sec)

mysql>   SELECT title, author_fname, author_lname, pages 
    -> FROM books
    -> WHERE author_fname LIKE '%da%';
+-------------------------------------------+--------------+----------------+-------+
| title                                     | author_fname | author_lname   | pages |
+-------------------------------------------+--------------+----------------+-------+
| A Hologram for the King: A Novel          | Dave         | Eggers         |   352 |
| The Circle                                | Dave         | Eggers         |   504 |
| A Heartbreaking Work of Staggering Genius | Dave         | Eggers         |   437 |
| Oblivion: Stories                         | David        | Foster Wallace |   329 |
| Consider the Lobster                      | David        | Foster Wallace |   343 |
| 10% Happier                               | Dan          | Harris         |   256 |
| fake_book                                 | Freida       | Harris         |   428 |
+-------------------------------------------+--------------+----------------+-------+
7 rows in set (0.000 sec)

mysql>  
    -> SELECT title, author_fname, author_lname, pages 
    -> FROM books
    -> WHERE title LIKE '%:%';
+-----------------------------------------------------+--------------+----------------+-------+
| title                                               | author_fname | author_lname   | pages |
+-----------------------------------------------------+--------------+----------------+-------+
| A Hologram for the King: A Novel                    | Dave         | Eggers         |   352 |
| What We Talk About When We Talk About Love: Stories | Raymond      | Carver         |   176 |
| Where I'm Calling From: Selected Stories            | Raymond      | Carver         |   526 |
| Oblivion: Stories                                   | David        | Foster Wallace |   329 |
+-----------------------------------------------------+--------------+----------------+-------+
4 rows in set (0.000 sec)

mysql>  
    -> SELECT * FROM books
    -> WHERE author_fname LIKE '____';
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                                     | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
|       2 | Norse Mythology                           | Neil         | Gaiman       |          2016 |             43 |   304 |
|       3 | American Gods                             | Neil         | Gaiman       |          2001 |             12 |   465 |
|       5 | A Hologram for the King: A Novel          | Dave         | Eggers       |          2012 |            154 |   352 |
|       6 | The Circle                                | Dave         | Eggers       |          2013 |             26 |   504 |
|       9 | A Heartbreaking Work of Staggering Genius | Dave         | Eggers       |          2001 |            104 |   437 |
|      10 | Coraline                                  | Neil         | Gaiman       |          2003 |            100 |   208 |
|      14 | Cannery Row                               | John         | Steinbeck    |          1945 |             95 |   181 |
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
7 rows in set (0.000 sec)

mysql>  
    -> SELECT * FROM books
    -> WHERE author_fname LIKE '_a_';
+---------+-------------+--------------+--------------+---------------+----------------+-------+
| book_id | title       | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-------------+--------------+--------------+---------------+----------------+-------+
|      17 | 10% Happier | Dan          | Harris       |          2014 |             29 |   256 |
+---------+-------------+--------------+--------------+---------------+----------------+-------+
1 row in set (0.001 sec)

mysql> select 8 from books;
+---+
| 8 |
+---+
| 8 |
| 8 |
| 8 |
| 8 |
| 8 |
| 8 |
| 8 |
| 8 |
| 8 |
| 8 |
| 8 |
| 8 |
| 8 |
| 8 |
| 8 |
| 8 |
| 8 |
| 8 |
| 8 |
+---+
19 rows in set (0.000 sec)

mysql> select * from books;
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

mysql> SELECT title FROM books WHERE title LIKE '%stories%';
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| What We Talk About When We Talk About Love: Stories |
| Where I'm Calling From: Selected Stories            |
| Oblivion: Stories                                   |
+-----------------------------------------------------+
3 rows in set (0.000 sec)

mysql>  
    -> SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;
+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Amazing Adventures of Kavalier & Clay |   634 |
+-------------------------------------------+-------+
1 row in set (0.003 sec)

mysql>  
    -> SELECT 
    ->     CONCAT(title, ' - ', released_year) AS summary 
    -> FROM books ORDER BY released_year DESC LIMIT 3;
+-----------------------------+
| summary                     |
+-----------------------------+
| Lincoln In The Bardo - 2017 |
| Norse Mythology - 2016      |
| 10% Happier - 2014          |
+-----------------------------+
3 rows in set (0.000 sec)

mysql>  
    -> SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';
+----------------------+----------------+
| title                | author_lname   |
+----------------------+----------------+
| Oblivion: Stories    | Foster Wallace |
| Consider the Lobster | Foster Wallace |
+----------------------+----------------+
2 rows in set (0.000 sec)

mysql>  
    -> SELECT title, released_year, stock_quantity 
    -> FROM books ORDER BY stock_quantity LIMIT 3;
+-----------------------------------------------------+---------------+----------------+
| title                                               | released_year | stock_quantity |
+-----------------------------------------------------+---------------+----------------+
| Where I'm Calling From: Selected Stories            |          1989 |             12 |
| American Gods                                       |          2001 |             12 |
| What We Talk About When We Talk About Love: Stories |          1981 |             23 |
+-----------------------------------------------------+---------------+----------------+
3 rows in set (0.000 sec)

mysql>  
    -> SELECT title, author_lname 
    -> FROM books ORDER BY author_lname, title;
+-----------------------------------------------------+----------------+
| title                                               | author_lname   |
+-----------------------------------------------------+----------------+
| What We Talk About When We Talk About Love: Stories | Carver         |
| Where I'm Calling From: Selected Stories            | Carver         |
| The Amazing Adventures of Kavalier & Clay           | Chabon         |
| White Noise                                         | DeLillo        |
| A Heartbreaking Work of Staggering Genius           | Eggers         |
| A Hologram for the King: A Novel                    | Eggers         |
| The Circle                                          | Eggers         |
| Consider the Lobster                                | Foster Wallace |
| Oblivion: Stories                                   | Foster Wallace |
| American Gods                                       | Gaiman         |
| Coraline                                            | Gaiman         |
| Norse Mythology                                     | Gaiman         |
| 10% Happier                                         | Harris         |
| fake_book                                           | Harris         |
| Interpreter of Maladies                             | Lahiri         |
| The Namesake                                        | Lahiri         |
| Lincoln In The Bardo                                | Saunders       |
| Just Kids                                           | Smith          |
| Cannery Row                                         | Steinbeck      |
+-----------------------------------------------------+----------------+
19 rows in set (0.000 sec)

mysql>  
    -> SELECT title, author_lname 
    -> FROM books ORDER BY 2,1;
+-----------------------------------------------------+----------------+
| title                                               | author_lname   |
+-----------------------------------------------------+----------------+
| What We Talk About When We Talk About Love: Stories | Carver         |
| Where I'm Calling From: Selected Stories            | Carver         |
| The Amazing Adventures of Kavalier & Clay           | Chabon         |
| White Noise                                         | DeLillo        |
| A Heartbreaking Work of Staggering Genius           | Eggers         |
| A Hologram for the King: A Novel                    | Eggers         |
| The Circle                                          | Eggers         |
| Consider the Lobster                                | Foster Wallace |
| Oblivion: Stories                                   | Foster Wallace |
| American Gods                                       | Gaiman         |
| Coraline                                            | Gaiman         |
| Norse Mythology                                     | Gaiman         |
| 10% Happier                                         | Harris         |
| fake_book                                           | Harris         |
| Interpreter of Maladies                             | Lahiri         |
| The Namesake                                        | Lahiri         |
| Lincoln In The Bardo                                | Saunders       |
| Just Kids                                           | Smith          |
| Cannery Row                                         | Steinbeck      |
+-----------------------------------------------------+----------------+
19 rows in set (0.000 sec)

mysql>  
    -> SELECT
    ->     CONCAT(
    ->         'MY FAVORITE AUTHOR IS ',
    ->         UPPER(author_fname),
    ->         ' ',
    ->         UPPER(author_lname),
    ->         '!'
    ->     ) AS yell
    -> FROM books ORDER BY author_lname;
+---------------------------------------------+
| yell                                        |
+---------------------------------------------+
| MY FAVORITE AUTHOR IS RAYMOND CARVER!       |
| MY FAVORITE AUTHOR IS RAYMOND CARVER!       |
| MY FAVORITE AUTHOR IS MICHAEL CHABON!       |
| MY FAVORITE AUTHOR IS DON DELILLO!          |
| MY FAVORITE AUTHOR IS DAVE EGGERS!          |
| MY FAVORITE AUTHOR IS DAVE EGGERS!          |
| MY FAVORITE AUTHOR IS DAVE EGGERS!          |
| MY FAVORITE AUTHOR IS DAVID FOSTER WALLACE! |
| MY FAVORITE AUTHOR IS DAVID FOSTER WALLACE! |
| MY FAVORITE AUTHOR IS NEIL GAIMAN!          |
| MY FAVORITE AUTHOR IS NEIL GAIMAN!          |
| MY FAVORITE AUTHOR IS NEIL GAIMAN!          |
| MY FAVORITE AUTHOR IS DAN HARRIS!           |
| MY FAVORITE AUTHOR IS FREIDA HARRIS!        |
| MY FAVORITE AUTHOR IS JHUMPA LAHIRI!        |
| MY FAVORITE AUTHOR IS JHUMPA LAHIRI!        |
| MY FAVORITE AUTHOR IS GEORGE SAUNDERS!      |
| MY FAVORITE AUTHOR IS PATTI SMITH!          |
| MY FAVORITE AUTHOR IS JOHN STEINBECK!       |
+---------------------------------------------+
19 rows in set (0.000 sec)

