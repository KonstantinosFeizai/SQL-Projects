# Exploratory Data Analysis (EDA)
# Business Questions to answer

-- viewing the sales table
select * from sales;

-- 1. how many unique cities does the data have?

select count(distinct city ) as unique_cities from sales;

SELECT DISTINCT city FROM sales;

SELECT 
    COUNT(DISTINCT city) AS unique_cities, 
    GROUP_CONCAT(DISTINCT city ORDER BY city SEPARATOR ', ') AS city_list 
FROM sales;

-- 2. in which city is each branch

SELECT branch , city from sales
group by branch ,city ;

