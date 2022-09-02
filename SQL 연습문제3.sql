#날짜 : 2022/09/01
#이름 : 김시아
#내용 : SQL 연습문제3


#실습 3-1
create database `java1_College`;
create user 'java1_admin3'@'%' identified by '1234';
grant all privileges on java1_College.* to 'java1_admin3'@'%';
flush privileges;

#실습 3-2
create table `Student` (
          `stdNo`      char(8) primary key,
          `stdName`    varchar(20) not null,
          `stdHp`      char(13) not null,
          `stdYear`    tinyint  not null,   
          `stdAddress` varchar(100)
);

create table `Lecture`(
          `lecNo`      int primary key,
          `lecName`    varchar(20) not null,
          `lecCredit`  tinyint not null,
          `lecTime`    int not null,
          `lecClass`   varchar(10) default null
);


create table `Register`(
         `regStdNo`        char(8) ,
         `regLecNo`        int ,
         `regMidScore`     tinyint ,
         `regFinalScore`   tinyint ,
         `regTotalScore`   tinyint,
         `regGrade`        char(1)
);

#실습 3-3
insert into `Student` values (20201016,'김유신','010-1234-1001',3,'null');
insert into `Student` values (20201126,'김춘추','010-1234-1002',3,'경상남도 경주시');
insert into `Student` values (20210216,'장보고','010-1234-1003',2,'전라남도 완도시');
insert into `Student` values (20210326,'강감찬','010-1234-1004',2,'서울시 영등포구');
insert into `Student` values (20220416,'이순신','010-1234-1005',1,'부산시 부산진구');
insert into `Student` values (20220521,'송상현','010-1234-1006',1,'부산시동래구');

insert into `lecture` values (159,'인지행동심리학',3,40,'본304');
insert into `lecture` values (167,'운영체제론',3,25,'본805');
insert into `lecture` values (234,'중급 영문법',3,20,'본201');
insert into `lecture` values (239,'세법개론',3,40,'본204');
insert into `lecture` values (248,'빅데이터개론',3,20,'본801');
insert into `lecture` values (253,'컴퓨팅사고와 코딩',2,10,'본802');
insert into `lecture` values (349,'사회복지 마케팅',2,50,'본301');

insert into `register` (`regStdNo`,`regLecNo`) values ('20201126',234);
insert into `register` (`regStdNo`,`regLecNo`) values ('20201016',248);
insert into `register` (`regStdNo`,`regLecNo`) values ('20201016',253);
insert into `register` (`regStdNo`,`regLecNo`) values ('20201126',239);
insert into `register` (`regStdNo`,`regLecNo`) values ('20210216',349);
insert into `register` (`regStdNo`,`regLecNo`) values ('20210326',349);
insert into `register` (`regStdNo`,`regLecNo`) values ('20201016',167);
insert into `register` (`regStdNo`,`regLecNo`) values ('20220416',349);



#실습 3-4
select * from `lecture`;

#실습 3-5
select * from `student`;

#실습 3-6
select * from `register`;

#실습 3-7
select * from `student` where  `stdYear`=3;

#실습 3-8
select * from `lecture` where `leccredit`=2;

#실습 3-9
update `register` set `regmidscore`=36,`regfinalscore`=42 where `regstdno`='20201126' and `reglecno` = 234;
update `register` set `regmidscore`=24,`regfinalscore`=62 where `regstdno`='20201016' and `reglecno` = 248;
update `register` set`regmidscore`=28,`regfinalscore`=40 where `regstdno`='20201016' and `reglecno` = 253;
update `register` set`regmidscore`=37,`regfinalscore`=57 where `regstdno`='20201126' and `reglecno` = 239;
update `register` set`regmidscore`=28,`regfinalscore`=68 where `regstdno`='20210216' and `reglecno` = 349;
update `register` set`regmidscore`=16,`regfinalscore`=65 where `regstdno`='20210326' and `reglecno` = 349;
update `register` set`regmidscore`=18,`regfinalscore`=38 where `regstdno`='20201016' and `reglecno` = 167;
update `register` set`regmidscore`=25,`regfinalscore`=58 where `regstdno`='20220416' and `reglecno` = 349;
select * from `register`;


#실습 3-10
update `register` set
                `regtotalscore`=`regmidscore`+`regfinalscore`,
                `reggrade` = if(`regtotalscore`>=90,'A',
                             if(`regtotalscore`>=80,'B',
                             if(`regtotalscore`>=70,'C',
                             if(`regtotalscore`>=60,'D','F'))));
select * from `register`;
                             
#실습 3-11
select * from `register` order by `regtotalscore` desc;

#실습 3-12
select * from `register` where `reglecno`=349 order by `regtotalscore` desc;

#실습 3-13
select * from `lecture` where `lectime`>=30;

#실습 3-14
select `LegName`,`lecClass` from `Lecture`;

#실습 3-15
SELECT `stdNo`, `stdName` FROM `Student`;

#실습 3-16
select * from `student` where `stdAddress` is null;

#실습 3-17
SELECT * FROM `Student` WHERE `stdAddress` LIKE '%부산%';

#실습 3-18
SELECT * FROM `Student` AS a
left JOIN `Register` AS b
ON a.stdNo = b.regStdNo;

#실습 3-19
SELECT 
	`stdNo`,
	`stdName`,
	`regLecNo`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
FROM `Student` AS a, `Register` AS b 
WHERE a.stdNo = b.regStdNo;

#실습 3-20
SELECT `stdName`, `stdNo`, `regLecNo`
FROM `Student` AS a
JOIN `Register` AS b 
ON a.stdNo = b.regStdNo
WHERE `regLecNo`=349;

#실습 3-21
SELECT
	`stdNo`,
	`stdName`,
	COUNT(`stdNo`) AS `수강신청 건수`,
	SUM(`regTotalScore`) AS `종합점수`,
	SUM(`regTotalScore`) / COUNT(`stdNo`) AS `평균`	
FROM `Student` AS a
JOIN `Register` AS b 
ON a.stdNo = b.regStdNo
GROUP BY `stdNo`;

#실습 3-22
SELECT * FROM `Register` AS a
JOIN `Lecture` AS b
ON a.regLecNo = b.lecNo;


#실습 3-23
SELECT 
	`regStdNo`,
	`regLecNo`,
	`lecName`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
FROM `Register` AS a
JOIN `Lecture` AS b
ON a.regLecNo = b.lecNo;

#실습 3-24
SELECT
	COUNT(*) AS `사회복지 마케팅 수강 신청건수`,
	AVG(`regTotalScore`) AS `사회복지 마케팅 평균`
FROM `Register` AS a
JOIN `Lecture` AS b
ON a.regLecNo = b.lecNo
WHERE `lecName`='사회복지 마케팅';

#실습 3-25
SELECT 
	`regStdNo`,
	`lecName`
FROM `Register` AS a
JOIN `Lecture` AS b
ON a.regLecNo = b.lecNo
WHERE `regGrade`='A';

#실습 3-26
SELECT * FROM `Student` AS a
JOIN `Register` AS b ON a.stdNo = b.regStdNo
JOIN `Lecture` AS c ON b.regLecNo = c.lecNo;

#실습 3-27
SELECT
	`stdNo`,
	`stdName`,
	`lecNo`,
	`lecName`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`	
FROM `Student` AS a
JOIN `Register` AS b ON a.stdNo = b.regStdNo
JOIN `Lecture` AS c ON b.regLecNo = c.lecNo
ORDER BY `regGrade`;

#실습 3-28
SELECT 
	`stdNo`,
	`stdName`,
	`lecName`,
	`regTotalScore`,
	`regGrade`
FROM `Student` AS a
JOIN `Register` AS b ON a.stdNo = b.regStdNo
JOIN `Lecture` AS c ON b.regLecNo = c.lecNo
WHERE `regGrade` = 'F';

#실습 3-29
SELECT 
	`stdNo`,
	`stdName`,
	SUM(`lecCredit`) AS `이수학점`
FROM `Student` AS a
JOIN `Register` AS b ON a.stdNo = b.regStdNo
JOIN `Lecture` AS c ON b.regLecNo = c.lecNo
WHERE `regTotalScore` >=60
GROUP BY `stdNo`;

#실습 3-30
SELECT 
	`stdNo`,
	`stdName`,
	GROUP_CONCAT(`lecName`) AS `신청과목`,
	GROUP_CONCAT(if(`regTotalScore` >= 60, `lecName`, null)) AS `이수과목`
FROM `Student` AS a
JOIN `Register` AS b ON a.stdNo = b.regStdNo
JOIN `Lecture` AS c ON b.regLecNo = c.lecNo
GROUP BY `stdNo`;
