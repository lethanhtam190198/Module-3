
-- Cau 2

select * from nhan_vien 
where ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like 'K%' and char_length(ho_ten)<15;

-- Cau 3

select * from khach_hang 
where ((YEAR(CURDATE()) - YEAR(ngay_sinh)) between 18 and 50) and (dia_chi like "%Đà nẵng" or dia_chi like "%Quảng trị");

-- Cau 4

select hd.ma_khach_hang, kh.ho_ten , count(hd.ma_khach_hang) 
as so_lan_thue, lk.ten_loai_khach 
from hop_dong hd
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
group by ma_khach_hang having lk.ten_loai_khach  = 'Diamond'
order by so_lan_thue ;