DELIMITER //
CREATE PROCEDURE CreatePersonTable ()
BEGIN
drop table if exists persons;
create table persons(
          id int AUTO_INCREMENT primary key ,
          first_name varchar (100) not null,
          last_name varchar (100) not null
          );
insert into persons (first_name,last_name )values('sarthak','kadam'),
                                                 ('vishal','kap'),
                                                 ('sanika','bhor'),
                                                 ('kajal','ghule');
select id ,first_name,last_name from persons;
END //

DELIMITER ;

call CreatePersonTable();
drop procedure CreatePersonTable;