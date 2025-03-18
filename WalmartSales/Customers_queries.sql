--  --------------- Customer questions  ---------------  
-- ---------------     Queries     ---------------

-- active database 
use sales_data_walmart;

-- viewing the sales table
select * from sales; 

-- 1. How many unique customer types does the data have?
select count(distinct customer_type) from sales;
select distinct(customer_type) from sales;

-- 2. How many unique payment methods does the data have?
select distinct(payment_method) from sales;
select count(distinct payment_method ) from sales;

-- 3. What is the most common customer type?
select customer_type , count(*) as most_common from sales
group by customer_type
order by most_common desc;

-- 4. Which customer type buys the most?
select customer_type , sum(total) as total_buys 
from sales
group by customer_type
order by total_buys;

-- 5. What is the gender of most of the customers?
select gender , count(*) as customer_gender
from sales
group by gender
order by customer_gender desc;

-- 6. What is the gender distribution per branch?
select branch , gender , count(*) as branch_dis
from sales
group by branch,gender
order by branch,branch_dis desc;

-- 7. Which time of the day do customers give most ratings?
select time_of_day , count(rating) as time_rating
from sales
group by time_of_day
order by time_rating desc;

-- 8. Which time of the day do customers give the most ratings per branch?
select time_of_day , branch , count(rating) as branch_rating
from sales
group by branch, time_of_day
order by branch,branch_rating desc;

-- 9. Which day of the week has the best average ratings?
select day_name as day_of_week , avg(rating) as daily_ratings
from sales
group by day_of_week
order by daily_ratings desc;

-- 10. Which day of the week has the best average ratings per branch?
select branch ,day_name as day_of_week , avg(rating) as daily_ratings
from sales
group by branch, day_of_week  
order by branch,daily_ratings desc;

WITH RankedRatings AS (
    SELECT branch, day_name, AVG(rating) AS avg_rating,
           RANK() OVER (PARTITION BY branch ORDER BY AVG(rating) DESC) AS rnk
    FROM sales
    GROUP BY branch, day_name
)
SELECT branch, day_name, avg_rating
FROM RankedRatings
WHERE rnk = 1;




