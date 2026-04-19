DROP DATABASE olearning_management;
CREATE DATABASE olearning_management;

USE olearning_management;

CREATE TABLE Student(
	id INT PRIMARY KEY,
    fullName VARCHAR(255) NOT NULL,
	dob DATE,
    email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Teacher(
	id INT PRIMARY KEY,
    fullName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Course(
	id INT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT(500),
    sessions INT default 1,
    teacherID INT,
    FOREIGN KEY(teacherID) REFERENCES Teacher(id)
);

CREATE TABLE Enrollment(
	id INT PRIMARY KEY,
    fullName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    studentID INT,
    courseID INT,
    FOREIGN KEY(studentID) REFERENCES Student(id),
    FOREIGN KEY(courseID) REFERENCES Course(id)
);

CREATE TABLE Score(
	id INT PRIMARY KEY,
    studentID INT,
    courseID INT,
    midterm FLOAT(4,2) CHECK(midterm >= 0 and midterm <= 10),
    finalGrade FLOAT(4,2) CHECK(finalGrade >= 0 and finalGrade <= 10),
    FOREIGN KEY(studentID) REFERENCES Student(id),
    FOREIGN KEY(courseID) REFERENCES Course(id)
);

INSERT INTO Student
VALUES
(1, "Nguyen Van A", NOW(), "nguyenA@gmail.com"),
(2, "Nguyen Van B", NOW(), "nguyenB@gmail.com"),
(3, "Nguyen Van C", NOW(), "nguyenC@gmail.com"),
(4, "Tran Thi D", NOW(), "thiD@gmail.com"),
(5, "Tran Thi E", NOW(), "thiE@gmail.com");

INSERT INTO Teacher
VALUES
(1, "Le Minh Hoang", "hoang.lm@edu.vn"),
(2, "Pham Thu Trang", "trang.pt@edu.vn"),
(3, "Doan Quoc Viet", "viet.dq@edu.vn"),
(4, "Bui Ngoc Anh", "anh.bn@edu.vn"),
(5, "Hoang Gia Linh", "linh.hg@edu.vn");


INSERT INTO Course(id, `name`, `description`, sessions, teacherID) 
VALUES
(1, "Toan nang cao", "Toan nang cao cho hs tieu hoc", 10, 1), 
(2, "Lap trinh C co ban", "Nhap mon lap trinh C tu dau", 15, 2), 
(3, "Tieng Nhat N5", "Khoa hoc tieng Nhat co ban", 20, 3), 
(4, "Ky nang giai quyet van de", "Phat trien tu duy logic", 8, 4), 
(5, "Thuat toan co ban", "Nhap mon thuat toan va tu duy lap trinh", 12, 5); 

INSERT INTO Enrollment(id, fullName, email, studentID, courseID)
VALUES
(1, "Nguyen Van A", "nguyenA@gmail.com",1,1),
(2, "Nguyen Van B", "nguyenB@gmail.com", 2, 1),
(3, "Nguyen Van C", "nguyenC@gmail.com", 3, 2),
(4, "Tran Thi D", "thiD@gmail.com", 4, 3),
(5, "Tran Thi E", "thiE@gmail.com", 5, 4),
(6, "Nguyen Van A", "nguyenA@gmail.com", 1, 2),
(7, "Nguyen Van B", "nguyenB@gmail.com", 2, 3),
(8, "Nguyen Van C", "nguyenC@gmail.com", 3, 4),
(9, "Tran Thi D", "thiD@gmail.com", 4, 5),
(10, "Tran Thi E", "thiE@gmail.com", 5, 1),
(11, "Tran Thi E", "thiE2@gmail.com", 5, 1);

INSERT INTO Score(id, studentID, courseID, midterm, finalGrade)
VALUES
(1, 1, 1, 7.5, 8.0),
(2, 2, 1, 6.0, 7.0),
(3, 3, 2, 8.5, 9.0),
(4, 4, 3, 5.5, 6.0),
(5, 5, 4, 9.0, 9.5);

UPDATE Student
SET email = "nguyenVanA@gmail.com" WHERE id = 1;

UPDATE Course
SET `description` = "Khóa học này rất hữu ích" WHERE id = 1; 

UPDATE Score
SET finalGrade = 7.25 WHERE studentID = 1;

DELETE FROM Enrollment WHERE studentID = 5;
DELETE FROM Score WHERE studentID = 5;

SELECT * FROM Student;
SELECT * FROM Teacher;
SELECT * FROM Course;
SELECT * FROM Enrollment;
SELECT * FROM Score;
