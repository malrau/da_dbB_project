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
	syllabus VARCHAR(100) NOT NULL
	PRIMARY KEY(courseID),
	UNIQUE(courseName, courseYear)
	);

UNIT(unitID, unitName, unitNumber, learningGoals)
LEARNING_MATERIAL(materialID, materialType, name, description, dimension)
FINAL_ASSESSMENT(assessmentID, assessmentType, name)
ENROLLMENT(course, student, enrollDate)
TEACHING(course, instructor)
LEARNING(course, student, unit, accessDate, accessStart, accessEnd, nAccesses)
USING_RESOURCES(unit, material, accessDate, nAccesses)
GRADING(course, student, assessment, minScore, maxScore, attemptDate, nAttempts, completed)
