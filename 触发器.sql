create trigger reminder on course
after delete
as
  print 'You have just deleted '
		+cast(@@rowcount as varchar)
		+' row(s).'

--
create trigger tr_del on course
after delete
as
	select *
	from deleted

--Test		
delete
from Course
where Cno=6

--�޸�ѧ���ɼ�����Ϊ����
create trigger tr_update_sc on sc
for update
as
	if exists (select * from inserted where Grade<0)
	begin
		print '�ɼ�����Ϊ����'
		rollback; --�ع���ȡ����ǰ�Ĳ���
	end
go;
--�Ż�
alter trigger tr_update_sc on sc
for update
as
	if UPDATE(grade)
	begin
		print '---------------'
		if exists (select * from inserted where Grade<0)
		begin
			print '�ɼ�����Ϊ����'
			rollback; --�ع���ȡ����ǰ�Ĳ���
		end	
	end
--Test
select * from sc
update sc
set Grade=-10
where Sno=200215121 and Cno=2

update sc
set Grade=10
where Sno=200215121 and Cno=2


update sc
set cno=5
where Sno=200215121 and Cno=2
--������	�޸�ѧ���ɼ����ɼ�ֻ�����Ӳ��ܼ���
go;	
create trigger tr_update_sc2 on sc
for update
as
	if UPDATE(grade)
	begin
		if exists (
			select *
			from deleted d,inserted i
			where d.Sno=i.Sno and d.Cno=i.cno 
				  and i.Grade<d.grade
		)
		begin
			print '�ɼ����ܼ���'
			rollback; --�ع���ȡ����ǰ�Ĳ���
		end	
	end

--Test
select * from sc
update sc
set Grade=80
where Sno=200215121 and Cno=5

select * from sc
update sc
set Grade=10
where Sno=200215121 and Cno=5	

--���ô�������ѧ��ѡ��ʱ����ÿ�ſγ̵�ѡ������ͳ�Ƶ���T(cno,num)��
create table t(
     cno char(5) primary key,
     num int default(0)
)
--�µ�ѡ��
create trigger tr_add_sc2 on sc2
for insert
as
  if not exists(  
	select *
	from inserted i,T
	where i.cno=T.cno)
  begin		--��һ��ѡ�񱾿γ̵�ͬѧ
	insert
	into T
	select cno,1
	from inserted
  end
  else    --���ǵ�һ��ѡ�񱾿γ̵�ͬѧ
  begin
	update t
	set num=num+1
	where cno=(
		select cno
		from inserted)
  end


--Test
select *
into sc2
from sc
where 1=0

select * from sc2
select * from t
insert
into sc2
values(200215121,1,null)

insert
into sc2
values(200215122,1,null)

insert
into sc2
values(200215122,2,null)

--�˿�
create trigger tr_del_sc2 on sc2
for delete
as
  if exists(
	select *
	from deleted d,t
	where d.cno=t.cno and num=1)
  begin  --ѡ�񱾿γ̵����һ��ͬѧ
	delete
	from t
	where cno=(
		select cno
		from deleted)
  end
  else   --����ѡ�񱾿γ̵����һ��ͬѧ
  begin
	update t
	set num=num-1
	where cno=(
		select cno
		from deleted)
  end
  
--Test
select * from t
select * from sc2
delete
from sc2
where sno=200215121 and cno=1  

delete
from sc2
where sno=200215122 and cno=1  

--instead of
create trigger tr_del_student on student
instead of delete
as
  print '----------------------'


--Test
delete from student

select * from student

--��������ͼ�ϵĴ�����
CREATE VIEW IS_Student
AS 
SELECT Sno,Sname,year(getdate())-Sage sbirth
FROM    Student
WHERE  Sdept= 'IS';

select * from is_student
select * from student
--
insert
into IS_Student
values(200215129,'AAA',2003)

--trigger instead of 
create trigger tr_add_IsStudent on is_student
instead of insert
as
  insert
  into student(Sno,Sname,Sage,sdept)
  select sno,sname,year(getdate())-sbirth,'IS'
  from inserted

--drop trigger
drop trigger tr_add_IsStudent