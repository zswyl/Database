--���1802-������
--1���봴���洢���̣��鿴�������������
--�γ̱��ο���ƽ�����Լ�δͨ�����Ե�ѧԱ������
--�����Գɼ�����80�֣��ϻ��ɼ�����20�֣�˫�Ƴɼ����ﵽ���ֵ�80%����Ϊ���㣬
--���Ʋ������ֵ�60%Ϊ���ϸ񣬷���Ϊ�ϸ񣩡�(��ʾ���ô����α�Ĵ洢����)
create procedure computer_test_stu
as
begin
	declare @writtenAvg float,@labAvg float
	select @writtenAvg=AVG(isnull(writtenScore,0)),@labAvg=AVG(ISNULL(labscore,0))
	from sc join course c
	on sc.cno=c.cno
	where cname='���������'
	print '����ƽ���ɼ���     '+convert(varchar(6),@writtenAvg)
	print '�ϻ�ƽ���ɼ���     '+convert(varchar(6),@labAvg)
	if(@writtenAvg>80*0.8 and @labAvg>20*0.8)
		print '���ο��Գɼ���	  ����'
	else if(@writtenAvg<80*0.6 or @labAvg<20*0.6)
		print '���ο��Գɼ���	  ���ϸ�'
	else 
		print '���ο��Գɼ���	  �ϸ�'
	print'======================================================='
	print'		�μӱ��ο��Գɼ�û��ͨ����ѧ����'
	print'	����		ѧ��		���Գɼ�		�ϻ��ɼ�	'
	print'======================================================='
	--�����α�
	declare stu cursor for
	--sql��ѯ
	select sname  ,student.sno     ,writtenScore      ,LabScore
	from student join sc
	on student.sno=sc.sno
	where writtenScore<60 or LabScore<60
	--�����洢������
	declare @sname varchar(8)
	declare @sno char(8)
	declare @writtenScore tinyint
	declare @LabScore tinyint
	--���α�
	open stu
	--��ȡ����
	fetch stu into @sname,@sno,@writtenScore,@LabScore
	--ѭ���������
	while @@FETCH_STATUS=0
	begin
		print '	'+@sname+'	  '+@sno+'		  '+
		convert(varchar(6),@writtenScore)+'			   '+convert(varchar(6),@LabScore)
		--ʹ�α��ƶ�����һ����¼
		fetch stu into @sname,@sno,@writtenScore,@LabScore
	end
	--�ر��α�
	close stu
	--�ͷ��α�
	deallocate stu
end 

--����

exec computer_test_stu


--2���޸����⣺����ÿ�ο��Ե����׳̶Ȳ�һ����
--ÿ�α��Ժͻ��Եļ����߿�����ʱ�仯�����������ֵ�60%����
--�⵼�¿��Ե����н��Ҳ��Ӧ�仯������ʾ��ʹ�ô���������Ĵ洢���̣�
create procedure computer_test_stu_1
@writtenPass tinyint,
@labPass tinyint
as
begin
	declare @writtenAvg float,@labAvg float
	select @writtenAvg=AVG(isnull(writtenScore,0)),@labAvg=AVG(ISNULL(labscore,0))
	from sc join course c
	on sc.cno=c.cno
	where cname='���������'
	print '����ƽ���ɼ���     '+convert(varchar(6),@writtenAvg)
	print '�ϻ�ƽ���ɼ���     '+convert(varchar(6),@labAvg)
	if(@writtenAvg>80*0.8 and @labAvg>20*0.8)
		print '���ο��Գɼ���	  ����'
	else if(@writtenAvg<@writtenPass or @labAvg<@labPass)
		print '���ο��Գɼ���	  ���ϸ�'
	else 
		print '���ο��Գɼ���	  �ϸ�'
	print'======================================================='
	print'		�μӱ��ο��Գɼ�û��ͨ����ѧ����'
	print'	����		ѧ��		���Գɼ�		�ϻ��ɼ�	'
	print'======================================================='
	--�����α�
	declare stu cursor for
	--sql��ѯ
	select sname  ,student.sno     ,writtenScore      ,LabScore
	from student join sc
	on student.sno=sc.sno
	where writtenScore<@writtenPass or LabScore<@labPass
	--�����洢������
	declare @sname varchar(8)
	declare @sno char(8)
	declare @writtenScore tinyint
	declare @LabScore tinyint
	--���α�
	open stu
	--��ȡ����
	fetch stu into @sname,@sno,@writtenScore,@LabScore
	--ѭ���������
	while @@FETCH_STATUS=0
	begin
		print '	'+@sname+'	  '+@sno+'		  '+
		convert(varchar(6),@writtenScore)+'			   '+convert(varchar(6),@LabScore)
		--ʹ�α��ƶ�����һ����¼
		fetch stu into @sname,@sno,@writtenScore,@LabScore
	end
	--�ر��α�
	close stu
	--�ͷ��α�
	deallocate stu
end 	

--����

exec computer_test_stu_1 70,15


--3���޸����⣺����δͨ�����Ե�ѧԱ����������ʾ��ʹ�ô���������Ĵ洢���̣�
create procedure computer_test_stu_2
@num int output
as
begin
	declare @writtenAvg float,@labAvg float
	select @writtenAvg=AVG(isnull(writtenScore,0)),@labAvg=AVG(ISNULL(labscore,0))
	from sc join course c
	on sc.cno=c.cno
	where cname='���������'
	print '����ƽ���ɼ���     '+convert(varchar(6),@writtenAvg)
	print '�ϻ�ƽ���ɼ���     '+convert(varchar(6),@labAvg)
	if(@writtenAvg>80*0.8 and @labAvg>20*0.8)
		print '���ο��Գɼ���	  ����'
	else if(@writtenAvg<80*0.6 or @labAvg<20*0.6)
		print '���ο��Գɼ���	  ���ϸ�'
	else 
		print '���ο��Գɼ���	  �ϸ�'
	print'======================================================='
	print'		�μӱ��ο��Գɼ�û��ͨ����ѧ����'
	print'	����		ѧ��		���Գɼ�		�ϻ��ɼ�	'
	print'======================================================='
	--�����α�
	declare stu cursor for
	--sql��ѯ
	select sname  ,student.sno     ,writtenScore      ,LabScore
	from student join sc
	on student.sno=sc.sno
	where writtenScore<60 or LabScore<60
	--�����洢������
	declare @sname varchar(8)
	declare @sno char(8)
	declare @writtenScore tinyint
	declare @LabScore tinyint
	--���α�
	open stu
	--��ȡ����
	fetch stu into @sname,@sno,@writtenScore,@LabScore
	--ѭ���������
	set @num=1
	while @@FETCH_STATUS=0
	begin
		print '	'+@sname+'	  '+@sno+'		  '+
		convert(varchar(6),@writtenScore)+'			   '+convert(varchar(6),@LabScore)
		set @num+=1
		--ʹ�α��ƶ�����һ����¼
		fetch stu into @sname,@sno,@writtenScore,@LabScore
	end
	--�ر��α�
	close stu
	--�ͷ��α�
	deallocate stu
end 

-- ����
declare @num1 int
exec computer_test_stu_2 @num1 output
print'======================================================='
print'	�μӱ��ο��Գɼ�û��ͨ����ѧ������Ϊ��	' +convert(varchar(6),@num1)


--4����д�洢���̣���ʾ������Ů����������
--�Ա�Ҫ��ͨ���������룩����ʽΪ����� ѧ��	����
--(��ʾ���ô����α�Ĵ洢����)

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
		print '���:	' +convert(varchar(3),@id)+'		'+'ѧ��:	'+@sno+'		'
		+'����:	'+@sname
		print' '
		set @id+=1
		fetch sex_s into @sno,@sname
	end
	close sex_s
	deallocate sex_s
end
--����
exec sex_stu '��'

exec sex_stu 'Ů'