create database bankingDB;
use bankingDB; 
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address TEXT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    AccountNumber VARCHAR(20) UNIQUE NOT NULL,
    AccountType ENUM('SAVINGS', 'CURRENT') DEFAULT 'SAVINGS',
    Balance DECIMAL(15, 2) DEFAULT 0.00,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

CREATE TABLE Operations (
    OperationID INT PRIMARY KEY AUTO_INCREMENT,
    FromAccountID INT,
    ToAccountID INT,
    Amount DECIMAL(15, 2) NOT NULL,
    OperationType ENUM('TRANSFER', 'DEPOSIT', 'WITHDRAWAL') NOT NULL,
    OperationDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Status ENUM('PENDING', 'SUCCESS', 'FAILED') DEFAULT 'SUCCESS',
    FOREIGN KEY (FromAccountID) REFERENCES Accounts(AccountID),
    FOREIGN KEY (ToAccountID) REFERENCES Accounts(AccountID)
);


INSERT INTO Customers (FullName, Email, Phone, Address)VALUES 
('Ravi Tambade', 'ravi@example.com', '9876543210', 'Pune, Maharashtra'),
('sarthak Kadam', 'sarthak@123.com', '9988776655', 'kolhapur, Maharashtra'),
(' sanika bhor', 'sanika@123.com', '9123456780', 'pune, Maharashtra'),
('saurabh sawant', 'saurabhsawant@123.com', '9123454576', 'sangli, Maharashtra');



INSERT INTO Accounts (CustomerID, AccountNumber, AccountType, Balance)VALUES 
(1, 'ACC1001', 'SAVINGS', 50000.00),
(1, 'ACC1002', 'CURRENT', 150000.00),
(2, 'ACC2001', 'SAVINGS', 25000.00),
(3, 'ACC3001', 'CURRENT', 80000.00),
(4, 'ACC4001', 'SAVINGS', 90000.00);

INSERT INTO Operations (FromAccountID, ToAccountID, Amount, OperationType)
VALUES 
(1, 3, 5000.00, 'TRANSFER');

INSERT INTO Operations (FromAccountID, ToAccountID, Amount, OperationType)
VALUES 
(NULL, 4, 10000.00, 'DEPOSIT');

INSERT INTO Operations (FromAccountID, ToAccountID, Amount, OperationType)
VALUES 
(2, NULL, 7000.00, 'WITHDRAWAL');

SELECT c.FullName, a.AccountNumber, a.Balance
FROM Customers c
JOIN Accounts a ON c.CustomerID = a.CustomerID;

-- View all transactions
SELECT o.OperationID, a1.AccountNumber AS FromAcc, a2.AccountNumber AS ToAcc, 
       o.Amount, o.OperationType, o.OperationDate
FROM Operations o
LEFT JOIN Accounts a1 ON o.FromAccountID = a1.AccountID
LEFT JOIN Accounts a2 ON o.ToAccountID = a2.AccountID;
DROP PROCEDURE IF EXISTS fundtransfer;

DELIMITER //
CREATE PROCEDURE fundtransfer( in ToAccountID INT, in FromAccountID INT, in amount INT )
BEGIN

UPDATE 
  accounts 
SET 
  balance = balance - amount 
WHERE 
  accountID= FromAccountID;
  
UPDATE 
  accounts 
SET 
  balance = balance + amount 
WHERE 
  AccountID = ToAccountID ;

IF (SELECT balance FROM accounts WHERE accountID = FromAccountID ) < 0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "error";
ELSE
        INSERT INTO operations (FromAccountID, amount,OperationType) VALUES (FromAccountID, -amount, 'WITHDRAWAL');
        INSERT INTO operations (ToAccountID, amount, OperationType) VALUES (ToAccountID, amount, 'DEPOSIT');
        
        END IF;
END// 

DELIMITER ;

call fundtransfer(3,1,2000);