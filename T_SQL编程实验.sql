--软件1802-朱松望
--1．定义一个函数check_id()，实现如下功能。
--对于1个给定的department_id之值，查询该值在department表中是否存在，若存在返回0，否则返回-1。

create function check_id(@department_id char(6))
returns int 
as
begin
	declare @num int
	if exists (
		select dno 
		from department
		where @department_id=dno
		)
		set @num=0
	else
		set @num=-1
	return @num
end

--测试
select *
from department

select  dbo.check_id('Dep_01') 部门号
select  dbo.check_id('Dep_05') 部门号

--2.写一段T—SQL脚本程序调用上述函数。当向student表插入1条记录时，
--首先调用函数check_id()检索该记录的department_id之值
--在表departments的department_id字段中是否存在对应值，
--若存在，则将该记录插入student表中，否则打印错误提示信息。

--有
use jwgl2018
declare @num int
select @num=dbo.check_id('Dep_01')
if @num=0
	insert student
		values('g9940111','张文杰','女',20,'g99401','Dep_01',null)
else
	print('无该部门号，请重新插入')	
--无
use jwgl2018
declare @num int
select @num=dbo.check_id('Dep_05')
if @num=0
	insert student
		values('g9940111','李四','男',20,'g99403','Dep_05',null)
else
	print('无该部门号，请重新插入')

--测试

select *
from student

--3. 创建一个名为age()的用户自定义函数，用
--于根据给定的学生编号计算学生的年龄，
--然后在查询语句中调用该函数。
create function age(@stu_id char(8))
returns int
begin
	declare @stu_age int
	if exists (
		select sno
		from student
		where sno=@stu_id
		)
		begin	
			select  @stu_age=age 
			from student
			where sno=@stu_id
			return @stu_age
		end
	else
		set @stu_age=0
 return @stu_age
end


--测试
--存在
select dbo.age('g9940110') 年龄
--不存在
select dbo.age('g9940118') 年龄

--4．创建一个名为score()的函数，
--返回一每个学生的学号、姓名和成绩，
--然后在查询语句中调用该函数查询中成绩不及格的学生。
create function score()
returns @table1 Table(
	sno char(8),
	sname varchar(10),
	grade tinyint
	)
as
begin
	insert into @table1
	select s.sno,sname,isnull(writtenScore,0)+isnull(LabScore,0)
	from student s,sc
	where s.sno=sc.sno
	return
end

select *
from dbo.score()
where grade<60


--5．打印乘法口诀表，显示格式如下：
declare @i int
declare @j int
declare @tmp varchar(255)
declare @space int
set @i=1
while @i<=9
begin
 --打印行中的各个列
 set @j=1
 set @tmp=''
 while @j<=@i
 begin
	if(@i*@j>=10)
		set @space=3
	else
		set @space=4	
	set @tmp=@tmp+ cast(@i as varchar)+'*'
		  +convert(varchar(2),@j)+'='
		  +convert(varchar(2),@j)+SPACE(@space)
	set @j=@j+1
 end
 print @tmp
 set @i=@i+1
end