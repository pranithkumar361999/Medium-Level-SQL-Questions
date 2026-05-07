-- CREATE TABLE emp_salary
-- (
--     emp_id INTEGER  NOT NULL,
--     name NVARCHAR(20)  NOT NULL,
--     salary NVARCHAR(30),
--     dept_id INTEGER
-- );


-- INSERT INTO emp_salary
-- (emp_id, name, salary, dept_id)
-- VALUES(101, 'sohan', '3000', '11'),
-- (102, 'rohan', '4000', '12'),
-- (103, 'mohan', '5000', '13'),
-- (104, 'cat', '3000', '11'),
-- (105, 'suresh', '4000', '12'),
-- (109, 'mahesh', '7000', '12'),
-- (108, 'kamal', '8000', '11');
-- select * from emp_salary;
with cte as (
select salary,dept_id,count(*) as cnt
from emp_salary
group by 1,2
having cnt>1
)
select b.emp_id,b.name,a.salary,a.dept_id from cte a
left join emp_salary b
using (salary,dept_id);
