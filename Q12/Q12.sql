create table exam (
e_time time not null,
e_id int not null primary key,
e_date date not null,
room_number varchar(8) not null,
course_name text not null,
section_number int not null,
foreign key(room_number) references room (r_number),
foreign key(course_name) references course(c_name),
foreign key(section_number) references section(s_number)
);
drop table exam
create table room (
r_number varchar(8) not null primary key,
r_building varchar(20) default 'buildingA',
r_capacity int,
check (r_capacity>=60)
);
create table course(
c_name text not null primary key,
c_number int not null,
c_department varchar(20)
);
create table section(
s_number int not null primary key,
s_enrollment int not null
);
select * from exam;
select * from room;
select * from course;
select * from section;
