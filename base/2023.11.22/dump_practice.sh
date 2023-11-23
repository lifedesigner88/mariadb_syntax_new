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

