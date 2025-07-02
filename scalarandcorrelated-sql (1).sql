
CREATE TABLE People (
    ID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Income INT,
    Job VARCHAR(50)
);
INSERT INTO People (ID, FirstName, LastName, Age, Income, Job) VALUES
(1, 'John', 'Oliver', 25, 50000, 'Lawyer'),
(2, 'James', 'Gates', 31, 80000, 'Lawyer'),
(3, 'Kelly', 'Hill', 27, 90000, 'Doctor'),
(4, 'Alf', 'Loft', 35, 50000, 'Engineer'),
(5, 'Charles', 'Booz', 40, 70000, 'Doctor');

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50),
    Head VARCHAR(50)
);
INSERT INTO Departments (DeptID, DeptName, Head) VALUES
(1, 'Law', 'James Gates'),
(2, 'Medicine', 'Kelly Hill'),
(3, 'Engineering', 'Alf Loft'),
(4, 'Finance', 'Sarah Paul');

-- scalar function
SELECT UPPER(FirstName) FROM People;
SELECT LOWER(FirstName) FROM People;
SELECT LEN(LastName) FROM People;
SELECT SUBSTRING(FirstName, 1, 2) FROM People;
SELECT ROUND((SELECT AVG(Age) FROM People), 0);

-- sub queries
SELECT FirstName, LastName
FROM People
WHERE CONCAT(FirstName, ' ', LastName) IN (
    SELECT Head FROM Departments
);

SELECT * FROM People
WHERE Job IN (
    SELECT DeptName FROM Departments
);

SELECT FirstName, LastName
FROM People p
WHERE EXISTS (
    SELECT 1 FROM Departments d
    WHERE d.Head = CONCAT(p.FirstName, ' ', p.LastName)
);
