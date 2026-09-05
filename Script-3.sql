create database departmentdb;
use departmentdb;
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    designation VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    manager_id INT NULL,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id),
    FOREIGN KEY (manager_id) REFERENCES Employee(emp_id)
);
CREATE TABLE Project (
    id INT PRIMARY KEY,
    project_name VARCHAR(50),
    department_id INT
);

CREATE TABLE EmployeeProject (
    employee_id INT,
    project_id INT,
    hours_worked INT,
    PRIMARY KEY (employee_id, project_id)
);
INSERT INTO Department (dept_id, dept_name) VALUES
(1, 'Engineering'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Sales');

INSERT INTO Employee (emp_id, emp_name, designation, salary, dept_id, manager_id) VALUES
(1, 'Alice Thompson', 'CEO', 250000, NULL, NULL),
(2, 'Bob Silva', 'Director', 180000, 1, 1),
(3, 'Catherine Lee', 'Director', 175000, 4, 1),
(4, 'David Brown', 'Manager', 140000, 1, 2),
(5, 'Eva Green', 'Manager', 135000, 4, 3),
(6, 'Frank White', 'Manager', 130000, 3, 1),
(7, 'George King', 'Senior Engineer', 90000, 1, 4),
(8, 'Hannah Scott', 'Senior Engineer', 92000, 1, 4),
(9, 'Ian Adams', 'Senior Engineer', 88000, 4, 5),
(10, 'Jack Turner', 'Engineer', 60000, 1, 7),
(11, 'Karen Mitchell', 'Engineer', 62000, 1, 7),
(12, 'Leo Carter', 'Engineer', 58000, 1, 8),
(13, 'Mia Dawson', 'Engineer', 59000, 4, 9),
(14, 'Nina Patel', 'HR Specialist', 70000, 2, NULL),
(15, 'Oscar Brooks', 'Financial Analyst', 75000, 3, 6);

INSERT INTO Project VALUES
(1, 'Platform Upgrade', 1),
(2, 'Recruitment System', 2),
(3, 'Quarterly Audit', 3),
(4, 'Sales Dashboard', 4),
(5, 'Security Enhancement', 1);

INSERT INTO EmployeeProject VALUES
(2, 1, 120),
(3, 1, 100),
(11, 1, 80),
(5, 2, 60),
(4, 2, 40),
(7, 3, 100),
(8, 3, 90),
(9, 4, 150),
(10, 4, 100),
(2, 5, 80),
(3, 5, 70);

select * from Employee ;
select * from Employee where salary>70000;
select Employee.emp_name
from Employee
inner join Department
on Employee.dept_id=Department.dept.id
where dept_name = Engineering;

select Department.*,sum(Employee.salary) as total_cost
from Department
left join Employee
on Department.dept_id=Employee.dept_id
group by department.dept_id
having total_cost>=400000
;

