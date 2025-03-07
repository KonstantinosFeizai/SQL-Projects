-- combine the menu_items and order_details tables into a single table.
select * from menu_items;
select * from order_details;

select *
from order_details od left join menu_items mi
	 on od.item_id = mi.menu_item_id;
     
-- what were the least and most ordered items? What categories were they in ?
select item_name ,category , count(order_details_id)  as num_of_purchases
from order_details od left join menu_items mi
	 on od.item_id = mi.menu_item_id
group by item_name,category;

-- least ordered item
select item_name , category, count(order_details_id) as num_of_purchases
from order_details od left join menu_items mi
	 on od.item_id = mi.menu_item_id
group by item_name , category
order by num_of_purchases asc
limit 1;

-- most ordered item
select item_name ,category , count(order_details_id) as num_of_purchases
from order_details od left join menu_items mi
	 on od.item_id = mi.menu_item_id
group by item_name , category
order by num_of_purchases desc
limit 1;

-- what were the top 5 orders that spend the most money
select order_id , sum(price) as Total_spend
from order_details od left join menu_items mi
	 on od.item_id = mi.menu_item_id
group by order_id
order by total_spend desc
limit 5;

-- view the details of the highest spend order . what insights can you gather from the 
select category , count(item_id) as num_of_items
from order_details od left join menu_items mi
	 on od.item_id = mi.menu_item_id
where order_id=440
group by category;

-- details of the top 5 spend orders
select order_id ,category , count(item_id) as num_of_items
from order_details od left join menu_items mi
	 on od.item_id = mi.menu_item_id
where order_id in ( 440,330,740,443,522)
group by order_id , category;


