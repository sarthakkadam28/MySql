DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOfficeByCountry`(IN countryName varchar(100))
BEGIN
select* from Offices 
where country=countryName;
END //
DELIMITER ;
call GetOfficeByCountry('USA');
DROP PROCEDURE GetOfficeByCountry;