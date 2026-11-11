-- Week 6 Assignment: SQL Joins and Relationships
-- File: answer.sql
-- Database: classicmodels (MySQL Classic Models sample database)


USE classicmodels;




-- QUESTION 1: INNER JOIN - Employees and Offices

-- Retrieves firstName, lastName, email and officeCode for all employees.
-- INNER JOIN returns only rows that have a matching officeCode in BOTH
-- the employees and offices tables.
-- officeCode exists in both tables, so it is qualified with the table
-- alias (e.officeCode) to avoid an "ambiguous column" error.

SELECT
    e.firstName,
    e.lastName,
    e.email,
    e.officeCode
FROM employees AS e
INNER JOIN offices AS o
    ON e.officeCode = o.officeCode;




-- QUESTION 2: LEFT JOIN - Products and Product Lines

-- Retrieves productName, productVendor and productLine.
-- LEFT JOIN returns ALL rows from products (the left table), plus the
-- matching rows from productlines. If a product had no matching product
-- line, it would still appear, with NULLs for the productlines columns.
-- productLine exists in both tables, so it is qualified as p.productLine.

SELECT
    p.productName,
    p.productVendor,
    p.productLine
FROM products AS p
LEFT JOIN productlines AS pl
    ON p.productLine = pl.productLine;



-- QUESTION 3: RIGHT JOIN - Customers and Orders

-- Retrieves orderDate, shippedDate, status and customerNumber for the
-- first 10 orders.
-- RIGHT JOIN returns ALL rows from orders (the right table), plus the
-- matching rows from customers.
-- customerNumber exists in both tables, so it is qualified as
-- o.customerNumber.
-- ORDER BY orderNumber makes "first 10" well defined (lowest order
-- numbers first), and LIMIT 10 restricts the result to 10 rows.

SELECT
    o.orderDate,
    o.shippedDate,
    o.status,
    o.customerNumber
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customerNumber = o.customerNumber
ORDER BY o.orderNumber
LIMIT 10;
