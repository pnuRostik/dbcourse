CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY IDENTITY,
    first_name NVARCHAR(50) NOT NULL
);

CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY IDENTITY,
    subject_name NVARCHAR(50) NOT NULL
);

CREATE TABLE Subject_Teacher (
    teacher_id INT NOT NULL,
    subject_id INT NOT NULL,
    PRIMARY KEY (teacher_id, subject_id),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
);

CREATE TABLE Classes (
    class_id INT PRIMARY KEY IDENTITY,
    class_name NVARCHAR(50) NOT NULL
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY IDENTITY,
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    class_id INT NOT NULL,
    date_of_birth DATE,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

CREATE TABLE Parents (
    parent_id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(50) NOT NULL,
    phone NVARCHAR(15)
);

CREATE TABLE ParentsOfStudents (
    parent_id INT NOT NULL,
    student_id INT NOT NULL,
    PRIMARY KEY (parent_id, student_id),
    FOREIGN KEY (parent_id) REFERENCES Parents(parent_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

CREATE TABLE Marks (
    grade_id INT PRIMARY KEY IDENTITY,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    grade FLOAT NOT NULL,
    grade_date DATE NOT NULL,
    grade_type NVARCHAR(50),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
);

CREATE TABLE Class_Prefects (
    prefect_id INT PRIMARY KEY IDENTITY,
    student_id INT NOT NULL UNIQUE,
    class_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);


INSERT INTO Teachers (first_name) VALUES
('John Doe'), 
('Jane Smith');

INSERT INTO Subjects (subject_name) VALUES
('Mathematics'), 
('Physics'), 
('Chemistry');


INSERT INTO Subject_Teacher (teacher_id, subject_id) VALUES
(1, 1), 
(2, 2), 
(2, 3);


INSERT INTO Classes (class_name) VALUES
('Class A'), 
('Class B');


INSERT INTO Students (first_name, last_name, class_id, date_of_birth) VALUES
('Alice', 'Johnson', 1, '2005-04-10'), 
('Bob', 'Brown', 1, '2006-07-15'),
('Charlie', 'Davis', 2, '2005-12-20');


INSERT INTO Parents (name, phone) VALUES
('Mary Johnson', '123-456-7890'), 
('Peter Brown', '987-654-3210');

INSERT INTO ParentsOfStudents (parent_id, student_id) VALUES
(1, 1), 
(2, 2);


INSERT INTO Marks (student_id, subject_id, grade, grade_date, grade_type) VALUES
(1, 1, 95.5, '2024-12-20', 'Exam'), 
(2, 2, 88.0, '2024-12-21', 'Homework'), 
(3, 3, 92.0, '2024-12-22', 'Quiz');


INSERT INTO Class_Prefects (student_id, class_id, start_date, end_date) VALUES
(1, 1, '2024-01-01', '2024-12-31'), 
(3, 2, '2024-02-01', NULL);
