select *
from employees
order by hire_date desc;


-- 1
select concat(first_name,' ',last_name) as name
from employees
where emp_no = '10944';
-- 2
select concat(first_name,' ',last_name) as 이름,
		gender as 성별 ,hire_date as 입사일 
from employees
order by hire_date;
-- 3
select gender,count(*)
from employees
group by gender;
-- 4
select count(*)
from salaries
where to_date >= cast(now() as date);
-- 5
select count(*)
from departments;
-- 6
select count(*)
from dept_manager
where to_date >= cast(now() as date);
-- 7
select *
from departments
order by char_length(dept_name) desc;
-- 8
select count(*)
from salaries
where salary > '120000' and to_date >= cast(now() as date);
-- 9
select DISTINCT title
from titles
order by char_length(title) desc;
-- 10
select count(*)
from titles
where title = 'Engineer';
-- 11
select *
from titles
where emp_no = '13250'
order by from_date;







