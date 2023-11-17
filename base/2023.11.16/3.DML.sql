-- insert, select, update, delete

-- INSERT INTO

-- 테이블에 새로운 레코드 추가
INSERT INTO author(id,name,email) values(1,'kim','abc@naver.com')

-- UPDATE

-- 테이블 레코드의 내용을 수정
-- UPDATE [테이블 이름] SET [필드 이름 1 = 데이터값1, 필드이름2 = 데이터값2, WHERE 필드이름 = 데이터 값]
-- 만약 WHERE 절을 생략하면, 해당 테이블의 모든 레코드 값이 위 설정대로 수정되므로 유의
    
UPDATE author set email='!@!@hello@abc.com' where id=2;


-- -- DELETE FROM
-- DELETE FROM [테이블 이름] WHERE [필드이름=데이터값]
-- WHERE 절을 생략하면, 해당 테이블에 저장된 


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


-- 타입 (숫자)
정수
    TINYINT     //  1 바이트        // java 바이트
    INTO        //  4 바이트        // java int
    BIGINT      //  8 바이트        //
    UNSIGNED    // 양수만 사용
실수
    FLOAT
    DOUBLE
    DECIMAL(M,D);
        java의 Bigdecimal


-- 타입 (문자)
CHAR
    CHAR(255) 10바이트 입력시 255바이트 차지
    VARCHAR(255) 10바이트 -> 10바이트 차지 가변길이.
    TEXT LONGTXT는 4GGB; => 하드디스크로 가서 찾아옴. 

    BLOB(longblob)

    INSERT INTO table_blob (id,myimg) VALUES (1,LOAD_FILE('C:\test_picture.jpg'));

    ENUM
        - 미리 들어갈 수 있는 특정 데이터의 값을 지정
        - 컬럼명 ENUM('데이터값1', '데이터값2', ...)
        - NOT NULL DEFAULT 'USER'   //    입력없으면 'USER'을 기본값으로.


-- 타입(data type) - 날짜와 시간

    DATE
        - 날짜를 저장할 수 있는 타입
        - YYYY-MM-DDL
    DATETIME(m)
        - 날짜와 함께 시간까지 저장, m지정시 소수점 microseconds
        - 'YYY-MM-DD HH:MM:SS'
        - java의 localdatetime과 sync

    DATETIME DEFAULT CURRENT_TIMESTAMP
        - 현재시간을 default로 삽입하는 형식.    
            utc = kst -9
            kst = utc +9



-- 비교연산자

    =
    !=, <>
    <, <=, >, >=
    IS NULL, IS NOT NULL (NULL)
    BETWEEN min AND max             // 이상, 이하. 
    IN(), NOT IN()                  // 가나다라, 마바사, 
