
-- Find all rooms that can seat at least 100 people

SELECT *
from Room
WHERE cappacity >= 100;

-- Find the course or courses with the earliest start time

SELECT * 
FROM `Course`
where start_time = (SELECT MIN(start_time) FROM Course);

-- Find all courses taken by BIF majors

SELECT DISTINCT crn
FROM `Enrolled` 
WHERE Enrolled.Student_id = ANY(SELECT Student_id from MajorsIn WHERE MajorsIn.Department_id = 1);

-- Create a list of all students who are not enrolled in a course

SELECT DISTINCT * 
FROM Student
WHERE Student.id NOT IN (SELECT Student_id FROM Enrolled);

-- Find the number of CS majors enrolled in CSC275

SELECT COUNT(Student_id) 
FROM `Enrolled`
WHERE crn = "csc275" and Student_id = Any(SELECT Student_id FROM MajorsIn WHERE MajorsIn.Department_id = 2);

-- Find the number of CS majors enrolled in any course

SELECT COUNT(DISTINCT Student_id)
FROM `Enrolled`
WHERE Student_id = Any(SELECT Student_id FROM MajorsIn WHERE MajorsIn.Department_id = 2);

-- Find the number of majors that each student has declared

SELECT Student_id , COUNT(Department_id)
FROM `MajorsIn`
GROUP BY Student_id;

-- For each department with more than one majoring student, print the
-- department’s name and the number of majoring students

SELECT Department_id , COUNT(Student_id)
FROM `MajorsIn`
GROUP BY Department_id;