--测试
	--1.插入类别
		insert into 类别 values('TP',0)	
		insert into 类别 values('TM',0)	
		select *
		from 类别
		delete 类别
	--2.插入图书信息
		exec 新书录入 '978-7-303-21544-7','Linux基础','TP','陈明','北京师范大学出版社','2017-08-20',54.8,'TP100001','可借'
		exec 新书录入 '978-7-303-21544-7','Linux基础','TP','陈明','北京师范大学出版社','2017-08-20',54.8,'TP100002','可借'
		exec 新书录入 '978-7-303-21544-7','Linux基础','TP','陈明','北京师范大学出版社','2017-08-20',54.8,'TP100003','可借'
		exec 新书录入 '978-7-303-21544-7','Linux基础','TP','陈明','北京师范大学出版社','2017-08-20',54.8,'TP100004','可借'
		exec 新书录入 '978-7-303-21544-7','Linux基础','TP','陈明','北京师范大学出版社','2017-08-20',54.8,'TP100005','可借'
		exec 新书录入 '978-7-302-50542-6','C++描述','TP','徐士良','清华大学出版社','2019-05-16',89.0,'TP110001','不可借'
		exec 新书录入 '978-7-302-50542-6','C++描述','TP','徐士良','清华大学出版社','2019-05-16',89.0,'TP110002','可借'
		exec 新书录入 '978-7-302-50542-6','C++描述','TP','徐士良','清华大学出版社','2019-05-16',89.0,'TP110003','可借'
		exec 新书录入 '978-7-302-50542-6','C++描述','TP','徐士良','清华大学出版社','2019-05-16',89.0,'TP110004','可借'
		exec 新书录入 '978-7-302-50542-6','C++描述','TP','徐士良','清华大学出版社','2019-05-16',89.0,'TP110005','可借'  
		exec 新书录入 '978-7-122-07219-1','电工技术基础','TM','姜学勤 ','化学工业出版社','2019-12-01',22.00,'TM100001','不可借'
		exec 新书录入 '978-7-122-07219-1','电工技术基础','TM','姜学勤 ','化学工业出版社','2019-12-01',22.00,'TM100002','可借'
		exec 新书录入 '978-7-122-07219-1','电工技术基础','TM','姜学勤 ','化学工业出版社','2019-12-01',22.00,'TM100003','可借'
		exec 新书录入 '978-7-122-07219-1','电工技术基础','TM','姜学勤 ','化学工业出版社','2019-12-01',22.00,'TM100004','可借'
		exec 新书录入 '978-7-122-07219-1','电工技术基础','TM','姜学勤 ','化学工业出版社','2019-12-01',22.00,'TM100005','可借'
		
		exec 新书录入 '978-7-122-07219-1','电工技术基础','TM','姜学勤 ','化学工业出版社','2019-12-01',22.00,'TM100006','可借'

		select *
		from 图书基本信息
		select *
		from 图书信息
		delete 图书信息
		delete 图书基本信息
	--3.图书管理人员录入
		exec 添加管理员 '10001','刘丽','女'
		exec 添加管理员 '10002','李平','女'
		exec 添加管理员 '10003','张三','男'
		select *
		from 管理员

	--4.添加读者
		exec 添加读者 '500','李四','男'
		exec 添加读者 '501','王二小','男'
		exec 添加读者 '502','张小兰','女'
		select *
		from 读者
		delete 读者
	--5.图书借阅
		exec 图书借阅 'TP100001','500','10001'
		exec 图书借阅 'TP100002','500','10001'
		exec 图书借阅 'TP100003','500','10001'
		exec 图书借阅 'TP100004','500','10001'
		exec 图书借阅 'TP110005','500','10001'
		exec 图书借阅 'TM100005','500','10001'

		exec 图书借阅 'TM100004','500','10001'

		

		exec 图书借阅 'TM100001','501','10001'

		exec 图书借阅 'TP100001','502','10002'

		exec 图书借阅 'TP110003','501','10003'
		exec 图书借阅 'TM100002','502','10002'

		
		select *
		from 图书借还
		
		select *
		from 读者
		where 借书证号='501'
		delete 图书借还
	--6.图书归还
		exec 图书归还 'TP100001','500','10002'
		select *
		from 图书借还
		where 借书证号='501'
		select *
		from 读者
		where 借书证号='501'
	--7.书证挂失
		exec 书证挂失 '501'
		exec 图书借阅 'TM100003','501','10003'
	--8.书证恢复
		exec 书证恢复 '501'
		exec 图书借阅 'TM100003','501','10003'
		select *
		from 图书借还
		where 借书证号='501'
		select *
		from 读者
		where 借书证号='501'
	--9.借书证号查询借阅信息
		exec 借书证号查询借阅信息 '500'
	--10.图书条码查询借阅信息	
		exec 图书条码查询借阅信息 'TP100001'

	--11.馆藏分类
		exec 统计
	--12.超期
		 select dbo.有无超期('500') 是否超期
