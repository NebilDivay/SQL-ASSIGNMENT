--ASSIGNMENT 1
--Q1)SQL Query to fetch records that are present in one table but not in another table.
SELECT * 
FROM 
EMPLOYEEDETAILS
WHERE 
EmpID NOT IN (
SELECT EmpID FROM EMPLOYEESALARY )

SELECT
EMPLOYEEDETAILS.*
FROM 
EMPLOYEEDETAILS 
LEFT JOIN 
EMPLOYEESALARY 
ON 
EMPLOYEEDETAILS.EmpID = EMPLOYEESALARY.EmpID 
WHERE 
EMPLOYEESALARY.EmpID IS NULL;

--Q2)SQL query to fetch all the employees who are not working on any project.
SELECT 
EMPLOYEEDETAILS.* 
FROM 
EMPLOYEEDETAILS 
WHERE EMPID IN 
(
SELECT 
EMPID 
FROM 
EMPLOYEESALARY 
WHERE
Project IS NULL) 

--Q3)SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020.
SELECT * 
FROM 
EMPLOYEEDETAILS 
WHERE 
YEAR(DATEOFJOINING)=2020

--Q4)Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary.
SELECT 
EMPLOYEEDETAILS.* 
FROM 
EMPLOYEEDETAILS 
WHERE 
EmpID IN 
(
SELECT 
EmpID 
FROM 
EMPLOYEESALARY 
WHERE Salary IS NOT NULL)
--Q5)Write an SQL query to fetch a project-wise count of employees.

SELECT
EMPLOYEESALARY.Project  , 
COUNT(Project) 
AS 
NUMOFEMPLOYEES
FROM 
EMPLOYEEDETAILS 
LEFT JOIN 
EMPLOYEESALARY 
ON
EMPLOYEEDETAILS.EmpID =EMPLOYEESALARY.EmpID 
GROUP BY 
EMPLOYEESALARY.Project 
--Q6)Fetch employee names and salaries even if the salary value is not present for the employee.
SELECT 
EMPLOYEEDETAILS.FullName, 
EMPLOYEESALARY.Salary 
FROM 
EMPLOYEEDETAILS 
LEFT JOIN 
EMPLOYEESALARY 
ON 
EMPLOYEEDETAILS.EmpID =EMPLOYEESALARY.EmpID 
WHERE 
EMPLOYEESALARY.Salary IS NULL 
OR
EMPLOYEESALARY.Salary IS NOT NULL

--Q7)Write an SQL query to fetch all the Employees who are also managers.
SELECT * 
FROM 
EMPLOYEEDETAILS 
WHERE 
EMPLOYEEDETAILS.ManagerId  IS NOT NULL  


--Q8)Write an SQL query to fetch duplicate records from EmployeeDetails.
SELECT 
EmpID, 
FullName 
FROM 
EmployeeDetails
GROUP BY 
EmpID, FullName 
HAVING 
COUNT(* ) > 1;
--Q9)Write an SQL query to fetch only odd rows from the table.

SELECT *
FROM (
  SELECT *, ROW_NUMBER() OVER (ORDER BY EMPID) AS row_num
  FROM EmployeeDetails
) AS NUMBERED_ROWS
WHERE row_num % 2 <> 0;

--Q10)Write a query to find the 3rd highest salary from a table without top or limit keyword.
SELECT *
FROM (
  SELECT *, ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS Salaryposition
  FROM EMPLOYEESALARY
) AS NUMBERED_ROWS
WHERE Salaryposition =1

--ASSIGNMENT 2
 --Ques.1. Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’.
SELECT 
EMPID,
FULLNAME 
FROM 
EMPLOYEEDETAILS 
WHERE 
MANAGERID=986


--Ques.2. Write an SQL query to fetch the different projects available from the EmployeeSalary table.
SELECT 
DISTINCT PROJECT 
FROM EMPLOYEESALARY


--Ques.3. Write an SQL query to fetch the count of employees working in project ‘P1’.
SELECT PROJECT, COUNT(EMPID) AS NUMOFPEOPLE
FROM 
EMPLOYEESALARY 
GROUP BY 
Project 
HAVING 
PROJECT='P1'


--Ques.4. Write an SQL query to find the maximum, minimum, and average salary of the employees.
SELECT 
MAX(SALARY) AS MAXSALARY,
MIN(SALARY) AS MINSALARY,
AVG (SALARY) AS AVGSALARY
FROM EMPLOYEESALARY 


--Ques.5. Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.
SELECT EMPID 
FROM EMPLOYEESALARY 
WHERE 
SALARY BETWEEN 9000 AND 15000


--Ques.6. Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.
SELECT* 
FROM EMPLOYEEDETAILS 
WHERE 
City = 'TORONTO' AND ManagerId =321


--Ques.7. Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.
SELECT* 
FROM EMPLOYEEDETAILS 
WHERE 
City = 'CALIFORNIA' OR ManagerId =321

--Ques.8. Write an SQL query to fetch all those employees who work on Projects other than P1.

SELECT *
FROM EMPLOYEESALARY 
WHERE EMPID NOT IN 
(SELECT EMPID FROM EMPLOYEESALARY WHERE Project = 'P1')
--Ques.9. Write an SQL query to display the total salary of each employee adding the Salary with Variable value.
SELECT *, 
SALARY + VARIABLE AS TOTALSALARY
FROM EMPLOYEESALARY 


--Ques.10. Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ends with any sequence of characters.

SELECT * 
FROM EMPLOYEEDETAILS 
WHERE
FullName  LIKE '__HN%'







--ASSIGNMENT 3


--Ques.1 Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.
SELECT EmpId
FROM 
EmployeeDetails

UNION

SELECT EmpId
FROM 
EmployeeSalary;

--Ques.2 Write an SQL query to fetch common records between two tables.
SELECT T1.*,T2.*
FROM 
EMPLOYEEDETAILS T1
INNER JOIN 
EMPLOYEESALARY T2 
ON T1.EMPID=T2.EMPID

--Ques.3. Write an SQL query to fetch records that are present in one table but not in another table.

SELECT * 
FROM 
EMPLOYEEDETAILS
WHERE 
EMPID NOT IN (
SELECT EmpID FROM EMPLOYEESALARY )

SELECT T1.*,T2.*
FROM 

EMPLOYEEDETAILS T1
LEFT JOIN 
EMPLOYEESALARY T2 

ON 
T1.EMPID=T2.EMPID

WHERE 
T2.EmpID IS NULL

--Ques.4. Write an SQL query to fetch the EmpIds that are present in both the tables –  ‘EmployeeDetails’ and ‘EmployeeSalary.

SELECT 
EmpID  
FROM 
EMPLOYEEDETAILS
WHERE 
EMPID IN (
SELECT EmpID FROM EMPLOYEESALARY )

SELECT 
EMPLOYEEDETAILS.EmpID 

FROM 
EMPLOYEEDETAILS 

INNER JOIN 
EMPLOYEESALARY 

ON 
EMPLOYEEDETAILS.EmpID =EMPLOYEESALARY.EmpID 
 

--Ques.5. Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary.

SELECT 
EMPLOYEEDETAILS.EmpID 

FROM 
EMPLOYEEDETAILS 

LEFT OUTER JOIN 
EMPLOYEESALARY 

ON 
EMPLOYEEDETAILS.EmpID =EMPLOYEESALARY.EmpID

--Ques.6. Write an SQL query to fetch the employee’s full names and replace the space
SELECT 
REPLACE(FULLNAME,' ','') 
AS 
FULLNAME
FROM 
EMPLOYEEDETAILS


--Ques.7. Write an SQL query to fetch the position of a given character(s) in a field.
	
SELECT 
charindex('20',DATEOFJOINING) 
AS 
POSITION 
FROM 
EMPLOYEEDETAILS


--Ques.8. Write an SQL query to display both the EmpId and ManagerId together.

SELECT 
CONCAT(EMPID,'-',MANAGERID) 
AS 
COMBINED_id 
FROM 
EMPLOYEEDETAILS

--Ques.9. Write a query to fetch only the first name(string before space) from the FullName column of the EmployeeDetails table.
SELECT 

SUBSTRING(fullname,1,charindex(' ',fullname)-1) 
AS 
First_name 

FROM 
EMPLOYEEDETAILS 

SELECT * FROM EMPLOYEEDETAILS 
--Ques.10. Write an SQL query to uppercase the name of the employee and lowercase the city values.
SELECT
UPPER(FULLNAME) 
AS
Upper_name, 
LOWER(city) 
AS 
lower_city

FROM 
EMPLOYEEDETAILS


--ASSIGNMENT 4
--Ques.1. Write an SQL query to find the count of the total occurrences of a particular character – ‘n’ in the FullName field.

SELECT COUNT(*) 
AS total_n_occurrences
FROM 
EMPLOYEEDETAILS
WHERE 
FullName LIKE '%n%';
--Ques.2. Write an SQL query to update the employee names by removing leading and trailing spaces.

UPDATE 
Employeedetails
SET 
fullname = TRIM(fullname);


--Ques.3. Fetch all the employees who are not working on any project.
SELECT * FROM EMPLOYEEDETAILS 

WHERE
EMPID IN 
(
SELECT EMPID FROM EMPLOYEESALARY 
WHERE 
Project IS NULL) 


--Ques.4. Write an SQL query to fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000.
SELECT 
EMPLOYEEDETAILS.FullName 
FROM 
EMPLOYEEDETAILS 
WHERE EmpID IN (
SELECT EMPID FROM EMPLOYEESALARY 
WHERE 
Salary >=5000 
AND 
Salary <=10000)

--Ques.5. Write an SQL query to find the current date-time.
SELECT GETDATE();
SELECT CURRENT_TIMESTAMP ;

--Ques.6. Write an SQL query to fetch all the Employee details from the EmployeeDetails table who joined in the Year 2020.
SELECT * 
FROM 
EMPLOYEEDETAILS 

WHERE 
YEAR(DateOfJoining)=2020

--Ques.7. Write an SQL query to fetch all employee records from the EmployeeDetails table who have a salary record in the EmployeeSalary table.
SELECT EMPLOYEEDETAILS.* 

FROM 
EMPLOYEEDETAILS 
WHERE 
EmpID IN (
SELECT EmpID FROM EMPLOYEESALARY 
WHERE Salary IS NOT NULL)

--Ques.8. Write an SQL query to fetch the project-wise count of employees sorted by project’s count in descending order.
SELECT 
EMPLOYEESALARY.Project, 
COUNT(EMPLOYEESALARY.EMPID) 
AS NUMOFEMPLOYEES 

FROM 
EMPLOYEEDETAILS 
LEFT JOIN 
EMPLOYEESALARY 
ON 
EMPLOYEEDETAILS.EmpID = EMPLOYEESALARY.EmpID 
GROUP BY EMPLOYEESALARY.Project 
ORDER BY NUMOFEMPLOYEES DESC

--Ques.9. Write a query to fetch employee names and salary records. Display the employee details even if the salary record is not present for the employee.
SELECT 
D.FULLNAME, 
S.SALARY 
FROM 
EMPLOYEEDETAILS D 
LEFT JOIN 
EMPLOYEESALARY S 
ON  D.EmpID = S.EmpID 
WHERE SALARY IS NULL OR Salary IS NOT NULL

--Ques.10. Write an SQL query to join 3 tables.
SELECT 
table1.column1, 
table2.column2, 
table3.column3

FROM 
table1
INNER JOIN 
table2 

ON 
table1.common_column = table2.common_column

INNER JOIN 
table3 
ON 
table2.common_column = table3.common_column