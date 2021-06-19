
--创建信息部门视图语句
create view is_1
as
select sno,Sname,Sdept
from student
where Sdept='is'


--查看视图语句
select *
from is_1

--
select *
from is_1,sc
where is_1.Sno=sc.Sno
--等价于
select student.sno,Sname,Grade
from student,sc
where student.Sno=sc.Sno and Sdept='is'


create view is_2(sno,sname,grade)
as
select s.sno,Sname,Sdept
from student s,sc
where s.Sno=sc.Sno and Sdept='is' and Cno=2


select *
from is_2


create view is_3
as 
select *
from is_2
where grade>=90

select *
from is_3


create view st_birth
as
select sno,Sname,2020-sage sbirth
from student

select *
from st_birth