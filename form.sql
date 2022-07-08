create database baithi;
use baithi;


create table benh_nhan(
id_benh_nhan int primary  key,
ten_benh_nhan varchar(50)
);

create table benh_an(
id int primary key auto_increment,
ma_benh_an varchar(50),
id_benh_nhan int(50),
ten_benh_nhan varchar(50),
ngay_nhap_vien date,
ngay_ra_vien date,
FOREIGN key (id_benh_nhan) references benh_nhan(id_benh_nhan)
);



