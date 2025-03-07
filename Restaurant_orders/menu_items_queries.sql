
-- view the menu items table
select * from restaurant_db.menu_items;

-- find the number of items on the menu
select count(item_name) from restaurant_db.menu_items;

-- what are the least and most expensive items on the menu

-- searching for most expensive item
(select *   from menu_items
order by price desc
limit 1 )

union 

-- searching for cheapest item
(select * from menu_items
where price = ( select min(price) from menu_items));

-- how many Italians dishes are on the menu
select count(*) as Italian_Dishes_Count from menu_items
where category='Italian';

-- what are the least and most expensive Italian dishes on the menu
(select item_name,price  from menu_items
where category='Italian'
order by price  desc 
limit 1)

union

(select item_name , price  from menu_items
where category='Italian'
order by price asc
limit 1);

-- how many dishes are in each category
select * from menu_items;

select category,count(*) as Dishes_per_Category
from menu_items
group by category;

-- what is the average dish price within each category
select category , avg(price) as Average_price
from menu_items
group by category;