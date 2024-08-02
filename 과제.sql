/*
1. �� ������б��� �а� �̸��� �迭�� ǥ���Ͻÿ�. ��, ��� ����� "�а� ��", "�迭" 
���� ǥ���ϵ��� ����.
*/
SELECT DEPARTMENT_NAME "�а� ��", CATEGORY "�迭"
FROM TB_DEPARTMENT;

/*
2. �а��� �а� ������ ������ ���� ���·� ȭ�鿡 �������.
*/
SELECT DEPARTMENT_NAME||'�� ������ '||CAPACITY||' �� �Դϴ�.' "�а��� ����"
FROM TB_DEPARTMENT;

/*
3. "������а�" �� �ٴϴ� ���л� �� ���� �������� ���л��� ã�ƴ޶�� ��û��
���Դ�. �����ΰ�? (�����а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ�
ã�� ������ ����)
*/
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE DEPARTMENT_NO = 001 AND SUBSTR(STUDENT_SSN, 8, 1) = 2 AND ABSENCE_YN='Y';

/*
4. ���������� ���� ���� ��� ��ü�� ���� ã�� �̸��� �Խ��ϰ��� ����. �� ����ڵ���
�й��� ������ ���� �� ����ڵ��� ã�� ������ SQL ������ �ۼ��Ͻÿ�.
*/
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN('A513079', 'A513090', 'A513091', 'A513110', 'A513119')
ORDER BY STUDENT_NAME DESC;

/*
5. ���������� 20 �� �̻� 30 �� ������ �а����� �а� �̸��� �迭�� ����Ͻÿ�.
*/
SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY BETWEEN 20 AND 30;

/*
6. �� ������б��� ������ �����ϰ� ��� �������� �Ҽ� �а��� ������ �ִ�. �׷� ��
������б� ������ �̸��� �˾Ƴ� �� �ִ� SQL ������ �ۼ��Ͻÿ�.
*/
SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;

/*
7. Ȥ�� ������� ������ �а��� �����Ǿ� ���� ���� �л��� �ִ��� Ȯ���ϰ��� ����. 
��� SQL ������ ����ϸ� �� ������ �ۼ��Ͻÿ�.
*/
SELECT *
FROM TB_STUDENT
WHERE DEPARTMENT_NO IS NULL;

/*
8. ������û�� �Ϸ��� ����. �������� ���θ� Ȯ���ؾ� �ϴµ�, ���������� �����ϴ�
������� � �������� �����ȣ�� ��ȸ�غ��ÿ�.
*/
SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

/*
9. �� ���п��� � �迭(CATEGORY)���� �ִ��� ��ȸ�غ��ÿ�.
*/
SELECT CATEGORY
FROM TB_DEPARTMENT
GROUP BY CATEGORY
ORDER BY CATEGORY;

/*
10. 02 �й� ���� �����ڵ��� ������ ������� ����. ������ ������� ������ ��������
�л����� �й�, �̸�, �ֹι�ȣ�� ����ϴ� ������ �ۼ��Ͻÿ�.
*/
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE EXTRACT(YEAR FROM ENTRANCE_DATE)='2002' AND  STUDENT_ADDRESS LIKE '%����%' AND ABSENCE_YN = 'N'
ORDER BY STUDENT_NAME;

/*
1. ������а�(�а��ڵ� 002) �л����� �й��� �̸�, ���� �⵵�� ���� �⵵�� ����
������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.( ��, ����� "�й�", "�̸�", "���г⵵" ��
ǥ�õǵ��� ����.)

*/
SELECT STUDENT_NO "�й�", STUDENT_NAME "�̸�", TO_CHAR(ENTRANCE_DATE, 'YYYY-MM-DD' ) "���г⵵"
FROM TB_STUDENT
WHERE DEPARTMENT_NO = 002
ORDER BY ENTRANCE_DATE;

/*
2. �� ������б��� ���� �� �̸��� �� ���ڰ� �ƴ� ������ �� �� �ִٰ� ����. �� ������
�̸��� �ֹι�ȣ�� ȭ�鿡 ����ϴ� SQL ������ �ۼ��� ����. (* �̶� �ùٸ��� �ۼ��� SQL 
������ ��� ���� ����� �ٸ��� ���� �� �ִ�. ������ �������� �����غ� ��)
*/
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE PROFESSOR_NAME NOT LIKE '___';

/*
3. �� ������б��� ���� �������� �̸��� ���̸� ����ϴ� SQL ������ �ۼ��Ͻÿ�. ��
�̶� ���̰� ���� ������� ���� ��� ������ ȭ�鿡 ��µǵ��� ����ÿ�. (��, ���� ��
2000 �� ���� ����ڴ� ������ ��� ����� "�����̸�", "����"�� ����. ���̴� ����������
�������.)
*/
SELECT PROFESSOR_NAME "�����̸�",  EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(PROFESSOR_SSN, 1, 2))+1900) "����"
FROM TB_PROFESSOR
WHERE SUBSTR(PROFESSOR_SSN, 8, 1) = 1
ORDER BY ����;

/*
4. �������� �̸� �� ���� ������ �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�. ��� �����
?�̸�? �� �������� ����. (���� 2 ���� ���� ������ ���ٰ� �����Ͻÿ�)
*/
SELECT SUBSTR(PROFESSOR_NAME, 2) "�̸�"
FROM TB_PROFESSOR;

/*
5. �� ������б��� ����� �����ڸ� ���Ϸ��� ����. ��� ã�Ƴ� ���ΰ�? �̶�, 
19 �쿡 �����ϸ� ����� ���� ���� ������ �A������.
*/
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE EXTRACT(YEAR FROM ENTRANCE_DATE) -1900 - SUBSTR(STUDENT_SSN,1,2) > 19;

/*
6. 2020 �� ũ���������� ���� �����ΰ�?
*/
SELECT TO_CHAR(TO_DATE('2020/12/25'), 'DAY')
FROM DUAL;

/*
7. TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD') �� ���� �� �� ��
�� �� ���� �ǹ�����? �� TO_DATE('99/10/11','RR/MM/DD'), 
TO_DATE('49/10/11','RR/MM/DD') �� ���� �� �� �� �� �� ���� �ǹ�����
*/
SELECT TO_CHAR(TO_DATE('99/10/11', 'YY/MM/DD'), 'YYYY') FROM DUAL;
SELECT TO_CHAR(TO_DATE('49/10/11','YY/MM/DD'), 'YYYY') FROM DUAL;
SELECT TO_CHAR(TO_DATE('99/10/11','RR/MM/DD'), 'YYYY/MM/DD') FROM DUAL;
SELECT TO_CHAR(TO_DATE('49/10/11','RR/MM/DD'), 'YYYY/MM/DD') FROM DUAL;

/*
8. �� ������б��� 2000 �⵵ ���� �����ڵ��� �й��� A �� �����ϰ� �Ǿ��ִ�. 2000 �⵵
�̠� �й��� ���� �л����� �й��� �̸��� �����ִ� SQL ������ �ۼ��Ͻÿ�.
*/
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO NOT LIKE 'A%';

/*
9. �й��� A517178 �� ���Ƹ� �л��� ���� �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. ��,
�̶� ��� ȭ���� ����� "����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ� �Ҽ��� ���� ��
�ڸ������� ǥ������.
*/
SELECT ROUND(AVG(POINT), 1) "����"
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178';

/*
10. �а��� �л����� ���Ͽ� "�а���ȣ", "�л���(��)" �� ���·� ����� ����� �������
��µǵ��� �Ͻÿ�.
*/
SELECT DEPARTMENT_NO "�а���ȣ", COUNT(*) "�л���(��)"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY �а���ȣ;

/*
11. ���� ������ �������� ���� �л��� ���� �� �� ���� �Ǵ� �˾Ƴ��� SQL ����
�ۼ��Ͻÿ�.
*/
SELECT COUNT(*)
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL;

/*
12. �й��� A112113 �� ���� �л��� �⵵ �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. ��, 
�̶� ��� ȭ���� ����� "�⵵", "�⵵ �� ����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ�
�Ҽ��� ���� �� �ڸ������� ǥ������.
*/
SELECT SUBSTR(TERM_NO, 1, 4) "�⵵", ROUND(AVG(POINT), 1) "�⵵ �� ����"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO, 1, 4);

/*
13. �а� �� ���л� ���� �ľ��ϰ��� ����. �а� ��ȣ�� ���л� ���� ǥ���ϴ� SQL ������
�ۼ��Ͻÿ�.
*/
SELECT DEPARTMENT_NO "�а��ڵ��", COUNT(DECODE(ABSENCE_YN, 'Y', 1, NULL)) "���л� ��"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY DEPARTMENT_NO;

/*
14. �� ���б��� �ٴϴ� ��������(��٣���) �л����� �̸��� ã���� ����. � SQL 
������ ����ϸ� �����ϰڴ°�?
*/
SELECT STUDENT_NAME "�����̸�", COUNT(*) "������ ��"
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(*)>=2
ORDER BY STUDENT_NAME;

/*
15. �й��� A112113 �� ���� �л��� �⵵, �б� �� ������ �⵵ �� ���� ���� , ��
������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. (��, ������ �Ҽ��� 1 �ڸ������� �ݿø��Ͽ� ǥ������.
*/
SELECT SUBSTR(TERM_NO, 1, 4) "�⵵", SUBSTR(TERM_NO, 5, 2) "�б�", ROUND( AVG(POINT), 1) "����"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY ROLLUP(SUBSTR(TERM_NO, 1, 4), SUBSTR(TERM_NO, 5, 2))
ORDER BY 1, 2;

/*
[Additional SELECT - Option]

1. �л��̸��� �ּ����� ǥ���Ͻÿ�. ��, ��� ����� "�л� �̸�", "�ּ���"�� �ϰ�,
������ �̸����� �������� ǥ���ϵ��� ����.
*/
SELECT STUDENT_NAME "�л� �̸�", STUDENT_ADDRESS "�ּ���"
FROM TB_STUDENT
ORDER BY 1;

/*
2. �������� �л����� �̸��� �ֹι�ȣ�� ���̰� ���� ������ ȭ�鿡 ����Ͻÿ�.
*/
SELECT STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY STUDENT_SSN DESC;

/*
3. �ּ����� �������� ��⵵�� �л��� �� 1900 ��� �й��� ���� �л����� �̸��� �й�, 
�ּҸ� �̸��� ������������ ȭ�鿡 ����Ͻÿ�. ��, ���������� "�л��̸�","�й�",
"������ �ּ�" �� ��µǵ��� ����.
*/
SELECT STUDENT_NAME "�л��̸�", STUDENT_NO "�й�", STUDENT_ADDRESS "������ �ּ�"
FROM TB_STUDENT
WHERE (STUDENT_ADDRESS LIKE '����%' OR STUDENT_ADDRESS LIKE '���%' )
AND (STUDENT_NO NOT LIKE 'A%')
ORDER BY 1;

/*
4. ���� ���а� ���� �� ���� ���̰� ���� ������� �̸��� Ȯ���� �� �ִ� SQL ������
�ۼ��Ͻÿ�. (���а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã��
������ ����)
*/
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO = 005
ORDER BY PROFESSOR_SSN;

/*
5. 2004 �� 2 �б⿡ 'C3118100' ������ ������ �л����� ������ ��ȸ�Ϸ��� ����. ������
���� �л����� ǥ���ϰ�, ������ ������ �й��� ���� �л����� ǥ���ϴ� ������
�ۼ��غ��ÿ�.
*/
SELECT STUDENT_NO, POINT
FROM TB_GRADE
WHERE TERM_NO = 200402  AND CLASS_NO = 'C3118100'
ORDER BY 2 DESC, 1;

/*
6. �л� ��ȣ, �л� �̸�, �а� �̸��� �л� �̸����� �������� �����Ͽ� ����ϴ� SQL 
���� �ۼ��Ͻÿ�.
*/
SELECT STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
FROM TB_STUDENT
    JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
ORDER BY 2;

/*
7. �� ������б��� ���� �̸��� ������ �а� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
*/
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO);
    
/*
8. ���� ���� �̸��� ã������ ����. ���� �̸��� ���� �̸��� ����ϴ� SQL ����
�ۼ��Ͻÿ�.
*/
/* �̷����ϸ� �� �ȵǴ��� �ɱ� �ָ��ϱ��ϳ׿�
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS
    JOIN TB_PROFESSOR USING ( DEPARTMENT_NO);
*/
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS
    JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
    JOIN TB_PROFESSOR USING (PROFESSOR_NO);

/*
9. 8 ���� ��� �� ���ι���ȸ�� �迭�� ���� ������ ���� �̸��� ã������ ����. �̿�
�ش��ϴ� ���� �̸��� ���� �̸��� ����ϴ� SQL ���� �ۼ��Ͻÿ�.
*/
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS C
    JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
    JOIN TB_PROFESSOR USING (PROFESSOR_NO)
    JOIN TB_DEPARTMENT D ON (C.DEPARTMENT_NO = D.DEPARTMENT_NO)
WHERE CATEGORY = '�ι���ȸ';

/*
10. �������а��� �л����� ������ ���Ϸ��� ����. �����а� �л����� "�й�", "�л� �̸�", 
"��ü ����"�� ����ϴ� SQL ������ �ۼ��Ͻÿ�. (��, ������ �Ҽ��� 1 �ڸ�������
�ݿø��Ͽ� ǥ������.)
*/
SELECT STUDENT_NO "�й�", STUDENT_NAME "�л� �̸�", ROUND(AVG(POINT), 1) "����"
FROM TB_STUDENT
    JOIN TB_GRADE USING (STUDENT_NO)
    JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '�����а�'
GROUP BY STUDENT_NO, STUDENT_NAME;

/*
11. �й��� A313047 �� �л��� �б��� ������ ���� �ʴ�. ���� �������� ������ �����ϱ�
���� �а� �̸�, �л� �̸��� ���� ���� �̸��� �ʿ��ϴ�. �̶� ����� SQL ����
�ۼ��Ͻÿ�. ��, �������� ?�а��̸�?, ?�л��̸�?, ?���������̸�?����
��µǵ��� ����.
*/
SELECT DEPARTMENT_NAME "�а��̸�", STUDENT_NAME "�л��̸�", PROFESSOR_NAME "���������̸�"
FROM TB_DEPARTMENT
    JOIN TB_STUDENT USING (DEPARTMENT_NO)
    JOIN TB_PROFESSOR ON(PROFESSOR_NO = COACH_PROFESSOR_NO)
WHERE STUDENT_NO = 'A313047';

/*
12. 2007 �⵵�� '�΁A�����' ������ ������ �л��� ã�� �л��̸��� �����б⸧ ǥ���ϴ�
SQL ������ �ۼ��Ͻÿ�.
*/
SELECT STUDENT_NAME, TERM_NO
FROM TB_STUDENT
    JOIN TB_GRADE USING(STUDENT_NO)
    JOIN TB_CLASS USING(CLASS_NO)
WHERE TERM_NO LIKE '2007%' AND CLASS_NAME = '�ΰ������';

/*
13. ��ü�� �迭 ���� �� ���� ��米���� �� �� �������� ���� ������ ã�� �� ����
�̸��� �а� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
*/
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
    JOIN TB_CLASS_PROFESSOR  USING(CLASS_NO)
WHERE CATEGORY = '��ü��'