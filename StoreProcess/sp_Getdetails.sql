DELIMITER //
CREATE PROCEDURE GetOrderDetails(
    IN p_orderId INT
)
BEGIN
    SELECT o.OrderID, c.CustomerName, p.ProductName, oi.Quantity, oi.Price
    FROM Orders o
    JOIN Customers c ON o.CustomerID = c.CustomerID
    JOIN OrderItems oi ON o.OrderID = oi.OrderID
    JOIN Products p ON oi.ProductID = p.ProductID
    WHERE o.OrderID = p_orderId;
END //
DELIMITER ;

CALL GetOrderDetails(1001);