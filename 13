create table matches(
m_number int not null primary key,
m_date date not null,
m_venue varchar(20)
);
create table team(
t_id varchar(20) not null default 'crk001',
t_name text not null default 'mumbai indians',
player_name char(30) not null primary key
);
create table players(
p_id int primary key not null,
p_specialization char(30),
p_name char(30),
p_runs int,
p_wickets int,
foreign key(p_name) references team(player_name)
);
create table score(
match_no int,
total_runs int not null,
total_wickets int not null,
average numeric(10,2),
foreign key(match_no) references matches(m_number)
);
select * from matches;
select * from team;
select *from players;
select * from score;
