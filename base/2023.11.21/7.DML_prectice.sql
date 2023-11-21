-- 동시성 문제. 어떻게 해결했는가? 


-- INNER join
SELECT * FROM author INNER JOIN post ON author.id = post.author_id;

SELECT * FROM author AS a INNER JOIN post AS p ON a.id = p.author_id;

SELECT a.title, p.name FROM post a INNER JOIN author p ON a.author_id = p.id ;


// ON 조건은 교집합.  


-- OUTER join
LEFT OUTER JOIN
RIGHT OUTER JOIN


SELECT * FROM author a LEFT OUTER JOIN post p ON a.id = p.author_id;
SELECT p.title, a.name FROM post p LEFT OUTER JOIN author a ON a.id = p.author_id;


SELECT  if(a.name is null, 'no name',a.name) as name, p.title 
FROM post p LEFT OUTER JOIN author a ON a.id = p.author_id;


SELECT a.name, p.title 
FROM post AS P INNER JOIN author AS a ON a.id = p.author_id;


SELECT a.name, a.age, p.title 
FROM post AS P RIGHT OUTER JOIN author AS a ON a.id = p.author_id 
WHERE a.age > 25 ORDER BY a.age;



-- 없어진 기록 찾기
SELECT O.ANIMAL_ID, O.NAME 
FROM ANIMAL_INS AS I RIGHT OUTER JOIN ANIMAL_OUTS AS O
ON I.ANIMAL_ID = O.ANIMAL_ID WHERE I.DATETIME IS NULL;
-- 없어진 기록 / 2번쨰 풀이 (연구해 봐야함.)
SELECT O.ANIMAL_ID, O.NAME
WHERE
NOT IN(
SELECT O.ANIMAL_ID FROM ANIMAL_OUTS AS O INNER JOIN ANIMAL_INS AS I
    ON O.ANIMAL_ID = I.ANIMAL_ID
) ORDER BY ANIMAL_ID; ??



-- 조건에 맞는 도서와 저자 리스트 출력
SELECT B.BOOK_ID, A.AUTHOR_NAME, DATE_FORMAT(B.PUBLISHED_DATE,'%Y-%m-%d') AS PUBLISHED_DATE
FROM BOOK AS B INNER JOIN AUTHOR AS A 
ON B.AUTHOR_ID = A.AUTHOR_ID
WHERE B.CATEGORY = '경제'
ORDER BY B.PUBLISHED_DATE



-- UNION 가로로 붙인다. (데이터를 추가)
SELECT 컬럼 1, 컬럼 2 FROM TABLE1 UNION SELECT 컬럼 1, 컬럼 2 FROM TABLE2;
SELECT name, email FROM author UNION SELECT title, contents FROM post;

UNION       중복.
UNION ALL 은 중복한것도 같이 표시



--- 서브쿼리. 

- SELECT a.* FROM author a INNER JOIN post p ON a.id = p.author_id;
- SELECT a.* FROM author a WHERE a.ID IN (SELECT p.author_id FROM post p);




-- GROUP BY
SELECT COUNT(*) FROM author;        /// 행의 갯수 
SELECT COUNT(*) FROM post;

round(대상값, 소수점 자리수)        // 소수점

SELECT author_id, sum(price), round(avg(price),0) FROM post GROUP BY author_id;


SELECT author_id, count(price), sum(price), round(avg(price),0), min(price), max(price) 
FROM post GROUP BY author_id;


SELECT author_id, count(author_id), sum(price), round(avg(price),0)  
FROM post GROUP BY author_id;



-- HAVING
SELECT author_id, count(price), max(price), min(price), round(avg(price),0)  
FROM post WHERE price > 3000 GROUP BY author_id;


-- HAVING
SELECT author_id, count(price), max(price), min(price), round(avg(price),0) 
FROM post GROUP BY author_id HAVING avg(price) >= 4000;



-- 입양 시각 구하기(1)
SELECT CAST(DATE_FORMAT(DATETIME,'%H') as unsigned) AS HOUR, COUNT(DATETIME) AS COUNT
FROM ANIMAL_OUTS
WHERE DATE_FORMAT(DATETIME,'%H:%i') BETWEEN'09:00' AND '20:00'
GROUP BY DATE_FORMAT(DATETIME,'%H') ORDER BY HOUR ;



-- 성분으로 구분한 아이스크림 총 주문량
SELECT INGREDIENT_TYPE, SUM(TOTAL_ORDER) AS TOTAL_ORDER
FROM ICECREAM_INFO AS I LEFT OUTER JOIN FIRST_HALF AS H 
ON I.FLAVOR = H.FLAVOR GROUP BY INGREDIENT_TYPE ORDER BY TOTAL_ORDER ASC



-- UNION - RECULSIVE

-- 자동차 종류 별 특정 옵션이 포함된
SELECT CAR_TYPE, COUNT(*) AS CARS
FROM CAR_RENTAL_COMPANY_CAR 
WHERE OPTIONS REGEXP '통풍시트|열선시트|가죽시트'
GROUP BY CAR_TYPE ORDER BY CAR_TYPE;




SELECT CAR_TYPE, COUNT(*) AS CARS
FROM CAR_RENTAL_COMPANY_CAR 
WHERE OPTIONS LIKE '%통풍시트%' OR OPTIONS LIKE '%열선시트%' OR OPTIONS LIKE '%가죽시트%'
GROUP BY CAR_TYPE ORDER BY CAR_TYPE;




-- 재구매가 일어난 상품과 회원 리스트 구하기
SELECT USER_ID , PRODUCT_ID
FROM            ONLINE_SALE 
GROUP BY        USER_ID, PRODUCT_ID 
HAVING          COUNT(*)>= 2 
ORDER BY        USER_ID, PRODUCT_ID DESC;




-- 	입양 시각 구하기(2)








-- 재귀함수. 

WITH RECURSIVE number_sequence(hour) as (
    SELECT 0
    UNION ALL
    SELECT HOUR + 1 FROM number_sequence WHERE HOUR < 23
)
SELECT HOUR, 0 AS COUNT from number_sequence;



-- 코드를 입력하세요

# SELECT hour, count
# FROM (

# WITH RECURSIVE number_sequence(hour) as (
#     SELECT 0
#     UNION ALL
#     SELECT HOUR + 1 FROM number_sequence WHERE HOUR < 23
# )
# SELECT HOUR, 0 AS COUNT from number_sequence;
# where HOUR not in (SELECT CAST(DATE_FORMAT(DATETIME,'%H') AS UNSIGNED) AS HOUR FROM  ANIMAL_OUTS)
             
# union      
                   
                   
# SELECT CAST(DATE_FORMAT(DATETIME,'%H') AS UNSIGNED) AS hour, COUNT(*) AS count
# FROM ANIMAL_OUTS GROUP BY DATE_FORMAT(DATETIME,'%H')
# GROUP BY hour ORDER BY hour

# )