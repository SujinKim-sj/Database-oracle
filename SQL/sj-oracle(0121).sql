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

--������� 1�δ� COMMITION_PCT ���
SELECT SUM(commission_pct)/COUNT(salary)
FROM employees;

SELECT MAX(salary), MIN(salary)
FROM employees;

--ȸ�翡�� ���� ���� �Ի��� ����� �Ի���, ���� �ʰ� �Ի��� ����� �Ի���
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

--��� �����ȣ, ��, �̸�, ���� ��ȸ (��� �޿����� ���� �޴� ������)
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary > 6461;

SELECT AVG(salary) FROM employees;

--> Subquery
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);


--�μ��� ���� ���, �ѱ޿��հ�, �ο���, ���� ū ����, ���� ���� ����
SELECT department_id, AVG(salary), SUM(salary), COUNT(first_name), MAX(salary), MIN(salary)
FROM employees
GROUP BY department_id;

SELECT SUM(salary), department_id
FROM employees
WHERE department_id >= 50
GROUP BY department_id;

--�μ��� �հ谡 50000 �̻��� �μ��� ��ȸ
SELECT SUM(salary) SS, department_id    --5
FROM employees                       --1
WHERE department_id >= 50            --2
GROUP BY department_id               --3
HAVING SUM(salary) >= 50000          --4    
ORDER BY 1 DESC;           --6          

SELECT * FROM countries;
--����� 198�� ����� �ٹ��ϴ� �μ���
SELECT department_id FROM employees WHERE employee_id = 198;
SELECT department_name FROM departments WHERE department_id = 50;

--> Subquery
SELECT department_name 
FROM departments 
WHERE department_id = (SELECT department_id FROM employees WHERE employee_id = 198);

--����� 198�� ����� �ٹ��ϴ� �μ��� �ִ� ���ø�
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

--����� 198�� ����� �ٹ��ϴ� �μ��� �ִ� ���ð� ���� �ִ� �����
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


--����� 198�� ����� �ٹ��ϴ� �μ��� �ִ� ���ð� ���� �ִ� ������� ��� ����
SELECT department_id FROM employees WHERE employee_id = 198;    --50
SELECT * FROM departments WHERE department_id = 50;             --1500
SELECT country_id FROM locations WHERE location_id = 1500;      --US
SELECT region_id FROM countries WHERE country_id = 'US';        --2
SELECT * FROM regions WHERE region_id = 2;

--LAST_NAME Khoo�� ����� �ٹ��ϴ� �μ���
SELECT department_id FROM employees WHERE last_name = 'Khoo';   --30
SELECT department_name FROM departments WHERE department_id = 30;

--1. �����ȣ�� 199���� ����� �Ŵ����� �ٹ��ϴ� �μ��� �ִ� ����� ��� 
SELECT manager_id FROM employees WHERE employee_id = 199;       --124
SELECT department_id FROM employees WHERE employee_id = 124;    --50
SELECT location_id FROM departments WHERE department_id = 50;   --1500
SELECT country_id FROM locations WHERE location_id = 1500;      --US
SELECT country_name FROM countries WHERE country_id = 'US';

--2. ����� �߿��� ������ ���� ���� ����� �ٹ��ϴ� ���ø�?
SELECT MIN(salary) FROM employees;  --2100
SELECT employee_id FROM employees WHERE salary = 2100;    --132
SELECT department_id FROM employees WHERE employee_id = 132;    --50
SELECT location_id FROM departments WHERE department_id = 50;   --1500
SELECT city FROM locations WHERE location_id = 1500;

--3. �μ����� IT�� �μ��� �ٹ��ϴ� ������� ��� ���� ���
SELECT department_id FROM departments WHERE department_name = 'IT';     --60
SELECT * FROM employees WHERE department_id = 60;

--4. Seattle�̶�� ���ÿ� �ٹ��ϴ� ������� ��� ���� ���
SELECT location_id FROM locations WHERE city = '';   --1700
SELECT * FROM departments WHERE location_id = 1700;         --30, 90, 100...
SELECT * FROM employees WHERE department_id = 30;
SELECT * FROM employees WHERE department_id = 90;
SELECT * FROM employees WHERE department_id = 100;

--������ ���� ���� �޴� ����� ���� �μ��� �ٹ��ϴ� ������� ��� �޿�
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

--Subquery �ǽ�
--1. ����� 198�� ����� �ٹ��ϴ� �μ��� �ִ� ���ð� ���� �ִ� ���� �ִ� ��� ����
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

--2. LAST_NAME�� Khoo �� ����� �ٹ��ϴ� �μ���
SELECT department_name
FROM departments
WHERE department_id = 
    (SELECT department_id FROM employees WHERE last_name = 'Khoo'
    );

--3. �����ȣ�� 199���� ����� �Ŵ����� �ٹ��ϴ� �μ��� �ִ� ����� ���
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

--4. ����� �߿��� ������ ���� ���� ����� �ٹ��ϴ� ���ø�
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

--5. �μ����� IT�� �μ��� �ٹ��ϴ� ������� ��� ���� ���
SELECT *
FROM employees
WHERE department_id = 
    (SELECT department_id FROM departments WHERE department_name = 'IT')
;


--------------------------------------------------------------------------------

-- �޿��� ��ձ޿����� ���� �޴� ������� �ٹ��ϴ� �μ����� ���
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


