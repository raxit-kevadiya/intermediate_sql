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


-- String Functions -- 


select length('skyfall');

select first_name, length(first_name)
from employee_demographics
order by 2
;

select upper('skyfall');
select lower('skyFall');

select first_name, upper(first_name)
from employee_demographics;


select ('            sky        ');
select trim('            sky        ');
select ltrim('            sky        ');
select rtrim('            sky        ');


select first_name, 
left(first_name, 4),
right(first_name, 4),
substring(first_name, 3, 2),
birth_date,
substring(birth_date, 6, 2) as birth_month
from employee_demographics
;


select first_name, replace(first_name, 'a', 'z')
from employee_demographics
;


select locate('x', 'Raxit');

select first_name, locate('an', first_name)
from employee_demographics
;

select first_name, last_name,
concat(first_name,'  ',last_name) as full_name
from employee_demographics
;


-- Case Statements --

select first_name, last_name,age,
case
	when age <=30 then 'Young'
    when age between 31 and 50 then 'Old'
    when age >=50 then 'On Death''s Door'
end
as Age_bracket

from employee_demographics






