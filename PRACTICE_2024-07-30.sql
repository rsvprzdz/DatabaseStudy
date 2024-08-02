-- * QUIZ1 * --------
/*
	CREATE USER C##TEST IDENTIFIED BY 1234; ����
	User C##TEST��(��) �����Ǿ����ϴ�.
	���� ������ �ϰ� ���� �� ���� (user C##TEST lacks CREATE SESSION privillege; logon denied ����)
*/

-- ���� ?
-- TEST ������ RESOURCE ���Ѱ� CONNECT ������ GRANT������ �ʾҴ�.
-- �ذ��� ?
GRANT RESOURCE, CONNECT TO C##TEST; --����

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
	���� �� ���̺��� �����Ͽ� EMPNO, EMPNAME, JOBNO, JOBNAME �÷��� ��ȸ�ϰ��� �Ѵ�.
	�̶� ������ SQL���� �Ʒ��� ���ٰ� ���� ��,
*/
SELECT EMPNO, EMPNAME, JOBNO, JOBNAME
FROM TB_EMP
	JOIN TB_JOB USING(JOBNO);
-- ������ ���� ������ �߻��ߴ�.
-- ORA-00904: "TB_JOB"."JOBNO": invalid identifier

-- ���� ?
-- TB_JOB�� ������ �� Į������ �������� �������� �ұ��ϰ� JOBNO��� Į�����θ� USING�Ͽ� JOIN�Ͽ���. (TB_JOB���� JOBCODE�� ����)
-- �ذ��� ?
-- ON (JOBNO = JOBCODE); �� ����