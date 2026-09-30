CREATE DATABASE student_data_analysis;
USE student_data_analysis;

CREATE TABLE students (
  student_id INT PRIMARY KEY,
  name VARCHAR(50),
  gender VARCHAR(10),
  class VARCHAR(10),
  city VARCHAR(50)
);

CREATE TABLE marks (
  mark_id INT PRIMARY KEY,
  student_id INT,
  subject VARCHAR(30),
  marks INT,
  FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE attendance (
  att_id INT PRIMARY KEY,
  student_id INT,
  total_days INT,
  present_days INT,
  FOREIGN KEY (student_id) REFERENCES students(student_id)
);
INSERT INTO students VALUES
(1,'Aarav','M','10A','Delhi'),
(2,'Diya','F','10A','Mumbai'),
(3,'Kabir','M','10B','Pune'),
(4,'Meera','F','10B','Jaipur'),
(5,'Rohan','M','10A','Delhi'),
(6,'Sana','F','10B','Lucknow');

INSERT INTO marks VALUES
(1,1,'Maths',88),(2,1,'Science',79),(3,1,'English',85),
(4,2,'Maths',92),(5,2,'Science',90),(6,2,'English',87),
(7,3,'Maths',65),(8,3,'Science',70),(9,3,'English',60),
(10,4,'Maths',78),(11,4,'Science',82),(12,4,'English',91),
(13,5,'Maths',55),(14,5,'Science',62),(15,5,'English',68),
(16,6,'Maths',95),(17,6,'Science',89),(18,6,'English',93);

INSERT INTO attendance VALUES
(1,1,200,182),(2,2,200,195),(3,3,200,140),
(4,4,200,170),(5,5,200,120),(6,6,200,190);
