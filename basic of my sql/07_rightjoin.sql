CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(50),
    Amount INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- Customers Data
INSERT INTO Customers (CustomerID, Name, City) VALUES
(1, 'Rahul', 'Pune'),
(2, 'Sita', 'Mumbai'),
(3, 'Amit', 'Delhi');

-- Orders Data (सगळे CustomerIDs valid आहेत)
INSERT INTO Orders (OrderID, CustomerID, Product, Amount) VALUES
(101, 1, 'Pen', 20),
(102, 2, 'Notebook', 50);

SELECT 
    c.CustomerID,
    c.Name,
    c.City,
    o.OrderID,
    o.Product,
    o.Amount
FROM 
    Customers c
RIGHT JOIN 
    Orders o ON c.CustomerID = o.CustomerID;
