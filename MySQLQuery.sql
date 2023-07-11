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
insert into members(memid, memname, addr, birthday, jobcd) values ('park','박기자','경기 부천', '1992-06-14','3');
insert into members(memid, memname, addr, birthday, jobcd) values ('Tech','태현','경기 수원', '1980-11-14', '4');
insert into members(memid, memname, addr, birthday, jobcd) values ('hong2','홍길동1','서울 강남 신사동', '2004-12-14', '9');
insert into members(memid, memname, addr, birthday, jobcd) values ('seo','서갑돌','인천 동구', '2004-12-14', '1');
insert into members(memid, memname, addr, birthday, jobcd) values ('kim1','김갑수','인천 동구 숭림동', '1980-11-14', '1');
insert into members(memid, memname, addr, birthday, jobcd) values ('hong1','홍길동','인천 연수구 연수동', '2002-02-14', '2');





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
-- 데이터 정렬하기 오름차순 ASC, 내림차순 DESC
select memid, memname from members order by memname asc; 

-- 데이터 정렬하기, 열이름 변경
select memid, memname as '회원명' from members order by memname asc; 

select memid, memname from members order by memname ASC, memid desc;

-- 중복 데이터 처리 : distinct
select distinct jobcd from members

-- 상품 데이터 변경 하기
update members set mileage = '500' where memid='hong1';

-- 검색하는 행 수 제한하기 : LIMIT.. OFFSET
select memid, memname from members order by memname limit 3; 
-- offset은 앞에 2개를 제외하고 3행을 출력
select memid, memname from members order by memname  limit 3 offset 2; 
select memid, memname from members order by memname limit 2,3;


-- 연산 열 추가하기
select menid, memname, mileage + 10 as '연산열' from members;
-- CONCAT()함수를 이용해서 열 추가하기 , 인수의 내용을 문자열로 결합하는 기능을 제공
select memid, memname , concat(memid, memname) from members;

--show variables like "%secure_file%"; 로 입력하면 value에 나오는 경로로 저장이 된다. 다른방법도있다는데 난 그냥 기본경로로 설정
-- 검색 결과를 파일로 내보내기 select into
select * into outfile  'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\members.txt' fields terminated by ',' enclosed by '"' from members;
select * into outfile  'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\goodsinfo.txt' fields terminated by ',' enclosed by '"' from goodsinfo;
select * into outfile  'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\order_h.txt' fields terminated by ',' enclosed by '"' from order_h;
select * into outfile  'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\order_d.txt' fields terminated by ',' enclosed by '"' from order_d;


-- 테이블 내용 삭제하기
delete from members;

--  value  > off 로 지정 되어있는데, on으로 변경해야할거같다 .
SHOW GLOBAL VARIABLES LIKE 'LOCAL_INFILE';
-- on으로 변경
set global local_infile=true;

-- 외부파일로부터 데이터 가져오기
load data local infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\members.txt' into table members fields terminated by ',' enclosed by '"';
-- 일회성으로 허용할 때 옵션설정
local-infile

local-infile -u <root> -p <1234> -P <3306> -h <210.103.83.39> <kamebook> < H:/database/DataBaseStudy-mysql/MySQLQuery.sql



-- 데이터 검색 select 하기
-- 조건지정하여 데이터 검색하기 : where

select memid, memname, addr, birthday, jobcd, mileage from members where memid='kim1';
select memid, memname, addr, birthday, jobcd,mileage from members where jobcd = '1' order by memid;

-- 날짜 검색 리터럴형식
select memid, memname, addr, birthday , jobcd, mileage from members where birthday = '2002-02-14';
select memid, memname, addr, birthday , jobcd, mileage from members where birthday = '20020214';
select memid, memname, addr, birthday , jobcd, mileage from members where birthday = '2002.02.14';
-- milgage 은 숫자형 데이터 이기 때문에 따옴표 없음
select * from members where mileage =500; 


-- 조건지정하여 데이터 검색 : where ... between
select memid, memname, mileage from members where mileage between 100 and 500 order by memid;

-- 조건지정하여 데이터 검색 : where ... like 
select memid, memname, mileage from members where memname like '홍%' order by memid;

-- 조건지정하여 데이터 검색 : in 
select memid, memname, jobcd from members where jobcd in ('1','3') order by memid;
-- OR 연산자를 사용하여 중복조건을 지정하는것과 동일함
select memid, memname, jobcd from members where jobcd = '1' or  jobcd='3';

-- 조건 지정하여 데이터 검색하기 : not
select memid, memname, jobcd from members where not jobcd = '1' order by memid;
select memid, memname, jobcd from members where not jobcd != '1' order by memid;

-- 조건 지정하여 데이터 검색하기 : IS NULL > NULL 인 경우 출력,  NULL인 아닌 자료를 검색할땐 조건절은 IS NOT NULL 이다.
select memid, memname, jumin from members where jumin is null order by memid;

-- insert 추가 데이터 입력
insert into members (memid, memname) values('abcd','추가자');



-- 새로운 테이블 생성

create table board (
    idx int(11) not null auto_increment,
    title varchar(50) null default null collate 'utf8mb4_general_ci',
    content text null default null collate 'utf8mb4_general_ci',
    primary key (idx) using btree
)
collate 'utf8mb4_general_ci'
engine= InnoDB;

-- board 데이터 값 넣기 
insert into board (title, content) values ('Auto Increment Test','Auto Increment 속성이 지정된 열은 데이터베이스에서 자동으로 값을 채운다.');
insert into board (title, content) values ('2번째 제목', '2번째 내용');

-- update쿼리문 사용 (데이터 변경) 2개이상열 수정
update order_h set cancelyn = 'y', canceldtm = current_timestamp() where orderno = '202201005';

-- delete 쿼리문
delete from order_h;
