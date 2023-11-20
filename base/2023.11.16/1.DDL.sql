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



/
-- DDL - CREATE 
테이블 생성

    CREATE TABLE 테이블이름
    (
        필드이름1 필드타입1 [제약조건]
        필드이름2 필드타입2 [제약조건]
        [테이블 제약조건]
    )


-- 테이블 이름 변경
--  ALTER TABLE 테이블명 RENAME 새로운 테이블명



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

ALTER TABLE author MODIFY COLUMN name varchar(100) not null;
