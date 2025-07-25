DELIMITER //
CREATE PROCEDURE GetCustomerTotalSpending(in p_customer_id int)
begin 
    select 
	customer_id,
    SUM(amount)as totalspent 
    from orders 
    where customer_id=customer_id
    group by customer_id;
end //
delimiter ;

call GetCustomerTotalSpending(1);
drop procedure if exists GetCustomerTotalSpending;
