create database ��������ҵ
go
use ��������ҵ
--ѧ�� (ѧ�ţ�������רҵ����ѧ����)
create table ѧ�� (
	ѧ�� char(9) primary key,
	���� varchar(20),
	רҵ varchar(5),
	��ѧ���� date
)

INSERT [ѧ��] ([ѧ��],[����],[��ѧ����],[רҵ]) VALUES ( N'201815121',N'����','2018-09-01',N'CS')
INSERT [ѧ��] ([ѧ��],[����],[��ѧ����],[רҵ]) VALUES ( N'201815122',N'����','2018-09-01',N'IS')
INSERT [ѧ��] ([ѧ��],[����],[��ѧ����],[רҵ]) VALUES ( N'201815123',N'����','2018-09-01',N'MA')
INSERT [ѧ��] ([ѧ��],[����],[��ѧ����],[רҵ]) VALUES ( N'201815124',N'����','2018-09-01',N'IS')
INSERT [ѧ��] ([ѧ��],[����],[��ѧ����],[רҵ]) VALUES ( N'201815125',N'����','2018-09-01',N'CS')
INSERT [ѧ��] ([ѧ��],[����],[��ѧ����],[רҵ]) VALUES ( N'201815126',N'�ŷ�','2018-09-01',N'IS')
INSERT [ѧ��] ([ѧ��],[����],[��ѧ����],[רҵ]) VALUES ( N'201815127',N'������','2018-09-01',N'CS')

create table �շ�(
	ѧ�� int,
	ѧ�� char(9),
	ѧ�� numeric(9,2),
	��� numeric(9,2),
	�ܽ�� numeric(9,2),
	primary key(ѧ��,ѧ��)
)

create table ����( 
  ���ź� varchar(5) primary key,
  ���� varchar(20) not null,
  ������ varchar(20),
  ��ַ  varchar(30),
  �绰 varchar(11)
);


insert into ���� values('D01','����һ��','����','����','02426860001');
insert into ���� values('D02','��������','����','����','02426860002');
insert into ���� values('D03','������Դ��','����','����','02426860003')
	
create table ְ��(
	ְ���� varchar(9) primary key,
	���� varchar(20) not null,
	���� smallint,
	ְ�� varchar(11),
	���� numeric(9,2),
	���ź� varchar(5) references ����(���ź�)
)

insert into ְ�� values('E001','����',32,'���ž���',12000,'D01')
insert into ְ�� values('E002','�',28,null,6500,'D01');
insert into ְ�� values('E003','����',35,'���ž���',13500,'D02');
insert into ְ�� values('E004','���',26,null,6300,'D02');
insert into ְ�� values('E005','����',41,'���ž���',9000,'D03');

go
create view EV(ְ����,����,����,ְ��,����,������)
as
  select ְ����,����,����,ְ��,����,����
  from ְ��,����
  where ְ��.���ź�=����.���ź�


