-- ����� ������ �߰����ּ���. (����ڸ�: TESTUSER / ��й�ȣ: 1234)
-- * �ݵ�� ������ �������� �߰� ���� *
CREATE USER C##TESTUSER IDENTIFIED BY 1234; -- ����� ���� �߰�
GRANT CONNECT, RESOURCE TO C##TESTUSER; -- ����� ������ ���� �ο�
                                                                                                                -- �ּ����� ���� : CONNECT(����), RESOURCE(�ڿ�����)
                                                                                                                
ALTER USER C##TESTUSER DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;                                   