-- database creation and use
DROP DATABASE IF EXISTS dbB_MYSQL_test;

CREATE DATABASE dbB_MYSQL_test;

USE dbB_MYSQL_test;

-- table creation to define the logical schema for the 250k, 500k, 750k 
-- and 1m records file: each csv file must match this schema
CREATE TABLE smallDB(
	courseID INT,
	discipline VARCHAR(25),
	courseName VARCHAR(110),
	courseYear INT,
	syllabus VARCHAR(130),
	studentID INT,
	firstName VARCHAR(20),
	lastName VARCHAR(25),
	dateOfBirth VARCHAR(10),
	genre VARCHAR(10),
	country VARCHAR(60),
	town VARCHAR(30),
	email VARCHAR(40),
	materialID INT,
	unit VARCHAR(10),
	materialType VARCHAR(15),
	materialName VARCHAR(120),
	dimension INT,
	accessDate VARCHAR(10)
	);

LOAD DATA
LOCAL INFILE '/Users/mau/mysql_database/htdocs/developers/dataset250k.csv'
INTO TABLE smallDB
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE mediumDB(
	courseID INT,
	discipline VARCHAR(25),
	courseName VARCHAR(110),
	courseYear INT,
	syllabus VARCHAR(130),
	studentID INT,
	firstName VARCHAR(20),
	lastName VARCHAR(25),
	dateOfBirth VARCHAR(10),
	genre VARCHAR(10),
	country VARCHAR(60),
	town VARCHAR(30),
	email VARCHAR(40),
	materialID INT,
	unit VARCHAR(10),
	materialType VARCHAR(15),
	materialName VARCHAR(120),
	dimension INT,
	accessDate VARCHAR(10)
	);

LOAD DATA
INFILE LOCAL '/Users/mau/mysql_database/htdocs/developers/dataset500k.csv'
INTO TABLE mediumDB
FIELDS TERMINATED BY ','
LINES TERMINATED BY '';

CREATE TABLE largeDB(
	courseID INT,
	discipline VARCHAR(25),
	courseName VARCHAR(110),
	courseYear INT,
	syllabus VARCHAR(130),
	studentID INT,
	firstName VARCHAR(20),
	lastName VARCHAR(25),
	dateOfBirth VARCHAR(10),
	genre VARCHAR(10),
	country VARCHAR(60),
	town VARCHAR(30),
	email VARCHAR(40),
	materialID INT,
	unit VARCHAR(10),
	materialType VARCHAR(15),
	materialName VARCHAR(120),
	dimension INT,
	accessDate VARCHAR(10)
	);

LOAD DATA
INFILE LOCAL '/Users/mau/mysql_database/htdocs/developers/dataset750k.csv'
INTO TABLE largeDB
FIELDS TERMINATED BY ','
LINES TERMINATED BY '';

CREATE TABLE humongousDB(
	courseID INT,
	discipline VARCHAR(25),
	courseName VARCHAR(110),
	courseYear INT,
	syllabus VARCHAR(130),
	studentID INT,
	firstName VARCHAR(20),
	lastName VARCHAR(25),
	dateOfBirth VARCHAR(10),
	genre VARCHAR(10),
	country VARCHAR(60),
	town VARCHAR(30),
	email VARCHAR(40),
	materialID INT,
	unit VARCHAR(10),
	materialType VARCHAR(15),
	materialName VARCHAR(120),
	dimension INT,
	accessDate VARCHAR(10)
	);

LOAD DATA
INFILE LOCAL '/Users/mau/mysql_database/htdocs/developers/dataset1m.csv'
INTO TABLE humongousDB
FIELDS TERMINATED BY ','
LINES TERMINATED BY '';
