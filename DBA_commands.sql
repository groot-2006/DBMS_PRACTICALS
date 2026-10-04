-- DBA 1. Create users

CREATE USER 'clerk'@'localhost'
IDENTIFIED BY 'StrongPass#1';

CREATE USER 'analyst'@'%'
IDENTIFIED BY 'AnotherPass#2';


-- DBA 2. Create a role and grant privileges

CREATE ROLE 'reporter';

GRANT SELECT ON college.* TO 'reporter';


-- DBA 3. Revoke privileges

REVOKE SELECT ON college.* FROM 'reporter';


-- DBA 4. Create an index

CREATE INDEX idx_student_name
ON STUDENT(Name);

SHOW INDEX FROM STUDENT;