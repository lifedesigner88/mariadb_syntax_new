mariadb -u root -p      //p는 패스워드 생략  
show databases;



-- 데이터 베이스 생성
CREATE DATABASE board;


-- 데이터 베이스 선택
USE board;


-- author 테이블 신규 생성
CREATE TABLE authors(
    id          INT,
    name        VARCHAR(255),
    email       VARCHAR(255), 
    password    VARCHAR(255), 
    test1       VARCHAR(255), 

    PRIMARY     KEY(id)
    );


-- 테이블 목록 조회
SHOW TABLES;


-- 테이블 조회
DESCRIBE author;

-- 테이블 삭제
DROP TABLE posts;


-- post 테이블 신규생성
CREATE TABLE posts(
    id          INT PRIMARY KEY,
    title       VARCHAR(255),
    content     VARCHAR(255),
    author_id   INT,

    FOREIGN     KEY(author_id)  REFERENCES author(id)
    );

-- 테이블 컬럼 상세조회
SHOW FULL COLUMNS FROM author;


-- 테이블 생성문 조회
SHOW CREATE TABLE posts;



-- 테이블 제약조건 조회 
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME = 'posts';


-- 테이블 index 조회
SHOW INDEX FROM posts;


-- DDL - CREATE 

-- 테이블 이름 변경
 ALTER TABLE 테이블명 RENAME 새로운 테이블명



--  컬럼 추가 (ADD)
--     ALTER TABLE 테이블명 ADD COLUMN 컬럼명 자료형 [NULL 또는 NOTNULL]
--     ALTER TABLE author  ADD COLUMN c




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



-- 제약조건(CONSTRAINT) 검색.
show create table post;

CREATE TABLE `post` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `title` varchar(255) NOT NULL,
   `contents` varchar(3000) DEFAULT NULL,
   `author_id` int(11) DEFAULT NULL,
   `price` decimal(10,3) DEFAULT NULL,
   `created_time` datetime(6) DEFAULT current_timestamp(6),


   PRIMARY KEY (`id`),
   KEY `post_update` (`author_id`),
   CONSTRAINT `post_update` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON UPDATE SET NULL
 ) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci




CREATE TABLE `author` (
   `id` int(11) NOT NULL,
   `name` varchar(100) NOT NULL,
   `email` varchar(255) DEFAULT NULL,
   `password` varchar(255) DEFAULT NULL,
   `role` enum('user','admin') NOT NULL DEFAULT 'user',
   `address` varchar(255) DEFAULT NULL,
   `age` tinyint(3) unsigned DEFAULT NULL,
   PRIMARY KEY (`id`),
   UNIQUE KEY `email_unique` (`email`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci




-- 제약조건(CONSTRAINT) 검색.
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME='post';
ALTER TABLE post DROP FOREIGN KEY post_update;
ALTER TABLE post DROP INDEX author_id;

ALTER TABLE post ADD CONSTRAINT post_update FOREIGN KEY(author_id) REFERENCES author(id) ON UPDATE SET NULL;

show index from post;
show create table post;

DESCRIBE post;
SELECT * FROM post;
SELECT * FROM author;

SHOW FULL COLUMNS FROM post;



-- DEFAULT
CREATE TABLE Test (
    id      INT;
    Name    varchar(30) DEFAULT 'Anonymous'    
)



-- 흐름제어

CASE value
    WHEN [compare_value1] THEN result1
    WHEN [compare_value2] THEN result2...
    ELSE result3
END


