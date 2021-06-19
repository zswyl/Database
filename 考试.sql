--设有关系EMP（ENO，ENAME，SALARY，DNO），
--其中各属性的含义依次为职工号、姓名、
--工资和所在部门号，以及关系DEPT
--（DNO，DNAME，MANAGER），
--其中各属性含义依次为部门号、部门名称、部门经理的职工号。 
--利用SQL语句创建表EMP。
--请选择合适的数据类型和长度，
--其中ENO为主码，DNO为关系外码。
create table EMP(
	ENO varchar(10) not null primary key,
	ENAME varchar(10),
	SALARY int ,
	DNO varchar(10)
	)
	
--设有关系EMP（ENO，ENAME，SALARY，DNO），
--其中各属性的含义依次为职工号、姓名、工资和
--所在部门号，以及关系DEPT（DNO，DNAME，MANAGER），
--其中各属性含义依次为部门号、部门名称、
--部门经理的职工号。 
--创建视图，给出每个部门的部门号和平均工资。
create view DNO_avgsalary
as
select DNO,AVG(SALARY)
from EMP e,DEPT d
where e.DNO=d.DNO
group by e.DNO

--设有关系EMP（ENO，ENAME，SALARY，DNO），
--其中各属性的含义依次为职工号、姓名、工资和
--所在部门号，以及关系DEPT（DNO，DNAME，MANAGER），
--其中各属性含义依次为部门号、部门名称、
--部门经理的职工号。 
--查询“开发一部”的员工信息，按照工资降序排序。
select ENO,ENAME,SALARY,e.DNO
from EMP e,DEPT d
where e.DNO=d.DNO and DNAME='开发一部'
order by SALARY desc

--插入一个新员工，
--其中员工号：E90101，姓名：张铭，部门号：8500
insert into EMP
values('E90101','张铭',null,'8500')

--将“开发一部”员工的工资上调10%
update EMP
set salary*=1.1
where DNO in(
	select DNO 
	from DEPT
	where DNAME='开发一部'
	)
	--设有关系EMP（ENO，ENAME，SALARY，DNO），
--其中各属性的含义依次为职工号、姓名、工资和
--所在部门号，以及关系DEPT（DNO，DNAME，MANAGER），
--其中各属性含义依次为部门号、部门名称、
--部门经理的职工号。 
	--编写触发器，当修改员工的部门号时，若该员工为原部门的经理，
	--则将原部门的经理号(manager)设置为空值
	CREATE  TRIGGER  update_DNO	ON  EMP  FOR  UPDATE  	AS	IF  (UPDATE(DNO) and exists(		select * 		from DEPT ,deleted,del		where dept.ENO=del.MANAGER	Begin		update   d set  d.MANAGER = null 		from DEPT d, deleted  del		where  d.DNO = del.DNO 	End