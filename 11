CREATE TABLE Course (
 number INT NOT NULL PRIMARY KEY,
 title VARCHAR(50) NOT NULL,
 credits INT NOT NULL,
 syllabus TEXT,
 prerequisites TEXT
);
SELECT * FROM Course;
CREATE TABLE Instructor (
 identification_number INT NOT NULL PRIMARY KEY,
 name VARCHAR(50) NOT NULL,
 department VARCHAR(15) NOT NULL,
 title VARCHAR(15) NOT NULL);
SELECT * FROM Instructor;
CREATE TABLE Course_Offering (
 year INT NOT NULL,
semester VARCHAR(50) NOT NULL,
 section_number INT NOT NULL,
 timings VARCHAR(50) NOT NULL,
 instructor_id INT NOT NULL,
 classroom VARCHAR(50) NOT NULL,
 number INT NOT NULL,
 PRIMARY KEY (year, semester, section_number),
 FOREIGN KEY (number) REFERENCES Course (number),
 FOREIGN KEY (instructor_id) REFERENCES Instructor (identification_number)
);
SELECT * FROM Course_Offering;
CREATE TABLE Student (
 student_id INT NOT NULL PRIMARY KEY,
 name VARCHAR(50) NOT NULL,
 program VARCHAR(50) NOT NULL,
 grades varchar(10) not null
);
SELECT * FROM Student;
