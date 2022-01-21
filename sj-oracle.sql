SELECT * FROM locations;

SELECT * --��ȸ�ϰ� ���� �÷����
FROM departments    
WHERE department_id = 60 or department_id = 90;   --���ǽ�

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary >= 10000;

SELECT employee_id, first_name, last_name, salary, department_id
FROM employees
WHERE salary >= 10000 and department_id = 110;
    
--����� ��� ���� last name�� King
SELECT *
FROM employees
WHERE last_name = 'King';

--����� ��� ���� �Ի����� 2002/06/07
SELECT *
FROM employees
WHERE hire_date = '2002/06/07';

SELECT *
FROM employees
WHERE hire_date = '2002-06-07';

--����� ��� ���� Ŀ�̼��� null�� �ƴ� �����
SELECT *
FROM employees
WHERE commission_pct is not null;

-- �μ����̺��� �μ���ȣ�� ��ȸ
SELECT manager_id, department_name AS dname
FROM departments
WHERE department_id = 20;

SELECT salary * 12 FROM employees;
SELECT nvl(commission_pct, 0) AS pct FROM employees;

SELECT * FROM TAB;

-- ��� ���̺��� �޿��� 8000�̻� 10000������ ����
SELECT * 
FROM employees
WHERE salary BETWEEN 8000 and 10000;

-- ��� ���̺��� 2002����� 2003�� 12�� 31�� ���̿� �Ի��� ����� ����
SELECT *
FROM employees
WHERE hire_date BETWEEN '20020101' and '20031231'; 

-- �μ����̺� �μ���ȣ�� 10���̰ų� 30�� ���� ���
SELECT *
FROM departments
WHERE department_id IN (10, 30);

SELECT * FROM employees
WHERE first_name LIKE '%nal%';

-- First_name : sh�� �����ϰų�
-- Last_name : K�� �����ϰų�
SELECT *
FROM employees
WHERE first_name LIKE 'Sh%' or last_name LIKE 'K%';

SELECT *
FROM employees
WHERE department_id = 20
ORDER BY salary ASC;

--�ǽ� ����
--1��
SELECT employee_id, first_name, salary, job_id, hire_date, manager_id
FROM employees;

--2��
SELECT first_name, last_name, salary, salary * 12 + 100 AS IncreasedAnn_Salary, (salary + 100) * 12 AS IncreasedSalary
FROM employees;

--3��
SELECT first_name, last_name, salary
FROM employees
WHERE salary BETWEEN 7000 and 10000
ORDER BY salary ASC;

--4��
SELECT *
FROM employees
WHERE last_name LIKE '%e%' and last_name LIKE '%o%';

--5��
SELECT first_name, last_name, salary, job_id, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC;
