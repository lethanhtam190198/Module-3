CREATE DATABASE ss5;

USE ss5;

CREATE TABLE product
(id INT  AUTO_INCREMENT PRIMARY KEY,
product_code VARCHAR(45),
product_name VARCHAR(45),
product_price DOUBLE,
product_amount INT,
product_description VARCHAR(45),
product_status BIT DEFAULT 1 );

INSERT INTO product ( product_code, product_name, product_price, product_amount, product_description,product_status)
VALUES
('001', 'samsung', 13000, 1, '100%', 1),
('003', 'xiaomi', 23000, 1, '90%', 1),
('002', 'samsung note 8', 33000, 1, '95%', 1),
('004', 'iphone 13', 43000, 5, '80%', 1),
('005', 'samsung J7', 5300, 1, '99%', 1),
('007', 'samsung J7', 5300, 1, '70%', 1)
;

delimiter //
CREATE PROCEDURE  select_procedure(in product_code VARCHAR(45))
 BEGIN
 SELECT * FROM product WHERE `product_code`=product_code;
 END
 // DELIMITER ;
CALL  select_procedure('001');
  
  
delimiter //
CREATE PROCEDURE insert_procedure(in product_code varchar(45),
product_name VARCHAR(50),
 product_price DOUBLE,
 product_amount INT,
 product_description VARCHAR(50),
 product_status bit)
 BEGIN
 INSERT INTO product(product_code,product_name,product_price,product_amount,product_description,product_status)
 VALUES(product_code,product_name,product_price,product_amount,product_description,product_status);
 end
// delimiter ;
CALL insert_procedure ("006", "samsung", 12, 1, "new", 1);


 delimiter //
CREATE PROCEDURE update_procedure( in product_id int, `code` varchar(45),
`name` VARCHAR(50),
price DOUBLE,
amount INT,
`description` VARCHAR(50),
 `status` bit)
 BEGIN
 UPDATE product 
 SET  
product_code = `code` ,
product_name=`name`,
product_price=price,
product_amount=amount,
product_description= `description`,
product_status= `status`
 WHERE id= product_id;
 END //
 delimiter ;
 CALL update_procedure( 4,"005","abcdde" , 0, 1, "new", 1);
 
 
delimiter //
CREATE PROCEDURE delete_procedure( in product_id int)
BEGIN
DELETE  from product
WHERE id= product_id;
END //
delimiter ;
CALL delete_procedure(3);