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


-- 논리연산자 

    A AND B   //    A && B
    
    A OR A    //    A || A


    
-- 검색 패턴

    LIKE // NOTLIKE
        -   특정 패턴을 포함하는 데이터만을 검색하기 위한 와일드 칻 (WILDCARD) 문자
        -   일반적으로 %와 함께 사용됨
        -   SELECT * FROM author WHERE name LIKE '홍%'; // 홍으로 시작
        -   SELECT * FROM author WHERE name LIKE '%동'; // 홍으로 시작
        -   SELECT * FROM author WHERE name LIKE '%길%'; // 홍으로 시작

    
    REGEXP '[a-z]'
        -   SELECT * FROM author WHERE name REGEXP '[a-z]'; // abcd 포함
        -   SELECT * FROM author WHERE name REGEXP '[가-힣]'; // 한글 포함

    
    -- 타입 변환

    CAST            // 
        CAST(a AS type)
        a 값을 type으로 변환
        보통 정수값을 DATE 타입으로 변환하는데 사용
        SELECT CAST(20200101 AS DATE); => 2020-01-01


    CONVERT         // 문자열
        SELECT CAST('20200101' AS DATE); => 2020-01-01

    DATE_FORMAT 
        SELECT DATE_FORMAT ('2020-01-01 17:12:00', '%Y-%M-&T')

        
-- 포멧 변경, 컬럼명 지정. 
     DATE_FORMAT(PUBLISHED_DATE , '%Y-%m-%d') AS PUBLISHED_DATE;



%Y  년도 (2021) 
%m  월 (01, 02, 11)

%y  년도 (21)
%c  월 (1, 8)

%d  일(01, 19)
%M  월 (January, August)

%e  일(1, 19)
%b  월(Jan, Aug)


%T  시간 (12:30:00)
%W  요일(Wednesday, friday)

%r  시간 (12:30:00 AM)
%a  요일(Wed, Fri)

%H  24시간 시간(01, 14, 18)
%i  분 (00)

%l  12시간 시간 (01, 02, 06)
%S  초 (00)

-- 오늘날짜 
NOW()



-- 데이터 
DATE_FORMAT(date,format)
SELECT * FROM post WHERE created_time LIKE '2023%';
WHERE created_time BETWEEN '2021-01-01' AND '2023-11-17'
WHERE created_time >='2021-01-01' AND created_time <='2023-11-17';





신버전
    CASE('123' as INT)
    CASE('123' as signed) unsigned 가능

구버전
    CASE('123' as signed) 방식 unsigend(양수)





제약조건
    데이터를 입력받을 때 실행되는 검사규칙

    CREATE 문으로 테이블을 생성 또는 

     UNIQUE

--  자동 증가.

    AUTO 




-- not null 조건 추가.
ALTER TABLE author MODIFY COLUMN name varchar(100) not null;

-- 외래키가 있는 경우. not널 조건 추가하려면 외래키를 꺼야한다.
SET FOREIGN_KEY_CHECKS=0;	-- 외래키 체크 끄기
ALTER TABLE post MODIFY COLUMN name varchar(100) not null;

SET FOREIGN_KEY_CHECKS=1;	-- 외래키 체크 켜기


-- 외래키;
FOREIGN KEY (필드이름)
ON DELETE / UPDATE CASCADE ??

on delete restrict, on update restrict;

참조되는 테이블에서 데이터의 수정이나 삭제가 발생시 영향.

CASCADE 참조되는 테이블에서 데이터를 삭제/수정 하면 같이 삭제/수정
SET NULL 참조되는 테이블에서 데이터 수정하면 데이터 NULL 로 변경
RESTRICT FK로 잡은 테이블의 데이터가 남아 있으면, 데이터 삭제, 수정 불가. 

