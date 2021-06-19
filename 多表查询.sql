select *
from sc

select *
from student

--sno,sname,cno,grade

--笛卡尔积
select student.sno,sname,cno,grade
from student,sc
--连接
select student.sno,sname,cno,grade
from student,sc
where student.Sno=sc.sno

--选修了1号课程姓名和成绩
select sname,grade
from student,sc
where student.Sno=sc.Sno and cno=1

--选修了1号课程姓名
select sname 姓名
from student,sc
where student.sno=sc.sno and cno=1
--选修了数据库课程的学生姓名、课程名和成绩

select sname,cname,grade
from student,sc,course
where student.Sno=sc.Sno and sc.Cno=course.cno
      and Cname='数据库'

--表名别名

select sname 姓名
from student as s,sc
where s.sno=sc.sno and cno=1

--自身连接
select * from course c1
select * from course c2 

select *
from course c1,course c2
where c1.Cpno=c2.cno

--join连接
select *
from student,sc
where student.Sno=sc.sno 
--等价于
select *
from student join sc
on student.Sno=sc.sno 

--外连接
select *
from student left join sc
on student.Sno=sc.sno

select *
from sc right join student
on student.Sno=sc.sno

--子查询
select sname
from student
where sno in(
	select Sno
	from sc
	where Cno=2
)

select sname
from student,sc
where student.Sno=sc.Sno and Cno=2
--exists
select *from student
select * from sc
select sname
from student
where exists(
	select *
	from sc
	where sc.Sno=student.Sno and Cno=2)

--计算机系学生的选课
select *
from student,sc
where student.Sno=sc.Sno and Sdept='cs'

select *
from sc
where Sno in(
	select sno
	from student
	where Sdept='cs')
	
--
select sname
from student,sc,course
where student.Sno=sc.Sno and sc.Cno=course.cno
      and Cname='数据库'
      
select sname
from student
where Sno in(      
	select sno
	from sc
	where cno =(
		select cno
		from Course
		where Cname='数据库'))
		


---集合运算

--1.union 并运算

select Sno,Sname,Sage,Sdept
from student
where Sdept='is' or Sage>=20

--等价于

select Sno,Sname,Sage,Sdept
from student
where Sdept='is'
union 
select Sno,Sname,Sage,Sdept
from student
where Sage>=20

--2.intersect 交运算
select Sno,Sname,Sage,Sdept
from student
where Sdept='is' and Sage>=20

--等价于
select Sno,Sname,Sage,Sdept
from student
where Sdept='is'
intersect 
select Sno,Sname,Sage,Sdept
from student
where Sage>=20

--3.except 差运算

select Sno,Sname,Sage,Sdept
from student
where Sdept='is'
except
select Sno,Sname,Sage,Sdept
from student
where Sage>=20


select sno
from SC 
where Cno =1 
union
select sno
from SC 
where Cno =2 



