--                          Pratical no. - 1
==================================================================================================
 
-- Hospital Management System
 
/* Consider the following Schema  Supplier(SID, Sname, branch, city, phone) 
 Part(PID,Pname, color, price) 
 Supplies(SID, PID, qty, date_supplied)   */
 
 ---------------------------------------------------------------------------------------
 /* DDL commands */
 ---------------------------------------------------------------------------------------

create database Hospital_Management_System;
 use Hospital_Management_System;
 
 -- 1. Create the above table 

 create table Supplier(
 SID varchar(20) primary key,
 Sname varchar(30),
 branch varchar(30),
 city varchar(30),
 phone varchar(15)
 );
 
 create table Part(
 PID varchar(20) primary key,
 Pname varchar(30),
 color varchar(30),
 price float
 );

 create table Supplies(
 SID varchar(20) primary key,
 PID varchar(20),
 qty int,
 date_supplied date,
 constraint fk_supplies_part
  foreign key (PID)
  references Part(PID) 
 );
 
 -- 2. Add a new attribute state in Supplier table
 
 alter table Supplier
 add state varchar(30);
 
 -- 3. Remove city from Supllier
 
 alter table Supplier
 drop city;
 
 -- 4. Modify the data type of phone attribute
 
 alter table Supplier
 modify phone varchar(30) not null;
 
 -- 5. Change the name of attribute city to address
 
 alter table Supplier add city varchar(30);
 alter table Supplier rename column city to address;
 
 -- 6. Change a table's name, Supplier to sup
 
 alter table Supplier rename to sup;

-- 7. Use truncate to delete the contents of Supplies table

truncate table sup;

-- 8. Remove the Part table from database

show create table Supplies;
alter table Supplies drop foreign key fk_supplies_part;
drop table Part;

-- Rename table name sup to Supplier again

Alter table sup rename to Supplier;

-- Use SELECT command

 select * from Supplier;
 select * from Part;
 select * from Supplies;
 
----------------------------------------------------------------------------------------
/* DML commands */
----------------------------------------------------------------------------------------

-- 1. Insert at least 10 records in tables supplier, part and supplies  

insert into Supplier
(SID, Sname, branch, city, phone)
 values
('s1', 'Rohit', 'Branch A', 'Chandan Nagar', 1190283728),
('s2', 'Sonu', 'Branch A', 'Tirkha Colony', 1190183728),
('s3', 'Deepak', 'Branch C', 'Chandan Nagar', 1190283727),
('s4', 'Mohit', 'Branch A', 'Panipat', 1902837286),
('s5', 'Rohan', 'Branch A', 'Chawla Colony', 1190283725),
('s6', 'Anuj', 'Branch B', 'Gurugram', 1190283724),
('s7', 'Ritesh', 'Branch B', 'Chandan Nagar', 1190283723),
('s8', 'Vishal', 'Branch C', 'Faridabad', 1190283722),
('s9', 'Ram', 'Branch B', 'Parvtiya Colony', 1190283721),
('s10', 'Ramesh', 'Branch C', 'Chandan Nagar', 1190283728),
('s11',	'Mike',	'Branch C',	'Chandan Nagar', 9190283728);

insert into Part
(PID, Pname, color, price)
values
('p101', 'Stethoscope', 'Black', '1200'),
('p102', 'Wheelchair', 'Blue', '8600'),
('p103', 'Hospital Bed', 'White', '25000'),
('p104', 'Oxygen Cylinder', 'Silver', '7000'),
('p105', 'Blood Monitor', 'White', '3500'),
('p106', 'Patient', 'Black', '45000'),
('p107', 'IV Stand', 'Silver', '1800'),
('p108', 'Examination Table', 'White', '12000'),
('p109', 'Computer', 'Black', '45000'),
('p1010', 'Printer', 'White', '12000'),
('p1011', 'Printer', 'White', '12000');

insert into Supplies
(SID, PID, qty, date_supplied)
values
('s1', 'p101', 500, '2026-09-15'),
('s2', 'p102', 500, '2026-09-15'),
('s3', 'p103', 900, '2026-09-15'),
('s4', 'p104', 600, '2026-09-15'),
('s5', 'p105', 500, '2026-09-15'),
('s6', 'p106', 500, '2026-09-15'),
('s7', 'p107', 800, '2026-09-15'),
('s8', 'p108', 500, '2026-09-15'),
('s9', 'p109', 700, '2026-09-15'),
('s10', 'p1010', 700, '2026-09-15'),
('s11',	'p1011','500',	'2026-09-19');

-- 2. Show the contents in tables supplier, part and supplies  

SELECT * FROM  Supplier;
SELECT * FROM  Part;
SELECT * FROM Supplies;

-- 3. Find the name and city of all suppliers
SELECT Sname, city FROM Supplier;

-- 4. Find the name and phoneno of all suppliers who stay in ‘Delhi’  
select Sname, phone from Supplier
where city = 'Delhi';

-- 5. Find all distinct branches of suppliers  
select distinct branch from Supplier;

-- 6. Delete the record of the supplier whose SID is 204001  

delete from Supplier 
where SID='204001';

-- 7. Delete all records of supplier table 

truncate table Supplier;

-- 8. Delete all records of suppliers whose city starts with capital A. 

delete from Supplier
where city like 'A%'
limit 10;

-- 9. Find the supplier names which have ‘lk’ in any position 

select * from Supplier
where Sname like '%lk%';

-- 10. Find the supplier name where ‘R’ is in the second position  
select * from Supplier
where Sname like '-r%';

-- 11. Find the name of supplier whose name starts with ‘V’ and ends with ‘A’  
select * from Supplier
where Sname like 'v%a';

-- 12. Change the city of all suppliers to ‘BOMBAY’  
set sql_safe_updates = 0;

Update Supplier
set city='BOMBAY'; 

-- 13. Change the city of supplier ‘Vandana’ to ‘Goa’  
Update Supplier
set city='Goa'
where Sname='Vandana';

---------------------------------------------------------------------------------------
/* Queries with Constraints */
---------------------------------------------------------------------------------------

-- 1. Create the supplier table with Primary Key Constraint

create table Supplier(
 SID varchar(20) primary key ,
 Sname varchar(30),
 branch varchar(30),
 city varchar(30),
 phone varchar(15)
 );
 
 -- 2. Create supplies table with Foreign key Constraint 

create table Supplies(
 SID varchar(20) primary key,
 PID varchar(20),
 qty int,
 date_supplied date,
 constraint fk_supplies_part
  foreign key (PID)
  references Part(PID) 
 );
 
-- 3. Create a part table with UNIQUE Constraint 

 create table Part(
 PID varchar(20) primary key,
 Pname varchar(30),
 color varchar(30) unique,
 price float
 );
 
 -- 4. Create supplier Table with Check Constraints 
 
 create table Supplier(
 SID varchar(20) primary key ,
 Sname varchar(30),
 branch varchar(30),
 city varchar(30) check(city='Faridabad'),
 phone varchar(15)
 );
 
 -- 5. Create Supplier table with Default Constraint 
 
 create table Supplier(
 SID varchar(20) primary key ,
 Sname varchar(30),
 branch varchar(30) default 'Branch A',
 city varchar(30),
 phone varchar(15)
 );
 
 ---------------------------------------------------------------------------------------
 /* Queries on TCL */
 ---------------------------------------------------------------------------------------
 
-- 1. Create Savepoints

 start transaction;
 insert into Supplier
 values('1011', 'Rahul', 'branch c', 'Ambala', '7897324578');
 savepoint sp1;
 
 insert into Supplier
 values('1012', 'Shivam', 'branch c', 'Ambala', '7897324599');
 savepoint sp2;
 
 insert into Supplier
 values('1013', 'Rahul kumar', 'branch c', 'Ambala', '7897324572');
 
 savepoint sp3; 
 
 insert into Supplier
 values('1014', 'Sonu Kumar', 'branch c', 'Ambala', '7897324574');
 
-- 2. Rollback to SavePoints3.Use Commit to save on 
 
rollback to savepoint sp2;
commit;

--------------------------------------------------------------------------------------
/* Aggregate Functions */
--------------------------------------------------------------------------------------

-- 1. Find the minimum, maximum, average and sum of costs of parts

select min(price) from Part;

select max(price) from Part;

select avg(price) from Part;

-- 2. Count the total number of parts present

select count(*) from Part;

-- 3. Retrieve the average cost of all parts supplied by ‘Mike’ 

select avg(p.price) 
from Part p
join Supplies s on p.PID = s.PID
join Supplier sup on s.SID = sup.SID
where sup.Sname = 'Mike';

---------------------------------------------------------------------------------------
/* Queries on GROUP BY, HAVING AND ORDER BY Clauses */
---------------------------------------------------------------------------------------

-- 1. Display total price of parts of each color

select color, sum(price) from Part group by color;

/* 2. Find the branch and the number of suppliers in that branch for branches 
which have more than 2 suppliers */

select branch, count(*) as supplier_count from Supplier
group by branch having count(*) > 2;

-- 3. Find all parts sorted by pname in ascending order and cost in descending order

select * from Part order by Pname asc, price desc;

-- 4. Find the branch and the number of suppliers in that branch 

select branch, count(*) as supplier_count from Supplier
group by branch;
