create database jwgl2018
go

use jwgl2018
go

if exists (select * from sysobjects where id = OBJECT_ID('[book]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [book]

CREATE TABLE [book] (
[Bno] [varchar]  (13) NOT NULL,
[Bname] [varchar]  (30) NOT NULL,
[publishCompany] [varchar]  (50) NOT NULL,
[author] [varchar]  (8) NULL,
[Price] [numeric]  (5,2) NULL)

ALTER TABLE [book] WITH NOCHECK ADD  CONSTRAINT [PK_book] PRIMARY KEY  NONCLUSTERED ( [Bno] )
INSERT [book] ([Bno],[Bname],[publishCompany],[author],[Price]) VALUES ( N'dep01_s001_01',N'电磁波工程',N'电子工业出版社',N'顾华',21.00)
INSERT [book] ([Bno],[Bname],[publishCompany],[author],[Price]) VALUES ( N'dep04_b001_01',N'计算机基础',N'清华大学出版社',N'洪涛',16.00)
INSERT [book] ([Bno],[Bname],[publishCompany],[author],[Price]) VALUES ( N'dep04_b001_02',N'计算机应用',N'电子工业出版社',N'李群',19.80)
INSERT [book] ([Bno],[Bname],[publishCompany],[author],[Price]) VALUES ( N'dep04_p001_01',N'C语言程序设计',N'清华大学出版社',N'钟军',18.80)
INSERT [book] ([Bno],[Bname],[publishCompany],[author],[Price]) VALUES ( N'dep04_p001_02',N'C语言程序设计',N'南京大学出版社',N'李力',16.70)
INSERT [book] ([Bno],[Bname],[publishCompany],[author],[Price]) VALUES ( N'dep04_s001_01',N'SQLServer数据库开发技术',N'北方交通出版社',N'成虎',21.50)
INSERT [book] ([Bno],[Bname],[publishCompany],[author],[Price]) VALUES ( N'dep04_s002_01',N'JAVA语言程序设计',N'东南大学出版社',N'王平',22.80)
INSERT [book] ([Bno],[Bname],[publishCompany],[author],[Price]) VALUES ( N'dep04_s003_01',N'单片机原理',N'东南大学出版社',N'肖红',16.50)
INSERT [book] ([Bno],[Bname],[publishCompany],[author],[Price]) VALUES ( N'dep04_s004_01',N'软件开发技术',N'南京大学出版社',N'刘雨',15.00)
INSERT [book] ([Bno],[Bname],[publishCompany],[author],[Price]) VALUES ( N'dep04_s005_01',N'网页设计',N'地质出版社',N'张凯芝',12.00)

if exists (select * from sysobjects where id = OBJECT_ID('[class]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [class]

CREATE TABLE [class] (
[cno] [char]  (6) NOT NULL,
[mointor] [char]  (10) NOT NULL)

ALTER TABLE [class] WITH NOCHECK ADD  CONSTRAINT [PK_class] PRIMARY KEY  NONCLUSTERED ( [cno] )
INSERT [class] ([cno],[mointor]) VALUES ( N'g00401',N'张丽')
INSERT [class] ([cno],[mointor]) VALUES ( N'g00402',N'姚夏')
INSERT [class] ([cno],[mointor]) VALUES ( N'g00403',N'路立')
INSERT [class] ([cno],[mointor]) VALUES ( N'g01401',N'方舟')
INSERT [class] ([cno],[mointor]) VALUES ( N'g01402',N'钱程')
INSERT [class] ([cno],[mointor]) VALUES ( N'g01403',N'李微')
INSERT [class] ([cno],[mointor]) VALUES ( N'g99101',N'朱敬')
INSERT [class] ([cno],[mointor]) VALUES ( N'g99102',N'孙兵')
INSERT [class] ([cno],[mointor]) VALUES ( N'g99103',N'李晴')
INSERT [class] ([cno],[mointor]) VALUES ( N'g99402',N'姜一鸣')
INSERT [class] ([cno],[mointor]) VALUES ( N'g99403',N'成佳洱')
INSERT [class] ([cno],[mointor]) VALUES ( N'gg9940',N'李强')

if exists (select * from sysobjects where id = OBJECT_ID('[Class_course]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Class_course]

CREATE TABLE [Class_course] (
[Class] [char]  (6) NOT NULL,
[Course] [char]  (10) NOT NULL)

ALTER TABLE [Class_course] WITH NOCHECK ADD  CONSTRAINT [PK_Class_course] PRIMARY KEY  NONCLUSTERED ( [Class],[Course] )
INSERT [Class_course] ([Class],[Course]) VALUES ( N'g99402',N'dep04_s001')
INSERT [Class_course] ([Class],[Course]) VALUES ( N'g99402',N'dep04_s002')
INSERT [Class_course] ([Class],[Course]) VALUES ( N'g99402',N'dep04_s004')
INSERT [Class_course] ([Class],[Course]) VALUES ( N'g99402',N'dep04_s005')
INSERT [Class_course] ([Class],[Course]) VALUES ( N'g99402',N'der04_s003')
INSERT [Class_course] ([Class],[Course]) VALUES ( N'g99403',N'dep04_s001')
INSERT [Class_course] ([Class],[Course]) VALUES ( N'g99403',N'dep04_s002')
INSERT [Class_course] ([Class],[Course]) VALUES ( N'g99403',N'dep04_s003')
INSERT [Class_course] ([Class],[Course]) VALUES ( N'g99403',N'dep04_s004')
INSERT [Class_course] ([Class],[Course]) VALUES ( N'g99403',N'dep04_s005')

if exists (select * from sysobjects where id = OBJECT_ID('[course]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [course]

CREATE TABLE [course] (
[cno] [char]  (10) NOT NULL,
[cname] [varchar]  (20) NOT NULL,
[book] [char]  (15) NOT NULL,
[perior] [int]  NULL,
[credit] [int]  NULL)

ALTER TABLE [course] WITH NOCHECK ADD  CONSTRAINT [PK_course] PRIMARY KEY  NONCLUSTERED ( [cno] )
INSERT [course] ([cno],[cname],[book],[perior],[credit]) VALUES ( N'Dep01_s001',N'电磁波工程',N'Dep01_s001_01',96,6)
INSERT [course] ([cno],[cname],[book],[perior],[credit]) VALUES ( N'Dep04_b001',N'计算机基础',N'Dep04_b001_02',64,4)
INSERT [course] ([cno],[cname],[book],[perior],[credit]) VALUES ( N'Dep04_p001',N'C语言程序设计',N'Dep04_p001_02',64,4)
INSERT [course] ([cno],[cname],[book],[perior],[credit]) VALUES ( N'Dep04_s001',N'数据库开发技术',N'Dep04_s001_01',80,5)
INSERT [course] ([cno],[cname],[book],[perior],[credit]) VALUES ( N'Dep04_s002',N'JAVA程序开发',N'Dep04_soo2_01',64,4)
INSERT [course] ([cno],[cname],[book],[perior],[credit]) VALUES ( N'Dep04_s003',N'单片机原理',N'Dep04_s003_01',64,4)
INSERT [course] ([cno],[cname],[book],[perior],[credit]) VALUES ( N'Dep04_s004',N'软件开发技术',N'Dep04_s004_01',48,3)
INSERT [course] ([cno],[cname],[book],[perior],[credit]) VALUES ( N'Dep04_s005',N'网页设计',N'Dep04_s005_01',80,5)

if exists (select * from sysobjects where id = OBJECT_ID('[department]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [department]

CREATE TABLE [department] (
[Dno] [char]  (6) NOT NULL,
[Dname] [varchar]  (20) NOT NULL)

ALTER TABLE [department] WITH NOCHECK ADD  CONSTRAINT [PK_department] PRIMARY KEY  NONCLUSTERED ( [Dno] )
INSERT [department] ([Dno],[Dname]) VALUES ( N'Dep_01',N'计算机科学与技术')
INSERT [department] ([Dno],[Dname]) VALUES ( N'Dep_02',N'通信工程')
INSERT [department] ([Dno],[Dname]) VALUES ( N'Dep_03',N'软件工程')
INSERT [department] ([Dno],[Dname]) VALUES ( N'Dep_04',N'数字媒体技术')

if exists (select * from sysobjects where id = OBJECT_ID('[sc]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [sc]

CREATE TABLE [sc] (
[sno] [char]  (8) NOT NULL,
[cno] [char]  (10) NOT NULL,
[writtenScore] [tinyint]  NULL,
[LabScore] [tinyint]  NULL)

ALTER TABLE [sc] WITH NOCHECK ADD  CONSTRAINT [PK_sc] PRIMARY KEY  NONCLUSTERED ( [sno],[cno] )
INSERT [sc] ([sno],[cno],[writtenScore],[LabScore]) VALUES ( N'g9940201',N'dep04_b001',76,15)
INSERT [sc] ([sno],[cno],[writtenScore],[LabScore]) VALUES ( N'g9940201',N'dep04_s001',66,7)
INSERT [sc] ([sno],[cno],[writtenScore],[LabScore]) VALUES ( N'g9940202',N'dep04_b001',61,17)
INSERT [sc] ([sno],[cno],[writtenScore]) VALUES ( N'g9940202',N'dep04_s001',78)
INSERT [sc] ([sno],[cno],[writtenScore],[LabScore]) VALUES ( N'g9940203',N'dep04_b001',62,14)
INSERT [sc] ([sno],[cno],[writtenScore]) VALUES ( N'g9940203',N'dep04_s001',44)
INSERT [sc] ([sno],[cno],[writtenScore],[LabScore]) VALUES ( N'g9940204',N'dep04_b001',33,13)
INSERT [sc] ([sno],[cno],[writtenScore],[LabScore]) VALUES ( N'g9940204',N'dep04_s001',65,5)
INSERT [sc] ([sno],[cno],[writtenScore],[LabScore]) VALUES ( N'g9940205',N'dep04_b001',30,15)
INSERT [sc] ([sno],[cno],[writtenScore],[LabScore]) VALUES ( N'g9940205',N'dep04_s001',52,10)
INSERT [sc] ([sno],[cno],[writtenScore],[LabScore]) VALUES ( N'g9940206',N'dep04_b001',80,18)
INSERT [sc] ([sno],[cno],[writtenScore],[LabScore]) VALUES ( N'g9940206',N'dep04_s001',72,18)
INSERT [sc] ([sno],[cno],[writtenScore],[LabScore]) VALUES ( N'g9940207',N'dep04_b001',70,17)

select *
from sc

if exists (select * from sysobjects where id = OBJECT_ID('[student]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [student]

CREATE TABLE [student] (
[sno] [char]  (8) NOT NULL,
[sname] [varchar]  (8) NOT NULL,
[sex] [char]  (2) NULL,
[age] [int]  NULL,
[class] [char]  (6) NULL,
[department] [char]  (6) NULL,
[address] [varchar]  (50) NULL)

ALTER TABLE [student] WITH NOCHECK ADD  CONSTRAINT [PK_student] PRIMARY KEY  NONCLUSTERED ( [sno] )
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940201',N'张虹',N'女',19,N'g99402',N'Dep_01',N'南京市鼓楼区古平岗3号')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940202',N'林红',N'女',19,N'g99402',N'Dep_02',N'扬州市五亭街41号')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940203',N'曹雨',N'男',20,N'g99402',N'Dep_03',N'南京玄武区林荫大道4号')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940204',N'芮华',N'男',19,N'g99402',N'Dep_01',N'江苏仪征市青年路6号')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940205',N'李丽',N'女',18,N'g99402',N'Dep_04',N'江苏仪征市青年东路1号')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940206',N'林海国',N'男',19,N'g99402',N'Dep_04',N'北京市中关村太平北路')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940207',N'李红',N'女',21,N'g99402',N'Dep_04',N'南京虎锯北路43号')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940208',N'赵青',N'男',20,N'g99402',N'Dep_04',N'南京中山北路10号')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940211',N'赵凯',N'男',21,N'g99402',N'Dep_04',N'南京中山北路10号')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940301',N'左群',N'男',19,N'g99403',N'Dep_01',N'上海市龙盘路97号')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940302',N'徐晓群',N'女',19,N'g99403',N'Dep_01',N'上海市北京东路191号')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940303',N'张雅丽',N'女',19,N'g99403',N'Dep_01',N'南京中山路9号')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940304',N'林红',N'女',20,N'g99403',N'Dep_01',N'北京市海淀天平路8号')

if exists (select * from sysobjects where id = OBJECT_ID('[teacher]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [teacher]

CREATE TABLE [teacher] (
[tno] [char]  (9) NOT NULL,
[tname] [varchar]  (12) NOT NULL,
[department] [char]  (6) NOT NULL,
[profession] [varchar]  (16) NULL,
[sex] [bit]  NOT NULL,
[phone] [varchar]  (15) NULL,
[address] [varchar]  (50) NULL,
[salary] [numeric]  (7,2) NULL,
[Postalcode] [numeric]  (6,0) NULL,
[birth] [smalldatetime]  NULL)

ALTER TABLE [teacher] WITH NOCHECK ADD  CONSTRAINT [PK_teacher] PRIMARY KEY  NONCLUSTERED ( [tno] )
INSERT [teacher] ([tno],[tname],[department],[profession],[sex],[phone],[address],[salary],[Postalcode],[birth]) VALUES ( N'dep01_001',N'王敬远',N'Dep_01',N'副教授',1,N'6211544',N'南京先贤路31',2100.02,210002,N'1978/5/16 12:00:00')
INSERT [teacher] ([tno],[tname],[department],[profession],[sex],[phone],[address],[salary],[Postalcode],[birth]) VALUES ( N'dep02_001',N'康辉',N'Dep_02',N'教授',1,N'8569321',N'南京长虹路5号',3100.08,210008,N'1962/12/21 12:00:00')
INSERT [teacher] ([tno],[tname],[department],[profession],[sex],[phone],[address],[salary],[Postalcode],[birth]) VALUES ( N'dep03_001',N'董一平',N'Dep_03',N'副教授',1,N'3728543',N'南京长江路9号',2300.36,210036,N'1979/4/17 12:00:00')
INSERT [teacher] ([tno],[tname],[department],[profession],[sex],[phone],[address],[salary],[Postalcode],[birth]) VALUES ( N'dep03_002',N'潘惠',N'Dep_01',N'讲师',0,N'5887654',N'南京长江路5号',1800.36,210036,N'1985/9/3 12:00:00')
INSERT [teacher] ([tno],[tname],[department],[profession],[sex],[phone],[address],[salary],[Postalcode],[birth]) VALUES ( N'dep04_001',N'纪云',N'Dep_04',N'副教授',1,N'6245321',N'南京长江路3号',2100.36,210036,N'1980/1/19 12:00:00')
INSERT [teacher] ([tno],[tname],[department],[profession],[sex],[phone],[address],[salary],[Postalcode],[birth]) VALUES ( N'dep04_002',N'章红',N'Dep_04',N'教授',0,N'2781602',N'南京西路31号',3500.43,210034,N'1968/8/23 12:00:00')
INSERT [teacher] ([tno],[tname],[department],[profession],[sex],[phone],[address],[salary],[Postalcode],[birth]) VALUES ( N'dep04_003',N'李伟',N'Dep_04',N'教授',1,N'3728543',N'南京先贤路3号',3200.02,210002,N'1970/11/5 12:00:00')
INSERT [teacher] ([tno],[tname],[department],[profession],[sex],[phone],[address],[salary],[Postalcode],[birth]) VALUES ( N'dep04_004',N'严为',N'Dep_04',N'助教',1,N'7654987',N'南京长虹路3号',1200.36,220001,N'1990/9/4 12:00:00')
INSERT [teacher] ([tno],[tname],[department],[profession],[sex],[phone],[address],[salary],[Postalcode],[birth]) VALUES ( N'dep04_005',N'乔红',N'Dep_04',N'讲师',0,N'8802888',N'南京太青路32号',1800.71,210071,N'1987/6/7 12:00:00')

if exists (select * from sysobjects where id = OBJECT_ID('[total]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [total]

CREATE TABLE [total] (
[department] [char]  (6) NOT NULL,
[nums] [int]  NULL)

ALTER TABLE [total] WITH NOCHECK ADD  CONSTRAINT [PK_total] PRIMARY KEY  NONCLUSTERED ( [department] )
INSERT [total] ([department],[nums]) VALUES ( N'Dep_01',6)
INSERT [total] ([department],[nums]) VALUES ( N'Dep_02',1)
INSERT [total] ([department],[nums]) VALUES ( N'Dep_03',1)
INSERT [total] ([department],[nums]) VALUES ( N'Dep_04',5)

--软件1802傅占帅1711030215
--实验二数据库查询
--1.   分别用带DISTINCT和不带DISTINCT关键字的SELELCT在student中进行查询.
select sname
from student

select distinct sname
from student

--2.	查询teacher表中各教师的姓名、教工号及工资按95％发放的信息，并将工资按95％发放后的列名改为‘预发工资’
select tname, tno, salary*0.95 '预发工资'
from teacher

--3.	查询选修了2学分以上的课程，并且笔试成绩不及格的学生的信息，只需给出学号、课程号和笔试成绩。
select sc.sno, sc.writtenScore, course.cno
from sc, course
where sc.cno = course.cno and sc.writtenScore < 60 and course.credit >= 2

--4.	查询学分在4～8之间的课程信息.（用between..and和复合条件分别实现）
select *
from course
where credit between 4 and 8

select *
from course
where credit >= 4 and credit <= 8

--5.	从sc表中查询出学生“g9940202”，“g9940204”选择的课程号、学生号以及笔试成绩，并按笔试成绩降序排列（用in实现）
select cno, sno, writtenScore
from sc
where sno in ('g9940202', 'g9940204')
order by writtenScore desc
--order by writtenScore asc

--6.	从teacher表中分别检索出姓王的教师的资料，或者姓名的第2个字是远或辉的教师的资料
select *
from teacher
where tname like '王%' or tname like '%远' or tname like '%辉'

--7.	查询每个学生及其选修课情况
select student.sno, student.sname, course.cno, course.cname
from student, course, sc
where student.sno = sc.sno and course.cno = sc.cno

--8.	以student表为主体列出每个学生的基本情况及其选课情况，如果学生没有选课，只输出其基本情况（提示：使用外连接）
select student.sno, student.sname, sc.cno
from student left outer join sc on
	(
		student.sno = sc.sno 
	)

--9.	查询选修dep04_s001号课程且笔试成绩在80分以上的学生信息。（分别用连接，in和exists实现）
select student.sno, student.sname
from student, sc
where  student.sno = sc.sno and sc.cno = 'dep04_s001' and sc.writtenScore >= 80

select student.sno, student.sname
from student
where student.sno in
	(
		select sno
		from sc
		where cno = 'dep04_s001' and writtenScore >= 80
	)

select student.sno, student.sname
from student
where exists
	(
		select *
		from sc
		where cno = 'dep04_s001' and writtenScore >= 80 and student.sno = sno
	)

--10.	查询所有上“计算机基础”课程的学生的学号、选修课程号以及分数（分别用连接，in和exists实现）
select sno,sc.cno,writtenScore,LabScore
from course, sc
where  course.cno=sc.cno and cname = '计算机基础'

select *
from sc
where cno in
	(
		select cno
		from course
		where cname = '计算机基础'
	)

select *
from sc
where exists
	(
		select cno
		from course
		where sc.cno = course.cno and cname = '计算机基础'
	)

--11.	查询所有“计算机科学与技术”专业学生的学号、选修课程号以及分数（分别用连接，in和exists实现）
select sc.*
from student, sc, department
where student.department = department.Dno and student.sno = sc.sno and department.Dname = '计算机科学与技术'

select *
from sc
where sno in
	(
		select sno
		from student
		where department in
			(
				select Dno
				from department
				where Dname = '计算机科学与技术'
			 )
	)

select *
from sc
where exists
	(
		select *
		from student, department
		where student.department = department.Dno and Dname = '计算机科学与技术' and sc.sno = student.sno
	)

--12.	查询每个dep_04系学生的总成绩、平均成绩， 仅显示平均成绩及格的学生的记录。（提示使用ISNULL函数，用法见附录2）
select SUM(ISNULL(writtenScore, 0) + ISNULL(LabScore, 0)) total, AVG((ISNULL(writtenScore, 0) + ISNULL(LabScore, 0))) avg
from student, sc
where student.department = 'dep_04' and student.sno = sc.sno
group by student.sno
having AVG((ISNULL(sc.writtenScore, 0) + ISNULL(sc.LabScore, 0))) >= 60;

--13.	查询“数据库开发技术”的平均成绩
select AVG((ISNULL(writtenScore, 0) * 1.0 + ISNULL(LabScore, 0))) avg
from course, sc
where course.cno = sc.cno and course.cname = '数据库开发技术'

--14.	按职称查询教师的平均工资，并按总工资降序排列
select profession, AVG( salary ) avgSalary, SUM(salary) totalSalary
from teacher
group by profession
order by totalSalary desc

--15.	将笔试成绩转换成A、B、C、D和E五分制显示。（提示使用CASE函数）
select writtenScore,
	(
		case 
		when writtenScore >= 90 then 'A'
		when writtenScore >= 80 and writtenScore < 90 then 'B'
		when writtenScore >= 70 and writtenScore < 80 then 'C'
		when writtenScore >= 60 and writtenScore < 70 then 'D'
		else 'E'
		end
	) score
from sc