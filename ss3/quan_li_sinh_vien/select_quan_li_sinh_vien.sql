use ss3_quan_li_sinh_vien;

select * from student where student_name like 'H%';

select * from class where month(start_date) = 12 ;

select * from `subject` where credit between 3 and 5;

SET SQL_SAFE_UPDATES = 0;

update student set class_id='2' where student_name='Hung';

select student.student_name, `subject`.sub_name,mark from mark
join student on student.student_id= mark.student_id
join `subject` on `subject`.sub_id= mark.sub_id
order by mark desc, student_name;