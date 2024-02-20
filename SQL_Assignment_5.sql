--Task 1:-
--1.Create University Database give any University name you want

CREATE DATABASE MEV_UNIVERSITY

--2. Under this University Create four tables and each table should have following three Column named as:-
      --	A. College_Table
      --	   College_ID(PK)
      --	   College_Name
      --       College_Area 
	  --    B. Department_Table
	  --       Dept_ID(PK)
	  --       Dept_Name
	  --       Dept_Facility

	  --    C. Professor_Table
	  --	   Professor_ID(PK)
	  --       Professor_Name
	  --       Professor_Subject
	  --    D. Student_Table
      --       Student_ID(PK)
	  --       Student_Name
	  --       Student_Stream
--3. Apply foreign key on Department key from College_table
--4. Apply foreign Key on Student_Table from Professor_Table

USE MEV_UNIVERSITY
GO

CREATE TABLE College_Table (
  College_ID INT PRIMARY KEY,
  College_Name VARCHAR(50) NOT NULL,
  College_Area VARCHAR(50) NOT NULL
);

CREATE TABLE Department_Table (
  Dept_ID INT PRIMARY KEY,
  Dept_Name VARCHAR(50) NOT NULL,
  Dept_Facility VARCHAR(100),
  College_ID INT NOT NULL,
  FOREIGN KEY (College_ID) REFERENCES College_Table(College_ID)
);

CREATE TABLE Professor_Table (
  Professor_ID INT PRIMARY KEY,
  Professor_Name VARCHAR(50) NOT NULL,
  Professor_Subject VARCHAR(50) NOT NULL
);

CREATE TABLE Student_Table (
  Student_ID INT PRIMARY KEY,
  Student_Name VARCHAR(50) NOT NULL,
  Student_Stream VARCHAR(50) NOT NULL,
  Professor_ID INT,
  FOREIGN KEY (Professor_ID) REFERENCES Professor_Table(Professor_ID)
);


--5. Insert atleast 10 Records in each table




--Insert data into College_Table
INSERT INTO College_Table (College_ID, College_Name, College_Area)
VALUES (1, 'Central University', 'Main Campus'),
       (2, 'Engineering College', 'Tech Park'),
       (3, 'Medical College', 'Hospital Road');
	   (4, 'Law College', 'Judicial Complex'),
       (5, 'Business School', 'Financial District'),
       (6, 'Art Institute', 'Cultural Center'),
       (7, 'Agriculture College', 'Rural Area'),
       (8, 'Music Conservatory', 'Performing Arts District'),
       (9, 'Engineering College', 'Tech Zone'),
       (10, 'Language Institute', 'International District');
-- Insert data into Department_Table
INSERT INTO Department_Table (Dept_ID, Dept_Name, Dept_Facility, College_ID)
VALUES (1, 'Computer Science', 'Advanced Labs', 1),
       (2, 'Electronics', 'Research Labs', 2),
       (3, 'Medicine', 'Hospital Facilities', 3),
       (4, 'Nursing', 'Simulation Labs', 3);
	   (5, 'Law', 'Courtroom Simulation Labs', 4),
       (6, 'Finance', 'Trading Floor Simulation', 5),
       (7, 'Fine Arts', 'Art Studios and Galleries', 6),
       (8, 'Agronomy', 'Research Farms and Greenhouses', 7),
       (9, 'Performance', 'Concert Halls and Practice Rooms', 8),
       (10, 'Software Engineering', 'Advanced Robotics Labs', 9);

-- Insert data into Professor_Table
INSERT INTO Professor_Table (Professor_ID, Professor_Name, Professor_Subject)
VALUES (1, 'Dr. Smith', 'Software Engineering'),
       (2, 'Dr. Jones', 'Microelectronics'),
       (3, 'Dr. Lee', 'Cardiology'),
       (4, 'Dr. Brown', 'Anesthesiology');
	   (5, 'Dr. Williams', 'Constitutional Law'),
       (6, 'Dr. Miller', 'Investment Banking'),
       (7, 'Dr. Garcia', 'Sculpture'),
       (8, 'Dr. Patel', 'Sustainable Agriculture'),
       (9, 'Dr. Johnson', 'Piano Performance'),
       (10, 'Dr. Chen', 'Artificial Intelligence');

-- Insert data into Student_Table
INSERT INTO Student_Table (Student_ID, Student_Name, Student_Stream, Professor_ID)
VALUES (1, 'John Doe', 'CS', 1),
       (2, 'Jane Doe', 'Electronics', 2),
       (3, 'Alice Smith', 'Medicine', 3),
       (4, 'Bob Jones', 'Nursing', 4),
       (5, 'Mary Lopez', 'CS', 1),
       (6, 'David Lee', 'Electronics', 2),
       (7, 'Susan Brown', 'Medicine', 3),
       (8, 'Michael Clark', 'Nursing', 4),
       (9, 'Emily Williams', 'CS', 1),
       (10, 'Daniel Johnson', 'Electronics', 2);

--Task2
--1.	Give the information of College_ID and College_name from College_Table
SELECT College_ID, College_Name
FROM   College_Table;

--2.	Show  Top 5 rows from Student table.
SELECT TOP 5 * 
FROM   Student_Table ;


--3.	What is the name of  professor  whose ID  is 5
SELECT Professor_Table .Professor_Name 
FROM   Professor_Table 
WHERE  Professor_Table.Professor_ID =5




--4.	Convert the name of the Professor into Upper case 
SELECT UPPER(Professor_Table .Professor_Name )
FROM   Professor_Table 
WHERE  Professor_Table.Professor_ID =5



--5.	Show me the names of those students whose name is start with a
SELECT Student_Table .Student_Name 
FROM   Student_Table 
WHERE  Student_Name LIKE 'a%'



--6.	Give the name of those colleges whose end with a
SELECT College_Table.College_Name 
FROM   College_Table 
WHERE  College_Name LIKE '%y'



--7.	 Add one Salary Column in Professor_Table

ALTER TABLE PROFESSOR_TABLE ADD Salary decimal(15,2) 

--8.	Add one Contact Column in Student_table

ALTER TABLE STUDENT_TABLE ADD Contact_Num NUMERIC(13,0)

--9.	Find the total Salary of Professor 
SELECT SUM(Salary) 
AS TOTAL_SALARY
FROM Professor_Table 


--10.	Change datatype of any one column of any one Table
ALTER TABLE PROFESSOR_TABLE
ALTER COLUMN SALARY NUMERIC(15,2) ;





--Task 3:-
--1.	Show first 5 records from Students table and Professor table Combine

SELECT TOP 5 * 
FROM Student_Table
LEFT JOIN 
PROFESSOR_TABLE 
ON Student_Table.Professor_ID = PROFESSOR_TABLE.Professor_ID


--2.	Apply Inner join on all 4 tables together

SELECT s.Student_ID, s.Student_Name, s.Student_Stream,
       p.Professor_ID, p.Professor_Name, p.Professor_Subject,
       c.College_ID, c.College_Name, c.College_Area,
       d.Dept_ID, d.Dept_Name, d.Dept_Facility
FROM Student_Table s
INNER JOIN Professor_Table  p 
ON s.Professor_ID = p.Professor_ID

INNER JOIN Department_Table  d 
ON p.Professor_ID = d.Dept_ID

INNER JOIN College_Table  c 
ON d.College_ID = c.College_ID;

--3.	Show Some null values from Department table and Professor table.
SELECT *
FROM Department_Table,Professor_Table 
WHERE Dept_Facility IS NULL OR Professor_Name  IS NULL;

--4.	Create a View from College Table  and give those records whose college name starts with C
CREATE VIEW College_Name_Starting_C
AS
SELECT * FROM College_Table WHERE College_Name LIKE 'C%'

--5.	Create Stored Procedure  of Professor table whatever customer ID will be given by user it should show whole records of it.

CREATE PROCEDURE GetProfessorById (@CUSTOMER_id INT)
AS
BEGIN
  SELECT *
  FROM Professor_Table
  WHERE Professor_ID = @CUSTOMER_id ;
END;

EXEC GetProfessorById 4
--6.	Rename the College_Table to College_Tables_Data .


EXEC SP_RENAME 'College_Table','College_Tables_Data';

sp_rename 'College_Table','College_Tables_Data';


