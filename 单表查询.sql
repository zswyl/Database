
--------------------------��ѯ�ڣ����������------------------------------------
select *
from student
where Sage in(18,19,20)
--------------------------��ѯ���ڣ����������------------------------------------
select *
from student
where Sdept not in('is','cs','ma')

-------------------------�ַ�ƥ�䡮<ƥ�䴮>��-----------------------------------------------
select *
from student
where Sno like '200215121'

select *
from student
where Sname like '��%'

-------------------------��ֵ��ѯֻ����is null--------------------------------
select *
from Course
where Cpno is null

-------------------------����ѡ���ѯ----------------------------------------------

select *
from student
where Sdept='cs' and Sage>20
----------------------------����������----------------------------------------
select *
from student
order by Sage

----------------------------����������----------------------------------------
select *
from student
order by Sdept desc

---------------------------�ۺϺ���----------------------------------------------
select COUNT(*)  --����������Ԫ����
from student
where Sage>=20

select COUNT(Sdept) ---������������sdept�ϲ��յ�Ԫ����
from student

select COUNT(distinct Sdept) ---������������sdept�ϲ����Ҳ��ظ���Ԫ����
from student

select * from sc;
select COUNT(*),COUNT(grade),SUM(grade),AVG(grade)
 from sc

select * from Course;
select SUM(ccredit),AVG(Ccredit*1.0)
from Course

--------------------------------------------------------------------------

select * from student

select sdept,COUNT (*)
from student
group by Sdept
    having COUNT(*)>=3