drop DATABASE if EXISTS ss3_quan_ly_ban_hang;

create database ss3_quan_ly_ban_hang;

use ss3_quan_ly_ban_hang;

CREATE TABLE IF NOT EXISTS customer (
    customer_id INT AUTO_INCREMENT KEY,
    customer_name VARCHAR(50),
    customer_age INT
);

CREATE TABLE IF NOT EXISTS `order` (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    order_date DATE,
    order_total_price DOUBLE
);

CREATE TABLE IF NOT EXISTS product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(50),
    product_price DOUBLE
);

CREATE TABLE IF NOT EXISTS order_detail (
    order_id INT,
    product_id INT,
    PRIMARY KEY (order_id , product_id),
    FOREIGN KEY (order_id) REFERENCES `order` (order_id),
    FOREIGN KEY (product_id) REFERENCES product (product_id),
    od_qty int
);

insert into customer(customer_name,customer_age ) VALUES
('minh quan', 10),
('ngoc oanh ', 20),
('hong ha', 50);

insert into `order` (customer_id,order_date,order_total_price) values
(1,'2006-03-21', null),
(2,'2006-03-23', null),
(1,'2006-03-16', null);

insert into product(product_name ,product_price ) values
('may giat', 3),
('tu lanh', 5),
('dieu hoa', 7),
('quat', 1),
('bep dien', 2);

insert into order_detail(order_id ,product_id,od_qty) VALUES
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);
