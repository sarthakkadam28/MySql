DELIMITER //
CREATE PROCEDURE customercounting (
)
begin 
declare customer_count int;

select count(customer_id) into customer_count
from customers
group by customer_id;

if customer_count>0 then 
select'customer exist'as message, customer_count;
else 
select'customer not exist'as message;
end if ;

end //
DELIMITER ;

call customercounting();
drop procedure customercounting;

-- Error Code: 1318. Incorrect number of arguments for PROCEDURE sample.GetCustomerTotalSpending; expected 1, got 0	0.000 sec
