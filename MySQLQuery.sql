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