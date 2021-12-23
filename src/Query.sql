1) List all the columns of the Salespeople table.
--------------------------------------------------
Query- SELECT * FROM salespeople;
       +------+---------+-----------+------+
       | SNUM | SNAME   | CITY      | COMM |
       +------+---------+-----------+------+
       | 1001 | Peel    | London    |   12 |
       | 1002 | Serres  | SanJose   |   13 |
       | 1003 | AxelRod | New York  |   10 |
       | 1004 | Motika  | London    |   11 |
       | 1007 | Riffikn | Barcelona |   15 |
       | 1008 | Fran    | London    |   25 |
       +------+---------+-----------+------+

2) List all customers with a rating of 100.
----------------------------------------------
Query- SELECT CNAME FROM customers WHERE RATING = 100;
       +---------+
       | CNAME   |
       +---------+
       | Hoffman |
       | Clemens |
       | Pereira |
       +---------+

3) Find the largest order taken by each Salesperson on each date.
------------------------------------------------------------------
Query- SELECT s.SNUM, s.SNAME, o.ODATE, o.AMT FROM salespeople as s, orders as o WHERE s.SNUM = o.SNUM and o.AMT IN(SELECT  MAX(AMT) FROM orders GROUP BY SNUM);

       +------+---------+----------+---------+
       | SNUM | SNAME   | ODATE    | AMT     |
       +------+---------+----------+---------+
       | 1004 | Motika  | 10/03/90 |  1900.1 |
       | 1002 | Serres  | 10/03/90 | 5160.45 |
       | 1007 | Riffikn | 10/03/90 | 1098.16 |
       | 1003 | AxelRod | 10/04/90 | 1713.23 |
       | 1001 | Peel    | 10/06/90 | 9891.88 |
       +------+---------+----------+---------+

4) Arrange the Order table by descending customer number.
----------------------------------------------------------
Query- SELECT * FROM orders ORDER BY CNUM DESC;
       +------+---------+----------+------+------+
       | ONUM | AMT     | ODATE    | CNUM | SNUM |
       +------+---------+----------+------+------+
       | 3001 |   18.69 | 10/03/90 | 2008 | 1007 |
       | 3006 | 1098.16 | 10/03/90 | 2008 | 1007 |
       | 3002 |  1900.1 | 10/03/90 | 2007 | 1004 |
       | 3008 |    4723 | 10/05/90 | 2006 | 1001 |
       | 3011 | 9891.88 | 10/06/90 | 2006 | 1001 |
       | 3007 |   75.75 | 10/04/90 | 2004 | 1002 |
       | 3010 | 1309.95 | 10/06/90 | 2004 | 1002 |
       | 3005 | 5160.45 | 10/03/90 | 2003 | 1002 |
       | 3009 | 1713.23 | 10/04/90 | 2002 | 1003 |
       | 3003 |  767.19 | 10/03/90 | 2001 | 1001 |
       +------+---------+----------+------+------+

5) Find which salespeople currently have orders in the order table.
--------------------------------------------------------------------
Query- SELECT SNAME FROM salespeople WHERE SNUM IN (SELECT SNUM FROM orders);
       +---------+
       | SNAME   |
       +---------+
       | Peel    |
       | Serres  |
       | AxelRod |
       | Motika  |
       | Riffikn |
       +---------+

6) List names of all customers matched with the salespeople serving them.
--------------------------------------------------------------------------
Query- SELECT c.CNAME, s.SNAME FROM customers as c, salespeople as s WHERE s.SNUM = c.SNUM;
       +----------+---------+
       | CNAME    | SNAME   |
       +----------+---------+
       | Hoffman  | Peel    |
       | Glovanni | AxelRod |
       | Liu      | Serres  |
       | Grass    | Serres  |
       | Clemens  | Peel    |
       | Pereira  | Motika  |
       | Cisneros | Riffikn |
       +----------+---------+

7) Find the names and numbers of all salespeople who have more than one customer.
----------------------------------------------------------------------------------
Query- SELECT SNUM, SNAME FROM salespeople as s WHERE 1 < (SELECT COUNT(*) as COUNT FROM customers WHERE SNUM = s.SNUM);
       +------+--------+
       | SNUM | SNAME  |
       +------+--------+
       | 1001 | Peel   |
       | 1002 | Serres |
       +------+--------+

8) Count the orders of each of the salespeople and output the results in descending order.
-------------------------------------------------------------------------------------------
Query- SELECT COUNT(ONUM), o.SNUM, s.SNAME FROM orders as o, salespeople as s WHERE o.SNUM = s.SNUM GROUP BY s.SNUM ORDER BY COUNT(ONUM) DESC;
       +-------------+------+---------+
       | COUNT(ONUM) | SNUM | SNAME   |
       +-------------+------+---------+
       |           3 | 1002 | Serres  |
       |           3 | 1001 | Peel    |
       |           2 | 1007 | Riffikn |
       |           1 | 1003 | AxelRod |
       |           1 | 1004 | Motika  |
       +-------------+------+---------+

9) List the customer table if and only if one or more of the customers in the Customer table are located in SanJose.
10) Match salespeople to customers according to what city they live in.
-----------------------------------------------------------------------
Query- SELECT s.SNAME, c.CNAME, s.CITY FROM salespeople s, customers c WHERE s.CITY = c.CITY;
       +--------+----------+---------+
       | SNAME  | CNAME    | CITY    |
       +--------+----------+---------+
       | Serres | Liu      | SanJose |
       | Serres | Cisneros | SanJose |
       +--------+----------+---------+

11) Find all the customers in SanJose who have a rating above 200.
-------------------------------------------------------------------
Query- SELECT * FROM customers WHERE RATING > 200 and CITY = 'SanJose';
       +------+----------+---------+--------+------+
       | CNUM | CNAME    | CITY    | RATING | SNUM |
       +------+----------+---------+--------+------+
       | 2008 | Cisneros | SanJose |    300 | 1007 |
       +------+----------+---------+--------+------+

12) List the names and commissions of all salespeople in London.
-----------------------------------------------------------------
Query- SELECT SNAME, COMM FROM Salespeople WHERE CITY LIKE 'London';
       +--------+------+
       | SNAME  | COMM |
       +--------+------+
       | Peel   |   12 |
       | Motika |   11 |
       | Fran   |   25 |
       +--------+------+

13) List all the orders of Salesperson Motika from the orders table.
---------------------------------------------------------------------
Query- SELECT SNAME, ONUM, AMT FROM salespeople s, orders o, customers c WHERE s.SNUM = c.SNUM and c.CNUM = o.CNUM and
       SNAME LIKE 'Motika';
       +--------+------+--------+
       | SNAME  | ONUM | AMT    |
       +--------+------+--------+
       | Motika | 3002 | 1900.1 |
       +--------+------+--------+

14) Find all customers who booked orders on October 3.
-------------------------------------------------------
Query- SELECT CNAME FROM customers c, orders o where c.CNUM = o.CNUM AND ODATE LIKE '10/03/%';
       +----------+
       | CNAME    |
       +----------+
       | Cisneros |
       | Pereira  |
       | Hoffman  |
       | Liu      |
       | Cisneros |
       +----------+

15) Give the sums of the amounts from the Orders table, grouped by date, eliminating all those dates where the SUM was not at least 2000 above
the maximum Amount.
------------------------------------------------------------------------------------------------------------------------------------------------
Query- SELECT ODATE, SUM(AMT) FROM orders as o GROUP BY ODATE HAVING SUM(AMT) > (SELECT MAX(AMT) + 2000 FROM orders as od WHERE o.ODATE = od.ODATE);
       +----------+----------+
       | ODATE    | SUM(AMT) |
       +----------+----------+
       | 10/03/90 |  8944.59 |
       +----------+----------+

16) Select all orders that had amounts that were greater than at least one of the orders from October 6.
17) Write a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300.
-------------------------------------------------------------------------------------------------------------------
Query- SELECT SNAME, SNUM FROM salespeople WHERE EXISTS(SELECT RATING FROM customers WHERE RATING = 300);
       +---------+------+
       | SNAME   | SNUM |
       +---------+------+
       | Peel    | 1001 |
       | Serres  | 1002 |
       | AxelRod | 1003 |
       | Motika  | 1004 |
       | Riffikn | 1007 |
       | Fran    | 1008 |
       +---------+------+

18) Find all customers whose cnum is 1000 above the snum of Serres.
-------------------------------------------------------------------
Query- SELECT CNUM, CNAME FROM customers WHERE CNUM > (SELECT SNUM + 1000 FROM salespeople WHERE SNAME LIKE 'Serres');
       +------+----------+
       | CNUM | CNAME    |
       +------+----------+
       | 2003 | Liu      |
       | 2004 | Grass    |
       | 2006 | Clemens  |
       | 2007 | Pereira  |
       | 2008 | Cisneros |
       +------+----------+

19) Give the salespeople’s commissions as percentages instead of decimal numbers.
---------------------------------------------------------------------------------
Query- SELECT SNAME, SNUM, COMM, COMM*100,'%' FROM salespeople;
       +---------+------+------+----------+---+
       | SNAME   | SNUM | COMM | COMM*100 | % |
       +---------+------+------+----------+---+
       | Peel    | 1001 |   12 |     1200 | % |
       | Serres  | 1002 |   13 |     1300 | % |
       | AxelRod | 1003 |   10 |     1000 | % |
       | Motika  | 1004 |   11 |     1100 | % |
       | Riffikn | 1007 |   15 |     1500 | % |
       | Fran    | 1008 |   25 |     2500 | % |
       +---------+------+------+----------+---+

20) Find the largest order taken by each salesperson on each date, eliminating those Maximum orders, which are less than 3000.
------------------------------------------------------------------------------------------------------------------------------
Query- SELECT s.SNAME, o.SNUM, o.ODATE, o.ONUM, o.AMT FROM salespeople as s, orders as o WHERE o.SNUM = s.SNUM and AMT > 3000;
       +--------+------+----------+------+---------+
       | SNAME  | SNUM | ODATE    | ONUM | AMT     |
       +--------+------+----------+------+---------+
       | Serres | 1002 | 10/03/90 | 3005 | 5160.45 |
       | Peel   | 1001 | 10/05/90 | 3008 |    4723 |
       | Peel   | 1001 | 10/06/90 | 3011 | 9891.88 |
       +--------+------+----------+------+---------+

21) List all the largest orders for October 3, for each salesperson.
22) Find all customers located in cities where Serres has customers.
23) Select all customers with a rating above 200.
--------------------------------------------------
Query- select * from Customers where RATING > 200;
       +------+----------+---------+--------+------+
       | CNUM | CNAME    | CITY    | RATING | SNUM |
       +------+----------+---------+--------+------+
       | 2004 | Grass    | Berlin  |    300 | 1002 |
       | 2008 | Cisneros | SanJose |    300 | 1007 |
       +------+----------+---------+--------+------+

24) Count the number of salespeople currently having orders in the orders table.
--------------------------------------------------------------------------------
Query- SELECT COUNT(DISTINCT SNUM) FROM orders;
       +----------------------+
       | COUNT(DISTINCT SNUM) |
       +----------------------+
       |                    5 |
       +----------------------+

25) Write a query that produces all customers serviced by salespeople with a commission above 12%. Output the customer’s name,
salesperson’s name and the salesperson’s rate of commission.
-------------------------------------------------------------------------------------------------------------------------------
Query- SELECT c.CNAME, S.SNAME, s.COMM FROM customers c, salespeople s WHERE c.SNUM = S.SNUM and s.COMM > 12;
       +----------+---------+------+
       | CNAME    | SNAME   | COMM |
       +----------+---------+------+
       | Liu      | Serres  |   13 |
       | Grass    | Serres  |   13 |
       | Cisneros | Riffikn |   15 |
       +----------+---------+------+

26) Find salespeople who have multiple customers.
27) Find salespeople with customers located in their own cities.
-----------------------------------------------------------------
Query- SELECT SNUM, SNAME, CITY FROM salespeople WHERE CITY = ANY(SELECT CITY FROM customers);
       +------+--------+---------+
       | SNUM | SNAME  | CITY    |
       +------+--------+---------+
       | 1002 | Serres | SanJose |
       +------+--------+---------+

28) Find all salespeople whose name starts with ‘P’ and fourth character is ‘L’.
--------------------------------------------------------------------------------
Query- SELECT * FROM Salespeople WHERE SNAME LIKE '%P__l%';
       +------+-------+--------+------+
       | SNUM | SNAME | CITY   | COMM |
       +------+-------+--------+------+
       | 1001 | Peel  | London |   12 |
       +------+-------+--------+------+

29) Write a query that uses a subquery to obtain all orders for the customer named ‘Cisneros’. Assume you do not know his customer number.
-------------------------------------------------------------------------------------------------------------------------------------------
Query- SELECT o.ONUM, o.ODATE, c.CNAME FROM customers as c, orders as o WHERE o.CNUM = c.CNUM and c.CNAME LIKE 'Cisneros' ORDER BY c.CNAME;
       +------+----------+----------+
       | ONUM | ODATE    | CNAME    |
       +------+----------+----------+
       | 3001 | 10/03/90 | Cisneros |
       | 3006 | 10/03/90 | Cisneros |
       +------+----------+----------+

30) Find the largest orders for Serres and Rifkin.
31) Sort the salespeople table in the following order: snum, sname, commission, city.
--------------------------------------------------------------------------------------
Query- SELECT SNUM, SNAME, COMM, CITY FROM salespeople;
       +------+---------+------+-----------+
       | SNUM | SNAME   | COMM | CITY      |
       +------+---------+------+-----------+
       | 1001 | Peel    |   12 | London    |
       | 1002 | Serres  |   13 | SanJose   |
       | 1003 | AxelRod |   10 | New York  |
       | 1004 | Motika  |   11 | London    |
       | 1007 | Riffikn |   15 | Barcelona |
       | 1008 | Fran    |   25 | London    |
       +------+---------+------+-----------+

32) Select all customers whose names fall in between ‘A’ and ‘G’ alphabetical range.
------------------------------------------------------------------------------------
Query- SELECT CNAME FROM customers WHERE CNAME BETWEEN ('a%') and ('h%') ORDER BY CNAME ASC;
       +----------+
       | CNAME    |
       +----------+
       | Cisneros |
       | Clemens  |
       | Glovanni |
       | Grass    |
       +----------+

33) Select all the possible combinations of customers you can assign.
---------------------------------------------------------------------
Query- SELECT c.CNAME,s.SNAME FROM customers c INNER JOIN salespeople s on c.SNUM = s.SNUM;
       +----------+---------+
       | CNAME    | SNAME   |
       +----------+---------+
       | Hoffman  | Peel    |
       | Glovanni | AxelRod |
       | Liu      | Serres  |
       | Grass    | Serres  |
       | Clemens  | Peel    |
       | Pereira  | Motika  |
       | Cisneros | Riffikn |
       +----------+---------+

34) Select all orders that are greater than the average for October 4.
-----------------------------------------------------------------------
Query- SELECT ODATE, ONUM, AMT FROM orders WHERE AMT>(SELECT AVG(AMT) FROM orders WHERE ODATE LIKE '10/04/90');
       +----------+------+---------+
       | ODATE    | ONUM | AMT     |
       +----------+------+---------+
       | 10/03/90 | 3002 |  1900.1 |
       | 10/03/90 | 3005 | 5160.45 |
       | 10/03/90 | 3006 | 1098.16 |
       | 10/05/90 | 3008 |    4723 |
       | 10/04/90 | 3009 | 1713.23 |
       | 10/06/90 | 3010 | 1309.95 |
       | 10/06/90 | 3011 | 9891.88 |
       +----------+------+---------+

35) Write a select command using correlated subquery that selects the names and numbers of all customers with ratings equal to the maximum
for their city.
--------------------------------------------------------------------------------------------------------------------------------------------
Query- SELECT CNUM, CNAME, RATING, CITY FROM customers c WHERE c.RATING = (SELECT MAX(RATING) FROM customers customer WHERE c.CITY = customer.CI
       TY);
       +------+----------+--------+---------+
       | CNUM | CNAME    | RATING | CITY    |
       +------+----------+--------+---------+
       | 2001 | Hoffman  |    100 | Londan  |
       | 2002 | Glovanni |    200 | Rome    |
       | 2004 | Grass    |    300 | Berlin  |
       | 2006 | Clemens  |    100 | Londan  |
       | 2008 | Cisneros |    300 | SanJose |
       +------+----------+--------+---------+

36) Write a query that totals the orders for each day and places the results in descending order.
--------------------------------------------------------------------------------------------------
Query- SELECT SUM(AMT) as AMT, ODATE FROM orders GROUP BY ODATE ORDER BY AMT DESC;
       +----------+----------+
       | AMT      | ODATE    |
       +----------+----------+
       | 11201.83 | 10/06/90 |
       |  8944.59 | 10/03/90 |
       |     4723 | 10/05/90 |
       |  1788.98 | 10/04/90 |
       +----------+----------+

37) Write a select command that produces the rating followed by the name of each customer in SanJose.
-----------------------------------------------------------------------------------------------------
Query- SELECT CNAME, CNUM, RATING FROM customers WHERE  CITY LIKE 'SanJose';
       +----------+------+--------+
       | CNAME    | CNUM | RATING |
       +----------+------+--------+
       | Liu      | 2003 |    200 |
       | Cisneros | 2008 |    300 |
       +----------+------+--------+

38) Find all orders with amounts smaller than any amount for a customer in SanJose.
------------------------------------------------------------------------------------
Query- SELECT AMT, ODATE, ONUM FROM orders WHERE AMT < ANY(SELECT AMT FROM orders as o, customers as c WHERE c.CITY LIKE 'SanJose' and c.CNUM =
       o.CNUM);
       +---------+----------+------+
       | AMT     | ODATE    | ONUM |
       +---------+----------+------+
       |   18.69 | 10/03/90 | 3001 |
       |  1900.1 | 10/03/90 | 3002 |
       |  767.19 | 10/03/90 | 3003 |
       | 1098.16 | 10/03/90 | 3006 |
       |   75.75 | 10/04/90 | 3007 |
       |    4723 | 10/05/90 | 3008 |
       | 1713.23 | 10/04/90 | 3009 |
       | 1309.95 | 10/06/90 | 3010 |
       +---------+----------+------+

39) Find all orders with above average amounts for their customers.
--------------------------------------------------------------------
Query- SELECT ONUM, ODATE, AMT FROM orders NATURAL JOIN customers WHERE AMT > (SELECT AVG(AMT) FROM orders);
       +------+----------+---------+
       | ONUM | ODATE    | AMT     |
       +------+----------+---------+
       | 3005 | 10/03/90 | 5160.45 |
       | 3008 | 10/05/90 |    4723 |
       | 3011 | 10/06/90 | 9891.88 |
       +------+----------+---------+

40) Write a query that selects the highest rating in each city.
---------------------------------------------------------------
Query- SELECT CNAME, CITY, MAX(RATING) FROM customers GROUP BY CITY, CNAME;
       +----------+---------+-------------+
       | CNAME    | CITY    | MAX(RATING) |
       +----------+---------+-------------+
       | Grass    | Berlin  |         300 |
       | Clemens  | Londan  |         100 |
       | Hoffman  | Londan  |         100 |
       | Glovanni | Rome    |         200 |
       | Pereira  | Rome    |         100 |
       | Cisneros | SanJose |         300 |
       | Liu      | SanJose |         200 |
       +----------+---------+-------------+

41) Write a query that calculates the amount of the salesperson’s commission on each order by a customer with a rating above 100.00.
42) Count the customers with ratings above SanJose’s average.
-------------------------------------------------------------
Query- SELECT CNUM, CNAME, RATING FROM customers WHERE RATING > (SELECT AVG(RATING) FROM customers WHERE CITY LIKE 'SanJose');
       +------+----------+--------+
       | CNUM | CNAME    | RATING |
       +------+----------+--------+
       | 2004 | Grass    |    300 |
       | 2008 | Cisneros |    300 |
       +------+----------+--------+

43) Find all salespeople that are located in either Barcelona or London.
-------------------------------------------------------------------------
Query- SELECT SNAME, CITY FROM salespeople WHERE CITY = 'Barcelona' or CITY = 'London';
       +---------+-----------+
       | SNAME   | CITY      |
       +---------+-----------+
       | Peel    | London    |
       | Motika  | London    |
       | Riffikn | Barcelona |
       | Fran    | London    |
       +---------+-----------+

44) Find all salespeople with only one customer.
------------------------------------------------
Query- SELECT SNUM, SNAME FROM salespeople s WHERE 1 =(SELECT COUNT(*) FROM customers WHERE SNUM = s.SNUM);
       +------+---------+
       | SNUM | SNAME   |
       +------+---------+
       | 1003 | AxelRod |
       | 1004 | Motika  |
       | 1007 | Riffikn |
       +------+---------+

45) Write a query that joins the Customer table to itself to find all pairs or customers served by a single salesperson.
46) Write a query that will give you all orders for more than $1000.00.
------------------------------------------------------------------------
Query- SELECT ONUM, AMT FROM orders WHERE AMT > 1000;
       +------+---------+
       | ONUM | AMT     |
       +------+---------+
       | 3002 |  1900.1 |
       | 3005 | 5160.45 |
       | 3006 | 1098.16 |
       | 3008 |    4723 |
       | 3009 | 1713.23 |
       | 3010 | 1309.95 |
       | 3011 | 9891.88 |
       +------+---------+

47) Write a query that lists each order number followed by the name of the customer who made that order.
---------------------------------------------------------------------------------------------------------
Query- SELECT o.ONUM, c.CNAME FROM customers as c, orders as o WHERE c.CNUM = o.CNUM;
       +------+----------+
       | ONUM | CNAME    |
       +------+----------+
       | 3003 | Hoffman  |
       | 3009 | Glovanni |
       | 3005 | Liu      |
       | 3007 | Grass    |
       | 3010 | Grass    |
       | 3008 | Clemens  |
       | 3011 | Clemens  |
       | 3002 | Pereira  |
       | 3001 | Cisneros |
       | 3006 | Cisneros |
       +------+----------+

48) Write a query that selects all the customers whose ratings are equal to or greater than ANY(in the SQL sense) of ‘Serres’.
------------------------------------------------------------------------------------------------------------------------------
Query- SELECT CNUM, CNAME FROM CUSTOMERS WHERE RATING >= ANY(SELECT RATING FROM CUSTOMERS WHERE SNUM = (SELECT SNUM FROM salespeople WHERE SNAME
        LIKE 'Serres'));
       +------+----------+
       | CNUM | CNAME    |
       +------+----------+
       | 2002 | Glovanni |
       | 2003 | Liu      |
       | 2004 | Grass    |
       | 2008 | Cisneros |
       +------+----------+

49) Write two queries that will produce all orders taken on October 3 or October 4.
-----------------------------------------------------------------------------------
Query- SELECT ONUM, ODATE FROM orders WHERE ODATE = '10/03/90';
       +------+----------+
       | ONUM | ODATE    |
       +------+----------+
       | 3001 | 10/03/90 |
       | 3002 | 10/03/90 |
       | 3003 | 10/03/90 |
       | 3005 | 10/03/90 |
       | 3006 | 10/03/90 |
       +------+----------+

       mysql> SELECT ONUM, ODATE FROM orders WHERE ODATE = '10/04/90';
       +------+----------+
       | ONUM | ODATE    |
       +------+----------+
       | 3007 | 10/04/90 |
       | 3009 | 10/04/90 |
       +------+----------+

50) Find only those customers whose ratings are higher than every customer in Rome.
------------------------------------------------------------------------------------
Query- SELECT CNUM, CNAME, CITY, RATING FROM customers WHERE RATING > ALL(SELECT RATING FROM customers WHERE CITY LIKE 'Rome');
       +------+----------+---------+--------+
       | CNUM | CNAME    | CITY    | RATING |
       +------+----------+---------+--------+
       | 2004 | Grass    | Berlin  |    300 |
       | 2008 | Cisneros | SanJose |    300 |
       +------+----------+---------+--------+

51) Write a query on the Customers table whose output will exclude all customers with a rating<= 100.00, unless they are located in Rome.
-----------------------------------------------------------------------------------------------------------------------------------------
Query- SELECT CNUM, CNAME, RATING, CITY FROM customers WHERE RATING <= 100 and CITY LIKE 'Rome';
       +------+---------+--------+------+
       | CNUM | CNAME   | RATING | CITY |
       +------+---------+--------+------+
       | 2007 | Pereira |    100 | Rome |
       +------+---------+--------+------+

52) Find all rows from the customer’s table for which the salesperson number is 1001.
-------------------------------------------------------------------------------------
Query- SELECT * FROM customers WHERE SNUM = 1001;
       +------+---------+--------+--------+------+
       | CNUM | CNAME   | CITY   | RATING | SNUM |
       +------+---------+--------+--------+------+
       | 2001 | Hoffman | Londan |    100 | 1001 |
       | 2006 | Clemens | Londan |    100 | 1001 |
       +------+---------+--------+--------+------+

53) Find the total amount in orders for each salesperson where their total of amounts are greater than the amount of the largest order in the table.
----------------------------------------------------------------------------------------------------------------------------------------------------
Query- SELECT CNUM, CNAME, RATING FROM Customers WHERE RATING > 200;
       +------+----------+--------+
       | CNUM | CNAME    | RATING |
       +------+----------+--------+
       | 2004 | Grass    |    300 |
       | 2008 | Cisneros |    300 |
       +------+----------+--------+

54) Write a query that selects all orders save those with zeroes or NULL in the amount file.
---------------------------------------------------------------------------------------------
Query- SELECT ONUM, AMT, ODATE FROM orders;
       +------+---------+----------+
       | ONUM | AMT     | ODATE    |
       +------+---------+----------+
       | 3001 |   18.69 | 10/03/90 |
       | 3002 |  1900.1 | 10/03/90 |
       | 3003 |  767.19 | 10/03/90 |
       | 3005 | 5160.45 | 10/03/90 |
       | 3006 | 1098.16 | 10/03/90 |
       | 3007 |   75.75 | 10/04/90 |
       | 3008 |    4723 | 10/05/90 |
       | 3009 | 1713.23 | 10/04/90 |
       | 3010 | 1309.95 | 10/06/90 |
       | 3011 | 9891.88 | 10/06/90 |
       +------+---------+----------+

55) Produce all combinations of salespeople and customer names such that the former precedes the latter alphabetically, and the latter has a
rating of less than 200.
---------------------------------------------------------------------------------------------------------------------------------------------
Query- SELECT c.CNAME, s.SNAME, c.RATING FROM salespeople as s, customers as c WHERE c.RATING < 200 GROUP BY s.SNAME, c.CNAME, c.RATING having c.CNAME >= s.SNAME;
       +---------+---------+--------+
       | CNAME   | SNAME   | RATING |
       +---------+---------+--------+
       | Clemens | AxelRod |    100 |
       | Hoffman | AxelRod |    100 |
       | Pereira | AxelRod |    100 |
       | Hoffman | Fran    |    100 |
       | Pereira | Fran    |    100 |
       | Pereira | Motika  |    100 |
       | Pereira | Peel    |    100 |
       +---------+---------+--------+

56) Find all salespeople name and commission.
----------------------------------------------
Query- SELECT SNAME, COMM from salespeople;
       +---------+------+
       | SNAME   | COMM |
       +---------+------+
       | Peel    |   12 |
       | Serres  |   13 |
       | AxelRod |   10 |
       | Motika  |   11 |
       | Riffikn |   15 |
       | Fran    |   25 |
       +---------+------+

57) Write a query that produces the names and cities of all customers with the same rating as Hoffman. Write the query using Hoffman’s cnum
rather than his rating, so that it would still be usable if his rating is changed.
58) Find all salespeople for whom there are customers that follow them in alphabetical order.
---------------------------------------------------------------------------------------------
Query- SELECT CNUM, CNAME, RATING FROM customers WHERE SNUM IN (SELECT SNUM FROM orders WHERE AMT > (SELECT AVG(AMT) FROM orders));
       +------+---------+--------+
       | CNUM | CNAME   | RATING |
       +------+---------+--------+
       | 2003 | Liu     |    200 |
       | 2004 | Grass   |    300 |
       | 2001 | Hoffman |    100 |
       | 2006 | Clemens |    100 |
       +------+---------+--------+

59) Write a query that produces the names and ratings of all customers who have average orders.
-------------------------------------------------------------------------------------------------
Query- SELECT CNUM, CNAME, RATING FROM customers WHERE SNUM IN (SELECT SNUM FROM orders WHERE AMT > (SELECT AVG(AMT) FROM orders));
       +------+---------+--------+
       | CNUM | CNAME   | RATING |
       +------+---------+--------+
       | 2003 | Liu     |    200 |
       | 2004 | Grass   |    300 |
       | 2001 | Hoffman |    100 |
       | 2006 | Clemens |    100 |
       +------+---------+--------+

60) Find the SUM of all Amounts from the orders table.
-------------------------------------------------------
Query- SELECT SUM(AMT) FROM orders;
       +----------+
       | SUM(AMT) |
       +----------+
       |  26658.4 |
       +----------+

61) Write a SELECT command that produces the order number, amount, and the date from rows in the order table.
--------------------------------------------------------------------------------------------------------------
Query- SELECT ONUM, AMT, ODATE FROM orders;
       +------+---------+----------+
       | ONUM | AMT     | ODATE    |
       +------+---------+----------+
       | 3001 |   18.69 | 10/03/90 |
       | 3002 |  1900.1 | 10/03/90 |
       | 3003 |  767.19 | 10/03/90 |
       | 3005 | 5160.45 | 10/03/90 |
       | 3006 | 1098.16 | 10/03/90 |
       | 3007 |   75.75 | 10/04/90 |
       | 3008 |    4723 | 10/05/90 |
       | 3009 | 1713.23 | 10/04/90 |
       | 3010 | 1309.95 | 10/06/90 |
       | 3011 | 9891.88 | 10/06/90 |
       +------+---------+----------+

62) Count the number of non NULL rating fields in the Customers table (including repeats).
------------------------------------------------------------------------------------------
Query- SELECT COUNT(RATING) FROM customers WHERE RATING != NULL;
       +---------------+
       | COUNT(RATING) |
       +---------------+
       |             0 |
       +---------------+

63) Write a query that gives the names of both the salesperson and the customer for each order after the order number.
64) List the commissions of all salespeople servicing customers in London.
--------------------------------------------------------------------------
Query- SELECT CITY, COMM FROM salespeople WHERE CITY = 'London' GROUP BY CITY, COMM;
       +--------+------+
       | CITY   | COMM |
       +--------+------+
       | London |   11 |
       | London |   12 |
       | London |   25 |
       +--------+------+

65) Write a query using ANY or ALL that will find all salespeople who have no customers located in their city.
--------------------------------------------------------------------------------------------------------------
Query- SELECT s.SNAME, s.CITY, c.CNAME, c.CITY as CUSTOMER_CITY FROM salespeople as s, customers as c WHERE s.SNUM = c.SNUM and s.CITY != c.CITY;
       +---------+-----------+----------+---------------+
       | SNAME   | CITY      | CNAME    | CUSTOMER_CITY |
       +---------+-----------+----------+---------------+
       | Peel    | London    | Hoffman  | Londan        |
       | AxelRod | New York  | Glovanni | Rome          |
       | Serres  | SanJose   | Grass    | Berlin        |
       | Peel    | London    | Clemens  | Londan        |
       | Motika  | London    | Pereira  | Rome          |
       | Riffikn | Barcelona | Cisneros | SanJose       |
       +---------+-----------+----------+---------------+

66) Write a query using the EXISTS operator that selects all salespeople with customers located in their cities who are not assigned to them.
67) Write a query that selects all customers serviced by Peel or Motika. (Hint: The snum field relates the 2 tables to one another.)
------------------------------------------------------------------------------------------------------------------------------------
Query- SELECT CNAME FROM customers as c, orders as o WHERE o.CNUM = c.CNUM and o.SNUM IN (SELECT SNUM FROM salespeople WHERE SNAME IN ('Peel', 'Motika'));
       +---------+
       | CNAME   |
       +---------+
       | Hoffman |
       | Clemens |
       | Clemens |
       | Pereira |
       +---------+

68) Count the number of salespeople registering orders for each day. (If a salesperson has more than one order on a given day, he or she should
be counted only once.)
69) Find all orders attributed to salespeople who live in London.
------------------------------------------------------------------
Query- SELECT * FROM orders WHERE SNUM IN (SELECT SNUM FROM salespeople WHERE CITY LIKE 'London');
       +------+---------+------+------+----------+
       | ONUM | AMT     | CNUM | SNUM | ODATE    |
       +------+---------+------+------+----------+
       | 3003 |  767.19 | 2001 | 1001 | 10/03/90 |
       | 3008 |    4723 | 2006 | 1001 | 10/05/90 |
       | 3011 | 9891.88 | 2006 | 1001 | 10/06/90 |
       | 3002 |  1900.1 | 2007 | 1004 | 10/03/90 |
       +------+---------+------+------+----------+

70) Find all orders by customers not located in the same cities as their salespeople.
71) Find all salespeople who have customers with more than one current order.
-------------------------------------------------------------------------------
Query- SELECT CITY, MAX(RATING) as RATING FROM customers c, orders o WHERE c.CNUM = o.CNUM GROUP BY CITY;
       +---------+--------+
       | CITY    | RATING |
       +---------+--------+
       | Berlin  |    300 |
       | Londan  |    100 |
       | Rome    |    200 |
       | SanJose |    300 |
       +---------+--------+

72) Write a query that extracts from the customer’s table every customer assigned to a salesperson, who is currently having at least one another
customer(besides the customer being selected) with orders in the Orders Table.
73) Write a query on the customer’s table that will find the highest rating in each city. Put the output in this form: for the city (city), the highest
rating is (rating).
---------------------------------------------------------------------------------------------------------------------------------------------------------
Query- SELECT CITY, MAX(RATING) FROM customers GROUP BY CITY;
       +---------+-------------+
       | CITY    | MAX(RATING) |
       +---------+-------------+
       | Berlin  |         300 |
       | Londan  |         100 |
       | Rome    |         200 |
       | SanJose |         300 |
       +---------+-------------+

74) Write a query that will produce the snum values of all salespeople with orders, having amt greater than 1000 in the Orders Table(without
repeats).
----------------------------------------------------------------------------------------------------------------------------------------------
Query- SELECT DISTINCT SNUM FROM orders WHERE AMT > 1000;
       +------+
       | SNUM |
       +------+
       | 1001 |
       | 1002 |
       | 1003 |
       | 1004 |
       | 1007 |
       +------+

75) Write a query that lists customers in a descending order of rating. Output the rating field first, followed by the customer’s names and numbers.
-----------------------------------------------------------------------------------------------------------------------------------------------------
Query- SELECT RATING, CNAME, CNUM FROM customers ORDER BY RATING DESC;
       +--------+----------+------+
       | RATING | CNAME    | CNUM |
       +--------+----------+------+
       |    300 | Grass    | 2004 |
       |    300 | Cisneros | 2008 |
       |    200 | Glovanni | 2002 |
       |    200 | Liu      | 2003 |
       |    100 | Hoffman  | 2001 |
       |    100 | Clemens  | 2006 |
       |    100 | Pereira  | 2007 |
       +--------+----------+------+

76) Find the average commission for salespeople in London.
-----------------------------------------------------------
Query- SELECT CITY, AVG(COMM) FROM salespeople WHERE CITY = 'London';
       +--------+-----------+
       | CITY   | AVG(COMM) |
       +--------+-----------+
       | London |   16.0000 |
       +--------+-----------+

77) Find all orders credited to the same salesperson who services Hoffman.(cnum 2001).
78) Find all salespeople whose commission is in between 0.10 and 0.12(both inclusive).
---------------------------------------------------------------------------------------
Query- SELECT SNAME, SNUM, COMM FROM salespeople WHERE COMM BETWEEN 10 and 12;
       +---------+------+------+
       | SNAME   | SNUM | COMM |
       +---------+------+------+
       | Peel    | 1001 |   12 |
       | AxelRod | 1003 |   10 |
       | Motika  | 1004 |   11 |
       +---------+------+------+

79) Write a query that will give you the names and cities of all salespeople in London with a commission above 0.10.
--------------------------------------------------------------------------------------------------------------------
Query- SELECT SNAME, CITY, COMM FROM salespeople WHERE CITY = 'London' and COMM > 0.10;
       +--------+--------+------+
       | SNAME  | CITY   | COMM |
       +--------+--------+------+
       | Peel   | London |   12 |
       | Motika | London |   11 |
       | Fran   | London |   25 |
       +--------+--------+------+

80) Write a query that selects each customer’s smallest order.
--------------------------------------------------------------
Query- SELECT CNUM, MIN(AMT) FROM orders GROUP BY CNUM;
       +------+----------+
       | CNUM | MIN(AMT) |
       +------+----------+
       | 2001 |   767.19 |
       | 2002 |  1713.23 |
       | 2003 |  5160.45 |
       | 2004 |    75.75 |
       | 2006 |     4723 |
       | 2007 |   1900.1 |
       | 2008 |    18.69 |
       +------+----------+

81) Write a query that selects the first customer in alphabetical order whose name begins with ‘G’.
---------------------------------------------------------------------------------------------------
Query- SELECT CNAME FROM customers WHERE CNAME LIKE 'G%' ORDER BY CNAME;
       +----------+
       | CNAME    |
       +----------+
       | Glovanni |
       | Grass    |
       +----------+

82) Write a query that counts the number of different non NULL city values in the customers table.
83) Find the average amount from the Orders Table.
--------------------------------------------------
Query- SELECT AVG(AMT) FROM orders;
       +----------+
       | AVG(AMT) |
       +----------+
       |  2665.84 |
       +----------+

84) Find all customers who are not located in SanJose and whose rating is above 200.
------------------------------------------------------------------------------------
Query- SELECT CNAME, CITY, RATING FROM customers WHERE NOT CITY = 'SanJose' and RATING > 200;
       +-------+--------+--------+
       | CNAME | CITY   | RATING |
       +-------+--------+--------+
       | Grass | Berlin |    300 |
       +-------+--------+--------+

85) Give a simpler way to write this query.SELECT snum, sname, city, comm FROM salespeople WHERE (comm > + 0.12 OR comm < 0.14);
---------------------------------------------------------------------------------------------------------------------------------
Query- SELECT * FROM salespeople WHERE (COMM > 0.12 or COMM < 0.14);
       +------+---------+-----------+------+
       | SNUM | SNAME   | CITY      | COMM |
       +------+---------+-----------+------+
       | 1001 | Peel    | London    |   12 |
       | 1002 | Serres  | SanJose   |   13 |
       | 1003 | AxelRod | New York  |   10 |
       | 1004 | Motika  | London    |   11 |
       | 1007 | Riffikn | Barcelona |   15 |
       | 1008 | Fran    | London    |   25 |
       +------+---------+-----------+------+

86) Which salespersons attend to customers not in the city they have been assigned to?
87) Which salespeople get commission greater than 0.11 are serving customers rated less than 250?
--------------------------------------------------------------------------------------------------
Query- SELECT s.SNAME, s.COMM, c.CNAME, c.RATING FROM salespeople s, customers c WHERE s.SNUM = c.SNUM and (s.COMM > 0.12 and c.RATING < 250);
       +---------+------+----------+--------+
       | SNAME   | COMM | CNAME    | RATING |
       +---------+------+----------+--------+
       | Peel    |   12 | Hoffman  |    100 |
       | AxelRod |   10 | Glovanni |    200 |
       | Serres  |   13 | Liu      |    200 |
       | Peel    |   12 | Clemens  |    100 |
       | Motika  |   11 | Pereira  |    100 |
       +---------+------+----------+--------+

88) Which salespeople have been assigned to the same city but get different commission percentages?
89) Which salesperson has earned the maximum commission?
--------------------------------------------------------
Query- select SNUM, SNAME, COMM FROM salespeople WHERE COMM = (SELECT MAX(COMM) FROM salespeople);
       +------+-------+------+
       | SNUM | SNAME | COMM |
       +------+-------+------+
       | 1008 | Fran  |   25 |
       +------+-------+------+

90) Does the customer who has placed the maximum number of orders have the maximum rating?
91) List all customers in descending order of customer rating.
---------------------------------------------------------------
Query- SELECT CNAME, CNUM, RATING FROM customers ORDER BY RATING DESC;
       +----------+------+--------+
       | CNAME    | CNUM | RATING |
       +----------+------+--------+
       | Grass    | 2004 |    300 |
       | Cisneros | 2008 |    300 |
       | Glovanni | 2002 |    200 |
       | Liu      | 2003 |    200 |
       | Hoffman  | 2001 |    100 |
       | Clemens  | 2006 |    100 |
       | Pereira  | 2007 |    100 |
       +----------+------+--------+

92) On which days has Hoffman placed orders?
---------------------------------------------
Query- SELECT c.CNAME, o.ONUM, o.ODATE FROM customers c, orders o WHERE c.CNUM = o.CNUM and c.CNAME = 'Hoffman';
       +---------+------+----------+
       | CNAME   | ONUM | ODATE    |
       +---------+------+----------+
       | Hoffman | 3003 | 10/03/90 |
       +---------+------+----------+

93) Which salesmen have no orders between 10/03/1990 and 10/05/1990?
---------------------------------------------------------------------
Query- SELECT s.SNAME, s.SNUM, o.ODATE FROM customers c, salespeople s, orders o WHERE c.SNUM = s.SNUM and c.CNUM = o.CNUM and ODATE NOT BETWEEN
        10/03/1990 and 10/05/1990;
       +---------+------+----------+
       | SNAME   | SNUM | ODATE    |
       +---------+------+----------+
       | Peel    | 1001 | 10/03/90 |
       | Peel    | 1001 | 10/05/90 |
       | Peel    | 1001 | 10/06/90 |
       | Serres  | 1002 | 10/03/90 |
       | Serres  | 1002 | 10/04/90 |
       | Serres  | 1002 | 10/06/90 |
       | AxelRod | 1003 | 10/04/90 |
       | Motika  | 1004 | 10/03/90 |
       | Riffikn | 1007 | 10/03/90 |
       | Riffikn | 1007 | 10/03/90 |
       +---------+------+----------+

94) How many salespersons have succeeded in getting orders?
------------------------------------------------------------
Query- SELECT COUNT(SNUM) FROM salespeople WHERE SNUM IN (SELECT SNUM FROM orders GROUP BY SNUM);
       +-------------+
       | COUNT(SNUM) |
       +-------------+
       |           5 |
       +-------------+

95) How many customers have placed orders?
-------------------------------------------
Query- SELECT COUNT(DISTINCT CNUM) FROM orders;
       +----------------------+
       | COUNT(DISTINCT CNUM) |
       +----------------------+
       |                    7 |
       +----------------------+

96) On which date has each salesman booked an order of maximum value?
97) Who is the most successful salesperson?
98) Which customers have the same rating?
------------------------------------------
Query- SELECT * FROM customers ORDER BY RATING;
       +------+----------+---------+--------+------+
       | CNUM | CNAME    | CITY    | RATING | SNUM |
       +------+----------+---------+--------+------+
       | 2001 | Hoffman  | Londan  |    100 | 1001 |
       | 2006 | Clemens  | Londan  |    100 | 1001 |
       | 2007 | Pereira  | Rome    |    100 | 1004 |
       | 2002 | Glovanni | Rome    |    200 | 1003 |
       | 2003 | Liu      | SanJose |    200 | 1002 |
       | 2004 | Grass    | Berlin  |    300 | 1002 |
       | 2008 | Cisneros | SanJose |    300 | 1007 |
       +------+----------+---------+--------+------+

99) Find all orders greater than the average for October 4th.
-------------------------------------------------------------
Query- SELECT * FROM orders WHERE AMT > (SELECT AVG(AMT) FROM orders WHERE ODATE = '10/04/90');
       +------+---------+------+------+----------+
       | ONUM | AMT     | CNUM | SNUM | ODATE    |
       +------+---------+------+------+----------+
       | 3002 |  1900.1 | 2007 | 1004 | 10/03/90 |
       | 3005 | 5160.45 | 2003 | 1002 | 10/03/90 |
       | 3006 | 1098.16 | 2008 | 1007 | 10/03/90 |
       | 3008 |    4723 | 2006 | 1001 | 10/05/90 |
       | 3009 | 1713.23 | 2002 | 1003 | 10/04/90 |
       | 3010 | 1309.95 | 2004 | 1002 | 10/06/90 |
       | 3011 | 9891.88 | 2006 | 1001 | 10/06/90 |
       +------+---------+------+------+----------+

100) List all customers with ratings above Grass’s average.
-----------------------------------------------------------
Query- SELECT CNAME, RATING FROM customers WHERE RATING >=(SELECT AVG(RATING) FROM customers WHERE CNAME ='Grass');
       +----------+--------+
       | CNAME    | RATING |
       +----------+--------+
       | Grass    |    300 |
       | Cisneros |    300 |
       +----------+--------+

101) Which customers have above average orders?
------------------------------------------------
Query- SELECT * FROM customers NATURAL JOIN orders WHERE AMT > (SELECT AVG(AMT) FROM orders);
       +------+------+---------+---------+--------+------+---------+----------+
       | CNUM | SNUM | CNAME   | CITY    | RATING | ONUM | AMT     | ODATE    |
       +------+------+---------+---------+--------+------+---------+----------+
       | 2003 | 1002 | Liu     | SanJose |    200 | 3005 | 5160.45 | 10/03/90 |
       | 2006 | 1001 | Clemens | Londan  |    100 | 3008 |    4723 | 10/05/90 |
       | 2006 | 1001 | Clemens | Londan  |    100 | 3011 | 9891.88 | 10/06/90 |
       +------+------+---------+---------+--------+------+---------+----------+

102) Select the total amount in orders for each salesperson for which the total is greater than the amount of the largest order in the table.
103) Give names and numbers of all salespersons that have more than one customer?
----------------------------------------------------------------------------------
Query- SELECT SNUM, SNAME FROM salespeople WHERE SNUM IN(SELECT SNUM FROM customers GROUP BY SNUM having COUNT(SNUM) > 1);
       +------+--------+
       | SNUM | SNAME  |
       +------+--------+
       | 1001 | Peel   |
       | 1002 | Serres |
       +------+--------+

104) Select all salespeople by name and number who have customers in their city whom they don’t service.
105) Does the total amount in orders by customer in Rome and London, exceed the commission paid to salesperson in London, and New York by
more than 5 times?
106) Which are the date, order number, amt and city for each salesperson (by name) for the maximum order he has obtained?
--------------------------------------------------------------------------------------------------------------------------
Query- SELECT ONUM, ODATE, AMT, CITY FROM orders , salespeople WHERE AMT = (SELECT MAX(AMT) FROM orders);
       +------+----------+---------+-----------+
       | ONUM | ODATE    | AMT     | CITY      |
       +------+----------+---------+-----------+
       | 3011 | 10/06/90 | 9891.88 | London    |
       | 3011 | 10/06/90 | 9891.88 | SanJose   |
       | 3011 | 10/06/90 | 9891.88 | New York  |
       | 3011 | 10/06/90 | 9891.88 | London    |
       | 3011 | 10/06/90 | 9891.88 | Barcelona |
       | 3011 | 10/06/90 | 9891.88 | London    |
       +------+----------+---------+-----------+

107) Which salesperson is having lowest commission?
----------------------------------------------------
Query- select SNUM, SNAME, COMM FROM salespeople WHERE COMM = (SELECT MIN(COMM) FROM salespeople);
       +------+---------+------+
       | SNUM | SNAME   | COMM |
       +------+---------+------+
       | 1003 | AxelRod |   10 |
       +------+---------+------+
