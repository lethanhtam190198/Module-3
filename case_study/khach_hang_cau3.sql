SELECT * FROM case_study.khach_hang;

select * from khach_hang where ((YEAR(CURDATE()) - YEAR(ngay_sinh)) between 18 and 50) and (dia_chi like "%Đà nẵng" or dia_chi like "%Quảng trị");