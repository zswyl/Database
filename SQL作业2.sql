select *
from book

select *
from members

select *
from sell


----第一题
select 订单号,订购时间,订购单价
from sell,members
where members.姓名='李华'

--第二题
select 订单号,订购时间,订购单价
from sell
where 用户号 in(
	select *
	from members
	where 姓名='李华'
	)

--第三题
select 姓名
from members
where 用户号 not in(
	select 用户号
	from sell
 )
	
--第四题

select 姓名,订单号,订购时间
from members m left join sell s 
on m.用户号=s.用户号


--第五题
insert 
into book(图书编号,图书类别,书名,作者,出版社,出版时间,单价,数量,折扣,封面图片)
values('B09001','计算机','MySQL编程','陈锋','清华大学出版社','2019-08-01','39.9',null,null,null)

--第六题
delete
from sell
where 用户号='m201001'

--第七题
delete
from sell
where 用户号 in(
	select 用户号
	from members
	where 姓名='黎明'
	)
	
--第八题
update sell
set 是否发货='已发货'
where 用户号 in(
	select 用户号
	from members
	where 姓名='黎明'
	)
	