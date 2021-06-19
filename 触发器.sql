create trigger reminder on course
after delete
as
  print 'You have just deleted '
		+cast(@@rowcount as varchar)
		+' row(s).'

--
create trigger tr_del on course
after delete
as
	select *
	from deleted

--Test		
delete
from Course
where Cno=6

--修改学生成绩不能为负数
create trigger tr_update_sc on sc
for update
as
	if exists (select * from inserted where Grade<0)
	begin
		print '成绩不能为负数'
		rollback; --回滚，取消当前的操作
	end
go;
--优化
alter trigger tr_update_sc on sc
for update
as
	if UPDATE(grade)
	begin
		print '---------------'
		if exists (select * from inserted where Grade<0)
		begin
			print '成绩不能为负数'
			rollback; --回滚，取消当前的操作
		end	
	end
--Test
select * from sc
update sc
set Grade=-10
where Sno=200215121 and Cno=2

update sc
set Grade=10
where Sno=200215121 and Cno=2


update sc
set cno=5
where Sno=200215121 and Cno=2
--升级，	修改学生成绩，成绩只能增加不能减少
go;	
create trigger tr_update_sc2 on sc
for update
as
	if UPDATE(grade)
	begin
		if exists (
			select *
			from deleted d,inserted i
			where d.Sno=i.Sno and d.Cno=i.cno 
				  and i.Grade<d.grade
		)
		begin
			print '成绩不能减少'
			rollback; --回滚，取消当前的操作
		end	
	end

--Test
select * from sc
update sc
set Grade=80
where Sno=200215121 and Cno=5

select * from sc
update sc
set Grade=10
where Sno=200215121 and Cno=5	

--利用触发器在学生选课时，将每门课程的选课人数统计到表T(cno,num)中
create table t(
     cno char(5) primary key,
     num int default(0)
)
--新的选课
create trigger tr_add_sc2 on sc2
for insert
as
  if not exists(  
	select *
	from inserted i,T
	where i.cno=T.cno)
  begin		--第一个选择本课程的同学
	insert
	into T
	select cno,1
	from inserted
  end
  else    --不是第一个选择本课程的同学
  begin
	update t
	set num=num+1
	where cno=(
		select cno
		from inserted)
  end


--Test
select *
into sc2
from sc
where 1=0

select * from sc2
select * from t
insert
into sc2
values(200215121,1,null)

insert
into sc2
values(200215122,1,null)

insert
into sc2
values(200215122,2,null)

--退课
create trigger tr_del_sc2 on sc2
for delete
as
  if exists(
	select *
	from deleted d,t
	where d.cno=t.cno and num=1)
  begin  --选择本课程的最后一名同学
	delete
	from t
	where cno=(
		select cno
		from deleted)
  end
  else   --不是选择本课程的最后一名同学
  begin
	update t
	set num=num-1
	where cno=(
		select cno
		from deleted)
  end
  
--Test
select * from t
select * from sc2
delete
from sc2
where sno=200215121 and cno=1  

delete
from sc2
where sno=200215122 and cno=1  

--instead of
create trigger tr_del_student on student
instead of delete
as
  print '----------------------'


--Test
delete from student

select * from student

--定义在视图上的触发器
CREATE VIEW IS_Student
AS 
SELECT Sno,Sname,year(getdate())-Sage sbirth
FROM    Student
WHERE  Sdept= 'IS';

select * from is_student
select * from student
--
insert
into IS_Student
values(200215129,'AAA',2003)

--trigger instead of 
create trigger tr_add_IsStudent on is_student
instead of insert
as
  insert
  into student(Sno,Sname,Sage,sdept)
  select sno,sname,year(getdate())-sbirth,'IS'
  from inserted

--drop trigger
drop trigger tr_add_IsStudent