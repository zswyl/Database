--1.�������Զ����㲢�����ܽ��
alter trigger sum on �շ�
for insert
as 
	if exists (
		select *
		from inserted i,ѧ�� s
		where i.ѧ��=s.ѧ��
		)
		begin	
		  update �շ�
		  set �ܽ�� = ѧ�� +���
		  where ѧ�� in(
			select ѧ�� 
			from  inserted 
		  )
		end
	else 
		begin
			print '���޴�ѧ��'
			rollback; --�ع���ȡ����ǰ�Ĳ���
		end	
 --test
 select * from ѧ��
 select * from �շ�
insert 
into �շ�
values(2018,'201815125',4800,1200,null)
delete
from �շ� 
where ѧ��='20181512'


--2.������������������ͼEV�ܹ������ݿ��в���ְ��������
alter trigger insertemp on EV
instead of insert
as
	begin
		--��������ְ���ڱ����Ƿ��Ѿ�����
		if(not exists(select e.ְ����
			from EV e,inserted i
			where e.ְ����=i.ְ���� ))
			--������ְ��ʱ������ְ����Ϣ
			insert into ְ��
			select  ְ����,����,����,ְ��,����,d.���ź�
			from inserted i,���� d
			where i.������=d.����
		else
			begin
				print '��ְԱ�Ѵ��ڣ������²���'
				rollback; --�ع���ȡ����ǰ�Ĳ���
			end
	end
	
--��ʦд��
	
--Test
select *  from ְ��
select *  from ����
select *  from EV
insert
into EV
values('E0099','����',20,'һ��Ա��',5600,'����һ��')
delete 
from ְ��
where ְ����='E0099'