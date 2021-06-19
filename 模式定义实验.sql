--获取数据库物理存放位置
select FileName 
from master..sysdatabases 
where name = 'weform'; 


use master
--检查有没有这个数据库，如果有就删除它。
go
if exists 
(select * 
from sysdatabases 
where name='EB')
 drop database EB  
--软件1802-朱松望
--1．创建数据库EB
create database EB on(
	name=EB,--数据库名字
	--数据库文件路径
	filename='F:\sql_server_2008_r2\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\EB_data.mdf',
	size = 5MB,-- 数据库大小
	maxsize = 20,  --最大空间
	filegrowth= 20  --文件增量限制 
)
 log on
 (
	name =EB_log, --日志名(与数据库同名报错)
	-- 日志文件路径
	filename='F:\sql_server_2008_r2\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\EB_log.ldf',
	size = 2MB,-- 日志大小
	maxsize = 10MB,  --最大空间
	filegrowth= 1MB  --文件增量限制 
);

--2.创建上述四个表结构，并定义约束
create table student(
	Sno char(8) not null,
	Sname varchar(8) not null,
	Sex char(2)  check (Sex in ('男','女') ),
	Age int,
	Class char(6),
	Department char(6),
	primary key(Sno)
	)
create table Class (
	Cno char(6) not null ,
	Monitor varchar(8),
	primary key(Cno)
	)	
create table Course(
	Cno char(10) not null ,
	Cname varchar(20) not null,
	Book char(15) not null,
	credit Tinyint not null check(credit between 1 and 5),
	period Tinyint not null,
	primary key(Cno)
	)
create table Class_course(
	Class char(6)not null,
	Course char(10)not null,
	foreign key (Class) references Class(Cno),
	foreign key (Course) references Course(Cno)
	)
--3.在Student表中添加一个新列Address，用于存放学生的家庭住址
alter table student
	add Address varchar(50)


--4.将Student表中age的年龄改成tinyint
alter table student
alter column age tinyint