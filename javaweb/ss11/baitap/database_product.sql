create database baitapss12;
use baitapss12;

create table product(
`id` int primary key auto_increment,
`name` varchar(50) not null,
`price` float not null,
`producer` varchar(50) not null
);

DELIMITER $$
CREATE PROCEDURE find_all_product()
BEGIN
    SELECT * FROM product;
    END$$
DELIMITER ;

