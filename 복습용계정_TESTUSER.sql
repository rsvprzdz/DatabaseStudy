-- 다음 사용자 계정 접속 후 아래 내용을 작성해주세요.
-- ID/PW  :  C##TESTUSER / 1234

-- 아래 내용을 추가하기 위한 테이블을 생성해주세요.
-- 각 컬럼별 설명을 추가해주세요.
--=========================================================
/*
	- 학생 정보 테이블 : STUDENT
	- 제약 조건
	  - 학생 이름, 생년월일은 NULL값을 허용하지 않는다.
	  - 이메일은 중복을 허용하지 않는다.
	- 저장 데이터
		+ 학생 번호 ex) 1, 2, 3, ...
		+ 학생 이름 ex) '김말똥', '아무개', ...
		+ 이메일    ex) 'kim12@kh.or.kr', 'dogdog@kh.or.kr', ...
		+ 생년월일  ex) '24/07/25', '00/02/20', '88/12/25', ...
*/

------------------------------------------------------------
/*
	- 도서 정보 테이블 : BOOK
	- 제약 조건
	  - 제목과 저자명은 NULL값을 허용하지 않는다.
	  - ISBN 번호는 중복을 허용하지 않는다.
	- 저장 데이터
	  + 도서 번호 ex) 1, 2, 3, ...
	  + 제목 ex) '삼국지', '어린왕자', '코스모스', ...
	  + 저자 ex) '지연', '생텍쥐페리', '칼 세이건', ...
	  + 출판일 ex) '14/02/14', '22/09/19', ...
	  + ISBN번호 ex) '9780394502946', '9780152048044', ...
*/


CREATE TABLE BOOK(

BK_NO NUMBER,
BK_TITLE VARCHAR2(200) NOT NULL,
BK_AUTHER VARCHAR2(200) NOT NULL,
PUB_DATE DATE,
ISBN VARCHAR2(200) UNIQUE

);

COMMENT ON COLUMN BOOK.BK_NO IS '도서번호';
COMMENT ON COLUMN BOOK.BK_TITLE IS '도서제목';
COMMENT ON COLUMN BOOK.BK_AUTHER IS '저자명';
COMMENT ON COLUMN BOOK.PUB_DATE IS '출판일';
COMMENT ON COLUMN BOOK.ISBN IS '일렬번호(ISBN)';
------------------------------------------------------------