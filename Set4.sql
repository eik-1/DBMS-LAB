CREATE TABLE Department(
    DeptId VARCHAR(2) PRIMARY KEY,
    Dname VARCHAR(20)
);

CREATE TABLE Employee(
    Eid VARCHAR(6) PRIMARY KEY,
    Ename VARCHAR(20),
    DeptId VARCHAR(2),
    Designation VARCHAR(20),
    Salary INT CHECK (Salary > 10000),
    DOJ DATE,
    FOREIGN KEY (DeptId) REFERENCES Department(DeptId) 
);

INSERT INTO Department (DeptId, Dname) 
VALUES ('D1', 'Sales');

INSERT INTO Department (DeptId, Dname) 
VALUES ('D2', 'Marketing');

INSERT INTO Department (DeptId, Dname) 
VALUES ('D3', 'Finance');

INSERT INTO Employee (Eid, Ename, DeptId, Designation, Salary, DOJ)
VALUES ('101', 'Sudha', 'D2', 'Clerk', 20000, '01-Apr-10');

INSERT INTO Employee (Eid, Ename, DeptId, Designation, Salary, DOJ)
VALUES ('102', 'David', 'D1', 'Manager', 50000, '18-Feb-18');

INSERT INTO Employee (Eid, Ename, DeptId, Designation, Salary, DOJ)
VALUES ('103', 'Preethi', 'D3', 'Clerk', 35000, '13-Jun-11');

INSERT INTO Employee (Eid, Ename, DeptId, Designation, Salary, DOJ)
VALUES ('104', 'Kiran', 'D1', 'Salesman', 20000, '7-Mar-14');

INSERT INTO Employee (Eid, Ename, DeptId, Designation, Salary, DOJ)
VALUES ('105', 'Meenal', 'D2', 'Clerk', 50000, '9-Dec-11');

INSERT INTO Employee (Eid, Ename, DeptId, Designation, Salary, DOJ)
VALUES ('106', 'Sunitha', 'D3', 'Manager', 60000, '25-Sep-18');

INSERT INTO Employee (Eid, Ename, DeptId, Designation, Salary, DOJ)
VALUES ('107', 'Akhil', 'D3', 'Clerk', 25000, '14-Feb-16');

INSERT INTO Employee (Eid, Ename, DeptId, Designation, Salary, DOJ)
VALUES ('108', 'Sushma', 'D2', 'Manager', 45000, '31-Jan-12');


//Q1
SELECT * FROM Employee
WHERE Salary > (
    SELECT AVG(Salary) FROM Employee
);

//Q2
SELECT e.Eid, e.Ename, d.Dname
FROM Employee e
JOIN Department d ON e.DeptId = d.DeptId;

//Q3
SELECT *
FROM Employee
ORDER BY Salary DESC

//Q4
SELECT DISTINCT(Designation) AS Post
FROM Employee;

//Q5
SELECT * FROM Employee
ORDER BY DeptId, Salary

//Q6
SELECT * 
FROM Employee
WHERE Designation='Clerk' AND DeptId='D2'

//Q7
SELECT * 
FROM Employee
WHERE DOJ>='1-Jan-2011' AND DOJ<'1-Jan-2012'

//Q8
SELECT * 
FROM Employee
WHERE EXTRACT(MONTH FROM DOJ) = 2

//Q9
SELECT * 
FROM Employee
WHERE Salary > 30000 AND Salary < 45000

//Q10
SELECT Eid, Ename, DeptId, Designation, Salary, DOJ, FLOOR(MONTHS_BETWEEN(SYSDATE, DOJ) / 12) AS Work_Experience
FROM Employee;
