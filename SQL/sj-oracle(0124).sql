SELECT * FROM USER_CONSTRAINTS;

SELECT * FROM USER_CONSTRAINTS WHERE table_name = 'EMPLOYEES';

SELECT * FROM USER_CONSTRAINTS WHERE table_name = 'DEPARTMENTS';


SELECT * FROM employees WHERE employee_id = 200;    -- ������� 1�� �ƴϸ� 0
SELECT * FROM employees WHERE salary = 10000;       -- ������� N�� �ƴϸ� 0

-- �����ȣ�� 200�� ����� ���� �̸�, ���� �μ��� ��ȸ
SELECT * FROM employees WHERE employee_id = 200;
SELECT * FROM departments WHERE department_id = 10;

SELECT e.first_name, e.salary, e.department_id, d.department_name    --3
FROM employees e                                    --1
    INNER JOIN
    departments d
    ON(e.department_id = d.department_id)
WHERE e.employee_id = 200;                          --2

-- 20�� �μ��� �ٹ��ϴ� ������� �����ȣ, �Ի���, ����, �μ���
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

-- 8200, 16000�� ���ϴ� ����� ID�� JOB_TITLE
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

-- �����ȣ�� 192���� ����� �̸�, ��, �μ���, ���ø�
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

--�����ȣ�� 192����� �̸�, ����, �Ŵ����� �̸�, �Ŵ����� ����

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

-- �μ��� �μ������� ������� ������ ��� ���
SELECT e.*, d.*
FROM employees e
    INNER JOIN 
    departments d
    ON (e.department_id = d.department_id);

    -- �μ��� ���� ����������� ���
SELECT e.*, d.*
FROM employees e
    LEFT OUTER JOIN
    departments d
    ON (e.department_id = d.department_id)
ORDER BY e.employee_id DESC;

    -- �ִ� �μ����� ����� ��� ��ȸ�� �ȵ�
    -- ����� ���� �μ����� ���
SELECT e.*, d.*
FROM employees e
    RIGHT OUTER JOIN
    departments d
    ON (e.department_id = d.department_id)
ORDER BY d.department_id DESC;

     -- ����� ���� �μ��� �μ��� ���� ������� ��� ���
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

-- Oxford ���ÿ� �ٹ��ϴ� ����� �̸��� ��, ����, �μ��̸�, �����̸��� ���
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

-- �����ȣ�� 198���� ����� ������ �μ� ����
SELECT e.*, d.*
FROM employees e
    INNER JOIN
    departments d
    ON e.department_id = d.department_id
WHERE e.employee_id = 198;