/*
        GROUP BY ��
        :   �׷� ������ ������ �� �ִ� ����
        : ���� ���� ������ �ϳ��� �׷����� ��� ó���ϴ� �������� ���
*/
-- ��ü ����� �޿� �� �� ��ȸ

SELECT SUM(SALARY)
FROM EMPLOYEE;

-- �μ��� �޿� �� �� ��ȸ
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- �μ��� ��� �� ��ȸ
SELECT DEPT_CODE, COUNT(*)     --- 3
FROM EMPLOYEE                                   --- 1
GROUP BY DEPT_CODE;                    --- 2

-- �μ��ڵ尡 'D6','D9', 'D1'�� �� �μ��� �޿� �� ��, ��� �� ��ȸ
SELECT DEPT_CODE, SUM(SALARY), COUNT(*)     ---4
FROM EMPLOYEE                                                                   ---1
WHERE DEPT_CODE IN('D6' , 'D9', 'D1')                    ---2
GROUP BY DEPT_CODE                                                       ---3
ORDER BY DEPT_CODE;                                                         ---5

-- �� ���޺� �� �����/���ʽ��� �޴� �����/�޿���/��ձ޿�/�����޿�/�ְ�޿� ��ȸ (��, ���� ��������)
SELECT JOB_CODE ����, COUNT(*) "�� �����", COUNT(BONUS) "���ʽ��� �޴� �����", SUM(SALARY)"�޿���", ROUND(AVG(SALARY)) "��ձ޿�", MIN(SALARY)"�����޿�",MAX(SALARY)"�ְ�޿�"
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY JOB_CODE;

-- ���� �����, ���� ��� �� ��ȸ
SELECT DECODE(SUBSTR(EMP_NO, 8, 1),'1','��','2','��')"����", COUNT(*)"��� ��"
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO, 8, 1);

-- �μ� �� ���޺� ��� ��, �޿� ���� ��ȸ
SELECT DEPT_CODE, JOB_CODE,COUNT(*), SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE    -- �μ��ڵ� �������� �׷�ȭ�ϰ�, �� ������ �����ڵ� �������� ���� �׷�ȭ�� ��!
ORDER BY DEPT_CODE;
-----------------------------------------------------------------------------------
/*
            HAVING��
            : �׷쿡 ���� ������ ������ �� ���Ǵ� ����  (���� �׷��Լ����� ������ ������ �ۼ���!)
*/
--  �� �μ��� ��� �޿� ��ȸ  (�μ��ڵ�, ��� �޿�-> �ݿø�ó��)
SELECT DEPT_CODE, ROUND(AVG(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_CODE;

--  �� �μ��� ��� �޿� 300���� �̻��� �μ��� ��ȸ
SELECT DEPT_CODE, ROUND(AVG(SALARY))
FROM EMPLOYEE
--WHERE AVG(SALARY)>=3000000        --WHERE �������� �׷��Լ� ��� �Ұ�!
GROUP BY DEPT_CODE
HAVING AVG(SALARY)>=3000000;


-- ���� �� �����ڵ�, �� �޿��� ��ȸ (��, ���޺� �޿� ���� 1000���� �̻��� ���޸� ��ȸ)
SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE
HAVING SUM(SALARY)>=10000000;

-- �μ��� ���ʽ��� �޴� ����� ���� �μ��� �μ��ڵ� ��ȸ
SELECT DEPT_CODE
FROM EMPLOYEE
-- WHERE BONUS IS NULL      -- �μ� ������� ���ʽ��� NULL�� ������� ���� �ɷ��� -> �ش� �μ��� ���ʽ��� �ִ� ����� ���� ���� ����!
GROUP BY DEPT_CODE
HAVING COUNT(BONUS) = 0; -- �׷�ȭ�� �Ŀ� COUNT�Լ��� ����Ͽ� BONUS �޴� ����� ���� ������ ������!
--------------------------------------------------------------------------------------
/*
            * ���� ����
            
            SELECT * | ��ȸ�ϰ��� �ϴ� �÷� AS "��Ī" | �Լ��� | �����                              -- 5
            FROM ��ȸ�ϰ��� �ϴ� ���̺� | DUAL                                                                                -- 1
            WHERE ���ǽ�(�����ڵ��� Ȱ���Ͽ� �ۼ�)                                                                            -- 2
            GROUP BY �׷�ȭ�� ������ �Ǵ� �÷� | �Լ���                                                                       -- 3
            HAVING ���ǽ� (�׷��Լ��� Ȱ���Ͽ� �ۼ�)                                                                             -- 4
            ORDER BY �÷� | ��Ī | �÷����� [ASC, DESC] [NULLS FIRST | NULLS LAST]      -- 6
            
            -> ����Ŭ�� ����(��ġ) 1���� ����!
*/
----------------------------------------------------------------------------------------
/*
            ���� ������
            : �������� �������� �ϳ��� ���������� ������ִ� ������
            
            - UNION :   ������ OR (�� �������� ������ ������� ������
            -INTERSECT  :   ������ AND ( �� �������� ������ ������� �ߺ��� �κ��� ��������)
            -UNION ALL: ������+������(�ߺ��Ǵ� �κ��� �ι� ��ȸ �� �� ����)
            -MINUS : ������ (����������� ���� ������� �ܤ�=
*/
-- ** ������(UNION) **
-- �μ��ڵ尡 D5�� ��� �Ǵ� �޿��� 300���� �ʰ��� ������� ���, �̸�, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE =  'D5' OR SALARY> 3000000;


--�μ��ڵ尡 D5�� ����� ���, �̸�, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE =  'D5';

--�޿��� 300���� �ʰ��� ����� ����� ���, �̸�, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY> 3000000;

--UNION���� ���� 2�� �������� ��ġ��
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE =  'D5'
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY> 3000000;


-- **������(INTERSECT)**
--�μ��ڵ尡 D5�̰� �޿��� 300���� �ʰ��� ����� ���, �̸�, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' AND SALARY > 3000000;

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5';

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
INTERSECT
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;

-- ** UNION ALL **
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' 
UNION ALL
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000; 

--** MINUS **
-- ���� ��� ������ ���� ��� ���� �� ������
-- DEPT_CODE�� D5�� ����� �� �޿��� 300���� �ʰ��� ������� �����ϰ� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
MINUS
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;
-------------------------------------------------------------------------------------
/*
            ���� ������ ��� �� ���ǻ���
            1) ���������� �÷� ������ �����ؾ���
            2) �÷� �ڸ����� ������ Ÿ������ �ۼ��ؾ� ��
            3) �����ϰ��� �Ѵٸ� ORDER BY���� �������� �ۼ��ؾ���
*/
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE =  'D5'
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY> 3000000
ORDER BY EMP_ID;

