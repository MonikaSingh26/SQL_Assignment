1) List all the columns of the Salespeople table.
--------------------------------------------------
Query- select * from salespeople;
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
Query- select CNAME from Customers where RATING = 100;
       +---------+
       | CNAME   |
       +---------+
       | Hoffman |
       | Clemens |
       | Pereira |
       +---------+


3) Find the largest order taken by each Salesperson on each date.
------------------------------------------------------------------
Query- select SNUM, ODATE, MAX(AMT) from Orders group by ODATE, SNUM;
       +------+----------+----------+
       | SNUM | ODATE    | MAX(AMT) |
       +------+----------+----------+
       | 1001 | 10/03/90 |   767.19 |
       | 1002 | 10/03/90 |  5160.45 |
       | 1004 | 10/03/90 |   1900.1 |
       | 1007 | 10/03/90 |  1098.16 |
       | 1002 | 10/04/90 |    75.75 |
       | 1003 | 10/04/90 |  1713.23 |
       | 1001 | 10/05/90 |     4723 |
       | 1001 | 10/06/90 |  9891.88 |
       | 1002 | 10/06/90 |  1309.95 |
       +------+----------+----------+


4) Arrange the Order table by descending customer number.
----------------------------------------------------------
Query- select * from Orders order by CNUM desc;
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
Query- select SNAME from Salespeople where SNUM IN (select SNUM from Orders);
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
Query- select CNAME from Customers where SNUM IN (select SNUM from Salespeople);
       Result Empty.


7) Find the names and numbers of all salespeople who have more than one customer.
----------------------------------------------------------------------------------
Query-


8) Count the orders of each of the salespeople and output the results in descending order.
-------------------------------------------------------------------------------------------
Query-


9) List the customer table if and only if one or more of the customers in the Customer table are located in SanJose.
---------------------------------------------------------------------------------------------------------------------
Query-
10) Match salespeople to customers according to what city they live in.
------------------------------------------------------------------------
Query-


11) Find all the customers in SanJose who have a rating above 200.
-------------------------------------------------------------------
Query- select * from Customers where RATING > 200 and CITY = 'SanJose';
       +------+----------+---------+--------+------+
       | CNUM | CNAME    | CITY    | RATING | SNUM |
       +------+----------+---------+--------+------+
       | 2008 | Cisneros | SanJose |    300 | 1007 |
       +------+----------+---------+--------+------+


12) List the names and commissions of all salespeople in London.
-----------------------------------------------------------------
Query- select SNAME, COMM from Salespeople where CITY LIKE 'London';
       +--------+------+
       | SNAME  | COMM |
       +--------+------+
       | Peel   |   12 |
       | Motika |   11 |
       | Fran   |   25 |
       +--------+------+


13) List all the orders of Salesperson Motika from the orders table.
---------------------------------------------------------------------
Query- select SNAME, ONUM, AMT from Salespeople, Orders, Customers where salespeople.SNUM = Customers.SNUM AND Customers.CNUM = Orders.CNUM AND
       SNAME LIKE 'Motika';
       +--------+------+--------+
       | SNAME  | ONUM | AMT    |
       +--------+------+--------+
       | Motika | 3002 | 1900.1 |
       +--------+------+--------+


14) Find all customers who booked orders on October 3.
-------------------------------------------------------
Query- select CNAME from Customers, Orders where Customers.CNUM = Orders.CNUM AND ODATE LIKE '10/03/%';
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
-----------------------------------------------------------------------------------------------------------------------------------------------
Query-


16) Select all orders that had amounts that were greater than at least one of the orders from October 6.
--------------------------------------------------------------------------------------------------------
Query-


17) Write a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300.
-------------------------------------------------------------------------------------------------------------------
Query-


18) Find all customers whose cnum is 1000 above the snum of Serres.
-------------------------------------------------------------------
Query-


19) Give the salespeople’s commissions as percentages instead of decimal numbers.
---------------------------------------------------------------------------------
Query-


20) Find the largest order taken by each salesperson on each date, eliminating those Maximum orders, which are less than 3000.
------------------------------------------------------------------------------------------------------------------------------
Query-


21) List all the largest orders for October 3, for each salesperson.
--------------------------------------------------------------------
Query-


22) Find all customers located in cities where Serres has customers.
--------------------------------------------------------------------
Query-


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
Query-


25) Write a query that produces all customers serviced by salespeople with a commission above 12%. Output the customer’s name,
salesperson’s name and the salesperson’s rate of commission.
------------------------------------------------------------------------------------------------------------------------------
Query-


26) Find salespeople who have multiple customers.
--------------------------------------------------
Query-


27) Find salespeople with customers located in their own cities.
-----------------------------------------------------------------
Query-


28) Find all salespeople whose name starts with ‘P’ and fourth character is ‘I’.
--------------------------------------------------------------------------------
Query-


29) Write a query that uses a subquery to obtain all orders for the customer named ‘Cisneros’. Assume you do not know his customer number.
-------------------------------------------------------------------------------------------------------------------------------------------
Query-


30) Find the largest orders for Serres and Rifkin.
--------------------------------------------------
Query-