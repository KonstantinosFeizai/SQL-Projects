select * from sales_data_walmart.sales;
#1 product analysis
# understand the different product lines , the product lines performing best and the product lines that need to be improved

#Feature engineering
#1. Add new column named time_of_day to give insight of sales in the Morning,Afternoon and Evening.

 #adding the new columnd to the sales table
 alter table sales add column time_of_day varchar(20);
 
update sales
set time_of_day =
    (case 
		WHEN TIME(time) BETWEEN '05:00:00' AND '11:59:59' THEN 'Morning'  
        WHEN TIME(time) BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'  
        else "Evening"
    end);
 

 
 #viewing the updated table
SELECT * FROM sales;
SELECT time, time_of_day FROM sales LIMIT 20;


#deleting the time_of_day table 
ALTER TABLE sales DROP COLUMN time_of_day; 
select * from sales_data_walmart.sales;


# Add new column names day_name that contains the extracted days of the week on which the given transaction took place.
alter table sales add column day_name varchar(20);

#Populate the Column with the Day Name with function 'dayname'
update sales
set day_name= dayname(date);

#Verify the Update
SELECT date, day_name FROM sales;


# Add a new columnd named month_name that contains the extracted months of the year

alter table sales add column month_name varchar(20);

update sales
set month_name = monthname(date);

#Verify the Update
SELECT date, month_name FROM sales;


#Viewing the sales table
select * from sales_data_walmart.sales;

