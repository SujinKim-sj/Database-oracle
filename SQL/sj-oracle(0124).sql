SELECT * FROM USER_CONSTRAINTS;

SELECT * FROM USER_CONSTRAINTS WHERE table_name = 'EMPLOYEES';

SELECT * FROM USER_CONSTRAINTS WHERE table_name = 'DEPARTMENTS';


SELECT * FROM employees WHERE employee_id = 200;    -- 결과물이 1개 아니면 0
SELECT * FROM employees WHERE salary = 10000;       -- 결과물이 N개 아니면 0

-- 사원번호가 200인 사원의 개인 이름, 월급 부서명 조회
SELECT * FROM employees WHERE employee_id = 200;
SELECT * FROM departments WHERE department_id = 10;

SELECT e.first_name, e.salary, e.department_id, d.department_name    --3
FROM employees e                                    --1
    INNER JOIN
    departments d
    ON(e.department_id = d.department_id)
WHERE e.employee_id = 200;                          --2

-- 20번 부서에 근무하는 사원들의 사원번호, 입사일, 월급, 부서명
SELECT e.employee_id, e.hire_date, e.salary, d.department_name
FROM employees e
    INNER JOIN 
    departments d
    ON(e.department_id = d.department_id)
WHERE e.department_id = 20;

---
SELECT * FROM TAB;
SELECT * FROM JOBS;
SELECT * FROM employees;

-- 8200, 16000에 속하는 사원의 ID와 JOB_TITLE
SELECT e.employee_id, j.job_title
FROM employees e
    JOIN
    jobs j
    ON e.salary BETWEEN 8200 and 16000;

SELECT e.*, d.*
FROM employees e
    INNER JOIN
    departments d
    ON (e.department_id = d.department_id);
    
SELECT COUNT(employee_id) FROM employees;

-- 사원번호가 192번인 사원의 이름, 성, 부서명, 도시명
SELECT e.first_name, e.last_name, d.department_name, l.city
FROM employees e
    INNER JOIN 
    departments d
    ON (e.department_id = d.department_id)
    INNER JOIN 
    locations l
    ON (d.location_id = l.location_id)
WHERE e.employee_id = 192;


SELECT * FROM countries;
SELECT * FROM regions;

SELECT c.country_name, r.region_name
FROM countries c
    INNER JOIN
    regions r
    ON (c.region_id = r.region_id);

SELECT c.country_name, r.region_name, region_id
FROM countries c
    NATURAL JOIN
    regions r;

--사원번호가 192사원의 이름, 월급, 매니저의 이름, 매니저의 월급

SELECT first_name, salary,
    (
        SELECT first_name
        FROM employees
        WHERE employee_id = 192
    )AS MANGER_NAME,
    (
        SELECT salary
        FROM employees
        WHERE employee_id =
        (
            SELECT manager_id
            FROM employees
            WHERE employee_id = 192
         )
    ) MANAGER_SALARY
FROM employees
WHERE employee_id = 192;

-- Self Join
SELECT e.first_name, e.salary, ae.first_name AS "MANAGER NAME", ae.salary AS "MANAGER SALARY"
FROM employees e
    INNER JOIN
    employees ae
    ON (e.manager_id = ae.employee_id)
WHERE e.employee_id = 192;

-- Outer Join
SELECT e.first_name, e.salary, ae.first_name AS "MANAGER NAME", ae.salary AS "MANAGER SALARY"
FROM employees e
    LEFT OUTER JOIN
    employees ae
    ON (e.manager_id = ae.employee_id)
WHERE e.employee_id = 100;

-- 부서별 부서정보와 사원들의 정보를 모두 출력
SELECT e.*, d.*
FROM employees e
    INNER JOIN 
    departments d
    ON (e.department_id = d.department_id);

    -- 부서가 없는 사원정보까지 출력
SELECT e.*, d.*
FROM employees e
    LEFT OUTER JOIN
    departments d
    ON (e.department_id = d.department_id)
ORDER BY e.employee_id DESC;

    -- 있는 부서지만 사원이 없어서 조회가 안됨
    -- 사원이 없는 부서까지 출력
SELECT e.*, d.*
FROM employees e
    RIGHT OUTER JOIN
    departments d
    ON (e.department_id = d.department_id)
ORDER BY d.department_id DESC;

     -- 사원이 없는 부서와 부서가 없는 사원정보 모두 출력
SELECT e.*, d.*
FROM employees e
    FULL OUTER JOIN
    departments d
    ON (e.department_id = d.department_id)
ORDER BY d.department_id DESC;
    
-- USING
SELECT e.first_name, e.salary, department_id, d.department_name   
FROM employees e                                    
    INNER JOIN
    departments d
    --ON(e.department_id = d.department_id)
    USING(department_id)
WHERE e.employee_id = 200; 

-- Oxford 도시에 근무하는 사원의 이름과 성, 업무, 부서이름, 도시이름을 출력
SELECT e.first_name, e.last_name, e.job_id, d.department_name, l.city  
FROM employees e
    INNER JOIN
    departments d
    USING(department_id)
    INNER JOIN
    locations l
    USING (location_id)
WHERE l.city = 'Oxford';

SELECT d.*, e.*
FROM departments d
    INNER JOIN
    employees e
    ON(d.department_id = e.department_id);

-- 사원번호가 198번인 사원의 정보와 부서 정보
SELECT e.*, d.*
FROM employees e
    INNER JOIN
    departments d
    ON e.department_id = d.department_id
WHERE e.employee_id = 198;