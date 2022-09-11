
-- Find all rooms that can seat at least 100 people

SELECT *
from Room
WHERE cappacity >= 100;

-- Find the course or courses with the earliest start time

SELECT * 
FROM `Course`
where start_time = (SELECT MIN(start_time) FROM Course);