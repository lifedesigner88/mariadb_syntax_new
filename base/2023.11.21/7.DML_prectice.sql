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



-- 조건에 맞는 도서와 저자 리스트 출력
SELECT B.BOOK_ID, A.AUTHOR_NAME, DATE_FORMAT(B.PUBLISHED_DATE,'%Y-%m-%d') AS PUBLISHED_DATE
FROM BOOK AS B INNER JOIN AUTHOR AS A 
ON B.AUTHOR_ID = A.AUTHOR_ID
WHERE B.CATEGORY = '경제'
ORDER BY B.PUBLISHED_DATE