--���1802-������
--1������һ������check_id()��ʵ�����¹��ܡ�
--����1��������department_idֵ֮����ѯ��ֵ��department�����Ƿ���ڣ������ڷ���0�����򷵻�-1��

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

--����
select *
from department

select  dbo.check_id('Dep_01') ���ź�
select  dbo.check_id('Dep_05') ���ź�

--2.дһ��T��SQL�ű����������������������student�����1����¼ʱ��
--���ȵ��ú���check_id()�����ü�¼��department_idֵ֮
--�ڱ�departments��department_id�ֶ����Ƿ���ڶ�Ӧֵ��
--�����ڣ��򽫸ü�¼����student���У������ӡ������ʾ��Ϣ��

--��
use jwgl2018
declare @num int
select @num=dbo.check_id('Dep_01')
if @num=0
	insert student
		values('g9940111','���Ľ�','Ů',20,'g99401','Dep_01',null)
else
	print('�޸ò��źţ������²���')	
--��
use jwgl2018
declare @num int
select @num=dbo.check_id('Dep_05')
if @num=0
	insert student
		values('g9940111','����','��',20,'g99403','Dep_05',null)
else
	print('�޸ò��źţ������²���')

--����

select *
from student

--3. ����һ����Ϊage()���û��Զ��庯������
--�ڸ��ݸ�����ѧ����ż���ѧ�������䣬
--Ȼ���ڲ�ѯ����е��øú�����
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


--����
--����
select dbo.age('g9940110') ����
--������
select dbo.age('g9940118') ����

--4������һ����Ϊscore()�ĺ�����
--����һÿ��ѧ����ѧ�š������ͳɼ���
--Ȼ���ڲ�ѯ����е��øú�����ѯ�гɼ��������ѧ����
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


--5����ӡ�˷��ھ�����ʾ��ʽ���£�
declare @i int
declare @j int
declare @tmp varchar(255)
declare @space int
set @i=1
while @i<=9
begin
 --��ӡ���еĸ�����
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