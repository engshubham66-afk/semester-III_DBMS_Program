 -- Hospital Management System
 
/* Consider the following Schema  Supplier(SID, Sname, branch, city, phone) 
 Part(PID,Pname, color, price) 
 Supplies(SID, PID, qty, date_supplied)   */
 
 /* DDL commands */
create database Hospital_Management_System;
 use Hospital_Management_System;
 
 create table supplier(
 SID int primary key,
 Sname varchar(30),
 branch varchar(30),
 city varchar(30),
 phone int
 );
 
 create table Part(
 PID int primary key,
 Pname varchar(30),
 color varchar(30),
 price float
 );
 
 create table Supplies(
 SID int primary key,
 PID int,
 constraint fk_supplies_part
 foreign key (PID)
 references Part(PID),
 qty int,
 date_supplied date
 );
 
 alter table Supplier
 add state varchar(30);
 
 alter table Supplier
 drop city;
 
 alter table Supplier
 modify phone varchar(30) not null;
 
 alter table Supplier add city varchar(30);
 alter table Supplier rename column city to address;
 
 alter table Supplier rename to sup;

truncate table sup;

show create table Supplies;
alter table Supplies drop foreign key fk_supplies_part;
drop table Part;

alter table sup drop foreign key PID;
drop table Part;

 select * from sup;
 select * from supplies;
 select * from Part;
 
/* DML commands */
 
