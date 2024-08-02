-- * QUIZ1 * --------
/*
	CREATE USER C##TEST IDENTIFIED BY 1234; 실행
	User C##TEST이(가) 생성되었습니다.
	계정 생성만 하고 접속 시 에러 (user C##TEST lacks CREATE SESSION privillege; logon denied 에러)
*/

-- 원인 ?
-- TEST 계정에 RESOURCE 권한과 CONNECT 권한을 GRANT해주지 않았다.
-- 해결방안 ?
GRANT RESOURCE, CONNECT TO C##TEST; --실행

-- * QUIZ2 * --------
CREATE TABLE TB_JOB (
	JOBCODE NUMBER PRIMARY KEY,
	JOBNAME VARCHAR2(10) NOT NULL
);

CREATE TABLE TB_EMP (
	EMPNO NUMBER PRIMARY KEY,
	EMPNAME VARCHAR2(10) NOT NULL,
	JOBNO NUMBER REFERENCES TB_JOB(JOBCODE)
);
/*
	위의 두 테이블을 조인하여 EMPNO, EMPNAME, JOBNO, JOBNAME 컬럼을 조회하고자 한다.
	이때 실행한 SQL문이 아래와 같다고 했을 때,
*/
SELECT EMPNO, EMPNAME, JOBNO, JOBNAME
FROM TB_EMP
	JOIN TB_JOB USING(JOBNO);
-- 다음과 같은 오류가 발생했다.
-- ORA-00904: "TB_JOB"."JOBNO": invalid identifier

-- 원인 ?
-- TB_JOB을 조인할 때 칼럼명이 동일하지 않음에도 불구하고 JOBNO라는 칼럼으로만 USING하여 JOIN하였다. (TB_JOB에는 JOBCODE만 있음)
-- 해결방안 ?
-- ON (JOBNO = JOBCODE); 로 변경