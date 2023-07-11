CREATE DATABASE learning_platform;

USE learning_platform;

CREATE TABLE student(
	studentID INT AUTO_INCREMENT,
	firstName VARCHAR(30) NOT NULL,
	lastName VARCHAR(30) NOT NULL,
	birthDate DATE NOT NULL,
	genre ENUM('F', 'M', 'NOT BINARY') NOT NULL,
	country VARCHAR(30),
	town VARCHAR(30),
	email VARCHAR(50) NOT NULL,
	PRIMARY KEY(STUDENTID),
	UNIQUE(email)
	);

CREATE TABLE instructor(
	instructorID INT AUTO_INCREMENT,
	firstName VARCHAR(30) NOT NULL,
	lastName VARCHAR(30) NOT NULL,
	genre ENUM('F', 'M', 'NOT BINARY') NOT NULL,
	email VARCHAR(50) NOT NULL,
	PRIMARY KEY(instructorID),
	UNIQUE(email)
	);

CREATE TABLE course(
	courseID INT AUTO_INCREMENT,
	courseName VARCHAR(100) NOT NULL,
	courseYEAR INT NOT NULL,
	discipline VARCHAR(30) NOT NULL,
	syllabus VARCHAR(100) NOT NULL,
	PRIMARY KEY(courseID),
	UNIQUE(courseName, courseYear)
	);

CREATE TABLE learning_material(
	materialID INT AUTO_INCREMENT,
	unit VARCHAR(20),
	materialType VARCHAR(30) NOT NULL,
	materialName VARCHAR(30),
	dimension INT,
	PRIMARY KEY(materialID)
	);

CREATE TABLE final_assessment(
	assessmentID INT AUTO_INCREMENT,
	assessmentType ENUM('Quiz', 'Project') NOT NULL,
	assessmentName VARCHAR(50),
	thresholdScore INT NOT NULL,
	maxScore INT NOT NULL,
	PRIMARY KEY(assessmentID)
	);

CREATE TABLE enrolling(
	student INT,
	course INT,
	enrollDate DATE,
	PRIMARY KEY(student, course),
	FOREIGN KEY(student)
		REFERENCES student(studentID),
	FOREIGN KEY(course)
		REFERENCES course(courseID)
	);

CREATE TABLE teaching(
	instructor INT,
	course INT,
	PRIMARY KEY(instructor, course),
	FOREIGN KEY(instructor)
		REFERENCES instructor(instructorID),
	FOREIGN KEY(course)
		REFERENCES course(courseID)
	);

CREATE TABLE learning(
	course INT,
	student INT,
	learning_material INT,
	accessDate DATE,
	PRIMARY KEY(student, course, learning_material),
	FOREIGN KEY(student)
		REFERENCES student(studentID),
	FOREIGN KEY(course)
		REFERENCES course(courseID),
	FOREIGN KEY(learning_material)
		REFERENCES learning_material(materialID)
	);

CREATE TABLE grading(
	student INT,
	course INT,
	assessment INT,
	score INT,
	attemptDate DATE,
	PRIMARY KEY(student, course, assessment),
	FOREIGN KEY(student)
		REFERENCES student(studentID),
	FOREIGN KEY(course)
		REFERENCES course(courseID),
	FOREIGN KEY(assessment)
		REFERENCES final_assessment(assessmentID)
	);
