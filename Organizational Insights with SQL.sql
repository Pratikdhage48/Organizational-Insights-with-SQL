
-- Organizational Insights with SQL

-- This project demonstrates fundamental to advanced SQL operations using a simulated Organization Database. 
-- The database includes three core tables: Worker, Title, and Bonus. 
-- The project consists of 50+ SQL queries that cover a wide range of operations such as 
-- data retrieval, aggregation, filtering, joins, subqueries, and string/date functions.



-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.

SELECT FIRST_NAME AS WORKER_NAME 
FROM Worker;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.

select upper(FIRST_NAME) 
from Worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.

select distinct DEPARTMENT 
from Worker;
	
    -- use group by
select department 
from Worker
group by department;
    
-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.

select substring(FIRST_NAME,1,3) 
from Worker;


-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.

select instr(FIRST_NAME,'B') 
from Worker
where FIRST_NAME = 'Amitabh';

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.

select rtrim(FIRST_NAME) 
from Worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.

select ltrim(FIRST_NAME) 
from Worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.

select distinct department, length(department) 
from worker;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.

select replace(FIRST_NAME,'a','A') 
from Worker;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.

select concat(FIRST_NAME,' ',LAST_NAME) as COMPLETE_NAME 
from Worker;

select concat(FIRST_NAME,space(1),LAST_NAME) as COMPLETE_NAME from Worker;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

select * 
from Worker
order by first_name;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.

select * 
from Worker 
order by first_name asc, DEPARTMENT desc;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.

select * from worker
where first_name IN ('Vipul','Satish');

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.

select * from Worker
where first_name not in ('Vipul','Satish');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.

select * from Worker
where DEPARTMENT = 'Admin';

		-- Start with Admin
select * from Worker
where DEPARTMENT like 'Admin%';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

select * 
from Worker 
Where first_name like '%a%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

select * from Worker 
where first_name like '%a';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

select * from Worker 
where first_name 
like '_____h';

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

select * from Worker
where salary between 100000 and 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.

select * from Worker 
where YEAR(joining_date) = 2014 and MONTH(joining_date) = '02';

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.

select count(*) as emmp_count 
from Worker
where DEPARTMENT = 'Admin';

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.

select concat(first_name,' ',last_name) as full_Name 
from worker
where Salary between 50000 and 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.

select department,count(WORKER_ID) as emp_count from worker
group by department
order by emp_count desc;


-- Q-24. Write an SQL query to print details of the Workers who are also Managers.

select W.*
from worker W
inner join Title T
ON W.WORKER_ID = T.WORKER_REF_ID
where T.WORKER_TITLE = 'Manager';

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.

select WORKER_TITLE,count(WORKER_TITLE) as Title_ from Title
group by WORKER_TITLE
having Title_ > 1 ;

-- Q-26. Write an SQL query to show only odd rows from a table.

select * from Worker 
where mod(worker_id,2) != 0;

-- Q-27. Write an SQL query to show only even rows from a table. 

select * from Worker 
where MOD(WORKER_ID,2) = 0;

-- Q-28. Write an SQL query to clone a new table from another table.

CREATE TABLE Worker_clone LIKE Worker; -- it will create empty new_table based on the structure of original_table 
INSERT INTO Worker_Clone SELECT * FROM Worker; -- Insert data into tbale

	-- CREATE TABLE new_table AS SELECT * FROM orignal_table; 
		-- This creates a new table new_table with the same structure and data as original_table.
        
-- Q-29. Write an SQL query to fetch intersecting records of two tables.
		-- use worker tabel and worker_clone
select w.*
from worker w
inner join Worker_Clone wc 
on w.worker_id=wc.worker_id;

-- Q-30. Write an SQL query to show records from one table that another table does not have.

		-- left anti join
select worker.*
from worker
left join worker_clone
using(worker_id)
where worker_clone.worker_id is null;
		-- both the table are same so we getting no values 

-- Q-31. Write an SQL query to show the current date and time.

SELECT NOW();	-- date and time
SELECT curdate();	-- current date

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.

select * from worker
order by Salary desc
LIMIT 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.

select distinct salary from worker
order by Salary desc
LIMIT 4,1; 

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.

				-- Using Coreleted subquery
select * from worker w1
where 5 = (
select count(distinct(w2.salary))
from worker w2
where w2.salary >= w1.salary
);

-- Q-35. Write an SQL query to fetch the list of employees with the same salary.

select * 
from worker w1, worker w2
where w1.salary =  w2.salary and w1.worker_id != w2.worker_id;

-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
		-- no use of LIMIT and Coreleted subquery
        
select max(salary) 
from worker
where salary NOT IN (select max(salary) from worker);

select max(salary) from worker	--  Recommended ,Simpler and faster for the database engine to evaluate, NULL-safe.
where salary < (
select max(salary) from worker
);

-- Q-37. Write an SQL query to show one row twice in results from a table.

select * from worker
union all
select * from worker
order by worker_id;

-- Q-38. Write an SQL query to list worker_id who does not get bonus.

select w.worker_id
FROM worker w
left join bonus b
on w.worker_id = b.worker_ref_id
where b.worker_ref_id is null;

				-- Using Subquery
                
select worker_id from worker
where worker_id NOT IN (
select worker_ref_id from bonus
);

-- Q-39. Write an SQL query to fetch the first 50% records from a table.

select * 
from worker
where worker_id <= (select count(worker_id)/2 from worker);

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.

select department, count(worker_id) as no_of_emp 
from worker
group by department
having no_of_emp < 4;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.

select department, count(worker_id) as no_of_emp 
from worker
group by department;

-- Q-42. Write an SQL query to show the last record from a table. -- with subsquery

select * 
from worker 
where worker_id = (select max(worker_id) from worker); -- worker_id is a unique, incrementing value (like a primary key or auto-increment ID).

		-- another way
select * from worker
order by worker_id desc
limit 1;      
  
-- Q-43. Write an SQL query to fetch the first row of a table. -- with subsquery

select * 
from worker 
where worker_id = (select min(worker_id) from worker);

	--  Also easy way
select * from worker limit 1;

-- Q-44. Write an SQL query to fetch the last five records from a table.

(select * 
from worker 
order by worker_id desc limit 5) order by worker_id;

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.

select w.first_name, w.salary, w.department
from (select department, max(salary) as maxsal 
	  from worker 
      group by department) as temp
inner join worker w
on temp.department = w.department and temp.maxsal = w.salary;

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
				-- Using Subquery
                
select first_name, department, salary
from worker w 
where salary = (select max(salary) 
				from worker 
                where w.department = worker.department);

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery

select distinct salary 
from worker w1
where 3 >= (select count(distinct(salary)) 
			from worker w2 
            where w1.salary <= w2.salary)
order by w1.salary desc;

-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery

select distinct salary 
from worker w1
where 3 >= (select count(distinct(salary)) 
			from worker w2 
            where w1.salary >= w2.salary) 
            order by w1.salary desc;

-- Q-48. Write an SQL query to fetch nth max salaries from a table.

		-- nth means desired rank (e.g., 3 for 3rd highest).
        
select distinct salary 
from worker w1 
where n >= (select count(distinct(salary)) 
			from worker w2 
            where w1.salary <= w2.salary) order by w1.salary desc;

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.

select department, sum(salary) as depSal 
from worker 
group by department 
order by depsal desc ;

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.

select first_name, salary 
from worker
where salary = (select max(salary) 
				from worker);


  

  