-- Q1. List the names of students who have taken admission in at least one course.

SELECT DISTINCT s.Name
FROM STUDENT s
JOIN ADMISSION a
    ON s.Rollno = a.Rollno;


-- Q2. List names of students admitted to Computer Science.

SELECT DISTINCT s.Name
FROM STUDENT s
JOIN ADMISSION a
    ON s.Rollno = a.Rollno
JOIN COURSE c
    ON a.SID = c.SID
WHERE c.Cname = 'Computer Science';


-- Q3. List all students and their admitted course IDs, including students
-- who have not taken admission in any course.

SELECT s.Rollno, s.Name, a.SID
FROM STUDENT s
LEFT JOIN ADMISSION a
    ON s.Rollno = a.Rollno;


-- Q4. Display each course and the number of students enrolled in it.

SELECT c.Cname, COUNT(a.Rollno) AS StudentCount
FROM COURSE c
LEFT JOIN ADMISSION a
    ON c.SID = a.SID
GROUP BY c.Cname;


-- Q5. Display each society and the number of students enrolled in it.

SELECT so.Socname, COUNT(e.Rollno) AS StudentCount
FROM SOCIETY so
LEFT JOIN ENROLLMENT e
    ON so.SocID = e.SocID
GROUP BY so.Socname;

-- Q6. Display courses having more than 2 students enrolled.

SELECT c.Cname, COUNT(a.Rollno) AS StudentCount
FROM COURSE c
JOIN ADMISSION a
    ON c.SID = a.SID
GROUP BY c.Cname
HAVING COUNT(a.Rollno) > 2;


-- Q7. Display students who are enrolled in more than one course.

SELECT s.Name, COUNT(a.SID) AS CourseCount
FROM STUDENT s
JOIN ADMISSION a
    ON s.Rollno = a.Rollno
GROUP BY s.Rollno, s.Name
HAVING COUNT(a.SID) > 1;


-- Q8. Display students who have not taken admission in any course.

SELECT s.Rollno, s.Name
FROM STUDENT s
LEFT JOIN ADMISSION a
    ON s.Rollno = a.Rollno
WHERE a.Rollno IS NULL;


-- Q9. Display students born in the year 2005.

SELECT Rollno, Name, Dateofbirth
FROM STUDENT
WHERE Dateofbirth BETWEEN '2005-01-01' AND '2005-12-31';


-- Q10. Display students whose names start with 'A'.

SELECT Rollno, Name
FROM STUDENT
WHERE Name LIKE 'A%';
-- Q11. Display the names of students along with the societies they are enrolled in.

SELECT s.Name, so.Socname
FROM STUDENT s
JOIN ENROLLMENT e
    ON s.Rollno = e.Rollno
JOIN SOCIETY so
    ON e.SocID = so.SocID;


-- Q12. Display courses in which no student is enrolled.

SELECT c.Cname
FROM COURSE c
LEFT JOIN ADMISSION a
    ON c.SID = a.SID
WHERE a.SID IS NULL;


-- Q13. Display students who are enrolled in a society but have not taken admission
-- in any course.

SELECT DISTINCT s.Name
FROM STUDENT s
JOIN ENROLLMENT e
    ON s.Rollno = e.Rollno
LEFT JOIN ADMISSION a
    ON s.Rollno = a.Rollno
WHERE a.Rollno IS NULL;


-- Q14. Display students who are not enrolled in any society.

SELECT s.Rollno, s.Name
FROM STUDENT s
WHERE NOT EXISTS (
    SELECT 1
    FROM ENROLLMENT e
    WHERE e.Rollno = s.Rollno
);


-- Q15. Display students who are enrolled in all societies.

SELECT s.Rollno, s.Name
FROM STUDENT s
WHERE NOT EXISTS (
    SELECT 1
    FROM SOCIETY so
    WHERE NOT EXISTS (
        SELECT 1
        FROM ENROLLMENT e
        WHERE e.Rollno = s.Rollno
          AND e.SocID = so.SocID
    )
);

-- Q16. Display the names of students along with the courses they are admitted to.

SELECT s.Name, c.Cname
FROM STUDENT s
JOIN ADMISSION a
    ON s.Rollno = a.Rollno
JOIN COURSE c
    ON a.SID = c.SID;


-- Q17. Display the course name and teacher in charge of each course.

SELECT Cname, TeacherInCharge
FROM COURSE;


-- Q18. Display the total number of students.

SELECT COUNT(*) AS TotalStudents
FROM STUDENT;


-- Q19. Insert a new student into the STUDENT table.

INSERT INTO STUDENT (Rollno, Name)
VALUES ('A2011', 'Karan Malhotra');


-- Q20. Display each course and the number of students enrolled in it.

SELECT c.Cname, COUNT(a.Rollno) AS StudentCount
FROM COURSE c
LEFT JOIN ADMISSION a
    ON c.SID = a.SID
GROUP BY c.Cname;

-- Q21. Display students admitted to courses of duration 3 years.

SELECT DISTINCT s.Name, c.Cname
FROM STUDENT s
JOIN ADMISSION a
    ON s.Rollno = a.Rollno
JOIN COURSE c
    ON a.SID = c.SID
WHERE c.Duration = 3;


-- Q22. Display the number of courses with more than 5 students enrolled,
-- for each course type.

SELECT Coursetype, COUNT(*) AS PopularCourses
FROM (
    SELECT c.SID, c.Coursetype
    FROM COURSE c
    JOIN ADMISSION a
        ON c.SID = a.SID
    GROUP BY c.SID, c.Coursetype
    HAVING COUNT(*) > 5
) AS popular
GROUP BY Coursetype;


-- Q23. Add a Mobile column to STUDENT with default value '9999999999'.

ALTER TABLE STUDENT
ADD COLUMN Mobile CHAR(10) DEFAULT '9999999999';


-- Q24. Display the total number of students whose age is greater than 18.

SELECT COUNT(*) AS StudentsOver18
FROM STUDENT
WHERE TIMESTAMPDIFF(YEAR, Dateofbirth, CURDATE()) > 18;


-- Q25. Display students born in 2001 who are admitted to at least one
-- part-time course.

SELECT DISTINCT s.Name, s.Dateofbirth
FROM STUDENT s
JOIN ADMISSION a
    ON s.Rollno = a.Rollno
JOIN COURSE c
    ON a.SID = c.SID
WHERE s.Dateofbirth >= '2001-01-01'
  AND s.Dateofbirth < '2002-01-01'
  AND c.Coursetype = 'Parttime';