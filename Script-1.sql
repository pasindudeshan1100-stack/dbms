create database resturentdb;
use resturentdb;
create table customers(
customer_id  INT primary key ,
full_name VARCHAR(20) not null ,
phone_number INT unique 
);
create table waiters(
staff_number INT primary key,
name VARCHAR(20) not null ,
shift ENUM ('MORNING','EVENING')
);
create table menuitems(
menu_id INT primary key,
dish_name VARCHAR(20) not null ,
price Decimal(10,2)
);
create table orders(
order_id INT primary key,
date DATE,
customer_id INT,
foreign key (customer_id)  references customers(customer_id),
staff_number INT,
foreign key (staff_number)  references waiters(staff_number)
);

create table details(
details_id INT primary key,
order_id INT,
menu_id INT,
quantity INT,
foreign key (order_id) references orders (order_id),
foreign key (menu_id) references menuitems (menu_id)
);
INSERT INTO Customers VALUES
(1,'Kamal Perera','0711111111'),
(2,'Nimal Silva','0722222222'),
(3,'Sunil Fernando','0733333333');

INSERT INTO Waiters VALUES
(1,'Ruwan','Morning'),
(2,'Saman','Evening');

INSERT INTO MenuItems VALUES
(1,'Rice and Curry',850.00),
(2,'Fried Rice',1200.00),
(3,'Burger',950.00),
(4,'Pizza',1800.00),
(5,'Coffee',300.00);


desc orders;
ALTER TABLE orders
ADD staff_number INT;
INSERT INTO Orders (order_id,date,customer_id,staff_number)VALUES
(101,'2023-10-25',1,1),
(102,'2023-10-25',2,2),
(103,'2023-10-26',3,1);

INSERT INTO details VALUES
(1,101,1,2),
(2,101,5,1),
(3,102,2,1),
(4,102,3,2),
(5,103,4,1),
(6,103,5,2);

select 
customers.full_name,
orders.date 
from customers
inner join  orders on customers.customer_id=orders.customer_id;

select 
orders.order_id,
waiters.name
from orders
inner join  waiters on orders.staff_number=waiters.staff_number;

select 
menuitems.dish_name,
details.quantity
from menuitems
inner join details on menuitems.menu_id=details.menu_id;
use resturentdb;
select
waiters.name,
orders.order_id
from orders
inner join waiters on orders.staff_number=waiters.staff_number
where waiters.shift='morning';

select 
customers.full_name,
customers.phone_number,
orders.order_id
from orders
inner join customers on orders.customer_id=customers.customer_id
where orders.date='2023-10-25';

create database librydb;
use librydb;

select 
books.book_title,
categories.category_name
from books
inner join categories
on books.category_id=categories.category_id;

select 
students.student_name,
borrowrecords.borrow_date
from students 
inner join borrowrecords
on students.student_id=borrowrecords.student_id;

SELECT Students.StudentName, Books.BookTitle
FROM Students
INNER JOIN BorrowRecords
ON Students.StudentID = BorrowRecords.StudentID
INNER JOIN Books
ON BorrowRecords.BookID = Books.BookID;

select 
books.book_title,
borrowrecords.borrow_date,
categories.categiry_name
from borrowrecords
inner join books 
on borrowrecords.book_id=books.book_id
inner join categories
on books.category_id=categories.category_id;

select 
customers.customer_name,
orders.order_id,
orders.order_date
from customers
inner join orders
on customers.customer_id=orders.customer_id;

select 
categories.category_name,
products.product_name,
products.price
from products
inner join categories
on products.category_id=categories.category_id;

select
customers.customer_name,
orders.total_amount
from customers
inner join orders
on customers.customer_id=orders.customer_id;
where orders.total_amount>1000;

select
customers.customer_name,
orders.order_id
from customers
inner join orders
on customers.customer_id=orders.customer_id
where customers.city='colombo';

select
employees.emp_name,
departments.dept_id
from employees
inner join departments
on emplyees.dept_id=departments.dept_id;

select
companycars.car_models,
employees.emp_name
from employees
left join companycars
on employees.emp_id=companycars.emp_id;

select
employees.emp_name,
departments.dept_name
from departments
left join employees
on departments.dept_id=employees.dept_id;

select
employees.emp_name,
departments.dept_name
from employees
right join departments
on departments.dept_id=employees.dept_id;

select
companycars.carmodel,
employees.emp_name
from employees
right join companycars
on employees.emp_id=companycars.emp_id;


















