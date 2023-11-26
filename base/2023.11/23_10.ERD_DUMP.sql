sodo mariadb -u root -p
CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'testpw';



sudo apt-get -u update
sudo apt-get -y upgrade
sodu apt-get install -y mariadb-server

sudo systemctl status mariadb
sudo systemctl start mariadb
sudo systemctl enable mariadb




cd
cd mariadb_syntax_new/project
sudo mariadb -u root -p
sudo mysql -u root -p board < dumpfile.sql

sudo apt-get -u update
sudo apt-get -y upgrade
sodu apt-get install -y mariadb-server

sudo systemctl status mariadb
sudo systemctl start mariadb

sudo mariadb -u root -p
exit


git clone https://github.com/lifedesigner88/mariadb_syntax_new.git


mysqldump -u root -p --default-character-set=utf8mb4 board > dumpfile.sql
mysql -u root -p board < dumpfile.sql



-- 폰트 변경
sudo apt install fontconfig
sudo fc-cache -f -v
fc-list | grep -i nanum
fc-list

scp : 파일 전송 관련 명령어. 





-- 다이어그램
https://app.diagrams.net/


개념적 모델링
논리적 모델링
물리적 모델링
테스트 결과서 (insert, update -> 캡쳐)


팀프로젝트 
repository 만들고 -> 팀원기여



https://www.erdcloud.com/




CREATE TABLE adress(
    id          INT,
    state_city          VARCHAR(255),
    details             VARCHAR(255), 
    zip_code            VARCHAR(255), 
    phonenumber         VARCHAR(255), 

    PRIMARY     KEY(id)
    );

CREATE TABLE posts_authors(
    id             INT,
    author_id      VARCHAR(255),
    post_id        VARCHAR(255), 


    PRIMARY KEY(id),
    FOREIGN KEY(author_id)  REFERENCES author(id)
    );



ALTER TABLE adress 
ADD FOREIGN KEY(author_id) REFERENCES author(id) ;



CREATE TABLE `adress` (
   `id` int(11) NOT NULL,
   `state_city` varchar(255) DEFAULT NULL,
   `details` varchar(255) DEFAULT NULL,
   `zip_code` varchar(255) DEFAULT NULL,
   `phonenumber` varchar(255) DEFAULT NULL,
   `author_id` int(11) DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `author_id` (`author_id`),
   CONSTRAINT `adress_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci



 CREATE TABLE `post` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `title` varchar(255) NOT NULL,
   `contents` varchar(3000) DEFAULT NULL,
   `author_id` int(11) DEFAULT NULL,
   `price` decimal(10,3) DEFAULT NULL,
   `created_time` datetime(6) DEFAULT current_timestamp(6),
   PRIMARY KEY (`id`),
   KEY `post_update` (`author_id`),
   CONSTRAINT `post_update` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON UPDATE SET NULL
 ) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci



ALTER TABLE post ADD FOREIGN KEY(author_id) REFERENCES author(id) ON DELETE CASCADE

ALTER TABLE EMP DROP CONSTRAINT PK_EMP;


ALTER TABLE post ADD CONSTRAINT onDeleteCASCADE FOREIGN KEY(author_id) REFERENCES author(id) ON DELETE CASCADE;
select * from information_schema.table_constraints WHERE TABLE_NAME = 'post';
ALTER TABLE post DROP CONSTRAINT onDeleteCASCADE;

DESCRIBE post;
ALTER TABLE post DROP COLUMN author_id;
show index from post;
ALTER TABLE post DROP CONSTRAINT onDeleteCASCADE;
alter table post DROP author_id;





CREATE TABLE posts_authors(
    id          INT,
    author_id 	INT,
    post_id     INT,

    PRIMARY     KEY(id),
    CONSTRAINT `author_id_f` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON UPDATE SET NULL,
    CONSTRAINT `post_id_f` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON UPDATE SET NULL
    );
    
SELECT * FROM posts_authors;   

