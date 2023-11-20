-- 회원 데이터 입력
INSERT INTO author  (id, name, email, password, role, address) 
            VALUE   (1, 'SEJONG', 'SEJONG@GMAIL.COM', 123, 'LAEDER', 'SEOUL');
INSERT INTO author  (id, name, email, password, role, address) 
            VALUE   (2, 'abSEJONG', '4SEJONG@GMAIL.COM', 123, 'LAEDER', 'SEOUL');
INSERT INTO author  (id, name, email, password, role, address) 
            VALUE   (3, 'cde', 'qwqONG@naver.COM', 123, 'LAEDER', 'SEOUL');
INSERT INTO author  (id, name, email, password, role, address)
            VALUE   (4, 'fge', 'dddG@GMAIL.COM', 123, 'LAEDER', 'SEOUL');
INSERT INTO author  (id, name, email, password, role, address) 
            VALUE   (5, 'adfNG', 'adfNG@GMAIL.COM', 123, 'LAEDER', 'SEOUL');


-- 게시글 데이터 입력
INSERT INTO post    (id, title, contents, author_id) 
            VALUE   (1, 'GOOD', '2ASDKFJASLDFJ...', 4);
INSERT INTO post    (id, title, contents, author_id) 
            VALUE   (2, '12GOOD', 'aasdfD KFJASLDFJ...', null);
INSERT INTO post    (id, title, contents, author_id) 
            VALUE   (3, 'ddfaaD', 'jaki a123...', null);
INSERT INTO post    (id, title, contents, author_id) 
            VALUE   (4, 'GOOD', '1ASDKFJASLDFJ...', NULL);
INSERT INTO post    (id, title, contents, author_id) 
       VALUE        (5, 'GOOD', '4ASDKFJASLDFJ...', NULL);

-- 회원을 삭제하기 위해 게시글 작성자가 있는 db를 NULL 로 변경
UPDATE post set author_id=null WHERE author_id IS NOT NULL;



-- 회원 모두 삭제
DELETE FROM author;



SELECT * FROM post order by title ASC, contents DESC limit 2;

SELECT * FROM author;
SELECT * FROM post;

DESCRIBE POST;
DESCRIBE AUTHOR;

DELETE FROM post WHERE id = 11;




ALTER TABLE author ADD COLUMN age tinyint UNSIGNED;
ALTER TABLE author DROP COLUMN age;
INSERT  INTO author (id, name, email, password, role, address, age) 
        VALUE       (1, 'sejong', '@nl', 123, '12344', 'dd',123);

ALTER TABLE post ADD COLUMN price DECIMAL(10,3);
DESCRIBE POST;

INSERT INTO post(id, title, price) value(6, 'djkd', 3.123141231);
INSERT INTO post(id, title, price) value(9, 'djkd', 1234567.123);
UPDATE post set price=1234.1 WHERE id=6;


CREATE TABLE table_blob(id int, myimg longblob);
DESCRIBE table_blob;
SELECT * FROM table_blob;
DROP TABLE table_blob;
INSERT INTO table_blob(id, myimg) VALUES(3, LOAD_FILE('C:\\test_picture.jpg'));

DESCRIBE author;
SELECT * FROM author;
UPDATE author set role='user' WHERE id=1;
INSERT 	INTO author	(id, name, email, password, role, address, age) 
		value		(3, 'ser', '23@', 113124, 'user',	'adfasf', 33);

INSERT 	INTO author	(id, name, email, password, address, age) 
		value		(4, 'ser', '23@', 113124, 'adfasf', 33);

ALTER TABLE author MODIFY COLUMN role ENUM('user','admin') NOT NULL DEFAULT 'user';



-- 시간실습 // 생성일자 컬럼 항상 들어간다. 
ALTER TABLE post ADD COLUMN created_time datetime(6) default current_timestamp(6);


-- 논리 연산자 (2~4)
SELECT * FROM post WHERE id BETWEEN 2 AND 4;
SELECT * FROM post WHERE id >= 2 AND id <= 4;
SELECT * FROM post WHERE NOT(id < 2 OR id > 4);



-- LIKE 포함 비 포함. 
SELECT * FROM author WHERE name LIKE '%G';
SELECT * FROM author WHERE name LIKE 's%';
SELECT * FROM author WHERE name LIKE '1%';

SELECT * FROM author WHERE name NOT LIKE '%G';
SELECT * FROM author WHERE name NOT LIKE 's%';
SELECT * FROM author WHERE name NOT LIKE '1%';






-- // 정렬, 데이터 포멧 변경. 
SELECT  BOOK_ID, 
        DATE_FORMAT(PUBLISHED_DATE , '%Y-%m-%d') AS PUBLISHED_DATE FROM BOOK 
        WHERE CATEGORY = '인문' AND DATE_FORMAT(PUBLISHED_DATE , '%Y') ='2021' 
        ORDER BY PUBLISHED_DATE ASC;



SELECT  BOOK_ID, 
        DATE_FORMAT(PUBLISHED_DATE , '%Y-%m-%d') AS PUBLISHED_DATE FROM BOOK 
        WHERE CATEGORY = '인문' AND PUBLISHED_DATE LIKE '2021%' 
        ORDER BY PUBLISHED_DATE ASC;

        
SELECT  BOOK_ID, 
        DATE_FORMAT(PUBLISHED_DATE , '%Y-%m-%d') AS PUBLISHED_DATE FROM BOOK 
        WHERE CATEGORY = '인문' AND PUBLISHED_DATE BEETWEEN ''
        ORDER BY PUBLISHED_DATE ASC;


SELECT * FROM post WHERE date_format(create_time, ) = 


UNIQUE
필드이름, 필드 타입,..., [CONSTRAINT 제약조건 이름] UNIQUE;