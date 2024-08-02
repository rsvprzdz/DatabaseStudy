/*
    ������ ��ȸ(����) : SELECT
    
        SELECT ��ȸ�ϰ��� �ϴ� ���� FROM ���̺��;
        SELECT * �Ǵ� �÷���1, 2, .... FROM ���̺��; 
      
*/

-- ��� ����� ������ ��ȸ
SELECT * FROM EMPLOYEE;

-- ��� ����� �̸�, �ֹε�Ϲ�ȣ, �ڵ�����ȣ�� ��ȸ
SELECT EMP_NAME, EMP_NO, PHONE
FROM EMPLOYEE;

-- JOB ���̺��� �����̸��� ��ȸ
SELECT JOB_NAME FROM JOB;

-- DEPARTMENT ���̺��� ��� ������ ��ȸ
SELECT * FROM DEPARTMENT;

-- ���� ���̺��� �����, �̸���, ����ó, �Ի���, �޿� ��ȸ
SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE, SALARY FROM EMPLOYEE;

/*
        �÷����� ��� �����ϱ�
        => SELECT���� �÷��� �ۼ��κп� ��������� �� �� ����!
*/
-- ����̸�, ��������(SALARY * 12) ��ȸ
-- SALARY*12 : SALARY �÷� �����Ϳ� 12�� ���Ͽ� ��ȸ
SELECT EMP_NAME, SALARY * 12
FROM EMPLOYEE;

-- ����̸�, �޿�, ���ʽ�, ����, ���ʽ� ���� ����(�޿� + (�޿�*���ʽ�)) * 12
SELECT EMP_NAME, SALARY, BONUS, SALARY*12,(SALARY + (SALARY*BONUS))*12
FROM EMPLOYEE;



/*
    - ���� ��¥�ð� ���� : SYSDATE 
    - ���� ���̺�(�ӽ����̺�) : DUAL 
*/
-- ���� �ð� ���� ��ȸ
SELECT SYSDATE FROM DUAL;           -- YY/MM/DD �������� ��ȸ��!

-- ����̸�, �Ի���, �ٹ��ϼ� (���糯¥ - �Ի���) ��ȸ
-- DATEŸ�� - DATEŸ�� => �Ϸ� ǥ�õ�!
SELECT EMP_NAME, HIRE_DATE, SYSDATE - HIRE_DATE
FROM EMPLOYEE;

/*
        * �÷��� ��Ī ���� : ������� ����� ��� �ǹ��ľ��� ��Ʊ� ������, ��Ī�� �ο��Ͽ� ��Ȯ�ϰ� ����ϰ� ��ȸ����!
        
        [ǥ����]   1)  �÷��� ��Ī
                            2) �÷��� AS ��Ī
                            3) �÷��� "��Ī"
                            4) �÷��� AS "��Ī"
*/
-- ����̸�, �޿�, ���ʽ�, ����, ���ʽ� ���� �������� �� ��Ī �ο��Ͽ� ��ȸ
SELECT EMP_NAME ����̸�, SALARY �޿�, BONUS ���ʽ�, SALARY*12 ����,(SALARY + (SALARY*BONUS))*12 "���ʽ� ���� ����"
FROM EMPLOYEE;

/*
        * ���ͷ� : ���Ƿ� ������ ���ڿ� (' ')
         -> SELECT ���� ����ϴ� ��� ��ȸ�� ���(Result set)�� �ݺ������� ǥ�õ�
*/
-- �̸�, �޿�, '��' ���
SELECT EMP_NAME �̸�, SALARY �޿�, '��' ����
FROM EMPLOYEE;

/*
        ���� ������ : ||
*/

SELECT SALARY || '��' AS �޿�
FROM EMPLOYEE;

-- ���, �̸�, �޿�

SELECT  EMP_ID || EMP_NAME || SALARY
FROM EMPLOYEE;

-- xxx�� �޿��� xxxx���Դϴ�.
SELECT EMP_NAME || '�� �޿��� ' || SALARY || '���Դϴ�.' AS �޿�
FROM EMPLOYEE;

-- ������̺��� �����ڵ� ��ȸ
SELECT JOB_CODE FROM EMPLOYEE;

/*
        * �������� : DISTINCT
*/

-- ������̺��� �����ڵ� ��ȸ (�ߺ�����)
SELECT DISTINCT JOB_CODE FROM EMPLOYEE;

-- ������̺��� �μ��ڵ� ��ȸ (�ߺ�����)
SELECT DISTINCT  DEPT_CODE FROM EMPLOYEE;


-- SELECT DISTINCT DEPT_CODE, DISTINCT JOB_CODE FROM EMPLOYEE;
-- DISTINCT�� �ѹ��� ��� ����

-- DISTINCT (JOB_CODE, DEPT_CODE) �� �� ������ ��� �ߺ��� ��������!
SELECT DISTINCT JOB_CODE, DEPT_CODE
FROM EMPLOYEE;
--============================================================================================================
/*
        * WHERE�� : ��ȸ�ϰ��� �ϴ� �����͸� Ư�� ���ǿ� ���� �����ϰ��� �� �� ���
        
        [ǥ����]
                            SELECT �÷���, �÷� | ������ ���� �����
                            FROM ���̺��
                            WHERE ����; 
                            
        - �񱳿�����
                * ��Һ�  : > , < , >=, <=
                * ����� : 
                        - ������ : =
                        - �ٸ��� : !=, <>, ^=
*/
-- ������̺��� �μ��ڵ尡 'D9'�� ������� ���� ��ȸ
SELECT *                                               -- ��ü �÷��� ��ȸ�� �ǵ�
FROM EMPLOYEE                            -- EMPLOYEE ���̺���
WHERE DEPT_CODE = 'D9';           -- DEPT_CODE�� ���� 'D9'�� ������ ��ȸ


-- ������̺��� �μ��ڵ尡 'D1'�� ������� �����, �޿�, �μ��ڵ� ��ȸ
SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';

-- �μ��ڵ尡 D1�� �ƴ� ������� ���� ��ȸ (�����, �޿�, �μ��ڵ�)
SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE != 'D1';

-- �޿��� 400���� �̻��� ����� �����, �μ��ڵ�, �޿� ���� ��ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY>=4000000;

--========================================================================

----------------------- �ǽ�---------------------------------------------

-- ** ������ ���ʽ� ���� **
-- 1. �޿��� 300���� �̻��� ������� �����, �޿�, �Ի���, ���� ��ȸ (��Ī ����)
SELECT EMP_NAME AS �����, SALARY AS �޿�, HIRE_DATE AS �Ի���, SALARY*12 AS ����
FROM EMPLOYEE
WHERE SALARY >= 3000000;
-- 2. ������ 5õ���� �̻��� ������� �����, �޿�, ����, �μ��ڵ� ��ȸ (��Ī ����)
SELECT EMP_NAME AS �����, SALARY AS �޿�, SALARY*12 AS ����, DEPT_CODE AS �μ��ڵ�
FROM EMPLOYEE
WHERE SALARY*12 >= 50000000;

-- 3. �����ڵ� 'J3'�� �ƴ� ������� ���, �����, �����ڵ�, ��翩�� ��ȸ (��Ī ����)
SELECT EMP_ID  "���", EMP_NAME " �����", JOB_CODE " �����ڵ�", ENT_YN "��翩��"
FROM EMPLOYEE
WHERE JOB_CODE <>  'J3';

-- 4. �޿��� 350���� �̻� 600���� ������ ��� ����� �����, ���, �޿� ��ȸ (��Ī ����)
--      �� AND, OR�� ������ ������ �� ����
SELECT EMP_NAME AS �����, EMP_ID AS ���, SALARY AS �޿�
FROM EMPLOYEE
WHERE SALARY >= 3500000 AND SALARY <= 6000000;

--========================================================================
/*
        * BETWEEN AND : ���ǽĿ��� ���Ǵ� ����
                => ~ �̻� ~ ������ ������ ���� ������ �����ϴ� ����
                
        [ǥ����]
                        �񱳴���÷��� BETWEEN �ּҰ� AND �ִ밪
                        => �ش� �÷��� ���� �ּҰ� �̻��̰� �ִ밪 ������ ���
*/
-- �޿��� 350���� �̻��̰� 600���� ������ ����� �����, ���, �޿� ��ȸ

SELECT EMP_NAME �����, EMP_ID ���, SALARY �޿�
FROM EMPLOYEE
WHERE SALARY >= 3500000 AND SALARY <= 6000000;

SELECT EMP_NAME �����, EMP_ID ���, SALARY �޿�
FROM EMPLOYEE
WHERE SALARY BETWEEN 3500000 AND 6000000;


/*
        *   NOT : ����Ŭ������ ������������
*/
-- �޿��� 350���� �̸� �Ǵ� 600���� �ʰ��� ����� �����, ���, �޿� ��ȸ (NOT X)
SELECT EMP_NAME �����, EMP_ID ���, SALARY �޿�
FROM EMPLOYEE
WHERE SALARY < 3500000 OR SALARY > 6000000;

-- �޿��� 350���� �̸� �Ǵ� 600���� �ʰ��� ����� �����, ���, �޿� ��ȸ (NOT ����غ���)
SELECT EMP_NAME �����, EMP_ID ���, SALARY �޿�
FROM EMPLOYEE
--WHERE SALARY NOT BETWEEN 3500000 AND 6000000;  -> �̰͵� �ǰ�
WHERE NOT SALARY BETWEEN 3500000 AND 6000000; -- �̰͵� �ǰ�..
-- NOT�� BETWEEN �տ� ���̰ų� �÷��� �տ� �ٿ��� ��� ����!

/*
        * IN : �񱳴���÷����� ������ ���� �߿� ��ġ�ϴ� ���� �ִ� ��� ��ȸ�ϴ� ������
        
        [ǥ����]
                        �񱳴���÷��� IN ('��1', '��2', '��3', ...)
*/
-- �μ��ڵ尡 D6�̰ų� D8�̰ų� D5�� ������� �����, �μ��ڵ�, �޿��� ��ȸ (IN X)
SELECT EMP_NAME �����, DEPT_CODE �μ��ڵ�, SALARY �޿�
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' OR DEPT_CODE = 'D8' OR DEPT_CODE = 'D5';

-- �μ��ڵ尡 D6�̰ų� D8�̰ų� D5�� ������� �����, �μ��ڵ�, �޿��� ��ȸ (IN  ���)
SELECT EMP_NAME �����, DEPT_CODE �μ��ڵ�, SALARY �޿�
FROM EMPLOYEE
WHERE DEPT_CODE IN('D6', 'D8', 'D5');
--======================================================================
/*
        * LIKE : ���ϰ����ϴ� �÷��� ���� ������ Ư�� ���Ͽ� ������ ��� ��ȸ
        
                => Ư�� ���� : '%', '_'�� ���ϵ� ī��� ���
                        *   '%'   :   0���� �̻�
                                ex) �񱳴���÷��� LIKE '����%' => �񱳴���÷��� ���� ���ڷ� "����"�Ǵ� ���� ��ȸ (���ڴ�!, ����, ���ڿ��� ��ȸ��, �̰������ڴ�! �� ��ȸ�ȵ�)
                                        �񱳴���÷��� LIKE '%����' => �񱳴��Į���� ���� ���ڷ� "��"���� ���� ��ȸ (����, ��������, �蹮�� ��ȸ��)
                                        �񱳴���÷��� LIKE '%����%' => �񱳴���÷��� ���� ���ڰ� "����"�� ���� ��ȸ(���ڴ�!, ����, ���ڿ���, �̰��� ���ڴ�, ��������, �蹮�� ��ȸ��)
                                        
                         * '_'   :  1����
                                ex) �񱳴���÷��� LIKE '_����' => �񱳴���÷��� ������, ���� �տ� ������ �ѱ��ڰ� �� ��� ��ȸ
                                        �񱳴���÷��� LIKE '__����' => �񱳴���÷��� ������, ���� �տ� ������ �α��ڰ� �� ��� ��ȸ
                                        �񱳴���÷��� LIKE '_����_' => �񱳴���÷��� ������, ���� ��, �ڿ� ������ �ѱ��ھ� ������� ��ȸ
                                        
*/
-- ����� �߿� ������ ����� �����, �޿�, �Ի��� ��ȸ
SELECT EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '��%';

-- ��� �̸��� �ϰ� ���Ե� ����� �����, �ֹι�ȣ, ����ó ��ȸ
SELECT EMP_NAME, EMP_NO, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��%';

-- ��� �̸��� ��� ���ڰ� ���� ����� �����, ����ó ��ȸ (�̸� 3���ڸ� �ִٸ�..)
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '_��_';

-- ����� �� ����ó�� 3��° �ڸ��� 1�� ����� ���, �����, ����ó, �̸��� ��ȸ
SELECT EMP_ID, EMP_NAME, PHONE, EMAIL
FROM EMPLOYEE
WHERE PHONE LIKE '__1%';

-- ����� �� �̸����� 4��° �ڸ��� _�� ����� ���, �̸�, �̸��� ��ȸ
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '____%';        --���ϴ´�� ��ȸ�� ���� ����;;;
--=> ���ϵ�ī��� ���Ǵ� ���ڿ� �÷��� ��� ���ڰ������ϱ� ������ ��� ���ϵ�ī��� �νĵ�
--      ����, ������ ����� ��! (=> ������ ���ϵ�ī�� ����ϱ�! ESCAPE �� ����Ͽ� ��� �� ����)

SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___#_%' ESCAPE '#' ; --=> �ڡڡڡ��򰡶� ���� ���´ٳ׿�ڡڡڡ�
--=========================================================================
/*
        * IS NULL / IS NOT NULL : �÷����� NULL�� ���� ��� NULL���� ���� �� ����ϴ� ������
        
*/
-- ���ʽ��� ���� �ʴ� ������� ���, �̸�, �޿�, ���ʽ� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
WHERE BONUS IS NULL;

-- ���ʽ��� �޴� ���(BONUS�� ���� NULL�� �ƴ�!)���� ���, �̸�, �޿�, ���ʽ� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
 WHERE BONUS IS NOT NULL; -- �̰͵εǰ�
 -- WHERE NOT BONUS IS NULL; --�̰͵εǰ�

-- ����� ���� ���(MANAGER_ID�� ����  NULL) ���� �����, ������(MANAGER_ID), �μ��ڵ� ��ȸ
SELECT EMP_NAME, MANAGER_ID, DEPT_CODE
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL;

-- �μ� ��ġ�� ���� �ʾ�����, ���ʽ��� �ް� �ִ� ����� �����, ���ʽ�, �μ��ڵ带 ��ȸ
SELECT EMP_NAME, BONUS, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL AND BONUS IS NOT NULL;
--===================================================================
/*
        * ������ �켱����
            (0) ()
            (1) ��������� : * / + -
            (2) ���Ῥ���� : ||
            (3) �񱳿����� : > < >= <= = != ..
            (4) IS NULL / LIKE '����' / IN
            (5) BETWEEN AND
            (6) NOT
            (7) AND
            (8) OR
*/
-- �����ڵ尡 J7�̰ų� J2�� ����� �� �޿��� 200���� �̻��� ����� ��� ������ ��ȸ
SELECT *
FROM EMPLOYEE
-- WHERE JOB_CODE IN('J7','J2') AND SALARY >= 2000000
WHERE (JOB_CODE = 'J7' OR JOB_CODE = 'J2') AND SALARY >=2000000;
--===================================================================

/*
        * ORDER BY : SELECT ���� ���� ������ �ٿ� �ۼ�. ������� ���� �������� ����

        
        [ǥ����]
                    SELECT ��ȸ�� �÷�, ... 
                    FROM ���̺��
                    WHERE ���ǽ�
                    ORDER BY ���ı����̵Ǵ� �÷� | ��Ī | �÷����� [ASC | DESC]   [ NULLS FIRST | NULLS LAST]
                    
                    * ASC : �������� ���� (�⺻��)
                    * DESC : �������� ����
                    
                    * NULLS FIRST : �����ϰ����ϴ� �÷��� ���� NULL�� ��� �ش� �����͸� �� �տ� ��ġ(DESC�� ��� �⺻��)
                    * NULLS LAST : �����ϰ����ϴ� �÷��� ���� NULL�� ��� �ش� �����͸� �� �ڿ� ��ġ(ASC�� ��� �⺻��)                             
                        => NULL ���� ū ������ �з��Ǿ� ���ĵ�!
*/
-- ��� ����� �����, ���� ��ȸ (������ �������� ����)
SELECT EMP_NAME, SALARY*12
FROM EMPLOYEE
 -- ORDER BY SALARY*12 DESC; -- ���ı����� �Ǵ� �÷�(�����)
 -- ORDER BY ���� DESC; -- ��Ī ���
 ORDER BY 2 DESC; -- �÷� ���� ��� (����Ŭ������ 1���� ����!)

-- ���ʽ� �������� �����غ���
SELECT *
FROM EMPLOYEE
-- ORDER BY BONUS; -- �⺻�� (ASC, NULLS LAST)
-- ORDER BY BONUS ASC; -- �⺻�� NULLS LAST ����
-- ORDER BY BONUS ASC NULLS LAST;
-- ORDER BY BONUS DESC; --�⺻�� NULLS FIRST ����(DESC ������ ��� �⺻��)
ORDER BY BONUS DESC, SALARY ASC; --  ���ʽ��� ��������, �޿��� �������� => �ʽ� ���� �������� �����ϴµ�, ���� ���� ��� �޿��� ���� ������������ ����



