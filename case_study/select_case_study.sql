use case_study;

-- Cau 2:
select * from nhan_vien 
where ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like 'K%' and char_length(ho_ten)<15;

-- Cau 3:
select * from khach_hang 
where ((YEAR(CURDATE()) - YEAR(ngay_sinh)) between 18 and 50) and (dia_chi like "%Đà nẵng" or dia_chi like "%Quảng trị");

-- Cau 4:
select hd.ma_khach_hang, kh.ho_ten , count(hd.ma_khach_hang) 
as so_lan_thue, lk.ten_loai_khach 
from hop_dong hd
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
group by ma_khach_hang having lk.ten_loai_khach  = 'Diamond'
order by so_lan_thue ;

-- Cau 5:
select 
kh.ma_khach_hang,
kh.ho_ten,
loai_khach.ten_loai_khach,
hop_dong.ma_hop_dong,
dich_vu.ten_dich_vu,
hop_dong.ngay_lam_hop_dong,
hop_dong.ngay_ket_thuc,
sum(dich_vu.chi_phi_thue+(hop_dong_chi_tiet.so_luong *dich_vu_di_kem.gia)) as tong_tien
from khach_hang kh, hop_dong hd, loai_khach lk
join kh on kh.ma_loai_khach=loai_khach.ma_loai_khach
right join hop_dong hd on hd.ma_khach_hang= kh.ma_khach_hang
