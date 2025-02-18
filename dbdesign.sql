
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
('Alice', 'Johnson', 'alice.johnson@example.com', '2015-08-21', 'Computer Science'),
('Bob', 'Smith', 'bob.smith@example.com', '2012-06-15', 'Mathematics'),
('Charlie', 'Brown', 'charlie.brown@example.com', '2018-01-10', 'Physics'),
('David', 'Wilson', 'david.wilson@example.com', '2020-09-05', 'Engineering'),
('Eve', 'Taylor', 'eve.taylor@example.com', '2017-03-22', 'Biology');

INSERT INTO courses (course_name, course_code, credits, department) VALUES
('Introduction to Programming', 'CS101', 3, 'Computer Science'),
('Calculus I', 'MATH101', 4, 'Mathematics'),
('Physics for Engineers', 'PHYS201', 3, 'Physics'),
('Digital Circuits', 'ENGR102', 3, 'Engineering'),
('Molecular Biology', 'BIO103', 3, 'Biology');

INSERT INTO courseassignments (instructor_id, course_id, semester, year) VALUES
(1, 1, 'Fall', 2025),
(2, 2, 'Spring', 2025),
(3, 3, 'Summer', 2025),
(4, 4, 'Winter', 2025),
(5, 5, 'Fall', 2025);

INSERT INTO students (first_name, last_name, email, date_of_birth, gender, major, enrollment_year) VALUES
('John', 'Doe', 'john.doe@example.com', '2002-05-14', 'Male', 'Computer Science', 2022),
('Jane', 'Smith', 'jane.smith@example.com', '2001-08-22', 'Female', 'Mathematics', 2021),
('Sam', 'Williams', 'sam.williams@example.com', '2003-02-10', 'Male', 'Physics', 2023),
('Emily', 'Davis', 'emily.davis@example.com', '2000-11-30', 'Female', 'Engineering', 2020),
('Michael', 'Brown', 'michael.brown@example.com', '2002-09-18', 'Male', 'Biology', 2022),
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

