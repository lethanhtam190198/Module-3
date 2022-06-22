use case_study;

-- Cau 2:
select * from nhan_vien 
where ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like 'K%' 
and char_length(ho_ten)<15;

-- Cau 3:
select * from khach_hang 
where ((YEAR(CURDATE()) - YEAR(ngay_sinh)) between 18 and 50) 
and (dia_chi like "%Đà nẵng" or dia_chi like "%Quảng Trị");

select * from khach_hang 
where ((YEAR(CURDATE()) - YEAR(ngay_sinh)) between 18 and 50) 
and (dia_chi like concat('%',convert('Da nang',binary) and convert('Quang Tri',binary)));

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
lk.ten_loai_khach,
hd.ma_hop_dong,
dv.ten_dich_vu,
hd.ngay_lam_hop_dong,
hd.ngay_ket_thuc,
ifnull(dv.chi_phi_thue,0)+ ifnull(hdct.so_luong * dvdk.gia,0)
as tong_tien
from khach_hang kh
left join loai_khach lk on lk.ma_loai_khach=kh.ma_loai_khach
left join hop_dong hd on hd.ma_khach_hang= kh.ma_khach_hang
left join dich_vu dv on hd.ma_dich_vu= dv.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong=hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem=dvdk.ma_dich_vu_di_kem
group by kh.ma_khach_hang;


-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, 
-- chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ 
-- chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 
-- (Quý 1 là tháng 1, 2, 3).

select 
dv.ma_dich_vu,
dv.ten_dich_vu,
dv.dien_tich,
dv.chi_phi_thue,
ldv.ten_loai_dich_vu
from hop_dong hd
 join dich_vu dv on hd.ma_dich_vu= dv.ma_dich_vu 
 join loai_dich_vu ldv on dv.ma_loai_dich_vu= ldv.ma_loai_dich_vu
group by dv.ma_dich_vu
having dv.ma_dich_vu not in
( select dv.ma_dich_vu from hop_dong hd
join dich_vu dv on hd.ma_dich_vu= dv.ma_dich_vu
join loai_dich_vu ldv on dv.ma_loai_dich_vu= ldv.ma_loai_dich_vu
where month(hd.ngay_lam_hop_dong) between 1 and 3 and year(hd.ngay_lam_hop_dong)='2021' );

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, 
-- so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các 
-- loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

select 
dv.ma_dich_vu,
dv.ten_dich_vu,
dv.dien_tich,
dv.so_nguoi_toi_da,
dv.chi_phi_thue,
hd.ngay_lam_hop_dong,
ldv.ten_loai_dich_vu
from hop_dong hd
join dich_vu dv on hd.ma_dich_vu=dv.ma_dich_vu
join loai_dich_vu ldv on dv.ma_loai_dich_vu= ldv.ma_loai_dich_vu
where year(hd.ngay_lam_hop_dong)='2020'
group by dv.ma_dich_vu
having dv.ma_dich_vu not in(
select dv.ma_dich_vu from hop_dong hd
join dich_vu dv on hd.ma_dich_vu=dv.ma_dich_vu
join loai_dich_vu ldv on dv.ma_loai_dich_vu= ldv.ma_loai_dich_vu
where year(hd.ngay_lam_hop_dong)='2021');


-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, 
-- với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.

SELECT DISTINCT ho_ten from khach_hang;

select khach_hang.ho_ten from khach_hang
group by khach_hang.ho_ten;

select khach_hang.ho_ten from khach_hang
union
select khach_hang.ho_ten from khach_hang;


-- 9.	Thực hiện thống kê doanh thu theo tháng, 
-- nghĩa là tương ứng với mỗi tháng trong năm 2021 
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select  month(ngay_lam_hop_dong) as thang,count(ma_khach_hang) as so_luong_khach_hang 
from hop_dong
where year(ngay_lam_hop_dong)='2021'
group by  month(ngay_lam_hop_dong) 
order by month(ngay_lam_hop_dong) ;

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì 
-- đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao 
-- gồm ma_hop_dong, ngay_lam_hop_dong,
--  ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem
--  (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select 
hd.ma_hop_dong,
hd.ngay_lam_hop_dong,
hd.ngay_ket_thuc,
hd.tien_dat_coc,
sum(ifnull(hdct.so_luong,0)) as so_luong_dich_vu_di_kem from hop_dong hd
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong= hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem= dvdk.ma_dich_vu_di_kem
group by hd.ma_hop_dong;


-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi 
-- những khách hàng có ten_loai_khach là “Diamond”
--  và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select 
dvdk.ma_dich_vu_di_kem,
dvdk.ten_dich_vu_di_kem from khach_hang kh
JOIN loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
JOIN hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
JOIN hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
JOIN dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
WHERE (kh.dia_chi like '%Vinh' or  kh.dia_chi like '%Quảng Ngãi' )
and lk.ten_loai_khach= 'Diamond';


-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), 
-- ho_ten (khách hàng), so_dien_thoai (khách hàng), 
-- ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng 
-- đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng 
-- đặt vào 6 tháng đầu năm 2021.

select 
hd.ma_hop_dong,
nv.ho_ten as ho_ten_nv,
kh.ho_ten as ho_ten_kh,
dv.ma_dich_vu,
kh.so_dien_thoai,
dv.ten_dich_vu,
sum(ifnull(hdct.so_luong,0)) as so_luong_dich_vu_di_kem
from hop_dong hd
left join khach_hang kh on hd.ma_khach_hang=kh.ma_khach_hang
left join nhan_vien nv on hd.ma_nhan_vien=nv.ma_nhan_vien
left join dich_vu dv on hd.ma_dich_vu=dv.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong= hdct.ma_hop_dong
where 
(hd.ngay_lam_hop_dong between '2020-10-01' and  '2020-12-31')
group by hd.ma_hop_dong not in(
select hd.ma_hop_dong from hop_dong hd
where (month(hd.ngay_lam_hop_dong ) between 1 and 6)
and (year(hd.ngay_lam_hop_dong)=2021));


-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất 
-- bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select 
dvdk.ma_dich_vu_di_kem,
dvdk.ten_dich_vu_di_kem,
sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from hop_dong hd
join hop_dong_chi_tiet hdct on hd.ma_hop_dong=hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem= dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having so_luong_dich_vu_di_kem=(select max(so_luong_dich_vu_di_kem) from view_table);

create view view_table as select
sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from hop_dong hd
join hop_dong_chi_tiet hdct on hd.ma_hop_dong=hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem= dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem;


-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới 
-- được sử dụng một lần duy nhất. Thông tin hiển thị 
-- bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, 
-- so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select hd.ma_hop_dong,
ldv.ten_loai_dich_vu,
dvdk.ten_dich_vu_di_kem,
count(dvdk.ma_dich_vu_di_kem) as so_lan_su_dung
from hop_dong hd
join dich_vu dv on hd.ma_dich_vu=dv.ma_dich_vu
join loai_dich_vu ldv on dv.ma_loai_dich_vu= ldv.ma_loai_dich_vu
join hop_dong_chi_tiet hdct on hd.ma_hop_dong= hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem= dvdk.ma_dich_vu_di_kem
group by dvdk.ten_dich_vu_di_kem
having count(dvdk.ma_dich_vu_di_kem)=1
order by hd.ma_hop_dong;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, 
-- ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, 
-- dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select nv.ma_nhan_vien,
nv.ho_ten,
td.ten_trinh_do,
bp.ten_bo_phan,
nv.so_dien_thoai,
nv.dia_chi
from nhan_vien nv
join vi_tri vt on nv.ma_vi_tri=vt.ma_vi_tri
join trinh_do td on nv.ma_trinh_do= td.ma_trinh_do
join bo_phan bp on nv.ma_bo_phan= bp.ma_bo_phan
join hop_dong hd on nv.ma_nhan_vien=hd.ma_nhan_vien
where year(hd.ngay_lam_hop_dong) between 2020 and 2021
group by nv.ma_nhan_vien
having (count(hd.ma_hop_dong) <=3 )
order by nv.ma_nhan_vien;

-- 16.Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

SET SQL_SAFE_UPDATES = 0;
ALTER TABLE nhan_vien ADD `status` BIT;
update nhan_vien set `status` = 1
where nhan_vien.ma_nhan_vien in (
select * from (
select nv.ma_nhan_vien from nhan_vien nv
left join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where nv.ma_nhan_vien not in (
select nv.ma_nhan_vien from nhan_vien nv
right join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where year(hd.ngay_lam_hop_dong) between 2019 and 2021
group by ma_nhan_vien)
) temp);
-- những Nhân viên đã được xoá
select ma_nhan_vien, ho_ten from nhan_vien where `status` = 1;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ 
-- Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng
--  đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

update khach_hang 
set ma_loai_khach = 1
where ma_khach_hang in 
(select * from ( 
select KH.ma_khach_hang from khach_hang KH
join hop_dong HD on KH.ma_khach_hang = HD.ma_khach_hang 
left join dich_vu DV on HD.ma_dich_vu = DV.ma_dich_vu
left join hop_dong_chi_tiet HDCT on HD.ma_hop_dong = HDCT.ma_hop_dong
left join dich_vu_di_kem DVDK on HDCT.ma_dich_vu_di_kem = DVDK.ma_dich_vu_di_kem
where year(HD.ngay_lam_hop_dong) = 2021 
group by  HD.ma_hop_dong 
having (sum(DV.chi_phi_thue+HDCT.so_luong*DVDK.gia))>=10000000) temp);

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 
-- (chú ý ràng buộc giữa các bảng).

update khach_hang kh
set `flag`  = 1
where kh.ma_khach_hang in 
(select * from(
select kh.ma_khach_hang from khach_hang kh
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where year(hd.ngay_lam_hop_dong) < 2021
group by kh.ma_khach_hang)temp);

select ma_khach_hang, ho_ten from khach_hang where `flag` = 1;


-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

update dich_vu_di_kem
set gia=gia*2
where ma_dich_vu_di_kem in( select * from (
select 
dvdk.ma_dich_vu_di_kem
from hop_dong hd
join hop_dong_chi_tiet hdct on hd.ma_hop_dong= hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem= dvdk.ma_dich_vu_di_kem
where year(hd.ngay_lam_hop_dong) =2020 and hdct.so_luong>=10)temp);

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng 
-- có trong hệ thống, thông tin hiển thị bao gồm id 
-- (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select 
nv.ma_nhan_vien,
nv.ho_ten,
nv.email,
nv.so_dien_thoai,
nv.ngay_sinh,
nv.dia_chi
from nhan_vien nv
union
select 
kh.ma_khach_hang,
kh.ho_ten,
kh.email,
kh.so_dien_thoai,
kh.ngay_sinh,
kh.dia_chi
from khach_hang kh;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin 
-- của tất cả các nhân viên có địa chỉ là “Hải Châu” và đã từng lập 
-- hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.

create view n_nhan_vien as
select nv.* from nhan_vien nv
join hop_dong hd on nv.ma_nhan_vien=hd.ma_nhan_vien
where dia_chi like '%Hải Châu' and hd.ngay_lam_hop_dong=2019-12-12 ;

drop view n_nhan_vien;

select * from n_nhan_vien;

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành
--  “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.

update n_nhan_vien set dia_chi='Liên Chiểu';
