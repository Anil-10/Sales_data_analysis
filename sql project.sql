-- sql retail sales analysis
create database sql_project_p1; 
use sql_project_p1;
-- create table

create table retails_sales(
transactions_id int primary key	,
sale_date	date ,
sale_time	time,
customer_id	int ,
gender	varchar(10),
age	int,
category	varchar(20),
quantiy	int,
price_per_unit float, 
	cogs int,
    total_sale int
)

-- Data Cleaning
SELECT * FROM retails_sales 
WHERE total_sale IS NULL OR sale_date IS NULL OR sale_time IS NULL 
OR customer_id IS NULL OR gender IS NULL OR age IS NULL 
OR category IS NULL OR quantiy IS NULL OR price_per_unit IS NULL 
OR cogs IS NULL OR total_sale IS NULL;


delete from retails_sales 
WHERE total_sale IS NULL OR sale_date IS NULL OR sale_time IS NULL 
OR customer_id IS NULL OR gender IS NULL OR age IS NULL 
OR category IS NULL OR quantiy IS NULL OR price_per_unit IS NULL 
OR cogs IS NULL OR total_sale IS NULL; 


SET SQL_SAFE_UPDATES = 0;
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Data Exploration
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- How many sales we have 
select count(*) as total_sales from retails_sales;
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- How Many unique customers we have 
select count(distinct(customer_id)) as customer_count from retails_sales ;
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- How Many unique Category we have 
select count(distinct(category)) as category_count from retails_sales ;
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- write a sql query to retrive all column for sales made on  '2021-11-05'
select * from retails_sales  
	where sale_date > '2021-11-05' ;
    
-- -----------------------------------------------------------------------------------------------------------------------------------------

-- write a query to retrive all transaction where the category is clothing and the quantity sold is  greater then 3 in the month of nov-2022
SELECT * 
FROM retails_sales
WHERE category = 'Clothing'
AND quantiy > 3
AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11';
;

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- write a query to calculate the total sales for each category
select category,sum(total_sale)  as total_sales from retails_sales group by category 
;
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- write a  sql query to find the average age of customer who purchased item for beauty category
select round(avg(age) , 2 ) as average_age from retails_sales where 
category = 'Beauty'
;

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- write a query to find all transaction where the total_sale is greater then 1000
select *  from retails_sales where total_sale > 1000
;

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- write a sql query to find the total number of transaction (transaction_id) made by each gender in each category
select gender,category, count(transactions_id) from retails_sales group by gender ,category
order by 1
;
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- write a sql query to calculate the average sale for each month find out best selling month in each year 
select * from (select year(Sale_date),month(sale_date),avg(total_sale)as avg , rank() over(partition by Year(sale_date) order by avg(total_sale) desc) as rn from retails_sales group by year(Sale_date),month(sale_date)) as rak where rn =1
;
-- -----------------------------------------------------------------------------------------------------------------------------------------

--  write a sql query to find the top 5 customer based on the highest total_sales

select customer_id ,sum(total_sale) from retails_sales group by customer_id ORDER BY SUM(total_sale)  desc limit 5 ;
-- -----------------------------------------------------------------------------------------------------------------------------------------

-- write a sql query to find the number of unique customer who purcahsed item from each category

SELECT category, COUNT(DISTINCT customer_id) AS unique_customers
FROM retails_sales
GROUP BY category;

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- write a query to create each shift and number of order 

SELECT transactions_id,
case 
when extract(HOUR FROM sale_time ) < 12 then 'Morning'
when extract(hour from sale_time) <17 then 'Afternoon'
when extract(hour from sale_time) <21 then 'Evening'
	end as shift 
FROM retails_sales;

 