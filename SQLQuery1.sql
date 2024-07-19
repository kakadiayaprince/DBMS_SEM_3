create database CSE_B2_423

USE CSE_B2_423

CREATE TABLE DEPOSITE(
ACTNO INT,
CNAME VARCHAR(50),
BNAME VARCHAR(50),
AMOUNT DECIMAL(8,2),
ADATE DATETIME
)

INSERT INTO  DEPOSITE VALUES (101 ,'ANIL' ,'VRCE' ,1000.00 ,'01-MAR-1995'),
                             (102 ,'SUNIL' ,'AJNI' ,5000.00 ,'04-JAN-1996'),
                             (103 ,'MUHUL' ,'KAROLBAGH' ,3500.00 ,'17-NOV-1995'),
							 (104 ,'MADHURI' ,'CHANDI' ,1200.00 ,'17-DEC-1995'),
							 (105 ,'PRAMOD' ,'M.G.ROAD' ,3000.00 ,'27-MAR-1996'),
							 (106 ,'SANDIP' ,'ANDHERI' ,2000.00 ,'31-MAR-1996'),
							 (107 ,'SIVANI' ,'VIRAR' ,1000.00 ,'05-OCT-1995'),
							 (108 ,'KRANTI' ,'NEHRU PLACE ',5000.00 ,'02-JUL-1995'),
							 (109 ,'MINU' ,'POWAI' ,7000.00 ,'10-SEP-1995')

CREATE TABLE BRANCH(
-BNAME VARCHAR(50),
CITY VARCHAR(50)
);

INSERT INTO BRANCH VALUES  
('VRCE' ,'NAGPUR'),
('AJNI' ,'NAGPUR'),
('KAROLBAGH' ,'DELHI'),
('CHANDI' ,'DELHI'),
('DHARAMPETH' ,'NAGPUR'),
('M.G. ROAD','BANGLORE'),
('ANDHERI' ,'BOMBAY'),
('VIRAR ','BOMBAY'),
('NEHRU' ,'PLACE DELHI'),
('POWAI' ,'BOMBAY')


CREATE TABLE CUSTOMERS(
CNAME VARCHAR(50),
CITY VARCHAR(50)
)

INSERT INTO CUSTOMERS VALUES  
('ANIL' ,'CALCUTTA'),
('SUNIL' ,'DILHI'),
('MEHUL' ,'BARODA'),
('MANDAR' ,'PATNA'),
('MADHURI' ,'NAGPUR'),
('PRAMOD','NAGPUR'),
('SANDIP' ,'SURAT'),
('SHIVANI ','BOMBAY'),
('KRANTI' ,'BOMBAY'),
('NAREN' ,'BOMBAY')

CREATE TABLE BORROW(
LOANNO INT,
CNAME VARCHAR(50),
BNAME VARCHAR(50),
AMOUNT DECIMAL(8,2)
);


INSERT INTO  BORROW VALUES

(201 ,'ANIL' ,'VRCE' ,1000.00 ),
 (206 ,'MUHUL' ,'AJNI' ,5000.00 ),
  (311 , 'SUNIL','DHARAMPETH' ,3000.00 ),
   (321 ,'MADHURI' ,'ANDHERI' ,2000.00 ),
	(375 ,'PRAMOD' ,'VIRAR' ,8000.00 ),
     (481 ,'KRANTI' ,'NEHRU PLACE' ,3000.00 )
	 


-- QUERIES LAB_2_PART_A

SELECT * FROM DEPOSITE
SELECT * FROM BORROW
SELECT * FROM CUSTOMERS
SELECT ACTNO,CNAME,AMOUNT FROM DEPOSITE
SELECT LOANNO,AMOUNT FROM BORROW
SELECT * FROM BORROW WHERE BNAME='ANDHERI'
SELECT ACTNO,AMOUNT FROM DEPOSITE WHERE ACTNO=106
SELECT CNAME FROM BORROW WHERE AMOUNT>5000
SELECT CNAME FROM DEPOSITE WHERE ADATE>'01-DEC-1996'
SELECT CNAME FROM DEPOSITE WHERE ACTNO<105
SELECT CNAME FROM CUSTOMERS WHERE  CITY IN ('NAGPUR','DELHI')
SELECT CNAME,BNAME FROM DEPOSITE WHERE AMOUNT >4000 AND ACTNO<105
SELECT * FROM BORROW WHERE AMOUNT>=3000 AND AMOUNT<=8000
SELECT * FROM BORROW WHERE AMOUNT BETWEEN 3000 AND 8000 -- SAME QUERIES AS ABOVE
SELECT * FROM DEPOSITE WHERE BNAME <> 'ANDHERI'
SELECT ACTNO,CNAME,AMOUNT FROM DEPOSITE WHERE BNAME IN ('AJNI','KAROLBAGH','M.G. ROAD ') AND ACTNO<104



-- QUERIES LAB_2_PART_B

SELECT TOP 5 * FROM DEPOSITE
SELECT TOP 3 * FROM DEPOSITE WHERE AMOUNT>1000
SELECT TOP 5 LOANNO,CNAME FROM BORROW WHERE BNAME <> 'ANDHERI'
SELECT DISTINCT CITY FROM CUSTOMERS 
SELECT DISTINCT BNAME FROM BRANCH


-- QUERIES LAB_2_PART_C

SELECT TOP 50 PERCENT * FROM BORROW
SELECT TOP 10 PERCENT AMOUNT FROM DEPOSITE
SELECT TOP 25 PERCENT * FROM DEPOSITE WHERE AMOUNT>5000
SELECT TOP 10 PERCENT AMOUNT FROM BORROW
SELECT DISTINCT CNAME,CITY FROM CUSTOMERS
SELECT *, AMOUNT + (AMOUNT * 0.1)AS INCREMENTCOLUME FROM BORROW
SELECT LOANNO FROM BORROW WHERE  (LOANNO%2=0) -- FOR EVEN
SELECT LOANNO FROM BORROW WHERE  (LOANNO%2<>0) -- FOR ODD




------ LAB_3------

--PART_A

CREATE TABLE CRICKET(
PNAME VARCHAR(50),
CITY VARCHAR(50),
AGE INT
);

INSERT INTO CRICKET VALUES
('Sachin Tendulkar', 'Mumbai' ,30),
('Rahul Dravid ','Bombay' ,35),
('M. S. Dhoni ','Jharkhand' ,31),
('Suresh Raina' ,'Gujarat', 30)


SELECT * INTO WORLDCUP FROM CRICKET 
SELECT PNAME,CITY INTO T20 FROM CRICKET WHERE 1=0
SELECT * INTO IPL FROM CRICKET WHERE 1=0






--PART_B

CREATE TABLE EMPLOYEE
(
ENAME VARCHAR(50),
CITY VARCHAR(50),
AGE INT
);

INSERT INTO EMPLOYEE VALUES
('Jay Patel', 'Rajkot ' ,30),
('Rahul Dave ','Baroda ' ,35),
('Jeet Pate ','Surat' ,31),
('Vijay Raval ' ,'Rajkot ', 30)


SELECT * INTO EMPLOYEE_DETAIL FROM EMPLOYEE
SELECT ENAME,CITY INTO EMPLOYEE_DATA FROM EMPLOYEE WHERE 1=0
SELECT * INTO EMPLOYEE_INFO FROM EMPLOYEE WHERE 1=0

--PART_C

INSERT INTO EMPLOYEE_INFO SELECT * FROM EMPLOYEE
WHERE CITY ='Rajkot'

INSERT INTO EMPLOYEE_INFO SELECT * FROM EMPLOYEE
WHERE AGE>32



------UPDATE-----

---PART_A
UPDATE DEPOSITE
SET AMOUNT=5000
WHERE AMOUNT=3000

UPDATE BORROW
SET BNAME=' C.G. ROAD'
WHERE BNAME='VRCE'

UPDATE DEPOSITE
SET ACTNO=111,AMOUNT=5000
WHERE CNAME='SANDIP'

UPDATE DEPOSITE
SET AMOUNT=7000
WHERE CNAME='KRANTI'

UPDATE BRANCH
SET CITY='ANDHERI WEST'
WHERE CITY='ANDHERI'


UPDATE DEPOSITE
SET BNAME='NAHRU PALACE'
WHERE CNAME='MEHUL'

UPDATE DEPOSITE
SET AMOUNT =5000
WHERE ACTNO BETWEEN 103 AND 107


UPDATE DEPOSITE
SET ADATE ='1995-04-01'
WHERE CNAME='ANIL'


UPDATE DEPOSITE
SET AMOUNT=10000
WHERE CNAME='MINU'


UPDATE DEPOSITE
SET AMOUNT=5000,ADATE ='1996-04-01'
WHERE CNAME='PRAMOD'



--PART_B


UPDATE BORROW
SET AMOUNT=(AMOUNT+AMOUNT*0.1)


UPDATE DEPOSITE
SET AMOUNT=(AMOUNT+AMOUNT*0.2)


--PART_C

UPDATE BORROW
SET AMOUNT=NULL
WHERE LOANNO=321

UPDATE BORROW
SET BNAME=NULL
WHERE CNAME='KRANTI'

SELECT BNAME FROM BORROW WHERE BNAME IS NULL

SELECT BNAME FROM BORROW WHERE BNAME <> NULL

--- INCOMPLATE--



-----LAB_4-----


--PART_A

 --1.Add two more columns City VARCHAR (20) and Pincode INT
ALTER TABLE DEPOSITE 
ADD CITY VARCHAR(20),PINCODE INT

 --2.Change the size of CNAME column from VARCHAR (50) to VARCHAR (35).
ALTER  TABLE DEPOSITE 
ALTER COLUMN CNAME VARCHAR(35)

 --3.Change the data type DECIMAL to INT in amount Column.
EXEC SP_RENAME 'DEPOSITE.ACTNO', 'ANO'

--4. Rename Column ActNo to ANO.
ALTER TABLE DEPOSITE 
ALTER COLUMN AMOUNT INT

--5. Delete Column City from the DEPOSIT table.
ALTER TABLE DEPOSITE 
DROP COLUMN CITY

--6. Change name of table DEPOSIT to DEPOSIT_DETAIL.
EXEC SP_RENAME 'DEPOSITE','DEPOSITE_DETAIL'

--PART_B

--1. Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table.
EXEC SP_RENAME 'DEPOSITE_DETAIL.ADATE', 'AOPENDATE'

--2. Delete Column AOPENDATE from the DEPOSIT_DETAIL table.
ALTER TABLE DEPOSITE_DETAIL 
DROP COLUMN AOPENDATE

--3. Rename Column CNAME to CustomerName.
EXEC SP_RENAME 'DEPOSITE_DETAIL.CNAME', 'CustomerName'


--PART_C
CREATE TABLE STUDENT_DETAIL(
ENROLLMENT_NO VARCHAR(20),
NAME VARCHAR(25),
CPI DECIMAL(5,2),
BIRTHDATE DATETIME
)

--1. Add two more columns City VARCHAR (20) (Not null) and Backlog INT (Null).
ALTER TABLE STUDENT_DETAIL 
ADD CITY VARCHAR(20) NOT NULL,BACKLOG INT NULL

--2. Change the size of NAME column of student_detail from VARCHAR (25) to VARCHAR (35).
ALTER  TABLE STUDENT_DETAIL 
ALTER COLUMN  NAME  VARCHAR(25)

--3. Change the data type DECIMAL to INT in CPI Column.
ALTER  TABLE STUDENT_DETAIL 
ALTER COLUMN  CPI  INT

--4. Rename Column Enrollment_No to ENO.
EXEC SP_RENAME 'STUDENT_DETAIL.ENROLLMENT_NO', 'ENO'

--5. Delete Column City from the student_detail table.
ALTER TABLE STUDENT_DETAIL 
DROP COLUMN CITY

--6. Change name of table student_detail to STUDENT_MASTER.
EXEC SP_RENAME 'STUDENT_DETAIL', 'STUDENT_MASTER'


-----DELETE, Truncate, Drop Operation


--PART_A


--1. Delete all the records of DEPOSIT_DETAIL table having amount greater than and equals to 4000. 
DELETE FROM DEPOSITE_DETAIL
WHERE AMOUNT>=4000


--2. Delete all the accounts CHANDI BRANCH
DELETE FROM DEPOSITE_DETAIL
WHERE BNAME='CHANDI'


--3. Delete all the accounts having account number (ANO) is greater than 105.
DELETE FROM DEPOSITE_DETAIL
WHERE ANO>105


--4. Delete all the records of Deposit_Detail table. (Use Truncate)
TRUNCATE TABLE DEPOSITE_DETAIL


--5. Remove Deposit_Detail table. (Use Drop)
DROP TABLE DEPOSITE_DETAIL


--PART_B
--CREATE TABLE EMPLOYEE_MASTER(
--EMPNO INT,
--EMPNAME VARCHAR(25),
--JOININGDATE DATETIME,
--SALARY DECIMAL (8,2),
--CITY VARCHAR(20)
--)



--LAB_5

CREATE TABLE STUDENT(
STUID INT,
FIRSTNAME VARCHAR(25),
LASTNAME VARCHAR(25),
WEBSITE VARCHAR(50),
CITY VARCHAR(25),





ADDRESS VARCHAR(100)
)


INSERT INTO STUDENT VALUES 
(1011, 'Keyur','Patel', 'techonthenet.com', 'Rajkot', 'A-303 ''Vasant Kunj'',Rajkot'),
(1022,'Hardik', 'Shah', 'digminecraft.com','Ahmedabad', '"Ram Krupa", Raiya Road'),
(1033, 'Kajal', 'Trivedi', 'bigactivities.com', 'Baroda', 'Raj bhavan plot,neargarden'),
(1044, 'Bhoomi','Gajera', 'checkyourmath.com', 'Ahmedabad','"Jig''s Home",Narol'),
(1055, 'Harmit','Mitel', '@me.darshan.com', 'Rajkot',' B-55,Raj Residency'),
(1066, 'Ashok','Jani', NULL, 'Baroda', 'A502, Club House Building')

EXEC SP_RENAME 'STUDENT.FRISTNAME', 'FIRSTNAME'


--1 Display the name of students whose name starts with ‘k’.
SELECT FIRSTNAME FROM STUDENT
WHERE FIRSTNAME LIKE 'K%';

--2 Display the name of students whose name consists of five characters
SELECT FIRSTNAME FROM STUDENT
WHERE FIRSTNAME LIKE '_____';

--3 Retrieve the first name & last name of students whose city name ends with a & contains six characters.
SELECT FIRSTNAME,LASTNAME FROM STUDENT
WHERE CITY LIKE '_____a';

--4 Display all the students whose last name ends with ‘tel’.
SELECT * FROM STUDENT
WHERE LASTNAME LIKE '%tel';

--5 Display all the students whose first name starts with ‘ha’ & ends with‘t’.
SELECT * FROM STUDENT
WHERE FIRSTNAME LIKE 'Ha%t';

--6 Display all the students whose first name starts with ‘k’ and third character is ‘y’.
SELECT * FROM STUDENT
WHERE FIRSTNAME LIKE 'K_y%';

--7 Display the name of students having no website and name consists of five characters.
SELECT FIRSTNAME FROM STUDENT
WHERE WEBSITE IS NULL AND FIRSTNAME LIKE '_____';

--8 Display all the students whose last name consist of ‘jer’. 
SELECT * FROM STUDENT
WHERE LASTNAME LIKE '%jer%';

--9 Display all the students whose city name starts with either ‘r’ or ‘b’.
SELECT * FROM STUDENT
WHERE CITY LIKE '[r,b]%';

--10 Display all the name students having websites.
SELECT * FROM STUDENT
WHERE WEBSITE IS NOT NULL

--11 Display all the students whose name starts from alphabet A to H.
SELECT * FROM STUDENT
WHERE FIRSTNAME LIKE '[A-H]%';

--12 Display all the students whose name’s second character is vowel.
SELECT * FROM STUDENT
WHERE FIRSTNAME LIKE '_[A,E,I,O,U]%';

--13 Display the name of students having no website and name consists of minimum five characters.
SELECT FIRSTNAME FROM STUDENT
WHERE WEBSITE IS NULL AND FIRSTNAME LIKE '_____%';

--14 Display all the students whose last name starts with ‘Pat’. 
SELECT * FROM STUDENT
WHERE LASTNAME LIKE 'Pat%';

--15 Display all the students whose city name does not starts with ‘b’.
SELECT * FROM STUDENT
WHERE CITY NOT LIKE 'B%';

--PART_B


--1. Display all the students whose name starts from alphabet A or H.
SELECT * FROM STUDENT
WHERE FIRSTNAME LIKE '[A,H]%'

--2 Display all the students whose name’s second character is vowel and of and start with H.
SELECT * FROM STUDENT
WHERE FIRSTNAME LIKE 'H[AEIOU]%';

--3 Display all the students whose last name does not ends with ‘a’.
SELECT * FROM STUDENT
WHERE LASTNAME NOT LIKE '%a';

--4 Display all the students whose first name starts with consonant.
SELECT * FROM STUDENT
WHERE FIRSTNAME NOT LIKE '[AEIOU]%';

--5 Display all the students whose website contains .net
SELECT * FROM STUDENT
WHERE WEBSITE LIKE '%.net%';


--PART_C


--1. Display all the students whose address consist of -.
SELECT * FROM STUDENT
WHERE ADDRESS LIKE '%-%'

--2. Display all the students whose address contains single quote or double quote.
SELECT * FROM STUDENT
WHERE ADDRESS LIKE '%[''"]%'
                             --OR--
SELECT * FROM STUDENT
WHERE ADDRESS LIKE '%''%''%' OR ADDRESS LIKE '%"%"%'

--3. Display all the students whose website contains @.
SELECT * FROM STUDENT
WHERE WEBSITE LIKE '%@%'

--4. Display all the names those are either four or five characters.
SELECT * FROM STUDENT
WHERE FIRSTNAME LIKE '____' OR FIRSTNAME LIKE '_____'



--LAB_7--



--PART_A

CREATE TABLE EMP(
EID INT ,
ENAME VARCHAR(20),
DEPARTMENT VARCHAR(20),
SALARY INT,
JOININGDATE DATE,
CITY VARCHAR(25)
)

INSERT INTO EMP VALUES 
(101, 'Rahul', 'Admin', 56000, '1-Jan-1990', 'Rajkot'),
(102, 'Hardik', 'IT', 18000, '25-Sep-1990', 'Ahmedabad'),
(103, 'Bhavin', 'HR', 25000, '14-May-1991', 'Baroda'),
(104, 'Bhoomi', 'Admin', 39000, '8-Feb-1991', 'Rajkot'),
(105, 'Rohit', 'IT', 17000, '23-Jul-1990', 'Jamnagar'),
(106, 'Priya', 'IT', 9000, '18-Oct-1990', 'Ahmedabad'),
(107,'Bhoomi', 'HR', 34000, '25-Dec-1991', 'Rajkot')




--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.
SELECT 
MAX(SALARY) AS MAXIMUM_SALARY,
MIN(SALARY) AS MINIMUM_SALARY
FROM EMP

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal,respectively.
SELECT 
SUM(SALARY) AS Total_Sal,
AVG(SALARY) AS Average_Sal
FROM EMP

--3. Find total number of employees of EMPLOYEE table.
SELECT COUNT(EID) AS TOTAL_NO_OF_EMPLOYEE FROM EMP

--4. Find highest salary from Rajkot city.
SELECT MAX(SALARY) AS MAXIMUM_SALARY_OF_RAJKOT FROM EMP 
WHERE CITY = 'RAJKOT'

--5. Give maximum salary from IT department.
SELECT MAX(SALARY) AS MAX_SAL_IT FROM EMP WHERE DEPARTMENT = 'IT'

--6. Count employee whose joining date is after 8-feb-91.
SELECT COUNT(EID) AS NO_OF_EMP_JOIN FROM EMP WHERE JOININGDATE > '08-feb-1991'

--7. Display average salary of Admin department.
SELECT AVG(SALARY) AS AVG_SAL_ADMIN FROM EMP WHERE DEPARTMENT ='ADMIN'

--8. Display total salary of HR department.
SELECT SUM(SALARY) AS TOTAl_SAL_HR FROM EMP WHERE DEPARTMENT ='HR'

--9. Count total number of cities of employee without duplication.
SELECT COUNT(DISTINCT CITY) FROM EMP

--10. Count unique departments.
SELECT COUNT(DISTINCT DEPARTMENT) FROM EMP

--11. Give minimum salary of employee who belongs to Ahmedabad.
SELECT MIN(SALARY) AS MIN_SAL FROM EMP WHERE CITY = 'Ahmedabad'

--12. Find city wise highest salary.
SELECT CITY, MAX(SALARY) AS MAX_SAL_CITYWISE  FROM EMP GROUP BY CITY

--13. Find department wise lowest salary.
SELECT DEPARTMENT, MIN(SALARY) AS MIN_SAL_DEPARTMENTWISE  FROM EMP GROUP BY DEPARTMENT

--14. Display city with the total number of employees belonging to each city.
SELECT CITY, COUNT(EID) AS TOTAL_NO_EMP  FROM EMP GROUP BY CITY

--15. Give total salary of each department of EMP table.
SELECT DEPARTMENT , SUM(SALARY)  TOTAL_SAL_DEPARTMENTWISE  FROM EMP GROUP BY DEPARTMENT 

--16. Give average salary of each department of EMP table without displaying the respective department name.
SELECT DEPARTMENT , AVG(SALARY)  AVG_SAL_DEPARTMENTWISE  FROM EMP GROUP BY DEPARTMENT 


--PART_B--

--1. Count the number of employees living in Rajkot.
SELECT  COUNT(EID) AS NO_EMP_LIVEIN_RAJKOT FROM EMP WHERE CITY = 'RAJKOT'

--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
SELECT (MAX(SALARY)) - (MIN(SALARY)) AS DIFFERENCE FROM EMP 

--3. Display the total number of employees hired before 1st January, 1991
SELECT COUNT(EID) AS HIRED_AFTER FROM EMP WHERE JOININGDATE < '01-JAN-1991'


--PART_C--
SELECT ENAME ,DEPARTMENT, MAX(SALARY) AS MAX_SAL FROM EMP 
GROUP BY ENAME,DEPARTMENT


1. Count the number of employees living in Rajkot or Baroda.
2. Display the total number of employees hired before 1st January, 1991 in IT department.
3. Find the Joining Date wise Total Salaries.
4. Find the Maximum salary department & city wise in which city name starts with ‘R’.
