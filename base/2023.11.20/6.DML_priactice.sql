case

SELECT id, title, contents,  
CASE author_id
	WHEN 1 then 'First Author'
    WHEN 2 then 'Second Author'
    ELSE 'Other'
end
as author_type from post;



SELECT id, title, contents,  
CASE 
	WHEN author_id = 1 then 'First Author'
    WHEN author_id = 2 then 'Second Author'
    WHEN author_id is null then 'Anonymous'
    ELSE 'Other'
end
as author_type from post;

SELECT id, title, contents, ifnull(author_id, 'anonymous') as author_type from post;
SELECT id, title, contents, if(author_id is null, 'anonymous', author_id) as author_type from post;  
SELECT id, title, contents , if (author_id=1, 'first author', 'orther') as author_type FROM post;



SELECT BOARD_ID, WRITER_ID, TITLE, PRICE, 

CASE STATUS
    WHEN 'SALE' THEN '판매중'
    WHEN 'RESERVED' THEN '예약중'
    WHEN 'DONE' THEN '거래완료'
END

as STATUS FROM USED_GOODS_BOARD 
WHERE CREATED_DATE='2022-10-05' 
ORDER BY BOARD_ID DESC;