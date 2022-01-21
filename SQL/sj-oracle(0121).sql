SELECT * FROM employees;
    
SELECT sum(salary) FROM employees;

SELECT sum(commission_pct)
FROM employees;

SELECT AVG(salary)
FROM employees;

SELECT AVG(commission_pct)
FROM employees;

SELECT COUNT(salary)
FROM employees;

SELECT COUNT(commission_pct)
FROM employees;

SELECT SUM(commission_pct), AVG(commission_pct), COUNT(commission_pct)
FROM employees;

--사원들의 1인당 COMMITION_PCT 평균
SELECT SUM(commission_pct)/COUNT(salary)
FROM employees;

SELECT MAX(salary), MIN(salary)
FROM employees;

--회사에서 가장 먼저 입사한 사원의 입사일, 제일 늦게 입사한 사원의 입사일
SELECT MIN(hire_date), MAX(hire_date)
FROM employees;

SELECT employee_id, salary, SUM(salary)
FROM employees;

SELECT commission_pct, NVL(commission_pct, 0)
FROM employees;

SELECT COUNT(commission_pct), COUNT(NVL(commission_pct, 0))
FROM employees;

SELECT commission_pct, NVL2(commission_pct, 1, 0)
FROM employees;

--사원 사원번호, 성, 이름, 월급 조회 (평균 급여보다 많이 받는 직원들)
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary > 6461;

SELECT AVG(salary) FROM employees;

--> Subquery
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);


--부서별 월급 평균, 총급여합계, 인원수, 제일 큰 월급, 제일 작은 월급
SELECT department_id, AVG(salary), SUM(salary), COUNT(first_name), MAX(salary), MIN(salary)
FROM employees
GROUP BY department_id;

SELECT SUM(salary), department_id
FROM employees
WHERE department_id >= 50
GROUP BY department_id;

--부서별 합계가 50000 이상인 부서만 조회
SELECT SUM(salary) SS, department_id    --5
FROM employees                       --1
WHERE department_id >= 50            --2
GROUP BY department_id               --3
HAVING SUM(salary) >= 50000          --4    
ORDER BY 1 DESC;           --6          

SELECT * FROM countries;
--사번이 198인 사원이 근무하는 부서명
SELECT department_id FROM employees WHERE employee_id = 198;
SELECT department_name FROM departments WHERE department_id = 50;

--> Subquery
SELECT department_name 
FROM departments 
WHERE department_id = (SELECT department_id FROM employees WHERE employee_id = 198);

--사번이 198인 사원이 근무하는 부서가 있는 도시명
SELECT department_id FROM employees WHERE employee_id = 198;
SELECT location_id FROM departments WHERE department_id = 50;
SELECT city FROM locations WHERE location_id = 1500;

--> Subquery
SELECT city 
FROM locations 
WHERE location_id = 
    (SELECT location_id FROM departments WHERE department_id = 
        (SELECT department_id FROM employees WHERE employee_id = 198)
    );

--사번이 198인 사원이 근무하는 부서가 있는 도시가 속해 있는 나라명
SELECT department_id FROM employees WHERE employee_id = 198;    --50
SELECT * FROM departments WHERE department_id = 50;             --1500
SELECT country_id FROM locations WHERE location_id = 1500;      --US
SELECT * FROM countries WHERE country_id = 'US';

--> Subquery
SELECT country_name 
FROM countries 
WHERE country_id = 
    (
        SELECT country_id FROM locations WHERE location_id = 
        (
            SELECT location_id FROM departments WHERE department_id = 
            (
                SELECT department_id FROM employees WHERE employee_id = 198
            )
        )
    )
;


--사번이 198인 사원이 근무하는 부서가 있는 도시가 속해 있는 나라명의 대륙 정보
SELECT department_id FROM employees WHERE employee_id = 198;    --50
SELECT * FROM departments WHERE department_id = 50;             --1500
SELECT country_id FROM locations WHERE location_id = 1500;      --US
SELECT region_id FROM countries WHERE country_id = 'US';        --2
SELECT * FROM regions WHERE region_id = 2;

--LAST_NAME Khoo인 사람의 근무하는 부서명
SELECT department_id FROM employees WHERE last_name = 'Khoo';   --30
SELECT department_name FROM departments WHERE department_id = 30;

--1. 사원번호가 199번인 사원의 매니저가 근무하는 부서가 있는 나라명 출력 
SELECT manager_id FROM employees WHERE employee_id = 199;       --124
SELECT department_id FROM employees WHERE employee_id = 124;    --50
SELECT location_id FROM departments WHERE department_id = 50;   --1500
SELECT country_id FROM locations WHERE location_id = 1500;      --US
SELECT country_name FROM countries WHERE country_id = 'US';

--2. 사원들 중에서 월급이 가장 적은 사원이 근무하는 도시명?
SELECT MIN(salary) FROM employees;  --2100
SELECT employee_id FROM employees WHERE salary = 2100;    --132
SELECT department_id FROM employees WHERE employee_id = 132;    --50
SELECT location_id FROM departments WHERE department_id = 50;   --1500
SELECT city FROM locations WHERE location_id = 1500;

--3. 부서명이 IT인 부서에 근무하는 사원들의 모든 정보 출력
SELECT department_id FROM departments WHERE department_name = 'IT';     --60
SELECT * FROM employees WHERE department_id = 60;

--4. Seattle이라는 도시에 근무하는 사원들의 모든 정보 출력
SELECT location_id FROM locations WHERE city = '';   --1700
SELECT * FROM departments WHERE location_id = 1700;         --30, 90, 100...
SELECT * FROM employees WHERE department_id = 30;
SELECT * FROM employees WHERE department_id = 90;
SELECT * FROM employees WHERE department_id = 100;

--월급을 가장 많이 받는 사원과 같은 부서에 근무하는 사원들의 평균 급여
SELECT MAX(salary) FROM employees;
SELECT department_id FROM employees WHERE salary = 24000;

--> Subquery
select AVG(salary)
FROM employees
WHERE department_id = 
    (SELECT department_id FROM employees WHERE salary = 
        (SELECT MAX(salary) FROM employees)
    )
;

select AVG(salary)
FROM employees
WHERE department_id = 
    (SELECT department_id FROM employees WHERE employee_id = 
        (SELECT employee_id FROM employees WHERE salary =
            (SELECT MAX(salary) FROM employees)
        )
    )
;

--Subquery 실습
--1. 사번이 198인 사원이 근무하는 부서가 있는 도시가 속해 있는 나라가 있는 대륙 정보
SELECT region_name 
FROM regions 
WHERE region_id = 
    (SELECT region_id FROM countries WHERE country_id = 
        (SELECT country_id FROM locations WHERE location_id = 
            (SELECT location_id FROM departments WHERE department_id = 
                (SELECT department_id FROM employees WHERE employee_id = 198)
            )
        )
    );

--2. LAST_NAME이 Khoo 인 사람의 근무하는 부서명
SELECT department_name
FROM departments
WHERE department_id = 
    (SELECT department_id FROM employees WHERE last_name = 'Khoo'
    );

--3. 사원번호가 199번인 사원의 매니저가 근무하는 부서가 있는 나라명 출력
SELECT country_name
FROM countries
WHERE country_id = 
    (SELECT country_id FROM locations WHERE location_id =
        (SELECT location_id FROM departments WHERE department_id = 
            (SELECT department_id FROM employees
                  WHERE employee_id = 199)
        )
    )
;

--4. 사원들 중에서 월급이 가장 적은 사원이 근무하는 도시명
SELECT city
FROM locations
WHERE location_id = 
    (SELECT location_id FROM departments WHERE department_id = 
        (SELECT department_id FROM employees WHERE salary = 
              (SELECT MIN(salary) FROM employees
              )
        )
    )
;

--5. 부서명이 IT인 부서에 근무하는 사원들의 모든 정보 출력
SELECT *
FROM employees
WHERE department_id = 
    (SELECT department_id FROM departments WHERE department_name = 'IT')
;


--------------------------------------------------------------------------------

-- 급여가 평균급여보다 많이 받는 사원들이 근무하는 부서정보 출력
SELECT department_id FROM employees WHERE salary > 
    (SELECT AVG(salary) FROM employees);
    
SELECT * FROM departments WHERE department_id IN 
    (
        SELECT department_id FROM employees WHERE salary > 
            (SELECT AVG(salary) FROM employees)
    );

--------------------------------------------------------------------------------
-- EXISTS
SELECT last_name, salary
FROM employees
WHERE NOT EXISTS(SELECT * FROM employees WHERE salary = 2100);


