-- Step 1: Create and select database
CREATE DATABASE IF NOT EXISTS sales;
USE sales;

-- Step 2: Create required tables
CREATE TABLE IF NOT EXISTS payments (
    checkNumber VARCHAR(50) PRIMARY KEY,
    paymentDate DATE,
    amount DECIMAL(10, 2)
);

CREATE TABLE IF NOT EXISTS customers (
    customerNumber INT PRIMARY KEY,
    customerName VARCHAR(100),
    country VARCHAR(50),
    creditLimit DECIMAL(10, 2)
);

CREATE TABLE IF NOT EXISTS orderdetails (
    orderNumber INT,
    productCode VARCHAR(50),
    quantityOrdered INT,
    priceEach DECIMAL(10, 2),
    PRIMARY KEY (orderNumber, productCode)
);

-- Question 1
SELECT paymentDate, SUM(amount) AS totalAmount
FROM payments
GROUP BY paymentDate
ORDER BY paymentDate DESC
LIMIT 5;

-- Question 2
SELECT customerName, country, AVG(creditLimit) AS averageCreditLimit
FROM customers
GROUP BY customerName, country;

-- Question 3
SELECT productCode, quantityOrdered, SUM(quantityOrdered * priceEach) AS totalPrice
FROM orderdetails
GROUP BY productCode, quantityOrdered;

-- Question 4
SELECT checkNumber, MAX(amount) AS highestAmount
FROM payments
GROUP BY checkNumber;