-- 1
select max(salary)-min(salary) as '최고임금 - 최저임금'
from salaries;
-- 2
select date_format(max(hire_date),'%Y년 %m월 %d일')
from employees;
-- 3
select date_format(min(hire_date),'%Y년 %m월 %d일')
from employees;
-- 4 
select avg(salary)
from salaries;
-- 5
select max(salary), min(salary)
from salaries;
-- 6
select date_format(now(),'%Y')-date_format(max(birth_date),'%Y')+1 as '어린사원', 
date_format(now(),'%Y')-date_format(min(birth_date),'%Y')+1 as '최 연장자'
from employees;