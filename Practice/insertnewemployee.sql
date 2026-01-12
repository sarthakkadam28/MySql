DELIMITER //

CREATE PROCEDURE add_employee(
    IN id INT,
    IN name VARCHAR(50),
    IN sal INT,
    IN dept VARCHAR(50)
)
BEGIN
    INSERT INTO employees VALUES (id, name, sal, dept);
END //

DELIMITER ;

CALL add_employee(101, 'Amit', 45000, 'IT');
