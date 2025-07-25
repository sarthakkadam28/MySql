DELIMITER //

CREATE procedure getordresbycustomer(
in p_customer_id int,
in p_order_id int,
in p_order_date date ,
in p_amount decimal
)

BEGIN
insert into orders(customer_id,order_id,order_date,amount)values(p_customer_id,p_order_id,p_order_date,p_amount);
    select * from orders
	WHERE customer_id =p_customer_id;
END //

DELIMITER ;

CALL getordresbycustomer(1,101,"25-02-2025",2000);
CALL getordresbycustomer(2,102,"26-02-2025",3000);
CALL getordresbycustomer(3,103,"27-02-2025",4000);
CALL getordresbycustomer(4,104,"28-02-2025",5000);
drop procedure getordresbycustomer;