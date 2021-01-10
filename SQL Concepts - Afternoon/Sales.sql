-- to create database
create database sampleDB;

-- using created database or entering inside sampleDB
use sampleDB;

-- product table creation
create table PRODUCT(
PCODE INT NOT NULL, PNAME VARCHAR(50), 
UNIT_PRICE DECIMAL NOT NULL, 
CCODE INT NOT NULL, 
primary key(PCODE));

-- category table creation
create table CATEGORY(
CCODE INT NOT NULL, 
CNAME VARCHAR(50) NOT NULL, 
primary key(CCODE));

-- customer creation
create table CUSTOMER(
CID INT NOT NULL, 
CNAME VARCHAR(50) NOT NULL, 
DOB DATE NOT NULL, 
GENDER CHAR(1) NOT NULL, 
MOB_NO VARCHAR(12) NOT NULL, 
LCODE INT NOT NULL, 
primary key(CID),  
CONSTRAINT CHECK(GENDER IN ('M', 'F', 'O')));

-- location table creation
create table LOCATION(
LCODE INT NOT NULL, 
LNAME VARCHAR(50) NOT NULL, 
primary key(LCODE));


-- sales executive table creation
create table SALES_EXECUTIVE(
SID INT NOT NULL,
SNAME VARCHAR(50) NOT NULL, 
DOB DATE NOT NULL, 
GENDER CHAR(1) NOT NULL, 
MOB_NO VARCHAR(12) NOT NULL, 
primary key(SID),  
constraint CHECK (GENDER IN ('M', 'F', 'O')));


--sell table creation
CREATE TABLE SELL(
SID INT NOT NULL,
PCODE INT NOT NULL,
CID INT NOT NULL,
DOP DATE NOT NULL,
NOU INT NOT NULL,
PRIMARY KEY(SID,PCODE,CID,DOP),
);

-- adding primary and foeign keys constraints
ALTER TABLE PRODUCT ADD FOREIGN KEY (CCODE) REFERENCES CATEGORY(CCODE);
ALTER TABLE CUSTOMER ADD FOREIGN KEY (LCODE) REFERENCES LOCATION(LCODE);
ALTER TABLE SELL ADD FOREIGN KEY (SID) REFERENCES SALES_EXECUTIVE(SID);
ALTER TABLE SELL ADD FOREIGN KEY (PCODE) REFERENCES PRODUCT(PCODE);
ALTER TABLE SELL ADD FOREIGN KEY (CID) REFERENCES CUSTOMER(CID);

-- inesertin category table
INSERT INTO CATEGORY VALUES(1,"FOOD ITEMS");
INSERT INTO CATEGORY VALUES(2,"COSMETICS");
INSERT INTO CATEGORY VALUES(3,"CLOTHES");
INSERT INTO CATEGORY VALUES(4,"TOYS");

select * FROM CATEGORY;

-- inserting into product table
INSERT INTO PRODUCT VALUES(1,"SOAP", 50, 2);
INSERT INTO PRODUCT VALUES(2,"BISCUIT", 20, 1);
INSERT INTO PRODUCT VALUES(3,"PERFUME", 500, 2);
INSERT INTO PRODUCT VALUES(4,"SHIRT", 1200, 3);
INSERT INTO PRODUCT VALUES(5,"LIPSTICK", 120, 2);

SELECT * FROM PRODUCT;

-- location table insertion
INSERT INTO LOCATION VALUES(101, 'CHENNAI');
INSERT INTO LOCATION VALUES(102, 'TRICHY');
INSERT INTO LOCATION VALUES(103, 'BANGALORE');

SELECT * FROM LOCATION;

-- customer table insertion
INSERT INTO CUSTOMER VALUES(201, "HAMEN", '1998-09-20','M', '9688441160', 102);
INSERT INTO CUSTOMER VALUES(202, "VIPPIN", '2000-01-20', 'M', '9685441160', 103);
INSERT INTO CUSTOMER VALUES(203, "LINI", '1990-1-22', 'F', '9656741160', 101);
INSERT INTO CUSTOMER VALUES(204, "VINI", '1987-05-10', 'F', '6788441160', 103);
INSERT INTO CUSTOMER VALUES(205, "ANI", '1998-09-20', 'F', '9688123460', 102);

SELECT * FROM CUSTOMER;

--sales executive talbe insertion
INSERT INTO SALES_EXECUTIVE VALUES(301, "PRABA",'1998-09-20', 'M', '9688441160');
INSERT INTO SALES_EXECUTIVE VALUES(302, "SOUMYA",'2001-06-19', 'F', '6377741160');
INSERT INTO SALES_EXECUTIVE VALUES(303, "AJAY",'1997-01-07', 'M', '9688441135');
INSERT INTO SALES_EXECUTIVE VALUES(304, "PARTHI",'1997-01-07', 'M', '9688441135');

SELECT * FROM SALES_EXECUTIVE;

-- sell table insertion
INSERT INTO SELL VALUES(301, 1, 202, '2021-01-2', 2);
INSERT INTO SELL VALUES(301, 2, 201, '2021-01-5', 5);
INSERT INTO SELL VALUES(302, 1, 201, '2021-01-3', 1);
INSERT INTO SELL VALUES(303, 3, 203, '2020-12-19', 10);
INSERT INTO SELL VALUES(301, 5, 205, '2021-01-2', 2);
INSERT INTO SELL VALUES(303, 1, 205, '2021-01-2', 2);
INSERT INTO SELL VALUES(302, 1, 205, '2021-01-2', 2);

SELECT * FROM SELL;


-- most sold product in a location (Trichy) in last week
select P.PCODE, P.PNAME, T.DOP AS DATE_OF_PURCHASE, max(TOT_UNITS) AS MAX_UNITS_SOLD_PERDAY from PRODUCT P
INNER JOIN (select sum(NOU) as TOT_UNITS, PCODE, DOP  from SELL S, CUSTOMER C 
where C.LCODE="102" and C.CID=S.CID and DOP 
between date_sub(current_date(),interval 7 DAY) and current_date() group by DOP,PCODE) 
T ON T.PCODE = P.PCODE;


-- sales persons details along with the count of products sold by them.
SELECT SE.*, IFNULL(T.CNT, 0) AS NO_OF_PRODUCT_SOLD FROM SALES_EXECUTIVE SE LEFT JOIN
(SELECT SID, COUNT(DISTINCT PCODE) AS CNT FROM SELL S GROUP BY SID) T 
ON T.SID = SE.SID;