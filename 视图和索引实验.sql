--���1802-������
--(1)����һ����Ϊstud_query_viewl����ͼ��
--�����ݿ�JWGL��student���в�ѯ���Ա�Ϊ��Ů��������ѧ��������;
create view stud_query_viewl
as
select *
from student 
where sex='Ů'

--����
select *
from stud_query_viewl
--(2)����һ����Ϊstud_query_view2����ͼ��
--�����ݿ�JWGL��student���в�ѯ���Ա�Ϊ��Ů��
--������ѧ����ѧ�ţ��������༶����ͥסַ������;
create view stud_query_view2(Sno,sname,class,sex,address,age)
as
select Sno,sname,class,sex,address,age
from student 
where sex='Ů'

--����
select *
from stud_query_view2
--(3)����һ����Ϊ��stud_query__view3������ͼ��������
--��course��book��class_course������һ����ʾ��g99402����
--�����γ̵Ŀγ��������ý̲ĵĽ̲����������缰���ߵ���ͼ;
create view stud_query__view3
as 
select cname,Bname,publishCompany,author
from course c,book b,Class_course cl
where class='g99402' 
	and c.cname=b.Bname
	and c.cno=cl.Course
	
	
--����
select *
from stud_query__view3

--(4)����һ������ͼstud_query_viewl��
--��ѯ���༶��Ϊg99402������ѧ������Ϣ��
select *
from stud_query_viewl
where class='g99402'

--(5)����ͼstud_query_view2�в�ѯ���༶
--Ϊ��g99402��������Ϊ����족����Ϣ;
select *
from stud_query_view2
where class='g99402'
	and sname='���'

--(6)����ͼstud_query_View2�в���һ�����ݡ�
--ѧ�ţ�g9940209���������������༶��g99402��
--�Ա��У���ͥסַ���Ͼ���ɽ��·10�ţ�����17�ꡣ
--�������ݺ����Ƿ�������Ϣ���浽student���С�
insert 
into stud_query_View2
values('g9940209','����','g99402','��','�Ͼ���ɽ��·10��',17)
 
 select *
 from student 
 --������
 
--(7)�޸���ͼstud_query_view2�е����ݡ�
--��stud_query_view2������Ϊ���ֺ족�ļ�ͥ��ַ
--��Ϊ���������Ͼ�·8�š���
update stud_query_view2
set address='�������Ͼ�·8��'
where sname='�ֺ�'


--����
 select *
 from stud_query_view2 
 
 
--(8)����ͼ��stud_query_view2������Ϊ���ֺ족��ͬѧɾ����
delete
from stud_query_view2
where sname='�ֺ�'


--(9)�����û�u1��������student��ѯ�����롢ɾ�����޸ĵ�Ȩ������u1��
create login ul with password='jaingqi'
create user ul for login ul
grant select,insert,delete,update
on student
to ul