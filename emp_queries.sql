CREATE DATABASE emp_sal;

USE emp_sal;
DROP TABLE IF EXISTS DEPT;
CREATE TABLE DEPT
       (DEPTNO INTEGER(2),
	DNAME VARCHAR(14),
	LOC VARCHAR(13), PRIMARY KEY(DEPTNO));

DROP TABLE IF EXISTS EMP;
CREATE TABLE EMP
       (EMPNO INTEGER(4),
	ENAME VARCHAR(10),
	JOB VARCHAR(9),
	MGR INTEGER(4),
	HIREDATE DATE,
	SAL DECIMAL(7,2),
	COMM DECIMAL(7,2),
	DEPTNO INTEGER(2),
    CONSTRAINT FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO) ON DELETE CASCADE,	
	PRIMARY KEY(EMPNO));
    
INSERT INTO DEPT VALUES
	(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES
	(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES
	(40,'OPERATIONS','BOSTON');
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,STR_TO_DATE('17-12-1980','%d-%m-%Y'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,STR_TO_DATE('20-2-1981','%d-%m-%Y'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,STR_TO_DATE('22-2-1981','%d-%m-%Y'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,STR_TO_DATE('2-4-1981','%d-%m-%Y'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,STR_TO_DATE('28-9-1981','%d-%m-%Y'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,STR_TO_DATE('1-5-1981','%d-%m-%Y'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,STR_TO_DATE('9-6-1981','%d-%m-%Y'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,STR_TO_DATE('13-7-87','%d-%m-%Y'),3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',NULL,STR_TO_DATE('17-11-1981','%d-%m-%Y'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,STR_TO_DATE('8-9-1981','%d-%m-%Y'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,STR_TO_DATE('13-7-87','%d-%m-%Y'),1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,STR_TO_DATE('3-12-1981','%d-%m-%Y'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,STR_TO_DATE('3-12-1981','%d-%m-%Y'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,STR_TO_DATE('23-1-1982','%d-%m-%Y'),1300,NULL,10);

SELECT * FROM dept;

SELECT * FROM EMP;

CREATE TABLE BONUS
	(
	ENAME VARCHAR(10)	,
	JOB VARCHAR(9)  ,
	SAL INTEGER,
	COMM INTEGER
	) ;

CREATE TABLE SALGRADE
      ( GRADE INTEGER,
	LOSAL INTEGER,
	HISAL INTEGER );

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;

SELECT * FROM BONUS;
SELECT * FROM SALGRADE;

-- Q1)  Write a query that changes the employee’s salaries as 2500 whose empno is 7788.

SELECT * FROM EMP;

UPDATE EMP SET SAL = 2500 WHERE EMPNO = 7788;

-- Q2) write a query change the employee’s salaries as 5000 who are working under 10 th
-- department.
UPDATE EMP SET SAL = 5000 WHERE DEPTNO = 10;

-- Q3) write the query hike the employee’s salaries 30% who are working in the 10th Department.
UPDATE EMP SET SAL = SAL + (SAL * 0.3) WHERE DEPTNO = 10;

-- Q4) write the query increase the employee’s salaries 1000 whose names start with A.
UPDATE EMP SET SAL = SAL + 1000 WHERE ENAME LIKE "a%";

-- Q5) Write a query increases the employee’s salary 1000/- whose name is SCOTT working
-- under 20th DEPT.
 UPDATE EMP SET SAL = SAL + 1000 WHERE ENAME = "SCOTT" AND DEPTNO = 20;
 
--  Q6) Increase the employee salary by 1000 whose name starts with ‘S’ and ends with ‘T’ and
-- third letter is ‘O’.
UPDATE EMP SET SAL = SAL + 1000 WHERE ENAME LIKE "S_O%T";

-- Q7)  Change deptno=30 whose emp sal between 1500 to 3000
UPDATE EMP SET DEPTNO=30 WHERE SAL >= 1500 AND SAL <= 3000;

-- Q8) Change job as clerk whose job is manager are joined before 1982.
Update emp set job = 'CLERK' where job = 'MANAGER' and hiredate < '1982-01-01';

-- Q9) Write a query to increase the employee’s salaries 1000 who are having more than 10
-- years.
UPDATE emp SET SAL = SAL + 1000 WHERE year(hiredate) < year(curdate())-10;

-- Q10) Write a query change the employee’s salaries as 7000 who are having commission.
UPDATE emp SET SAL = 7000 WHERE COMM is not NULL OR COMM > 0.00;

-- Q11) Write a query change the employee’s salary 10000 who are not working under anybody
UPDATE emp SET SAL = 10000 WHERE MGR is NULL;

-- Q12) Write a query change employee name as Srinivas and Salary 9000 whose empno=7566.
UPDATE emp SET ENAME = "SRINIVAS", SAL = 9000 WHERE EMPNO = 7566;

-- Q13) Write a query change the employees salary 5000 whose name contain more than 6
-- Character-- 
UPDATE emp SET SAL = 5000 WHERE length(ENAME) > 6;

-- Q14)  Write a query change the employees salaries as 6000 who is less than king.
-- ALL SALARIES LESS THAN SALARY OF KING?  LEAVING THIS QUERY

-- Q15) Change employee salary as 5799 whose name contains to As.
-- Is it two A's?
 
 UPDATE emp SET SAL = 5799 WHERE ENAME like "%A%A%";
 
 -- Q16) Change employee salary 2344 where employee name ending with K
 UPDATE emp SET SAL = 2344 WHERE ENAME like "%K";

-- Q17) Increase employee salaries as 1000 where employee name last but one letter end with A.
UPDATE emp SET SAL = SAL + 1000 WHERE ENAME LIKE "%A_";

-- Q18) Increase the the employee salaries as 1000 where employee name’s second letter starts
-- with A.
 -- (This is second letter of string should be A right?)
UPDATE emp SET SAL = SAL + 1000 WHERE ENAME LIKE "_A%";

-- Q19) Change the employee salary 4500 where who’s name contains two As
-- ALREADY DONE THE SAME IN Q15

UPDATE emp SET SAL = 4500 WHERE ENAME LIKE "%A%A%";

-- Q20) Change employee salary 4000 whose hiredate is 23rd MAY 87.
 SELECT * FROM emp WHERE HIREDATE = "1987-05-23";
 -- A RECORD WITH THAT DATE DOES NOT EXIST
 
 -- Q21) Change the employee salary as 6000 whose joining month in start with M.
UPDATE emp SET SAL = 6000 WHERE monthname(HIREDATE) LIKE "M%";

-- Q22) Change employee salary 1234 where hiredate is in the month MAY or which starts with
-- M and ends with Y
UPDATE emp SET SAL = 1234 WHERE monthname(HIREDATE) = "May" OR monthname(HIREDATE) LIKE "M%Y";

-- Q23) Change the employee salary 4567 where hiredate is on 10th.
UPDATE emp SET SAL = 4567 WHERE dayofmonth(HIREDATE) = 10;

-- Q24) Write a query delete employee details who are working under 10th DEPT.
DELETE FROM emp WHERE deptno = 10;

-- Q25) Delete emp details whose number and job ends with n?
-- Number ending with n? Incomplete question, missing info
DELETE FROM emp WHERE JOB LIKE "%N";

-- Q26) Write a query delete the employee details who are looking under 10th and 20th DEPT.
DELETE FROM emp WHERE DEPTNO = 10 or DEPTNO = 20;
 
 