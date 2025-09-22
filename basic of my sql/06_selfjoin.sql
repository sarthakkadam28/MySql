drop table employee;
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmpID)
);
INSERT INTO Employees (EmpID, EmpName, ManagerID) VALUES
(1, 'Rahul', NULL),     -- Top-level manager (CEO)
(2, 'Sita', 1),
(3, 'Amit', 1),
(4, 'Priya', 2),
(5, 'Karan', 3),
(6, 'Anjali', 3);

select EmpID e from Employees left join ManagerID m on e.EmpID = m.ManagerID;