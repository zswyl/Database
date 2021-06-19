--创建数据库
create database librarysystem
--drop database librarysystem
create table 类别(
	类别 char(2) primary key,
	册数 int
)
--drop table 类别
--创建图书基本信息表
create table 图书基本信息(
	isbn char(20)  primary key,
	书名 char(20),
	作者 char(20),
	出版社 char(20),
	出版日期 date ,
	单价 real,
)
--drop table 图书基本信息
--创建图书信息表
create table 图书信息(
	图书编号 char(20) ,
	图书条码号 char(20)  primary key,
	isbn char(20) foreign key references 图书基本信息(isbn),
	类别 char(2)foreign key references 类别(类别),
	是否可借 char(6) check(是否可借 in ('可借','不可借')),
	是否借出 char(6) check(是否借出 in ('借出','未借'))
)
--drop table 图书信息


--创建管理员表
create table 管理员(
	管理员编号 char(20) primary key,
	管理员姓名 char(20),
	性别 char(2) check(性别 in('男','女'))
)
--drop table 管理员
--创建读者表
create table 读者(
	借书证号 char(20) primary key,
	读者姓名 char(20),
	性别 char(2) check(性别 in('男','女')),
 	可借数量 int ,
	可借时间 int,
	借书证状态 char(6) check(借书证状态 in('可用','禁用','挂失'))
)
--drop table 读者
--创建借还表
create table 图书借还(
	图书条码号 char(20) foreign key references 图书信息(图书条码号),
	借书证号 char(20) foreign key references 读者(借书证号),
	管理员编号 char(20) foreign key references 管理员(管理员编号),
	借还状态 char(2) check(借还状态 in('借','还')),
	借还日期 date
)
--drop table 图书借还
create table 罚款(
	借书证号 char(20) foreign key references 读者(借书证号),
	图书条码号 char(20) foreign key references 图书信息(图书条码号),
	超期天数 int,
	罚款金额 float,
)
--drop table 罚款
--新书信息录入
create proc 新书录入
@isbn char(20),@书名 char(20),
@类别 char(2),@作者 char(20),
@出版社 char(20),@出版日期 date ,@单价 real,
@图书编号 char(20),@是否可借 char(6)
as
declare @图书条码号 char(20);
begin
	insert into 图书基本信息
	values(@isbn,@书名,@作者,@出版社,@出版日期,@单价)
	set @图书条码号=@图书编号
	insert into 图书信息 
	values(@图书编号,@图书条码号,@isbn,@类别,@是否可借,'未借')
	update 类别 
	set 册数=册数+1
	where 类别=@类别
	if (@@ROWCOUNT>0)
            return 0   --用0代表插入信息成功
     else 
             return 1  --用1代表插入信息失败
end
--测试
--drop proc 新书录入


select *
from 图书信息

--图书管理人员录入
create proc 添加管理员
@管理员编号 char(20),@管理员姓名 char(20),
@性别 char(2)
as
begin
	insert into 管理员
	values(@管理员编号,@管理员姓名,@性别)
	if (@@ROWCOUNT>0)
            return 0   --用0代表插入信息成功
     else 
             return 1  --用1代表插入信息失败
end


--drop proc 添加管理员
--测试
exec 添加管理员 '1811030201','刘丽','女'
select *
from 管理员


--员工证办理
create proc 添加读者
@借书证号 char(20),@读者姓名 char(20),
@性别 char(2)
as
begin
	insert into 读者
	values(@借书证号,@读者姓名,@性别,6,30,'可用')
	if (@@ROWCOUNT>0)
            return 0   --用0代表插入信息成功
     else 
             return 1  --用1代表插入信息失败
end

--drop proc 添加读者
--图书借阅
create proc 图书借阅
@图书条码号 char(20),@借书证号 char(20),
@管理员编号 char(20)
as
begin
	declare @是否可借  char(6)
	declare @是否借出  char(6)
	declare @借书日期 date
	declare @借书证状态 char(6)
	set @是否可借=(select 是否可借 from 图书信息 where 图书条码号=@图书条码号)
	set @是否借出=(select 是否借出 from 图书信息 where 图书条码号=@图书条码号)
	set @借书日期=getdate()--获得当前借书日期年月日
	set @借书证状态=(select 借书证状态 from 读者 where 借书证号=@借书证号)
	if(@是否可借='不可借')
		begin
			set @借书证状态='禁用'
			print '此图书为珍藏版，谢绝借阅！'
		end
	if(@是否借出='借出')
		begin
			set @借书证状态='禁用'
			print '此图书已被他人借阅，不可再借阅！'
		end
	if(@借书证状态='可用'and @是否可借='可借'and @是否借出='未借' )
		begin
			insert into 图书借还
			values(@图书条码号,@借书证号,@管理员编号,'借',@借书日期)
			update 图书信息 set 是否借出='借出' where 图书条码号=@图书条码号
			update 读者 set 可借数量=可借数量-1 where 借书证号=@借书证号
		end
end

--drop proc 图书借阅
--判断所借书的数量是否超过最大借书量
create trigger 借阅数量
on 图书借还 
for insert
as 
begin
	if exists(select 可借数量
		from 读者 join inserted
		on 读者.借书证号=inserted.借书证号
		 where 可借数量<=0)
	begin
		print '您已达到最大借阅数量，请还书之后再借，谢谢！'
		rollback	
	end
end

--drop trigger 借阅数量
--判断借书证是否挂失
create trigger 是否挂失
on 图书借还
after insert
as 
begin
	if (select 借书证状态
		from 读者 join inserted
		on 读者.借书证号=inserted.借书证号
		)='挂失'
	begin
		print '该借书证已挂失，不能借阅图书'
		rollback
	end
end
--drop trigger 是否挂失

--判断借书证里的图书是否超期
create trigger 是否超期
on 图书借还
after insert
as 
begin 
if exists (
		select datediff(day,图书借还.借还日期,getdate())
		from 图书借还 join inserted
		on 图书借还.借书证号=inserted.借书证号
		where 图书借还.借还状态='借'and datediff(day,图书借还.借还日期,getdate())>30
		)
	begin
		print '您有超期的图书，请还书和交过罚款之后再借阅，谢谢！'
		rollback
	end
end
--drop trigger 是否超期
   
--图书归还
create proc 图书归还
@图书条码号 char(20),@借书证号 char(20),
@管理员编号 char(20)
as
begin
	declare @还书日期 date
	declare @超期天数 int
	declare @罚款金额 float
	set @还书日期=getdate()
	--set nocount on; --不返回影响行数
　--　set xact_abort on; --使用存储过程执行事务需要开启XACT_ABORT参数(默认为OFF)
	set @超期天数=(select datediff(day,借还日期,getdate())
		from 图书借还 
		where 借书证号=@借书证号 and 图书条码号=@图书条码号
			and 借还状态='借' and 管理员编号=@管理员编号)-30
	set @罚款金额=@超期天数*0.1
	if(@超期天数>0)
	begin
		begin tran--开始事务
			insert into 罚款
			values (@借书证号,@图书条码号,@超期天数,@罚款金额)

			print '你本册书已超期，归还前请先交下罚金： '+@罚款金额
		commit tran  --无错误提交事务
	end   --if结束
	else
	begin 
		if(select 可借数量 from 读者 where 借书证号=@借书证号)<6
		begin
			begin tran--开始事务
				update 图书借还 
				set 借还日期=@还书日期,借还状态='还',管理员编号=@管理员编号
				where 图书条码号=@图书条码号
				
				update 读者 
				set 可借数量=可借数量+1 where 借书证号=@借书证号
				update 图书信息 
				set 是否借出='未借' where 图书条码号=@图书条码号
			commit tran  --无错误提交事务
		end else
		begin
			print '你还没有借阅过图书！'
		end
	end
end



create proc 书证挂失
@借书证号 char(20)
as
begin
	update 读者 
	set 借书证状态='挂失'
	where 借书证号=@借书证号
end
--drop proc 书证挂失
create proc 书证恢复
@借书证号 char(20)
as
begin
	update 读者 
	set 借书证状态='可用'
	where 借书证号=@借书证号
end
--drop proc 书证恢复

--按读者查询图书借阅信息，按借还日期降序排列
create proc 借书证号查询借阅信息
@借书证号 char(20)
as
begin
	declare @图书编号 char(20)
	declare @书名 char(20)
	declare @借还状态 char(2)
	declare @借还日期 date
	declare @管理员姓名 char(20)

	declare bt cursor for
		select 图书编号,书名,借还状态,借还日期,管理员姓名
		from 图书借还,图书信息,图书基本信息,管理员
		where 图书信息.isbn=图书基本信息.isbn and 借书证号=@借书证号
				and 图书借还.管理员编号=管理员.管理员编号
				and 图书借还.图书条码号=图书信息.图书条码号
		order by 借还日期 desc

		open bt

		print '输入： '+@借书证号
		print '输出： '
		print '图书编号'+space(15)+'书名'+space(13)+'借/还'+space(11)+'日期'+space(9)+'经收人'
		print '----------------------------------------------------------------------------------------------------'
		
		fetch bt into
		@图书编号,@书名 ,@借还状态,@借还日期, @管理员姓名

		while @@FETCH_STATUS=0
		begin
			print @图书编号+@书名+@借还状态+space(9)+convert(char(10),@借还日期)+space(7)+@管理员姓名
			fetch bt into
			@图书编号,@书名,@借还状态,@借还日期,@管理员姓名
		end
		close bt
		deallocate bt
end
--drop function 借书证号查询借阅信息
--按图书条码查询借阅信息，按借还日期降序排列

create proc 图书条码查询借阅信息
@图书条码号 char(20)
as
begin
	declare @读者编号 char(20)
	declare @姓名 char(20)
	declare @借还状态 char(2)
	declare @借还日期 date
	declare @管理员姓名 char(20)
	declare @书名 char(20)
	set @书名=(select 书名
		from 图书基本信息,图书信息
		where 图书基本信息.isbn=图书信息.isbn and 图书条码号=@图书条码号
	)
	declare bt cursor for
		select 读者.借书证号,读者姓名,借还状态,借还日期,管理员姓名
		from 图书借还,读者,管理员
		where @图书条码号=@图书条码号 and 图书借还.管理员编号=管理员.管理员编号
				and 读者.借书证号=图书借还.借书证号
		order by 借还日期 desc
		open bt

		print '输入： '+@图书条码号
		print '输出： '
		print space(6)+'图书名称： '+@书名
		print '读者编号'+space(15)+'姓名'+space(13)+'借/还'+space(11)+'日期'+space(9)+'经收人'
		print '----------------------------------------------------------------------------------------------------'
		
		fetch bt into
		 @读者编号,@姓名 ,@借还状态,@借还日期, @管理员姓名

		while @@FETCH_STATUS=0
		begin
			print @读者编号+space(2)+@姓名+@借还状态+space(9)+convert(char(10),@借还日期)+space(7)+@管理员姓名
			fetch bt into
			 @读者编号,@姓名 ,@借还状态,@借还日期, @管理员姓名
		end
		close bt
		deallocate bt
end
--drop proc 图书条码查询借阅信息
alter proc 统计
as
begin
	declare @类别 char(2)
	declare @馆藏数量 int
	declare @借出类数 int
	declare @借出比例 float
	declare gc cursor for
	select 类别,册数
	from 类别
	open gc
	fetch gc into @类别,@馆藏数量
	print '类别 '+'		'+'馆藏数量 '+'		'+'借出比例'
	while (@@FETCH_STATUS=0)
	begin
		set @借出类数=(select count(图书借还.图书条码号)
			from 图书借还,图书信息
			where 借还状态='借' and 图书借还.图书条码号=图书信息.图书条码号
				and 类别=@类别
			)
		set @借出比例=@借出类数*1.0/@馆藏数量
		print @类别+'				'+convert(varchar(3),@馆藏数量)+'	'+convert(varchar(12),(@借出比例)*100)+'%'
		fetch gc into @类别,@馆藏数量
	end
	close gc
	deallocate gc
end


--编写函数，查询某书证是否处于超期状态，返回0=不超期，1=超期
create function 有无超期(@借书证号 char(20))
returns int 
as
begin
	declare @x int
	if exists (
		select datediff(day,图书借还.借还日期,getdate())
		from 图书借还
		where 图书借还.借书证号=@借书证号 and
		图书借还.借还状态='借'and datediff(day,图书借还.借还日期,getdate())>30
		)
		set @x=1
	else
		set @x=0
	return @x
end

select dbo.有无超期('500') 有无超期

