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
CALL updatecustomeremail(2,"sarthakkadam72@gamil.com");
CALL updatecustomeremail(3,"sanikabhaor@gmail.com");
CALL updatecustomeremail(4,"sumitbhor@gmail.com");
CALL updatecustomeremail(5,"ravitambade@gmail.com");
drop procedure updatecustomeremail;