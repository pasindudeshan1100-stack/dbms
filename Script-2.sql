CREATE DATABASE OfficeDB;
USE OfficeDB;

CREATE TABLE Staff (
    EmpID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);

desc staff;

INSERT INTO staff (FirstName, LastName, Salary, HireDate) VALUES 
('Kamal', 'Perera', 45500.50, '2020-05-15'),
('Nimali', 'Silva', 52300.75, '2019-11-20'),
('Sunil', 'Fernando', 38900.20, '2022-01-10'),
('Amala', 'Kumari', 61000.90, '2018-08-05');

select UPPER(CONCAT(FirstName,' ',LastName))as FullName from staff;
select UPPER(FirstName)from staff; 
select LOWER(FirstName)from staff; 
select LENGTH(FirstName)from staff;
select CEIL(SALARY)from staff; 
select FLOOR(SALARY)from staff; 
Select CURRENT ()from staff; 
select COUNT (SALARY) as count from staff;    
select FirstName, round(salary) as RoundedSalary from staff;
select FirstName, year(HireDate) as HireYear from staff;
select firstName, datediff(curdate(),HireDate) as DaysOFWORKS from staff; 
select sum(SALARY) as TotalSalary,
AVG(SALARY)as TotalAverage,
MAX(SALARY)as hIGHESTSALARY
from staff;

