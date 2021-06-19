--function
create function mf_getAvgScore
(
	@sno char(9)
)
returns float
as
begin
	declare @avg_grade float
	
	select @avg_grade=AVG(grade)
	from sc
	where Sno=@sno

	return @avg_grade
end

--Test

select dbo.mf_getAvgScore('200215121')

select Sno,Sname,dbo.mf_getAvgScore(sno)
from student
where dbo.mf_getAvgScore(sno)>80

--内联表值函数
create function udf_getFailStu(
	@cno char(5)
)
returns table
as
	return(
		select student.Sno,sname,sdept,grade
		from student,sc
		where student.Sno=sc.Sno and Cno=@cno
				and grade<60
	)
	
--Test
select *
from dbo.udf_getFailStu(1)	

select *
from dbo.udf_getFailStu(2)

--多语句表值函数
alter function udf_getEnroll
(
	@cno char(5)
)
returns @table table(
	sno char(9),
	sname varchar(20),
	grade float
)
as
begin
	insert
	into @table
	select student.Sno,sname,grade
	from student,sc
	where student.Sno=sc.Sno and Cno=@cno
	
	
	insert
	into @table
	values(123,'AAA',90)

	delete
	from @table
	where sname like '张%'	
	return;
end

--Test
select *
from dbo.udf_getEnroll(1)