create database if not exists chi_tiet_vat_tu;
use chi_tiet_vat_tu;

create table vat_tu(
ma_vat_tu int not null primary key,
ten_vat_tu varchar(50)
);

create table phieu_xuat(
so_phieu_xuat int not null primary key,
ngay_xuat date 
);

create table phieu_nhap(
so_phieu_nhap int not null primary key,
ngay_nhap date
);

create table don_dat_hang(
so_don_hang int not null primary key,
ngay_dat_hang date
);

create table nha_cung_cap(
ma_nha_cung_cap int not null primary key,
ten_nha_cung_cap varchar(50),
dia_chi varchar(50),
sdt int,
so_don_hang int,
foreign key (so_don_hang) references don_dat_hang(so_don_hang)
);

create table chi_tiet_phieu_xuat(
dg_xuat float not null ,
so_luong_xuat int not null,
ma_vat_tu int,
so_phieu_xuat int,
primary key(dg_xuat,ma_vat_tu),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key  (so_phieu_xuat) references phieu_xuat(so_phieu_xuat)
);

create table chi_thiet_phieu_nhap(
dg_nhap float not null ,
so_luong_nhap int not null,
ma_vat_tu int,
so_phieu_nhap int,
primary key(dg_nhap,ma_vat_tu),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key (so_phieu_nhap) references phieu_nhap(so_phieu_nhap)
);

create table chi_tiet_don_dat_hang(
ma_vat_tu int,
so_don_hang int,
ma_nha_cung_cap int,
primary key (ma_vat_tu,so_don_hang),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key (so_don_hang) references don_dat_hang(so_don_hang),
foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

