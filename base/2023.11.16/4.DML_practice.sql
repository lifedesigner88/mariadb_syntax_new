INSERT INTO author(id,name,email) values(2,'park','park@naver.com');
INSERT INTO author(id,name,email) values(3,'se','se@naver.com');
INSERT INTO author(id,name,email) values(4,'jong','ab3@gamil.com');
INSERT INTO author(id,name,email) values(5,'lee','abc33@naver.com');
INSERT INTO author(id,name,email) values(6,'hee','우리나라abc@naver.com');


INSERT INTO post(id, title, content, author_id) values(1, '바람과', '사라지다', 2);
INSERT INTO post(id, title, content, author_id) values(2, '이바람이', '감사지다', 5);
INSERT INTO post(id, title, content, author_id) values(2, '이바람이', '감사지다', 20); 


-- 에러
INSERT INTO post(id, title, content) values(4, '이바람이', '감사지다');

select*from author



-- Power shell
mariadb -u root -p
show databases;
use board;
show tables;
describe author;
describe post;



-- 방법 1
delete from post where id=1;
delete from post where author_id=2;
UPDATE post set author_id=null WHERE author_id IS NOT NULL;



-- 방법 2
UPDATE post set author_id = null where author_id =2;
delete from author where id =2; 

DELETE 내용지우고 백업, 로그 남긴다. 그래서 좀 느리다.
TRUNCATE 바로 지워버린다 내용을
DROP    다 지워진다. 



-- DML --SELECT
SELECT name from [테이블이름][WHERE 조건];
SELECT * FROM author;

예제,
    select * from author where id =1;
    select name, email from author where id=1;
    select * from author where id > 10 and name ='abc';
    select * from authro where id > 1 and name ='kim';

