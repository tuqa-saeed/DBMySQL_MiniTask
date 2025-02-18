
CREATE TABLE `courseassignments` (
  `assignment_id` int(11) NOT NULL,
  `instructor_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `semester` enum('Spring','Summer','Fall','Winter') NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `course_code` varchar(20) NOT NULL,
  `credits` int(11) NOT NULL CHECK (`credits` > 0),
  `department` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `enrollments` (
  `enrollment_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `grade` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `instructors` (
  `instructor_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `hire_date` date NOT NULL,
  `department` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `major` varchar(100) DEFAULT NULL,
  `enrollment_year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE `courseassignments`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `instructor_id` (`instructor_id`),
  ADD KEY `course_id` (`course_id`);

ALTER TABLE `courses`

CREATE TABLE `courseassignments` (
  `assignment_id` int(11) NOT NULL AUTO_INCREMENT,
  `instructor_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `semester` enum('Spring','Summer','Fall','Winter') NOT NULL,
  `year` year(4) NOT NULL,
  PRIMARY KEY (`assignment_id`),
  KEY `instructor_id` (`instructor_id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) NOT NULL,
  `course_code` varchar(20) NOT NULL UNIQUE,
  `credits` int(11) NOT NULL CHECK (`credits` > 0),
  `department` varchar(100) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `enrollments` (
  `enrollment_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `grade` char(2) DEFAULT NULL,
  PRIMARY KEY (`enrollment_id`),
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `instructors` (
  `instructor_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL UNIQUE,
  `hire_date` date NOT NULL,
  `department` varchar(100) NOT NULL,
  PRIMARY KEY (`instructor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL UNIQUE,
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `major` varchar(100) DEFAULT NULL,
  `enrollment_year` year(4) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE `courseassignments`
  ADD CONSTRAINT `courseassignments_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `instructors` (`instructor_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courseassignments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE;

ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE;

INSERT INTO instructors (first_name, last_name, email, hire_date, department) VALUES
('tuqa', 'saeed', 'tuqa.saeed@gmail.com', '2015-08-21', 'Computer Science'),
('ruaa', 'saeed', 'ruaa.saeed@gmail.com', '2012-06-15', 'Mathematics'),
('moaad', 'saeed', 'moaad.saeed@gmail.com', '2018-01-10', 'Physics'),
('qusai', 'saeed', 'qusai.saeed@gmail.com', '2020-09-05', 'Engineering'),
('mohammed', 'saeed', 'mohammed.saeed@gmail.com', '2017-03-22', 'Biology');

INSERT INTO courses (course_name, course_code, credits, department) VALUES
('Introduction to Programming', 'CS101', 3, 'Computer Science'),
('Calculus II', 'MATH101', 4, 'Mathematics'),
('Physics ', 'PHYS201', 3, 'Physics'),
('Digital Circuits', 'ENGR102', 3, 'Engineering'),
(' Biology', 'BIO103', 3, 'Biology');

INSERT INTO courseassignments (instructor_id, course_id, semester, year) VALUES
(1, 1, 'Summer', 2025),
(2, 2, 'Summer', 2025),
(3, 3, 'Summer', 2025),
(4, 4, 'Winter', 2025),
(5, 5, 'Fall', 2025);

INSERT INTO students (first_name, last_name, email, date_of_birth, gender, major, enrollment_year) VALUES
('moaad', 'saeed', 'moaad.saeed@gmail.com', '2002-05-14', 'Male', 'Computer Science', 2022),
('tuqa', 'saeed', 'tuqa.saeed@gmail.com', '2001-08-22', 'Female', 'Mathematics', 2021),
('qusai', 'saeed', 'qusai.saeed@gmail.com', '2003-02-10', 'Male', 'Physics', 2023),
('ruaa', 'saeed', 'ruaa.saeed@gmail.com', '2000-11-30', 'Female', 'Engineering', 2020),
('mohammed', 'saeed', 'mohammed.saeed@gmail.com', '2002-09-18', 'Male', 'Biology', 2022),
('Sarah', 'Wilson', 'sarah.wilson@example.com', '2001-06-25', 'Female', 'Computer Science', 2021),
('Daniel', 'Lee', 'daniel.lee@example.com', '2003-03-15', 'Male', 'Mathematics', 2023),
('Laura', 'Martinez', 'laura.martinez@example.com', '2002-07-09', 'Female', 'Physics', 2022),
('Kevin', 'Anderson', 'kevin.anderson@example.com', '2000-12-05', 'Male', 'Engineering', 2020),
('Sophia', 'Clark', 'sophia.clark@example.com', '2001-04-17', 'Female', 'Biology', 2021);

INSERT INTO enrollments (student_id, course_id, grade) VALUES
(1, 1, 'A'), (1, 2, 'B'),
(2, 2, 'A'), (2, 3, 'B+'),
(3, 3, 'B'), (3, 4, 'A-'),
(4, 4, 'A'), (4, 5, 'B+'),
(5, 5, 'B'), (5, 1, 'A-'),
(6, 1, 'A'), (6, 2, 'B+'),
(7, 2, 'B'), (7, 3, 'A'),
(8, 3, 'B+'), (8, 4, 'A'),
(9, 4, 'A-'), (9, 5, 'B'),
(10, 5, 'B+'), (10, 1, 'A');


ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `courseassignments`
  ADD CONSTRAINT `courseassignments_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `instructors` (`instructor_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courseassignments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE;


ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE;
COMMIT;

SELECT * FROM students;

SELECT COUNT(*) AS total_courses FROM courses;


SELECT s.first_name, s.last_name 
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
WHERE e.course_id = 1;  

SELECT email 
FROM instructors
WHERE department = 'Computer Science';  



SELECT c.course_name, COUNT(e.student_id) AS num_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id;

SELECT s.first_name, s.last_name, c.course_name, e.grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.grade = 'A';

SELECT c.course_name, i.first_name AS instructor_first_name, i.last_name AS instructor_last_name
FROM courseassignments ca
JOIN courses c ON ca.course_id = c.course_id
JOIN instructors i ON ca.instructor_id = i.instructor_id
WHERE ca.semester = 'Summer' AND ca.year = 2025;  

SELECT c.course_name, AVG(
    CASE 
        WHEN e.grade = 'A' THEN 4.0
        WHEN e.grade = 'B+' THEN 3.5
        WHEN e.grade = 'B' THEN 3.0
        WHEN e.grade = 'C+' THEN 2.5
        WHEN e.grade = 'C' THEN 2.0
        WHEN e.grade = 'D+' THEN 1.5
        WHEN e.grade = 'D' THEN 1.0
        WHEN e.grade = 'F' THEN 0.0
        ELSE NULL 
    END
) AS average_grade
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
WHERE c.course_id = 1; 



SELECT s.first_name, s.last_name, COUNT(e.course_id) AS num_courses
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courseassignments ca ON e.course_id = ca.course_id
WHERE ca.semester = 'Spring' AND ca.year = 2025 
GROUP BY s.student_id
HAVING COUNT(e.course_id) > 3;

SELECT s.first_name, s.last_name, c.course_name, e.grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.grade IS NULL;


SELECT s.first_name, s.last_name, AVG(
    CASE 
        WHEN e.grade = 'A' THEN 4.0
        WHEN e.grade = 'B+' THEN 3.5
        WHEN e.grade = 'B' THEN 3.0
        WHEN e.grade = 'C+' THEN 2.5
        WHEN e.grade = 'C' THEN 2.0
        WHEN e.grade = 'D+' THEN 1.5
        WHEN e.grade = 'D' THEN 1.0
        WHEN e.grade = 'F' THEN 0.0
        ELSE NULL 
    END
) AS average_grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id
ORDER BY average_grade DESC
LIMIT 1;


SELECT c.department, COUNT(c.course_id) AS num_courses
FROM courses c
JOIN courseassignments ca ON c.course_id = ca.course_id
WHERE ca.year = 2025  
ORDER BY num_courses DESC
LIMIT 1;


SELECT c.course_name
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
WHERE e.student_id IS NULL;



