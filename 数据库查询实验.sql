--���1802 ������

--1.�ֱ��ô�DISTINCT�Ͳ���DISTINCT�ؼ��ֵ�
--SELELCT��student�н��в�ѯ.
select DISTINCT  sname
from student 

select sname 
from student 
--2.��ѯteacher���и���ʦ���������̹��ż����ʰ�95�����ŵ���Ϣ��
--�������ʰ�95�����ź��������Ϊ��Ԥ�����ʡ�
select tname,tno,salary*0.95 'Ԥ������'
from teacher 

--3.��ѯѡ����2ѧ�����ϵĿγ̣����ұ��Գɼ��������ѧ������Ϣ��
--ֻ�����ѧ�š��γ̺źͱ��Գɼ���
select sno ,c.Cno,writtenScore
from sc  ,course c
where credit>2 and writtenScore<60 and sc.cno=c.cno
--4.��ѯѧ����4��8֮��Ŀγ���Ϣ.
--����between..and�͸��������ֱ�ʵ�֣�
select *
from Course
where credit between 4 and 8

--5.��sc���в�ѯ��ѧ����g9940202������g9940204��ѡ��Ŀγ̺š�ѧ����
--�Լ����Գɼ����������Գɼ��������У���inʵ�֣�
select Cno,sno,writtenScore
from sc 
where sno in('g9940202','g9940204')
order by writtenScore desc

--6.��teacher���зֱ�����������Ľ�ʦ�����ϣ�
--���������ĵ�2������Զ��ԵĽ�ʦ������
select *
from teacher 
where tname like'��%' 
or tname like'_Զ%' 
or  tname like'_��%'

--7.��ѯÿ��ѧ������ѡ�޿����
select *
from student st, sc 
where st.sno=sc .sno

--8.��student��Ϊ�����г�ÿ��ѧ���Ļ����������ѡ�������
--���ѧ��û��ѡ�Σ�ֻ���������������ʾ��ʹ�������ӣ�
select *
from student st
left join sc 
on (st.sno=sc .sno)

--9.��ѯѡ��dep04_s001�ſγ��ұ��Գɼ���80�����ϵ�ѧ����Ϣ��
---���ֱ������ӣ�in��existsʵ�֣�
--����
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

--10.��ѯ�����ϡ�������������γ̵�ѧ����ѧ�š�ѡ�޿γ̺��Լ�����
--���ֱ������ӣ�in��existsʵ�֣�
--����
select sno ,s.cno ,writtenScore,LabScore
from course  c, sc s
where c.cno=s.cno
	and cname='���������' 

--in
select sno ,cno ,writtenScore,LabScore
from sc s
where cno in
	(
		select cno
		from course c
		where cname='���������' 
	)

--exists
select sno ,cno ,writtenScore,LabScore
from sc s
where exists(
	select cno 
	from course c
	where c.cno=s.cno 
		and cname='���������' 
	)

--11.��ѯ���С��������ѧ�뼼����רҵѧ����ѧ�š�ѡ�޿γ̺��Լ�����
--���ֱ������ӣ�in��existsʵ�֣�
--����
select s.sno ,cno ,writtenScore,LabScore
from sc,Department d,student s
where d.Dno=s.department
	and sc.sno=s.sno
	and d.Dname='�������ѧ�뼼��'
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
			where Dname='�������ѧ�뼼��'
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
		and d.Dname='�������ѧ�뼼��' 
	)

--12.��ѯÿ��dep_04ϵѧ�����ܳɼ���ƽ���ɼ��� 
--����ʾƽ���ɼ������ѧ���ļ�¼������ʾʹ��ISNULL�������÷�����¼2��
select sname , sum(ISNULL(writtenScore,0)+ISNULL(LabScore,0)) �ܳɼ�,AVG(ISNULL(writtenScore,0)+ISNULL(LabScore,0)) ƽ���ɼ�
from sc ,student s,department d
where sc.sno=s.sno
	and s.department=d.Dno
	and d.Dno='dep_04'
	group by s.sno ,sname
		having AVG(ISNULL(writtenScore,0)+ISNULL(LabScore,0))>60 

--13.��ѯ�����ݿ⿪����������ƽ���ɼ�
select AVG(ISNULL(writtenScore,0)+ISNULL(LabScore,0)) ���ݿ⿪������ƽ���ɼ�
from sc,course c
where sc.cno=c.cno and c.cname='���ݿ⿪������'

--14.��ְ�Ʋ�ѯ��ʦ��ƽ�����ʣ������ܹ��ʽ�������
select profession ,AVG (Salary) ƽ������,SUM(salary) �ܹ���
from teacher 
group by profession
order by SUM(salary) desc
--15.�����Գɼ�ת����A��B��C��D��E�������ʾ��
--����ʾʹ��CASE������
select sname,cname ,
	(case when writtenScore>=90 then 'A'
		when writtenScore>=80 and writtenScore<90 then 'B'
		when writtenScore>=70 and writtenScore<80 then 'C'
		when writtenScore>=60 and writtenScore<70 then 'D'
		else 'E' end
	)as ���Գɼ�
from sc,student s,course c
where sc.sno=s.sno and sc.cno=c.cno

