CREATE DATABASE IF NOT EXISTS arya;
USE arya;

CREATE TABLE aceit(
branch VARCHAR(15) PRIMARY KEY,
seats INT UNSIGNED NOT NULL
);

INSERT INTO aceit
(branch,seats)
VALUES
('CSE',180),
('IT',160),
('AIDS',80),
('EE',60),
('ECE',30),
('ME',60);

SELECT * FROM aceit;
DROP TABLE aceit;

CREATE TABLE student(
 id INT UNSIGNED,
 name VARCHAR(50) NOT NULL,
 gender VARCHAR(6) CHECK (gender="male" OR gender="female"),
 section VARCHAR(5),
 rollno VARCHAR(12) NOT NULL UNIQUE,
 branch VARCHAR(30),
 city VARCHAR(30),
 10th TINYINT UNSIGNED,
 12th TINYINT UNSIGNED NOT NULL,
 cgpa  FLOAT UNSIGNED NOT NULL,
 place_status VARCHAR(3) NOT NULL,
 dob DATE,
 age  TINYINT UNSIGNED NOT NULL,
 mno  BIGINT UNSIGNED,
 year TINYINT UNSIGNED DEFAULT 4,
 PRIMARY KEY(id),
 FOREIGN KEY (branch) REFERENCES aceit(branch)
 ON UPDATE CASCADE
 ON DELETE CASCADE
);

DROP TABLE student;
SELECT * FROM student;
SHOW DATABASES;
SHOW TABLES;

-- inserting data into tables

INSERT INTO student
(id,name,gender,section,rollno,branch,city,10th,12th,cgpa,place_status,dob,age,mno)
VALUES
(100,"Ram","male","CSB","20EARCS108","CSE","Jodhpur",93,98,9.8,"YES",'2002-06-10',20,9636804831),
(101,"Denish","male","CSA","20EARCS040","CSE","Sikar",60,77,8.4,"NO",'2002-03-05',22,6578945312),
(102,"Sunithi","female","CSC","20EARCS137","CSE","Patna",75,72,9.5,"YES",'2001-09-25',20,8674142430);

INSERT INTO student
(id,name,gender,section,rollno,branch,city,10th,12th,cgpa,place_status,dob,age,mno)
VALUES
(103,"Navratan","male","CSB","20EARCS107","CSE","Jodhpur",63,75,9.27,"YES",'2002-06-10',21,6375794250),
(104,"Rashmi","female","IT","20EARIT168","IT","Ajmer",90,94,9.6,"YES",'2002-03-05',22,6532738600),
(105,"Ashok","male","CSA","20EARCS037","CSE","Jodhpur",75,72,9.2,"NO",'2001-09-24',20,8824101854);

INSERT INTO student
(id,name,gender,section,rollno,branch,city,10th,12th,cgpa,place_status,dob,age,mno)
VALUES
(121,"Nikhil","male","AIDS","20EARCS177","AIDS","Jaipur",60,73,8.3,"NO",'2004-02-28',23,8886668746);

INSERT INTO student (id,name, gender, section, rollno, branch, city, 10th, 12th, cgpa, place_status, dob, age, mno)
VALUES
    (106,'Sunil', 'male', 'CSA', '20EARCS301', 'CSE', 'Jaipur', 70, 85, 8.5, 'YES', '2000-01-15', 22, 9876543210),
    (107,'Priya', 'female', 'CSB', '20EARCS120', 'CSE', 'Jodhpur', 75, 80, 8.2, 'NO', '1999-05-20', 23, 8176543211),
    (108,'Mukesh', 'male', 'IT', '20EARIT123', 'IT', 'Udaipur', 80, 90, 9.0, 'YES', '2002-03-10', 20, 6976543212),
    (109,'Durga', 'female', 'AIDS', '20EARAI62', 'AIDS', 'Ajmer', 85, 95, 9.4, 'YES', '2001-08-05', 21, 9876543213),
    (110,'Rakesh', 'male', 'CSA', '20EARCS96', 'CSE', 'Kota', 65, 75, 7.8, 'NO', '2000-12-25', 22, 8096543214),
    (111,'Radha', 'female', 'CSB', '20EARCS86', 'CSE', 'Bikaner', 70, 78, 8.0, 'YES', '1998-09-17', 24, 9276543215),
    (112,'Nirmal', 'male', 'IT', '20EARIT100', 'IT', 'Alwar', 78, 88, 8.8, 'YES', '2003-02-08', 19, 8292543216),
    (113,'Priyanka', 'female', 'AIDS', '20EARAI67', 'AIDS', 'Sikar', 90, 92, 9.2, 'YES', '1997-07-30', 25, 6787543217),
    (114,'Mohit', 'male', 'CSA', '20EARCS79', 'CSE', 'Jaipur', 72, 84, 8.3, 'NO', '2001-04-12', 21, 9976543218),
    (115,'Rekha', 'female', 'CSB', '20EARCS80', 'CSE', 'Jodhpur', 68, 76, 7.9, 'YES', '1999-11-03', 22, 7576543219),
    (116,'Arjun', 'male', 'IT', '20EARIT110', 'IT', 'Udaipur', 82, 91, 9.1, 'YES', '2002-06-28', 20, 6676543220),
    (117,'Lavina', 'female', 'AIDS', '20EARAI102', 'AIDS', 'Ajmer', 88, 94, 9.3, 'YES', '1998-03-14', 24, 8066543221),
    (118,'Bodhraj', 'male', 'CSA', '20EARCS113', 'CSE', 'Kota', 62, 70, 7.5, 'NO', '1997-10-22', 25, 6876543222),
    (119,'Prachi', 'female', 'CSB', '20EARCS144', 'CSE', 'Bikaner', 72, 79, 8.1, 'YES', '2000-07-19', 21, 8876543223),
    (120,'Tarun', 'male', 'IT', '20EARIT115', 'IT', 'Alwar', 79, 87, 8.7, 'YES', '2003-01-02', 20, 9876543224);
    
    
SELECT * FROM student WHERE branch='CSE';
SELECT section,avg(cgpa) FROM student GROUP BY section ORDER BY cgpa;

SELECT branch, gender, COUNT(gender)
FROM student
GROUP BY branch, gender;

SELECT section,count(name) FROM student GROUP BY section;
SELECT DISTINCT section,name,cgpa FROM student WHERE cgpa>=9 ORDER BY cgpa DESC;

SELECT section, COUNT(*) AS count
FROM student
WHERE cgpa >= 9
GROUP BY section;

SET SQL_SAFE_UPDATES=0; 
--  TO TURN OFF SAFE MODE OF SQL

SELECT * FROM student ORDER BY name ;
SELECT * FROM arya.student WHERE city IN ('Jaipur','Jodhpur');
SELECT * FROM student WHERE age BETWEEN 21 AND 23;



-- updating data of college student
UPDATE student SET name="Sumit",gender='male',section="AIDS",rollno='20EARAI80' WHERE name='Rekha' AND id=115;
UPDATE student SET branch="AIDS" WHERE id=115;
UPDATE student SET place_status="NO" WHERE cgpa<8;
UPDATE student SET age=age+1 WHERE id=100;

-- DELETING ROWS OF TABLE
DELETE FROM student WHERE id=121;
DELETE FROM student WHERE name='Suresh' AND branch='CSE';
DELETE FROM student WHERE branch='ME' AND cgpa<6;
DELETE FROM student WHERE city IN('Usa','China');

--  ALTER
ALTER TABLE student 
RENAME TO Std;

ALTER TABLE student 
 ADD COLUMN batch VARCHAR(50); 
 
ALTER TABLE student 
 DROP COLUMN dep_id;
 
 ALTER TABLE student 
 CHANGE batch dep_id INT DEFAULT 10;
 
 ALTER TABLE student
 MODIFY batch INT ;
 
--  deleting all rows in table without deleting table
-- TRUNCATE TABLE student;

--  JOINS
 SELECT * FROM student INNER JOIN aceit 
 ON student.branch=aceit.branch;
 
 SELECT * FROM
 aceit as A
 LEFT JOIN student as S
 ON A.branch=S.branch
 UNION
SELECT * FROM
 aceit as A
 RIGHT JOIN student as S
 ON A.branch=S.branch;
 
 -- SUB - QUERIES 
 SELECT * FROM student WHERE cgpa=(SELECT MAX(cgpa) FROM student WHERE cgpa<(SELECT MAX(cgpa) FROM student));
 SELECT * FROM student WHERE cgpa>(SELECT AVG(cgpa) FROM student) ORDER BY cgpa;
 SELECT * FROM student WHERE id%2=0 ORDER BY id ASC;
 SELECT * FROM (SELECT * FROM student WHERE city="Jodhpur") AS tmp ORDER BY cgpa DESC LIMIT 3;
 
--  creating small view of large data for another sharing use 
CREATE VIEW view1 AS
SELECT name,gender,section FROM student ;

SELECT * FROM view1;
DROP VIEW view1;