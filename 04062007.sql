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
