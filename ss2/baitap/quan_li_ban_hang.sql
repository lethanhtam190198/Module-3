create database if not exists quan_ly_ban_hang;

use quan_ly_ban_hang;

create table customer(
customer_id int auto_increment primary key,
customer_name varchar(50),
customer_age int
);

create table oder(
oder_id int auto_increment primary key,
customer_id int,
oder_date date,
oder_total_price float,
foreign key(customer_id) references customer(customer_id)
);

create table product(
product_id int auto_increment primary key,
product_name varchar(50),
product_price float
);

create table oder_detail(
oder_id int,
product_id int,
oder_qty varchar(50),
primary key(oder_id,product_id),
foreign key(oder_id) references oder(oder_id),
foreign key(product_id) references product(product_id)
);