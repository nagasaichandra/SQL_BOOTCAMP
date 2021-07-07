-- CREATE DATABASE emp_sal_2;

USE emp_sal_2;
-- DROP TABLE IF EXISTS DEPT;
CREATE TABLE DEPT
       (DEPTNO INTEGER(2),
	DNAME VARCHAR(14),
	LOC VARCHAR(13), PRIMARY KEY(DEPTNO));

-- DROP TABLE IF EXISTS EMP;
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


-- 1. Query Emp table.
SELECT * FROM EMP;

-- 2. Select the employees in department 30.
SELECT * FROM EMP where deptno = 30;

-- 3. List the names, numbers and departments of all clerks.
SELECT ENAME, EMPNO, DEPTNO FROM EMP WHERE JOB = "CLERK";

-- 4. Find the department numbers and names of employees of all departments with deptno
-- greater than 20.
SELECT DEPTNO, ENAME FROM EMP WHERE DEPTNO > 20;

-- 5. Find employees whose commission is greater than their salaries.
SELECT * FROM EMP WHERE COMM > SAL;

-- 6. Find employees whose commission is greater than 60 % of their salaries.
SELECT * FROM EMP WHERE COMM > (0.6 * SAL);

-- 7. List name, job and salary of all employees in department 20 who earn more than 2000/-.
SELECT ENAME, JOB, SAL FROM EMP WHERE DEPTNO = 20 AND SAL > 2000;

-- 8. Find all salesmen in department 30 whose salary is greater than 1500/-.
SELECT * FROM EMP WHERE JOB = "SALESMAN" AND DEPTNO = 30 AND SAL > 1500;

-- 9. Find all employees whose designation is either manager or president.
SELECT * FROM EMP WHERE JOB = "manager" OR JOB = "president";

-- 10. Find all managers who are not in department 30.
SELECT * FROM EMP WHERE JOB = "manager" AND DEPTNO <> 30;

-- 11. Find all the details of managers and clerks in dept 10.
SELECT * FROM EMP WHERE JOB in ("manager", "clerk") and DEPTNO = 10;

-- 12. Find the details of all the managers (in any dept) and clerks in dept 20.
SELECT * FROM EMP WHERE JOB = "manager" or (JOB = "clerk" AND DEPTNO = 20);

-- 13. Find the details of all the managers in dept. 10 and all clerks in dept 20 and all
-- employees who are neither managers nor clerks but whose salary is more than or equal to
-- 2000/-.
SELECT * FROM EMP WHERE (JOB = "manager" AND DEPTNO = 10) OR (JOB = "clerk" AND DEPTNO = 20) OR (SAL >= 2000);

-- 14. Find the names of anyone in dept. 20 who is neither manager nor clerk.
SELECT ENAME FROM EMP WHERE DEPTNO = 20 AND JOB NOT IN ("manager", "clerk");

-- 15. Find the names of employees who earn between 1200/- and 1400/-.
SELECT ENAME FROM EMP where SAL BETWEEN 1200 AND 1400;

-- 16. Find the employees who are clerks, analysts or salesmen.
SELECT * FROM EMP WHERE JOB in ("clerk","analyst","salesman");

-- 17. Find the employees who are not clerks, analysts or salesmen.
SELECT * FROM EMP WHERE JOB not in ("clerk","analyst","salesman");

-- 18. Find the employees who do not receive commission.
SELECT * FROM EMP WHERE COMM is NULL;

-- 19. Find the different jobs of employees receiving commission.
select DISTINCT JOB FROM EMP WHERE COMM IS NOT NULL;
-- 20. Find the employees who do not receive commission or whose commission is less than
-- 100/-.
SELECT * FROM EMP WHERE COMM IS NULL OR COMM < 100;

-- 21. If all the employees not receiving commission is entitles to a bonus of Rs. 250/- show
-- the net earnings of all the employees.
SELECT *, SAL + 250 AS NET_EARNING FROM EMP WHERE COMM IS NULL;

-- 22. Find all the employees whose total earning is greater than 2000/- .
SELECT * FROM EMP WHERE SAL + COMM > 2000;

-- 23. Find all the employees whose name begins or ends with ‘M’
SELECT * FROM EMP WHERE ENAME LIKE "m%";

-- 24. Find all the employees whose names contain the letter ‘M’ in any case.
SELECT * FROM EMP WHERE ENAME LIKE "%M%";

-- 25. Find all the employees whose names are upto 15 character long and have letter ‘R’ as
-- 3rd character of their names.
SELECT * FROM EMP WHERE ENAME LIKE "__R%" AND length(ename) <= 15;

-- 26. Find all the employees who were hired in the month of February (of any year).
SELECT * FROM EMP WHERE month(HIREDATE) = 02;

-- 27. Find all the employees who were hired on last day of the month.
select * from emp where last_day(hiredate) = date(hiredate);

-- 28. Find all the employees who were hired more than 2 years ago.
SELECT * FROM EMP WHERE YEAR(HIREDATE) < 2018;

-- 29. Find the managers hired in the year 2003.
SELECT * FROM EMP WHERE YEAR(HIREDATE) = 2003;
SELECT * FROM EMP;

-- 30. Display the names and jobs of all the employees separated by a space.
SELECT CONCAT(ENAME, " ", JOB) AS NAME_JOB FROM EMP;

-- 31. Display the names of all the employees right aligning them to 15 characters.
SELECT lpad(ENAME, 15, " ") FROM EMP;

-- 32. Display the names of all the employees padding them to the right up to 15 characters
-- with ‘*’.
SELECT lpad(ENAME, 15, "*") FROM EMP;

-- 33. Display the names of all the employees without any leading ‘A’.
SELECT TRIM(LEADING 'A' FROM ename) from emp; 
-- 34. Display the names of all the employees without any trailing ‘R’.
SELECT TRIM(TRAILING 'R' FROM ename) from emp; 

-- 35. Show the first 3 and last 3 characters of the names of all the employees.
SELECT SUBSTRING(ename FROM 0 FOR 3), SUBSTRING(ename, -1, 3) from emp;

-- 36. Display the names of all the employees replacing ‘A’ with ‘a’.
SELECT REPLACE(ename, 'A', 'a') FROM EMP;

-- 37. Display the names of all the employees and position where the string ‘AR’ occurs in the
-- name.
SELECT ENAME, JOB FROM EMP WHERE ENAME LIKE "%AR%";

-- 38. Show the salary of all the employees , rounding it to the nearest Rs. 1000/-.
SELECT SAL, ROUND(SAL, -3) FROM EMP;

-- 39. Show the salary of all the employees , ignoring the fraction less than Rs. 1000/-.
-- -- -- --  DONT UNDERSTAND THIS QUESTION YET-- 
SELECT SAL FROM EMP WHERE SAL > 1000;

-- 40. Show the names of all the employees and date on which they completed 3 years of
-- service.
SELECT * FROM EMP;
SELECT ENAME FROM EMP WHERE year(current_date()) - year(hiredate) > 3;

-- 41. For each employee, display the no. of days passed since the employee joined the
-- company.
SELECT 365*(YEAR(current_date()) - YEAR(hiredate)) FROM EMP;
SELECT datediff(current_date(), hiredate) FROM EMP;
-- 42. For each employee, display the no. of months passed since the employee joined the
-- company.
SELECT floor((datediff(current_date(), hiredate))/12) FROM EMP;

-- 43. Display the details of all the employees sorted on the names.
SELECT * FROM EMP ORDER BY ENAME;

-- 44. Display the names of the employees, based on the tenure with the oldest employee
-- coming first.
SELECT ENAME FROM EMP order by HIREDATE;


-- 45. Display the names, jobs and salaries of employees, sorting on job and salary.
SELECT ENAME, JOB, SAL FROM EMP order by JOB, SAL;

-- 46. Display the names, jobs and salaries of employees, sorting on descending order of job
-- and within job sorted on salary.
SELECT ENAME, JOB, SAL FROM EMP order by job DESC, SAL;


-- 47. List the employee names, department names and salary for those employees who have
-- completed 1 year of service.
SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT e.ENAME, d.DNAME, SAL FROM DEPT d JOIN EMP e ON d.DEPTNO = e.DEPTNO WHERE YEAR(current_date()) - YEAR(hiredate) > 1;

-- 48. List the employee names, department names and salary for those employees who are
-- earning 0 commission or commission is null. Sort your output in the order of department
-- name.
SELECT e.ENAME, d.DNAME, e.SAL FROM DEPT d JOIN EMP e ON d.DEPTNO = e.DEPTNO WHERE COMM IS NULL or COMM = 0 ORDER BY e.DEPTNO;

-- 49. List the employee names, department names and hiredate for those employees who
-- have joined in 2003 . Sort your output in the order of joining date.
SELECT e.ENAME, d.DNAME, e.HIREDATE FROM DEPT d JOIN EMP e ON d.DEPTNO = e.DEPTNO WHERE YEAR(HIREDATE) = 2003 ORDER BY HIREDATE;


-- 50. List all the department names along with the names of employees in them , irrespective
-- of the fact whether any employee is there or not.
SELECT * FROM DEPT;

SELECT d.dname, e.ename FROM emp e RIGHT JOIN dept d ON e.deptno = d.deptno;