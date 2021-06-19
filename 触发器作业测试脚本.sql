create database 触发器作业
go
use 触发器作业
--学生 (学号，姓名，专业，入学日期)
create table 学生 (
	学号 char(9) primary key,
	姓名 varchar(20),
	专业 varchar(5),
	入学日期 date
)

INSERT [学生] ([学号],[姓名],[入学日期],[专业]) VALUES ( N'201815121',N'李勇','2018-09-01',N'CS')
INSERT [学生] ([学号],[姓名],[入学日期],[专业]) VALUES ( N'201815122',N'刘晨','2018-09-01',N'IS')
INSERT [学生] ([学号],[姓名],[入学日期],[专业]) VALUES ( N'201815123',N'王敏','2018-09-01',N'MA')
INSERT [学生] ([学号],[姓名],[入学日期],[专业]) VALUES ( N'201815124',N'张立','2018-09-01',N'IS')
INSERT [学生] ([学号],[姓名],[入学日期],[专业]) VALUES ( N'201815125',N'江鹏','2018-09-01',N'CS')
INSERT [学生] ([学号],[姓名],[入学日期],[专业]) VALUES ( N'201815126',N'张丰','2018-09-01',N'IS')
INSERT [学生] ([学号],[姓名],[入学日期],[专业]) VALUES ( N'201815127',N'张三丰','2018-09-01',N'CS')

create table 收费(
	学年 int,
	学号 char(9),
	学费 numeric(9,2),
	书费 numeric(9,2),
	总金额 numeric(9,2),
	primary key(学年,学号)
)

create table 部门( 
  部门号 varchar(5) primary key,
  名称 varchar(20) not null,
  经理名 varchar(20),
  地址  varchar(30),
  电话 varchar(11)
);


insert into 部门 values('D01','开发一部','张明','沈阳','02426860001');
insert into 部门 values('D02','开发二部','金丽','沈阳','02426860002');
insert into 部门 values('D03','人力资源部','蒋敏','沈阳','02426860003')
	
create table 职工(
	职工号 varchar(9) primary key,
	姓名 varchar(20) not null,
	年龄 smallint,
	职务 varchar(11),
	工资 numeric(9,2),
	部门号 varchar(5) references 部门(部门号)
)

insert into 职工 values('E001','张明',32,'部门经理',12000,'D01')
insert into 职工 values('E002','杨帆',28,null,6500,'D01');
insert into 职工 values('E003','金丽',35,'部门经理',13500,'D02');
insert into 职工 values('E004','李成',26,null,6300,'D02');
insert into 职工 values('E005','蒋敏',41,'部门经理',9000,'D03');

go
create view EV(职工号,姓名,年龄,职务,工资,部门名)
as
  select 职工号,姓名,年龄,职务,工资,名称
  from 职工,部门
  where 职工.部门号=部门.部门号


