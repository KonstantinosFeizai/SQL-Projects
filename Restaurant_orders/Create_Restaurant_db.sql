drop schema if exists restaurant_db;
create schema restaurant_db;
use restaurant_db;
-- 
-- Table structure for table 'Order  Details'
--
-- Create the order_details table
create table order_details (
order_details_id smallint not null ,
order_id smallint not null ,
order_date date,
order_time time,
item_id smallint,
primary key ( order_details_id)
);

insert into order_details ( order_details_id , order_id , order_date , order_time , item_id )
values	( 2127 , 948 , '2024-02-17' , '19:05:30' , 123 );

-- Create the menu_items table 
create table menu_items ( 
menu_item_id smallint not null ,
item_name varchar(45) ,
category varchar(45),
price decimal(10,2),
primary key (menu_item_id)
);

--  Data Import Step
-- The data for the tables was imported using MySQL Workbench's Import Wizard.
-- Open MySQL Workbench and connect to your database.
-- Select the CSV file
-- Map the CSV columns to table columns and import 





