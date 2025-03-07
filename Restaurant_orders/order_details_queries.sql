-- view the order_details table
select * 
from order_details;

-- what is the date range of the table

(select * 
from order_details
order by order_date asc
limit 1 )

union

(select * 
from order_details
order by order_date desc
limit 1 );

-- how many orders were made within this date range
select count(distinct order_id) 
from order_details;

-- how many items were ordered within this date range;
SELECT COUNT(item_id) AS total_items_ordered
FROM order_details
WHERE order_date BETWEEN 
    (SELECT MIN(order_date) FROM order_details) 
    AND 
    (SELECT MAX(order_date) FROM order_details);
    
-- which orders has the most number of items;
 select order_id , count(item_id) as number_of_items
 from order_details
 group by order_id;
 
-- number of orders with the most items
  select order_id , count(item_id) as number_of_items
 from order_details
 group by order_id
 order by number_of_items desc
 limit 1;
 
 -- how many orders had more than 12 items
 select count(*) from
 (select order_id , count(item_id) as number_of_items
 from order_details
 group by order_id
 having  number_of_items > 12 ) as num_orders;
 
