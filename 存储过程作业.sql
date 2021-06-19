

--1、定义发货存储过程，输入订单号。
--订单存在，将订单是否发货修改为“已发货”，
--若不存在则打印相关信息
create procedure IsDeliver
@OrderID nchar(10)
as
begin
	if exists(
		select *
		from sell
		where 订单号=@OrderID
		)
		begin
		update sell
		set 是否发货='已发货'
		where 订单号=@OrderID
		end
	else
		begin
			print'你输入的订单号不存在'
			print'请重新输入...'
			rollback
		end
end

--测试
select *
from sell

exec IsDeliver '1'	

--2、定义函数，输入用户号，
--返回该用户所有未结清订单的总金额。

alter   function Total(@UseID nchar(18))
returns real
	begin
		declare @total real
		declare @UseID1 nchar(18)
		
		if exists(--判断用户号是否存在
			select *
			from sell
			where 用户号=@UseID
			)
			begin	
				set @total=0
				select @total=sum(订购册数*订购单价)
				from sell
				where 是否结清 is null and 用户号=@UseID	
			end
		else
			begin
				return 0
			end
	return @total
	end
--测试
select *
from sell

select dbo.Total('A3013') total

	


--3、定义函数，输入用户号和订购起止时间，返回用户的订购汇总，
--包括：用户号，用户名，订单数，消费金额等。

create  function OrderSum(@UseID nchar(18),@OrderStart datetime2(7),@OrderEnd datetime2(7))
returns Table
as 
	return(
	
	select s.用户号,姓名 用户名,订购册数 订单数,订购册数*订购单价 消费金额
	from sell s,members m
	where s.用户号=m.用户号 and s.用户号=@UseID and 订购时间>=@OrderStart and 订购时间<=@OrderEnd
)
--测试
select *
from sell

select *
from members

select *
from dbo.OrderSum('A3013','2009-02-01','2012')