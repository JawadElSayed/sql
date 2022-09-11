
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