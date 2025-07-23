use ecommerce;
drop table product;
create table customers(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) ,
email VARCHAR(50) ,
address VARCHAR(80) unique 
);

create table products(
id INT auto_increment primary key,
name varchar(50) ,
price int not null,
stock int not null
);

create table orders(
orderid int auto_increment primary key,
customerid int unique,
orderdate int not null
);

create table orderitems(
orderitemid int auto_increment unique,
orderid int not null,
productid int not null,
quantity int not null,
price int not null
);

create table payments(
paymentid int auto_increment unique,
orderid int not null,
paymentmethod varchar(50) not null,
paymentstatus varchar(20) not null
);

-- --Error Code: 1063. Incorrect column specifier for column 'name'	0.000 sec
