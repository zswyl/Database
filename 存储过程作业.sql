

--1�����巢���洢���̣����붩���š�
--�������ڣ��������Ƿ񷢻��޸�Ϊ���ѷ�������
--�����������ӡ�����Ϣ
create procedure IsDeliver
@OrderID nchar(10)
as
begin
	if exists(
		select *
		from sell
		where ������=@OrderID
		)
		begin
		update sell
		set �Ƿ񷢻�='�ѷ���'
		where ������=@OrderID
		end
	else
		begin
			print'������Ķ����Ų�����'
			print'����������...'
			rollback
		end
end

--����
select *
from sell

exec IsDeliver '1'	

--2�����庯���������û��ţ�
--���ظ��û�����δ���嶩�����ܽ�

alter   function Total(@UseID nchar(18))
returns real
	begin
		declare @total real
		declare @UseID1 nchar(18)
		
		if exists(--�ж��û����Ƿ����
			select *
			from sell
			where �û���=@UseID
			)
			begin	
				set @total=0
				select @total=sum(��������*��������)
				from sell
				where �Ƿ���� is null and �û���=@UseID	
			end
		else
			begin
				return 0
			end
	return @total
	end
--����
select *
from sell

select dbo.Total('A3013') total

	


--3�����庯���������û��źͶ�����ֹʱ�䣬�����û��Ķ������ܣ�
--�������û��ţ��û����������������ѽ��ȡ�

create  function OrderSum(@UseID nchar(18),@OrderStart datetime2(7),@OrderEnd datetime2(7))
returns Table
as 
	return(
	
	select s.�û���,���� �û���,�������� ������,��������*�������� ���ѽ��
	from sell s,members m
	where s.�û���=m.�û��� and s.�û���=@UseID and ����ʱ��>=@OrderStart and ����ʱ��<=@OrderEnd
)
--����
select *
from sell

select *
from members

select *
from dbo.OrderSum('A3013','2009-02-01','2012')