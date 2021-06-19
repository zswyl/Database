create database student;
go
use student

if exists (select * from sysobjects where id = OBJECT_ID('[Course]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Course]

CREATE TABLE [Course] (
[Cno] [char]  (5) NOT NULL,
[Cname] [char]  (12) NULL,
[Cpno] [char]  (5) NULL,
[Ccredit] [smallint]  NULL)

ALTER TABLE [Course] WITH NOCHECK ADD  CONSTRAINT [PK_Course] PRIMARY KEY  NONCLUSTERED ( [Cno] )
INSERT [Course] ([Cno],[Cname],[Cpno],[Ccredit]) VALUES ( N'1',N'���ݿ�',N'5',4)
INSERT [Course] ([Cno],[Cname],[Ccredit]) VALUES ( N'2',N'��ѧ',2)
INSERT [Course] ([Cno],[Cname],[Cpno],[Ccredit]) VALUES ( N'3',N'��Ϣϵͳ',N'1',4)
INSERT [Course] ([Cno],[Cname],[Cpno],[Ccredit]) VALUES ( N'4',N'����ϵͳ',N'6',3)
INSERT [Course] ([Cno],[Cname],[Cpno],[Ccredit]) VALUES ( N'5',N'���ݽṹ',N'7',4)
INSERT [Course] ([Cno],[Cname],[Ccredit]) VALUES ( N'6',N'���ݴ���',2)
INSERT [Course] ([Cno],[Cname],[Cpno],[Ccredit]) VALUES ( N'7',N'PASCAL',N'6',4)
if exists (select * from sysobjects where id = OBJECT_ID('[SC]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [SC]

CREATE TABLE [SC] (
[Sno] [char]  (9) NOT NULL,
[Cno] [char]  (5) NOT NULL,
[Grade] [float]  NULL)

ALTER TABLE [SC] WITH NOCHECK ADD  CONSTRAINT [PK_SC] PRIMARY KEY  NONCLUSTERED ( [Sno],[Cno] )
INSERT [SC] ([Sno],[Cno],[Grade]) VALUES ( N'200215121',N'1',56)
INSERT [SC] ([Sno],[Cno],[Grade]) VALUES ( N'200215121',N'2',78)
INSERT [SC] ([Sno],[Cno],[Grade]) VALUES ( N'200215121',N'3',63)
INSERT [SC] ([Sno],[Cno],[Grade]) VALUES ( N'200215122',N'2',90)
INSERT [SC] ([Sno],[Cno]) VALUES ( N'200215122',N'3')
INSERT [SC] ([Sno],[Cno],[Grade]) VALUES ( N'200215125',N'1',71)
if exists (select * from sysobjects where id = OBJECT_ID('[Student]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Student]

CREATE TABLE [Student] (
[Sno] [char]  (9) NOT NULL,
[Sname] [char]  (12) NULL,
[Ssex] [char]  (2) NULL,
[Sage] [smallint]  NULL,
[Sdept] [char]  (15) NULL)

ALTER TABLE [Student] WITH NOCHECK ADD  CONSTRAINT [PK_Student] PRIMARY KEY  NONCLUSTERED ( [Sno] )
INSERT [Student] ([Sno],[Sname],[Ssex],[Sage],[Sdept]) VALUES ( N'200215121',N'����',N'��',19,N'CS')
INSERT [Student] ([Sno],[Sname],[Ssex],[Sage],[Sdept]) VALUES ( N'200215122',N'����',N'Ů',18,N'IS')
INSERT [Student] ([Sno],[Sname],[Ssex],[Sage],[Sdept]) VALUES ( N'200215123',N'����',N'Ů',20,N'MA')
INSERT [Student] ([Sno],[Sname],[Ssex],[Sage],[Sdept]) VALUES ( N'200215124',N'����',N'��',19,N'IS')
INSERT [Student] ([Sno],[Sname],[Ssex],[Sage],[Sdept]) VALUES ( N'200215125',N'����',N'��',21,N'CS')
INSERT [Student] ([Sno],[Sname],[Ssex],[Sage],[Sdept]) VALUES ( N'200215126',N'�ŷ�',N'��',20,N'IS')
INSERT [Student] ([Sno],[Sname],[Ssex],[Sage],[Sdept]) VALUES ( N'200215127',N'������',N'��',19,N'CS')
