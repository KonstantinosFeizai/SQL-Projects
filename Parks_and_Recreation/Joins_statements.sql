use parks_and_recreation;

-- joins 
select *
from employee_demographics;

select *
from employee_salary;

select *
from employee_demographics as dem
inner join employee_salary as sal
		ON dem.employee_id= sal.employee_id
;

select dem.employee_id , age , occupation
from employee_demographics as dem
inner join employee_salary as sal
		ON dem.employee_id= sal.employee_id
;

-- outer joins
select *
from employee_demographics as dem
right outer  join employee_salary as sal
		ON dem.employee_id= sal.employee_id
;

select *
from employee_demographics as dem
left outer  join employee_salary as sal
		ON dem.employee_id= sal.employee_id
;


-- self join
select *
from employee_salary as sal1
join employee_salary as sal2
	on sal1.employee_id+2=sal2.employee_id
;

select sal1.employee_id as emp_sanda,
sal1.first_name as first_name_sanda ,
sal1.last_name as last_name_sanda ,
sal2.employee_id as emp_name ,
sal2.first_name as first_name_sanda ,
sal2.last_name as last_name_sanda 
from employee_salary as sal1
join employee_salary as sal2
	on sal1.employee_id+2=sal2.employee_id
;

-- joining multiple tables together
select *
from employee_demographics as dem
inner join employee_salary as sal
		ON dem.employee_id= sal.employee_id
inner join parks_departments pd
	on sal.dept_id = pd.department_id
;

select *
from parks_departments;