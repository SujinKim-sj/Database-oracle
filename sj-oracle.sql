SELECT * FROM locations;

SELECT * --조회하고 싶은 컬럼명들
FROM departments    
WHERE department_id = 60 or department_id = 90;   --조건식

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary >= 10000;

SELECT employee_id, first_name, last_name, salary, department_id
FROM employees
WHERE salary >= 10000 and department_id = 110;
    
--사원의 모든 정보 last name이 King
SELECT *
FROM employees
WHERE last_name = 'King';

--사원의 모든 정보 입사일이 2002/06/07
SELECT *
FROM employees
WHERE hire_date = '2002/06/07';

SELECT *
FROM employees
WHERE hire_date = '2002-06-07';

--사원의 모든 정보 커미션이 null이 아닌 사원들
SELECT *
FROM employees
WHERE commission_pct is not null;

-- 부서테이블에서 부서번호로 조회
SELECT manager_id, department_name AS dname
FROM departments
WHERE department_id = 20;

SELECT salary * 12 FROM employees;
SELECT nvl(commission_pct, 0) AS pct FROM employees;

SELECT * FROM TAB;

-- 사원 테이블에서 급여가 8000이상 10000이하의 정보
SELECT * 
FROM employees
WHERE salary BETWEEN 8000 and 10000;

-- 사원 테이블에서 2002년부터 2003년 12월 31일 사이에 입사한 사원의 정보
SELECT *
FROM employees
WHERE hire_date BETWEEN '20020101' and '20031231'; 

-- 부서테이블에 부서번호가 10번이거나 30번 정보 출력
SELECT *
FROM departments
WHERE department_id IN (10, 30);

SELECT * FROM employees
WHERE first_name LIKE '%nal%';

-- First_name : sh로 시작하거나
-- Last_name : K로 시작하거나
SELECT *
FROM employees
WHERE first_name LIKE 'Sh%' or last_name LIKE 'K%';

SELECT *
FROM employees
WHERE department_id = 20
ORDER BY salary ASC;

--실습 문제
--1번
SELECT employee_id, first_name, salary, job_id, hire_date, manager_id
FROM employees;

--2번
SELECT first_name, last_name, salary, salary * 12 + 100 AS IncreasedAnn_Salary, (salary + 100) * 12 AS IncreasedSalary
FROM employees;

--3번
SELECT first_name, last_name, salary
FROM employees
WHERE salary BETWEEN 7000 and 10000
ORDER BY salary ASC;

--4번
SELECT *
FROM employees
WHERE last_name LIKE '%e%' and last_name LIKE '%o%';

--5번
SELECT first_name, last_name, salary, job_id, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC;
