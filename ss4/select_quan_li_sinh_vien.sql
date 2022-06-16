use ss4_quan_li_sinh_vien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất

select * from `subject` 
group by `subject`.credit 
order by  max(credit) desc limit 1;

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.

select `subject`.*, max(mark.mark) as max_mark from `subject` 
left join mark on `subject`.sub_id= mark.sub_id
group by mark.mark
order by max(mark.mark) desc limit 1;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi 
-- sinh viên, xếp hạng theo thứ tự điểm giảm dần

select s.* , avg(m.mark) as diem_trung_binh
from mark m
join student s on m.student_id = s.student_id
group by s.student_id
order by avg(m.mark) desc;
