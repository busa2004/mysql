-- 1
select employees.emp_no, concat(employees.first_name,' ',employees.last_name) as name ,salaries.salary
from salaries, employees
where salaries.emp_no = employees.emp_no and  to_date >= now() 
order by salaries.salary desc;
-- 2
select employees.emp_no, concat(employees.first_name,' ',employees.last_name) as name, titles.title
from employees, titles
where employees.emp_no = titles.emp_no and titles.to_date >= hire_date;
-- 3
select employees.emp_no, concat(employees.first_name,' ',employees.last_name) as name, departments.dept_name
from employees, dept_emp, departments
where employees.emp_no = dept_emp.emp_no and dept_emp.dept_no = departments.dept_no ;
-- 4
select employees.emp_no, concat(employees.first_name,' ',employees.last_name) as name, salaries.salary, titles.title,departments.dept_name
from employees, dept_emp, departments,titles,salaries
where employees.emp_no = dept_emp.emp_no and dept_emp.dept_no = departments.dept_no and employees.emp_no = titles.emp_no and employees.emp_no = salaries.emp_no;
-- 5
select employees.emp_no, concat(employees.first_name,' ',employees.last_name) as name, titles.title, titles.to_date
from employees, titles
where employees.emp_no = titles.emp_no and titles.title = 'Technique Leader' and titles.to_date < now() ;
-- 6
select a.emp_no,
	concat(a.first_name,' ',a.last_name) as name,
    b.dept_name, d.title
    from employees a, departments b, dept_emp c,titles d
    where a.emp_no = c.emp_no
    and c.dept_no = b.dept_no
    and a.emp_no = d.emp_no
    and a.last_name like 'S%';
-- 7
select a.title,b.salary
from titles a, salaries b
where title = 'Engineer' and a.emp_no = b.emp_no and b.salary>'40000' and a.to_date >= now() and b.to_date >= now()
order by b.salary desc;
-- 8
select a.emp_no, b.emp_no, a.salary, b.title, a.to_date, b.to_date
from salaries a, titles b
where  a.salary > '50000' and a.emp_no = b.emp_no and a.to_date >= now() and b.to_date >= now()
order by a.salary desc;

-- 9
select b.dept_name, avg(a.salary)
    from salaries a, departments b, dept_emp c
    where a.emp_no = c.emp_no
    and c.dept_no = b.dept_no
    and  a.to_date >= now()
	group by b.dept_name
    order by avg(a.salary) desc;
-- 10
select b.title, avg(a.salary)
    from salaries a, titles b
    where a.emp_no = b.emp_no
    and  a.to_date >= now()
    and  b.to_date >= now()
	group by b.title
    order by avg(a.salary) desc;



