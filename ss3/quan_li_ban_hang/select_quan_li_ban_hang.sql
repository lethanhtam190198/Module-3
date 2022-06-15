use ss3_quan_ly_ban_hang;

SELECT o.order_id , o.order_date, o.order_total_price
from `order` o;

select c.* , p.*
from customer c
join `order` o on c.customer_id=o.customer_id
join order_detail odt on o.order_id= odt.order_id
join product p on odt.product_id= p.product_id;

select c.*, count(o.order_id) as so_lan_mua_hang
from customer c 
left join `order` o on c.customer_id=o.customer_id
group by order_id having so_lan_mua_hang=0;

SELECT o.order_id , o.order_date, sum(product_price*od_qty) as price
from `order` o
join order_detail odt on o.order_id = odt.order_id
join product p on odt.product_id = p.product_id
group by order_id;

