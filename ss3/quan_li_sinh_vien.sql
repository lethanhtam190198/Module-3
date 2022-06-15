create database if not exists ss3_quan_li_sinh_vien;

use ss3_quan_li_sinh_vien;

create table class(
class_id int auto_increment primary key,
class_name varchar(50),
start_date date,
`status` bit
);

create table student(
student_id int auto_increment primary key,
student_name varchar(50),
address varchar(50),
phone varchar(15),
`status` bit,
class_id int,
foreign key(class_id) references class(class_id)
);

create table `subject`(
sub_id int auto_increment primary key,
sub_name varchar(50),
credit TINYINT not null default 1 check (credit>=1),
`status` bit default 1
);

create table mark(
mark_id int auto_increment primary key,
sub_id int not null,
student_id int not null,
mark float default 0 check (mark between 0 and 100),
exam_times tinyint default 1,
unique(sub_id, student_id),
foreign key(sub_id) references `subject`(sub_id),
foreign key(student_id) references student(student_id)
);

insert into class(class_name,start_date,`status`)
values
('A1','2008-12-20',1),
('A2','2008-12-22',1),
('B3','2022-05-15',0);

insert into student(student_name,address,phone,`status`,class_id)
values
('Hung','Ha Noi','0912113113','1','1'),
('Hoa','Hai phong', null,'1','1'),
('Manh','HCM','0123123123','0','2');

insert into `subject`(sub_name,credit,`status`)
values
('CF','5','1'),
('C','6','1'),
('HDJ','5','1'),
('RDBMS','10','1');

insert into mark(sub_id,student_id,mark,exam_times)
values 
('1','1','8','1'),
('1','2','10','2'),
('2','1','12','1');