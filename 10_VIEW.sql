/*
            *   VIEW    (��)
                :   SELECT���� ���� ����� ������� ������ �� �� �ִ� ��ü
                    =>  ���� ����ϴ� �������� �����صθ� �Ź� �ٽ� �ش� �������� ����� �ʿ䰡 ����!
                    �ӽ����̺�� ���� ���� (���� �����Ͱ� ����Ǵ°� �ƴ϶�, �������θ� ����Ǿ� ����!)
*/
-- �ѱ����� �ٹ��ϴ� ��� ���� ��ȸ (���, �̸�, �μ���, �޿�, �ٹ�������)
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, SALARY, NATIONAL_NAME
FROM EMPLOYEE 
    JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
    JOIN NATIONAL USING (NATIONAL_CODE)
WHERE NATIONAL_NAME = '�ѱ�';

-- ���þƿ��� �ٹ��ϴ� ��� ���� ��ȸ (���, �̸�, �μ���, �޿�, �ٹ�������)
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, SALARY, NATIONAL_NAME
FROM EMPLOYEE 
    JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
    JOIN NATIONAL USING (NATIONAL_CODE)
WHERE NATIONAL_NAME = '���þ�';

--�Ϻ����� �ٹ��ϴ� ��� ���� ��ȸ (���, �̸�, �μ���, �޿�, �ٹ�������)
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, SALARY, NATIONAL_NAME
FROM EMPLOYEE 
    JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
    JOIN NATIONAL USING (NATIONAL_CODE)
WHERE NATIONAL_NAME = '�Ϻ�';
--------------------------------------------------------------------------------------------
/*
            VIEW �����ϱ�
            
            CREATE VIEW ���̸�
            AS ��������
*/
-- (�������)   ��ü�� �̸��� �� ����! 
--                 ���̺�   :   TB_XXX
--                 ��   :   VW_XXX

CREATE VIEW VW_EMPLOYEE
AS SELECT EMP_ID, EMP_NAME, DEPT_TITLE, SALARY, NATIONAL_NAME
        FROM EMPLOYEE 
        JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
        JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
        JOIN NATIONAL USING (NATIONAL_CODE);
        
-- �並 ������ �� �ִ� ������ �ο�
--GRANT CREATE VIEW TO C##KH;

SELECT * FROM VW_EMPLOYEE;
--> �����δ� �Ʒ��� ���� ����� ����
SELECT *
FROM ( SELECT EMP_ID, EMP_NAME, DEPT_TITLE, SALARY, NATIONAL_NAME
                FROM EMPLOYEE 
                    JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
                    JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
                    JOIN NATIONAL USING (NATIONAL_CODE)
);

-- �ѱ����� �ٹ��ϴ� ��� ���� ��ȸ
SELECT * FROM VW_EMPLOYEE
WHERE NATIONAL_NAME = '�ѱ�';

-- ���þƿ��� �ٹ��ϴ� ��� ���� ��ȸ
SELECT * FROM VW_EMPLOYEE
WHERE NATIONAL_NAME ='���þ�';

-- �Ϻ����� �ٹ��ϴ� ��� ���� ��ȸ
SELECT * FROM VW_EMPLOYEE
WHERE NATIONAL_NAME ='�Ϻ�';

-- (����) ���� �������� ������ �� ��� ��ȸ --> TEXT �÷��� ����� �������� ������ ����!
SELECT * FROM USER_VIEWS;

CREATE OR REPLACE VIEW VW_EMPLOYEE
AS SELECT EMP_ID, EMP_NAME, DEPT_TITLE, SALARY, NATIONAL_NAME, BONUS
        FROM EMPLOYEE 
        JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
        JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
        JOIN NATIONAL USING (NATIONAL_CODE);
        

SELECT * FROM VW_EMPLOYEE;
--------------------------------------------------------------------------------
-- * ���, �����, ���޸�, ���� (��|��), �ٹ���� ������ ��ȸ
SELECT EMP_ID ���, EMP_NAME �����, JOB_NAME ���޸�, 
        DECODE(SUBSTR(EMP_NO, 8, 1), 1, '��', 2, '��') ����, 
        EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE) +1 �ٹ����
FROM EMPLOYEE
    JOIN JOB USING (JOB_CODE);
    
-- ������ ��ȸ�� ������ �信 ���� (VW_EMP_JOB)
-- �Լ��� �Ǵ� ������� �ִ� ��� ��Ī�� �ο����� VIEW�� �� ������ �� ����
CREATE OR REPLACE VIEW VW_EMP_JOB
AS       SELECT EMP_ID ���, EMP_NAME �����, JOB_NAME ���޸�, 
                    DECODE(SUBSTR(EMP_NO, 8, 1), 1, '��', 2, '��') ����, 
                    EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE) +1 �ٹ����
            FROM EMPLOYEE
                JOIN JOB USING (JOB_CODE);
    
SELECT * FROM VW_EMP_JOB;

-- * ��� �÷����� ������� ��� ���� �����Ͽ� �ۼ� ����!
CREATE OR REPLACE VIEW VW_EMP_JOB (���, �̸�, ���޸�, ����, �ٹ����)
AS       SELECT EMP_ID ���, EMP_NAME �����, JOB_NAME ���޸�, 
                    DECODE(SUBSTR(EMP_NO, 8, 1), 1, '��', 2, '��') ����, 
                    EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE) +1 �ٹ����
            FROM EMPLOYEE
                JOIN JOB USING (JOB_CODE);


-- ���� ����� ��ȸ
SELECT * FROM VW_EMP_JOB WHERE ���� = '��';

-- 20�� �̻� �ٹ��� ����� ��ȸ
SELECT * FROM VW_EMP_JOB WHERE �ٹ���� >= 20;

DROP VIEW VW_EMP_JOB;

-------------------------------------------------------------------------------------
/*
            ������ �並 ���ؼ� DML (INSERT/UPDATE/DELETE) �� ����غ���
            
            --> �並 ���ؼ� DML�� �ۼ��ϰ� �Ǹ�, ���� �����Ͱ� ����Ǿ� �ִ� ���̺� �ݿ���!
*/
CREATE OR REPLACE VIEW VW_JOB
AS SELECT JOB_CODE, JOB_NAME
        FROM JOB;
        
SELECT * FROM VW_JOB;   -- ������ ���̺�
SELECT * FROM JOB;

-- VW_JOB �並 ����Ͽ� �����͸� �߰�(DML-INSERT)
INSERT INTO VW_JOB VALUES ('J8', '����');

-- VW_JOB �並 ����Ͽ� �����͸� ����   (DML-UPDATE)
UPDATE VW_JOB
            SET JOB_NAME = '�˹�'
            WHERE JOB_CODE = 'J8';

-- VW_JOB �並 ����Ͽ� ������ ���� (DM-DELETE)
DELETE FROM VW_JOB
    WHERE JOB_CODE = 'J8';
    
-----------------------------------
/*
            * DML ��ɾ�� ������ �Ұ����� ��찡 ����;
            
            1)  �信 ���ǵ��� ���� �÷��� �����Ϸ��� �ϴ� ���
            2)  �信 ���ǵǾ� ���� �ʰ� ���̽����̺��� NOT NULL ���������� �����Ǿ��ִ� ���
            3)  �������� �Ǵ� �Լ������� ���ǰ� �Ǿ� �ִ� ���
            4)  DISTINCT ������ ���ԵǾ� �ִ� ���
            5)  JOIN�� �̿��Ͽ� ���� ���̺��� ���� ��Ų ���
            
            => ��� ��κ� ��ȸ�� �뵵�� ����Ѵ�. �׷��� ������ �ǵ����̸� DML�� ������� ����...!
*/
-----------------------------------
/*
            *   VIEW �ɼ� *
            
            CREATE [OR REPLACE] [FORCE| (NOFORCE) ] VIEW
            AS ��������
            [WITH CHECK OPTION]
            [WITH READ NOLY];
            
            -   OR REPLACE    :   ������ ������ �̸��� �䰡 ���� ��� �����ϰ�, �������� ���� ��� ���� ����
            -   FORCE   |   NOFORCE
                        + FORCE :   ���������� �ۼ��� ���̺��� �������� �ʾƵ� �並 ����
                        + NOFORCE   :   ���������� �ۼ��� ���̺��� �����ؾ����� �並 ���� (�⺻��)
            -   WITH CHECK OPTION :   DML(�߰�/����/����)   ��� �� ���������� �ۼ��� ���ǿ� �´� �����θ� ����ǵ��� �ϴ� �ɼ�
            -   WITH READ ONLY  :   �並 ��ȸ�� �����ϵ��� �ϴ� �ɼ�
*/

-- * FORCE  |   NOFORCE
CREATE OR REPLACE NOFORCE VIEW VW_TEMP
AS SELECT TCODE, TNAME, TCONTENT
        FROM TT;    --> ���� TT ��� ���̺��� �����Ƿ� �䵵 ���� �Ұ� (NOFORCE)
        
CREATE OR REPLACE FORCE VIEW VW_TEMP
AS SELECT TCODE, TNAME, TCONTENT
        FROM TT;  --> ������ �Բ� �䰡 ������! (FORCE)
        
SELECT * FROM VW_TEMP;

CREATE TABLE TT (
        TCODE NUMBER,
        TNAME VARCHAR2 (20),
        TCONTENT VARCHAR2(100)
);

SELECT * FROM VW_TEMP;

-- * WITH CHECK OPTION
--> WITH CHECK OPTION ���� 300���� �̻��� ����� ������ �� ����
CREATE OR REPLACE VIEW VW_EMP
AS SELECT *
        FROM EMPLOYEE
        WHERE SALARY >= 3000000;
        
SELECT * FROM VW_EMP;

-- 204 ����� �޿��� 200�������� ����   (�� ���� �� ���ǿ�  ���� �ʴ� ��� )
UPDATE VW_EMP
            SET SALARY  =   2000000
            WHERE EMP_ID = 204;
            
ROLLBACK;       -- ������� ���!

--> WITH CHECK OPTION �� �߰��Ͽ� �� ����
CREATE OR REPLACE VIEW VW_EMP
AS SELECT *
        FROM EMPLOYEE
        WHERE SALARY >= 3000000
WITH CHECK OPTION;

SELECT * FROM VW_EMP;

UPDATE VW_EMP
            SET SALARY  =   2000000
            WHERE EMP_ID = 204;     --> ���������� �ۼ��� ���ǿ� ���յ��� �ʱ� ������ ���� �Ұ� (=> ���� �߻�!)

UPDATE VW_EMP
            SET SALARY  =   4000000
            WHERE EMP_ID = 204;     --> ���������� �ۼ��� ���ǿ� ���մ� ���� ���� ����
------------------------------------------------------------------------------
-- WITH READ ONLY
CREATE OR REPLACE VIEW VW_EMP
AS SELECT *
        FROM EMPLOYEE
        WHERE SALARY >= 3000000
WITH READ ONLY;

SELECT * FROM VW_EMP;

DELETE FROM VW_EMP WHERE EMP_ID = 200;      --> READ ONLY �ɼǿ� ���Ͽ� DML ��� �Ұ�!