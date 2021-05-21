--SQL 문
--키워드는 대/소문자 구분 없음
--전체 실행문의 마지막에만 ; 붙이기!!
--데이터 자체는 대/소문자 구별 필요
--DML : 데이터 조작어
--SELECT : 조회
--ORDER BY : 오름차순 정렬

SELECT COUNTRY_NAME, COUNTRY_ID
FROM COUNTRIES
WHERE COUNTRY_ID='CA';

SELECT *
FROM JOBS;

SELECT* FROM JOBS
WHERE MIN_SALARY <= 5000
OR MAX_SALARY > 20000
ORDER BY MAX_SALARY DESC; --내림차순

--연습 문제
--EMPLOYEE 테이블에서 사원 아이디와 이름과 월급 조회
--월급이 1만 이상인 사원만 출력
--월급 기준으로 내림차순 정렬

SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >=10000
ORDER BY SALARY DESC;

SELECT *
FROM EMPLOYEES
WHERE JOB_ID='IT_PROG';

SELECT '홍길동', EMPLOYEE_ID, 100
FROM EMPLOYEES;

--연습 문제
--직원 테이블에서 아이디가 200 이상인 사원 출력
--아이디의 오름차순으로 정렬
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID>=200
ORDER BY EMPLOYEE_ID;

--직원 테이블에서 아이디와 입사 날짜 출력
SELECT employee_ID, hire_date
from EMPLOYEES;

--함수를 적용시키면 ?
--TO_CHAR() : 함수를 이용하여 날짜 포맷 변경
SELECT employee_ID, TO_CHAR(hire_date,'YYYY-MM-DD')
from EMPLOYEES;

--2005년 7월 1일 이후 입사한 사람들만 출력하려면 ?
--월급이 8000이하인 직원들 출력
SELECT employee_ID, TO_CHAR(hire_date,'YYYY-MM-DD'), SALARY
from EMPLOYEES
WHERE HIRE_DATE > '20050701'  AND SALARY <= 8000
ORDER BY HIRE_DATE; --가장 마지막을 실행하는 명령문, ORDER BY

--직원 테이블에서 아이디와 매니저 아이디 출력
--매니저 아이디가 147번인 직원들
SELECT EMPLOYEE_ID, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID = 147;

--테이블 구조를 보고싶을 때는 ? (내림차순 키워드와 다름)
DESC EMPLOYEES;

--직원 테이블에서 아이디와 매니저 아이디 출력
--매니저 아이디가 147번인 직원들의 인원 수를 알고 싶다면 집계 함수(행의 수) 사용(COUNT())
--집계 함수 : 결과값은 단 하나 !
SELECT COUNT(*)
FROM EMPLOYEES
WHERE MANAGER_ID = 147;

--필드명을 작명하고 싶다면 COUNT AS.(AS 생략 가능)
SELECT COUNT(*) AS CNT
FROM EMPLOYEES
WHERE MANAGER_ID = 147;

--집계 함수 연습
--직원 테이블에서 월급이 1만 이상인 사원의 수를 출력
SELECT COUNT(*)
FROM EMPLOYEES
WHERE SALARY >= 10000
OR SALARY <=5000;

--직원 테이블의 월급 합계
--SUM : 합계
SELECT SUM(SALARY) S
FROM EMPLOYEES;

--JOB 아이디가 PROG 인 사람들의 월급 합계
SELECT SUM(SALARY) IT_PROG_S
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

--JOB 아이디가 PROG 인 사람들의 월급 합계와 사원의 수 출력
SELECT SUM(SALARY) IT_PROG_S, COUNT(*)
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

--JOB 아이디가 PROG 인 사람들의 월급 합계와 사원의 수, 월급 평균 출력
--식을 적어서 넣는 방법
SELECT SUM(SALARY) IT_PROG_S, COUNT(*), SUM(SALARY)/COUNT(*)
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

--또는 함수 사용하는 방법
SELECT SUM(SALARY) IT_PROG_S, COUNT(*), AVG(SALARY)
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

--JOB 아이디가 PROG 인 사람들의 월급 합계와 사원의 수, 월급 평균 출력
--가장 많은 월급과 가장 적은 월급 출력
SELECT SUM(SALARY) IT_PROG_S, COUNT(*), AVG(SALARY), MAX(SALARY), MIN(SALARY)
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

--연습문제
--부서 테이블의 부서 수
SELECT COUNT(*)
FROM DEPARTMENTS;

--직업 테이블에서 MIN-SALARY가 5000 미만인 직업 수
SELECT COUNT(*)
FROM JOBS
WHERE MIN_SALARY <5000;

--직원 테이블에서 입사 날짜가 2005년 1월 1일 이후이고 월급이 1만 이상 2만 이하인 사원의 수
SELECT COUNT(*)
FROM EMPLOYEES
WHERE HIRE_DATE >= '20050101' AND SALARY >= 10000 AND SALARY <= 20000;

--또는 함수 사용
SELECT COUNT(*)
FROM EMPLOYEES
WHERE HIRE_DATE >= '20050101' AND SALARY BETWEEN 10000 AND 20000;

--직원 테이블에서 직원 아이디와 직업 아이디 조회
SELECT employee_id, job_id
from EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

--JOB 아이디별로 그룹을 지어서 카운터를 하고 싶다면
SELECT JOB_ID, COUNT(*)
from EMPLOYEES
GROUP BY JOB_ID; --소계 낼 때

--그룹 별 사원의 수 별로 정렬을 하고 싶다면
SELECT JOB_ID, COUNT(*) CNT
from EMPLOYEES
GROUP BY JOB_ID
ORDER BY CNT;

--사원의 수가 10명 이상인 잡 아이디만 출력하고 싶다면
SELECT JOB_ID, COUNT(*) CNT --실행 순서 : 4 / COUNT --실행 순서 : 6
from EMPLOYEES --실행 순서 : 1 
WHERE JOB_ID LIKE 'S%' --S로 시작하는 잡 아이디 출력 --실행 순서 : 2
GROUP BY JOB_ID --실행 순서 : 3
HAVING COUNT(*) >=10 --그룹의 조건 --실행 순서 : 5
ORDER BY CNT; --실행 순서 : 7









