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
INSERT [book] ([Bno],[Bname],[publishCompany],[author],[Price]) VALUES ( N'dep01_s001_01',N'��Ų�����',N'���ӹ�ҵ������',N'�˻�',21.00)
INSERT [book] ([Bno],[Bname],[publishCompany],[author],[Price]) VALUES ( N'dep04_b001_01',N'���������',N'�廪��ѧ������',N'����',16.00)
INSERT [book] ([Bno],[Bname],[publishCompany],[author],[Price]) VALUES ( N'dep04_b001_02',N'�����Ӧ��',N'���ӹ�ҵ������',N'��Ⱥ',19.80)
INSERT [book] ([Bno],[Bname],[publishCompany],[author],[Price]) VALUES ( N'dep04_p001_01',N'C���Գ������',N'�廪��ѧ������',N'�Ӿ�',18.80)
INSERT [book] ([Bno],[Bname],[publishCompany],[author],[Price]) VALUES ( N'dep04_p001_02',N'C���Գ������',N'�Ͼ���ѧ������',N'����',16.70)
INSERT [book] ([Bno],[Bname],[publishCompany],[author],[Price]) VALUES ( N'dep04_s001_01',N'SQLServer���ݿ⿪������',N'������ͨ������',N'�ɻ�',21.50)
INSERT [book] ([Bno],[Bname],[publishCompany],[author],[Price]) VALUES ( N'dep04_s002_01',N'JAVA���Գ������',N'���ϴ�ѧ������',N'��ƽ',22.80)
INSERT [book] ([Bno],[Bname],[publishCompany],[author],[Price]) VALUES ( N'dep04_s003_01',N'��Ƭ��ԭ��',N'���ϴ�ѧ������',N'Ф��',16.50)
INSERT [book] ([Bno],[Bname],[publishCompany],[author],[Price]) VALUES ( N'dep04_s004_01',N'�����������',N'�Ͼ���ѧ������',N'����',15.00)
INSERT [book] ([Bno],[Bname],[publishCompany],[author],[Price]) VALUES ( N'dep04_s005_01',N'��ҳ���',N'���ʳ�����',N'�ſ�֥',12.00)

if exists (select * from sysobjects where id = OBJECT_ID('[class]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [class]

CREATE TABLE [class] (
[cno] [char]  (6) NOT NULL,
[mointor] [char]  (10) NOT NULL)

ALTER TABLE [class] WITH NOCHECK ADD  CONSTRAINT [PK_class] PRIMARY KEY  NONCLUSTERED ( [cno] )
INSERT [class] ([cno],[mointor]) VALUES ( N'g00401',N'����')
INSERT [class] ([cno],[mointor]) VALUES ( N'g00402',N'Ҧ��')
INSERT [class] ([cno],[mointor]) VALUES ( N'g00403',N'·��')
INSERT [class] ([cno],[mointor]) VALUES ( N'g01401',N'����')
INSERT [class] ([cno],[mointor]) VALUES ( N'g01402',N'Ǯ��')
INSERT [class] ([cno],[mointor]) VALUES ( N'g01403',N'��΢')
INSERT [class] ([cno],[mointor]) VALUES ( N'g99101',N'�쾴')
INSERT [class] ([cno],[mointor]) VALUES ( N'g99102',N'���')
INSERT [class] ([cno],[mointor]) VALUES ( N'g99103',N'����')
INSERT [class] ([cno],[mointor]) VALUES ( N'g99402',N'��һ��')
INSERT [class] ([cno],[mointor]) VALUES ( N'g99403',N'�ɼѶ�')
INSERT [class] ([cno],[mointor]) VALUES ( N'gg9940',N'��ǿ')

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
INSERT [course] ([cno],[cname],[book],[perior],[credit]) VALUES ( N'Dep01_s001',N'��Ų�����',N'Dep01_s001_01',96,6)
INSERT [course] ([cno],[cname],[book],[perior],[credit]) VALUES ( N'Dep04_b001',N'���������',N'Dep04_b001_02',64,4)
INSERT [course] ([cno],[cname],[book],[perior],[credit]) VALUES ( N'Dep04_p001',N'C���Գ������',N'Dep04_p001_02',64,4)
INSERT [course] ([cno],[cname],[book],[perior],[credit]) VALUES ( N'Dep04_s001',N'���ݿ⿪������',N'Dep04_s001_01',80,5)
INSERT [course] ([cno],[cname],[book],[perior],[credit]) VALUES ( N'Dep04_s002',N'JAVA���򿪷�',N'Dep04_soo2_01',64,4)
INSERT [course] ([cno],[cname],[book],[perior],[credit]) VALUES ( N'Dep04_s003',N'��Ƭ��ԭ��',N'Dep04_s003_01',64,4)
INSERT [course] ([cno],[cname],[book],[perior],[credit]) VALUES ( N'Dep04_s004',N'�����������',N'Dep04_s004_01',48,3)
INSERT [course] ([cno],[cname],[book],[perior],[credit]) VALUES ( N'Dep04_s005',N'��ҳ���',N'Dep04_s005_01',80,5)

if exists (select * from sysobjects where id = OBJECT_ID('[department]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [department]

CREATE TABLE [department] (
[Dno] [char]  (6) NOT NULL,
[Dname] [varchar]  (20) NOT NULL)

ALTER TABLE [department] WITH NOCHECK ADD  CONSTRAINT [PK_department] PRIMARY KEY  NONCLUSTERED ( [Dno] )
INSERT [department] ([Dno],[Dname]) VALUES ( N'Dep_01',N'�������ѧ�뼼��')
INSERT [department] ([Dno],[Dname]) VALUES ( N'Dep_02',N'ͨ�Ź���')
INSERT [department] ([Dno],[Dname]) VALUES ( N'Dep_03',N'�������')
INSERT [department] ([Dno],[Dname]) VALUES ( N'Dep_04',N'����ý�弼��')

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
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940201',N'�ź�',N'Ů',19,N'g99402',N'Dep_01',N'�Ͼ��й�¥����ƽ��3��')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940202',N'�ֺ�',N'Ů',19,N'g99402',N'Dep_02',N'��������ͤ��41��')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940203',N'����',N'��',20,N'g99402',N'Dep_03',N'�Ͼ�������������4��')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940204',N'�ǻ�',N'��',19,N'g99402',N'Dep_01',N'��������������·6��')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940205',N'����',N'Ů',18,N'g99402',N'Dep_04',N'�������������궫·1��')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940206',N'�ֺ���',N'��',19,N'g99402',N'Dep_04',N'�������йش�̫ƽ��·')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940207',N'���',N'Ů',21,N'g99402',N'Dep_04',N'�Ͼ����ⱱ·43��')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940208',N'����',N'��',20,N'g99402',N'Dep_04',N'�Ͼ���ɽ��·10��')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940211',N'�Կ�',N'��',21,N'g99402',N'Dep_04',N'�Ͼ���ɽ��·10��')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940301',N'��Ⱥ',N'��',19,N'g99403',N'Dep_01',N'�Ϻ�������·97��')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940302',N'����Ⱥ',N'Ů',19,N'g99403',N'Dep_01',N'�Ϻ��б�����·191��')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940303',N'������',N'Ů',19,N'g99403',N'Dep_01',N'�Ͼ���ɽ·9��')
INSERT [student] ([sno],[sname],[sex],[age],[class],[department],[address]) VALUES ( N'g9940304',N'�ֺ�',N'Ů',20,N'g99403',N'Dep_01',N'�����к�����ƽ·8��')

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
INSERT [teacher] ([tno],[tname],[department],[profession],[sex],[phone],[address],[salary],[Postalcode],[birth]) VALUES ( N'dep01_001',N'����Զ',N'Dep_01',N'������',1,N'6211544',N'�Ͼ�����·31',2100.02,210002,N'1978/5/16 12:00:00')
INSERT [teacher] ([tno],[tname],[department],[profession],[sex],[phone],[address],[salary],[Postalcode],[birth]) VALUES ( N'dep02_001',N'����',N'Dep_02',N'����',1,N'8569321',N'�Ͼ�����·5��',3100.08,210008,N'1962/12/21 12:00:00')
INSERT [teacher] ([tno],[tname],[department],[profession],[sex],[phone],[address],[salary],[Postalcode],[birth]) VALUES ( N'dep03_001',N'��һƽ',N'Dep_03',N'������',1,N'3728543',N'�Ͼ�����·9��',2300.36,210036,N'1979/4/17 12:00:00')
INSERT [teacher] ([tno],[tname],[department],[profession],[sex],[phone],[address],[salary],[Postalcode],[birth]) VALUES ( N'dep03_002',N'�˻�',N'Dep_01',N'��ʦ',0,N'5887654',N'�Ͼ�����·5��',1800.36,210036,N'1985/9/3 12:00:00')
INSERT [teacher] ([tno],[tname],[department],[profession],[sex],[phone],[address],[salary],[Postalcode],[birth]) VALUES ( N'dep04_001',N'����',N'Dep_04',N'������',1,N'6245321',N'�Ͼ�����·3��',2100.36,210036,N'1980/1/19 12:00:00')
INSERT [teacher] ([tno],[tname],[department],[profession],[sex],[phone],[address],[salary],[Postalcode],[birth]) VALUES ( N'dep04_002',N'�º�',N'Dep_04',N'����',0,N'2781602',N'�Ͼ���·31��',3500.43,210034,N'1968/8/23 12:00:00')
INSERT [teacher] ([tno],[tname],[department],[profession],[sex],[phone],[address],[salary],[Postalcode],[birth]) VALUES ( N'dep04_003',N'��ΰ',N'Dep_04',N'����',1,N'3728543',N'�Ͼ�����·3��',3200.02,210002,N'1970/11/5 12:00:00')
INSERT [teacher] ([tno],[tname],[department],[profession],[sex],[phone],[address],[salary],[Postalcode],[birth]) VALUES ( N'dep04_004',N'��Ϊ',N'Dep_04',N'����',1,N'7654987',N'�Ͼ�����·3��',1200.36,220001,N'1990/9/4 12:00:00')
INSERT [teacher] ([tno],[tname],[department],[profession],[sex],[phone],[address],[salary],[Postalcode],[birth]) VALUES ( N'dep04_005',N'�Ǻ�',N'Dep_04',N'��ʦ',0,N'8802888',N'�Ͼ�̫��·32��',1800.71,210071,N'1987/6/7 12:00:00')

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

--���1802��ռ˧1711030215
--ʵ������ݿ��ѯ
--1.   �ֱ��ô�DISTINCT�Ͳ���DISTINCT�ؼ��ֵ�SELELCT��student�н��в�ѯ.
select sname
from student

select distinct sname
from student

--2.	��ѯteacher���и���ʦ���������̹��ż����ʰ�95�����ŵ���Ϣ���������ʰ�95�����ź��������Ϊ��Ԥ�����ʡ�
select tname, tno, salary*0.95 'Ԥ������'
from teacher

--3.	��ѯѡ����2ѧ�����ϵĿγ̣����ұ��Գɼ��������ѧ������Ϣ��ֻ�����ѧ�š��γ̺źͱ��Գɼ���
select sc.sno, sc.writtenScore, course.cno
from sc, course
where sc.cno = course.cno and sc.writtenScore < 60 and course.credit >= 2

--4.	��ѯѧ����4��8֮��Ŀγ���Ϣ.����between..and�͸��������ֱ�ʵ�֣�
select *
from course
where credit between 4 and 8

select *
from course
where credit >= 4 and credit <= 8

--5.	��sc���в�ѯ��ѧ����g9940202������g9940204��ѡ��Ŀγ̺š�ѧ�����Լ����Գɼ����������Գɼ��������У���inʵ�֣�
select cno, sno, writtenScore
from sc
where sno in ('g9940202', 'g9940204')
order by writtenScore desc
--order by writtenScore asc

--6.	��teacher���зֱ�����������Ľ�ʦ�����ϣ����������ĵ�2������Զ��ԵĽ�ʦ������
select *
from teacher
where tname like '��%' or tname like '%Զ' or tname like '%��'

--7.	��ѯÿ��ѧ������ѡ�޿����
select student.sno, student.sname, course.cno, course.cname
from student, course, sc
where student.sno = sc.sno and course.cno = sc.cno

--8.	��student��Ϊ�����г�ÿ��ѧ���Ļ����������ѡ����������ѧ��û��ѡ�Σ�ֻ���������������ʾ��ʹ�������ӣ�
select student.sno, student.sname, sc.cno
from student left outer join sc on
	(
		student.sno = sc.sno 
	)

--9.	��ѯѡ��dep04_s001�ſγ��ұ��Գɼ���80�����ϵ�ѧ����Ϣ�����ֱ������ӣ�in��existsʵ�֣�
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

--10.	��ѯ�����ϡ�������������γ̵�ѧ����ѧ�š�ѡ�޿γ̺��Լ��������ֱ������ӣ�in��existsʵ�֣�
select sno,sc.cno,writtenScore,LabScore
from course, sc
where  course.cno=sc.cno and cname = '���������'

select *
from sc
where cno in
	(
		select cno
		from course
		where cname = '���������'
	)

select *
from sc
where exists
	(
		select cno
		from course
		where sc.cno = course.cno and cname = '���������'
	)

--11.	��ѯ���С��������ѧ�뼼����רҵѧ����ѧ�š�ѡ�޿γ̺��Լ��������ֱ������ӣ�in��existsʵ�֣�
select sc.*
from student, sc, department
where student.department = department.Dno and student.sno = sc.sno and department.Dname = '�������ѧ�뼼��'

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
				where Dname = '�������ѧ�뼼��'
			 )
	)

select *
from sc
where exists
	(
		select *
		from student, department
		where student.department = department.Dno and Dname = '�������ѧ�뼼��' and sc.sno = student.sno
	)

--12.	��ѯÿ��dep_04ϵѧ�����ܳɼ���ƽ���ɼ��� ����ʾƽ���ɼ������ѧ���ļ�¼������ʾʹ��ISNULL�������÷�����¼2��
select SUM(ISNULL(writtenScore, 0) + ISNULL(LabScore, 0)) total, AVG((ISNULL(writtenScore, 0) + ISNULL(LabScore, 0))) avg
from student, sc
where student.department = 'dep_04' and student.sno = sc.sno
group by student.sno
having AVG((ISNULL(sc.writtenScore, 0) + ISNULL(sc.LabScore, 0))) >= 60;

--13.	��ѯ�����ݿ⿪����������ƽ���ɼ�
select AVG((ISNULL(writtenScore, 0) * 1.0 + ISNULL(LabScore, 0))) avg
from course, sc
where course.cno = sc.cno and course.cname = '���ݿ⿪������'

--14.	��ְ�Ʋ�ѯ��ʦ��ƽ�����ʣ������ܹ��ʽ�������
select profession, AVG( salary ) avgSalary, SUM(salary) totalSalary
from teacher
group by profession
order by totalSalary desc

--15.	�����Գɼ�ת����A��B��C��D��E�������ʾ������ʾʹ��CASE������
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