DELIMITER //

CREATE PROCEDURE AddCustomer(
    IN p_name VARCHAR(100),
    IN p_email VARCHAR(100)
)
BEGIN
    INSERT INTO customers (name, email) VALUES (p_name, p_email);--we can add more fields as per requirement
END //

DELIMITER ;
call AddCustomer("sarthak","sarthakkadam72@gamil.com");
call AddCustomer("sanika","sanikabhaor@gmail.com");
call AddCustomer("sumit","sumitbhor@gmail.com");
call AddCustomer("ravisir","ravitambade@gmail");
drop procedure AddCustomer;

DELIMITER //
