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