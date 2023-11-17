-- insert, select, update, delete



-- INSERT INTO

    테이블에 새로운 레코드 추가
    INSERT INTO author(id,name,email) values(1,'kim','abc@naver.com')

-- UPDATE

    테이블 레코드의 내용을 수정
    UPDATE [테이블 이름] SET [필드 이름 1 = 데이터값1, 필드이름2 = 데이터값2, WHERE 필드이름 = 데이터 값]
    만약 WHERE 절을 생략하면, 해당 테이블의 모든 레코드 값이 위 설정대로 수정되므로 유의
    
    UPDATE author set email='!@!@hello@abc.com' where id=2;


-- DELETE FROM
    DELETE FROM [테이블 이름] WHERE [필드이름=데이터값]
    WHERE 절을 생략하면, 해당 테이블에 저장된 


-- 이름 중복제거하고 조회(그냥 조회)

    SELECT DISTINCT NAME FROM author;

-- 정렬

    SELECT name FROM author ORDER BY name;
    SELECT * FROM author ORDER BY name, email desc;    

    SELECT [COLUMS] FROM [TABLE] ORDER BY [COLUMNS (ASC,DESC)] LIMIT;
    기본 설정 오름차순(ASC)이며, 내림차순시 (DESC)
    LIMIT(제한)


-- 별칭( alias ) 이용한 처리

    SELECT name as AS 이름 FROM author
    SELECT name as


