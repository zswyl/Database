create trigger tr_add_sf on �շ�
for insert,update
as
	if exists(
		select *
		from inserted,ѧ��
		where inserted.ѧ��=ѧ��.ѧ��
	)
	begin
		update �շ�
		set �ܽ��=ѧ��+���
		where ѧ�� in(
			select ѧ��
			from inserted
		)
	
	end
	else
	begin
		print '-----------'
		rollback
	end

go	
--method 2
create trigger tr_add_sf2 on �շ�
instead of insert
as
	if exists(
		select *
		from inserted,ѧ��
		where inserted.ѧ��=ѧ��.ѧ��
	)
	begin
		insert
		into �շ�
		select ѧ��,ѧ��,ѧ��,���,�ܽ��=ѧ��+���
		from inserted		
	
	end
	else
	begin
		print '-----------'
		rollback
	end	
	
	--Test
	insert
	into �շ�
	values(2019,201815121,3800,300,null)
	
	
	select *
	from �շ�
	
	select * from ѧ��
	
--2.
create trigger tr_add_ev on ev
instead of insert
as
begin
	if exists(
		select *
		from inserted i,���� d
		where i.������=d.����
	)
	begin
		insert
		into ְ��
		select ְ����,����,����,ְ��,����,���ź�
		from inserted i,���� d
		where i.������=d.����
	end
	else
	begin
		print '--------------'
		rollback
	end
end	