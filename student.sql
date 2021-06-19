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
INSERT [Course] ([Cno],[Cname],[Cpno],[Ccredit]) VALUES ( N'1',N'数据库',N'5',4)
INSERT [Course] ([Cno],[Cname],[Ccredit]) VALUES ( N'2',N'数学',2)
INSERT [Course] ([Cno],[Cname],[Cpno],[Ccredit]) VALUES ( N'3',N'信息系统',N'1',4)
INSERT [Course] ([Cno],[Cname],[Cpno],[Ccredit]) VALUES ( N'4',N'操作系统',N'6',3)
INSERT [Course] ([Cno],[Cname],[Cpno],[Ccredit]) VALUES ( N'5',N'数据结构',N'7',4)
INSERT [Course] ([Cno],[Cname],[Ccredit]) VALUES ( N'6',N'数据处理',2)
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
INSERT [Student] ([Sno],[Sname],[Ssex],[Sage],[Sdept]) VALUES ( N'200215121',N'李勇',N'男',19,N'CS')
INSERT [Student] ([Sno],[Sname],[Ssex],[Sage],[Sdept]) VALUES ( N'200215122',N'刘晨',N'女',18,N'IS')
INSERT [Student] ([Sno],[Sname],[Ssex],[Sage],[Sdept]) VALUES ( N'200215123',N'王敏',N'女',20,N'MA')
INSERT [Student] ([Sno],[Sname],[Ssex],[Sage],[Sdept]) VALUES ( N'200215124',N'张立',N'男',19,N'IS')
INSERT [Student] ([Sno],[Sname],[Ssex],[Sage],[Sdept]) VALUES ( N'200215125',N'江鹏',N'男',21,N'CS')
INSERT [Student] ([Sno],[Sname],[Ssex],[Sage],[Sdept]) VALUES ( N'200215126',N'张丰',N'男',20,N'IS')
INSERT [Student] ([Sno],[Sname],[Ssex],[Sage],[Sdept]) VALUES ( N'200215127',N'张三丰',N'男',19,N'CS')
