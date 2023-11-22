-- 사설 IP ,공인 IP 어떤 전략을 써야 하는지 고민해 보아라. 
-- join group by 
-- 쿼리 기반 프로젝트 ORM 기반 데티어 베이스 


VARCHAR     ->  B-TREE INDEX 
TEXT        ->  FULL TEXT INDEX

index 걸면 걸지 않은 것에 비해, 조회속도는 올라가지만 삽입 속도는 느려진다. 
카디널리티,

=> 내가 직접 INEDX를 만들 때, 



SHOW INDEX FROM author;
SHOW INDEX FROM post;


CREATE INDEX index_name ON author(name);
CREATE INDEX index_name ON author(name, email);


SELECT * FROM author WHERE name ='sejng';
SELECT * FROM author WHERE name ='sejng' AND email = '@nl';



-- 사용자 관리

SELECT * FROM mysql.user;
CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'testpw';
GRANT SELECT ON board.author TO'testuser'@'localhost';
REVOKE SELECT ON board.author FROM 'testuser'@'localhost';

FLUSH PRIVILEGES;       
SHOW GRANTS FOR 'testuser'@'localhost';
DROP USER 'testuser'@'localhost';
SHOW GRANTS FOR 'root'@'localhost';



-- view

CREATE VIEW author_for_view AS
SELECT      name, email
FROM        author;
SELECT * FROM author_for_view;


SELECT * FROM mysql.user;
CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'testpw';
GRANT SELECT ON board.author_for_view TO 'testuser'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'testuser'@'localhost';




-- 저장 프로시져 (절차를 저장해 둔다.)

STORED PROCEDURE


DELIMITER $$
CREATE PROCEDURE getUser(IN userId INT)
BEGIN
    SELECT *
    FROM author
    WHERE ID = userId;
END $$
DELIMITER ;


CALL getUser(1);

-- 

DELIMITER //
CREATE PROCEDURE getUser2(IN userId INT)
BEGIN
    SELECT *
    FROM author
    WHERE ID = userId;
END //
DELIMITER ;

CALL getUser2(1);

-- 

GRANT EXCUTE ON board.author_for_view TO 'testuser'@'localhost';
SHOW CREATE PROCEDURE getUser;


-- 다중 PROCEDURE
DELIMITER //
CREATE PROCEDURE setPost2(IN title VARCHAR(255), IN contents VARCHAR(3000), IN author_id INT)
BEGIN
    INSERT INTO post(title, contents, author_id)
    VALUE(title, contents, author_id);
END //
DELIMITER ;
CALL setPost2('DSDFA','SEJONGG',4);




-- 변수
DECLARE 변수명 변수타입 [DEFAULT default_value]
select 컬럼명 into 변수 


SET 변수명 = 수정값

제어문

IF 조건식 THEN
    --
ELSE
    --
END IF
select 컬럼명 into 변수 



WHILE 조건식 DO
  -- 조건이 참일 도안 반복 실행할 명령
END WHILE





 -- if, value, 
DELIMITER //
CREATE PROCEDURE searchAuthor(IN in_author_id INT)
BEGIN
	DECLARE valPrice INT DEFAULT 0;
    SELECT avg(price) into valPrice FROM post WHERE author_id = in_author_id; 
	IF valprice is null THEN
		SELECT valPrice as averagePrice , '글이 없는 작가입니다' as message;
    ELSEIF valPrice > 4000 THEN
		SELECT valPrice as averagePrice , '고액 원고료 작가입니다.' as message;
	ELSE
		SELECT valPrice  as averagePrice , '고액 원고료 작가가 아닙니다.' as message;        
    END IF;
END //
DELIMITER ;
CALL searchAuthor(2);



 -- while, concat
DELIMITER //
CREATE PROCEDURE dataInsert100()
BEGIN
	DECLARE a INT DEFAULT 0;
    WHILE A < 100 DO
		INSERT INTO post(title) value(concat('hello ',a));
        SET A = A + 1;
    END WHILE;
END //
DELIMITER ;
CALL dataInsert100();


-- Dump

mysqldump -u [user]



mysqldump -u root -p --default-character-set=utf8mb4 board > dumpfile.sql