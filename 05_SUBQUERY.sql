/*
            ��������    (SUBQUERY)
            :   �ϳ��� ������ ���� ���Ե� �� �ٸ� ������ 
                ���� ������ �ϴ� �������� ���� ���� ������ �ϴ� �ϴ� ������
*/

-- "���ö" ����� ���� �μ��� ����  ��� ������ ��ȸ

--  1) ���ö ����� �μ��ڵ� ��ȸ
SELECT DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME='���ö';

-- 2) �μ��ڵ尡 'D9'�� ��� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

-- ���� 2���� �������� �ϳ��� ���ĺ��ٸ�..

SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE =   (SELECT DEPT_CODE 
                                                    FROM EMPLOYEE 
                                                    WHERE EMP_NAME= '���ö');
                                                    
-- ��ü ����� ��ձ޿����� �� ���� �޿��� �޴� ����� ������ ��ȸ
-- 1) ��ü ����� ��ձ޿� ��ȸ (�ݿø� ó��) --> 3047663
SELECT ROUND(AVG(SALARY))
FROM EMPLOYEE;

--2) ��ձ޿� *3047663)���� �� ���� �޿��� �޴� ��� ���� ��ȸ
SELECT ROUND(AVG(SALARY))
FROM EMPLOYEE
WHERE SALARY >= 3047663;

-- ���������� �����غ���..
SELECT *
FROM EMPLOYEE
WHERE SALARY >= (SELECT ROUND(AVG(SALARY))
                                            FROM EMPLOYEE);
----------------------------------------------------------------------------------
/*
            * ���������� ���� *
            ���������� ������ ��� ���� �� �� �� ���� �����Ŀ� ���� �з�
            
            - ������ �������� : ���������� ���� ����� ������ 1�� �� �� (1�� 1��)
            - ������ �������� : ���������� ���� ����� �������� ��    (N�� 1��)
            - ���߿� �������� : ���������� ���� ����� �� ���̰�, �������� �÷��� �� (1�� N��)
            - ������ ���߿� �������� : ���������� �������� ������ ���� �÷��� �� (N�� N��)
            
            >> ������ ���� �������� �տ� �ٴ� �����ڰ� �޶���!
*/

-- ������ �������� : �������� ����� ������ 1���� ��!
/*
            �Ϲ����� �񱳿����� ��� ���� : = != > <  >= <=..
*/
-- �� ������ ��� �޿����� �� ���� �޿��� �޴� ������� �����, �����ڵ�, �޿� ��ȸ
SELECT EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEE);

-- �����޿��� �޴� ����� �����, �޿�, �Ի��� ��ȸ
-- �����޿� ��ȸ
SELECT MIN(SALARY)
FROM EMPLOYEE;

SELECT EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEE);

-- ���ö ����� �޿����� ���� �޴� ����� �����, �μ��ڵ�, �޿� ��ȸ
SELECT SALARY
FROM EMPLOYEE
WHERE EMP_NAME = '���ö';

SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >  (SELECT SALARY
                                          FROM EMPLOYEE
                                          WHERE EMP_NAME = '���ö');
                                            
-- ���� ������� �μ��ڵ带 �μ������� �����Ͽ� ��ȸ
SELECT EMP_NAME, DEPT_TITLE, SALARY
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID AND SALARY>(SELECT SALARY
                                                                                                      FROM EMPLOYEE
                                                                                                      WHERE EMP_NAME = '���ö');

SELECT EMP_NAME, DEPT_TITLE, SALARY
FROM EMPLOYEE
        JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
WHERE SALARY > (SELECT SALARY
                                         FROM EMPLOYEE
                                        WHERE EMP_NAME ='���ö');
                                        

-- �μ��� �޿����� ���� ū �μ��� �μ��ڵ�, �޿����� ��ȸ
-- 1) �μ��� �޿��� �� ���� ū �� �ϳ��� ��ȸ 17700000

SELECT MAX(SUM(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 2) �μ��� �޿����� 17700000�� �μ��� �μ��ڵ�, �޿��� ��ȸ
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING SUM(SALARY) = 17700000;

-- �� �������� ���غ���
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING SUM(SALARY) = (SELECT MAX(SUM(SALARY))
                                                            FROM EMPLOYEE
                                                            GROUP BY DEPT_CODE);
                                                            
-- ������ ����� ���� �μ��� ������� ���, �����, ����ó, �Ի���, �μ��� ��ȸ
-- (��, ������ ����� �����ϰ� ��ȸ!)
-- * ����Ŭ ���� *
SELECT EMP_ID, EMP_NAME, PHONE, HIRE_DATE, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID AND DEPT_CODE = (SELECT DEPT_CODE
                                                                                                                FROM EMPLOYEE
                                                                                                                WHERE EMP_NAME = '������')
                                                                    AND EMP_NAME != '������';



-- * ANSI ����*
SELECT EMP_ID, EMP_NAME, PHONE, HIRE_DATE, DEPT_TITLE
FROM EMPLOYEE
        JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE DEPT_CODE = (SELECT DEPT_CODE
                                                    FROM EMPLOYEE
                                                    WHERE EMP_NAME = '������') 
                    AND EMP_NAME != '������';
------------------------------------------------------------------------
/*
            ������ �������� :  �������� ���� ����� �������� ��� (N�� 1��)
            
            IN (��������)       :   �������� ����� �߿��� �ϳ��� ��ġ�ϴ� ���� �ִٸ� ��ȸ
            > ANY (��������)    :   ���� ���� ����� �߿��� �ϳ��� ū ��찡 �ִٸ� ��ȸ
            < ANY (��������)    :   ���� ���� ����� �߿��� �ϳ��� ���� ��찡 ������ ��ȸ
                    *   (�񱳴�� > �����1) OR (�񱳴�� > �����2) OR (�񱳴�� > �����3) ...
            
            > ALL (��������)    :   ���� ���� ��� ����� ���� Ŭ ��� ��ȸ
            < ALL (��������)    :   ���� ���� ��� ����� ���� ���� ��� ��ȸ
                    *   (�񱳴�� > �����1) AND (�񱳴�� > �����2) AND (�񱳴�� > �����3) ...
*/
-- ����� ��� �Ǵ� ������ ����� ���� ������ ������� ���� ��ȸ  (���/�����/�����ڵ�/�޿�)
-- ����� ��� �Ǵ� ������ ����� �����ڵ� ��ȸ
SELECT JOB_CODE
FROM EMPLOYEE
WHERE EMP_NAME IN ('�����', '������');

-- * �����ڵ尡 'J3' �Ǵ� 'J7'�� ������� ������ ��ȸ
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE IN ('J3', 'J7');


-- ���������� �����غ���
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE IN (SELECT JOB_CODE 
                                                  FROM EMPLOYEE 
                                                  WHERE EMP_NAME IN('�����', '������'));
                                                  
-- �븮 ������ ����� �� ���� ������ ����� �ּ� �޿����� ���� �޴� ��� ���� ��ȸ(���, �̸�, ���޸�, �޿�)
-- * ���� ������ �޿�
SELECT JOB_NAME, SALARY
FROM EMPLOYEE
    JOIN JOB USING(JOB_CODE)
WHERE  JOB_NAME = '����';

-- * > ANY
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE
    JOIN JOB USING(JOB_CODE)
WHERE SALARY> ANY (SELECT SALARY
                                                  FROM EMPLOYEE
                                                  JOIN JOB USING(JOB_CODE)
                                                   WHERE  JOB_NAME = '����')
AND JOB_NAME = '�븮';
--------------------------------------------------------------------------
/*
        ���߿� ��������    :   �������� ���� ����� ���� �ϳ��̰�, �÷�(��) ���� ���� ���� ���  
*/

-- ������ ��� ���� �μ��ڵ�, ���� �����ڵ忡 �ش��ϴ� ��� ������ ��ȸ
-- 1) ������ ����� �μ��ڵ�, �����ڵ� ��ȸ
SELECT DEPT_CODE, JOB_CODE
FROM EMPLOYEE
WHERE EMP_NAME = '������';

SELECT DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME = '������';

SELECT  JOB_CODE
FROM EMPLOYEE
WHERE EMP_NAME = '������';

-- ----------
--* ������ ���������� ����� ���
SELECT EMP_NAME, DEPT_CODE, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = (SELECT DEPT_CODE
                                                    FROM EMPLOYEE
                                                    WHERE EMP_NAME = '������')
                    AND JOB_CODE = (SELECT  JOB_CODE
                                                                FROM EMPLOYEE
                                                                WHERE EMP_NAME = '������');
                                                                
--* ������ ���������� ����� ���
SELECT EMP_NAME, DEPT_CODE, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE (DEPT_CODE, JOB_CODE) =   (SELECT DEPT_CODE, JOB_CODE
                                                                                    FROM EMPLOYEE
                                                                                    WHERE EMP_NAME = '������');
                                                                                    
-- �ڳ��� ����� ���� �����ڵ�, ���� ����� ������ �ִ� ��� ���� ��ȸ(�����, �����ڵ�, �����ȣ)
-- 1) �ڳ��� ����� �����ڵ�, �����ȣ�� ��ȸ
SELECT JOB_CODE, MANAGER_ID
FROM EMPLOYEE
WHERE EMP_NAME = '�ڳ���';

-- 2) ���� �����ڵ� ���� ����� ������ �ִ� ��� ������ ��ȸ
SELECT EMP_NAME, JOB_CODE, MANAGER_ID
FROM EMPLOYEE
WHERE (JOB_CODE, MANAGER_ID) = (SELECT JOB_CODE, MANAGER_ID
                                                                                    FROM EMPLOYEE
                                                                                    WHERE EMP_NAME='�ڳ���')
                                                    AND EMP_NAME != '�ڳ���'; -- �ڳ��� ����� �����ϰ��� �Ѵٸ�...
-----------------------------------------------------------------------------
/*
            * ������ ���߿� ��������  :   ���������� ����� ������, �������� ���� ���
*/
-- �� ���޺� �ּұ޿��� �޴� ��� ������ ��ȸ
-- 1) �� ���޺� �ּұ޿�
SELECT JOB_CODE, MIN(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE;
/*
J1	8000000
J2	3700000
J4	1550000
J3	3400000
J7	1380000
J5	2200000
J6	2000000
*/
-- 2) �� ���޺� �ּұ޿��� �޴� ��� ��ȸ
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE = 'J1' AND SALARY = 8000000
        OR JOB_CODE = 'J2' AND SALARY = 3700000
        OR JOB_CODE = 'J3' AND SALARY= 3400000;
    -- ...;
    
    -- �������� ����
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE  (JOB_CODE, SALARY) IN (SELECT JOB_CODE, MIN(SALARY)
                                                                            FROM EMPLOYEE
                                                                            GROUP BY JOB_CODE);
                                                                            
                                                                            
-- �� �μ����� �ְ�޿��� �޴� ��� ���� ��ȸ
SELECT DEPT_CODE, MAX(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE (DEPT_CODE, SALARY) IN (SELECT DEPT_CODE, MAX(SALARY)
                                                                            FROM EMPLOYEE
                                                                            GROUP BY DEPT_CODE);
---------------------------------------------------------------------------
/*
        �ζ��� ��   :   ���������� FROM���� ����ϴ� ��
                                    => ���������� ���� ����� ��ġ ���̺�ó�� ����ϴ°�
*/
-- ������� ���, �̸�, ���ʽ� ���� ����, �μ��ڵ带 ��ȸ
-- * ���ʽ� ���� ������ NULL�� �ƴϾ�� �ϰ�, ���ʽ� ���� ������ 30000������ �ӻ��� ����鸸 ��ȸ
--    => NVL : NULL �� ���ٸ� ������ ����
SELECT EMP_ID, EMP_NAME, SALARY*12*(1+NVL(BONUS,0)), DEPT_CODE
FROM EMPLOYEE
WHERE SALARY*12*(1+NVL(BONUS,0))>=30000000
ORDER BY 3 DESC;

--  => TOP-N�м�  :   ���� N���� ��ȸ
SELECT ROWNUM, ���, �̸�, "���ʽ� ���� ����", �μ��ڵ�
FROM(         SELECT EMP_ID ���, EMP_NAME �̸�, SALARY*12*(1+NVL(BONUS,0)) "���ʽ� ���� ����", DEPT_CODE �μ��ڵ�
                        FROM EMPLOYEE
                        WHERE SALARY*12*(1+NVL(BONUS,0))>=30000000
                        ORDER BY 3 DESC     )
WHERE   ROWNUM <= 5;

-- ���� �ֱٿ� �Ի��� ��� 5���� ��ȸ
-- �Ի��� ���� �������� ����   (���, �̸�, �Ի���)
SELECT ROWNUM, EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE
ORDER BY HIRE_DATE DESC;


SELECT ROWNUM, ���, �̸�, �Ի���
FROM (      SELECT EMP_ID ���, EMP_NAME �̸�, HIRE_DATE �Ի���
                        FROM EMPLOYEE
                        ORDER BY HIRE_DATE DESC)
WHERE ROWNUM <=5;

----------------------------------------------------------------------------
/*
            ������ �ű�� �Լ� (WINDOW FUNCTION)
            
            - RANK()    OVER(���ı���)      : ������ ���� ������ ����� ������ �� ��ŭ �ǳʶٰ� ���� ���
            - DENSE_RANK()   OVER(���ı���       : ������ ������ �ִ��� �� ���� ����� +1�ؼ� ���� ���
            
            * SELECT �������� ��� ����!
*/
-- �޿��� ���� ������� ������ �Űܼ� ��ȸ
SELECT EMP_NAME, SALARY, RANK() OVER(ORDER BY SALARY DESC) "����"
FROM EMPLOYEE;
--> ���� 19���� 2���� �ְ�, �� ���� ������ 21���� ǥ�õ�.

SELECT EMP_NAME, SALARY, DENSE_RANK() OVER(ORDER BY SALARY DESC) "����"
FROM EMPLOYEE;
--> ���� 19���� 2�� ���Ŀ� �� ���� ������ 20���� ǥ�õ�. (+1)

--> ���� 5�� ��ȸ
SELECT EMP_NAME, SALARY, DENSE_RANK() OVER(ORDER BY SALARY DESC) "����"
FROM EMPLOYEE
WHERE ROWNUM <=5;

SELECT *
FROM(SELECT EMP_NAME, SALARY, DENSE_RANK() OVER(ORDER BY SALARY DESC) "����"
                FROM EMPLOYEE)
WHERE ���� <= 5;

-- ���� 3�� ~ 5�� ��ȸ
SELECT *
FROM (SELECT EMP_NAME, SALARY, DENSE_RANK() OVER(ORDER BY SALARY DESC) "����"
                FROM EMPLOYEE)
WHERE ���� <=5 AND ���� >= 3;
--------------------------------------------------------------------------
-- 1) ROWNUM�� Ȱ���Ͽ� �޿��� ���� ���� 5���� ��ȸ�Ϸ� ������, ����� ��ȸ�� ���� �ʾҴ�.
SELECT ROWNUM, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE ROWNUM <= 5
ORDER BY SALARY DESC;

-- ������ (����) : ROWNUM<=5�� ���� ����� �� SALARY�� ORDER BY�� ����Ǿ���.

-- �ذ���     :

SELECT EMP_NAME, �޿�
FROM (SELECT ROWNUM, EMP_NAME, NVL(SALARY, 0) �޿�
                FROM EMPLOYEE
                ORDER BY �޿� DESC)
WHERE ROWNUM<=5;


-- 2) �μ��� ��ձ޿��� 270������ �ʰ��ϴ� �μ��� �ش��ϴ� �μ��ڵ�, �μ��� �� �޿���, �μ��� ��ձ޿�, �μ��� ������� ��ȸ
SELECT DEPT_CODE, SUM(SALARY) "����", FLOOR(AVG(SALARY)) AS "���", COUNT(*) "�ο���"
FROM EMPLOYEE
WHERE SALARY > 2700000
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE ASC;

-- ������ (����) : WHERE���� ���� ����Ǳ� ������ �޿��� 270���� �̻��� ��츸 ������� ���Ǿ���.
--�μ��� ��ձ޿��� Ȯ���ؾ��ϴµ�, ��� �������� �޿��� Ȯ���ߴ�

--�μ��� ��ձ޿�

SELECT DEPT_CODE, SUM(SALARY) "����", FLOOR(AVG(SALARY)) AS "���", COUNT(*) "�ο���"
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING FLOOR(AVG(SALARY)) >  2700000
ORDER BY DEPT_CODE ASC;

SELECT *
FROM(SELECT DEPT_CODE, SUM(SALARY) "����", FLOOR(AVG(SALARY)) AS "���", COUNT(*) "�ο���"
                FROM EMPLOYEE
                GROUP BY DEPT_CODE
                ORDER BY DEPT_CODE ASC)
WHERE ���>2700000;
