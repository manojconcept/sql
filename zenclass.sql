CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    Description TEXT,
    Duration INT
);

CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(15)
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(15)
);

CREATE TABLE Class (
    ClassID INT PRIMARY KEY,
    CourseID INT,
    InstructorID INT,
    Schedule VARCHAR(255),
    Room VARCHAR(255),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    ClassID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);

-- Inner Join between Class and Course tables:
SELECT *
FROM Class
INNER JOIN Course ON Class.CourseID = Course.CourseID;

-- Left Join between Student and Enrollment tables:
SELECT *
FROM Student
LEFT JOIN Enrollment ON Student.StudentID = Enrollment.StudentID;

-- Select all courses:
SELECT * FROM Course;
-- Select all instructors:
SELECT * FROM Instructor;
-- Select all students:
SELECT * FROM Student;
-- Select all classes:
SELECT * FROM Class;
-- ----------------------------
-- UPDATE:
-- Update course information:
UPDATE Course
SET CourseName = 'New Course Name', Description = 'New Description', Duration = 10
WHERE CourseID = 1;
-- Update instructor information:
UPDATE Instructor
SET FirstName = 'New First Name', LastName = 'New Last Name', Email = 'newemail@example.com', Phone = '123-456-7890'
WHERE InstructorID = 1;
-- Update student information:
UPDATE Student
SET FirstName = 'New First Name', LastName = 'New Last Name', Email = 'newemail@example.com', Phone = '123-456-7890'
WHERE StudentID = 1;
-- Update class information:
UPDATE Class
SET Schedule = 'New Schedule', Room = 'New Room'
WHERE ClassID = 1;
DELETE:
-- Delete a course and its associated classes:
DELETE FROM Course
WHERE CourseID = 1;
-- Delete an instructor and their assigned classes:
DELETE FROM Instructor
WHERE InstructorID = 1;
-- Delete a student and their enrollments:
DELETE FROM Student
WHERE StudentID = 1;
-- Delete a class:
DELETE FROM Class
WHERE ClassID = 1;