--���1802-������
--1����һ����ѧ����¼
--��student_id��g9940305��student_name���ź졢sex��Ů��
--birth��1995-02-08��class_id��g99403,department_id:Dep_01,home_addr:����������34�ţ�
--���뵽student����

insert into student 
values('g9940305','�ź�','Ů',2020-1995,'g99403','Dep_01','����������34��')


--2����ÿһ���࣬��ѧ����ƽ�����䣬���ѽ���������ݿ⡣
--����ʾ���Ƚ����±�age_avg��������һ�д�Ű༶��
--��һ�д����Ӧ��ѧ��ƽ�����䣬Ȼ���������ݴ���age_avg��
--��һ�ַ����Ƚ����ٲ�ѯ����
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
	----�ڶ��ַ�����ѯ��������±���ṹ���ѯ���һ��
	--	select class ,avg(age)
	--	into age_avg
	--	from student 
	--	GROUP BY class 
	
	
	--select *
	--from age_avg
--3����ѧ��Ϊg9940201��ѧ����������Ϊ�ź꣬�����Ϊ18

update student
set sname='�ź�',age=18
where sno='g9940201'

--4��student���е�����ϵ��(department_id)����Ϊ��dep_03��

update student
set department='dep_03'

--5�����༶��(class_id)Ϊg99402��ȫ��ѧ���ı��Գɼ���10�֡�
--���ֱ�������Ӳ�ѯ�Ͳ�����Ӳ�ѯ��ɣ�
--����Ӳ�ѯ
update sc
set writtenScore+=10
 where sno in(
	select sno 
	from student s
	where class='g99402'
	and s.sno=sc.sno
	)
--������Ӳ�ѯ
update sc
set writtenScore+=10 
where sno in(
	select sno 
	from student
	where class='g99402'
	)
--6��ɾ������ѡ���˿γ̺�(course_id)Ϊdep04_b001��ѧ����
--���ֱ�������Ӳ�ѯ�Ͳ�����Ӳ�ѯ��ɣ�
--������Ӳ�ѯ
delete from student 
where sno in(
	select sno
	from sc 
	where cno='dep04_b001'
	)
select *
from student
--����Ӳ�ѯ
delete from student
where sno in(
	select sno
	from sc 
	where cno='dep04_b001' 
	and student.sno=sc.sno
	)
	