--计算机系的选课情况
select student.Sno,Sname,Cno,grade
from student,sc
where student.Sno=sc.Sno and Sdept='cs'

select *
from sc
where Sno in(
  select sno
  from student
  where Sdept='cs')

select *
from sc
where exists(
   select *
   from student
   where Sno=sc.sno and Sdept='cs') 
   
--集合运算
--1.union
select Sno,Sname,sage
from student
where Sdept='is' or Sage>=20   

select sno 学号,sname,sage,sdept
from student
where Sdept='is'
union 
select sno,sname 姓名,sage,sdept
from student
where Sage>=20

--2.intersect
select sno,sname,sage,sdept
from student
where Sdept='is'
intersect
select sno,sname,sage,sdept
from student
where Sage>=20

select sno
from sc
where Cno=1
intersect
select sno
from sc
where Cno=2

select sno
from sc
where Cno=1 and Sno in(
 select Sno
 from sc
 where Cno=2)


--3.except
select sno,sname,sage,sdept
from student
where Sdept='is'
except
select sno,sname,sage,sdept
from student
where Sage>=20

--insert
select * from sc
insert
into sc(cno,sno,grade)
values(1,200215123,89);
--insert,省略属性名
insert
into sc
values(200215123,2,49)
--insert,部分赋值
insert
into sc(Sno,cno)
values(200215123,3)

insert
into sc
values(200215123,4,null)

--insert subquery
select *
into stu
from student
where 1=0

insert
into stu
select *
from student
where Sdept='cs'

--update
select *
from stu

update stu
set Sage=Sage-1,sdept='computer'

update stu
set sage=sage+1
where Sno=200215121

select *
into sc2
from sc

select *
from sc2
--计算机系成绩+10
update sc2
set Grade=Grade+10
where Sno in(
	select sno
	from student
	where Sdept='cs')

update sc2
set Grade=Grade+10
where 'cs'=(
	select sdept
	from student
	where Sno=sc2.sno)

update sc2
set Grade=Grade+10
where exists(
	select *
	from student
	where Sno=sc2.sno and Sdept='cs'
)	

update sc2
set grade=90
where Sno=200215125 and Cno=1

--delete
select * from sc2

delete
from sc2
where Sno=200215123 and Cno=4

delete
from sc2
where Sno=200215123

delete
from sc2

insert
into sc2
select *
from sc

select * from sc2

delete
from sc2
where Sno in(
	select sno
	from student
	where Sdept='cs')
	
delete
from sc2
where 'cs'=(
	select sdept
	from student
	where Sno=sc2.sno
)	

delete
from sc2
where exists(
	select *
	from student
	where Sno=sc2.Sno and Sdept='cs')

	