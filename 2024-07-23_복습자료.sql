
--=========================================================================
-- ������ ���� �α��� �� �Ʒ� ������ ��ȸ�� �� �ִ� �������� �ۼ����ּ��� :D
--=========================================================================
-- �̸����� ���̵� �κп�(@ �պκ�) k�� ���Ե� ��� ���� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE EMAIL LIKE '%k%@%';

-- �μ��� ����� ���� ��� �� ��ȸ
SELECT DEPT_CODE, COUNT(*)
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL
GROUP BY DEPT_CODE;

-- ����ó ���ڸ��� 010, 011�� �����ϴ� ��� �� ��ȸ
SELECT SUBSTR(PHONE, 1,3), COUNT(*)
FROM EMPLOYEE
WHERE SUBSTR(PHONE, 1, 3) IN ('010', '011')
GROUP BY SUBSTR(PHONE, 1, 3);

-- �μ��� ����� ���� ��� ���� ��ȸ (�μ���, ���, ����� ��ȸ)
-- ** ����Ŭ ���� **
SELECT DEPT_TITLE �μ���, EMP_ID ���, EMP_NAME �����
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID AND MANAGER_ID IS NULL;

-- ** ANSI ���� **
SELECT DEPT_TITLE �μ���, EMP_ID ���, EMP_NAME �����
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE=DEPT_ID)
WHERE MANAGER_ID IS NULL;

-- �μ��� ����� ���� ��� �� ��ȸ (�μ���, ����� ��ȸ)
-- ** ����Ŭ ���� **
SELECT DEPT_TITLE �μ���, COUNT(*) �����
FROM EMPLOYEE , DEPARTMENT
WHERE DEPT_CODE=DEPT_ID AND MANAGER_ID IS NULL
GROUP BY DEPT_TITLE;

-- ** ANSI ���� **
SELECT DEPT_TITLE �μ���, COUNT(*) �����
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE=DEPT_ID)
WHERE MANAGER_ID IS NULL
GROUP BY DEPT_TITLE;