--软件1802 朱松望

--1.分别用带DISTINCT和不带DISTINCT关键字的
--SELELCT在student中进行查询.
select DISTINCT  sname
from student 

select sname 
from student 
--2.查询teacher表中各教师的姓名、教工号及工资按95％发放的信息，
--并将工资按95％发放后的列名改为‘预发工资’
select tname,tno,salary*0.95 '预发工资'
from teacher 

--3.查询选修了2学分以上的课程，并且笔试成绩不及格的学生的信息，
--只需给出学号、课程号和笔试成绩。
select sno ,c.Cno,writtenScore
from sc  ,course c
where credit>2 and writtenScore<60 and sc.cno=c.cno
--4.查询学分在4～8之间的课程信息.
--（用between..and和复合条件分别实现）
select *
from Course
where credit between 4 and 8

--5.从sc表中查询出学生“g9940202”，“g9940204”选择的课程号、学生号
--以及笔试成绩，并按笔试成绩降序排列（用in实现）
select Cno,sno,writtenScore
from sc 
where sno in('g9940202','g9940204')
order by writtenScore desc

--6.从teacher表中分别检索出姓王的教师的资料，
--或者姓名的第2个字是远或辉的教师的资料
select *
from teacher 
where tname like'王%' 
or tname like'_远%' 
or  tname like'_辉%'

--7.查询每个学生及其选修课情况
select *
from student st, sc 
where st.sno=sc .sno

--8.以student表为主体列出每个学生的基本情况及其选课情况，
--如果学生没有选课，只输出其基本情况（提示：使用外连接）
select *
from student st
left join sc 
on (st.sno=sc .sno)

--9.查询选修dep04_s001号课程且笔试成绩在80分以上的学生信息。
---（分别用连接，in和exists实现）
--连接
select s.sno ,sname ,sex ,age ,class ,department ,address 
from student s, sc 
where  s.sno=sc.sno
	 and cno ='dep04_s001' 
	 and writtenScore >80

--in
select *
from student
where sno in
	(
		select sno
		from sc 
		where Cno='dep04_s001' 
			and writtenScore >80
	)

--exists
select *
from student s
where exists(
	select sno 
	from sc
	where s.sno=sc.sno 
		and cno ='dep04_s001' 
		and writtenScore >80
	)

--10.查询所有上“计算机基础”课程的学生的学号、选修课程号以及分数
--（分别用连接，in和exists实现）
--连接
select sno ,s.cno ,writtenScore,LabScore
from course  c, sc s
where c.cno=s.cno
	and cname='计算机基础' 

--in
select sno ,cno ,writtenScore,LabScore
from sc s
where cno in
	(
		select cno
		from course c
		where cname='计算机基础' 
	)

--exists
select sno ,cno ,writtenScore,LabScore
from sc s
where exists(
	select cno 
	from course c
	where c.cno=s.cno 
		and cname='计算机基础' 
	)

--11.查询所有“计算机科学与技术”专业学生的学号、选修课程号以及分数
--（分别用连接，in和exists实现）
--连接
select s.sno ,cno ,writtenScore,LabScore
from sc,Department d,student s
where d.Dno=s.department
	and sc.sno=s.sno
	and d.Dname='计算机科学与技术'
--in
select sno ,cno ,writtenScore,LabScore
from sc
where sno in
	(
		select sno 
		from student
		where department  in(
			select Dno 
			from Department
			where Dname='计算机科学与技术'
		)
	)

--exists
select sno ,cno ,writtenScore,LabScore
from sc
where exists(
	select sno 
	from department d,student s
	where d.Dno=s.department
		and sc.sno=s.sno
		and d.Dname='计算机科学与技术' 
	)

--12.查询每个dep_04系学生的总成绩、平均成绩， 
--仅显示平均成绩及格的学生的记录。（提示使用ISNULL函数，用法见附录2）
select sname , sum(ISNULL(writtenScore,0)+ISNULL(LabScore,0)) 总成绩,AVG(ISNULL(writtenScore,0)+ISNULL(LabScore,0)) 平均成绩
from sc ,student s,department d
where sc.sno=s.sno
	and s.department=d.Dno
	and d.Dno='dep_04'
	group by s.sno ,sname
		having AVG(ISNULL(writtenScore,0)+ISNULL(LabScore,0))>60 

--13.查询“数据库开发技术”的平均成绩
select AVG(ISNULL(writtenScore,0)+ISNULL(LabScore,0)) 数据库开发技术平均成绩
from sc,course c
where sc.cno=c.cno and c.cname='数据库开发技术'

--14.按职称查询教师的平均工资，并按总工资降序排列
select profession ,AVG (Salary) 平均工资,SUM(salary) 总工资
from teacher 
group by profession
order by SUM(salary) desc
--15.将笔试成绩转换成A、B、C、D和E五分制显示。
--（提示使用CASE函数）
select sname,cname ,
	(case when writtenScore>=90 then 'A'
		when writtenScore>=80 and writtenScore<90 then 'B'
		when writtenScore>=70 and writtenScore<80 then 'C'
		when writtenScore>=60 and writtenScore<70 then 'D'
		else 'E' end
	)as 笔试成绩
from sc,student s,course c
where sc.sno=s.sno and sc.cno=c.cno

