create database quan_li_sv;
use quan_li_sv;

create table class(
classid int not null auto_increment primary key,
classname varchar(50) not null,
startdate datetime not null,
`status` bit
);

create table student(
studentid int not null auto_increment primary key,
studentname varchar(50) not null,
address varchar(50),
phone varchar(30),
`status` bit ,
classid int not null,
foreign key (classid) references class (classid)
);

create table subjectt(
subid int not null auto_increment primary key,
subname varchar(50) not null,
credit tinyint not null default 1 check (credit >=1),
`status` bit default 1
);

create table mark(
markid int not null auto_increment primary key,
subid int not null,
studentid int not null,
mark float default 0 check ( mark between 0 and 100),
examtimes tinyint default 1,
unique (subid, studentid),
foreign key(subid) references subjectt (subid),
foreign key (studentid) references student (studentid)
);
