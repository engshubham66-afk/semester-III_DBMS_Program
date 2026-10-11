create database mducollege;

use mducollege;

create table student(
rollno int primary key,
name varchar(50),
marks int,
grade char(1)
);

select * from student;
insert into student
(rollno, name, marks, grade)
values
(101, "karan", 98, "A"),
(102,"arjun", 95, "B"),
(103,"ram", 85, "D"),
(104, "shubham", 90, "C");

insert into student values (100, "rohit", 80, "E");

SET SQL_SAFE_UPDATES = 0;

ALTER TABLE student
RENAME COLUMN name to full_name;

DELETE FROM student
where marks < 90;

select marks > 90 FROM student;
ALTER TABLE student
ADD grade char(1);

ALTER TABLE student
DROP COLUMN grade;

select * from student;

