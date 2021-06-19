--��ȡ���ݿ�������λ��
select FileName 
from master..sysdatabases 
where name = 'weform'; 


use master
--�����û��������ݿ⣬����о�ɾ������
go
if exists 
(select * 
from sysdatabases 
where name='EB')
 drop database EB  
--���1802-������
--1���������ݿ�EB
create database EB on(
	name=EB,--���ݿ�����
	--���ݿ��ļ�·��
	filename='F:\sql_server_2008_r2\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\EB_data.mdf',
	size = 5MB,-- ���ݿ��С
	maxsize = 20,  --���ռ�
	filegrowth= 20  --�ļ��������� 
)
 log on
 (
	name =EB_log, --��־��(�����ݿ�ͬ������)
	-- ��־�ļ�·��
	filename='F:\sql_server_2008_r2\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\EB_log.ldf',
	size = 2MB,-- ��־��С
	maxsize = 10MB,  --���ռ�
	filegrowth= 1MB  --�ļ��������� 
);

--2.���������ĸ���ṹ��������Լ��
create table student(
	Sno char(8) not null,
	Sname varchar(8) not null,
	Sex char(2)  check (Sex in ('��','Ů') ),
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
--3.��Student�������һ������Address�����ڴ��ѧ���ļ�ͥסַ
alter table student
	add Address varchar(50)


--4.��Student����age������ĳ�tinyint
alter table student
alter column age tinyint