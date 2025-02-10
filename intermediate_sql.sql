-- Joins

select *
from employee_demographics;

select *
from employee_salary;

-- Inner joins -- 
select dem.employee_id, age, occupation
from employee_demographics as dem
inner join employee_salary as sal
on dem.employee_id = sal.employee_id
;

-- Outer joins -- 
select *
from employee_demographics as dem
right join employee_salary as sal
on dem.employee_id = sal.employee_id
;

-- self joins -- 
select 
emp1.employee_id as emp_santa,
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,

emp2.employee_id as emp_id,
emp2.first_name as first_name,
emp2.last_name as last_name

from employee_salary emp1
join employee_salary emp2
on emp1.employee_id + 1 = emp2.employee_id
;

-- joining multiple tables together -- 

select *
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id
inner join parks_departments pd
	on sal.dept_id = pd.department_id
;

select * 
from parks_departments;


-- Unions--

-- default union distinct --

select first_name, last_name
from employee_demographics
union distinct
select first_name, last_name
from employee_salary
;

select first_name, last_name
from employee_demographics
union all
select first_name, last_name
from employee_salary
;



select first_name, last_name, 'Old Man' AS Label
from employee_demographics
where age > 40 And gender = 'Male'
union
select first_name, last_name, 'Old Laddy' AS Label
from employee_demographics
where age > 40 And gender = 'Female'
union
select first_name, last_name, 'Highly Paid Emp' AS Label
from employee_salary
where salary > 70000
order by first_name, last_name
;

















