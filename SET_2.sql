CREATE TABLE EmpDetails(
    Eid VARCHAR(6) PRIMARY KEY,
    Ename VARCHAR(20),
    DOB DATE,
    Designation VARCHAR(20),
    Salary INT,
    DOJ Date
);

INSERT INTO EmpDetails VALUES ('E101', 'Suma', '29-Dec-1989', 'Designer', 20000, '01-Apr-2010');

INSERT INTO EmpDetails VALUES ('E102', 'Amit', '10-Jan-1995', 'Programmer', 25000, '18-Feb-2018');

INSERT INTO EmpDetails VALUES ('E103', 'Payal', '15-Aug-1985', 'Tester', 35000, '13-Jun-2011');

INSERT INTO EmpDetails VALUES ('E104', 'Kiran', '20-Apr-1990', 'Programmer', 40000, '07-Mar-2014');

INSERT INTO EmpDetails VALUES ('E105', 'Meenal', '29-May-1983', 'DBA', 50000, '09-Dec-2011');

INSERT INTO EmpDetails VALUES ('E106', 'Sheila', '01-May-1970', 'Analyst', 60000, '25-Sep-2018');

INSERT INTO EmpDetails VALUES ('E107', 'Swamy', '13-Jan-1985', 'Programmer', 45000, '14-Feb-2016');

INSERT INTO EmpDetails VALUES ('E108', 'Sushma', '22-Dec-1976', 'DBA', 45000, '31-Jan-2012');

//Q1
SELECT * FROM EmpDetails
WHERE Designation = 'Programmer';

//Q2
SELECT Ename
FROM EmpDetails
WHERE DOJ >= '1-Jan-2015';

//Q3
SELECT * 
FROM EmpDetails
WHERE Ename LIKE '%a';

//Q4
SELECT Sum(Salary) AS TotalSalary
FROM EmpDetails
WHERE Designation = 'Programmer';

//Q5
SELECT UPPER(Ename) AS NAME
FROM EmpDetails;

//Q6
SELECT * FROM EmpDetails
WHERE DOJ = (
    SELECT MIN(DOJ) 
    FROM EmpDetails
);

//Q7
SELECT *
FROM EmpDetails
WHERE Ename LIKE '%ee%';

//Q8
UPDATE EmpDetails
SET Salary = Salary + 5000
WHERE Designation='DBA';

//Q9
SELECT * FROM EmpDetails
WHERE Salary > (
    SELECT AVG(Salary) FROM EmpDetails
);

//Q10
SELECT Ename || 'is working as ' || Designation || ' with a salary of Rs ' || Salary AS Record
FROM EmpDetails;
