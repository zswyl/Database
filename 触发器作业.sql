--1.触发器自动计算并保存总金额
alter trigger sum on 收费
for insert
as 
	if exists (
		select *
		from inserted i,学生 s
		where i.学号=s.学号
		)
		begin	
		  update 收费
		  set 总金额 = 学费 +书费
		  where 学号 in(
			select 学号 
			from  inserted 
		  )
		end
	else 
		begin
			print '查无此学生'
			rollback; --回滚，取消当前的操作
		end	
 --test
 select * from 学生
 select * from 收费
insert 
into 收费
values(2018,'201815125',4800,1200,null)
delete
from 收费 
where 学号='20181512'


--2.创建触发器，利用视图EV能够向数据库中插入职工的数据
alter trigger insertemp on EV
instead of insert
as
	begin
		--检查输入的职工在表中是否已经存在
		if(not exists(select e.职工号
			from EV e,inserted i
			where e.职工号=i.职工号 ))
			--不存在职工时，插入职工信息
			insert into 职工
			select  职工号,姓名,年龄,职务,工资,d.部门号
			from inserted i,部门 d
			where i.部门名=d.名称
		else
			begin
				print '该职员已存在，请重新插入'
				rollback; --回滚，取消当前的操作
			end
	end
	
--老师写的
	
--Test
select *  from 职工
select *  from 部门
select *  from EV
insert
into EV
values('E0099','张三',20,'一般员工',5600,'开发一部')
delete 
from 职工
where 职工号='E0099'