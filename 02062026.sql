

mysql> use book_shop;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
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
7 rows in set (0.002 sec)

mysql> select concat(author_fname,author_lname);
ERROR 1054 (42S22): Unknown column 'author_fname' in 'field list'
mysql> select CONCCAT(author_fname,author_lname);
ERROR 1305 (42000): FUNCTION book_shop.CONCCAT does not exist
mysql> select CONCAT(author_fname,author_lname);
ERROR 1054 (42S22): Unknown column 'author_fname' in 'field list'
mysql> select CONCAT(author_fname,author_lname) from books;
+-----------------------------------+
| CONCAT(author_fname,author_lname) |
+-----------------------------------+
| JhumpaLahiri                      |
| NeilGaiman                        |
| NeilGaiman                        |
| JhumpaLahiri                      |
| DaveEggers                        |
| DaveEggers                        |
| MichaelChabon                     |
| PattiSmith                        |
| DaveEggers                        |
| NeilGaiman                        |
| RaymondCarver                     |
| RaymondCarver                     |
| DonDeLillo                        |
| JohnSteinbeck                     |
| DavidFoster Wallace               |
| DavidFoster Wallace               |
+-----------------------------------+
16 rows in set (0.003 sec)

mysql> select CONCAT(author_fname,' ',author_lname) from books;
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
+---------------------------------------+
16 rows in set (0.000 sec)

mysql> select CONCAT(author_fname,' ',author_lname) as authorname from books;
+----------------------+
| authorname           |
+----------------------+
| Jhumpa Lahiri        |
| Neil Gaiman          |
| Neil Gaiman          |
| Jhumpa Lahiri        |
| Dave Eggers          |
| Dave Eggers          |
| Michael Chabon       |
| Patti Smith          |
| Dave Eggers          |
| Neil Gaiman          |
| Raymond Carver       |
| Raymond Carver       |
| Don DeLillo          |
| John Steinbeck       |
| David Foster Wallace |
| David Foster Wallace |
+----------------------+
16 rows in set (0.001 sec)

mysql> select CONCAT_WS('-',author_fname,' ',author_lname) as authorname from books;
+------------------------+
| authorname             |
+------------------------+
| Jhumpa- -Lahiri        |
| Neil- -Gaiman          |
| Neil- -Gaiman          |
| Jhumpa- -Lahiri        |
| Dave- -Eggers          |
| Dave- -Eggers          |
| Michael- -Chabon       |
| Patti- -Smith          |
| Dave- -Eggers          |
| Neil- -Gaiman          |
| Raymond- -Carver       |
| Raymond- -Carver       |
| Don- -DeLillo          |
| John- -Steinbeck       |
| David- -Foster Wallace |
| David- -Foster Wallace |
+------------------------+
16 rows in set (0.001 sec)

mysql> select CONCAT_WS('-',author_fname,author_lname) as authorname from books;
+----------------------+
| authorname           |
+----------------------+
| Jhumpa-Lahiri        |
| Neil-Gaiman          |
| Neil-Gaiman          |
| Jhumpa-Lahiri        |
| Dave-Eggers          |
| Dave-Eggers          |
| Michael-Chabon       |
| Patti-Smith          |
| Dave-Eggers          |
| Neil-Gaiman          |
| Raymond-Carver       |
| Raymond-Carver       |
| Don-DeLillo          |
| John-Steinbeck       |
| David-Foster Wallace |
| David-Foster Wallace |
+----------------------+
16 rows in set (0.000 sec)

mysql> select CONCAT_WS(' - ',author_fname,author_lname) as authorname from books;
+------------------------+
| authorname             |
+------------------------+
| Jhumpa - Lahiri        |
| Neil - Gaiman          |
| Neil - Gaiman          |
| Jhumpa - Lahiri        |
| Dave - Eggers          |
| Dave - Eggers          |
| Michael - Chabon       |
| Patti - Smith          |
| Dave - Eggers          |
| Neil - Gaiman          |
| Raymond - Carver       |
| Raymond - Carver       |
| Don - DeLillo          |
| John - Steinbeck       |
| David - Foster Wallace |
| David - Foster Wallace |
+------------------------+
16 rows in set (0.000 sec)

mysql> SELECT SUBSTRING('hello world' , 1 , 4 );
+-----------------------------------+
| SUBSTRING('hello world' , 1 , 4 ) |
+-----------------------------------+
| hell                              |
+-----------------------------------+
1 row in set (0.000 sec)

mysql> SELECT SUBSTRING('hello world' , 2 , 4 );
+-----------------------------------+
| SUBSTRING('hello world' , 2 , 4 ) |
+-----------------------------------+
| ello                              |
+-----------------------------------+
1 row in set (0.000 sec)

mysql> SELECT SUBSTRING('hello world' , 3 , 5 );
+-----------------------------------+
| SUBSTRING('hello world' , 3 , 5 ) |
+-----------------------------------+
| llo w                             |
+-----------------------------------+
1 row in set (0.000 sec)

mysql> 
mysql> SELECT SUBSTRING('hello world' , 7 );
+-------------------------------+
| SUBSTRING('hello world' , 7 ) |
+-------------------------------+
| world                         |
+-------------------------------+
1 row in set (0.000 sec)

mysql> SELECT SUBSTRING('hello world' ,- 7 );
+--------------------------------+
| SUBSTRING('hello world' ,- 7 ) |
+--------------------------------+
| o world                        |
+--------------------------------+
1 row in set (0.000 sec)

mysql>  select * from books;
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
16 rows in set (0.000 sec)

mysql> select substring(author_lname,1) as initial,author_fname from books;
+----------------+--------------+
| initial        | author_fname |
+----------------+--------------+
| Lahiri         | Jhumpa       |
| Gaiman         | Neil         |
| Gaiman         | Neil         |
| Lahiri         | Jhumpa       |
| Eggers         | Dave         |
| Eggers         | Dave         |
| Chabon         | Michael      |
| Smith          | Patti        |
| Eggers         | Dave         |
| Gaiman         | Neil         |
| Carver         | Raymond      |
| Carver         | Raymond      |
| DeLillo        | Don          |
| Steinbeck      | John         |
| Foster Wallace | David        |
| Foster Wallace | David        |
+----------------+--------------+
16 rows in set (0.000 sec)

mysql> select substring(author_lname,1,2) as initial,author_fname from books;
+---------+--------------+
| initial | author_fname |
+---------+--------------+
| La      | Jhumpa       |
| Ga      | Neil         |
| Ga      | Neil         |
| La      | Jhumpa       |
| Eg      | Dave         |
| Eg      | Dave         |
| Ch      | Michael      |
| Sm      | Patti        |
| Eg      | Dave         |
| Ga      | Neil         |
| Ca      | Raymond      |
| Ca      | Raymond      |
| De      | Don          |
| St      | John         |
| Fo      | David        |
| Fo      | David        |
+---------+--------------+
16 rows in set (0.000 sec)

mysql> select substring(author_lname,1,1) as initial,author_fname from books;
+---------+--------------+
| initial | author_fname |
+---------+--------------+
| L       | Jhumpa       |
| G       | Neil         |
| G       | Neil         |
| L       | Jhumpa       |
| E       | Dave         |
| E       | Dave         |
| C       | Michael      |
| S       | Patti        |
| E       | Dave         |
| G       | Neil         |
| C       | Raymond      |
| C       | Raymond      |
| D       | Don          |
| S       | John         |
| F       | David        |
| F       | David        |
+---------+--------------+
16 rows in set (0.000 sec)

mysql>  SELECT concat(SUBSTRING(title,1,10),'...');
ERROR 1054 (42S22): Unknown column 'title' in 'field list'
mysql>  SELECT concat(SUBSTRING(title,1,10),'...') from books;
+-------------------------------------+
| concat(SUBSTRING(title,1,10),'...') |
+-------------------------------------+
| The Namesa...                       |
| Norse Myth...                       |
| American G...                       |
| Interprete...                       |
| A Hologram...                       |
| The Circle...                       |
| The Amazin...                       |
| Just Kids...                        |
| A Heartbre...                       |
| Coraline...                         |
| What We Ta...                       |
| Where I'm ...                       |
| White Nois...                       |
| Cannery Ro...                       |
| Oblivion: ...                       |
| Consider t...                       |
+-------------------------------------+
16 rows in set (0.000 sec)

mysql>  SELECT concat(SUBSTRING(title,1,10),'...') as bookname from books;
+---------------+
| bookname      |
+---------------+
| The Namesa... |
| Norse Myth... |
| American G... |
| Interprete... |
| A Hologram... |
| The Circle... |
| The Amazin... |
| Just Kids...  |
| A Heartbre... |
| Coraline...   |
| What We Ta... |
| Where I'm ... |
| White Nois... |
| Cannery Ro... |
| Oblivion: ... |
| Consider t... |
+---------------+
16 rows in set (0.000 sec)

mysql>  SELECT concat(SUBSTRING(title,1,10),'...') as shorttitle from books;
+---------------+
| shorttitle    |
+---------------+
| The Namesa... |
| Norse Myth... |
| American G... |
| Interprete... |
| A Hologram... |
| The Circle... |
| The Amazin... |
| Just Kids...  |
| A Heartbre... |
| Coraline...   |
| What We Ta... |
| Where I'm ... |
| White Nois... |
| Cannery Ro... |
| Oblivion: ... |
| Consider t... |
+---------------+
16 rows in set (0.001 sec)

mysql> SELECT substring(author_fname,1,1) as 1,substring(author_lname,1,1) as 2 from books;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '1,substring(author_lname,1,1) as 2 from books' at line 1
mysql> SELECT substring(author_fname,1,1) ,substring(author_lname,1,1) as 2 from books;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '2 from books' at line 1
mysql> SELECT substring(author_fname,1,1) ,substring(author_lname,1,1) from books;
+-----------------------------+-----------------------------+
| substring(author_fname,1,1) | substring(author_lname,1,1) |
+-----------------------------+-----------------------------+
| J                           | L                           |
| N                           | G                           |
| N                           | G                           |
| J                           | L                           |
| D                           | E                           |
| D                           | E                           |
| M                           | C                           |
| P                           | S                           |
| D                           | E                           |
| N                           | G                           |
| R                           | C                           |
| R                           | C                           |
| D                           | D                           |
| J                           | S                           |
| D                           | F                           |
| D                           | F                           |
+-----------------------------+-----------------------------+
16 rows in set (0.000 sec)

mysql> SELECT substring(author_fname,1,1) as hi ,substring(author_lname,1,1) from books;
+------+-----------------------------+
| hi   | substring(author_lname,1,1) |
+------+-----------------------------+
| J    | L                           |
| N    | G                           |
| N    | G                           |
| J    | L                           |
| D    | E                           |
| D    | E                           |
| M    | C                           |
| P    | S                           |
| D    | E                           |
| N    | G                           |
| R    | C                           |
| R    | C                           |
| D    | D                           |
| J    | S                           |
| D    | F                           |
| D    | F                           |
+------+-----------------------------+
16 rows in set (0.000 sec)

mysql> SELECT substring(author_fname,1,1) as hi ,substring(author_lname,1,1) as bye from books;
+------+------+
| hi   | bye  |
+------+------+
| J    | L    |
| N    | G    |
| N    | G    |
| J    | L    |
| D    | E    |
| D    | E    |
| M    | C    |
| P    | S    |
| D    | E    |
| N    | G    |
| R    | C    |
| R    | C    |
| D    | D    |
| J    | S    |
| D    | F    |
| D    | F    |
+------+------+
16 rows in set (0.000 sec)

mysql> SELECT CONCAT(substring(author_fname,1,1) as hi ,substring(author_lname,1,1) as bye) from books;
ERROR 1583 (42000): Incorrect parameters in the call to native function 'concat'
mysql> SELECT CONCAT(substring(author_fname,1,1)  ,substring(author_lname,1,1)) as bye) from books;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ') from books' at line 1
mysql> SELECT CONCAT(substring(author_fname,1,1)  ,substring(author_lname,1,1)) as bye from books;
+------+
| bye  |
+------+
| JL   |
| NG   |
| NG   |
| JL   |
| DE   |
| DE   |
| MC   |
| PS   |
| DE   |
| NG   |
| RC   |
| RC   |
| DD   |
| JS   |
| DF   |
| DF   |
+------+
16 rows in set (0.000 sec)

mysql> SELECT CONCAT_WS('.',substring(author_fname,1,1) ,substring(author_lname,1,1)) as bye from books;
+------+
| bye  |
+------+
| J.L  |
| N.G  |
| N.G  |
| J.L  |
| D.E  |
| D.E  |
| M.C  |
| P.S  |
| D.E  |
| N.G  |
| R.C  |
| R.C  |
| D.D  |
| J.S  |
| D.F  |
| D.F  |
+------+
16 rows in set (0.001 sec)

mysql>  SELECT REPLACE('Hello world!',Hell,#$%^&*);
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql>  SELECT REPLACE('Hello world!',Hell,#$%^&*);
    -> 
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql>  SELECT REPLACE('Hello world!',Hell,'#$%^&*');
ERROR 1054 (42S22): Unknown column 'Hell' in 'field list'
mysql>  SELECT REPLACE('Hello world!','Hell','#$%^&*');
+-----------------------------------------+
| REPLACE('Hello world!','Hell','#$%^&*') |
+-----------------------------------------+
| #$%^&*o world!                          |
+-----------------------------------------+
1 row in set (0.000 sec)

mysql>  SELECT REPLACE('Hello world!','Hell','#$%^&*')as 122;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '122' at line 1
mysql>  SELECT REPLACE('Hello world!','Hell','#$%^&*') as 122;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '122' at line 1
mysql>  SELECT REPLACE('Hello world!','Hell','#$%^&*') as abc;
+----------------+
| abc            |
+----------------+
| #$%^&*o world! |
+----------------+
1 row in set (0.000 sec)
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
7 rows in set (0.002 sec)

mysql> select concat(author_fname,author_lname);
ERROR 1054 (42S22): Unknown column 'author_fname' in 'field list'
mysql> select CONCCAT(author_fname,author_lname);
ERROR 1305 (42000): FUNCTION book_shop.CONCCAT does not exist
mysql> select CONCAT(author_fname,author_lname);
ERROR 1054 (42S22): Unknown column 'author_fname' in 'field list'
mysql> select CONCAT(author_fname,author_lname) from books;
+-----------------------------------+
| CONCAT(author_fname,author_lname) |
+-----------------------------------+
| JhumpaLahiri                      |
| NeilGaiman                        |
| NeilGaiman                        |
| JhumpaLahiri                      |
| DaveEggers                        |
| DaveEggers                        |
| MichaelChabon                     |
| PattiSmith                        |
| DaveEggers                        |
| NeilGaiman                        |
| RaymondCarver                     |
| RaymondCarver                     |
| DonDeLillo                        |
| JohnSteinbeck                     |
| DavidFoster Wallace               |
| DavidFoster Wallace               |
+-----------------------------------+
16 rows in set (0.003 sec)

mysql> select CONCAT(author_fname,' ',author_lname) from books;
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
+---------------------------------------+
16 rows in set (0.000 sec)

mysql> select CONCAT(author_fname,' ',author_lname) as authorname from books;
+----------------------+
| authorname           |
+----------------------+
| Jhumpa Lahiri        |
| Neil Gaiman          |
| Neil Gaiman          |
| Jhumpa Lahiri        |
| Dave Eggers          |
| Dave Eggers          |
| Michael Chabon       |
| Patti Smith          |
| Dave Eggers          |
| Neil Gaiman          |
| Raymond Carver       |
| Raymond Carver       |
| Don DeLillo          |
| John Steinbeck       |
| David Foster Wallace |
| David Foster Wallace |
+----------------------+
16 rows in set (0.001 sec)

mysql> select CONCAT_WS('-',author_fname,' ',author_lname) as authorname from books;
+------------------------+
| authorname             |
+------------------------+
| Jhumpa- -Lahiri        |
| Neil- -Gaiman          |
| Neil- -Gaiman          |
| Jhumpa- -Lahiri        |
| Dave- -Eggers          |
| Dave- -Eggers          |
| Michael- -Chabon       |
| Patti- -Smith          |
| Dave- -Eggers          |
| Neil- -Gaiman          |
| Raymond- -Carver       |
| Raymond- -Carver       |
| Don- -DeLillo          |
| John- -Steinbeck       |
| David- -Foster Wallace |
| David- -Foster Wallace |
+------------------------+
16 rows in set (0.001 sec)

mysql> select CONCAT_WS('-',author_fname,author_lname) as authorname from books;
+----------------------+
| authorname           |
+----------------------+
| Jhumpa-Lahiri        |
| Neil-Gaiman          |
| Neil-Gaiman          |
| Jhumpa-Lahiri        |
| Dave-Eggers          |
| Dave-Eggers          |
| Michael-Chabon       |
| Patti-Smith          |
| Dave-Eggers          |
| Neil-Gaiman          |
| Raymond-Carver       |
| Raymond-Carver       |
| Don-DeLillo          |
| John-Steinbeck       |
| David-Foster Wallace |
| David-Foster Wallace |
+----------------------+
16 rows in set (0.000 sec)

mysql> select CONCAT_WS(' - ',author_fname,author_lname) as authorname from books;
+------------------------+
| authorname             |
+------------------------+
| Jhumpa - Lahiri        |
| Neil - Gaiman          |
| Neil - Gaiman          |
| Jhumpa - Lahiri        |
| Dave - Eggers          |
| Dave - Eggers          |
| Michael - Chabon       |
| Patti - Smith          |
| Dave - Eggers          |
| Neil - Gaiman          |
| Raymond - Carver       |
| Raymond - Carver       |
| Don - DeLillo          |
| John - Steinbeck       |
| David - Foster Wallace |
| David - Foster Wallace |
+------------------------+
16 rows in set (0.000 sec)

mysql> SELECT SUBSTRING('hello world' , 1 , 4 );
+-----------------------------------+
| SUBSTRING('hello world' , 1 , 4 ) |
+-----------------------------------+
| hell                              |
+-----------------------------------+
1 row in set (0.000 sec)

mysql> SELECT SUBSTRING('hello world' , 2 , 4 );
+-----------------------------------+
| SUBSTRING('hello world' , 2 , 4 ) |
+-----------------------------------+
| ello                              |
+-----------------------------------+
1 row in set (0.000 sec)

mysql> SELECT SUBSTRING('hello world' , 3 , 5 );
+-----------------------------------+
| SUBSTRING('hello world' , 3 , 5 ) |
+-----------------------------------+
| llo w                             |
+-----------------------------------+
1 row in set (0.000 sec)

mysql> 
mysql> SELECT SUBSTRING('hello world' , 7 );
+-------------------------------+
| SUBSTRING('hello world' , 7 ) |
+-------------------------------+
| world                         |
+-------------------------------+
1 row in set (0.000 sec)

mysql> SELECT SUBSTRING('hello world' ,- 7 );
+--------------------------------+
| SUBSTRING('hello world' ,- 7 ) |
+--------------------------------+
| o world                        |
+--------------------------------+
1 row in set (0.000 sec)

mysql>  select * from books;
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
16 rows in set (0.000 sec)

mysql> select substring(author_lname,1) as initial,author_fname from books;
+----------------+--------------+
| initial        | author_fname |
+----------------+--------------+
| Lahiri         | Jhumpa       |
| Gaiman         | Neil         |
| Gaiman         | Neil         |
| Lahiri         | Jhumpa       |
| Eggers         | Dave         |
| Eggers         | Dave         |
| Chabon         | Michael      |
| Smith          | Patti        |
| Eggers         | Dave         |
| Gaiman         | Neil         |
| Carver         | Raymond      |
| Carver         | Raymond      |
| DeLillo        | Don          |
| Steinbeck      | John         |
| Foster Wallace | David        |
| Foster Wallace | David        |
+----------------+--------------+
16 rows in set (0.000 sec)

mysql> select substring(author_lname,1,2) as initial,author_fname from books;
+---------+--------------+
| initial | author_fname |
+---------+--------------+
| La      | Jhumpa       |
| Ga      | Neil         |
| Ga      | Neil         |
| La      | Jhumpa       |
| Eg      | Dave         |
| Eg      | Dave         |
| Ch      | Michael      |
| Sm      | Patti        |
| Eg      | Dave         |
| Ga      | Neil         |
| Ca      | Raymond      |
| Ca      | Raymond      |
| De      | Don          |
| St      | John         |
| Fo      | David        |
| Fo      | David        |
+---------+--------------+
16 rows in set (0.000 sec)

mysql> select substring(author_lname,1,1) as initial,author_fname from books;
+---------+--------------+
| initial | author_fname |
+---------+--------------+
| L       | Jhumpa       |
| G       | Neil         |
| G       | Neil         |
| L       | Jhumpa       |
| E       | Dave         |
| E       | Dave         |
| C       | Michael      |
| S       | Patti        |
| E       | Dave         |
| G       | Neil         |
| C       | Raymond      |
| C       | Raymond      |
| D       | Don          |
| S       | John         |
| F       | David        |
| F       | David        |
+---------+--------------+
16 rows in set (0.000 sec)

mysql>  SELECT concat(SUBSTRING(title,1,10),'...');
ERROR 1054 (42S22): Unknown column 'title' in 'field list'
mysql>  SELECT concat(SUBSTRING(title,1,10),'...') from books;
+-------------------------------------+
| concat(SUBSTRING(title,1,10),'...') |
+-------------------------------------+
| The Namesa...                       |
| Norse Myth...                       |
| American G...                       |
| Interprete...                       |
| A Hologram...                       |
| The Circle...                       |
| The Amazin...                       |
| Just Kids...                        |
| A Heartbre...                       |
| Coraline...                         |
| What We Ta...                       |
| Where I'm ...                       |
| White Nois...                       |
| Cannery Ro...                       |
| Oblivion: ...                       |
| Consider t...                       |
+-------------------------------------+
16 rows in set (0.000 sec)

mysql>  SELECT concat(SUBSTRING(title,1,10),'...') as bookname from books;
+---------------+
| bookname      |
+---------------+
| The Namesa... |
| Norse Myth... |
| American G... |
| Interprete... |
| A Hologram... |
| The Circle... |
| The Amazin... |
| Just Kids...  |
| A Heartbre... |
| Coraline...   |
| What We Ta... |
| Where I'm ... |
| White Nois... |
| Cannery Ro... |
| Oblivion: ... |
| Consider t... |
+---------------+
16 rows in set (0.000 sec)

mysql>  SELECT concat(SUBSTRING(title,1,10),'...') as shorttitle from books;
+---------------+
| shorttitle    |
+---------------+
| The Namesa... |
| Norse Myth... |
| American G... |
| Interprete... |
| A Hologram... |
| The Circle... |
| The Amazin... |
| Just Kids...  |
| A Heartbre... |
| Coraline...   |
| What We Ta... |
| Where I'm ... |
| White Nois... |
| Cannery Ro... |
| Oblivion: ... |
| Consider t... |
+---------------+
16 rows in set (0.001 sec)

mysql> SELECT substring(author_fname,1,1) as 1,substring(author_lname,1,1) as 2 from books;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '1,substring(author_lname,1,1) as 2 from books' at line 1
mysql> SELECT substring(author_fname,1,1) ,substring(author_lname,1,1) as 2 from books;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '2 from books' at line 1
mysql> SELECT substring(author_fname,1,1) ,substring(author_lname,1,1) from books;
+-----------------------------+-----------------------------+
| substring(author_fname,1,1) | substring(author_lname,1,1) |
+-----------------------------+-----------------------------+
| J                           | L                           |
| N                           | G                           |
| N                           | G                           |
| J                           | L                           |
| D                           | E                           |
| D                           | E                           |
| M                           | C                           |
| P                           | S                           |
| D                           | E                           |
| N                           | G                           |
| R                           | C                           |
| R                           | C                           |
| D                           | D                           |
| J                           | S                           |
| D                           | F                           |
| D                           | F                           |
+-----------------------------+-----------------------------+
16 rows in set (0.000 sec)

mysql> SELECT substring(author_fname,1,1) as hi ,substring(author_lname,1,1) from books;
+------+-----------------------------+
| hi   | substring(author_lname,1,1) |
+------+-----------------------------+
| J    | L                           |
| N    | G                           |
| N    | G                           |
| J    | L                           |
| D    | E                           |
| D    | E                           |
| M    | C                           |
| P    | S                           |
| D    | E                           |
| N    | G                           |
| R    | C                           |
| R    | C                           |
| D    | D                           |
| J    | S                           |
| D    | F                           |
| D    | F                           |
+------+-----------------------------+
16 rows in set (0.000 sec)

mysql> SELECT substring(author_fname,1,1) as hi ,substring(author_lname,1,1) as bye from books;
+------+------+
| hi   | bye  |
+------+------+
| J    | L    |
| N    | G    |
| N    | G    |
| J    | L    |
| D    | E    |
| D    | E    |
| M    | C    |
| P    | S    |
| D    | E    |
| N    | G    |
| R    | C    |
| R    | C    |
| D    | D    |
| J    | S    |
| D    | F    |
| D    | F    |
+------+------+
16 rows in set (0.000 sec)

mysql> SELECT CONCAT(substring(author_fname,1,1) as hi ,substring(author_lname,1,1) as bye) from books;
ERROR 1583 (42000): Incorrect parameters in the call to native function 'concat'
mysql> SELECT CONCAT(substring(author_fname,1,1)  ,substring(author_lname,1,1)) as bye) from books;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ') from books' at line 1
mysql> SELECT CONCAT(substring(author_fname,1,1)  ,substring(author_lname,1,1)) as bye from books;
+------+
| bye  |
+------+
| JL   |
| NG   |
| NG   |
| JL   |
| DE   |
| DE   |
| MC   |
| PS   |
| DE   |
| NG   |
| RC   |
| RC   |
| DD   |
| JS   |
| DF   |
| DF   |
+------+
16 rows in set (0.000 sec)

mysql> SELECT CONCAT_WS('.',substring(author_fname,1,1) ,substring(author_lname,1,1)) as bye from books;
+------+
| bye  |
+------+
| J.L  |
| N.G  |
| N.G  |
| J.L  |
| D.E  |
| D.E  |
| M.C  |
| P.S  |
| D.E  |
| N.G  |
| R.C  |
| R.C  |
| D.D  |
| J.S  |
| D.F  |
| D.F  |
+------+
16 rows in set (0.001 sec)

mysql>  SELECT REPLACE('Hello world!',Hell,#$%^&*);
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql>  SELECT REPLACE('Hello world!',Hell,#$%^&*);
    -> 
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql>  SELECT REPLACE('Hello world!',Hell,'#$%^&*');
ERROR 1054 (42S22): Unknown column 'Hell' in 'field list'
mysql>  SELECT REPLACE('Hello world!','Hell','#$%^&*');
+-----------------------------------------+
| REPLACE('Hello world!','Hell','#$%^&*') |
+-----------------------------------------+
| #$%^&*o world!                          |
+-----------------------------------------+
1 row in set (0.000 sec)

mysql>  SELECT REPLACE('Hello world!','Hell','#$%^&*')as 122;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '122' at line 1
mysql>  SELECT REPLACE('Hello world!','Hell','#$%^&*') as 122;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '122' at line 1
mysql>  SELECT REPLACE('Hello world!','Hell','#$%^&*') as abc;
+----------------+
| abc            |
+----------------+
| #$%^&*o world! |
+----------------+
1 row in set (0.000 sec)

mysql> 
mysql> 
zsh: suspended  mysql -u root -p
vamsi@vamsis-MacBook-Air ~ % mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
Server version: 9.7.0 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SELECT reverse(NULL);
+------------------------------+
| reverse(NULL)                |
+------------------------------+
| NULL                         |
+------------------------------+
1 row in set (0.000 sec)

mysql> SELECT reverse(null);
+------------------------------+
| reverse(null)                |
+------------------------------+
| NULL                         |
+------------------------------+
1 row in set (0.000 sec)

mysql> SELECT REVERSE('Hello World');
+------------------------+
| REVERSE('Hello World') |
+------------------------+
| dlroW olleH            |
+------------------------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT REVERSE('meow meow');
+----------------------+
| REVERSE('meow meow') |
+----------------------+
| woem woem            |
+----------------------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT REVERSE(author_fname) FROM books;
ERROR 1046 (3D000): No database selected
mysql>  
    -> SELECT CONCAT('woof', REVERSE('woof'));
+---------------------------------+
| CONCAT('woof', REVERSE('woof')) |
+---------------------------------+
| wooffoow                        |
+---------------------------------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;
ERROR 1046 (3D000): No database selected
mysql> use book_store;
ERROR 1049 (42000): Unknown database 'book_store'
mysql> use book_shop
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql>   SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;
+---------------------------------------------+
| CONCAT(author_fname, REVERSE(author_fname)) |
+---------------------------------------------+
| JhumpaapmuhJ                                |
| NeillieN                                    |
| NeillieN                                    |
| JhumpaapmuhJ                                |
| DaveevaD                                    |
| DaveevaD                                    |
| MichaelleahciM                              |
| PattiittaP                                  |
| DaveevaD                                    |
| NeillieN                                    |
| RaymonddnomyaR                              |
| RaymonddnomyaR                              |
| DonnoD                                      |
| JohnnhoJ                                    |
| DaviddivaD                                  |
| DaviddivaD                                  |
+---------------------------------------------+
16 rows in set (0.000 sec)

mysql> SELECT char_length('name');
+---------------------+
| char_length('name') |
+---------------------+
|                   4 |
+---------------------+
1 row in set (0.000 sec)

mysql> SELECT char_length('name') as length;
+--------+
| length |
+--------+
|      4 |
+--------+
1 row in set (0.000 sec)

mysql> SELECT char_length('name') from books as length;
+---------------------+
| char_length('name') |
+---------------------+
|                   4 |
|                   4 |
|                   4 |
|                   4 |
|                   4 |
|                   4 |
|                   4 |
|                   4 |
|                   4 |
|                   4 |
|                   4 |
|                   4 |
|                   4 |
|                   4 |
|                   4 |
|                   4 |
+---------------------+
16 rows in set (0.000 sec)

mysql> SELECT char_length('title') from books as length;
+----------------------+
| char_length('title') |
+----------------------+
|                    5 |
|                    5 |
|                    5 |
|                    5 |
|                    5 |
|                    5 |
|                    5 |
|                    5 |
|                    5 |
|                    5 |
|                    5 |
|                    5 |
|                    5 |
|                    5 |
|                    5 |
|                    5 |
+----------------------+
16 rows in set (0.000 sec)

mysql> SELECT char_length(title) from books as length;
+--------------------+
| char_length(title) |
+--------------------+
|                 12 |
|                 15 |
|                 13 |
|                 23 |
|                 32 |
|                 10 |
|                 41 |
|                  9 |
|                 41 |
|                  8 |
|                 51 |
|                 40 |
|                 11 |
|                 11 |
|                 17 |
|                 20 |
+--------------------+
16 rows in set (0.000 sec)

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
+---+
16 rows in set (0.000 sec)

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
16 rows in set (0.000 sec)

mysql> SELECT char_length('name  hi') as length;
+--------+
| length |
+--------+
|      8 |
+--------+
1 row in set (0.000 sec)

mysql> SELECT char_length(title),title from books as length;
+--------------------+-----------------------------------------------------+
| char_length(title) | title                                               |
+--------------------+-----------------------------------------------------+
|                 12 | The Namesake                                        |
|                 15 | Norse Mythology                                     |
|                 13 | American Gods                                       |
|                 23 | Interpreter of Maladies                             |
|                 32 | A Hologram for the King: A Novel                    |
|                 10 | The Circle                                          |
|                 41 | The Amazing Adventures of Kavalier & Clay           |
|                  9 | Just Kids                                           |
|                 41 | A Heartbreaking Work of Staggering Genius           |
|                  8 | Coraline                                            |
|                 51 | What We Talk About When We Talk About Love: Stories |
|                 40 | Where I'm Calling From: Selected Stories            |
|                 11 | White Noise                                         |
|                 11 | Cannery Row                                         |
|                 17 | Oblivion: Stories                                   |
|                 20 | Consider the Lobster                                |
+--------------------+-----------------------------------------------------+
16 rows in set (0.000 sec)

mysql> SELECT CHAR_LENGTH('Hello World');
+----------------------------+
| CHAR_LENGTH('Hello World') |
+----------------------------+
|                         11 |
+----------------------------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT CHAR_LENGTH(title) as length, title FROM books;
+--------+-----------------------------------------------------+
| length | title                                               |
+--------+-----------------------------------------------------+
|     12 | The Namesake                                        |
|     15 | Norse Mythology                                     |
|     13 | American Gods                                       |
|     23 | Interpreter of Maladies                             |
|     32 | A Hologram for the King: A Novel                    |
|     10 | The Circle                                          |
|     41 | The Amazing Adventures of Kavalier & Clay           |
|      9 | Just Kids                                           |
|     41 | A Heartbreaking Work of Staggering Genius           |
|      8 | Coraline                                            |
|     51 | What We Talk About When We Talk About Love: Stories |
|     40 | Where I'm Calling From: Selected Stories            |
|     11 | White Noise                                         |
|     11 | Cannery Row                                         |
|     17 | Oblivion: Stories                                   |
|     20 | Consider the Lobster                                |
+--------+-----------------------------------------------------+
16 rows in set (0.000 sec)

mysql>  
    -> SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;
+----------------+--------+
| author_lname   | length |
+----------------+--------+
| Lahiri         |      6 |
| Gaiman         |      6 |
| Gaiman         |      6 |
| Lahiri         |      6 |
| Eggers         |      6 |
| Eggers         |      6 |
| Chabon         |      6 |
| Smith          |      5 |
| Eggers         |      6 |
| Gaiman         |      6 |
| Carver         |      6 |
| Carver         |      6 |
| DeLillo        |      7 |
| Steinbeck      |      9 |
| Foster Wallace |     14 |
| Foster Wallace |     14 |
+----------------+--------+
16 rows in set (0.000 sec)

mysql>  
    -> SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;
+-----------------------------------------------------------------------------+
| CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') |
+-----------------------------------------------------------------------------+
| Lahiri is 6 characters long                                                 |
| Gaiman is 6 characters long                                                 |
| Gaiman is 6 characters long                                                 |
| Lahiri is 6 characters long                                                 |
| Eggers is 6 characters long                                                 |
| Eggers is 6 characters long                                                 |
| Chabon is 6 characters long                                                 |
| Smith is 5 characters long                                                  |
| Eggers is 6 characters long                                                 |
| Gaiman is 6 characters long                                                 |
| Carver is 6 characters long                                                 |
| Carver is 6 characters long                                                 |
| DeLillo is 7 characters long                                                |
| Steinbeck is 9 characters long                                              |
| Foster Wallace is 14 characters long                                        |
| Foster Wallace is 14 characters long                                        |
+-----------------------------------------------------------------------------+
16 rows in set (0.000 sec)

mysql> SELECT UPPER('Hello World');
+----------------------+
| UPPER('Hello World') |
+----------------------+
| HELLO WORLD          |
+----------------------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT LOWER('Hello World');
+----------------------+
| LOWER('Hello World') |
+----------------------+
| hello world          |
+----------------------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT UPPER(title) FROM books;
+-----------------------------------------------------+
| UPPER(title)                                        |
+-----------------------------------------------------+
| THE NAMESAKE                                        |
| NORSE MYTHOLOGY                                     |
| AMERICAN GODS                                       |
| INTERPRETER OF MALADIES                             |
| A HOLOGRAM FOR THE KING: A NOVEL                    |
| THE CIRCLE                                          |
| THE AMAZING ADVENTURES OF KAVALIER & CLAY           |
| JUST KIDS                                           |
| A HEARTBREAKING WORK OF STAGGERING GENIUS           |
| CORALINE                                            |
| WHAT WE TALK ABOUT WHEN WE TALK ABOUT LOVE: STORIES |
| WHERE I'M CALLING FROM: SELECTED STORIES            |
| WHITE NOISE                                         |
| CANNERY ROW                                         |
| OBLIVION: STORIES                                   |
| CONSIDER THE LOBSTER                                |
+-----------------------------------------------------+
16 rows in set (0.000 sec)

mysql>  
    -> SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;
+-------------------------------------------------------------------------+
| CONCAT('MY FAVORITE BOOK IS ', UPPER(title))                            |
+-------------------------------------------------------------------------+
| MY FAVORITE BOOK IS THE NAMESAKE                                        |
| MY FAVORITE BOOK IS NORSE MYTHOLOGY                                     |
| MY FAVORITE BOOK IS AMERICAN GODS                                       |
| MY FAVORITE BOOK IS INTERPRETER OF MALADIES                             |
| MY FAVORITE BOOK IS A HOLOGRAM FOR THE KING: A NOVEL                    |
| MY FAVORITE BOOK IS THE CIRCLE                                          |
| MY FAVORITE BOOK IS THE AMAZING ADVENTURES OF KAVALIER & CLAY           |
| MY FAVORITE BOOK IS JUST KIDS                                           |
| MY FAVORITE BOOK IS A HEARTBREAKING WORK OF STAGGERING GENIUS           |
| MY FAVORITE BOOK IS CORALINE                                            |
| MY FAVORITE BOOK IS WHAT WE TALK ABOUT WHEN WE TALK ABOUT LOVE: STORIES |
| MY FAVORITE BOOK IS WHERE I'M CALLING FROM: SELECTED STORIES            |
| MY FAVORITE BOOK IS WHITE NOISE                                         |
| MY FAVORITE BOOK IS CANNERY ROW                                         |
| MY FAVORITE BOOK IS OBLIVION: STORIES                                   |
| MY FAVORITE BOOK IS CONSIDER THE LOBSTER                                |
+-------------------------------------------------------------------------+
16 rows in set (0.000 sec)

mysql>  
    -> SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;
+-------------------------------------------------------------------------+
| CONCAT('MY FAVORITE BOOK IS ', LOWER(title))                            |
+-------------------------------------------------------------------------+
| MY FAVORITE BOOK IS the namesake                                        |
| MY FAVORITE BOOK IS norse mythology                                     |
| MY FAVORITE BOOK IS american gods                                       |
| MY FAVORITE BOOK IS interpreter of maladies                             |
| MY FAVORITE BOOK IS a hologram for the king: a novel                    |
| MY FAVORITE BOOK IS the circle                                          |
| MY FAVORITE BOOK IS the amazing adventures of kavalier & clay           |
| MY FAVORITE BOOK IS just kids                                           |
| MY FAVORITE BOOK IS a heartbreaking work of staggering genius           |
| MY FAVORITE BOOK IS coraline                                            |
| MY FAVORITE BOOK IS what we talk about when we talk about love: stories |
| MY FAVORITE BOOK IS where i'm calling from: selected stories            |
| MY FAVORITE BOOK IS white noise                                         |
| MY FAVORITE BOOK IS cannery row                                         |
| MY FAVORITE BOOK IS oblivion: stories                                   |
| MY FAVORITE BOOK IS consider the lobster                                |
+-------------------------------------------------------------------------+
16 rows in set (0.001 sec)

mysql> SELECT INSERT('Hello Bobby', 6, 0, 'There'); 
+--------------------------------------+
| INSERT('Hello Bobby', 6, 0, 'There') |
+--------------------------------------+
| HelloThere Bobby                     |
+--------------------------------------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT LEFT('omghahalol!', 3);
+------------------------+
| LEFT('omghahalol!', 3) |
+------------------------+
| omg                    |
+------------------------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT RIGHT('omghahalol!', 4);
+-------------------------+
| RIGHT('omghahalol!', 4) |
+-------------------------+
| lol!                    |
+-------------------------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT REPEAT('ha', 4);
+-----------------+
| REPEAT('ha', 4) |
+-----------------+
| hahahaha        |
+-----------------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT TRIM('  pickle  ');
+--------------------+
| TRIM('  pickle  ') |
+--------------------+
| pickle             |
+--------------------+
1 row in set (0.000 sec)

mysql>  SELECT REVERSE(UPPER('Why does my cat look at me with such hatred?'));
+----------------------------------------------------------------+
| REVERSE(UPPER('Why does my cat look at me with such hatred?')) |
+----------------------------------------------------------------+
| ?DERTAH HCUS HTIW EM TA KOOL TAC YM SEOD YHW                   |
+----------------------------------------------------------------+
1 row in set (0.000 sec)

mysql>  
    -> SELECT REPLACE(title, ' ', '->') AS title FROM books;
+--------------------------------------------------------------+
| title                                                        |
+--------------------------------------------------------------+
| The->Namesake                                                |
| Norse->Mythology                                             |
| American->Gods                                               |
| Interpreter->of->Maladies                                    |
| A->Hologram->for->the->King:->A->Novel                       |
| The->Circle                                                  |
| The->Amazing->Adventures->of->Kavalier->&->Clay              |
| Just->Kids                                                   |
| A->Heartbreaking->Work->of->Staggering->Genius               |
| Coraline                                                     |
| What->We->Talk->About->When->We->Talk->About->Love:->Stories |
| Where->I'm->Calling->From:->Selected->Stories                |
| White->Noise                                                 |
| Cannery->Row                                                 |
| Oblivion:->Stories                                           |
| Consider->the->Lobster                                       |
+--------------------------------------------------------------+
16 rows in set (0.000 sec)

mysql>  
    -> SELECT 
    ->     author_lname AS forwards, REVERSE(author_lname) AS backwards
    -> FROM
    ->     books;
+----------------+----------------+
| forwards       | backwards      |
+----------------+----------------+
| Lahiri         | irihaL         |
| Gaiman         | namiaG         |
| Gaiman         | namiaG         |
| Lahiri         | irihaL         |
| Eggers         | sreggE         |
| Eggers         | sreggE         |
| Chabon         | nobahC         |
| Smith          | htimS          |
| Eggers         | sreggE         |
| Gaiman         | namiaG         |
| Carver         | revraC         |
| Carver         | revraC         |
| DeLillo        | olliLeD        |
| Steinbeck      | kcebnietS      |
| Foster Wallace | ecallaW retsoF |
| Foster Wallace | ecallaW retsoF |
+----------------+----------------+
16 rows in set (0.000 sec)

mysql>     
    ->  
    -> SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS 'full name in caps' FROM books;
+----------------------+
| full name in caps    |
+----------------------+
| JHUMPA LAHIRI        |
| NEIL GAIMAN          |
| NEIL GAIMAN          |
| JHUMPA LAHIRI        |
| DAVE EGGERS          |
| DAVE EGGERS          |
| MICHAEL CHABON       |
| PATTI SMITH          |
| DAVE EGGERS          |
| NEIL GAIMAN          |
| RAYMOND CARVER       |
| RAYMOND CARVER       |
| DON DELILLO          |
| JOHN STEINBECK       |
| DAVID FOSTER WALLACE |
| DAVID FOSTER WALLACE |
+----------------------+
16 rows in set (0.000 sec)

mysql>  
    ->  
    -> SELECT CONCAT(title, ' was released in ', released_year) AS blurb FROM books;
+--------------------------------------------------------------------------+
| blurb                                                                    |
+--------------------------------------------------------------------------+
| The Namesake was released in 2003                                        |
| Norse Mythology was released in 2016                                     |
| American Gods was released in 2001                                       |
| Interpreter of Maladies was released in 1996                             |
| A Hologram for the King: A Novel was released in 2012                    |
| The Circle was released in 2013                                          |
| The Amazing Adventures of Kavalier & Clay was released in 2000           |
| Just Kids was released in 2010                                           |
| A Heartbreaking Work of Staggering Genius was released in 2001           |
| Coraline was released in 2003                                            |
| What We Talk About When We Talk About Love: Stories was released in 1981 |
| Where I'm Calling From: Selected Stories was released in 1989            |
| White Noise was released in 1985                                         |
| Cannery Row was released in 1945                                         |
| Oblivion: Stories was released in 2004                                   |
| Consider the Lobster was released in 2005                                |
+--------------------------------------------------------------------------+
16 rows in set (0.000 sec)

mysql>  
    -> SELECT title, CHAR_LENGTH(title) AS character_count FROM books;
+-----------------------------------------------------+-----------------+
| title                                               | character_count |
+-----------------------------------------------------+-----------------+
| The Namesake                                        |              12 |
| Norse Mythology                                     |              15 |
| American Gods                                       |              13 |
| Interpreter of Maladies                             |              23 |
| A Hologram for the King: A Novel                    |              32 |
| The Circle                                          |              10 |
| The Amazing Adventures of Kavalier & Clay           |              41 |
| Just Kids                                           |               9 |
| A Heartbreaking Work of Staggering Genius           |              41 |
| Coraline                                            |               8 |
| What We Talk About When We Talk About Love: Stories |              51 |
| Where I'm Calling From: Selected Stories            |              40 |
| White Noise                                         |              11 |
| Cannery Row                                         |              11 |
| Oblivion: Stories                                   |              17 |
| Consider the Lobster                                |              20 |
+-----------------------------------------------------+-----------------+
16 rows in set (0.000 sec)

mysql>  
    -> SELECT 
    ->     CONCAT(SUBSTR(title, 1, 10), '...') AS short_title,
    ->     CONCAT(author_lname, ',', author_fname) AS author,
    ->     CONCAT(stock_quantity, ' in stock') AS quantity
    -> FROM
    ->     books;
+---------------+----------------------+--------------+
| short_title   | author               | quantity     |
+---------------+----------------------+--------------+
| The Namesa... | Lahiri,Jhumpa        | 32 in stock  |
| Norse Myth... | Gaiman,Neil          | 43 in stock  |
| American G... | Gaiman,Neil          | 12 in stock  |
| Interprete... | Lahiri,Jhumpa        | 97 in stock  |
| A Hologram... | Eggers,Dave          | 154 in stock |
| The Circle... | Eggers,Dave          | 26 in stock  |
| The Amazin... | Chabon,Michael       | 68 in stock  |
| Just Kids...  | Smith,Patti          | 55 in stock  |
| A Heartbre... | Eggers,Dave          | 104 in stock |
| Coraline...   | Gaiman,Neil          | 100 in stock |
| What We Ta... | Carver,Raymond       | 23 in stock  |
| Where I'm ... | Carver,Raymond       | 12 in stock  |
| White Nois... | DeLillo,Don          | 49 in stock  |
| Cannery Ro... | Steinbeck,John       | 95 in stock  |
| Oblivion: ... | Foster Wallace,David | 172 in stock |
| Consider t... | Foster Wallace,David | 92 in stock  |
+---------------+----------------------+--------------+
16 rows in set (0.000 sec)
