--AGGREGATE 
SELECT * FROM dlithe.dbo.S_HREMPLOYEES

select sum(salary)as sum FROM dlithe.dbo.S_HREMPLOYEES

select avg(salary) as avg FROM dlithe.dbo.S_HREMPLOYEES

select count(*) as count FROM dlithe.dbo.S_HREMPLOYEES

select max(salary) as max, min(salary) as min FROM dlithe.dbo.S_HREMPLOYEES


--ORDER,GROUP,HAVING
SELECT COUNT(1) as count,DEPARTMENT_ID
FROM dlithe.dbo.S_HREMPLOYEES
WHERE DEPARTMENT_ID is NOT NULL
GROUP BY DEPARTMENT_ID
HAVING COUNT(1)>2
ORDER BY DEPARTMENT_ID ASC;

select SALARY,EMPLOYEE_ID,DEPARTMENT_ID  
FROM dlithe.dbo.S_HREMPLOYEES
where salary>1000 and DEPARTMENT_ID is not null


--DENSE RANK
SELECT * FROM (
SELECT DENSE_RANK () OVER (PARTITION BY DEPARTMENT_ID ORDER BY SALARY  DESC) AS DRNK,SALARY,DEPARTMENT_ID
FROM DBO.S_HREMPLOYEES sh 
--WHERE DEPARTMENT_ID=90
)Z
WHERE DRNK=3


SELECT DENSE_RANK () OVER (PARTITION BY DEPARTMENT_ID ORDER BY SALARY  DESC) AS DRNK,SALARY,DEPARTMENT_ID
FROM DBO.S_HREMPLOYEES sh
WHERE DEPARTMENT_ID=90

select SALARY , DENSE_RANK () over(order by SALARY DESC) as sal
FROM dlithe.dbo.S_HREMPLOYEES


--RANK 

SELECT RANK () OVER (PARTITION BY DEPARTMENT_ID ORDER BY SALARY  DESC) AS DRNK,SALARY,DEPARTMENT_ID
FROM DBO.S_HREMPLOYEES sh
WHERE DEPARTMENT_ID=90

select SALARY ,RANK () over(order by SALARY DESC) as sal
FROM dlithe.dbo.S_HREMPLOYEES








--JOIN--
select * from DBO.S_HREMPLOYEES sh

select * from DBO.S_HRDEPARTMENTS sh2 

--INNER QUERY 

SELECT
	SH.EMPLOYEE_ID,
	SH2.DEPARTMENT_NAME,
	FIRST_NAME ,
	LAST_NAME
FROM
	DBO.S_HREMPLOYEES sh ,
	DBO.S_HRDEPARTMENTS sh2
WHERE
	SH.DEPARTMENT_ID = SH2.DEPARTMENT_ID;


-- INNER JOIN WITH INNER KEY WORD 

SELECT SH.EMPLOYEE_ID,SH2.DEPARTMENT_NAME,FIRST_NAME ,LAST_NAME
FROM DBO.S_HREMPLOYEES sh
INNER JOIN DBO.S_HRDEPARTMENTS sh2 
ON SH.DEPARTMENT_ID = SH2.DEPARTMENT_ID;

---LEFT JOIN 
select * from DBO.S_HREMPLOYEES sh
select * from DBO.S_HRDEPARTMENTS sh2 


select EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPARTMENT_NAME 
FROM DBO.S_HREMPLOYEES sh
LEFT JOIN DBO.S_HRDEPARTMENTS sh2
ON SH.DEPARTMENT_ID = SH2.DEPARTMENT_ID;

--RIGHT JOIN

select EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPARTMENT_NAME 
FROM DBO.S_HREMPLOYEES sh
RIGHT JOIN DBO.S_HRDEPARTMENTS sh2
ON SH.DEPARTMENT_ID = SH2.DEPARTMENT_ID

--FULL JOIN 

select EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPARTMENT_NAME 
FROM DBO.S_HREMPLOYEES sh
FULL JOIN DBO.S_HRDEPARTMENTS sh2
ON SH.DEPARTMENT_ID = SH2.DEPARTMENT_ID







SELECT
	*
FROM
	DBO.S_HREMPLOYEES sh ,
	DBO.S_HRDEPARTMENTS sh2,
	DBO.S_HRLOCATIONS sh3 
WHERE
	SH.DEPARTMENT_ID = SH2.DEPARTMENT_ID
AND SH2.LOCATION_ID=SH3.lOCATION_ID;





--INNER QUERY

select FIRST_NAME,LAST_NAME,SALARY  FROM DBO.S_HREMPLOYEES sh
where DEPARTMENT_ID IN(
                        select DEPARTMENT_ID  FROM DBO.S_HRDEPARTMENTS sh2
                        where DEPARTMENT_ID =60
                      )


--NESTED QUERY
SELECT EMPLOYEE_ID, FIRST_NAME  FROM DBO.S_HREMPLOYEES sh
WHERE DEPARTMENT_ID IN(
SELECT DEPARTMENT_ID  FROM DBO.S_HRDEPARTMENTS sh2
WHERE SH.DEPARTMENT_ID= SH2.DEPARTMENT_ID
)

--SUB QUERY

SELECT FIRST_NAME, LAST_NAME  FROM DBO.S_HREMPLOYEES sh
where EMPLOYEE_ID IN(
                      select EMPLOYEE_ID from DBO.S_HREMPLOYEES sh
                      where SALARY >15000
                    )

select * from DBO.S_HREMPLOYEES sh
where EXISTS (
select DEPARTMENT_ID  from DBO.S_HRDEPARTMENTS sh2
)

--SECOND HIGHEST SALARY
select SALARY FROM DBO.S_HREMPLOYEES sh
where Salary <>(select max(SALARY) FROM DBO.S_HREMPLOYEES sh)



create table SJR_emp (
id int primary key not null,
name varchar(20) not null,
d_id int ,
age int check (age>20),
email varchar(20) default 'xzy@gmail.com'
);

select * from SJR_emp

insert into SJR_emp values(10,'indu',100,21,'abc@gmail.com')
insert into SJR_emp values(20,'Bindu',200,24,'bindu23@gmail.com')
insert into SJR_emp values(30,'ibbani',100,28,'ibbu@gmail.com')

--delete 
delete SJR_emp

-- DELETE with conditional data

delete from SJR_emp
where id=10


--update 
update SJR_emp
set name='indu'


--UPDATE with condition
update SJR_emp 
set age=26 where id=30


--Alter (table name , Rename ,Column Addition , Column Deletion , Column rename )

alter table SJR_emp 
add time int

alter table SJR_emp 
drop column time

--alter table SJR_emp 
--RENAME COLUMN id TO user_id;

EXEC sp_RENAME 'SJR_emp.id', 'user_id', 'COLUMN';









