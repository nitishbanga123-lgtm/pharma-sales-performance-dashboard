create database pharma_sales_db;
use pharma_sales_db;
CREATE TABLE pharma_sales (
    Sale_ID INT PRIMARY KEY,
    Date DATE,
    Region VARCHAR(50),
    Sales_Rep VARCHAR(50),
    Product VARCHAR(50),
    Product_Category VARCHAR(50),
    HCP_Name VARCHAR(50),
    Units_Sold INT,
    Unit_Price INT,
    Revenue INT,
    Visit_Type VARCHAR(20),
    Target_Achieved VARCHAR(10)
);
SELECT * FROM pharma_sales_1;

-- TOTAL ROWS CALCULATIONS--
SELECT COUNT(*) AS total_rows
FROM pharma_sales_1;

-- TOTAL REVENUE QUERY-- 

SELECT SUM(REVENUE) AS total_revenue
FROM  pharma_sales_1;

-- UNITS SOLD QUERY--
SELECT SUM(UNITS_SOLD) AS totals_units
FROM  pharma_sales_1;

-- TOP PRODUCT PERFORMANCE--

SELECT product, SUM(REVENUE) AS total_sales, COUNT(units_sold) AS unit_solds
FROM pharma_sales_1
GROUP BY product
ORDER BY total_sales DESC;

-- REGION WISE PERFORMANCE--
SELECT region, SUM(revenue) AS regional_sales, COUNT(units_sold) AS unit_solds
FROM pharma_sales_1
GROUP BY region
ORDER BY regional_sales DESC;

-- 	SALES REP LEADERBOARD--
SELECT sales_rep, SUM(revenue) As rep_sales
FROM pharma_sales_1
GROUP BY sales_rep
ORDER BY rep_sales DESC;
 
 -- TARGET ACHIEVED OR NOT--
SELECT target_achieved, COUNT(*) AS COUNT
FROM pharma_sales_1
GROUP BY target_achieved;

-- PRODUCT CATEGORY PERFORMANCE--
SELECT product_category, SUM(REVENUE) AS category_sales
FROM pharma_sales_1
GROUP BY product_category
ORDER BY category_sales DESC;

-- MONTHLY SALES TREND--

SELECT MONTH(Date) AS sales_month,
       SUM(Revenue) AS monthly_revenue
FROM pharma_sales_1
GROUP BY MONTH(Date)
ORDER BY sales_month;
