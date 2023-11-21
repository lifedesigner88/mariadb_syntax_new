-- 데이터 베이스 시작.
mariadb -u root -p      //p는 패스워드 생략  
show databases;


-- 데이터 베이스 생성
CREATE DATABASE board;


-- 데이터 베이스 선택
USE board;


-- author 테이블 신규 생성
CREATE TABLE author(
    id          INT,
    name        VARCHAR(255),
    email       VARCHAR(255), 
    password    VARCHAR(255), 
    test1       VARCHAR(255), 

    PRIMARY     KEY(id)
    );

-- 테이블 목록 조회
SHOW TABLES;

-- 테이블 생성문 조회
SHOW CREATE TABLE author;

CREATE TABLE `author` (
   `id`             int(11)                 NOT NULL,
   `name`           varchar(100)            NOT NULL,
   `email`          varchar(255)                        DEFAULT NULL,
   `password`       varchar(255)                        DEFAULT NULL,
   `role`           enum('user','admin')    NOT NULL    DEFAULT 'user',
   `address`        varchar(255)                        DEFAULT NULL,
   `age`            tinyint(3) unsigned                 DEFAULT NULL,
   PRIMARY KEY (`id`),
   UNIQUE KEY `email_unique` (`email`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci



-- 테이블 조회
DESCRIBE author;

-- 테이블 삭제
DROP TABLE posts;


-- post 테이블 신규생성
CREATE TABLE post(
    id          INT PRIMARY KEY,
    title       VARCHAR(255),
    content     VARCHAR(255),
    author_id   INT,

    FOREIGN     KEY(author_id)  REFERENCES author(id)
    );

-- 테이블 생성문 조회
SHOW CREATE TABLE author;

CREATE TABLE `post` (
   `id`             int(11)         NOT NULL    AUTO_INCREMENT,
   `title`          varchar(255)    NOT NULL,
   `contents`       varchar(3000)               DEFAULT NULL,
   `author_id`      int(11)                     DEFAULT NULL,
   `price`          decimal(10,3)               DEFAULT NULL,
   `created_time`   datetime(6)                 DEFAULT current_timestamp(6),
   PRIMARY KEY (`id`),
   KEY `post_update` (`author_id`),
   CONSTRAINT `post_update` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON UPDATE SET NULL
 ) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci


-- 테이블 컬럼 상세조회
SHOW FULL COLUMNS FROM author;


-- 테이블 제약조건 조회 
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME = 'post';


-- 테이블 index 조회
SHOW INDEX FROM post;


-- ALTER(테이블열 수정)




ALTER TABLE author RENAME authors;  // 테이블 이름 변경
ALTER TABLE author MODIFY   COLUMN name VARCHAR(100) NOT NULL  
ALTER TABLE author ADD      COLUMN role VARCHAR(50)
ALTER TABLE author DROP     COLUMN TEST    
ALTER TABLE author CHANGE   COLUMN TEST1 TEST   VARCHAR(100)  NOT NULL      
                                         


CREATE TABLE `author` (
   `id` int(11) NOT NULL,
   `name` varchar(100) NOT NULL,
   `email` varchar(255) DEFAULT NULL,
   `password` varchar(255) DEFAULT NULL,
   `role` varchar(50) DEFAULT NULL,
   `address` varchar(255) DEFAULT NULL,
   PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci


CREATE TABLE `post` (
   `id`         int(11) NOT NULL,
   `title`      varchar(255) DEFAULT NULL,
   `content`    varchar(3000) DEFAULT NULL,
   `author_id`  int(11) DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY  `author_id` (`author_id`),
   CONSTRAINT `post_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci


-- 삭제
DROP TABLE POST;



INSERT INTO author(id, name, email) values(1, 'kim', 'abc@naver.com')
select * from author;       // 보기.



SELECT * FROM AUTHOR;
DESCRIBE author;
CREATE TABLE post(
	id			int		primary KEY,
    title		varchar(255),
    contents	varchar(3000),
    author_id	int,
    
    foreign key(author_id)
    REFERENCES AUTHOR(id)
    );
DESCRIBE post;

