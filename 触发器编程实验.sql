--1��jwgl2018���ݿ��е�total(department,nums)
--��¼��ÿ��רҵѧ�������������д������������ӡ�ɾ��ѧ���͸���ѧ�����ڵ�רҵʱ���ܹ��Զ�����total��
create trigger update_total
on student
for insert,delete,update
as
begin
	begin
		update total
		set nums=nums+1
		where department in(
			select department
			 from inserted i
			)
		update total
		set nums=nums-1
		where department in (
			select department 
			from deleted d
			) 
	end
end

--����

delete student
where sno='g9940209'

update student
set department='dep_01'
where sno='g9940208'

insert student
values('g9940309','İ����','��',2020-1995,'g99403','Dep_01','����������34��')

select *
from total

select *
from student

--2������ʵ������stud_query_View2��ͼ��
--д��������ʵ������ͼstud_query_View2�в���һ�����ݡ�
--ѧ�ţ�g9940209���������������༶��g99402���Ա��У�
--��ͥסַ���Ͼ���ɽ��·10�ţ�����17�ꡣ
create trigger insert_stud_query_View2
on stud_query_View2
instead of insert
as
	insert 
	into stud_query_View2(Sno,sname,class,sex,address,age)
	 select Sno,sname,class,'��',address,age
	 from inserted
	 
drop trigger insert_stud_query_View2
--����
select *
from stud_query_View2
select *
from student
delete student
where sno='g9940209'
insert
into stud_query_View2
values('g9940209','����','g99402','��','�Ͼ���ɽ��·10��',17)
