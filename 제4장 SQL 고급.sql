#날짜 : 2022/08/24
#이름 : 김시아
#내용 : 제4장 SQL 고급

#실습 4-1

create table `Member` (
		`uid`  varchar(10) primary key ,
        `name` varchar(10) not null ,
        `hp`   varchar(13) unique not null ,
        `pos`  varchar(10) not null,
        `dep`   tinyint,
        `rdate` datetime not null
        
);
create table `Department` (
        `depNo` tinyint primary key,
        `name`  varchar(10) not null,
        `tel`   char(12) not null
        
);
create table `Sales` (
        `seq`   int auto_increment primary key,
        `uid`   varchar(10) not null,
        `year`  year not null,
        `month`  tinyint not null,
        `sale`   int not null
        
);

drop table `Sales`;


#실습 4-2

insert into `Member` values ('a101','박혁거세','010-1234-1001','부장',101,now());
insert into `Member` values ('a102','김유신','010-1234-1002','차장',101,now());
insert into `Member` values ('a103','김춘추','010-1234-1003','사원',101,now());
insert into `Member` values ('a104','장보고','010-1234-1004','대리',102,now());
insert into `Member` values ('a105','강감찬','010-1234-1005','과장',102,now());
insert into `Member` values ('a106','이성계','010-1234-1006','차장',103,now());
insert into `Member` values ('a107','정철','010-1234-1007','차장',103,now());
insert into `Member` values ('a108','이순신','010-1234-1008','부장',104,now());
insert into `Member` values ('a109','허균','010-1234-1009','부장',104,now());
insert into `Member` values ('a1010','정약용','010-1234-1010','사원',105,now());
insert into `Member` values ('a1011','박지원','010-1234-1011','사원',105,now());

insert into `Department` values (101,'영업1부','051-512-1001');
insert into `Department` values (102,'영업2부','051-512-1002');
insert into `Department` values (103,'영업3부','051-512-1003');
insert into `Department` values (104,'영업4부','051-512-1004');
insert into `Department` values (105,'영업5부','051-512-1005');
insert into `Department` values (106,'영업지원부','051-512-1006');
insert into `Department` values (107,'인사부','051-512-1007');

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 1,  98100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 1, 136000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 1,  80100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2018, 1,  78000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 1,  93000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 2,  23500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 2, 126000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 2,  18500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 2,  19000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2018, 2,  53000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2019, 1,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 1, 109000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 1, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 1,  53500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2019, 1,  24000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 2, 160000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 2, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 2,  43000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2019, 2,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2019, 2, 109000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 1, 201000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 1,  63000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 1,  74000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2020, 1, 122000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2020, 1, 111000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 2, 120000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2020, 2,  93000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 2,  84000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 2, 180000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a108', 2020, 2,  76000);





#실습 4-3
select * from `Member` where `name`='김유신';
select * from `Member` where `pos`='차장' and dep=101;
select * from `Member` where `pos`='차장' or dep=101;
SELECT * FROM `Member` WHERE `name` != '김춘추';
SELECT * FROM `Member` WHERE `name` <> '김춘추';
SELECT * FROM `Member` WHERE `pos`='사원' OR `pos`='대리';
SELECT * FROM `Member` WHERE `pos` IN('사원', '대리');
SELECT * FROM `Member` WHERE `dep` IN(101, 102, 103);
SELECT * FROM `Member` WHERE `name` LIKE '%신';
SELECT * FROM `Member` WHERE `name` LIKE '김%';
SELECT * FROM `Member` WHERE `name` LIKE '김_ _';
SELECT * FROM `Member` WHERE `name` LIKE '_성_';
SELECT * FROM `Member` WHERE `name` LIKE '정_';
SELECT * FROM `Sales` WHERE `sale` > 50000;
SELECT * FROM `Sales` WHERE `sale` >= 50000 AND `sale` < 100000 AND `month`=1;
SELECT * FROM `Sales` WHERE `sale` BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `sale` NOT BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `year` IN(2020);
SELECT * FROM `Sales` WHERE `month` IN(1, 2);

#실습 4-4
select * FROM `Sales` order by`Sale`;
select * FROM `Sales` order by`Sale` asc;
select * FROM `Sales` order by`Sale` desc;
select * FROM `Member` order by `name`;
select * FROM `Member` order by `name`desc;
select * FROM `Member` order by `rdate`asc;
select * FROM `Sales` where `sale`>50000 order by `sale` desc;
select * FROM `Sales` 
where `sale`>50000
order by `year`,`month`,`sale` desc;

#실습 4-5
select *from `Sales` limit 3;
select *from `Sales` limit 0,3; 
select *from `Sales` limit 1,2;
select *from `Sales` limit 5,3; #인덱스 번호 5번부터 3개라는 말 
select *from `Sales` order by`Sale`desc limit 3,5;
select *from `Sales` where `Sale` <50000 order by`Sale`desc limit 3;
select *from `Sales` 
where `sale` >50000
order by `year` desc,`month`,`sale`desc
limit 5;

#실습 4-6
#실습 4-7
#실습 4-8
#실습 4-9
#실습 4-10
#실습 4-11
#실습 4-12
#실습 4-13
#실습 4-14
#실습 4-15
#실습 4-16



