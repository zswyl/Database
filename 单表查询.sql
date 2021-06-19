
--------------------------查询在（）里的内容------------------------------------
select *
from student
where Sage in(18,19,20)
--------------------------查询不在（）里的内容------------------------------------
select *
from student
where Sdept not in('is','cs','ma')

-------------------------字符匹配‘<匹配串>’-----------------------------------------------
select *
from student
where Sno like '200215121'

select *
from student
where Sname like '张%'

-------------------------空值查询只能用is null--------------------------------
select *
from Course
where Cpno is null

-------------------------多重选择查询----------------------------------------------

select *
from student
where Sdept='cs' and Sage>20
----------------------------按升序排序----------------------------------------
select *
from student
order by Sage

----------------------------按降序排列----------------------------------------
select *
from student
order by Sdept desc

---------------------------聚合函数----------------------------------------------
select COUNT(*)  --满足条件的元组数
from student
where Sage>=20

select COUNT(Sdept) ---满足条件且在sdept上不空的元组数
from student

select COUNT(distinct Sdept) ---满足条件且在sdept上不空且不重复的元组数
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