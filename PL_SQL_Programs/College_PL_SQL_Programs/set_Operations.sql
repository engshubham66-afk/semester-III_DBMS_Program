/* Set THeory Operators */

-- relation A 
create table A
(
SID int primary key,
Name varchar(30),
Subject varchar(30)
);

-- relation B 
create table B
(
SID int primary key,
Name varchar(30),
Subject varchar(30)
);

-- insert values in the tables

insert into A
(SID, Name, Subject)
values
(123, 'Shubham Kumar', 'History'),
(223, 'Lalit Kumar', 'Math');

insert into B
(SID, Name, Subject)
values
(123, 'Shubham Kumar', 'History'),
(184, 'Deepak', 'Management');

/* 1.Show the use of UNION operator with union compatibility  */

-- A U B 
select * from A
union
select * from B;

/* 2.Show the use of intersect operator with union compatibility  */

-- A intersect B
select * from A
intersect
select * from B;

/* 3. Show the use of minus operator with union compatibility */

-- A - B 
select * from A
minus
select * from B;