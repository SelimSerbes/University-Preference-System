Create Table tbl_university(
"university_id" serial NOT NULL,
"name" varchar(100) NOT NULL,
"address" varchar(100) NOT NULL,
"e-mail" varchar(50) NOT NULL,
"city" varchar(20) NOT NULL,
"type" varchar(7) NOT NULL,
"year" integer NOT NULL,
CONSTRAINT "pk_university_id" PRIMARY KEY("university_id")
);

Create Table tbl_faculty(
"faculty_id" serial NOT NULL,
"university_id" int NOT NULL,
"name" varchar(100) NOT NULL,
"e-mail" varchar(50) NOT NULL,
CONSTRAINT "pk_faculty_id" PRIMARY KEY("faculty_id"),
CONSTRAINT "for_key_university_id" FOREIGN KEY("university_id")
REFERENCES tbl_university("university_id") match simple
ON UPDATE CASCADE ON DELETE CASCADE
);

Create Table tbl_department(
"department_id" serial NOT NULL,
"faculty_id" int NOT NULL,
"university_id" int NOT NULL,
"name" varchar(100) NOT NULL,
"e-mail" varchar(50) NOT NULL,
"language" varchar(20) NOT NULL,
"type" varchar(20) NOT NULL,
"quota" integer NOT NULL,
"top_ranked_student" integer NOT NULL,
"period" integer NOT NULL,
"minimum_score" integer NOT NULL,
"minimum_order" integer NOT NULL,
CONSTRAINT "pk_department_id" PRIMARY KEY("department_id"),
CONSTRAINT "for_key_university_id" FOREIGN KEY("university_id")
REFERENCES tbl_university("university_id") match simple
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT "for_key_faculty_id" FOREIGN KEY("faculty_id")
REFERENCES tbl_faculty("faculty_id") match simple
ON UPDATE CASCADE ON DELETE CASCADE
);

Create Table tbl_student(
"student_id" serial NOT NULL,
"name" varchar(100) NOT NULL,
"surname" varchar(100) NOT NULL,
"examination_score" integer NOT NULL,
"ranking_of_student" integer NOT NULL,
"position_of_student" integer NOT NULL,
"first_preference" integer NOT NULL,
"second_preference" integer NOT NULL,
"third_preference" integer NOT NULL,
CONSTRAINT "pk_student_id" PRIMARY KEY("student_id")
);

Create Table tbl_preference(
"preference_id" int NOT NULL,
"department_id" int NOT NULL,
"student_id" int NOT NULL,
CONSTRAINT "pks" PRIMARY KEY("student_id","department_id","preference_id"),
CONSTRAINT "for_key_department_id" FOREIGN KEY("department_id")
REFERENCES tbl_department("department_id") match simple
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT "for_key_student_id" FOREIGN KEY("student_id")
REFERENCES tbl_student("student_id") match simple
ON UPDATE CASCADE ON DELETE CASCADE
);

insert into tbl_university("name","address","e-mail","city","type","year")
values('Dokuz Eylul University','Tınaztepe','deu@gmail.com','İzmir','state',1982),
('Ege University','Bornova','ege@gmail.com','İzmir','state',1956),
('İzmir Katip Celebi University','Cigli','ikc@gmail.com','İzmir','state',2010),
('İzmir Yüksek Teknolojileri Enstitüsü','Urla','iyte@gmail.com','İzmir','state',1992),
('Yasar University','Bornova','yu@gmail.com','İzmir','private',2001),
('Bilkent University','Çankaya','bu@gmail.com','Ankara','private',1984),
('Hacettepe University','Sıhhiye','hu@gmail.com','Ankara','state',1967),
('İzmir Teknik University','Urla','itu@gmail.com','İzmir','state',1992),
('İzmir University','Karabağlar','iu@gmail.com','İzmir','private',2007)

insert into tbl_faculty("university_id","name","e-mail")
values(1,'Engineering','deueng@gmail.com'),
(1,'Medicine','deumedic@gmail.com'),
(1,'Education','deuedu@gmail.com'),
(2,'Medicine','egemedic@gmail.com'),
(2,'Engineering','egeeng@gmail.com'),
(3,'Medicine','ikcmedic@gmail.com'),
(3,'Engineering','ikceng@gmail.com'),
(4,'Engineering','iyteeng@gmail.com'),
(5,'Engineering','yueng@gmail.com'),
(5,'Law','yulaw@gmail.com'),
(6,'Engineering','bueng@gmail.com'),
(6,'Law','bulaw@gmail.com'),
(7,'Medicine','humedic@gmail.com'),
(7,'Engineering','hueng@gmail.com'),
(9,'Education','iuedu@gmail.com'),
(9,'Visual Arts','iuva@gmail.com')

insert into tbl_department("faculty_id","university_id","name","e-mail","language",
"type",
"quota", 
"top_ranked_student",
"period",
"minimum_score",
"minimum_order")
values(1,1,'Computer Engineering','deuceng@gmail.com','english','öö',90,3,4,444,33624),
(4,2,'Medicine','egemedic@gmail.com','turkish','öö',340,10,6,513,3730),
(10,6,'Computer Engineering','buceng@gmail.com','english','öö',80,9,5,464,21690),
(9,5,'Electronic Engineering','yueeng@gmail.com','turkish','iö',95,7,4,261,250324),
(7,3,'Computer Engineering','ikcuceng@gmail.com','turkish','iö',100,5,4,320,150624),
(13,7,'Medicine','humedic@gmail.com','english','öö',100,4,6,486,11743),
(10,5,'Law','yulaw@gmail.com','turkish','öö',138,4,4,318,172635),
(12,6,'Law','bulaw@gmail.com','turkish','öö',117,5,4,381,45320),
(15,9,'Teacher','iutea@gmail.com','turkish','iö',120,10,4,310,210321),
(16,9,'Painter','iupain@gmail.com','turkish','öö',60,3,4,290,230212)

insert into tbl_student("name","surname","examination_score","ranking_of_student",
"position_of_student",
"first_preference",
"second_preference",
"third_preference"
)
values('Özay','Platin',456,31245,5,1,3,5),
('Baki','Bakır',469,20545,1,3,1,5),
('Ozan','Gümüş',515,3700,1,2,6,3),
('Ayşe','Altın',324,148545,25,5,2,1),
('Zeynep','Elmas',492,9500,2,2,6,1),
('Kaan','Demir',455,30545,1,3,1,2),
('İlknur','Obsidyen',265,248545,28,4,1,5),
('Erol','Taş',514,3709,2,2,3,4),
('Gamze','Granit',449,32545,4,3,1,5),
('Veli','Kaya',475,18545,2,3,1,2)

insert into tbl_preference("preference_id","department_id",
"student_id")
values(1,1,1),(2,3,1),(3,5,1),(1,3,2),(2,1,2),(3,5,2),(1,2,3),(2,6,3),(3,3,3),
(1,5,4),(2,2,4),(3,1,4),(1,2,5),(2,6,5),(3,1,5),(1,3,6),(2,1,6),(3,2,6),
(1,4,7),(2,1,7),(3,5,7),(1,2,8),(2,3,8),(3,4,8),(1,3,9),(2,1,9),(3,5,9),
(1,3,10),(2,1,10),(3,2,10)

/* Query 1 */
Select name from tbl_university where (city like 'İ%')
and (year >1990)

/* Query 2 */
Select tbl_university.name from tbl_faculty
inner join tbl_university on tbl_faculty.university_id=tbl_university.university_id
where tbl_faculty.name in('Medicine','Engineering')
group by tbl_university.name
having Count(*) > 1

/* Query 3 */
Select tbl_university.type,Count(*) from tbl_faculty
inner join tbl_university on tbl_faculty.university_id=tbl_university.university_id
group by tbl_university.type

/* Query 4 */
Select tbl_department.type,tbl_department.name,tbl_university.name from tbl_university
inner join tbl_department on tbl_department.university_id=tbl_university.university_id
where tbl_department.type='iö' and tbl_department.name like '%Engineering%'

/* Query 5 */
Select name,period ,minimum_score as highscore from tbl_department
Order by period DESC,"highscore" DESC
LIMIT 5

/* Query 6 */
Select tbl_department.period,tbl_university.name,tbl_department.name,
tbl_preference.department_id,Count(*) from tbl_preference
inner join tbl_department on tbl_department.department_id=tbl_preference.department_id
inner join tbl_university on tbl_department.university_id=tbl_university.university_id
group by tbl_department.period,tbl_university.name,tbl_department.name,
tbl_preference.department_id
having tbl_department.period=4
order by Count(*) Desc
LIMIT 5

/* Query 7 */
Select * from tbl_student
inner join tbl_preference on tbl_student.student_id=tbl_preference.student_id
inner join tbl_department on tbl_department.department_id=tbl_preference.department_id
where tbl_department.name='Computer Engineering' and tbl_preference.preference_id=1
order by tbl_student.examination_score DESC

/* Query 8 */
/*1.*/
Update tbl_faculty
Set "university_id"=8,
"e-mail"='itueng@gmail.com'
where "faculty_id"=1
/*2.*/
Update tbl_department
Set "university_id"=8
where "faculty_id"=1

/* Query 9 */
Update tbl_department
Set "period"="period" + 1
from tbl_faculty
where tbl_faculty.name = 'Law'
and tbl_department.faculty_id=tbl_faculty.faculty_id

/* Query 10 */
Delete from tbl_faculty
where tbl_faculty.university_id=9

select * from tbl_university
select * from tbl_faculty
select * from tbl_department
select * from tbl_student
select * from tbl_preference

Drop table tbl_university
Drop table tbl_faculty
Drop table tbl_department
Drop table tbl_student
Drop table tbl_preference
