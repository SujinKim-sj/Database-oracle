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

--6. Employees ���̺��� LAST_NAME�� Greenberg ������� �޿��� �� ���� �ް� �ִ� ��������� ���
SELECT *
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Greenberg');

--7. �μ��� �ּұ޿��� �ް� �ִ� ����� ���� ���
--�ٽ� Ǯ���
SELECT *
FROM employees
WHERE salary IN
    (SELECT MIN(salary) FROM employees GROUP BY department_id);

--8. �����̸��� 'S'�ν����ϴ� ������ �ٹ��ϴ� ����� ���� ���	
SELECT *
FROM employees
WHERE department_id IN
    (SELECT department_id FROM departments WHERE location_id IN
        (SELECT location_id FROM locations WHERE city LIKE 'S%')
    );

--9. ���� Austin ����� �Ŵ���(���)�� �ٹ��ϴ� �μ��� ��� �޿����� ���� �޴� �μ��� �̸�
--�ٽ� Ǯ���
SELECT department_name
FROM departments
WHERE department_id IN
    (SELECT department_id FROM employees WHERE salary > ALL
        (SELECT AVG(salary) FROM employees WHERE manager_id = 
            (SELECT manager_id FROM employees WHERE last_name = 'Austin')
        )
    );
