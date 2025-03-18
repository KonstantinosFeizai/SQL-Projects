-- --------------- Sales questions ---------------
-- ---------------     Queries     ---------------

-- active database 
use sales_data_walmart;

-- viewing the sales table
select * from sales; 

-- 1. Number of sales made in each time of the day per weekday
SELECT 
    day_name as weekday,
    time_of_day,
    COUNT(*) AS total_sales
FROM sales
GROUP BY weekday, time_of_day
ORDER BY FIELD(weekday, 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'),
         FIELD(time_of_day, 'Morning', 'Afternoon', 'Evening');
		
-- 2. Which of the customer types brings the most revenue?
select customer_type , sum(total) as customer_revenue 
from sales_data_walmart.sales
group by customer_type
order by customer_revenue desc;

-- 3. Which city has the largest tax percent/VAT (Value added tax)?
select city , avg(vat) as city_vat 
from sales 
group by city
order by city_vat desc ;

-- 4. Which customer type pays the most in VAT?
select customer_type , avg(VAT) as customer_VAT 
from sales
group by customer_type
order by customer_VAT desc;
