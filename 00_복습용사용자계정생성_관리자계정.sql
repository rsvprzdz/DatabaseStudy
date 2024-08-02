-- 사용자 계정을 추가해주세요. (사용자명: TESTUSER / 비밀번호: 1234)
-- * 반드시 관리자 계정으만 추가 가능 *
CREATE USER C##TESTUSER IDENTIFIED BY 1234; -- 사용자 계정 추가
GRANT CONNECT, RESOURCE TO C##TESTUSER; -- 사용자 계정에 권한 부여
                                                                                                                -- 최소한의 권한 : CONNECT(접속), RESOURCE(자원관리)
                                                                                                                
ALTER USER C##TESTUSER DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;                                   