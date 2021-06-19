create table t(
  id int primary key,
   n int);

--2.
create table t(
  id int primary key(id),
   n int);   
--3.
create table t(
  id int ,
  n int,
  primary key(id) 
   );
   
drop table t


--foreign key
CREATE TABLE SC2(
	Sno    CHAR(9)  NOT NULL, 
	Cno     CHAR(5)  NOT NULL,  
	Grade    SMALLINT,
	PRIMARY KEY (Sno, Cno),   /*在表级定义实体完整性*/
	FOREIGN KEY (Sno) REFERENCES Student(Sno),  
	/*在表级定义参照完整性*/
	FOREIGN KEY (Cno) REFERENCES Course(Cno)    
	/*在表级定义参照完整性*/
);


--2
CREATE TABLE SC3(
	Sno    CHAR(9)  NOT NULL FOREIGN KEY (Sno) REFERENCES Student(Sno), 
	Cno     CHAR(5)  NOT NULL FOREIGN KEY (Cno) REFERENCES Course(Cno) ,  
	Grade    SMALLINT,
	PRIMARY KEY (Sno, Cno)   /*在表级定义实体完整性*/
);

--3
CREATE TABLE SC4(
	Sno    CHAR(9)  NOT NULL  REFERENCES Student(Sno), 
	Cno     CHAR(5)  NOT NULL  REFERENCES Course(Cno) ,  
	Grade    SMALLINT,
	PRIMARY KEY (Sno, Cno)   /*在表级定义实体完整性*/
);

CREATE TABLE SC5(
	Sno    CHAR(9)  NOT NULL  
	REFERENCES Student(Sno)
	on delete cascade, 
	Cno     CHAR(5)  NOT NULL  REFERENCES Course(Cno) ,  
	Grade    SMALLINT,
	PRIMARY KEY (Sno, Cno)   /*在表级定义实体完整性*/
);

insert
into SC5
select *
from sc

delete from student where Sno=200215121

select * from student
select * from sc5


--unique
create table movies(
  id int primary key,
  title varchar(30) ,
  year int,
  studio varchar(20),
  unique(title,year)
  )
  
  --ssex char(2) check(ssex in('男','女'))
  --ssex char(2) check(ssex='男' or ssex='女')
  
  --sage int check(sage between 20 and 30)
  --sage int check(sage>20 and sage<30)
  
  create table dept(
	dno char(3) primary key ,
	dname varchar(30) unique,
	loc varchar(50),
	check(dno like 'B[0-9][0-9]')
	)


insert
into dept2
values('A99','BBBB',null);
	
insert
into dept2
values('B88','rtrA',null)

insert
into dept
values('Baa','AAAAA',null)

truncate table dept2
create table dept2(
	dno char(3) constraint pk_dept2 primary key ,
	dname varchar(30) constraint uq_dept2_dname unique,
	loc varchar(50),
	constraint ck_dept2_dno check(dno like 'B[0-9][0-9]')
)
--not null
alter table dept2 add constraint nul_dept2_loc not null(loc) --illegal
alter table dept2 alter column loc varchar(50)

-- delete constraint
alter table dept2 drop ck_dept2_dno
-- new constraint
alter table dept2 
  add constraint ck_dept2_dno check(dno like '[A,B][0-9][0-9]')