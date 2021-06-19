--�������ݿ�
create database librarysystem
--drop database librarysystem
create table ���(
	��� char(2) primary key,
	���� int
)
--drop table ���
--����ͼ�������Ϣ��
create table ͼ�������Ϣ(
	isbn char(20)  primary key,
	���� char(20),
	���� char(20),
	������ char(20),
	�������� date ,
	���� real,
)
--drop table ͼ�������Ϣ
--����ͼ����Ϣ��
create table ͼ����Ϣ(
	ͼ���� char(20) ,
	ͼ������� char(20)  primary key,
	isbn char(20) foreign key references ͼ�������Ϣ(isbn),
	��� char(2)foreign key references ���(���),
	�Ƿ�ɽ� char(6) check(�Ƿ�ɽ� in ('�ɽ�','���ɽ�')),
	�Ƿ��� char(6) check(�Ƿ��� in ('���','δ��'))
)
--drop table ͼ����Ϣ


--��������Ա��
create table ����Ա(
	����Ա��� char(20) primary key,
	����Ա���� char(20),
	�Ա� char(2) check(�Ա� in('��','Ů'))
)
--drop table ����Ա
--�������߱�
create table ����(
	����֤�� char(20) primary key,
	�������� char(20),
	�Ա� char(2) check(�Ա� in('��','Ů')),
 	�ɽ����� int ,
	�ɽ�ʱ�� int,
	����֤״̬ char(6) check(����֤״̬ in('����','����','��ʧ'))
)
--drop table ����
--�����軹��
create table ͼ��軹(
	ͼ������� char(20) foreign key references ͼ����Ϣ(ͼ�������),
	����֤�� char(20) foreign key references ����(����֤��),
	����Ա��� char(20) foreign key references ����Ա(����Ա���),
	�軹״̬ char(2) check(�軹״̬ in('��','��')),
	�軹���� date
)
--drop table ͼ��軹
create table ����(
	����֤�� char(20) foreign key references ����(����֤��),
	ͼ������� char(20) foreign key references ͼ����Ϣ(ͼ�������),
	�������� int,
	������ float,
)
--drop table ����
--������Ϣ¼��
create proc ����¼��
@isbn char(20),@���� char(20),
@��� char(2),@���� char(20),
@������ char(20),@�������� date ,@���� real,
@ͼ���� char(20),@�Ƿ�ɽ� char(6)
as
declare @ͼ������� char(20);
begin
	insert into ͼ�������Ϣ
	values(@isbn,@����,@����,@������,@��������,@����)
	set @ͼ�������=@ͼ����
	insert into ͼ����Ϣ 
	values(@ͼ����,@ͼ�������,@isbn,@���,@�Ƿ�ɽ�,'δ��')
	update ��� 
	set ����=����+1
	where ���=@���
	if (@@ROWCOUNT>0)
            return 0   --��0���������Ϣ�ɹ�
     else 
             return 1  --��1���������Ϣʧ��
end
--����
--drop proc ����¼��


select *
from ͼ����Ϣ

--ͼ�������Ա¼��
create proc ��ӹ���Ա
@����Ա��� char(20),@����Ա���� char(20),
@�Ա� char(2)
as
begin
	insert into ����Ա
	values(@����Ա���,@����Ա����,@�Ա�)
	if (@@ROWCOUNT>0)
            return 0   --��0���������Ϣ�ɹ�
     else 
             return 1  --��1���������Ϣʧ��
end


--drop proc ��ӹ���Ա
--����
exec ��ӹ���Ա '1811030201','����','Ů'
select *
from ����Ա


--Ա��֤����
create proc ��Ӷ���
@����֤�� char(20),@�������� char(20),
@�Ա� char(2)
as
begin
	insert into ����
	values(@����֤��,@��������,@�Ա�,6,30,'����')
	if (@@ROWCOUNT>0)
            return 0   --��0���������Ϣ�ɹ�
     else 
             return 1  --��1���������Ϣʧ��
end

--drop proc ��Ӷ���
--ͼ�����
create proc ͼ�����
@ͼ������� char(20),@����֤�� char(20),
@����Ա��� char(20)
as
begin
	declare @�Ƿ�ɽ�  char(6)
	declare @�Ƿ���  char(6)
	declare @�������� date
	declare @����֤״̬ char(6)
	set @�Ƿ�ɽ�=(select �Ƿ�ɽ� from ͼ����Ϣ where ͼ�������=@ͼ�������)
	set @�Ƿ���=(select �Ƿ��� from ͼ����Ϣ where ͼ�������=@ͼ�������)
	set @��������=getdate()--��õ�ǰ��������������
	set @����֤״̬=(select ����֤״̬ from ���� where ����֤��=@����֤��)
	if(@�Ƿ�ɽ�='���ɽ�')
		begin
			set @����֤״̬='����'
			print '��ͼ��Ϊ��ذ棬л�����ģ�'
		end
	if(@�Ƿ���='���')
		begin
			set @����֤״̬='����'
			print '��ͼ���ѱ����˽��ģ������ٽ��ģ�'
		end
	if(@����֤״̬='����'and @�Ƿ�ɽ�='�ɽ�'and @�Ƿ���='δ��' )
		begin
			insert into ͼ��軹
			values(@ͼ�������,@����֤��,@����Ա���,'��',@��������)
			update ͼ����Ϣ set �Ƿ���='���' where ͼ�������=@ͼ�������
			update ���� set �ɽ�����=�ɽ�����-1 where ����֤��=@����֤��
		end
end

--drop proc ͼ�����
--�ж�������������Ƿ񳬹���������
create trigger ��������
on ͼ��軹 
for insert
as 
begin
	if exists(select �ɽ�����
		from ���� join inserted
		on ����.����֤��=inserted.����֤��
		 where �ɽ�����<=0)
	begin
		print '���Ѵﵽ�������������뻹��֮���ٽ裬лл��'
		rollback	
	end
end

--drop trigger ��������
--�жϽ���֤�Ƿ��ʧ
create trigger �Ƿ��ʧ
on ͼ��軹
after insert
as 
begin
	if (select ����֤״̬
		from ���� join inserted
		on ����.����֤��=inserted.����֤��
		)='��ʧ'
	begin
		print '�ý���֤�ѹ�ʧ�����ܽ���ͼ��'
		rollback
	end
end
--drop trigger �Ƿ��ʧ

--�жϽ���֤���ͼ���Ƿ���
create trigger �Ƿ���
on ͼ��軹
after insert
as 
begin 
if exists (
		select datediff(day,ͼ��軹.�軹����,getdate())
		from ͼ��軹 join inserted
		on ͼ��軹.����֤��=inserted.����֤��
		where ͼ��軹.�軹״̬='��'and datediff(day,ͼ��軹.�軹����,getdate())>30
		)
	begin
		print '���г��ڵ�ͼ�飬�뻹��ͽ�������֮���ٽ��ģ�лл��'
		rollback
	end
end
--drop trigger �Ƿ���
   
--ͼ��黹
create proc ͼ��黹
@ͼ������� char(20),@����֤�� char(20),
@����Ա��� char(20)
as
begin
	declare @�������� date
	declare @�������� int
	declare @������ float
	set @��������=getdate()
	--set nocount on; --������Ӱ������
��--��set xact_abort on; --ʹ�ô洢����ִ��������Ҫ����XACT_ABORT����(Ĭ��ΪOFF)
	set @��������=(select datediff(day,�軹����,getdate())
		from ͼ��軹 
		where ����֤��=@����֤�� and ͼ�������=@ͼ�������
			and �軹״̬='��' and ����Ա���=@����Ա���)-30
	set @������=@��������*0.1
	if(@��������>0)
	begin
		begin tran--��ʼ����
			insert into ����
			values (@����֤��,@ͼ�������,@��������,@������)

			print '�㱾�����ѳ��ڣ��黹ǰ���Ƚ��·��� '+@������
		commit tran  --�޴����ύ����
	end   --if����
	else
	begin 
		if(select �ɽ����� from ���� where ����֤��=@����֤��)<6
		begin
			begin tran--��ʼ����
				update ͼ��軹 
				set �軹����=@��������,�軹״̬='��',����Ա���=@����Ա���
				where ͼ�������=@ͼ�������
				
				update ���� 
				set �ɽ�����=�ɽ�����+1 where ����֤��=@����֤��
				update ͼ����Ϣ 
				set �Ƿ���='δ��' where ͼ�������=@ͼ�������
			commit tran  --�޴����ύ����
		end else
		begin
			print '�㻹û�н��Ĺ�ͼ�飡'
		end
	end
end



create proc ��֤��ʧ
@����֤�� char(20)
as
begin
	update ���� 
	set ����֤״̬='��ʧ'
	where ����֤��=@����֤��
end
--drop proc ��֤��ʧ
create proc ��֤�ָ�
@����֤�� char(20)
as
begin
	update ���� 
	set ����֤״̬='����'
	where ����֤��=@����֤��
end
--drop proc ��֤�ָ�

--�����߲�ѯͼ�������Ϣ�����軹���ڽ�������
create proc ����֤�Ų�ѯ������Ϣ
@����֤�� char(20)
as
begin
	declare @ͼ���� char(20)
	declare @���� char(20)
	declare @�軹״̬ char(2)
	declare @�軹���� date
	declare @����Ա���� char(20)

	declare bt cursor for
		select ͼ����,����,�軹״̬,�軹����,����Ա����
		from ͼ��軹,ͼ����Ϣ,ͼ�������Ϣ,����Ա
		where ͼ����Ϣ.isbn=ͼ�������Ϣ.isbn and ����֤��=@����֤��
				and ͼ��軹.����Ա���=����Ա.����Ա���
				and ͼ��軹.ͼ�������=ͼ����Ϣ.ͼ�������
		order by �軹���� desc

		open bt

		print '���룺 '+@����֤��
		print '����� '
		print 'ͼ����'+space(15)+'����'+space(13)+'��/��'+space(11)+'����'+space(9)+'������'
		print '----------------------------------------------------------------------------------------------------'
		
		fetch bt into
		@ͼ����,@���� ,@�軹״̬,@�軹����, @����Ա����

		while @@FETCH_STATUS=0
		begin
			print @ͼ����+@����+@�軹״̬+space(9)+convert(char(10),@�軹����)+space(7)+@����Ա����
			fetch bt into
			@ͼ����,@����,@�軹״̬,@�軹����,@����Ա����
		end
		close bt
		deallocate bt
end
--drop function ����֤�Ų�ѯ������Ϣ
--��ͼ�������ѯ������Ϣ�����軹���ڽ�������

create proc ͼ�������ѯ������Ϣ
@ͼ������� char(20)
as
begin
	declare @���߱�� char(20)
	declare @���� char(20)
	declare @�軹״̬ char(2)
	declare @�軹���� date
	declare @����Ա���� char(20)
	declare @���� char(20)
	set @����=(select ����
		from ͼ�������Ϣ,ͼ����Ϣ
		where ͼ�������Ϣ.isbn=ͼ����Ϣ.isbn and ͼ�������=@ͼ�������
	)
	declare bt cursor for
		select ����.����֤��,��������,�軹״̬,�軹����,����Ա����
		from ͼ��軹,����,����Ա
		where @ͼ�������=@ͼ������� and ͼ��軹.����Ա���=����Ա.����Ա���
				and ����.����֤��=ͼ��軹.����֤��
		order by �軹���� desc
		open bt

		print '���룺 '+@ͼ�������
		print '����� '
		print space(6)+'ͼ�����ƣ� '+@����
		print '���߱��'+space(15)+'����'+space(13)+'��/��'+space(11)+'����'+space(9)+'������'
		print '----------------------------------------------------------------------------------------------------'
		
		fetch bt into
		 @���߱��,@���� ,@�軹״̬,@�軹����, @����Ա����

		while @@FETCH_STATUS=0
		begin
			print @���߱��+space(2)+@����+@�軹״̬+space(9)+convert(char(10),@�軹����)+space(7)+@����Ա����
			fetch bt into
			 @���߱��,@���� ,@�軹״̬,@�軹����, @����Ա����
		end
		close bt
		deallocate bt
end
--drop proc ͼ�������ѯ������Ϣ
alter proc ͳ��
as
begin
	declare @��� char(2)
	declare @�ݲ����� int
	declare @������� int
	declare @������� float
	declare gc cursor for
	select ���,����
	from ���
	open gc
	fetch gc into @���,@�ݲ�����
	print '��� '+'		'+'�ݲ����� '+'		'+'�������'
	while (@@FETCH_STATUS=0)
	begin
		set @�������=(select count(ͼ��軹.ͼ�������)
			from ͼ��軹,ͼ����Ϣ
			where �軹״̬='��' and ͼ��軹.ͼ�������=ͼ����Ϣ.ͼ�������
				and ���=@���
			)
		set @�������=@�������*1.0/@�ݲ�����
		print @���+'				'+convert(varchar(3),@�ݲ�����)+'	'+convert(varchar(12),(@�������)*100)+'%'
		fetch gc into @���,@�ݲ�����
	end
	close gc
	deallocate gc
end


--��д��������ѯĳ��֤�Ƿ��ڳ���״̬������0=�����ڣ�1=����
create function ���޳���(@����֤�� char(20))
returns int 
as
begin
	declare @x int
	if exists (
		select datediff(day,ͼ��軹.�軹����,getdate())
		from ͼ��軹
		where ͼ��軹.����֤��=@����֤�� and
		ͼ��軹.�軹״̬='��'and datediff(day,ͼ��軹.�軹����,getdate())>30
		)
		set @x=1
	else
		set @x=0
	return @x
end

select dbo.���޳���('500') ���޳���

