/*
            D   :   DATE,   L :   LANGUAGE

            DQL (QUERY, ��������ȸ) :   SELECT(��ȸ)
            DML (MANIPULATION, ������ ����)  :   INSERT(�߰�/����), UPDATE(����), DELETE(����)
            DDL (DEFINITION, ������ ����) :   CREATE(����), ALTER(����), DROP(����)
            DCL (CONTROL, ������ ����)   :   GRANT, REVOKE
            TCL (TRANSACTION, Ʈ����� ����)  :   COMMIT, ROLLBACK
*/
---------------------------------------------------------------------------
/*
            DML (������ ���� ���)
            :   ���̺� ������ (��)�� �߰��ϰų� (INSERT), 
                                                                �����ϰų� (UPDATE),
                                                                    �����ϱ� ���� (DELETE) ����ϴ� ���
*/
/*
            ������ �߰�  :   INSERT
            =>  ���̺� ���ο� ���� �߰��ϴ� ��
            
            ��� 1) INSERT INTO ���̺�� VALUES (��, ��, ��, ...)
            -> ���̺��� ��� �÷��� ���� ���� �����Ͽ� ����
                    �÷� ������ �°� �����ؾ� ��    (�ش� �÷��� ������ Ÿ�Կ� �°�!)
*/
SELECT * FROM EMPLOYEE;

INSERT INTO EMPLOYEE
        VALUES  (300, '��ο�', '930806-1000000', 'minwook@or.kr', '01012345678', 
                            'D4', 'J4', 3000000, 0.3, NULL, SYSDATE, NULL, 'N');
                            
/*
            ��� 2) INSERT INTO ���̺��(�÷���, �÷���, �÷���) VALUES (��, ��, ��)
            -> �÷��� ����  �����Ͽ� �ش� �÷��� ���� ������ �߰�
                    ���õ��� ���� �÷��� ���� ���� �⺻������ NULL���� ����ǰ�,
                            �⺻���� ���� �ɼ�(DEFAULT)�� �ִ� ��� �ش� �⺻������ �����.
                    =>  NOT NULL ���������� �ִ� �÷��� ��� ���� �÷��� �����Ͽ� ���� �߰��ϰų�,
                            DEFAULT �ɼ��� �����ؾ� ��! (�׷��� ������ ���� �߻�!)
*/
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, EMP_NO, EMAIL, JOB_CODE)
        VALUES(301, '������', '000501-3000000', 'junhyeok2@or.kr', 'J7');
-----------------------------------------------------------------------
/*
            INSERT INTO ���̺��(��������); => ���������� ������ �����͸� �߰��ϰڴ�
            => VALUES �κ� ��� ���������� ��ȸ�� ������� ��ä�� INSERT �ϴ� ���
*/
-- ���, �����, �μ����� ������ ���̺�
CREATE TABLE EMP01 (
    EMP_ID NUMBER,
    EMP_NAME VARCHAR2(20),
    DEPT_TITLE VARCHAR2(20)
);

SELECT * FROM EMP01;

-- ���, �����, �μ��� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
        JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- ���� ���� ������� EMP01 ���̺� �߰�
INSERT INTO EMP01(SELECT EMP_ID, EMP_NAME, DEPT_TITLE
                                                FROM EMPLOYEE
                                                JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID));
-------------------------------------------------------------------------------------
/*
        INSERT ALL
        : �ΰ� �̻��� ���̺� ���� �����͸� �߰��� �� ���
            �̶� ���Ǵ� ���������� ������ ���
*/
--  ���, �����, �μ��ڵ�, �Ի��� ������ ������ ���̺�
-- DROP TABLE EMP_DEPT;
CREATE TABLE EMP_DEPT
AS ( SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE
            FROM EMPLOYEE
            WHERE 1 = 0);  -- 1 = 0 -> FALSE�̹Ƿ� �ǹ� ����! �����;��� �÷������� �����ϱ� ���� �뵵.

SELECT * FROM EMP_DEPT;

-- ���, �̸�, ������ ������ ������ ���̺�
CREATE TABLE EMP_MANAGER
AS (SELECT EMP_ID, EMP_NAME, MANAGER_ID
        FROM EMPLOYEE
        WHERE 1 = 0 );
        
-- �μ� �ڵ尡 'D1'�� ����� ���, �����, �μ��ڵ�, ������, �Ի��� ���� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, MANAGER_ID, HIRE_DATE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';

INSERT ALL
        INTO EMP_DEPT VALUES (EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE)
        INTO EMP_MANAGER VALUES (EMP_ID, EMP_NAME, MANAGER_ID)
        (SELECT EMP_ID, EMP_NAME, DEPT_CODE, MANAGER_ID, HIRE_DATE
            FROM EMPLOYEE
            WHERE DEPT_CODE = 'D1');
            
/*
        INSERT ALL
                INTO ���̺�� VALUES (�÷���, �÷���, �÷���, ...)
                INTO ���̺��2 VALUES (�÷���, �÷���, ...)
                ��������;
*/

SELECT * FROM EMP_DEPT;
SELECT * FROM EMP_MANAGER;

---------------------------------------------------------------------------
/*
            UPDATE  :   ���̺� ����Ǿ��ִ� ������ �������� ���� �����ϴ� ����
            
            UPDATE ���̺��
                    SET �÷� = ��,
                             �÷� = �� ...
             [WHERE ���ǽ�]    --> WHERE ���� �������� ��� ���̺��� ��� ���� SET���� ������ �����Ͱ� ����
             
             *  ������Ʈ �� ���������� �� Ȯ���ؾ���!
*/
--  DEPT_TABLE ���̺� DEPARTMENT ���̺��� ����
CREATE TABLE DEPT_TABLE
AS (SELECT * FROM DEPARTMENT);

SELECT * FROM DEPT_TABLE;
SELECT * FROM DEPARTMENT;

-- �μ��ڵ�(DEPT_ID)�� 'D1'�� �μ��� �μ����� '�λ���'���� ����
UPDATE DEPT_TABLE
            SET DEPT_TITLE = '�λ���'
WHERE DEPT_ID = 'D1';

-- �μ��ڵ尡 D9�� �μ��� �μ����� '������ȹ��'
UPDATE DEPT_TABLE
            SET DEPT_TITLE = '������ȹ��'
WHERE DEPT_ID = 'D9';

-- ��� (EMPLOYEE) ���̺��� EMP_TABLE ���̺�� ���� (���, �̸�, �μ��ڵ�, �޿�, ���ʽ� ������)
CREATE TABLE EMP_TABLE
AS (SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY, BONUS
         FROM EMPLOYEE);
         
SELECT * FROM EMP_TABLE;

-- ������ ����� �޿��� 100�������� ����
UPDATE EMP_TABLE
            SET SALARY = '1000000'
WHERE EMP_NAME = '������';

SELECT * FROM EMP_TABLE WHERE EMP_NAME = '������';

-- ���ȥ ����� �޿��� 500����, ���ʽ� 0.2�� ����
SELECT * FROM EMP_TABLE WHERE EMP_NAME = '���ȥ';

UPDATE EMP_TABLE
            SET SALARY = 5000000,
                     BONUS = 0.2
WHERE EMP_NAME = '���ȥ';

-- ��ü ����� �޿��� ���� �޿��� 10���� �λ�! (�����޿� * 1.1)
UPDATE EMP_TABLE
            SET SALARY = SALARY*1.1;

SELECT * FROM EMP_TABLE;       
---------------------------------------------------------------------------
/*
            UPDATE������ �������� ����ϱ�
            
            UPDATE ���̺��
                        SET �÷��� = (��������)
            WHERE ���ǽ�
*/
-- ���� ����� �޿��� ���ʽ��� ����� ����� �޿��� ���ʽ����� �����ϰ� ����
UPDATE EMP_TABLE
SET SALARY = (SELECT SALARY FROM EMP_TABLE WHERE  EMP_NAME = '�����'),
            BONUS = (SELECT BONUS FROM EMP_TABLE WHERE EMP_NAME = '�����')
WHERE EMP_NAME = '����';

SELECT * FROM EMP_TABLE WHERE EMP_NAME IN ('����', '�����', '������');

SELECT *
FROM EMP_TABLE
WHERE (SALARY, BONUS )= (SELECT SALARY, BONUS FROM EMP_TABLE WHERE EMP_NAME = '�����');


-- ���߿� �������� ���
UPDATE EMP_TABLE
SET (SALARY, BONUS) = (SELECT SALARY, BONUS FROM EMP_TABLE WHERE EMP_NAME = '�����')
WHERE EMP_NAME = '������';

-- ASIA �������� �ٹ����� ������� ���ʽ� ���� 0.3���� ����
-- ASIA ���� ���� ��ȸ

SELECT * 
FROM LOCATION 
WHERE LOCAL_NAME LIKE 'ASIA%';

-- * ASIA ������ �μ� ���� ��ȸ
SELECT *
FROM DEPARTMENT
JOIN LOCATION ON LOCATION_ID = LOCAL_CODE
WHERE LOCAL_NAME LIKE 'ASIA%';

--* ASIA ������ �μ��� ���� ��� ���� ��ȸ
SELECT EMP_ID
FROM EMP_TABLE
        JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
        JOIN LOCATION ON LOCATION_ID = LOCAL_CODE
WHERE LOCAL_NAME LIKE 'ASIA%';

--* �ش� ������� ���ʽ� ���� 0.3���� ����
UPDATE EMP_TABLE
            SET BONUS = 0.3
WHERE EMP_ID IN (SELECT EMP_ID
                                            FROM EMP_TABLE
                                                    JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
                                                    JOIN LOCATION ON LOCATION_ID = LOCAL_CODE
                                            WHERE LOCAL_NAME LIKE 'ASIA%' );
                                            
SELECT * FROM EMP_TABLE;

COMMIT;
------------------------------------------------------------------------
/*
            DELETE : ���̺� ������ ����� �����͸� ������ �� ����ϴ� ����
            
            DELETE FROM ���̺��
            [WHERE ���ǽ�];            --> WHERE �� ���� �� ��� ������(��)�� ����!
*/
-- EMPLOYEE ���̺��� ��� �����͸� ����!
DELETE FROM EMPLOYEE;

SELECT * FROM EMPLOYEE;

ROLLBACK;

-- ������ ����� �����͸� ����
DELETE FROM EMPLOYEE
WHERE EMP_NAME = '������';

-- ����� 300�� ����� ������ ����
DELETE FROM EMPLOYEE
WHERE EMP_ID = 300;

COMMIT;

-- �μ� ���̺��� D1�� �μ� ���� 
DELETE FROM DEPARTMENT
WHERE DEPT_ID = 'D1';
--> D1 ���� EMPLOYEE ���̺� ��� ���̱� ������ ���� �Ұ� (�ܷ�Ű �����Ǿ� ����!)