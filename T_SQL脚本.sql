declare @i int
declare @sum int
set @i=1
set @sum=0
while @i<=100
begin
	set @sum=@sum+@i
	set @i=@i+1
end

print @sum

--�˷��ھ�
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
		  +cast(@j as varchar)+'='
		  +cast(@i*@j as varchar)+SPACE(@space)
	set @j=@j+1
 end
 print @tmp
 set @i=@i+1
end