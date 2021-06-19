--1、jwgl2018数据库中的total(department,nums)
--记录了每个专业学生的人数，请编写触发器，当添加、删除学生和更改学生所在的专业时，能够自动更新total表。
create trigger update_total
on student
for insert,delete,update
as
begin
	begin
		update total
		set nums=nums+1
		where department in(
			select department
			 from inserted i
			)
		update total
		set nums=nums-1
		where department in (
			select department 
			from deleted d
			) 
	end
end

--测试

delete student
where sno='g9940209'

update student
set department='dep_01'
where sno='g9940208'

insert student
values('g9940309','陌少雨','男',2020-1995,'g99403','Dep_01','沈阳皇浦区34号')

select *
from total

select *
from student

--2、根据实验四中stud_query_View2视图，
--写触发器，实现向视图stud_query_View2中插入一行数据。
--学号：g9940209，姓名：张鹏，班级：g99402，性别：男，
--家庭住址：南京中山北路10号，年龄17岁。
create trigger insert_stud_query_View2
on stud_query_View2
instead of insert
as
	insert 
	into stud_query_View2(Sno,sname,class,sex,address,age)
	 select Sno,sname,class,'男',address,age
	 from inserted
	 
drop trigger insert_stud_query_View2
--测试
select *
from stud_query_View2
select *
from student
delete student
where sno='g9940209'
insert
into stud_query_View2
values('g9940209','张鹏','g99402','男','南京中山北路10号',17)
