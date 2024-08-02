CREATE TABLE CUSTOMER (
    CUST_ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    BIRTHDATE DATE,
    ADDRESS VARCHAR2(200)
);

INSERT INTO CUSTOMER (CUST_ID, NAME, BIRTHDATE, ADDRESS) VALUES (1, '아이유', TO_DATE('1993-05-16', 'YYYY-MM-DD'), '서울특별시 강남구');
INSERT INTO CUSTOMER (CUST_ID, NAME, BIRTHDATE, ADDRESS) VALUES (2, '박보검', TO_DATE('1993-06-16', 'YYYY-MM-DD'), '부산광역시 해운대구');
INSERT INTO CUSTOMER (CUST_ID, NAME, BIRTHDATE, ADDRESS) VALUES (3, '수지', TO_DATE('1994-10-10', 'YYYY-MM-DD'), '대구광역시 수성구');
INSERT INTO CUSTOMER (CUST_ID, NAME, BIRTHDATE, ADDRESS) VALUES (4, '이민호', TO_DATE('1987-06-22', 'YYYY-MM-DD'), '인천광역시 연수구');
INSERT INTO CUSTOMER (CUST_ID, NAME, BIRTHDATE, ADDRESS) VALUES (5, '김수현', TO_DATE('1988-02-16', 'YYYY-MM-DD'), '경기도 성남시 분당구');
INSERT INTO CUSTOMER (CUST_ID, NAME, BIRTHDATE, ADDRESS) VALUES (6, '한지민', TO_DATE('1982-11-05', 'YYYY-MM-DD'), '서울특별시 서초구');
INSERT INTO CUSTOMER (CUST_ID, NAME, BIRTHDATE, ADDRESS) VALUES (7, '공유', TO_DATE('1979-07-10', 'YYYY-MM-DD'), '부산광역시 수영구');
INSERT INTO CUSTOMER (CUST_ID, NAME, BIRTHDATE, ADDRESS) VALUES (8, '손예진', TO_DATE('1982-01-11', 'YYYY-MM-DD'), '서울특별시 강서구');
INSERT INTO CUSTOMER (CUST_ID, NAME, BIRTHDATE, ADDRESS) VALUES (9, '정우성', TO_DATE('1973-03-20', 'YYYY-MM-DD'), '서울특별시 용산구');
INSERT INTO CUSTOMER (CUST_ID, NAME, BIRTHDATE, ADDRESS) VALUES (10, '김태리', TO_DATE('1990-04-24', 'YYYY-MM-DD'), '경기도 고양시 일산동구');

COMMIT;


-- 모든 사람의 정보 조회
SELECT *
FROM CUSTOMER;

-- 나이가 30대인 사람들의 정보 조회
SELECT *
FROM CUSTOMER
WHERE EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM BIRTHDATE)+1 BETWEEN 30 AND 39;

-- 광역시에 거주 중인 사람들의 정보 조회
SELECT *
FROM CUSTOMER
WHERE address LIKE ('%광역시%');

SELECT *
FROM CUSTOMER
WHERE SUBSTR(ADDRESS, 3, 3)='광역시';

-- 이름이 2자인 사람들의 정보 조회
SELECT *
FROM CUSTOMER
WHERE LENGTH(NAME)=2;

-- 이름, 생년월일, 나이 정보 조회
SELECT NAME 이름, BIRTHDATE 생년월일, EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM BIRTHDATE)+1 나이
FROM CUSTOMER;