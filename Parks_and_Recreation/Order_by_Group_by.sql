-- Group By --
Select * from employee_demographics;

select gender 
from employee_demographics
group by gender;

select gender , avg(age) , max(age) , min(age) , count(age)
from employee_demographics
group by gender;

select occupation , salary
 from employee_salary
group by occupation , salary ;

-- Order by --

# the place in the order by is important   e.g  order by gender , age   !=  order by age , gender 

select * from employee_demographics
order by first_name DESC;

select * from employee_demographics
order by gender , age desc;  

select * from employee_demographics
order by 5,4    # same as line 21 
