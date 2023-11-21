-- 동시성 문제. 어떻게 해결했는가? 


-- join

inner join
outer join

left outer join 


Union 



SELECT * FROM author INNER JOIN post ON author.id = post.author_id;

SELECT * FROM author AS a INNER JOIN post AS p ON a.id = p.author_id;

