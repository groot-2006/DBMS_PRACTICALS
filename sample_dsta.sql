USE college;


-- STUDENT DATA

INSERT INTO STUDENT (Rollno, Name, Dateofbirth) VALUES
('X2001', 'Ankit Sharma', '2001-03-14'),
('X2002', 'Riya Verma', '2002-05-11'),
('X2005', 'Aditi Rao', '2001-07-09'),
('X2007', 'Neha Joshi', '2002-02-18'),
('X2010', 'Amit Kapoor', '2001-08-17'),
('Y2006', 'Rahul Gupta', '2000-09-30'),
('Y2009', 'Pooja Mehta', '2003-04-22'),
('Z2003', 'Sana Iqbal', '2001-11-02'),
('Z2004', 'Arjun Nair', '2003-01-25'),
('Z2008', 'Vikram Singh', '2001-12-05');


-- COURSE DATA

INSERT INTO COURSE
(SID, Cname, TotalSeats, Duration, Coursetype, TeacherInCharge)
VALUES
('CS01', 'Computer Science', 60, 3, 'Fulltime', 'Dr. Mehta'),
('PH01', 'Physics', 40, 3, 'Fulltime', 'Dr. Rao'),
('MA01', 'Mathematics', 50, 2, 'Parttime', 'Dr. Sharma'),
('CH01', 'Chemistry', 45, 3, 'Fulltime', 'Dr. Gupta'),
('EN01', 'English', 30, 1, 'Parttime', 'Dr. Joshi'),
('EC01', 'Economics', 50, 3, 'Parttime', 'Dr. Kapoor');


-- SOCIETY DATA

INSERT INTO SOCIETY
(SocID, Socname, TotalSeats)
VALUES
('S01', 'Coding Club', 50),
('S02', 'Robotics Club', 40),
('S03', 'Literary Club', 30),
('S04', 'Music Club', 35),
('S05', 'Photography Club', 25);


-- ADMISSION DATA

INSERT INTO ADMISSION
(Rollno, SID, AdmissionDate)
VALUES
('X2001', 'CS01', '2023-07-01'),
('X2002', 'CS01', '2023-07-02'),
('X2005', 'MA01', '2023-07-03'),
('X2007', 'PH01', '2023-07-04'),
('X2010', 'CS01', '2023-07-05'),
('Y2006', 'MA01', '2023-07-06'),
('Y2009', 'CH01', '2023-07-07'),
('Z2003', 'CS01', '2023-07-08'),
('X2001', 'MA01', '2023-07-09'),
('X2010', 'EC01', '2023-07-10'),
('Z2003', 'EC01', '2023-07-11'),
('X2002', 'CH01', '2023-07-12');


-- ENROLLMENT DATA

INSERT INTO ENROLLMENT
(Rollno, SocID, EnrollmentDate)
VALUES
('X2001', 'S01', '2023-08-01'),
('X2001', 'S02', '2023-08-02'),
('X2002', 'S01', '2023-08-03'),
('X2005', 'S01', '2023-08-04'),
('X2007', 'S01', '2023-08-05'),
('X2010', 'S03', '2023-08-06'),
('Y2006', 'S02', '2023-08-07'),
('Y2009', 'S01', '2023-08-08'),
('Z2003', 'S03', '2023-08-09'),
('Z2008', 'S04', '2023-08-10');