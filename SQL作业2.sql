select *
from book

select *
from members

select *
from sell


----��һ��
select ������,����ʱ��,��������
from sell,members
where members.����='�'

--�ڶ���
select ������,����ʱ��,��������
from sell
where �û��� in(
	select *
	from members
	where ����='�'
	)

--������
select ����
from members
where �û��� not in(
	select �û���
	from sell
 )
	
--������

select ����,������,����ʱ��
from members m left join sell s 
on m.�û���=s.�û���


--������
insert 
into book(ͼ����,ͼ�����,����,����,������,����ʱ��,����,����,�ۿ�,����ͼƬ)
values('B09001','�����','MySQL���','�·�','�廪��ѧ������','2019-08-01','39.9',null,null,null)

--������
delete
from sell
where �û���='m201001'

--������
delete
from sell
where �û��� in(
	select �û���
	from members
	where ����='����'
	)
	
--�ڰ���
update sell
set �Ƿ񷢻�='�ѷ���'
where �û��� in(
	select �û���
	from members
	where ����='����'
	)
	