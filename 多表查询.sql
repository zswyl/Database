select *
from sc

select *
from student

--sno,sname,cno,grade

--�ѿ�����
select student.sno,sname,cno,grade
from student,sc
--����
select student.sno,sname,cno,grade
from student,sc
where student.Sno=sc.sno

--ѡ����1�ſγ������ͳɼ�
select sname,grade
from student,sc
where student.Sno=sc.Sno and cno=1

--ѡ����1�ſγ�����
select sname ����
from student,sc
where student.sno=sc.sno and cno=1
--ѡ�������ݿ�γ̵�ѧ���������γ����ͳɼ�

select sname,cname,grade
from student,sc,course
where student.Sno=sc.Sno and sc.Cno=course.cno
      and Cname='���ݿ�'

--��������

select sname ����
from student as s,sc
where s.sno=sc.sno and cno=1

--��������
select * from course c1
select * from course c2 

select *
from course c1,course c2
where c1.Cpno=c2.cno

--join����
select *
from student,sc
where student.Sno=sc.sno 
--�ȼ���
select *
from student join sc
on student.Sno=sc.sno 

--������
select *
from student left join sc
on student.Sno=sc.sno

select *
from sc right join student
on student.Sno=sc.sno

--�Ӳ�ѯ
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

--�����ϵѧ����ѡ��
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
      and Cname='���ݿ�'
      
select sname
from student
where Sno in(      
	select sno
	from sc
	where cno =(
		select cno
		from Course
		where Cname='���ݿ�'))
		


---��������

--1.union ������

select Sno,Sname,Sage,Sdept
from student
where Sdept='is' or Sage>=20

--�ȼ���

select Sno,Sname,Sage,Sdept
from student
where Sdept='is'
union 
select Sno,Sname,Sage,Sdept
from student
where Sage>=20

--2.intersect ������
select Sno,Sname,Sage,Sdept
from student
where Sdept='is' and Sage>=20

--�ȼ���
select Sno,Sname,Sage,Sdept
from student
where Sdept='is'
intersect 
select Sno,Sname,Sage,Sdept
from student
where Sage>=20

--3.except ������

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



