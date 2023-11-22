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
SHOW GRANTS FOR 'root'@'localhost';
DROP USER 'testuser'@'localhost';


CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'testpw';
GRANT SELECT ON board.author TO'testuser'@'localhost';
REVOKE SELECT ON board.author FROM 'testuser'@'localhost';

FLUSH PRIVILEGES;       
SHOW GRANTS FOR 'testuser'@'localhost';



-- view

    뷰(view)는 데이터베이스의 테이블과 유사한 구조를 가지지만,
    가상의 테이블로서 실제 데이터를 저장하지 않는 데티어 베이스 실제 데이터 베이스를 참조만 한다. 

    CREATE VIEW 뷰네임 AS
    SELECT 컬럼1, 컬럼 2
    FROM 테이블명.