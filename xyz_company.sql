create database xyz_company;
use xyz_company;

create table employee(
id int primary key,
name varchar(59),
salary  int 
);

insert into employee
(id, name, salary)
values
(1, "adam", 25000),
(2, "bob", 30000),
(3, "casey", 40000);


select * from employee;

create table xyz_company.mytable(
rollno int,
name varchar(20),
marks int);

select * from mytable;
insert into mytable (rollno, name, marks) 
values
(1, "shubham", 98);

insert into mytable (rollno, name, marks) 
values
(2, "Aman", 90),
(2, "Deepak", 80);

Alter table xyz_company.mytable modify name varchar(30);

set sql_safe_updates = 0;

delete from mytable where name='Deepak';
delete from mytable where marks=90;
set sql_safe_updates = 1;

select * from mytable;


