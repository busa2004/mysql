-- 1
select count(*)
from salaries
where to_date > now() and 
salary > (select avg(salary)
from salaries
where to_date > now());
-- 2
select d.emp_no, concat(d.first_name, ' ' , d.last_name),a.dept_name,max(b.salary)
from departments a, salaries b, dept_emp c, employees d
where a.dept_no = c.dept_no 
	and b.emp_no = c.emp_no
    and b.to_date > now()
    and b.emp_no = d.emp_no
group by dept_name
order by max(b.salary) desc;
-- 3
select a.dept_name, c.salary,t.salary_avg
from departments a, dept_emp b, salaries c,
(select a.dept_name as name , avg(c.salary) as salary_avg
from departments a, dept_emp b, salaries c
where a.dept_no = b.dept_no
	and b.emp_no = c.emp_no
group by a.dept_name) t
where a.dept_no = b.dept_no
	and b.emp_no = c.emp_no
	and a.dept_name = t.name
    and c.salary>t.salary_avg;
-- 4
select a.emp_no,concat(a.first_name,' ',a.last_name), c.dept_name, t.name
from employees a, dept_emp b, departments c, (select a.emp_no,concat(a.first_name,' ',a.last_name) as name, c.dept_name as dept
from employees a, dept_manager b, departments c
where a.emp_no = b.emp_no 
and b.dept_no = c.dept_no
and b.to_date = '9999-01-01') t
where a.emp_no = b.emp_no 
and t.dept = c.dept_name
and b.dept_no = c.dept_no
and b.to_date = '9999-01-01';
-- 5
select a.emp_no,b.title,concat(a.first_name,' ',a.last_name),c.salary, d.dept_name
from employees a, titles b, salaries c, departments d, dept_emp e
where a.emp_no = b.emp_no and a.emp_no = c.emp_no and a.emp_no = e.emp_no and
d.dept_no = e.dept_no
and b.to_date = '9999-01-01'
and c.to_date = '9999-01-01'
and e.to_date = '9999-01-01'
and dept_name =(select dept_name
from departments a, dept_emp b, salaries c
where a.dept_no = b.dept_no and b.emp_no = c.emp_no
and b.to_date = '9999-01-01'
and b.to_date = '9999-01-01'
group by dept_name
order by round(avg(salary)) desc
limit 1)
order by salary desc;

-- 6
select a.dept_name, avg(c.salary)
from departments a, dept_emp b, salaries c
where a.dept_no = b.dept_no and b.emp_no = c.emp_no
group by a.dept_name
order by avg(c.salary) desc
limit 1;

-- 7
select a.title, avg(c.salary)
from titles a, salaries c
where a.emp_no = c.emp_no
group by a.title
order by avg(c.salary) desc
limit 1;


-- 8
select c.dept_name,concat(a.first_name,' ',a.last_name),d.salary, t.name, t.salary
from employees a, dept_emp b, departments c, salaries d,
(select a.emp_no,concat(a.first_name,' ',a.last_name) as name, c.dept_name as dept, d.salary as salary
from employees a, dept_manager b, departments c, salaries d
where a.emp_no = b.emp_no 
and d.emp_no = a.emp_no
and b.dept_no = c.dept_no
and b.to_date = '9999-01-01'
and d.to_date = '9999-01-01'
) t
where a.emp_no = b.emp_no 
and a.emp_no = d.emp_no
and d.salary>t.salary
and t.dept = c.dept_name
and b.dept_no = c.dept_no
and b.to_date = '9999-01-01'
and d.to_date = '9999-01-01';

-- *5


select b.title, count(*),avg(c.salary)
from  titles b,salaries c
where  b.emp_no=c.emp_no 
and b.to_date='9999-01-01'
and c.to_date='9999-01-01'
group by b.title
having count(*) > '100';

-- *6

select a.dept_name, avg(d.salary)
from departments a, dept_emp b, titles c,salaries d
where b.emp_no = c.emp_no and a.dept_no = b.dept_no and d.emp_no = c.emp_no
and c.title='Engineer' 
and b.to_date='9999-01-01'
and c.to_date='9999-01-01'
and d.to_date='9999-01-01'
group by a.dept_name;

-- *7

select c.title, sum(d.salary)
from departments a, dept_emp b, titles c,salaries d
where b.emp_no = c.emp_no and a.dept_no = b.dept_no and d.emp_no = c.emp_no
and c.title not in('Engineer')
and b.to_date='9999-01-01'
and c.to_date='9999-01-01'
and d.to_date='9999-01-01'
group by c.title
having sum(d.salary)>'2000000000'
order by sum(d.salary) desc;








	