CREATE TABLE 고객테이블(
 고객아이디 VARCHAR2(100) PRIMARY KEY,
 고객이름 VARCHAR2(100) NOT NULL,
 나이 NUMBER(2) NOT NULL,
 등급 VARCHAR2(100) CHECK ( 등급 IN ( 'silver', 'gold', 'vip')),
 직업 VARCHAR2(100) NOT NULL,
 적립금 NUMBER DEFAULT 0
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
 
 COMMIT;
 
 CREATE TABLE 제품테이블(
 제품번호 VARCHAR2(100) PRIMARY KEY,
 제품명 VARCHAR2(100) NOT NULL,
 재고량 NUMBER NOT NULL,
 단가 NUMBER NOT NULL,
 제조업체 VARCHAR2(100) NOT NULL
 );
 
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
 
 COMMIT;
 
 CREATE TABLE 주문테이블(
 주문번호 VARCHAR2(100) PRIMARY KEY,
 주문고객 VARCHAR2(100) NOT NULL,
 주문제품 VARCHAR2(100) NOT NULL,
 수량 NUMBER NOT NULL,
 배송지 VARCHAR2(100) NOT NULL,
 주문일자 DATE NOT NULL,
CONSTRAINT FK FOREIGN KEY (주문고객) REFERENCES 고객테이블(고객아이디),
CONSTRAINT PK FOREIGN KEY (주문제품) REFERENCES 제품테이블(제품번호)
 );
 
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
 
 COMMIT;
 
 -- 고객테이블 1번
 --고객테이블에서 '적립금'이 평균 이상인 고객들의 아이디, 이름, 적립금을 조회
-- 하시오. (서브쿼리, 비교연산 활용
SELECT 고객아이디, 고객이름, 적립금 
FROM 고객테이블 
WHERE 적립금 >= (SELECT AVG(적립금) FROM 고객테이블);

-- 고객테이블 2번
-- 고객테이블에서 같은 직업을 가진 고객이 2명 이상인 직업과 해당 인원수를 
-- 조회하시오.  (GROUP BY, HAVING 절 활용.  별칭: 인원수)
SELECT 직업, COUNT(*) AS 인원수 
FROM 고객테이블 
GROUP BY 직업 HAVING COUNT(*) >= 2;
-- 제품테이블
-- [문제1] 제품테이블에서 제조업체별로 몇 개의 제품이 있는지(제품수)와 전체 재고량(총재고)
-- 을 계산하여 보여주시오. (GROUP BY 활용.  별칭: 제품수, 총재고)
SELECT COUNT(*), SUM(재고량) AS 총재고
FROM 제품테이블
GROUP BY 제조업체;

-- [문제2] 제품테이블에서 단가가 가장 높은 제품(들)을 조회하시오.  
-- (서브쿼리, 비교연산 활용
SELECT * FROM 제품테이블 WHERE 단가 >= (SELECT MAX(단가) FROM 제품테이블);
--  주문테이블
-- [문제1] 주문테이블, 고객테이블, 제품테이블을 조인하여 고객이 어떤 제품을 몇 개 주문
-- 했는지 조회하시오. (INNER JOIN 활용. 주문테이블:O, 고객테이블:C, 제품테이블:P
SELECT C.고객아이디, P.제품명, O.수량 
FROM 주문테이블 O
INNER JOIN 고객테이블 C ON C.고객아이디 = O.주문고객
INNER JOIN 제품테이블 P ON P.제품번호 = O.주문제품;
--  [문제2] 고객아이디별로 주문한 제품 수량의 총합을 계산하시오.  
-- (INNER JOIN, GROUP BY 활용. 주문테이블:O, 고객테이블:C,  별칭: 총주문수량)
SELECT C.고객아이디, SUM(O.수량) AS 총주문수량
FROM 주문테이블 O INNER JOIN 고객테이블 C ON C.고객아이디 = O.주문고객 GROUP BY C.고객아이디;
-- [문제3] 두 번 이상 주문한 고객들을 검색하고 해당 고객에 관한 모든 값을 출력하시오.
-- (서브쿼리, GROUP BY, HAVING 절 활용.)
SELECT * FROM 고객테이블 
WHERE 고객아이디 IN (SELECT 주문고객 FROM 주문테이블 GROUP BY 주문고객 HAVING COUNT(주문제품) >= 2);