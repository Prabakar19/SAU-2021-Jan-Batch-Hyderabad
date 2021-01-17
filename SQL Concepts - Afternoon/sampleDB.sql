-- to create database
create database sampleDB;

-- using created database or entering inside sampleDB
use sampleDB;

-- product table creation
create table PRODUCT(
PCODE VARCHAR(5) NOT NULL, 
PNAME VARCHAR(50) NOT NULL, 
UNIT_PRICE DECIMAL NOT NULL, 
CCODE VARCHAR(5) NOT NULL, 
primary key(PCODE));


-- category table creation
create table CATEGORY(
CCODE VARCHAR(5) NOT NULL, 
CNAME VARCHAR(50) NOT NULL, 
primary key(CCODE));

-- customer creation
create table CUSTOMER(
CID VARCHAR(5) NOT NULL, 
CNAME VARCHAR(50) NOT NULL, 
DOB DATE NOT NULL, 
GENDER CHAR(1) NOT NULL, 
MOB_NO VARCHAR(12) NOT NULL, 
LCODE VARCHAR(5) NOT NULL, 
primary key(CID),  
CONSTRAINT CHECK(GENDER IN ('M', 'F', 'O')));

-- location table creation
create table LOCATION(
LCODE VARCHAR(5) NOT NULL, 
LNAME VARCHAR(50) NOT NULL, 
primary key(LCODE));

-- sales executive table creation
create table SALES_EXECUTIVE(
SID VARCHAR(5) NOT NULL,
SNAME VARCHAR(50) NOT NULL, 
DOB DATE NOT NULL, 
GENDER CHAR(1) NOT NULL, 
MOB_NO VARCHAR(12) NOT NULL, 
primary key(SID),  
constraint CHECK (GENDER IN ('M', 'F', 'O')));


-- sales_category creation
CREATE TABLE SE_CATEGORY(
SID VARCHAR(5) NOT NULL,
CCODE VARCHAR(5) NOT NULL
);

-- order creation
CREATE TABLE ORDER_T(
ORDER_ID VARCHAR(5) NOT NULL,
CID  VARCHAR(5) NOT NULL,
SID   VARCHAR(5) NOT NULL,
DOP DATE NOT NULL,
PRIMARY KEY(ORDER_ID)
);


-- order poduct creation
CREATE TABLE ORDER_PRODUCT(
	PCODE VARCHAR(5) NOT NULL,
    ORDER_ID VARCHAR(5) NOT NULL,
    UNITS INT NOT NULL,
    PRIMARY KEY(PCODE, ORDER_ID)
);

-- showing all the tables
SHOW TABLES;

-- adding foeign keys constraints
ALTER TABLE PRODUCT ADD FOREIGN KEY (CCODE) REFERENCES CATEGORY(CCODE);
ALTER TABLE SE_CATEGORY ADD FOREIGN KEY (CCODE) REFERENCES CATEGORY(CCODE);
ALTER TABLE SE_CATEGORY ADD FOREIGN KEY (SID) REFERENCES SALES_EXECUTIVE(SID);
ALTER TABLE CUSTOMER ADD FOREIGN KEY (LCODE) REFERENCES LOCATION(LCODE);
ALTER TABLE ORDER_T ADD FOREIGN KEY(SID) REFERENCES SALES_EXECUTIVE(SID);
ALTER TABLE ORDER_T ADD FOREIGN KEY(CID) REFERENCES CUSTOMER(CID);
ALTER TABLE ORDER_PRODUCT ADD FOREIGN KEY(PCODE) REFERENCES PRODUCT(PCODE);
ALTER TABLE ORDER_PRODUCT ADD FOREIGN KEY(ORDER_ID) REFERENCES ORDER_T(ORDER_ID);


-- category
INSERT INTO CATEGORY VALUES("CAT01","FOOD ITEMS");
INSERT INTO CATEGORY VALUES("CAT02","COSMETICS");
INSERT INTO CATEGORY VALUES("CAT03","CLOTHES");
INSERT INTO CATEGORY VALUES("CAT04","TOYS");

select * FROM CATEGORY;

-- product
INSERT INTO PRODUCT VALUES("P101","BISCUIT", 20, "CAT01");
INSERT INTO PRODUCT VALUES("P102","CHOCOLATE", 80, "CAT01");
INSERT INTO PRODUCT VALUES("P103","SWEETS", 200, "CAT01");

INSERT INTO PRODUCT VALUES("P104","SOAP", 50, "CAT02");
INSERT INTO PRODUCT VALUES("P105","SHAMPOO", 120, "CAT02");
INSERT INTO PRODUCT VALUES("P106","PERFUME", 450, "CAT02");

INSERT INTO PRODUCT VALUES("P107","SHIRT", 1500, "CAT03");
INSERT INTO PRODUCT VALUES("P108","SAREE", 2000, "CAT03");

INSERT INTO PRODUCT VALUES("P109","IRON MAN TOY", 500, "CAT04");

SELECT * FROM PRODUCT;


-- location
INSERT INTO LOCATION VALUES("L101", 'CHENNAI');
INSERT INTO LOCATION VALUES("L102", 'TRICHY');
INSERT INTO LOCATION VALUES("L103", 'BANGALORE');

SELECT * FROM LOCATION;

-- customer
INSERT INTO CUSTOMER VALUES("C101", "HAMEN", '1998-09-20','M', '9688441160', "L101");
INSERT INTO CUSTOMER VALUES("C102", "VIPPIN", '2000-01-20', 'M', '9685441160', "L101");
INSERT INTO CUSTOMER VALUES("C103", "LINI", '1990-1-22', 'F', '9656741160', "L101");

INSERT INTO CUSTOMER VALUES("C104", "VINI", '1987-05-10', 'F', '6788441160', "L102");
INSERT INTO CUSTOMER VALUES("C105", "ANI", '1998-09-20', 'F', '9688123460', "L102");

INSERT INTO CUSTOMER VALUES("C106", "ROCKY", '1998-09-20','M', '9688441560', "L103");
INSERT INTO CUSTOMER VALUES("C107", "ADITYA", '2000-01-20', 'M', '9685641160', "L103");
INSERT INTO CUSTOMER VALUES("C108", "REMO", '1990-1-22', 'F', '9656741760', "L103");

SELECT * FROM CUSTOMER;

-- sales_executive
INSERT INTO SALES_EXECUTIVE VALUES("SE101", "PRABA",'1998-09-20', 'M', '9688441160');
INSERT INTO SALES_EXECUTIVE VALUES("SE102", "SOUMYA",'2001-06-19', 'F', '6377741160');
INSERT INTO SALES_EXECUTIVE VALUES("SE103", "AJAY",'1997-01-07', 'M', '9688441135');
INSERT INTO SALES_EXECUTIVE VALUES("SE104", "PARTHI",'1995-01-07', 'M', '9688441135');
INSERT INTO SALES_EXECUTIVE VALUES("SE105", "RIYA",'1997-01-07', 'F', '9685441135');

SELECT * FROM SALES_EXECUTIVE;

-- se_category
INSERT INTO SE_CATEGORY VALUES("SE101","CAT01");
INSERT INTO SE_CATEGORY VALUES("SE102","CAT01");
INSERT INTO SE_CATEGORY VALUES("SE103","CAT01");
INSERT INTO SE_CATEGORY VALUES("SE104","CAT01");

INSERT INTO SE_CATEGORY VALUES("SE101","CAT02");
INSERT INTO SE_CATEGORY VALUES("SE102","CAT02");
INSERT INTO SE_CATEGORY VALUES("SE103","CAT02");
INSERT INTO SE_CATEGORY VALUES("SE105","CAT02");

INSERT INTO SE_CATEGORY VALUES("SE101","CAT03");
INSERT INTO SE_CATEGORY VALUES("SE103","CAT03");
INSERT INTO SE_CATEGORY VALUES("SE104","CAT03");

INSERT INTO SE_CATEGORY VALUES("SE102","CAT04");
INSERT INTO SE_CATEGORY VALUES("SE103","CAT04");
INSERT INTO SE_CATEGORY VALUES("SE105","CAT04");

SELECT * FROM SE_CATEGORY;

-- order_t
INSERT INTO ORDER_T VALUES("O101", "C101", "SE101", "2021-01-03");
INSERT INTO ORDER_T VALUES("O102", "C102", "SE101", "2021-01-03");
INSERT INTO ORDER_T VALUES("O103", "C103", "SE101", "2021-01-03");

INSERT INTO ORDER_T VALUES("O104", "C101", "SE102", "2021-01-04");
INSERT INTO ORDER_T VALUES("O105", "C102", "SE102", "2021-01-04");

INSERT INTO ORDER_T VALUES("O106", "C102", "SE102", "2021-01-08");

INSERT INTO ORDER_T VALUES("O107", "C104", "SE104", "2021-01-05");
INSERT INTO ORDER_T VALUES("O108", "C105", "SE104", "2021-01-05");

INSERT INTO ORDER_T VALUES("O109", "C105", "SE105", "2021-01-06");
INSERT INTO ORDER_T VALUES("O110", "C104", "SE105", "2021-01-06");

INSERT INTO ORDER_T VALUES("O111", "C108", "SE102", "2021-01-07");

INSERT INTO ORDER_T VALUES("O112", "C103", "SE105", "2021-01-09");

INSERT INTO ORDER_T VALUES("O113", "C101", "SE101", "2021-01-10");
INSERT INTO ORDER_T VALUES("O114", "C104", "SE102", "2021-01-10");
INSERT INTO ORDER_T VALUES("O115", "C102", "SE103", "2021-01-10");

SELECT * FROM ORDER_T;


-- order_product
INSERT INTO ORDER_PRODUCT VALUES("P101", "O101", 3);
INSERT INTO ORDER_PRODUCT VALUES("P105", "O101", 2);

INSERT INTO ORDER_PRODUCT VALUES("P106", "O102", 3);
INSERT INTO ORDER_PRODUCT VALUES("P104", "O102", 2);
INSERT INTO ORDER_PRODUCT VALUES("P102", "O102", 1);

INSERT INTO ORDER_PRODUCT VALUES("P108", "O103", 3);
INSERT INTO ORDER_PRODUCT VALUES("P107", "O103", 6);

INSERT INTO ORDER_PRODUCT VALUES("P103", "O104", 10);

INSERT INTO ORDER_PRODUCT VALUES("P101", "O105", 1);
INSERT INTO ORDER_PRODUCT VALUES("P105", "O105", 3);

INSERT INTO ORDER_PRODUCT VALUES("P101", "O106", 3);
INSERT INTO ORDER_PRODUCT VALUES("P106", "O106", 5);

INSERT INTO ORDER_PRODUCT VALUES("P101", "O107", 10);

INSERT INTO ORDER_PRODUCT VALUES("P101", "O108", 4);
INSERT INTO ORDER_PRODUCT VALUES("P106", "O109", 3);

INSERT INTO ORDER_PRODUCT VALUES("P103", "O110", 1);
INSERT INTO ORDER_PRODUCT VALUES("P102", "O111", 2);
INSERT INTO ORDER_PRODUCT VALUES("P101", "O112", 3);
INSERT INTO ORDER_PRODUCT VALUES("P107", "O113", 4);
INSERT INTO ORDER_PRODUCT VALUES("P106", "O114", 5);
INSERT INTO ORDER_PRODUCT VALUES("P104", "O115", 6);

SELECT * FROM ORDER_PRODUCT;

DROP TABLE PRODUCT;
DROP TABLE CATEGORY;
DROP TABLE SALES_EXECUTIVE;
DROP TABLE CUSTOMER;
DROP TABLE SE_CATEGORY;
DROP TABLE LOCATION;     
DROP TABLE ORDER_T;
DROP TABLE ORDER_PRODUCT;



-- View for order details along with its product details:
CREATE VIEW ORDER_DETAIL AS ( SELECT OT.ORDER_ID, OT.SID, OT.CID, OPD.PCODE, OPD.PNAME, OPD.UNITS, OT.DOP FROM ORDER_T OT INNER JOIN
(SELECT ORDER_ID, OP.PCODE, PNAME, UNITS FROM ORDER_PRODUCT OP INNER JOIN PRODUCT P ON P.PCODE = OP.PCODE) OPD ON OPD.ORDER_ID = OT.ORDER_ID);

SELECT * FROM ORDER_DETAIL;
DROP VIEW ORDER_DETAIL;


-- View for products that is sold on chennai in last seven days with units:
CREATE VIEW TEMP AS (SELECT PCODE, DOP, SUM(UNITS) UNITS FROM ORDER_DETAIL OD INNER JOIN (SELECT CID FROM CUSTOMER WHERE LCODE = "L101") CT ON CT.CID = OD.CID AND OD.DOP > NOW() - INTERVAL 1 WEEK GROUP BY PCODE, DOP);

select * from temp;
DROP VIEW TEMP;

-- Final Query - -- sales persons details along with the count of products sold by them.
SELECT T.DOP, P.PNAME, T.MAX_UNITS FROM PRODUCT P JOIN 
	(SELECT TEMP.DOP, TEMP.PCODE, T.MAX_UNITS FROM TEMP JOIN
		(SELECT DOP, MAX(UNITS) MAX_UNITS FROM TEMP GROUP BY DOP) T
			ON T.DOP = TEMP.DOP AND TEMP.UNITS = T.MAX_UNITS) T ON P.PCODE = T.PCODE;


-- sales persons details along with the count of products sold by them.

SELECT SID, COUNT(PCODE) AS PRODUCT_COUNT FROM ORDER_PRODUCT OP JOIN ORDER_T OT ON OP.ORDER_ID = OT.ORDER_ID GROUP BY SID;


SELECT SE.* , IFNULL(S.CNT,0) AS NO_OF_PRODUCT_SOLD FROM SALES_EXECUTIVE SE JOIN 
	(SELECT SID, COUNT(PCODE) AS CNT FROM ORDER_PRODUCT OP JOIN 
		ORDER_T OT ON OP.ORDER_ID = OT.ORDER_ID GROUP BY SID) S
	ON SE.SID = S.SID; 


