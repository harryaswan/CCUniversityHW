DROP TABLE attending;
DROP TABLE students;
DROP TABLE courses;

CREATE TABLE students (
    id SERIAL4 primary key,
    name VARCHAR(255)
);

CREATE TABLE courses (
    id SERIAL4 primary key,
    name VARCHAR(255)
);

CREATE TABLE attending (
    id SERIAL4 primary key,
    student_id INT4 references students(id),
    course_id INT4 references courses(id)
);
