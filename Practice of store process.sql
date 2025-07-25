drop table if exists customers;
drop table if exists orders;
create database sample ;
use sample ;
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

DELIMITER //

CREATE PROCEDURE AddCustomer(
    IN p_name VARCHAR(100),
    IN p_email VARCHAR(100)
)
BEGIN
    INSERT INTO customers (name, email) VALUES (p_name, p_email);
END //

DELIMITER ;
call AddCustomer("sarthak","sarthakkadam72@gamil.com");
drop procedure AddCustomer;

DELIMITER //
CREATE procedure getordresbycustomer(
in p_customer_id int
)
BEGIN
    select * from orders
	WHERE customer_id =p_customer_id;
	END //
DELIMITER ;
CALL getordresbycustomer(1);
drop procedure getordresbycustomer;

DELIMITER //
create procedure updatecustomeremail(
in p_customer_id int ,
in p_newemail varchar(100)

)
begin 
update customers
set email= p_newemail
where customer_id=p_customer_id;
END //
DELIMITER ;
CALL updatecustomeremail(1,"rutujakadam7277@gmail.com");

DELIMITER //
CREATE PROCEDURE customercounting (
)
begin 
declare customer_count int;

select count(customer_id) into customer_count
from customers
group by customer_id;



end //
DELIMITER ;

call customercounting();
drop procedure customercounting;

DELIMITER //
CREATE PROCEDURE GetCustomerTotalSpending(
in p_customer_id int 
)
begin 
    select 
	customer_id,
    SUM(amount)as totalspent 
    from orders 
    where customer_id=customer_id
    group by customer_id;
end;
