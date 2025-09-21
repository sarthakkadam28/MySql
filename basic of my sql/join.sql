drop table students;
truncate table department ; 
create table department(dept_id int(5) primary key auto_increment,dept_name varchar(100));
Insert into department(dept_id ,dept_Name) values(101,'computer science'),(102,'electronics'),(103,'mechanic'),(104,'civil');

create table employee(empid int(4),empname varchar(100),managerid int (4),dept_id int(5), foreign key(dept_id) references department(dept_id));
insert into employee(empid,empname,managerid,dept_id) values(1,'anil',null,101),(2,'sunita',1,101),(3,'raj',1,102),(4,'meera',2,103),(5,'karan',2,null);

select d.dept_name ,e.empname from department d inner join employee e on d.dept_id=e.dept_id;
select d.dept_name ,e.empname from department d inner join employee e on d.dept_id=e.dept_id where id=1;
select d.dept_id, e.empname,e.empid from employee e inner join department d on d.dept_id=e.dept_id;

select e.empname,d.dept_name from employee e left join department d on e.dept_id=d.dept_id;
select e.empname,d.dept_name from employee e  left join department d on e.dept_id=d.dept_id where d.dept_id is null;
-- Join Employees and Departments using LEFT JOIN. Show EmpID, EmpName, and DeptName for all employees.
select e.empid,e.empname,e.dept_id from employee e left join department d on e.dept_id=d.dept_id ;

select e.empname,d.dept_name from employee e right join department d on e.dept_id=d.dept_id;
-- --Join Employees and Departments using RIGHT JOIN. Show DeptID and DeptName only for departments where no employee is working. 
select d.dept_id,d.dept_name from department d  left join employee e on d.dept_id=e.dept_id where e.empid is null;

SELECT e.empname AS employee, m.empname AS manager
FROM employee e
LEFT JOIN employee m ON e.managerid = m.empid;



-- conditions for practice
Join Employees and Departments using LEFT JOIN. Show EmpName and DeptName for all employees.

Join Employees and Departments using LEFT JOIN. Show EmpName and DeptName only for employees who do not have a department.

Join Employees and Departments using LEFT JOIN. Show EmpID, EmpName, and DeptName for all employees.

RIGHT JOIN

Join Employees and Departments using RIGHT JOIN. Show DeptName and EmpName.

Join Employees and Departments using RIGHT JOIN. Show DeptID and DeptName only for departments where no employee is working.

SELF JOIN (Employees with Employees)

Join Employees table with itself using SELF JOIN. Show employee EmpName and their manager’s EmpName.

Join Employees table with itself using SELF JOIN. Show pairs of employee names who have the same ManagerID.

CROSS JOIN

Join Employees and Departments using CROSS JOIN. Show EmpName and DeptName.

Join Employees and Departments using CROSS JOIN. Show EmpID, EmpName, DeptID, and DeptName.