#날짜 : 2022/09/02
#이름 : 김시아
#내용 : SQL 연습문제4

#실습 4-1
create database `java1_BookStore`;
CREATE USER 'java1_admin4'@'%'identified BY '1234';
grant ALL privileges ON `java1_BookStore`.* TO 'java1_admin4'@'%';
FLUSH privileges;

#실습 4-2
CREATE TABLE `Customer`(
         `custId`   INT AUTO_INCREMENT PRIMARY KEY,
         `name`     VARCHAR(10) NOT NULL ,
         `address`  VARCHAR(20) DEFAULT NULL,
         `phone`    VARCHAR(13) DEFAULT NULL
         );
 
 CREATE TABLE `Book`(
		 `bookId`  INT NOT NULL PRIMARY KEY,
         `bookName` VARCHAR(20) NOT NULL,
         `publisher` VARCHAR(20) NOT NULL,
         `price`    INT DEFAULT NULL
         );
         
 CREATE TABLE `Order`(
		 `orderId`  INT AUTO_INCREMENT PRIMARY KEY,
         `custId`   INT NOT NULL,
         `bookId`   INT NOT NULL,
         `salePrice` int not null,
         `orderDate`  date not null
         );
         
         
#실습 4-3
insert into `Customer` values (1,'박지성','영국 맨체스타','010-5000-0001');
insert into `Customer` values (2,'김연아','대한민국 서울','010-6000-0001');
insert into `Customer` values (3,'장미란','대한민국 강원도','010-7000-0001');
insert into `Customer` values (4,'추신수','미국 클리블랜드','010-8000-0001');
insert into `Customer` values (5,'박세리','대한민국 대전',null);

insert into `Book` values (1,'축구의 역사','굿스포츠',7000);
insert into `Book` values (2,'축구아는 여자','나무수',13000);
insert into `Book` values (3,'축구의 이해','대한미디어',22000);
insert into `Book` values (4,'골프 바이블','대한미디어',35000);
insert into `Book` values (5,'피겨 교본','굿스포츠',8000);
insert into `Book` values (6,'역도 단계별기술','굿스포츠',6000);
insert into `Book` values (7,'야구의 추억','이상미디어',20000);
insert into `Book` values (8,'야구를 부탁해','이상미디어',13000);
insert into `Book` values (9,'올림픽 이야기','삼성당',7500);
insert into `Book` values (10,'Olympic Champions','Pearson',13000);

insert into `Order` values (1,1,1,6000,'2014-07-01');
insert into `Order` values (2,1,3,21000,'2014-07-03');
insert into `Order` values (3,2,5,8000,'2014-07-03');
insert into `Order` values (4,3,6,6000,'2014-07-04');
insert into `Order` values (5,4,7,20000,'2014-07-05');
insert into `Order` values (6,1,2,12000,'2014-07-07');
insert into `Order` values (7,4,8,13000,'2014-07-07');
insert into `Order` values (8,3,10,12000,'2014-07-08');
insert into `Order` values (9,2,10,7000,'2014-07-09');
insert into `Order` values (10,3,8,13000,'2014-07-10');


#실습 4-4
select `custId`,`name`,`address` from `Customer`;

#실습 4-5
select `bookname`,`price` from `Book`;

#실습 4-6
select `price`,`bookname` from `Book`;

#실습 4-7
select * from `Book`;

#실습 4-8
select `publisher` from `Book`;

#실습 4-9
select distinct `publisher` from `Book`;

#실습 4-10
select * from `Book` where `price`>= 20000;

#실습 4-11
select * from `Book` where `price` <20000;

#실습 4-12
select * from `Book` where `price` >=10000 and `price`<=20000;

#실습 4-13
select `bookId`,`bookName`,`price` from `Book` where `price` >=15000 and `price`<=30000;

#실습 4-14
select * from `Book` where `bookId` in(2,3,5);

#실습 4-15
select *from `Book` where `bookId` % 2 =0;

#실습 4-16
select * from `Customer` where `name` like '박%';

#실습 4-17
select * from `Customer` where `address` like '대한민국%';

#실습 4-18
select * from `Customer` where `phone` is not null;

#실습 4-19
SELECT * FROM `Book` WHERE `publisher` IN('굿스포츠', '대한미디어');
SELECT * FROM `Book` WHERE `publisher`='굿스포츠' OR  `publisher`='대한미디어';



#실습 4-20
select `publisher` from `Book` where `bookName` = '축구의 역사' ;

#실습 4-21
select `publisher` from `Book` where `bookName` like '축구%';

#실습 4-22
select * from `Book` where `bookName` like '_구%';

#실습 4-23
SELECT * FROM `Book` WHERE `bookName` LIKE '%축구%' AND `price` >= 20000;

#실습 4-24
SELECT * FROM `Book` ORDER BY `bookName`;

#실습 4-25
SELECT * FROM `Book` ORDER BY `price` ASC, `bookName` ASC;

#실습 4-26
SELECT * FROM `Book` ORDER BY `price` DESC, `publisher` ASC;

#실습 4-27
SELECT * FROM `Book` ORDER BY `price` DESC LIMIT 3;

#실습 4-28
SELECT * FROM `Book` ORDER BY `price` ASC LIMIT 3;

#실습 4-29
SELECT SUM(`salePrice`) AS `총판매액` FROM `Order`;

#실습 4-30
SELECT 
	SUM(`salePrice`) AS `총판매액`,
	AVG(`salePrice`) AS `평균값`,
	MIN(`salePrice`) AS `최저가`,
	MAX(`salePrice`) AS `최고가`
FROM 
	`Order`;
    
#실습 4-31
SELECT COUNT(*) AS `판매건수` FROM `Order`;

#실습 4-32
select `bookId`,
		replace(`bookName`,'야구','농구') as `bookName`,
        `publisher`,
        `price`
 from `Book`;
 
#실습 4-33
SELECT `custId`, COUNT(*) AS `수량` FROM `Order` 
WHERE `salePrice` >= 8000
GROUP BY `custId`
HAVING `수량` >= 2;

#실습 4-34
SELECT * FROM `Customer` AS a JOIN `Order` AS b ON a.custNo = b.custNo;
SELECT * FROM `Customer` JOIN `Order` USING(`custId`);
SELECT * FROM `Customer`, `Order` WHERE `Customer`.custNo = `Order`.custNo;

#실습 4-35
SELECT * FROM `Customer` AS a 
	JOIN `Order` AS b ON a.custNo = b.custNo
		ORDER BY a.`custId`;
        
#실습 4-36
SELECT `name`, `salePrice` FROM `Customer` AS a 
	JOIN `Order` AS b ON a.custNo = b.custNo;

#실습 4-37
SELECT `name`, SUM(`salePrice`) FROM `Customer` AS a 
	JOIN `Order` AS b ON a.custNo = b.custNo
		GROUP BY a.`custId`
			ORDER BY a.`name` ASC;


#실습 4-38
SELECT `name`, `bookName` FROM `Book` AS a
JOIN `Order` AS b ON a.bookNo = b.bookNo
JOIN `Customer` AS c ON b.custNo = c.custNo;

#실습 4-39
SELECT `name`, `bookName` FROM `Book` AS a
JOIN `Order` AS b ON a.bookNo = b.bookNo
JOIN `Customer` AS c ON b.custNo = c.custNo
WHERE `price`=20000;


#실습 4-40
SELECT `name`, `salePrice` FROM `Order` AS a
RIGHT JOIN `Customer` AS b ON a.custNo = b.custNo;

#실습 4-41
select `bookName` from `Book` where `price`=(select max(`price`) from `Book`);

#실습 4-42
select `name` from `Customer` where `custId` not in(select distinct `custId` from `Order`);

#실습 4-43
select sum(`salePrice`) as `총합` from `Order` where `custId`=(select `custId` from `Customer` where `name`='김연아');

#실습 4-44
INSERT INTO `Book`(`bookId`, `bookName`,`publisher`) VALUES(11, '스포츠의학','한솔의학서적');

#실습 4-45
UPDATE `Customer` SET `address`='대한민국 부산' WHERE `custId`=5;

#실습 4-46
DELETE FROM `Customer` WHERE `custId`=5;




