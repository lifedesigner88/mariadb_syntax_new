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


SELECT * FROM author WHERE name ='sejng' OR email = '@nl';
SELECT * FROM author WHERE name ='sejng' AND email = '@nl';


