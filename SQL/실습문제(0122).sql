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

--6. Employees 테이블에서 LAST_NAME이 Greenberg 사원보다 급여를 더 많이 받고 있는 사원들정보 출력
SELECT *
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Greenberg');

--7. 부서별 최소급여를 받고 있는 사원의 정보 출력
--다시 풀어보기
SELECT *
FROM employees
WHERE salary IN
    (SELECT MIN(salary) FROM employees GROUP BY department_id);

--8. 도시이름이 'S'로시작하는 지역에 근무하는 사원의 정보 출력	
SELECT *
FROM employees
WHERE department_id IN
    (SELECT department_id FROM departments WHERE location_id IN
        (SELECT location_id FROM locations WHERE city LIKE 'S%')
    );

--9. 성이 Austin 사원의 매니저(상사)가 근무하는 부서의 평균 급여보다 많이 받는 부서의 이름
--다시 풀어보기
SELECT department_name
FROM departments
WHERE department_id IN
    (SELECT department_id FROM employees WHERE salary > ALL
        (SELECT AVG(salary) FROM employees WHERE manager_id = 
            (SELECT manager_id FROM employees WHERE last_name = 'Austin')
        )
    );
