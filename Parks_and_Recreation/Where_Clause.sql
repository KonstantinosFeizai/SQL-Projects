-- Where Clause --
Select * from employee_salary
where first_name='Leslie';

Select * from employee_salary
where salary > 50000 ;

select * from employee_salary 
where dept_id > 2;

select * from employee_demographics
where gender !='Female' ;

select * from employee_demographics 
where birth_date > '1985-01-01';

select * from employee_demographics 
where birth_date > '1984-01-01' and  gender='Male' ;

# Like Statement
# % and _
select * from employee_demographics
where first_name like 'a%' ;

select * from employee_demographics
where first_name like 'a___%';
