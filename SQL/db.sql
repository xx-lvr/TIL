''''''''''''''''SELECT * FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP (denton, DNAME, LOC)
VALUES (50, 'DATABASE', 'SEOUL');

INSERT INTO DEPT_TEMP
VALUES (60, 'NETWORK', 'BUSAN');

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES (70, 'WEB', NULL);

SELECT * FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES (80, 'MOBILE', '');

INSERT INTO DEPT_TEMP (DEPTNO, LOC)
VALUES (90, 'INCHEON');

SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (3111, '심청이', 'MANAGER', 9999, SYSDATE, 4OOO, NULL, 30);

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
AND S.GRADE = 1;

SELECT * FROM EMP_TEMPS

-- 새로운

CREATE TABLE EMP_TEMP2
    AS SELECT * FROM EMP;

SELECT * FROM EMP_TEMP2;

DELETE FROM EMP_TEMP2
    WHERE JOB = 'MANAGER';

DELETE FROM EMP_TEMP2
WHERE EMPNO IN (SELECT E.EMPNO
                    FROM EMP_TEMP2 E, SALGRADE S
                    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                    AND S.GRADE = 3
                    AND DEPTNO = 30);

SELECT * FROM DEPT_DDL;

CREATE TABLE EMP_DDL_30
    AS SELECT *
        FROM EMP
        WHERE DEPTNO = 30;

SELECT * FROM EMP_DDL_30;

CREATE TABLE EMPDEPT_DDL
    AS SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE,
            E.SAL, E.COMM, D.DEPTNO, D.DNAME, D.LOC
        FROM EMP E, DEPT D
    WHERE 1 <> 1;

SELECT * FROM EMPDEPT_DDL;

CREATE TABLE EMP_ALTER
    AS SELECT * FROM EMP;
SELECT * FROM EMP_ALTER;

ALTER TABLE EMP_ALTER
ADD HP VARCHAR2(20);

ALTER TABLE EMP_ALTERRENAME COLUMN HP TO TEL;

ALTER TABLE EMP_ALTER
MODIFY EMPNO NUMBER(5);

DESC EMP_DDL;

CREATE TABLE EMP_ALTER
    AS SELECT * FROM EMP;

RENAME EMP_ALTER TO EMP_RENAME;

SELECT *
    FROM EMP_RENAME;

TRUNCATE TABLE EMP_RENAME;

DROP TABLE EMP_RENAME;

DESC EMP_RENAME

create table emp_hw as select * from emp where 1 <> 1;
alter table emp_hw add bigo varchar2(20);
alter table emp_hw modify bigo varchar2(30);
alter table emp_hw rename COLUMN bigo to remark;
insert into emp_hw select empno, ename, job, mgr, hiredate, sal, comm, deptno,null from emp;
select* from emp_hw;
drop table emp_hw;


SELECT * FROM DICT;

SELECT * FROM DICTIONARY;
SELECT TABLE_NAME
    FROM USER_TABLES;

SELECT OWNER, TABLE_NAME
    FROM ALL_TABLES;

-- USER_ 접두어를 가진 데이터 사진 -> 접속한 사용자가 소유한 객체 정보
-- ALL_ 접두어를 가진 데이터 사전 -> 접속한 사용자가 소유하거나, 사용을 허가받은 객체 정보
-- DBA_ 접두어를 가진 데이터 사전 -> 데이터베이스 관리 권환을 가진 사용자가 조회가능

DROP INDEX IDX_EMP_SAL;

SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP
WHERE DEPTNO = 20;

SELECT * FROM(SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMPWHERE DEPTNO = 20)

SELECT ROWNUM, E.*
FROM (SELECT *
FROM EMP EMPORDER BY SAL DESC) E;

WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)

SELECT ROWNUM, E.*
FROM EM;

SELECT ROWNUM, E.*
FROM (SELECT *
FROM EMP EMORDER BY SAL DESC) E
WHERE ROWNUM <= 3;

WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E.*
FROM E
WHERE ROWNUM <= 3;

CREATE SEQUENCE SEQ_DEPT_SEQUENCE
INCREMENT BY 10
START WITH 10
MAXVALUE 90
MINVALUE 0
NOCYCLE
CACHE 2;

CREATE TABLE DEPT_SEQUENCE (
    DEPTNO NUMBER PRIMARY KEY,
    DNAME VARCHAR2(50),
    LOC VARCHAR2(50)
);

INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;


ALTER SEQUENCE SEQ_DEPT_SEQUENCE
INCREMENT BY 3
MAXVALUE 99
CYCLE;

INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME LIKE 'TABLE_PK%';


CREATE TABLE 고객테이블 (
    고객아이디 VARCHAR2(20) PRIMARY KEY,
    고객이름   VARCHAR2(50) NOT NULL,
    나이       NUMBER(2),
    등급       VARCHAR2(10) CHECK (등급 IN ('silver', 'gold', 'vip')),
    직업       VARCHAR2(30) NOT NULL,
    적립금     NUMBER DEFAULT 0
);

CREATE TABLE 제품테이블 (
    제품번호   VARCHAR2(10) PRIMARY KEY,
    제품명     VARCHAR2(50) NOT NULL,
    재고량     NUMBER NOT NULL,
    단가       NUMBER NOT NULL,
    제조업체   VARCHAR2(50) NOT NULL
);

CREATE TABLE 주문테이블 (
    주문번호   VARCHAR2(10) PRIMARY KEY,
    주문고객   VARCHAR2(20) NOT NULL,
    주문제품   VARCHAR2(10) NOT NULL,
    수량       NUMBER NOT NULL CHECK (수량 > 0),
    배송지     VARCHAR2(100) NOT NULL,
    주문일자   DATE NOT NULL,
    CONSTRAINTFK_주문고객 FOREIGN KEY (주문고객) REFERENCES 고객테이블(고객아이디),
    CONSTRAINT FK_주문제품 FOREIGN KEY (주문제품) REFERENCES 제품테이블(제품번호)
);

-- [고객 테이블] 입력 값
INSERT ALL
INTO 고객테이블 (고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
    VALUES ('apple', '정소화', 20, 'gold', '학생', 1000)
INTO 고객테이블 (고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
    VALUES ('banana', '김선우', 25, 'vip', '간호사', 2500)
INTO 고객테이블 (고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
    VALUES ('carrot', '고명석', 28, 'gold', '교사', 4500)
INTO 고객테이블 (고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
    VALUES ('orange', '김용욱', 22, 'silver', '학생', 0)
INTO 고객테이블 (고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
    VALUES ('melon', '성원용', 35, 'gold', '회사원', 5000)
INTO 고객테이블 (고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
    VALUES ('peach', '오형준', NULL, 'silver', '의사', 300)
INTO 고객테이블 (고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
    VALUES ('pear', '채광주', 31, 'silver', '회사원', 500)
 SELECT * FROM dual;

-- [제품 테이블] 입력 값
INSERT ALL
INTO 제품테이블 (제품번호, 제품명, 재고량, 단가, 제조업체)
    VALUES ('p01', '그냥만두', 5000, 4500, '대한식품')
INTO 제품테이블 (제품번호, 제품명, 재고량, 단가, 제조업체)
    VALUES ('p02', '매운쫄면', 2500, 5500, '민국푸드')
INTO 제품테이블 (제품번호, 제품명, 재고량, 단가, 제조업체)
    VALUES ('p03', '쿵떡파이', 3600, 2600, '한빛제과')
INTO 제품테이블 (제품번호, 제품명, 재고량, 단가, 제조업체)
    VALUES ('p04', '맛난초콜릿', 1250, 2500, '한빛제과')
INTO 제품테이블 (제품번호, 제품명, 재고량, 단가, 제조업체)
    VALUES ('p05', '얼큰라면', 2200, 1200, '대한식품')
INTO 제품테이블 (제품번호, 제품명, 재고량, 단가, 제조업체)
    VALUES ('p06', '통통우동', 1000, 1550, '민국푸드')
INTO 제품테이블 (제품번호, 제품명, 재고량, 단가, 제조업체)
    VALUES ('p07', '달콤비스킷', 1650, 1500, '한빛제과')
SELECT * FROM dual;

-- [주문 테이블] 입력 값
INSERT ALL
INTO 주문테이블 (주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    VALUES ('o01', 'apple', 'p03', 10, '서울시 마포구', TO_DATE('2022-01-01', 
'YYYY-MM-DD'))
INTO 주문테이블 (주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    VALUES ('o02', 'melon', 'p01', 5, '인천시 계양구', TO_DATE('2022-01-10', 
'YYYY-MM-DD'))
INTO 주문테이블 (주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    VALUES ('o03', 'banana', 'p06', 45, '경기도 부천시', TO_DATE('2022-01-11', 
'YYYY-MM-DD'))
INTO 주문테이블 (주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    VALUES ('o04', 'carrot', 'p02', 8, '부산시 금정구', TO_DATE('2022-02-01', 
'YYYY-MM-DD'))
INTO 주문테이블 (주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    VALUES ('o05', 'melon', 'p06', 36, '경기도 용인시', TO_DATE('2022-02-20', 
'YYYY-MM-DD'))
INTO 주문테이블 (주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    VALUES ('o06', 'banana', 'p01', 19, '충청북도 보은군', TO_DATE('2022-03-02', 
'YYYY-MM-DD'))
INTO 주문테이블 (주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    VALUES ('o07', 'apple', 'p03', 22, '서울시 영등포구', TO_DATE('2022-03-15', 
'YYYY-MM-DD'))
INTO 주문테이블 (주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    VALUES ('o08', 'pear', 'p02', 50, '강원도 춘천시', TO_DATE('2022-04-10', 
'YYYY-MM-DD'))
INTO 주문테이블 (주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    VALUES ('o09', 'banana', 'p04', 15, '전라남도 목포시', TO_DATE('2022-04-11', 
'YYYY-MM-DD'))
INTO 주문테이블 (주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    VALUES ('o10', 'carrot', 'p03', 20, '경기도 안양시', TO_DATE('2022-05-22', 
'YYYY-MM-DD'))
 SELECT * FROM dual;