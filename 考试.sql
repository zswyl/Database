--���й�ϵEMP��ENO��ENAME��SALARY��DNO����
--���и����Եĺ�������Ϊְ���š�������
--���ʺ����ڲ��źţ��Լ���ϵDEPT
--��DNO��DNAME��MANAGER����
--���и����Ժ�������Ϊ���źš��������ơ����ž����ְ���š� 
--����SQL��䴴����EMP��
--��ѡ����ʵ��������ͺͳ��ȣ�
--����ENOΪ���룬DNOΪ��ϵ���롣
create table EMP(
	ENO varchar(10) not null primary key,
	ENAME varchar(10),
	SALARY int ,
	DNO varchar(10)
	)
	
--���й�ϵEMP��ENO��ENAME��SALARY��DNO����
--���и����Եĺ�������Ϊְ���š����������ʺ�
--���ڲ��źţ��Լ���ϵDEPT��DNO��DNAME��MANAGER����
--���и����Ժ�������Ϊ���źš��������ơ�
--���ž����ְ���š� 
--������ͼ������ÿ�����ŵĲ��źź�ƽ�����ʡ�
create view DNO_avgsalary
as
select DNO,AVG(SALARY)
from EMP e,DEPT d
where e.DNO=d.DNO
group by e.DNO

--���й�ϵEMP��ENO��ENAME��SALARY��DNO����
--���и����Եĺ�������Ϊְ���š����������ʺ�
--���ڲ��źţ��Լ���ϵDEPT��DNO��DNAME��MANAGER����
--���и����Ժ�������Ϊ���źš��������ơ�
--���ž����ְ���š� 
--��ѯ������һ������Ա����Ϣ�����չ��ʽ�������
select ENO,ENAME,SALARY,e.DNO
from EMP e,DEPT d
where e.DNO=d.DNO and DNAME='����һ��'
order by SALARY desc

--����һ����Ա����
--����Ա���ţ�E90101�����������������źţ�8500
insert into EMP
values('E90101','����',null,'8500')

--��������һ����Ա���Ĺ����ϵ�10%
update EMP
set salary*=1.1
where DNO in(
	select DNO 
	from DEPT
	where DNAME='����һ��'
	)
	--���й�ϵEMP��ENO��ENAME��SALARY��DNO����
--���и����Եĺ�������Ϊְ���š����������ʺ�
--���ڲ��źţ��Լ���ϵDEPT��DNO��DNAME��MANAGER����
--���и����Ժ�������Ϊ���źš��������ơ�
--���ž����ְ���š� 
	--��д�����������޸�Ա���Ĳ��ź�ʱ������Ա��Ϊԭ���ŵľ���
	--��ԭ���ŵľ����(manager)����Ϊ��ֵ
	CREATE  TRIGGER  update_DNO	ON  EMP  FOR  UPDATE  	AS	IF  (UPDATE(DNO) and exists(		select * 		from DEPT ,deleted,del		where dept.ENO=del.MANAGER	Begin		update   d set  d.MANAGER = null 		from DEPT d, deleted  del		where  d.DNO = del.DNO 	End