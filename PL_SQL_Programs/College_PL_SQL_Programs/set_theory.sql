/*Assume the following tables:
- Part(PNO, Pname, COLOR, COST)
- Supplier(SNO, Sname)
- SUPPLY(SNO, PNO) */

create table Part(
    PNO varchar(10) primary key,
    Pname varchar(30),
    color varchar(30),
    cost number
);

create table Supplier(
    SNO varchar(10) primary key,
    Sname varchar(30)
);

create table Supply(
    SNO varchar(10),
    PNO varchar(10),
    constraint fk_supplies_Part_1
    foreign key (SNO)
    references Supplier(SNO),

    constraint fk_supplies_Part_2
    foreign key (PNO)
    references Part(PNO)
    );

insert into Part 
(PNO, Pname, color, cost)    
values
('p101', 'Stethoscope', 'Black', 1200),
('p102', 'Wheelchair', 'Green', 500),
('p103', 'Hospital Bed', 'Green', 500),
('p104', 'Oxygen Cylinder', 'Silver', 7000),
('p105', 'Blood Monitor', 'Green', 500),
('p106', 'Patient', 'Red', 400),
('p107', 'IV Stand', 'Red', 400);

insert into Supplier
(SNO, Sname)
values
('s1', 'Rohit'),
('s2', 'Rohan'),
('s3', 'Soni'),
('s4', 'Sonu');

insert into Supply
(PNO, SNO)
values
('p101', 's1'),
('p102', 's2'),
('p103', 's3'),
('p104', 's4'),
('p106', 's2');

/*1. List all Parts except ‘NUT’ and ‘BOLT’ in ascending 
order of costs.*/
SELECT *
FROM Part
WHERE Pname NOT IN ('NUT', 'BOLT')
ORDER BY COST ASC;

-- 2. Display all Parts that have not been supplied so far.

SELECT *
FROM Part
WHERE PNO NOT IN (
    SELECT PNO
    FROM SUPPLY
);

/*3. Display supplier names who have supplied a green Part 
costing ₹500 AND a red Part costing ₹400. */
SELECT Sname
FROM SUPPLIER
WHERE SNO IN (
    SELECT SNO
    FROM SUPPLY
    WHERE PNO IN (
        SELECT PNO
        FROM Part
        WHERE COLOR = 'Green'
          AND COST = 500
    )
)

INTERSECT
SELECT Sname
FROM SUPPLIER
WHERE SNO IN (
    SELECT SNO
    FROM SUPPLY
    WHERE PNO IN (
        SELECT PNO
        FROM Part
        WHERE COLOR = 'Red'
          AND COST = 400
    )
);

/* 4. Display supplier names who have supplied a green Part 
costing ₹500 OR a red Part costing ₹400. */

SELECT Sname
FROM SUPPLIER
WHERE SNO IN (
    SELECT SNO
    FROM SUPPLY
    WHERE PNO IN (
        SELECT PNO
        FROM Part
        WHERE COLOR = 'Green'
          AND COST = 500
    )
)
UNION
SELECT Sname
FROM SUPPLIER
WHERE SNO IN (
    SELECT SNO
    FROM SUPPLY
    WHERE PNO IN (
        SELECT PNO
        FROM Part
        WHERE COLOR = 'Red'
          AND COST = 400
    )
);

/*5. Display the names of suppliers who have supplied all Parts that
 are red in color.*/


select Sname
FROM SUPPLIER S
WHERE NOT EXISTS (
    SELECT *
    FROM Part P
    WHERE P.COLOR = 'red'
      AND NOT EXISTS (
          SELECT *
          FROM SUPPLY SP
          WHERE SP.SNO = S.SNO
            AND SP.PNO = P.PNO
      )
);


