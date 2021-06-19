--软件1802-朱松望
--1、请创建存储过程，查看“计算机基础”
--课程本次考试平均分以及未通过考试的学员名单。
--（笔试成绩满分80分，上机成绩满分20分，双科成绩均达到满分的80%以上为优秀，
--单科不足满分的60%为不合格，否则为合格）。(提示：用带有游标的存储过程)
create procedure computer_test_stu
as
begin
	declare @writtenAvg float,@labAvg float
	select @writtenAvg=AVG(isnull(writtenScore,0)),@labAvg=AVG(ISNULL(labscore,0))
	from sc join course c
	on sc.cno=c.cno
	where cname='计算机基础'
	print '笔试平均成绩：     '+convert(varchar(6),@writtenAvg)
	print '上机平均成绩：     '+convert(varchar(6),@labAvg)
	if(@writtenAvg>80*0.8 and @labAvg>20*0.8)
		print '本次考试成绩：	  优秀'
	else if(@writtenAvg<80*0.6 or @labAvg<20*0.6)
		print '本次考试成绩：	  不合格'
	else 
		print '本次考试成绩：	  合格'
	print'======================================================='
	print'		参加本次考试成绩没有通过的学生：'
	print'	姓名		学号		笔试成绩		上机成绩	'
	print'======================================================='
	--声明游标
	declare stu cursor for
	--sql查询
	select sname  ,student.sno     ,writtenScore      ,LabScore
	from student join sc
	on student.sno=sc.sno
	where writtenScore<60 or LabScore<60
	--声明存储的数据
	declare @sname varchar(8)
	declare @sno char(8)
	declare @writtenScore tinyint
	declare @LabScore tinyint
	--打开游标
	open stu
	--提取数据
	fetch stu into @sname,@sno,@writtenScore,@LabScore
	--循环结束语句
	while @@FETCH_STATUS=0
	begin
		print '	'+@sname+'	  '+@sno+'		  '+
		convert(varchar(6),@writtenScore)+'			   '+convert(varchar(6),@LabScore)
		--使游标移动到下一个记录
		fetch stu into @sname,@sno,@writtenScore,@LabScore
	end
	--关闭游标
	close stu
	--释放游标
	deallocate stu
end 

--测试

exec computer_test_stu


--2、修改上题：由于每次考试的难易程度不一样，
--每次笔试和机试的及格线可能随时变化（不再是满分的60%），
--这导致考试的评判结果也相应变化。（提示：使用带输入参数的存储过程）
create procedure computer_test_stu_1
@writtenPass tinyint,
@labPass tinyint
as
begin
	declare @writtenAvg float,@labAvg float
	select @writtenAvg=AVG(isnull(writtenScore,0)),@labAvg=AVG(ISNULL(labscore,0))
	from sc join course c
	on sc.cno=c.cno
	where cname='计算机基础'
	print '笔试平均成绩：     '+convert(varchar(6),@writtenAvg)
	print '上机平均成绩：     '+convert(varchar(6),@labAvg)
	if(@writtenAvg>80*0.8 and @labAvg>20*0.8)
		print '本次考试成绩：	  优秀'
	else if(@writtenAvg<@writtenPass or @labAvg<@labPass)
		print '本次考试成绩：	  不合格'
	else 
		print '本次考试成绩：	  合格'
	print'======================================================='
	print'		参加本次考试成绩没有通过的学生：'
	print'	姓名		学号		笔试成绩		上机成绩	'
	print'======================================================='
	--声明游标
	declare stu cursor for
	--sql查询
	select sname  ,student.sno     ,writtenScore      ,LabScore
	from student join sc
	on student.sno=sc.sno
	where writtenScore<@writtenPass or LabScore<@labPass
	--声明存储的数据
	declare @sname varchar(8)
	declare @sno char(8)
	declare @writtenScore tinyint
	declare @LabScore tinyint
	--打开游标
	open stu
	--提取数据
	fetch stu into @sname,@sno,@writtenScore,@LabScore
	--循环结束语句
	while @@FETCH_STATUS=0
	begin
		print '	'+@sname+'	  '+@sno+'		  '+
		convert(varchar(6),@writtenScore)+'			   '+convert(varchar(6),@LabScore)
		--使游标移动到下一个记录
		fetch stu into @sname,@sno,@writtenScore,@LabScore
	end
	--关闭游标
	close stu
	--释放游标
	deallocate stu
end 	

--测试

exec computer_test_stu_1 70,15


--3、修改上题：返回未通过考试的学员人数。（提示：使用带输出参数的存储过程）
create procedure computer_test_stu_2
@num int output
as
begin
	declare @writtenAvg float,@labAvg float
	select @writtenAvg=AVG(isnull(writtenScore,0)),@labAvg=AVG(ISNULL(labscore,0))
	from sc join course c
	on sc.cno=c.cno
	where cname='计算机基础'
	print '笔试平均成绩：     '+convert(varchar(6),@writtenAvg)
	print '上机平均成绩：     '+convert(varchar(6),@labAvg)
	if(@writtenAvg>80*0.8 and @labAvg>20*0.8)
		print '本次考试成绩：	  优秀'
	else if(@writtenAvg<80*0.6 or @labAvg<20*0.6)
		print '本次考试成绩：	  不合格'
	else 
		print '本次考试成绩：	  合格'
	print'======================================================='
	print'		参加本次考试成绩没有通过的学生：'
	print'	姓名		学号		笔试成绩		上机成绩	'
	print'======================================================='
	--声明游标
	declare stu cursor for
	--sql查询
	select sname  ,student.sno     ,writtenScore      ,LabScore
	from student join sc
	on student.sno=sc.sno
	where writtenScore<60 or LabScore<60
	--声明存储的数据
	declare @sname varchar(8)
	declare @sno char(8)
	declare @writtenScore tinyint
	declare @LabScore tinyint
	--打开游标
	open stu
	--提取数据
	fetch stu into @sname,@sno,@writtenScore,@LabScore
	--循环结束语句
	set @num=1
	while @@FETCH_STATUS=0
	begin
		print '	'+@sname+'	  '+@sno+'		  '+
		convert(varchar(6),@writtenScore)+'			   '+convert(varchar(6),@LabScore)
		set @num+=1
		--使游标移动到下一个记录
		fetch stu into @sname,@sno,@writtenScore,@LabScore
	end
	--关闭游标
	close stu
	--释放游标
	deallocate stu
end 

-- 测试
declare @num1 int
exec computer_test_stu_2 @num1 output
print'======================================================='
print'	参加本次考试成绩没有通过的学生人数为：	' +convert(varchar(6),@num1)


--4、编写存储过程，显示男生或女生的名单（
--性别要求通过参数输入）。格式为：序号 学号	姓名
--(提示：用带有游标的存储过程)

create procedure sex_stu 
@sex char(2) output
as 
begin
	declare @id int,@sno char(8),@sname varchar(8)
	declare sex_s cursor for
	select sno,sname
	from student
	where sex=@sex
	
	open sex_s
	fetch sex_s into @sno,@sname
	set @id=1
	while @@FETCH_STATUS=0
	begin
		print '序号:	' +convert(varchar(3),@id)+'		'+'学号:	'+@sno+'		'
		+'姓名:	'+@sname
		print' '
		set @id+=1
		fetch sex_s into @sno,@sname
	end
	close sex_s
	deallocate sex_s
end
--测试
exec sex_stu '男'

exec sex_stu '女'