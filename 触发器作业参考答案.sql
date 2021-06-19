create trigger tr_add_sf on 收费
for insert,update
as
	if exists(
		select *
		from inserted,学生
		where inserted.学号=学生.学号
	)
	begin
		update 收费
		set 总金额=学费+书费
		where 学号 in(
			select 学号
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
create trigger tr_add_sf2 on 收费
instead of insert
as
	if exists(
		select *
		from inserted,学生
		where inserted.学号=学生.学号
	)
	begin
		insert
		into 收费
		select 学年,学号,学费,书费,总金额=学费+书费
		from inserted		
	
	end
	else
	begin
		print '-----------'
		rollback
	end	
	
	--Test
	insert
	into 收费
	values(2019,201815121,3800,300,null)
	
	
	select *
	from 收费
	
	select * from 学生
	
--2.
create trigger tr_add_ev on ev
instead of insert
as
begin
	if exists(
		select *
		from inserted i,部门 d
		where i.部门名=d.名称
	)
	begin
		insert
		into 职工
		select 职工号,姓名,年龄,职务,工资,部门号
		from inserted i,部门 d
		where i.部门名=d.名称
	end
	else
	begin
		print '--------------'
		rollback
	end
end	