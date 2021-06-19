--软件1802-朱松望
--1．将一个新学生记录
--（student_id：g9940305、student_name：张红、sex：女、
--birth：1995-02-08、class_id：g99403,department_id:Dep_01,home_addr:沈阳皇浦区34号）
--插入到student表中

insert into student 
values('g9940305','张红','女',2020-1995,'g99403','Dep_01','沈阳皇浦区34号')


--2．对每一个班，求学生的平均年龄，并把结果存入数据库。
--（提示：先建立新表“age_avg”，其中一列存放班级，
--另一列存放相应的学生平均年龄，然后将所需数据存入age_avg）
--第一种方法先建表再查询插入
create table age_avg(
	class char(6),
	age_avg int,
	primary key(class)
	)
	--drop table age_avg
insert into age_avg(class ,age_avg )
	select class ,avg(age)
	from student 
	GROUP BY class 
	----第二种方法查询结果创建新表，表结构与查询结果一致
	--	select class ,avg(age)
	--	into age_avg
	--	from student 
	--	GROUP BY class 
	
	
	--select *
	--from age_avg
--3．将学号为g9940201的学生的姓名改为张宏，年龄改为18

update student
set sname='张宏',age=18
where sno='g9940201'

--4．student表中的所有系别(department_id)均改为“dep_03”

update student
set department='dep_03'

--5．将班级号(class_id)为g99402的全体学生的笔试成绩加10分。
--（分别用相关子查询和不相关子查询完成）
--相关子查询
update sc
set writtenScore+=10
 where sno in(
	select sno 
	from student s
	where class='g99402'
	and s.sno=sc.sno
	)
--不相关子查询
update sc
set writtenScore+=10 
where sno in(
	select sno 
	from student
	where class='g99402'
	)
--6．删除所有选修了课程号(course_id)为dep04_b001的学生。
--（分别用相关子查询和不相关子查询完成）
--不相关子查询
delete from student 
where sno in(
	select sno
	from sc 
	where cno='dep04_b001'
	)
select *
from student
--相关子查询
delete from student
where sno in(
	select sno
	from sc 
	where cno='dep04_b001' 
	and student.sno=sc.sno
	)
	