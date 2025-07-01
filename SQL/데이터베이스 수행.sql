-- 1번
CREATE TABLE 고객테이블 (
    고객아이디 VARCHAR2(100) PRIMARY KEY,
    고객이름   VARCHAR2(100) NOT NULL,
    나이       NUMBER(2),
    등급       VARCHAR2(100) CHECK (등급 IN ('silver', 'gold', 'vip')),
    직업       VARCHAR2(100) NOT NULL,
    적립금     NUMBER DEFAULT 0
);

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

 -- 2번
CREATE TABLE 제품테이블 (
    제품번호   VARCHAR2(100) PRIMARY KEY,
    제품명     VARCHAR2(100) NOT NULL,
    재고량     NUMBER NOT NULL,
    단가       NUMBER NOT NULL,
    제조업체   VARCHAR2(100) NOT NULL
)

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

 -- 3번
CREATE TABLE 주문테이블 (
    주문번호   VARCHAR2(100) PRIMARY KEY,
    주문고객   VARCHAR2(100) NOT NULL,
    주문제품   VARCHAR2(100) NOT NULL,
    수량       NUMBER NOT NULL CHECK (수량 > 0),
    배송지     VARCHAR2(100) NOT NULL,
    주문일자   DATE NOT NULL,
    CONSTRAINT FK FOREIGN KEY (주문고객) REFERENCES 고객테이블(고객아이디),
    CONSTRAINT PK FOREIGN KEY (주문제품) REFERENCES 제품테이블(제품번호)
)

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


-- 고객테이블
-- 1
-- 이 내용이 들어가면
INSERT INTO 고객테이블 (고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
VALUES ('apple', '정소화', 20, 'gold', '학생', 1000)
-- 이렇게 오류남
ERROR at line 1:
ORA-00001: unique constraint (SCOTT.SYS_C007441) violated
-- 설명 고객아이디는 apple


-- 2
-- 이 내용 들어가면
INSERT INTO 고객테이블 (고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
VALUES ('apple', '김민수', 21, 'vip', '학생', 500)
-- 이렇게 오류남
ERROR at line 1:
ORA-00001: unique constraint (SCOTT.SYS_C007441) violated
-- 설명 고객아이디는 


-- 3
-- 이 내용 들어가면
INSERT INTO 고객테이블 (고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
VALUES ('banana2', '김민우', 24, 'diamond', '교사', 800)
-- 이렇게 오류남
ERROR at line 1:
ORA-02290: check constraint (SCOTT.SYS_C007440) violated
-- 설명 등급에는 diamond

-- 4
-- 이 내용 들어가면
INSERT INTO 고객테이블 (고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
VALUES ('banana3', NULL, 26, 'silver', '의사', 900)
-- 이렇게 오류남
ERROR at line 2:
ORA-01400: cannot insert NULL into ("SCOTT"."고객테이블"."고객이름")
-- 설명 고객이름에는 null이

-- 제품테이블
-- 1
-- 이 내용 들어가면
INSERT INTO 제품테이블 (제품번호, 제품명, 재고량, 단가, 제조업체)
VALUES ('p09', '기묘한과자', 1000, -500, '한빛제과')
-- 이렇게 오류남
ERROR at line 1:
ORA-00001: unique constraint (SCOTT.SYS_C007446) violated
-- 설명: 논리적 오류 저거 단가에는 -가 들어가면 안돼

-- 주문테이블
-- 1
-- 이 내용 들어가면
INSERT INTO 주문테이블 (주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
VALUES ('o11', 'ghost', 'p02', 10, '서울시 강서구', TO_DATE('2022-06-01', 'YYYY-MM-DD'))
-- 이렇게 오류남
ERROR at line 1:
ORA-02291: integrity constraint (SCOTT.FK) violated - parent key not found
-- 설명: 주문고객이 ghost



-- 검색 실습문제
select 고객아이디, 고객이름, 적립금 from 고객테이블 where 적립금 >= (select avg(적립금) from 고객테이블);
select 직업, count(직업) as 인원수 from 고객테이블 group by 직업 having count() >= 2;

select 제조업체, count() as 제품수, sum(재고량) as 총재고 from 제품테이블 group by 제조업체;
select * from 제품테이블 where 단가 >= (select max(단가) from 제품테이블);

select c.고객아이디, p.제품명, o.수량 from 주문테이블 o inner join 고객테이블 c on c.고객아이디 = o.주문고객 inner join 제품테이블 p on p.제품번호 = o.주문제품;
select c.고객아이디, sum(o.수량) as 총주문수량 from 주문테이블 o inner join 고객테이블 c on c.고객아이디 = o.주문고객 group by c.고객아이디;
select * from 고객테이블 where 고객아이디 in (select 주문고객 from 주문테이블 group by 주문고객 having count(주문제품) >= 2);