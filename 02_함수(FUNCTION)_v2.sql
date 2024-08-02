-- ** �Լ� �ι�° ���� **
/*
        �����Լ�
                *   DECODE (�񱳴��(�÷� / ����� / �Լ���), �񱳰�1, �����1, �񱳰�2, �����, ...)
                
                -- �ڹٿ��� switch
                switch(�񱳴��){
                    case �񱳰�1 : �����
                    case �񱳰�2 : �����
                }
*/

-- ���, �����, �ֹι�ȣ, ���� ��ȸ (1:'��', 2: '��', 3: '����', 4: '����', '�˼�����')
SELECT EMP_ID ���, EMP_NAME �����, EMP_NO �ֹι�ȣ
                , DECODE(SUBSTR(EMP_NO, 8, 1), 1, '��', 2,'��', 3, '����', 4, '����', '�˼�����') "����"
FROM EMPLOYEE;

-- �����, �����޿�, �λ�� �޿� ��ȸ
/*
        ������ J7�� ����� 10% �λ�
                        J6�� ����� 15% �λ�
                        J5�� ����� 20% �λ�
        �׿ܿ���                    5% �λ�
*/
SELECT EMP_NAME �����, SALARY �����޿�, 
                   SALARY* DECODE(JOB_CODE, 'J7',1.1, 'J6', 1.15, 'J5', 1.2, 1.05) "�λ�� �޿�"
FROM EMPLOYEE;

/*
        CASE WHEN THEN  :   ���ǽĿ� ���� ������� ��ȯ���ִ� �Լ�
         
         [ǥ����]
                        CASE
                                WHEN ���ǽ�1 THEN �����1
                                WHEN ���ǽ�2 THEN �����2
                                ...
                                ELSE �����
                        END
*/
-- �����, �޿�, �޿��� ���� ���
/*
        500���� �̻�    '���'
        350���� �̻�    '�߱�'
        �׿� '�ʱ�'
*/
SELECT EMP_NAME �����, SALARY �޿�
                , CASE
                        WHEN SALARY>=5000000 THEN '���'
                        WHEN SALARY>=3500000 THEN '�߱�'
                        ELSE '�ʱ�'
                    END
FROM EMPLOYEE;                        
--=====================================================================

--------------------- �׷� �Լ� ------------------------------------------------
/*
        *   SUM :   �ش� �÷��� ������ �� ���� ��ȯ���ִ� �Լ�
        
        [ǥ����]
                    SUM(����Ÿ���÷�)
*/
--  ��ü ������� �� �޿��� ��ȸ
SELECT TO_CHAR(SUM(SALARY),'L999,999,999') "�ѱ޿�" FROM EMPLOYEE;

-- ���ڻ������ �� �޿�
SELECT TO_CHAR(SUM(SALARY),'L999,999,999') "���ڻ�� �ѱ޿�"
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1) IN(1,3);

-- ���ڻ������ �� �޿�
SELECT TO_CHAR(SUM(SALARY), 'L999,999,999') "���ڻ�� �ѱ޿�"
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1) IN (2, 4);

-- �μ��ڵ尡 'D5'�� ������� �� ����
SELECT TO_CHAR(SUM(SALARY*12),'L999,999,999') "�μ��ڵ� D5�� ������� �� ����"
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5';

/*
        AVG :   �ش� �÷��� ������ ����� ��ȯ���ִ� �Լ�
        
        [ǥ����]
                    AVG(����Ÿ�� �÷�) 
*/
-- ��ü ������� ��� �޿� ��ȸ
SELECT TO_CHAR ( ROUND ( AVG(SALARY) ), 'L999,999,999' ) ��ձ޿�
FROM EMPLOYEE;

/*
        *   MIN :   �ش� �÷��� ���� �� ���� ���� �� ��ȯ���ִ� �Լ�
        
        [ǥ����] MIN(��� Ÿ��) 
*/

SELECT MIN ( EMP_NAME) "����Ÿ�� �ּҰ�", MIN (SALARY) "����Ÿ�� �ּҰ�", MIN(HIRE_DATE) "��¥Ÿ�� �ּҰ�"
FROM EMPLOYEE;

/*
        MAX :   �ش� �÷��� ���� �� ���� ū ���� ��ȯ���ִ� �Լ�
        
        [ǥ����] MAX(���Ÿ��)
*/

SELECT MAX( EMP_NAME) "����Ÿ�� �ִ밪", MAX (SALARY) "����Ÿ�� �ִ밪", MAX(HIRE_DATE) "��¥Ÿ�� �ִ밪"
FROM EMPLOYEE;

/*
        COUNT   :   ���� ������ ��ȯ���ִ� �Լ� (��, ������ ���� ��� �ش� ���ǿ� �´� ���� ������ ��ȯ)
        
        [ǥ����]
                    COUNT (*) : ��ȸ�� ����� ��� ���� ������ ��ȯ
                    COUNT(�÷���)  :   �ش� �÷����� NULL�� �ƴ� �͸� ���� ������ ���� ��ȯ
                    COUNT(DISTINCT �÷�)  :   �ش� �÷����� �ߺ��� ������ ���� ���� ������ ���� ��ȯ
                        => �ߺ� ���� �� NULL�� �������� �ʰ� ������ ������!
*/
-- ��ü ��� �� ��ȸ
SELECT COUNT(*) "��ü �����" FROM EMPLOYEE;

--���� ��� �� ��ȸ
SELECT COUNT(*) "���� �����"
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) IN(1,3);

-- ���ʽ� �޴� ��� �� ��ȸ
SELECT COUNT(BONUS) FROM EMPLOYEE;

SELECT COUNT(*)
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;


-- �μ� ��ġ ���� ��� �� ��ȸ => �μ��ڵ尡 NULL�� �ƴ� ���� ����
SELECT COUNT(DEPT_CODE) FROM EMPLOYEE;

SELECT COUNT(DISTINCT DEPT_CODE) FROM EMPLOYEE;

SELECT DISTINCT  DEPT_CODE FROM EMPLOYEE;











