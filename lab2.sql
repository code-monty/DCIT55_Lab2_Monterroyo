SET SQL_SAFE_UPDATES = 0; /*To turn off the safe mode*/

DROP DATABASE monterroyo_lab2;
CREATE DATABASE monterroyo_lab2;
SHOW DATABASES;
USE monterroyo_lab2;

CREATE TABLE tblStudent(
studentNumber INT(11) PRIMARY KEY AUTO_INCREMENT, 
firstName VARCHAR(100), 
lastName VARCHAR(100) NOT NULL, 
middleName VARCHAR(100), 
birthdate VARCHAR(20), 
citizenship VARCHAR(50) COMMENT 'Example: Filipino, Nigerian,Korean',
gender VARCHAR(100) COMMENT 'Male or Female'
);

SHOW FULL COLUMNS FROM tblStudent;

INSERT INTO tblStudent(studentNumber, firstName, lastName, middleName, 
birthdate, citizenship, gender) VALUES(202014912, "STEVEN", " ESPEDIDO", "ROSALDO", "2000-01-01", "FILIPINO", "MALE");
INSERT INTO tblStudent(studentNumber, firstName, lastName, middleName, 
birthdate, citizenship, gender) VALUES(202014165, "NINA KLARISSE", " ULANGKAYA", "AMBRIOSO", "2000-01-02", "FILIPINO", "FEMALE");
INSERT INTO tblStudent(studentNumber, firstName, lastName, middleName, 
birthdate, citizenship, gender) VALUES(202011535, "ADRIAN", " CARRANZA", "RUBIA", "2000-01-03", "FILIPINO", "MALE");
INSERT INTO tblStudent(studentNumber, firstName, lastName, middleName, 
birthdate, citizenship, gender) VALUES(202011818, "JEAN", " DACLES", "RICO", "2000-01-04", "FILIPINO", "FEMALE");
INSERT INTO tblStudent(studentNumber, firstName, lastName, middleName, 
birthdate, citizenship, gender) VALUES(202012336, "GILLIAN KYLE", " CATAHAN", "DIMAALA", "2000-01-05", "FILIPINO", "MALE");

ALTER TABLE tblStudent CHANGE gender sex VARCHAR(6);
ALTER TABLE tblStudent CHANGE birthdate birthdate DATE;
ALTER TABLE tblStudent CHANGE citizenship citizenship VARCHAR(20);


ALTER TABLE tblStudent ADD age VARCHAR(10) AFTER birthdate;


ALTER TABLE tblStudent RENAME studentinfo;

SELECT 
	 UCASE(firstName) AS firstName,
     UCASE(lastName) AS lastName,
     UCASE(middleName) AS middleName FROM studentinfo;


UPDATE studentinfo SET citizenship = "Pinoy" WHERE citizenship = "FILIPINO";
SELECT * FROM studentinfo;

SELECT studentNumber, CONCAT(firstName," ", middleName," ", lastName) AS "Full Name" FROM studentinfo;


SELECT REPEAT(lastname, 5) FROM studentinfo;


UPDATE studentinfo SET age = TIMESTAMPDIFF(YEAR, birthdate, CURDATE());
SELECT AVG(age) FROM studentinfo;


SELECT *, DATE_FORMAT(birthdate, "%m %d %Y") AS "formatBirthdate" FROM studentinfo;


SELECT sex, COUNT(*) AS "number" FROM studentinfo GROUP BY sex;

SELECT studentNumber, firstName, lastName, middleName, lastName, birthdate, age, citizenship, sex FROM studentinfo
ORDER BY lastName ASC;
