create schema `student-management`;
use `student-management`;
create table class(
`id` int not null,
`name` varchar(45) null,
primary key(`id`));

create table teacher(
`id` int not null,
`name` varchar(45) null,
`age` int null,
`country` varchar(45) null,
primary key(`id`));