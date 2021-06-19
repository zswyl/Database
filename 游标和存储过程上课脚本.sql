--cursor 1分43秒

declare c1 cursor
for
select productId
from product
order by productId

declare @productId varchar(255)
declare @id int

set @id=1
open c1;
fetch c1 into @productId
while @@FETCH_STATUS=0
begin
	update product
	set id=@id
	where productId=@productId
	set @id=@id+1
	fetch c1 into @productId
end	
close c1
deallocate c1

--
select *
from product
order by productId

update product
set id=null

create index ix_productId on product(productId)


select *
from sales

--stored procedure

create procedure sp_sum
(
	@a int,
	@b int
)
as
declare @i int
declare @sum int
set @i=@a
set @sum=0
while @i<=@b
begin
	set @sum=@sum+@i
	set @i=@i+1
end

print @sum

--调用存储过程
exec sp_sum 51,100  --按位置传参数
exec sp_sum @b=100,@a=1 --按名传参数

--删除存储过程
drop proc sp_sum

--m*n
create procedure sp_tutor
(
	@a int,
	@b int,
	@r int output
)	
as
	set @r=@a*@b

--Test
 declare @result int
 exec sp_tutor 20,3,@result output
 print @result

--default value 
alter procedure sp_tutor
(
	@a int=2,
	@b int=3,
	@r int output
)	
as
	set @r=@a*@b 
	
--Test
 declare @result int
 exec sp_tutor @b=20,@r=@result output
 print @result	
 
 
declare @result int
 exec sp_tutor @r=@result output
 print @result
 
--return 
alter procedure sp_tutor
(
	@a int=2,
	@b int=3
)	
as
	return @a*@b 
	
--Test
 declare @result int
 exec @result=sp_tutor @b=20
 print @result		
 
 
 --return collect
 
 create proc sp_getStu
 (
	@sdept varchar(20)
 )
 as
	select *
	from student
	where sdept=@sdept
	
	
exec sp_getStu 'is'	

--EV(职工号，姓名，年龄，职务，工资，部门名)
create proc sp_add_emp
(
@职工号 varchar(9),
@姓名 varchar(20),
@年龄 smallint,
@职务 varchar(11),
@工资 numeric(9,2),
@部门 varchar(5)
)
as
insert
into 职工
values(@职工号,@姓名,@年龄,@职务,@工资,@部门)


exec sp_add_emp 'E019090','BBB',26,'----',6900,null


select *
from 职工