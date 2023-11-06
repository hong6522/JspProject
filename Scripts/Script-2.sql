create table prd(
    code varchar(100) primary key,
    sail_price int,
    real_price int,
    type varchar(100),
    reg_date datetime,
    content varchar(9999),
    img varchar(100) unique,
    imgCnt int,
    detailImg char(100) unique
);


insert into prd(code, prd_name, sail_price, real_price, type, reg_date, content, img, imgCnt, detailImg) values
("rls01", "Balenciaga Key-Ring",5000, 3000, "rls", "2023-04-01", "상품 내용입니다.6", "rls1", 5, "rls01_detail"),
("rls02", "Joden Key-Ring",15000, 10000, "rls", "2023-04-02", "상품 내용입니다.7", "rlsa1", 5, "rls02_detail"),
("rls03", "Nike Key-Ring",18000, 13000, "rls", "2023-04-03", "상품 내용입니다.8", "rlsb1", 5, "rls03_detail"),
("rls04", "Adidas Key-Ring",3000, 500, "rls", "2023-04-04", "상품 내용입니다.9", "rlsc1", 5, "rls04_detail"),
("rls05", "Lamborghini Key-Ring",8000, 4000, "rls", "2023-04-05", "상품 내용입니다.10", "rlsd1", 5, "rls05_detail"),
("rls06", "Balenciaga Key-Ring",5000, 3000, "rls", "2023-04-06", "상품 내용입니다.11", "rlse1", 5, "rls06_detail"),
("rls07", "Joden Key-Ring",15000, 10000, "rls", "2023-04-07", "상품 내용입니다.12", "rlsf1", 5, "rls07_detail"),
("rls08", "Nike Key-Ring",18000, 13000, "rls", "2023-04-08", "상품 내용입니다.13", "rlsg1", 5, "rls08_detail"),
("rls09", "Adidas Key-Ring",3000, 500, "rls", "2023-04-09", "상품 내용입니다.14", "rlsh1", 5, "rls09_detail"),
("rls10", "Lamborghini Key-Ring",8000, 4000, "rls", "2023-04-10", "상품 내용입니다.15", "rlsi1", 5, "rls10_detail"),
("rls11", "Balenciaga Key-Ring",5000, 3000, "rls", "2023-04-11", "상품 내용입니다.16", "rls11_img.jpg", 5, "rls11_detail"),
("rls12", "Joden Key-Ring",15000, 10000, "rls", "2023-04-12", "상품 내용입니다.17", "rls12_img.jpg", 5, "rls12_detail"),
("rls13", "Nike Key-Ring",18000, 13000, "rls", "2023-04-13", "상품 내용입니다.18", "rls13_img.jpg", 5, "rls13_detail"),
("rls14", "Adidas Key-Ring",3000, 500, "rls", "2023-04-14", "상품 내용입니다.19", "rls14_img.jpg", 5, "rls14_detail"),
("rls15", "Lamborghini Key-Ring",8000, 4000, "rls", "2023-04-15", "상품 내용입니다.20", "rls15_img.jpg", 5, "rls15_detail"),
("rls16", "Balenciaga Key-Ring",5000, 3000, "rls", "2023-04-16", "상품 내용입니다.21", "rls16_img.jpg", 5, "rls16_detail"),
("rls17", "Joden Key-Ring",15000, 10000, "rls", "2023-04-17", "상품 내용입니다.22", "rls17_img.jpg", 5, "rls17_detail"),
("rls18", "Nike Key-Ring",18000, 13000, "rls", "2023-04-18", "상품 내용입니다.23", "rls18_img.jpg", 5, "rls18_detail"),
("rls19", "Adidas Key-Ring",3000, 500, "rls", "2023-04-19", "상품 내용입니다.24", "rls19_img.jpg", 5, "rls19_detail"),
("rls20", "Lamborghini Key-Ring",8000, 4000, "rls", "2023-04-20", "상품 내용입니다.25", "rls20_img.jpg", 5, "rls20_detail");


create table mark(
	id varchar(100) not null,
	markname varchar(100) not null
);


create table members(
    id varchar(100),
    pw varchar(100),
    pname varchar(100),
    nick varchar(100),
    birth date,
    tel varchar(100),
    email varchar(100),
    address varchar(300),
    level int default 1,
    bklist int DEFAULT 0 null
    );
    
   insert into members(id, pw, pname, nick, birth, tel, email, address, level) values
('id1', 'aaa', '하도영', '하도', '1987-10-12', '010-1111-1111','hado@naver.com','경기도 구리시',3),
('id2', 'bbb', '박희순', '초코', '1980-01-23', '010-2222-2222','park@daum.net','강남구 역삼동',5 ),
('id3', 'ccc', '한소희', '우유', '1990-12-10', '010-3333-3333','hanso@naver.com','경기도 남양주시',5 ),
('id4', 'ddd', '곽진언', '순천순두부존맛탱', '1998-10-21', '010-4444-4444','eun@kakao.com','전라도 순천시',3 ),
('id5', 'eee', '이영훈', '아아', '1997-12-12', '010-5555-5555','lee@daum.net','중랑구 상봉동',1 ),
('id6', 'fff', '김철수', '철수', '1987-08-20', '010-6666-6666','cs@naver.com','종로구 평창동 ',3 ),
('id7', 'ggg', '박영희', '영희', '1999-07-23', '010-7777-7777','yh@daum.net','강남구 삼성동',3 ),
('id8', 'hhh', '정민수', '민수', '1993-12-13', '010-8888-8888','ms@naver.com','동대문구 장안동',2 );

create table orders(
    order_no int auto_increment primary key,
    id varchar(100),
    code varchar(100),
    cnt int,
    address varchar(300),
    reg_date datetime,
    dlvryStts varchar(100),
    cardMk varchar(100),
    cardNum varchar(100),
    orderStts varchar(100)
);

insert into orders(id, code, cnt, address, reg_date, dlvryStts, cardMk, cardNum, orderStts) values
('id1', 'sg1', 2, '동대문구 장안동', '2023-03-02', '배송완료', '국민은행', '1111-2222-3333-4444', '결제완료'),
('id2', 'sg2', 3, '경기도 남양주시', '2023-04-24', '배송준비중', '하나은행', '2222-3333-4444-5555', '결제완료'),
('id3', 'sg3', 2, '강남구 역삼동', '2023-04-23', '배송중', '새마을금고', '1234-2345-4567-6789', '결제완료'),
('id4', 'sg4', 3, '경기도 구리시', '2023-04-23', '배송준비중', '농협', '9786-8765-4321-0232', '결제완료'),
('id5', 'sg5', 4, '종로구 평창동', '2023-04-21', '배송중', '기업은행', '2132-4562-7654-9034', '결제완료'),
('id1', 'sg1', 2, '동대문구 장안동', '2023-03-02', '배송완료', '국민은행', '1111-2222-3333-4444', '결제완료'),
('id2', 'sg2', 3, '경기도 남양주시', '2023-04-24', '배송준비중', '하나은행', '2222-3333-4444-5555', '결제완료'),
('id3', 'sg3', 2, '강남구 역삼동', '2023-04-23', '배송중', '새마을금고', '1234-2345-4567-6789', '결제완료'),
('id4', 'sg4', 3, '경기도 구리시', '2023-04-23', '배송준비중', '농협', '9786-8765-4321-0232', '결제완료'),
('id5', 'sg5', 4, '종로구 평창동', '2023-04-21', '배송중', '기업은행', '2132-4562-7654-9034', '결제완료'),
('id1', 'sg1', 2, '동대문구 장안동', '2023-03-02', '배송완료', '국민은행', '1111-2222-3333-4444', '결제완료'),
('id2', 'sg2', 3, '경기도 남양주시', '2023-04-24', '배송준비중', '하나은행', '2222-3333-4444-5555', '결제완료'),
('id3', 'sg3', 2, '강남구 역삼동', '2023-04-23', '배송중', '새마을금고', '1234-2345-4567-6789', '결제완료'),
('id4', 'sg4', 3, '경기도 구리시', '2023-04-23', '배송준비중', '농협', '9786-8765-4321-0232', '결제완료'),
('id5', 'sg5', 4, '종로구 평창동', '2023-04-21', '배송중', '기업은행', '2132-4562-7654-9034', '결제완료'),
('id1', 'sg1', 2, '동대문구 장안동', '2023-03-02', '배송완료', '국민은행', '1111-2222-3333-4444', '결제완료'),
('id2', 'sg2', 3, '경기도 남양주시', '2023-04-24', '배송준비중', '하나은행', '2222-3333-4444-5555', '결제완료'),
('id3', 'sg3', 2, '강남구 역삼동', '2023-04-23', '배송중', '새마을금고', '1234-2345-4567-6789', '결제완료'),
('id4', 'sg4', 3, '경기도 구리시', '2023-04-23', '배송준비중', '농협', '9786-8765-4321-0232', '결제완료'),
('id5', 'sg5', 4, '종로구 평창동', '2023-04-21', '배송중', '기업은행', '2132-4562-7654-9034', '결제완료');



select *,prd_name from orders o
join prd p
on o.code = p.code;

drop table orders;

create table orders(
    order_no int auto_increment primary key,
    id varchar(100),
    client varchar(100),
    code varchar(100),
    cnt int,
    totpri int,
    address varchar(300),
    reg_date datetime,
    dlvryStts varchar(100),
    cardMk varchar(100),
    cardNum varchar(100),
    orderStts varchar(100)
);

insert into orders(id, client, code, cnt, totpri, address, reg_date, dlvryStts, cardMk, cardNum, orderStts) values
('id1', '고나영', 'sg01', 2, 10000, '동대문구 장안동', '2023-03-02', '배송완료', '국민은행', '1111-2222-3333-4444', '결제완료'),
('id2', '고가영', 'sg02', 3, 12000, '경기도 남양주시', '2023-04-24', '배송준비중', '하나은행', '2222-3333-4444-5555', '결제완료'),
('id3', '고다영', 'sg03', 2, 13000, '강남구 역삼동', '2023-04-23', '배송중', '새마을금고', '1234-2345-4567-6789', '결제완료'),
('id4', '고라영', 'sg04', 3, 14000, '경기도 구리시', '2023-04-23', '배송준비중', '농협', '9786-8765-4321-0232', '결제완료'),
('id5', '고마영', 'sg05', 4, 15000, '종로구 평창동', '2023-04-21', '배송중', '기업은행', '2132-4562-7654-9034', '결제완료'),
('id1', '고바영', 'sg01', 2, 16000, '동대문구 장안동', '2023-03-02', '배송완료', '국민은행', '1111-2222-3333-4444', '결제완료'),
('id2', '고사영', 'sg02', 3, 12000, '경기도 남양주시', '2023-04-24', '배송준비중', '하나은행', '2222-3333-4444-5555', '결제완료'),
('id3', '고아영', 'sg03', 2, 13000, '강남구 역삼동', '2023-04-23', '배송중', '새마을금고', '1234-2345-4567-6789', '결제완료'),
('id4', '고자영', 'sg04', 3, 13000, '경기도 구리시', '2023-04-23', '배송준비중', '농협', '9786-8765-4321-0232', '결제완료'),
('id5', '고차영', 'sg05', 4, 14000, '종로구 평창동', '2023-04-21', '배송중', '기업은행', '2132-4562-7654-9034', '결제완료'),
('id1', '고카영', 'sg01', 2, 12000, '동대문구 장안동', '2023-03-02', '배송완료', '국민은행', '1111-2222-3333-4444', '결제완료'),
('id2', '고타영', 'sg02', 3, 15000, '경기도 남양주시', '2023-04-24', '배송준비중', '하나은행', '2222-3333-4444-5555', '결제완료'),
('id3', '고파영', 'sg03', 2, 15000, '강남구 역삼동', '2023-04-23', '배송중', '새마을금고', '1234-2345-4567-6789', '결제완료'),
('id4', '고하영', 'sg04', 3, 15000, '경기도 구리시', '2023-04-23', '배송준비중', '농협', '9786-8765-4321-0232', '결제완료'),
('id5', '고나미', 'sg05', 4, 13000, '종로구 평창동', '2023-04-21', '배송중', '기업은행', '2132-4562-7654-9034', '결제완료'),
('id1', '고다미', 'sg01', 2, 14000, '동대문구 장안동', '2023-03-02', '배송완료', '국민은행', '1111-2222-3333-4444', '결제완료'),
('id2', '고다미', 'sg02', 3, 15000, '경기도 남양주시', '2023-04-24', '배송준비중', '하나은행', '2222-3333-4444-5555', '결제완료'),
('id3', '고수미', 'sg03', 2, 23000, '강남구 역삼동', '2023-04-23', '배송중', '새마을금고', '1234-2345-4567-6789', '결제완료'),
('id4', '고소미', 'sg04', 3, 31000, '경기도 구리시', '2023-04-23', '배송준비중', '농협', '9786-8765-4321-0232', '결제완료'),
('id5', '고다미', 'sg05', 4, 32000, '종로구 평창동', '2023-04-21', '배송중', '기업은행', '2132-4562-7654-9034', '결제완료');


show databases;

create table qnaboard(
    num int auto_increment primary key,
    id varchar(100),
    kind varchar(100),
    content varchar(9999),
    reg_date datetime
);

create table stl(
    stl_no int auto_increment primary key,
    content varchar(9999),
    reg_date datetime,
    price int,
    kind varchar(100)
);


create table board(
    id int auto_increment primary key,
    title varchar(100),
    pname varchar(100),
    content varchar(9999),
    reg_date datetime,
    cnt int,
    upfile varchar(100),
    gid int,
    rid varchar(100)
);

create table review(
    num int auto_increment primary key,
    id varchar(100),
    nick varchar(100),
    gid varchar(100),
    content varchar(9999),
    img varchar(100),
    star int,
    reg_date datetime
);

alter table members add constraint primary key(id);
