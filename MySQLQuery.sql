-- 데이터베이스 생성
create database kamebook;
-- 데이터베이스 생성
drop database kamebok;
-- members 테이블생성
create table members(
memid varchar(9) not null comment '회원아이디' collate 'utf8mb4_general_ci',
memname varchar(20) not null comment '회원명'  collate  'utf8mb4_general_ci', 
passwd varchar(128) null default null comment '비밀번호'  collate 'utf8mb4_general_ci',
passwdmdt datetime null default null comment '비밀번호변경일시',
jumin varchar(64) null default null comment '주민등록번호' collate  'utf8mb4_general_ci', 
addr varchar(100) null default null comment '주소' collate 'utf8mb4_general_ci',
birthday date null default null comment '생년월일',
jobcd char(1) null default null comment '직업코드',
mileage decimal(7,0) unsigned null default '0' comment '마일리지',
stat enum('Y','N') not null default  'Y' comment '상태' collate 'utf8mb4_general_ci',
enterdtm datetime not null default current_timestamp() comment '가입일시',
leavedtm datetime null default null comment '탈퇴일시',
primary key (memid)
)
collate 'utf8mb4_general_ci'
engine = InnoDB;

-- members 데이터 넣기
insert into members(memid, memname, addr, birthday, jobcd) values ('jeong','안젤라','부산광역시', '1992-04-24', '1');
insert into members(memid, memname, addr, birthday, jobcd) values ('kang','수진','서울특별시', '1992-04-22', '3');
insert into members(memid, memname, addr, birthday, jobcd) values ('wang','윌리','부산광역시', '1992-06-14', '4');

insert into members(memid, memname, addr, birthday, jobcd) values ('park','홍길동','인천 동구 송림동', '1992-06-14', '4');
insert into members(memid, memname, addr, birthday, jobcd) values ('kim1','홍길동','서울 강남구 신사동', '1980-11-14', '4');
insert into members(memid, memname, addr, birthday, jobcd) values ('hong1','김갑수','인천 연수구 연수동', '2004-12-14', '4');
insert into members(memid, memname, addr, birthday, jobcd) values ('hong2','박기자','경기 부천시', '2002-02-14', '4');

-- 데이터 넣은 값 확인하기 
select * from members;

-- goodsinfo 테이블생성
create table goodsinfo (
goodscd char(5) not null comment '상품코드' collate  'utf8mb4_general_ci', 
goodsname varchar(20) not null comment '상품명' collate  'utf8mb4_general_ci', 
unitcd char(2) null default null comment '단위코드'  collate  'utf8mb4_general_ci',
unitprice decimal(5,0) unsigned not null default '0' comment '단가',
stat enum('Y','N') not null default 'Y' comment '상태' collate  'utf8mb4_general_ci', 
insdtm datetime not null default current_timestamp() comment '등록일시',
moddtm datetime null default null comment '탈퇴일시', 
primary key (goodscd) using btree
)
collate 'utf8mb4_general_ci'
engine = InnoDB;

-- 데이터 삽입
insert into goodsinfo(goodscd, goodsname, unitcd, unitprice) values ('GDS01','노트','01','2000');
insert into goodsinfo(goodscd, goodsname, unitcd, unitprice) values ('GDS02','연필','01','2000');
insert into goodsinfo(goodscd, goodsname, unitcd, unitprice) values ('GDS03','복사지','03','5000');
insert into goodsinfo(goodscd, goodsname, unitcd, unitprice) values ('GDS04','볼펜','01','500');
insert into goodsinfo(goodscd, goodsname, unitcd, unitprice) values ('GDS05','네임펜','02','1000');
insert into goodsinfo(goodscd, goodsname, unitcd, unitprice) values ('GDS06','크레파스','02','1500');
-- 데이터 넣은 값 확인하기
select * from goodsinfo;

-- order_h 테이블 생성(주문테이블)
create table order_h(
orderno char(9) not null comment '주문번호' collate 'utf8mb4_general_ci',
orddt date  not null comment '주문일',
memid varchar(10) not null comment '주문자ID'  collate 'utf8mb4_general_ci', 
ordamt decimal(7,0) unsigned not null default '0' comment '주문총액',
cancelyn enum( 'Y' , 'N' ) not null default 'N' comment '주문상태'  collate 'utf8mb4_general_ci',
canceldtm datetime null default null comment '주문취소일시',
insdtm datetime not null default current_timestamp() comment '등록일시',
moddtm datetime null default null comment '변경일시',
primary key(orderno) using btree
)
collate 'utf8mb4_general_ci'
engine = InnoDB;


-- order_h 데이터 값 넣기
insert into order_h ( orderno, orddt, memid, ordamt, insdtm) values ('202201001','2022-01-24', 'seo','10000','2022-03-01 14:49:07');
insert into order_h ( orderno, orddt, memid, ordamt, insdtm) values ('202201002','2022-01-24', 'hong2','10000','2022-03-01 14:49:07');
insert into order_h ( orderno, orddt, memid, ordamt, insdtm) values ('202201003','2022-01-24', 'hong1','15000','2022-03-01 14:51:07');
insert into order_h ( orderno, orddt, memid, ordamt, insdtm) values ('202201004','2022-01-24', 'kim1','10000','2022-03-01 14:51:58');
insert into order_h ( orderno, orddt, memid, ordamt, cancelyn, canceldtm, insdtm) values ('202201005','2022-01-24', 'park','5000','Y','2022=01-25 00:00:00','2022-03-01 14:53:12');

insert into order_h ( orderno, orddt, memid, ordamt, insdtm) values ('202202001','2022-02-01', 'hong1','1000','2022-03-01 14:54:40');
insert into order_h ( orderno, orddt, memid, ordamt, insdtm) values ('202202002','2022-02-01', 'hong1','10000','2022-03-01 14:54:40');
insert into order_h ( orderno, orddt, memid, ordamt, insdtm) values ('202202003','2022-02-02', 'park','10000','2022-03-01 14:55:28');
insert into order_h ( orderno, orddt, memid, ordamt, insdtm) values ('202202004','2022-02-02', 'abcd','500','2022-03-01 14:56:03');




-- 상품 디테일
create table order_d(
orderno char(9) not null comment '주문번호' collate 'utf8mb4_general_ci',
goodscd char(5) not null comment '상품코드' collate 'utf8mb4_general_ci',
unitcd char(2) null default null comment '단위코드' collate 'utf8mb4_general_ci',
unitprice decimal(5,0) unsigned not null default '0' comment '단가',
dty decimal(3,0) unsigned not null default '0' comment '주문수량',
amt decimal(7,0) unsigned not null default '0' comment '주문금액', 
insdtm datetime not null default current_timestamp() comment '등록일시',
moddtm datetime null default null comment '변경일시',
primary key (orderno, goodscd) using btree
)
collate 'utf8mb4_general_ci'
engine = InnoDB;

-- 주문상세 데이터 삽입
insert into order_d (orderno, goodscd, unitcd, unitprice, dty, amt, insdtm) values ('202201001', 'GDS01', '01', '2000', '10', '20000', '2023-03-02 15:10:39');

insert into order_d (orderno, goodscd, unitcd, unitprice, dty, amt, insdtm) values ('202201001', 'GDS02', '02', '2000', '10', '5000', '2023-03-02 15:10:39');
insert into order_d (orderno, goodscd, unitcd, unitprice, dty, amt, insdtm) values ('202201001', 'GDS01', '03', '2000', '10', '5000', '2023-03-02 15:13:28');
insert into order_d (orderno, goodscd, unitcd, unitprice, dty, amt, insdtm) values ('202201002', 'GDS01', '01', '2000', '10', '5000', '2023-03-02 15:14:26');
insert into order_d (orderno, goodscd, unitcd, unitprice, dty, amt, insdtm) values ('202201002', 'GDS03', '03', '5000', '10', '50000', '2023-03-02 15:15:12');
insert into order_d (orderno, goodscd, unitcd, unitprice, dty, amt, insdtm) values ('202201003', 'GDS04', '02', '500', '50', '25000', '2023-03-02 15:15:59');
insert into order_d (orderno, goodscd, unitcd, unitprice, dty, amt, insdtm) values ('202201004', 'GDS05', '02', '1000', '50', '25000', '2023-03-02 15:16:45');
insert into order_d (orderno, goodscd, unitcd, unitprice, dty, amt, insdtm) values ('202201005', 'GDS02', '02', '100', '4', '25000', '2023-03-02 15:17:39');
insert into order_d (orderno, goodscd, unitcd, unitprice, dty, amt, insdtm) values ('202201006', 'GDS01', '01', '2000', '1', '25000', '2023-03-02 15:18:08');
insert into order_d (orderno, goodscd, unitcd, unitprice, dty, amt, insdtm) values ('202202005', 'GDS01', '01', '2000', '10', '25000', '2023-03-02 15:18:59');

insert into order_d (orderno, goodscd, unitcd, unitprice, dty, amt, insdtm) values ('202202001', 'GDS03', '03', '5000', '1', '5000', '2023-03-01 15:19:10');
insert into order_d (orderno, goodscd, unitcd, unitprice, dty, amt, insdtm) values ('202202001', 'GDS05', '02', '1000', '20', '20000', '2023-03-01 15:19:20');
insert into order_d (orderno, goodscd, unitcd, unitprice, dty, amt, insdtm) values ('202202003', 'GDS01', '01', '2000', '10', '20000', '2023-03-01 15:19:20');
insert into order_d (orderno, goodscd, unitcd, unitprice, dty, amt, insdtm) values ('202202003', 'GDS07', '03', '2000', '20', '40000', '2023-03-01 15:19:30');
insert into order_d (orderno, goodscd, unitcd, unitprice, dty, amt, insdtm) values ('202202004', 'GDS01', '01', '2000', '10', '20000', '2023-03-01 15:21:18');


-- 데이터 검색 select
select memid, memname from members;
-- 데이터 열 이름 지정하기 : AS
select memname as '회원명' , memid as '회원ID' from members;