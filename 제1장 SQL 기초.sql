#날짜 : 2022/08/22
#이름 : 김시아
#내용 : 제1장 SQL 기초 

#실습 1-1
CREATE DATABASE `UserDB`;
DROP DATABASE `UserDB`;

#실습 1-2
CREATE TABLE `User1`(
     `uid`  VARCHAR(10),
     `name` VARCHAR(10),
     `hp`   CHAR(13),
     `age`  INT
);     

DROP TABLE `User1`;

#실습 1-3
INSERT INTO `User1` VALUES ('A101','김유신','010-1234-1111',25);
INSERT INTO `User1` VALUES ('A102','김춘추','010-1234-2222',23);
INSERT INTO `User1` VALUES ('A103','장보고','010-1234-3333',32);
INSERT INTO `User1` (`uid`,`name`,`age`) VALUES ('A104','강감찬','45');
INSERT INTO `User1` SET 
                       `uid`='A105',
                       `name`='이순신',
                       `hp`='010-1234-5555';
                       
#실습 1-4
SELECT * FROM `User1`;
SELECT * FROM `User1` WHERE `uid`='A101';
SELECT * FROM `User1` WHERE `name`='김춘추';
SELECT * FROM `User1`  WHERE `age` < 30;
SELECT * FROM `User1`  WHERE `AGE` >= 30;
SELECT `uid`,`name`,`age` FROM `User1`;

#실습 1-5
UPDATE `User1` SET `hp`='010-1234-4444' WHERE `uid`='A104';
UPDATE `User1` SET `age`=51 WHERE `uid`='A105';
UPDATE `User1` SET 
                     `hp`='010-1234-1001',
					 `age`=27 
                   WHERE 
                      `uid`='A101';
                      
#실습 1-6
delete from `User1` where `uid`='A101';
delete from `User1` where `uid`='A102' and `age`=23;
delete from `User1` where `age` >= 30;

#실습 1-7
#회원 테이블 (TblUser)
create table `Tbluser`  (
		`userId`    varchar(10),
		`userName`  varchar(10),
		`userHp`    char(13),
		`userAge`   tinyint,
		`userAddr`  varchar(20)
);
#제품 테이블 (TblProduct)
create table `TblProduct`(
         `prdCode`     int,
         `prdName`     varchar(10),
         `prdPrice`    int,
         `prdAmount`   int,
         `prdCompany`  varchar(10),
         `prdMakeDate` date
         );
         
#실습 1-8
insert into `TblUser` values ('p101','김유신','010-1234-1001',25,'서울시 중구');
insert into `TblUser` values ('p102','김춘추','010-1234-1002',23,'부산시 금정구');
insert into `TblUser` set `userId`= 'p103', `userName` = '장보고' , `userAge`=31 , `userAddr` = '경기도 광주군' ;
insert into `TblUser` set `userId`= 'p104', `userName` = '강감찬', `userAddr` = '경남 창원시';
insert into `TblUser` set `userId`= 'p105', `userName` = '이순신',`userAge`=50;

insert into `TblProduct` values (1,'냉장고',800,10,'LG','2022-01-06');
insert into `TblProduct` values (2,'노트북',1200,20,'삼성','2022-01-06');
insert into `TblProduct` values (3,'TV',1400,6,'LG','2022-01-06');
insert into `TblProduct` values (4,'세탁기',1000,8,'LG','2022-01-06');
insert into `TblProduct` values (5,'컴퓨터',1100,0,null,null);
insert into `TblProduct` values (6,'휴대폰',900,102,'삼성','2022-01-06');



#실습 1-9
SELECT * FROM `Tbluser`;
SELECT `userName` from `TblUser`;
select `userName` `userHp` from `TblUser`;
SELECT * FROM `TblUser` where `userId`='p102';
SELECT * FROM `TblUser` WHERE `userId`='p104' OR `userId`='p105';
SELECT * FROM `TblUser` WHERE `userAddr`='신라';
SELECT * FROM `TblUser` WHERE `userAge` > 30;
SELECT * FROM `TblUser` WHERE `userHP` IS NULL;
UPDATE `TblUser` SET `userAge`=42 WHERE `userID`='p104';
UPDATE `TblUser` SET `userAddr`='경남 김해시' WHERE `userId`='p105';
DELETE FROM `TblUser` WHERE `userId`='p103';
SELECT * FROM `TblProduct`;
SELECT `prdName` FROM `TblProduct`;
SELECT `prdName`, `prdPrice` FROM `TblProduct`;
SELECT * FROM `TblProduct` WHERE `prdCompany`='LG';
SELECT * FROM `TblProduct` WHERE `prdCompany`='삼성';
UPDATE `TblProduct` SET 
 `prdCompany`='삼성', 
 `prdMakeDate`='2021-01-01' 
 where `prdCode`=5






