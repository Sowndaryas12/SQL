# SQL
### 1.**Basics of MySQL**

SQL Syntax: Basic structure of SQL queries (SELECT, INSERT, UPDATE, DELETE)

Data Types: INT, VARCHAR, DATE, FLOAT, BOOLEAN, etc.

Constraints: PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE, CHECK, DEFAULT

### 2. **Creating Tables in MySQL** 
To create a table, use the CREATE TABLE statement.

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    signup_date DATE
);
### 3. **Netflix Data Analysis Using MySQL**

Objective: Extract insights from Netflix data, such as popular genres, user preferences, and content trends.

Key SQL Operations:

Filtering by Genre:
SELECT genre, COUNT(*) AS count 
FROM netflix_data 
GROUP BY genre 
ORDER BY count DESC;

Top-Rated Movies:
SELECT title, rating 
FROM netflix_data 
WHERE type = 'Movie' 
ORDER BY rating DESC 
LIMIT 10;

User Engagement Analysis:
SELECT user_id, COUNT(*) AS watch_count 
FROM user_watch_history 
GROUP BY user_id 
ORDER BY watch_count DESC;

### 4. **GPT Data Handling Using MySQL**

Storing GPT Model Responses:

CREATE TABLE gpt_responses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    prompt TEXT,
    response TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

Retrieving GPT Data:
SELECT * FROM gpt_responses ORDER BY timestamp DESC LIMIT 5;

### 5. **Euromart Sales Data Analysis Using MySQL**
   
Objective: Perform sales trend analysis, profitability insights, and customer segmentation.

Key SQL Queries:

Total Sales Calculation:
SELECT SUM(sales) AS total_revenue 
FROM euromart_sales;

Best-Selling Products:
SELECT product_name, SUM(sales) AS total_sales 
FROM euromart_sales 
GROUP BY product_name 
ORDER BY total_sales DESC 
LIMIT 10;

Customer Purchase Behavior:
SELECT customer_id, COUNT(order_id) AS total_orders 
FROM euromart_sales 
GROUP BY customer_id 
ORDER BY total_orders DESC;
