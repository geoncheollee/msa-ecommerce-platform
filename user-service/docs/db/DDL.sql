/* 데이터베이스 확인 */
SHOW DATABASES;

/* 데이터베이스 생성 */
CREATE DATABASE msa_ecommerce_user_service;

/* 아이디 생성 */
CREATE USER 'user'@'%' IDENTIFIED BY 'user';

/* 사용자 권한 주기 */
GRANT ALL PRIVILEGES ON msa_ecommerce_user_service.* TO 'user'@'%';

/* 사용자 권한 추가 후 새로고침 */
FLUSH PRIVILEGES;


/* user 테이블 생성 */
CREATE TABLE `user` (
    user_identifier     BIGINT          NOT NULL AUTO_INCREMENT COMMENT '회원 식별자',
    email               VARCHAR(255)    NOT NULL UNIQUE COMMENT '이메일 주소',
    password            VARCHAR(255)    NOT NULL COMMENT '암호화된 비밀번호',
    nickname            VARCHAR(100)    NOT NULL COMMENT '닉네임',
    role                VARCHAR(20)     NOT NULL COMMENT '사용자 권한 (USER, ADMIN)',
    status              VARCHAR(20)     NOT NULL COMMENT '계정 상태 (ACTIVE, INACTIVE, WITHDRAWN)',
    created_date_time   DATETIME(6)     NOT NULL COMMENT '가입 시각',
    updated_date_time   DATETIME(6)     DEFAULT NULL COMMENT '수정 시각',
    
    PRIMARY KEY (user_identifier)
) ENGINE=InnoDB 
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_general_ci;
