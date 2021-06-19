--软件1802-朱松望
--(1)创建一个名为stud_query_viewl的视图，
--从数据库JWGL的student表中查询出性别为“女”的所有学生的资料;
create view stud_query_viewl
as
select *
from student 
where sex='女'

--测试
select *
from stud_query_viewl
--(2)创建一个名为stud_query_view2的视图，
--从数据库JWGL的student表中查询出性别为“女”
--的所有学生的学号，姓名，班级，家庭住址，年龄;
create view stud_query_view2(Sno,sname,class,sex,address,age)
as
select Sno,sname,class,sex,address,age
from student 
where sex='女'

--测试
select *
from stud_query_view2
--(3)创建一个名为“stud_query__view3”的视图，它是由
--表course、book及class_course创建的一个显示“g99402”班
--所开课程的课程名、所用教材的教材名、出版社及作者的视图;
create view stud_query__view3
as 
select cname,Bname,publishCompany,author
from course c,book b,Class_course cl
where class='g99402' 
	and c.cname=b.Bname
	and c.cno=cl.Course
	
	
--测试
select *
from stud_query__view3

--(4)创建一个从视图stud_query_viewl中
--查询出班级名为g99402的所有学生的信息；
select *
from stud_query_viewl
where class='g99402'

--(5)从视图stud_query_view2中查询出班级
--为“g99402”、姓名为“李红”的信息;
select *
from stud_query_view2
where class='g99402'
	and sname='李红'

--(6)向视图stud_query_View2中插入一行数据。
--学号：g9940209，姓名：张鹏，班级：g99402，
--性别：男，家庭住址：南京中山北路10号，年龄17岁。
--插入数据后检查是否将上述信息保存到student表中。
insert 
into stud_query_View2
values('g9940209','张鹏','g99402','男','南京中山北路10号',17)
 
 select *
 from student 
 --保存了
 
--(7)修改视图stud_query_view2中的数据。
--将stud_query_view2中姓名为“林红”的家庭地址
--改为“扬州市南京路8号”；
update stud_query_view2
set address='扬州市南京路8号'
where sname='林红'


--测试
 select *
 from stud_query_view2 
 
 
--(8)从视图中stud_query_view2将姓名为“林红”的同学删除；
delete
from stud_query_view2
where sname='林红'


--(9)创建用户u1，并将对student查询、插入、删除和修改的权限授予u1。
create login ul with password='jaingqi'
create user ul for login ul
grant select,insert,delete,update
on student
to ul