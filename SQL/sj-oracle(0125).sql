--NATURAL JOIN은 INNER JOIN
----INNER
SELECT e.*, d.*
FROM employees e
    INNER JOIN
    departments d
    ON(e.department_id = d.department_id);
    --USING(DEPARTMENT_ID)
    
----NATURAL
SELECT e.*, d.*
FROM employees e
    NATURAL JOIN
    departments d;
    
SELECT r.region_name, c.country_name, region_id
FROM regions r
    NATURAL JOIN
    countries c;

SELECT r.region_name, c.country_name, region_id
FROM regions r
    INNER JOIN
    countries c
    USING (region_id);

-------------------------------------
SELECT * FROM regions;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='REGIONS';

DESC regions;

--Regions INSERT
INSERT INTO regions (region_id, region_name)
VALUES (5, 'Test');

INSERT INTO regions (region_name, region_id)
VALUES ('South Pole', 6);

--Countries INSERT
DESC countries;
SELECT * FROM countries;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='COUNTRIES';

--MC myCountry 6
INSERT INTO countries(country_id, country_name, region_id)
VALUES ('MC', 'myCountry', 4);

INSERT INTO countries(country_id, country_name, region_id)
VALUES (NULL, 'MyCountry', 4);

INSERT INTO countries(country_id, country_name, region_id)
VALUES ('MyCountry', 4);

INSERT INTO countries (country_id, region_id)
VALUES ('MC', 4);

INSERT INTO countries
VALUES ('MC', NULL, 4);

INSERT INTO regions (region_id, region_name)
VALUES (
    (SELECT MAX(region_id) FROM regions) + 1,
    'North Pole');

--
SELECT * FROM SEQ;

-- UPDATE ---
UPDATE regions SET region_name = 'SPACE';
UPDATE regions SET region_name = 'SPACE' WHERE region_id = 1;

-- Region 테이블에서 제일 마지막에 INSERT한 ROW의 NAME을 SPACE로 수정
UPDATE regions SET region_name = 'SPACE' WHERE
region_id = (SELECT MAX(region_id) FROM regions);

-- 매니저가 없는 부서들을 200 사원으로 변경
SELECT * FROM departments;

UPDATE departments SET manager_id = 200 WHERE manager_id IS NULL;

-- DELETE ---
DELETE employees;
DELETE regions WHERE region_id = 2;
SELECT * FROM regions;
SELECT * FROM employees ORDER BY employee_id DESC;

-- EMPLOYEES MANAGER인 사원들을 삭제
DELETE employees WHERE employee_id = 206;
-----------------------------------------------
DESC departments;
SELECT * FROM user_constraints WHERE table_name = 'DEPARTMENTS';
SELECT * FROM seq;
SELECT * FROM departments;

--MANAGER_ID : 200
--LOCATION_ID : 1800
--시퀀스명.nextval
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES(DEPARTMENTS_SEQ.nextval, 'Test', 200, 1800);

INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES(DEPARTMENTS_SEQ.nextval, 'Test2', 200, 1800);


ROLLBACK;






