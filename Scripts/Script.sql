
show databases;

create database kr_db;

create user 'kr_user'@localhost identified by '1111';

grant all privileges on kr_db.* to 'kr_user'@localhost;

drop database kr_db;