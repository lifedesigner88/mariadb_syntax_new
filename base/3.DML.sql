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