create table employee 
(
emp_name varchar(10),
dep_id int,
salary int
);
delete from employee;
insert into employee values 
('Siva',1,30000),('Ravi',2,40000),('Prasad',1,50000),('Sai',2,20000);



with cte as (
select dep_id, emp_name, salary,rank() over (partition by dep_id order by salary desc) as rn
from employee
),
cte2 as (
select dep_id, min(rn) as min_rn,max(rn) as max_rn from cte
group by 1
)
select b.dep_id, b.emp_name as emp_name_max_salary , c.emp_name as emp_name_min_salary
from cte2 a 
left join cte b
on (b.dep_id=a.dep_id)
left join cte c
on (c.dep_id=a.dep_id)
where a.min_rn=b.rn
and a.max_rn=c.rn
