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




ALTER TABLE author ADD COLUMN age tinyint UNSIGNED;
ALTER TABLE author DROP COLUMN age;
INSERT  INTO author (id, name, email, password, role, address, age) 
        VALUE       (1, 'sejong', '@nl', 123, '12344', 'dd',123);

ALTER TABLE post ADD COLUMN price DECIMAL(10,3);
DESCRIBE POST;

INSERT INTO post(id, title, price) value(6, 'djkd', 3.123141231);
INSERT INTO post(id, title, price) value(9, 'djkd', 1234567.123);
UPDATE post set price=1234.1 WHERE id=6;