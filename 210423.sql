--SQL ��
--Ű����� ��/�ҹ��� ���� ����
--��ü ���๮�� ���������� ; ���̱�!!
--������ ��ü�� ��/�ҹ��� ���� �ʿ�
--DML : ������ ���۾�
--SELECT : ��ȸ
--ORDER BY : �������� ����

SELECT COUNTRY_NAME, COUNTRY_ID
FROM COUNTRIES
WHERE COUNTRY_ID='CA';

SELECT *
FROM JOBS;

SELECT* FROM JOBS
WHERE MIN_SALARY <= 5000
OR MAX_SALARY > 20000
ORDER BY MAX_SALARY DESC; --��������

--���� ����
--EMPLOYEE ���̺��� ��� ���̵�� �̸��� ���� ��ȸ
--������ 1�� �̻��� ����� ���
--���� �������� �������� ����

SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >=10000
ORDER BY SALARY DESC;

SELECT *
FROM EMPLOYEES
WHERE JOB_ID='IT_PROG';

SELECT 'ȫ�浿', EMPLOYEE_ID, 100
FROM EMPLOYEES;

--���� ����
--���� ���̺��� ���̵� 200 �̻��� ��� ���
--���̵��� ������������ ����
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID>=200
ORDER BY EMPLOYEE_ID;

--���� ���̺��� ���̵�� �Ի� ��¥ ���
SELECT employee_ID, hire_date
from EMPLOYEES;

--�Լ��� �����Ű�� ?
--TO_CHAR() : �Լ��� �̿��Ͽ� ��¥ ���� ����
SELECT employee_ID, TO_CHAR(hire_date,'YYYY-MM-DD')
from EMPLOYEES;

--2005�� 7�� 1�� ���� �Ի��� ����鸸 ����Ϸ��� ?
--������ 8000������ ������ ���
SELECT employee_ID, TO_CHAR(hire_date,'YYYY-MM-DD'), SALARY
from EMPLOYEES
WHERE HIRE_DATE > '20050701'  AND SALARY <= 8000
ORDER BY HIRE_DATE; --���� �������� �����ϴ� ��ɹ�, ORDER BY

--���� ���̺��� ���̵�� �Ŵ��� ���̵� ���
--�Ŵ��� ���̵� 147���� ������
SELECT EMPLOYEE_ID, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID = 147;

--���̺� ������ ������� ���� ? (�������� Ű����� �ٸ�)
DESC EMPLOYEES;

--���� ���̺��� ���̵�� �Ŵ��� ���̵� ���
--�Ŵ��� ���̵� 147���� �������� �ο� ���� �˰� �ʹٸ� ���� �Լ�(���� ��) ���(COUNT())
--���� �Լ� : ������� �� �ϳ� !
SELECT COUNT(*)
FROM EMPLOYEES
WHERE MANAGER_ID = 147;

--�ʵ���� �۸��ϰ� �ʹٸ� COUNT AS.(AS ���� ����)
SELECT COUNT(*) AS CNT
FROM EMPLOYEES
WHERE MANAGER_ID = 147;

--���� �Լ� ����
--���� ���̺��� ������ 1�� �̻��� ����� ���� ���
SELECT COUNT(*)
FROM EMPLOYEES
WHERE SALARY >= 10000
OR SALARY <=5000;

--���� ���̺��� ���� �հ�
--SUM : �հ�
SELECT SUM(SALARY) S
FROM EMPLOYEES;

--JOB ���̵� PROG �� ������� ���� �հ�
SELECT SUM(SALARY) IT_PROG_S
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

--JOB ���̵� PROG �� ������� ���� �հ�� ����� �� ���
SELECT SUM(SALARY) IT_PROG_S, COUNT(*)
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

--JOB ���̵� PROG �� ������� ���� �հ�� ����� ��, ���� ��� ���
--���� ��� �ִ� ���
SELECT SUM(SALARY) IT_PROG_S, COUNT(*), SUM(SALARY)/COUNT(*)
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

--�Ǵ� �Լ� ����ϴ� ���
SELECT SUM(SALARY) IT_PROG_S, COUNT(*), AVG(SALARY)
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

--JOB ���̵� PROG �� ������� ���� �հ�� ����� ��, ���� ��� ���
--���� ���� ���ް� ���� ���� ���� ���
SELECT SUM(SALARY) IT_PROG_S, COUNT(*), AVG(SALARY), MAX(SALARY), MIN(SALARY)
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

--��������
--�μ� ���̺��� �μ� ��
SELECT COUNT(*)
FROM DEPARTMENTS;

--���� ���̺��� MIN-SALARY�� 5000 �̸��� ���� ��
SELECT COUNT(*)
FROM JOBS
WHERE MIN_SALARY <5000;

--���� ���̺��� �Ի� ��¥�� 2005�� 1�� 1�� �����̰� ������ 1�� �̻� 2�� ������ ����� ��
SELECT COUNT(*)
FROM EMPLOYEES
WHERE HIRE_DATE >= '20050101' AND SALARY >= 10000 AND SALARY <= 20000;

--�Ǵ� �Լ� ���
SELECT COUNT(*)
FROM EMPLOYEES
WHERE HIRE_DATE >= '20050101' AND SALARY BETWEEN 10000 AND 20000;

--���� ���̺��� ���� ���̵�� ���� ���̵� ��ȸ
SELECT employee_id, job_id
from EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

--JOB ���̵𺰷� �׷��� ��� ī���͸� �ϰ� �ʹٸ�
SELECT JOB_ID, COUNT(*)
from EMPLOYEES
GROUP BY JOB_ID; --�Ұ� �� ��

--�׷� �� ����� �� ���� ������ �ϰ� �ʹٸ�
SELECT JOB_ID, COUNT(*) CNT
from EMPLOYEES
GROUP BY JOB_ID
ORDER BY CNT;

--����� ���� 10�� �̻��� �� ���̵� ����ϰ� �ʹٸ�
SELECT JOB_ID, COUNT(*) CNT --���� ���� : 4 / COUNT --���� ���� : 6
from EMPLOYEES --���� ���� : 1 
WHERE JOB_ID LIKE 'S%' --S�� �����ϴ� �� ���̵� ��� --���� ���� : 2
GROUP BY JOB_ID --���� ���� : 3
HAVING COUNT(*) >=10 --�׷��� ���� --���� ���� : 5
ORDER BY CNT; --���� ���� : 7









