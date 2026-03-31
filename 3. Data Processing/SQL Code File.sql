-------------------------------------------------
--Bright Coffee Shop Analysis
-------------------------------------------------
-- I want to view all the columns in the table.
SELECT *
FROM `bright_learn`.`default`.`bright_coffee_shop`
LIMIT 10;

------------------------------------------------
-- 1. Checking the Date Range
-------------------------------------------------
---When was the start of data collection?
SELECT MIN(transaction_date) AS min_date 
FROM `bright_learn`.`default`.`bright_coffee_shop`;
-- Data was collected from this date 2023-01-01

---When was the last data collected?
SELECT MAX(transaction_date) AS latest_date 
FROM `bright_learn`.`default`.`bright_coffee_shop`;

---They last collected the data 2023-06-30
---The duration of the data is 6 months
-------------------------------------------------
-- 2. How many stores are there?
SELECT COUNT(DISTINCT store_id) AS number_of_stores
FROM `bright_learn`.`default`.`bright_coffee_shop`;
---There are 3 stores

---What are the names of the 3 stores?
SELECT DISTINCT store_location
FROM `bright_learn`.`default`.`bright_coffee_shop`;
---The names of the stores are Lower Manhattan, Hell's Kitchen, Astoria
-------------------------------------------------
-- 3. Checking products sold at our stores 
------------------------------------------------
SELECT DISTINCT product_category
FROM `bright_learn`.`default`.`bright_coffee_shop`;
---There are 9 product categories and the names are Coffee, Tea, Drinking Chocolate,
---Bakery, Flavours, Loose Tea, Coffee Beans, Packaged Chocolate and Branded.

SELECT DISTINCT product_detail
FROM `bright_learn`.`default`.`bright_coffee_shop`;
---There are 80 different product descriptions

SELECT DISTINCT product_type
FROM `bright_learn`.`default`.`bright_coffee_shop`;
---There are 29 different types of products

SELECT DISTINCT product_category AS category,
                product_detail AS product_name
FROM `bright_learn`.`default`.`bright_coffee_shop`;
---Each product is shown in its category
-------------------------------------------------
-- 1. Checking product prices
------------------------------------------------
SELECT MIN(unit_price) As cheapest_price
FROM `bright_learn`.`default`.`bright_coffee_shop`;
---The lowest product price is 80 cents

SELECT MAX(unit_price) As expensive_price
FROM `bright_learn`.`default`.`bright_coffee_shop`;
---The highest product price is R45.

------------------------------------------------
SELECT 
COUNT(*) AS number_of_rows,
      COUNT(DISTINCT transaction_id) AS number_of_sales,
      COUNT(DISTINCT product_id) AS number_of_products,
      COUNT(DISTINCT store_id) AS number_of_stores
FROM `bright_learn`.`default`.`bright_coffee_shop`;
---The total number of sales made, and total number of products sold from the 3 stores.
------------------------------------------------
SELECT *
FROM `bright_learn`.`default`.`bright_coffee_shop`
LIMIT 10;
---The first 10 rows are displayed see all the columns again

SELECT transaction_id,
      transaction_date AS Purchase_date,
      Dayname(transaction_date) AS Day_name,
      Monthname(transaction_date) AS Month_name,
      transaction_qty*unit_price AS revenue_per_tnx
FROM `bright_learn`.`default`.`bright_coffee_shop`;
---The date,day and month is shown for each transaction as well as the amount from the transaction's sale
-----------------------------------------------------
SELECT COUNT(*) AS Number_of_Sales
FROM `bright_learn`.`default`.`bright_coffee_shop`;
---The number of sales made

SELECT 
      transaction_date AS Purchase_date,
      Dayname(transaction_date) AS Day_name,
      Monthname(transaction_date) AS Month_name,

      CASE
          WHEN Dayname(transaction_date) IN ('Sun', 'Sat') THEN 'Weekend'
          ELSE 'Weekday'
      END AS day_classification,
---date_format(transaction_time, 'HH:mm:ss') AS purchase_time,

      CASE
          WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '00:00:00' AND '11:59:59' THEN '01. Morning'
          WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '16:59:59' THEN '02. Afternoon'
          WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '17:00:00' AND '23:59:59' THEN '03. Evening'
      END AS time_buckets,
--- Counting number of IDs
      COUNT(DISTINCT transaction_id) AS Number_of_sales,
      COUNT(DISTINCT product_id) AS Number_of_products,
      COUNT(DISTINCT store_id) AS Number_of_stores,

---Total revenue per day
      SUM(transaction_qty*unit_price) AS revenue_per_day,

      CASE 
          WHEN revenue_per_day < 100 THEN '01. Low Spend'
          WHEN revenue_per_day BETWEEN 51 AND 100 THEN '02. Med Spend'
          ELSE '03. High Spend'
      END AS spend_bucket,

---Number of sales made per day and the total revenue made from the sales

---Categorical Columns
        store_location,
        product_category,
        product_detail
FROM `bright_learn`.`default`.`bright_coffee_shop`
GROUP BY transaction_date,
         Day_name,
         Month_name,
         store_location,
         product_category,
         product_detail,
         time_buckets,
         day_classification;
---Columns have been created to help with analysing when highest and lowest sales are made.
