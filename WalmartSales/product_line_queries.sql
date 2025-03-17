-- View the full sales table 
select * from sales;

--  --------------- Product questions ---------------

-- 1. how many unique product lines does the data have ?
select count(distinct product_line) from sales;
select distinct product_line from sales;

-- 2. what is the most common payment method?
select payment_method , count(*) as payment_count from sales
group by payment_method 
order by payment_count  desc ;

-- 3. what is the most selling product line?
select product_line , count(product_line) as product_sales from sales
group by product_line
order by product_sales desc ;

-- 4. what is the total revenue by month?
select month_name as month , sum(total) as total_revenue_by_month  from sales
group by month_name
order by total_revenue_by_month desc;

-- 5. what month had the largest COGS;
select month_name as month , sum(cogs) as total_cogs_by_month from sales
group by month_name
order by total_cogs_by_month desc;

-- 6. what product line had the largest revenue?
select product_line , sum(total) as product_revenue from sales
group by product_line
order by product_revenue desc;

-- 7. What is the city with the largest revenue?
select branch ,city , sum(total) as city_revenue from sales
group by city , branch
order by city_revenue desc;

-- 8. What product line had the largest VAT?
select product_line , sum(VAT) as VAT_revenue from sales
group by product_line
order by VAT_revenue desc;

-- 9. Which branch sold more products than average product sold?
Select branch , sum(quantity) as quantity_avg from sales
group by branch
having sum(quantity) > ( select avg(quantity) from sales);

-- 10. What is the most common product line by gender?
select gender,product_line , count(gender) as gender_count from sales
group by  product_line , gender
order by gender_count desc;

-- 11. What is the average rating of each product line?
select round(avg(rating),2) as avg_rating , product_line from sales
group by product_line
order by avg_rating desc;
