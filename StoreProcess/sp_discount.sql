DELIMITER //
CREATE PROCEDURE sp_applydiscount(
in order_id INT,
IN discount_codes varchar(50)
)
BEGIN 
DECLARE v_discount decimal(5, 2);
DECLARE v_total decimal(10, 2);
select discount_percentage INTO v_discount
FROM orders
WHERE code=discount_codes AND NOW() BETWEEN start_date AND end_date;

IF v_discount IS NOT NULL THEN 
SELECT total_amount INTO v_total
FROM orders
WHERE id=order_id;
SET v_total= v_total- (v_total * (v_discount/100));
UPDATE orders
SET total_amount=v_amount
WHERE id=order_id;
ELSE
    SIGNAL SQLSTATE '45000'SET message_text='invalid or expired discount code';
END IF;
END //

DELIMITER //
CALL sp_applydiscount(1, 'SUMMER2023');