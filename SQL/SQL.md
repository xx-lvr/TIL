## SQL
SQL은 'Structured Query Language'의 약자로, 데이터베이스에서 데이터를 추출하고 조작하는 데에 사용하는 데이터 처리 언어

```bash
EMPNO : 사원 번호
ENAME : 사원 이름
JOB : 사원 직책
MGR : 직속 상관의 사원 번호
HIREDATE : 입사일
SAL : 급여
COMM : 급여 외 추가 수당
DEPTNO : 사원이 속한 부서 번호
```

## 예제
```sql
SELECT * FROM EMP;
```
```SQL
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%S';
```