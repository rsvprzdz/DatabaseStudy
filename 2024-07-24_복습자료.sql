-- ��������???�������� ������ ���� ���� �� �Ʒ� SQL���� �ۼ����ּ��� ��������???��������
--============================================================================--
-- [1] '240724' ���ڿ��� '2024�� 7�� 24��'�� ǥ���غ���
SELECT SUBSTR('240724', 1, 2) || '�� '  ||
SUBSTR('240724', 4, 1) || '�� '  ||
SUBSTR('240724', 5, 2) || '��' 
FROM DUAL;

SELECT TO_CHAR(TO_DATE(240724), 'YYYY"��" FMMM"��" DD"��"') FROM DUAL;



-- [2] ������ �¾ �� ��ĥ°���� Ȯ���غ��� (���糯¥ - �������)
SELECT ROUND(SYSDATE-TO_DATE(910720))  FROM DUAL;


-- [3] ���� ������ �ٲ㺸��
-- bElIVe iN YoURseLF.      -->  Belive in yourself.
SELECT INITCAP('bElIVe') || LOWER(' iN YoURseLF.') FROM DUAL;

-- [4] ������ 7�������� ������� �Ի���� ��� �� ��ȸ (�Ʒ��� ���� ���)


SELECT LPAD(SUBSTR(EMP_NO, 3, 2)||'��', 8) AS  ����, LPAD(EXTRACT(MONTH FROM HIRE_DATE)||'��', 8) �Ի��, LPAD(COUNT(*)||'��', 5) "�Ի� �����"
FROM EMPLOYEE
WHERE TO_NUMBER(SUBSTR(EMP_NO, 3, 2))>=7
GROUP BY SUBSTR(EMP_NO, 3, 2), EXTRACT(MONTH FROM HIRE_DATE)
ORDER BY 1, 2;

/*
------------------------------------------------------------
    ����     |   �Ի��   |   �Ի� �����|
         7�� |       4�� |          2��|
         7�� |       9�� |          1��|
         ...
         9�� |       6�� |          1��|
------------------------------------------------------------
*/

-- [5] �����μ� ����� ���, �����, �μ���, ���޸� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE
 JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
 JOIN JOB USING (JOB_CODE)
WHERE DEPT_TITLE LIKE '%����%';

