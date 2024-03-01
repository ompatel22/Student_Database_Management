CREATE TABLE Users (
    userid VARCHAR(5) PRIMARY KEY,
    password VARCHAR(50)
);

CREATE TABLE Sem (
    sem_id VARCHAR(5) PRIMARY KEY
);

CREATE TABLE Department (
    dept_id VARCHAR(5) PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Faculty (
    userid VARCHAR(5),
    Fid VARCHAR(5) PRIMARY KEY,
    FN VARCHAR(50),
    MN VARCHAR(50),
    LN VARCHAR(50),
    Qualification VARCHAR(50),
    Experience INT,
    dept_id VARCHAR(5),
    FOREIGN KEY (userid) REFERENCES Users(userid),
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Faculty_PH_no (
    FPH_id VARCHAR(5) PRIMARY KEY,
    Fid VARCHAR(5),
    PH_no VARCHAR(15),
    FOREIGN KEY (Fid) REFERENCES Faculty(Fid)
);

CREATE TABLE Subjects (
    subject_id VARCHAR(5) PRIMARY KEY,
    sub_name VARCHAR(100),
    sem_id VARCHAR(5),
    FOREIGN KEY (sem_id) REFERENCES Sem(sem_id)
);

CREATE TABLE Attendance (
    subject_id VARCHAR(5),
    stud_id VARCHAR(5),
    th_per DECIMAL(5, 2),
    pra_per DECIMAL(5, 2),
    overall_per DECIMAL(5, 2),
    PRIMARY KEY (subject_id, stud_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id),
    FOREIGN KEY (stud_id) REFERENCES Student(stud_id)
);

CREATE TABLE Result (
    result_id VARCHAR(5) PRIMARY KEY,
    CPI DECIMAL(3, 2),
    SPI DECIMAL(3, 2),
    CGPA DECIMAL(3, 2)
);

CREATE TABLE Student (
    userid VARCHAR(5),
    stud_id VARCHAR(5) PRIMARY KEY,
    roll_no INT,
    street VARCHAR(100),
    city VARCHAR(50),
    PIN VARCHAR(10),
    FN VARCHAR(50),
    MN VARCHAR(50),
    LN VARCHAR(50),
    DOB DATE,
    Age INT,
    sem_id VARCHAR(5),
    result_id VARCHAR(5),
    FOREIGN KEY (sem_id) REFERENCES Sem(sem_id),
    FOREIGN KEY (result_id) REFERENCES Result(result_id),
    FOREIGN KEY (userid) REFERENCES Users(userid)
);

CREATE TABLE Student_PH_no (
    SPH_id VARCHAR(5) PRIMARY KEY,
    stud_id VARCHAR(5) ,
    PH_no VARCHAR(15),
    FOREIGN KEY (stud_id) REFERENCES Student(stud_id)
);

CREATE TABLE Student_email (
    semail_id VARCHAR(5) PRIMARY KEY,
    stud_id VARCHAR(5),
    email VARCHAR(100),
    FOREIGN KEY (stud_id) REFERENCES Student(stud_id)
);

CREATE TABLE Marks (
    subject_id VARCHAR(5) REFERENCES Subjects(subject_id),
    stud_id VARCHAR(5) REFERENCES Student(stud_id),
    th_marks DECIMAL(5, 2),
    prac_marks DECIMAL(5, 2),
    total_marks DECIMAL(5, 2),
    PRIMARY KEY (subject_id, stud_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id),
    FOREIGN KEY (stud_id) REFERENCES Student(stud_id)
);

CREATE TABLE Fees (
    receipt_id VARCHAR(5) PRIMARY KEY,
    tution_fees DECIMAL(10, 2),
    exam_fees DECIMAL(10, 2),
    total_fees DECIMAL(10, 2),
    sem_id VARCHAR(5),
    FOREIGN KEY (sem_id) REFERENCES Sem(sem_id)
);

CREATE TABLE Teaches (
    tid VARCHAR(5) PRIMARY KEY,
    Fid VARCHAR(5),
    stud_id VARCHAR(5),
    FOREIGN KEY (Fid) REFERENCES Faculty(Fid),
    FOREIGN KEY (stud_id) REFERENCES Student(stud_id)
);

INSERT INTO Users (userid, password)
VALUES
  ('U1', 'password1'),
  ('U2', 'password2'),
  ('U3', 'password3'),
  ('U4', 'password4'),
  ('U5', 'password5'),
  ('U6', 'password6'),
  ('U7', 'password7'),
  ('U8', 'password8'),
  ('U9', 'password9'),
  ('U10', 'password10'),
  ('U11', 'password11'),
  ('U12', 'password12'),
  ('U13', 'password13'),
  ('U14', 'password14'),
  ('U15', 'password15'),
  ('U16', 'password16'),
  ('U17', 'password17'),
  ('U18', 'password18'),
  ('U19', 'password19'),
  ('U20', 'password20'),
  ('U21', 'password21'),
  ('U22', 'password22'),
  ('U23', 'password23'),
  ('U24', 'password24'),
  ('U25', 'password25'),
  ('U26', 'password26'),
  ('U27', 'password27'),
  ('U28', 'password28'),
  ('U29', 'password29'),
  ('U30', 'password30'),
  ('U31', 'password31'),
  ('U32', 'password32'),
  ('U33', 'password33'),
  ('U34', 'password34'),
  ('U35', 'password35'),
  ('U36', 'password36'),
  ('U37', 'password37'),
  ('U38', 'password38'),
  ('U39', 'password39'),
  ('U40', 'password40'),
  ('U41', 'password41'),
  ('U42', 'password42'),
  ('U43', 'password43'),
  ('U44', 'password44'),
  ('U45', 'password45'),
  ('U46', 'password46'),
  ('U47', 'password47'),
  ('U48', 'password48'),
  ('U49', 'password49'),
  ('U50', 'password50');

INSERT INTO Department (dept_id, dept_name)
VALUES
  ('DEP1', 'Computer Science'),
  ('DEP2', 'Electrical Engineering'),
  ('DEP3', 'Mechanical Engineering'),
  ('DEP4', 'Information Techology'),
  ('DEP5', 'Chemical Engineering');

INSERT INTO Faculty (userid, Fid, FN, MN, LN, Qualification, Experience, dept_id)
VALUES
  ('U1', 'FAC1', 'Rajendra', 'Kumar', 'Sharma', 'Ph.D.', 10, 'DEP1'),
  ('U2', 'FAC2', 'Sarita', 'Singh', 'Yadav', 'M.Tech', 8, 'DEP2'),
  ('U3', 'FAC3', 'Rahul', 'Kumar', 'Mishra', 'Ph.D.', 12, 'DEP3'),
  ('U4', 'FAC4', 'Neha', 'Rani', 'Verma', 'M.Tech', 6, 'DEP4'),
  ('U5', 'FAC5', 'Amit', 'Kumar', 'Gupta', 'Ph.D.', 15, 'DEP5'),
  ('U6', 'FAC6', 'Pooja', 'Verma', 'Singh', 'M.Tech', 7, 'DEP1'),
  ('U7', 'FAC7', 'Ankit', 'Yadav', 'Sharma', 'Ph.D.', 9, 'DEP2'),
  ('U8', 'FAC8', 'Ruchi', 'Sharma', 'Srivastava', 'M.Tech', 5, 'DEP3'),
  ('U9', 'FAC9', 'Suresh', 'Kumar', 'Pandey', 'Ph.D.', 11, 'DEP4'),
  ('U10', 'FAC10', 'Neetu', 'Rani', 'Verma', 'M.Tech', 8, 'DEP5');

INSERT INTO Sem (sem_id)
VALUES
  ('SEM1'),
  ('SEM2'),
  ('SEM3'),
  ('SEM4'),
  ('SEM5'),
  ('SEM6'),
  ('SEM7'),
  ('SEM8');

INSERT INTO Result (result_id, CPI, SPI, CGPA)
VALUES
  ('R1', 8.5, 8.0, 8.25),
  ('R2', 9.0, 7.8, 8.4),
  ('R3', 8.2, 8.5, 8.35),
  ('R4', 7.9, 8.2, 8.05),
  ('R5', 8.7, 7.5, 8.1),
  ('R6', 8.0, 8.8, 8.4),
  ('R7', 8.4, 7.7, 8.05),
  ('R8', 7.6, 8.3, 7.95),
  ('R9', 8.9, 7.4, 8.15),
  ('R10', 7.8, 8.6, 8.2),
  ('R11', 8.3, 7.9, 8.1),
  ('R12', 7.7, 8.4, 8.05),
  ('R13', 9.0, 7.2, 8.6),
  ('R14', 7.5, 8.9, 8.2),
  ('R15', 8.8, 7.6, 8.2),
  ('R16', 7.3, 8.7, 8.0),
  ('R17', 8.6, 7.1, 7.85),
  ('R18', 7.2, 8.5, 7.85),
  ('R19', 8.5, 7.0, 7.75),
  ('R20', 7.0, 8.8, 7.9),
  ('R21', 8.8, 6.8, 7.8),
  ('R22', 6.9, 8.7, 7.8),
  ('R23', 8.7, 6.7, 7.7),
  ('R24', 6.6, 8.6, 7.6),
  ('R25', 8.6, 6.5, 7.55),
  ('R26', 6.5, 8.5, 7.5),
  ('R27', 8.5, 6.4, 7.45),
  ('R28', 6.4, 8.4, 7.4),
  ('R29', 8.4, 6.3, 7.35),
  ('R30', 6.3, 8.3, 7.3),
  ('R31', 8.3, 6.2, 7.25),
  ('R32', 6.2, 8.2, 7.2),
  ('R33', 8.2, 6.1, 7.15),
  ('R34', 6.1, 8.1, 7.1),
  ('R35', 8.1, 6.0, 7.05),
  ('R36', 6.0, 8.0, 7.0),
  ('R37', 8.0, 5.9, 6.95),
  ('R38', 5.9, 7.9, 6.9),
  ('R39', 7.9, 5.8, 6.85),
  ('R40', 5.8, 7.8, 6.8);


INSERT INTO Student (userid, stud_id, roll_no, street, city, PIN, FN, MN, LN, DOB, Age, sem_id, result_id)
VALUES
  ('U11', 'S1', 111, 'XYZ Street', 'Ahmedabad', '380001', 'Aniket', 'Ramesh', 'Patel', '2006-01-20', 18, 'SEM1', 'R1'),
  ('U12', 'S2', 112, 'ABC Street', 'Surat', '395001', 'Sanya', 'Deepak', 'Shah', '2006-04-15', 18, 'SEM2', 'R2'),
  ('U13', 'S3', 113, 'LMN Street', 'Vadodara', '390001', 'Rohan', 'Mishra','Trivedi','2005-11-18', 19, 'SEM3', 'R3'),
  ('U14', 'S4', 114, 'PQR Street', 'Rajkot', '360001', 'Nisha', 'Mahesh', 'Verma', '2005-02-03', 19, 'SEM4', 'R4'),
  ('U15', 'S5', 115, 'LMN Street', 'Gandhinagar', '382001', 'Arjun', 'Dilip', 'Gupta', '2004-12-15', 20, 'SEM5', 'R5'),
  ('U16', 'S6', 116, 'XYZ Street', 'Bhavnagar', '364001', 'Pooja', 'Sandeep', 'Singh', '2004-09-18', 20, 'SEM6', 'R6'),
  ('U17', 'S7', 117, 'ABC Street', 'Jamnagar', '361001', 'Anjali', 'Yadav', 'Sharma', '2003-04-30', 21, 'SEM7', 'R7'),
  ('U18', 'S8', 118, 'PQR Street', 'Junagadh', '362001', 'Ravi', 'Hitesh', 'Srivastava', '2003-07-14', 21, 'SEM8', 'R8'),
  ('U19', 'S9', 119, 'LMN Street', 'Morbi', '363001', 'Sunny', 'Nimesh', 'Pandey', '2006-05-28', 18, 'SEM1', 'R9'),
  ('U20', 'S10', 120, 'XYZ Street', 'Gandhidham', '370001', 'Neha', 'Jagdish', 'Verma', '2006-12-03', 18, 'SEM2', 'R10'),
  ('U21', 'S11', 121, 'ABC Street', 'Anand', '388001', 'Aryan', 'Vipul', 'Sharma', '2005-07-12', 19, 'SEM3', 'R11'),
  ('U22', 'S12', 122, 'XYZ Street', 'Bharuch', '392001', 'Sanvi', 'Rohan', 'Yadav', '2005-04-25', 19, 'SEM4', 'R12'),
  ('U23', 'S13', 123, 'LMN Street', 'Gandhidham', '370001', 'Rishi', 'Urvesh', 'Mishra', '2004-11-18',20, 'SEM5', 'R13'),
  ('U24', 'S14', 124, 'PQR Street', 'Vapi', '396191', 'Esha', 'Sandip', 'Verma', '2004-02-03', 20, 'SEM6', 'R14'),
  ('U25', 'S15', 125, 'LMN Street', 'Valsad', '396001', 'Vandan', 'Dilip', 'Gupta', '2003-12-15', 21, 'SEM7', 'R15'),
  ('U26', 'S16', 126, 'XYZ Street', 'Navsari', '396445', 'Aman', 'Hitesh', 'Singh', '2003-09-18', 21, 'SEM8', 'R16'),
  ('U27', 'S17', 127, 'ABC Street', 'Surendranagar', '363001', 'Deepak', 'parth', 'Sharma', '2006-04-30',18, 'SEM1', 'R17'),
  ('U28', 'S18', 128, 'PQR Street', 'Dahod', '389151', 'Het', 'Suresh', 'Srivastava', '2006-07-14', 18, 'SEM2', 'R18'),
  ('U29', 'S19', 129, 'LMN Street', 'Palanpur', '385001', 'Appu', 'Manish', 'Pandey', '2005-05-28', 19, 'SEM3', 'R19'),
  ('U30', 'S20', 130, 'XYZ Street', 'Botad', '364710', 'Jal', 'Sanjay', 'Patel', '2005-12-03', 19, 'SEM4', 'R20'),
  ('U31', 'S21', 131, 'ABC Street', 'Dholka', '387810', 'Megha', 'Hitest', 'Sharma', '2004-07-12', 20, 'SEM5', 'R21'),
  ('U32', 'S22', 132, 'XYZ Street', 'Mehsana', '384001', 'Rutvi', 'Deepak', 'Yadav', '2004-04-25', 20, 'SEM6', 'R22'),
  ('U33', 'S23', 133, 'LMN Street', 'Modasa', '383315', 'Trushali', 'Jaimin', 'Mishra', '2003-11-18', 21, 'SEM7', 'R23'),
  ('U34', 'S24', 134, 'PQR Street', 'Mandvi', '370465', 'Nishu', 'Urvish', 'Verma', '2003-02-03', 21, 'SEM8', 'R24'),
  ('U35', 'S25', 135, 'LMN Street', 'Morbi', '363001', 'Anuj', 'Ashish', 'Gupta', '2006-12-15', 18, 'SEM1', 'R25'),
  ('U36', 'S26', 136, 'XYZ Street', 'Gandhidham', '370001', 'Mukti', 'Kevat', 'Singh', '2006-09-18', 18, 'SEM2', 'R26'),
  ('U37', 'S27', 137, 'ABC Street', 'Anand', '388001', 'Trupti', 'Preet', 'Sharma', '2005-04-30', 19, 'SEM3', 'R27'),
  ('U38', 'S28', 138, 'PQR Street', 'Bharuch', '392001', 'Piyush', 'Nimesh', 'Srivastava', '2005-07-14', 19, 'SEM4', 'R28'),
  ('U39', 'S29', 139, 'LMN Street', 'Dahod', '389151', 'Shruti', 'Manu', 'Pandey', '2004-05-28', 20, 'SEM5', 'R29'),
  ('U40', 'S30', 140, 'XYZ Street', 'Vapi', '396191', 'Bansi', 'Raju', 'Verma', '2004-12-03', 20, 'SEM6', 'R30'),
  ('U41', 'S31', 141, 'ABC Street', 'Anand', '388001', 'Hemani', 'Ramesh', 'Sharma', '2003-01-26', 21, 'SEM7', 'R31'),
  ('U42', 'S32', 142, 'JKL Street', 'Vapi', '396191', 'Mohit', 'mahesh', 'Shah', '2003-05-11', 21, 'SEM8', 'R32'),
  ('U43', 'S33', 143, 'PQR Street', 'Morbi', '363001', 'Rohit', 'jitesh', 'Patel', '2006-11-20', 18, 'SEM1', 'R33'),
  ('U44', 'S34', 144, 'DEF Street', 'Ahmedabad', '380001', 'Ishani', 'Vimal', 'Chauhan', '2006-07-07', 18, 'SEM2', 'R34'),
  ('U45', 'S35', 145, 'UVW Street', 'Rajkot', '360001', 'Rahul', 'Harish', 'Trivedi', '2005-01-14', 19, 'SEM3', 'R35'),
  ('U46', 'S36', 146, 'MNO Street', 'Junagadh', '362001', 'Sanju', 'Amit', 'Mehta', '2005-08-23', 19, 'SEM4', 'R36'),
  ('U47', 'S37', 147, 'GHI Street', 'Bharuch', '392001', 'Arnav', 'Ruchi', 'Gandhi', '2004-10-30', 20, 'SEM5', 'R37'),
  ('U48', 'S38', 148, 'RST Street', 'Navsari', '396445', 'Tanisha', 'Mihir', 'Joshi', '2004-04-06', 20, 'SEM6', 'R38'),
  ('U49', 'S39', 149, 'ABC Street', 'Mehsana', '384001', 'Dev', 'Amkit', 'Sharma', '2003-10-15', 21, 'SEM7', 'R39'),
  ('U50', 'S40', 150, 'JKL Street', 'Gandhinagar', '382001', 'Mira', 'Sachin', 'Shah', '2003-12-22', 21, 'SEM8', 'R40');

INSERT INTO Subjects (subject_id, sub_name, sem_id)
VALUES
  ('SUB1', 'C Language', 'SEM1'),
  ('SUB2', 'Electrical Circuits', 'SEM1'),
  ('SUB3', 'C++ Language', 'SEM2'),
  ('SUB4', 'Physics', 'SEM2'),
  ('SUB5', 'Java', 'SEM3'),
  ('SUB6','Data Structure','SEM3'),
  ('SUB7','Computer Network','SEM4'),
  ('SUB8','Data Analysis and Algorithm','SEM4'),
  ('SUB9','Computer Organization','SEM5'),
  ('SUB10','Theory of Automata and Formal Language','SEM5'),
  ('SUB11','Language Translator','SEM6'),
  ('SUB12','Applied Operating System','SEM6'),
  ('SUB13','Advance Java','SEM7'),
  ('SUB14','System Design','SEM7');


INSERT INTO Faculty_PH_no (FPH_id, Fid, PH_no)
VALUES
  ('FPH1', 'FAC1', '9876543210'),
  ('FPH2', 'FAC2', '8765432109'),
  ('FPH3', 'FAC3', '7654321098'),
  ('FPH4', 'FAC4', '6543210987'),
  ('FPH5', 'FAC5', '5432109876'),
  ('FPH6', 'FAC6', '3213555876'),
  ('FPH7', 'FAC7', '5465168876'),
  ('FPH8', 'FAC8', '7279769876'),
  ('FPH9', 'FAC9', '9459559876'),
  ('FPH10', 'FAC10', '7464269876');

 -- Inserting into Student_PH_no
INSERT INTO Student_PH_no (SPH_id, stud_id, PH_no)
VALUES
  ('SPH1', 'S1', '9876543210'),
  ('SPH2', 'S2', '8765432109'),
  ('SPH3', 'S3', '7654321098'),
  ('SPH4', 'S4', '6543210987'),
  ('SPH5', 'S5', '5432109876'),
  ('SPH6', 'S6', '4321098765'),
  ('SPH7', 'S7', '3210987654'),
  ('SPH8', 'S8', '2109876543'),
  ('SPH9', 'S9', '9876543210'),
  ('SPH10', 'S10', '8765432109'),
  ('SPH11', 'S11', '7654321098'),
  ('SPH12', 'S12', '6543210987'),
  ('SPH13', 'S13', '5432109876'),
  ('SPH14', 'S14', '4321098765'),
  ('SPH15', 'S15', '3210987654'),
  ('SPH16', 'S16', '2109876543'),
  ('SPH17', 'S17', '9876543210'),
  ('SPH18', 'S18', '8765432109'),
  ('SPH19', 'S19', '7654321098'),
  ('SPH20', 'S20', '6543210987'),
  ('SPH21', 'S21', '5432109876'),
  ('SPH22', 'S22', '4321098765'),
  ('SPH23', 'S23', '3210987654'),
  ('SPH24', 'S24', '2109876543'),
  ('SPH25', 'S25', '9876543210'),
  ('SPH26', 'S26', '8765432109'),
  ('SPH27', 'S27', '7654321098'),
  ('SPH28', 'S28', '6543210987'),
  ('SPH29', 'S29', '5432109876'),
  ('SPH30', 'S30', '4321843765'),
  ('SPH31', 'S31', '5432843776'),
  ('SPH32', 'S32', '4321843765'),
  ('SPH33', 'S33', '3231665664'),
  ('SPH34', 'S34', '3234656543'),
  ('SPH35', 'S35', '9816543210'),
  ('SPH36', 'S36', '3231132109'),
  ('SPH37', 'S37', '7895421098'),
  ('SPH38', 'S38', '6789210987'),
  ('SPH39', 'S39', '5432136876'),
  ('SPH40', 'S40', '6851098765');

-- Inserting into Student_email
INSERT INTO Student_email (semail_id, stud_id, email)
VALUES
  ('SE1', 'S1', 'ankit@gmail.com'),
  ('SE2', 'S2', 'sanya@gmail.com'),
  ('SE3', 'S3', 'rohan@gmail.com'),
  ('SE4', 'S4', 'nisha@gmail.com'),
  ('SE5', 'S5', 'arjun@gmail.com'),
  ('SE6', 'S6', 'pooja@gmail.com'),
  ('SE7', 'S7', 'anjali@gmail.com'),
  ('SE8', 'S8', 'ravi@gmail.com'),
  ('SE9', 'S9', 'sunny@gmail.com'),
  ('SE10', 'S10', 'neha@gmail.com'),
  ('SE11', 'S11', 'aryan@gmail.com'),
  ('SE12', 'S12', 'sanvi@gmail.com'),
  ('SE13', 'S13', 'rishi@gmail.com'),
  ('SE14', 'S14', 'esha@gmail.com'),
  ('SE15', 'S15', 'vandan@gmail.com'),
  ('SE16', 'S16', 'aman@gmail.com'),
  ('SE17', 'S17', 'deepak@gmail.com'),
  ('SE18', 'S18', 'het@gmail.com'),
  ('SE19', 'S19', 'appu@gmail.com'),
  ('SE20', 'S20', 'jal@gmail.com'),
  ('SE21', 'S21', 'megha@gmail.com'),
  ('SE22', 'S22', 'rutvi@gmail.com'),
  ('SE23', 'S23', 'trushali@gmail.com'),
  ('SE24', 'S24', 'nishu@gmail.com'),
  ('SE25', 'S25', 'anuj@gmail.com'),
  ('SE26', 'S26', 'mukti@gmail.com'),
  ('SE27', 'S27', 'trupti@gmail.com'),
  ('SE28', 'S28', 'piyush@gmail.com'),
  ('SE29', 'S29', 'shruti@gmail.com'),
  ('SE30', 'S30', 'bansi@gmail.com'),
  ('SE31', 'S31', 'hemani@gmail.com'),
  ('SE32', 'S32', 'mohit@gmail.com'),
  ('SE33', 'S33', 'rohit@gmail.com'),
  ('SE34', 'S34', 'ishani@gmail.com'),
  ('SE35', 'S35', 'rahul@gmail.com'),
  ('SE36', 'S36', 'sanju@gmail.com'),
  ('SE37', 'S37', 'arnav@gmail.com'),
  ('SE38', 'S38', 'tanisha@gmail.com'),
  ('SE39', 'S39', 'dev@gmail.com'),
  ('SE40', 'S40', 'mira@gmail.com');

INSERT INTO Marks (subject_id, stud_id, th_marks, prac_marks, total_marks)
VALUES
  ('SUB1', 'S1', 80.00, 40.00, 120.00),
  ('SUB2', 'S1', 75.00, 35.00, 110.00),
  ('SUB1', 'S9', 78.00, 38.00, 116.00),
  ('SUB2', 'S9', 82.00, 42.00, 124.00),
  ('SUB1', 'S17', 76.00, 36.00, 112.00),
  ('SUB2', 'S17', 80.00, 40.00, 120.00),
  ('SUB1', 'S25', 85.00, 45.00, 130.00),
  ('SUB2', 'S25', 78.00, 38.00, 116.00);

INSERT INTO Marks (subject_id, stud_id, th_marks, prac_marks, total_marks)
VALUES
  ('SUB3', 'S2', 82.00, 45.00, 127.00),
  ('SUB4', 'S2', 78.00, 40.00, 118.00),
  ('SUB3', 'S10', 78.00, 38.00, 116.00),
  ('SUB4', 'S10', 85.00, 45.00, 130.00),
  ('SUB3', 'S18', 82.00, 42.00, 124.00),
  ('SUB4', 'S18', 76.00, 36.00, 112.00),
  ('SUB3', 'S26', 80.00, 40.00, 120.00),
  ('SUB4', 'S26', 85.00, 45.00, 130.00);

INSERT INTO Marks (subject_id, stud_id, th_marks, prac_marks, total_marks)
VALUES
  ('SUB5', 'S3', 85.00, 48.00, 133.00),
  ('SUB6', 'S3', 80.00, 45.00, 125.00),
  ('SUB5', 'S11', 76.00, 36.00, 112.00),
  ('SUB6', 'S11', 85.00, 48.00, 133.00),
  ('SUB5', 'S19', 82.00, 42.00, 124.00),
  ('SUB6', 'S19', 78.00, 38.00, 116.00),
  ('SUB5', 'S27', 80.00, 40.00, 120.00),
  ('SUB6', 'S27', 82.00, 45.00, 127.00);

INSERT INTO Marks (subject_id, stud_id, th_marks, prac_marks, total_marks)
VALUES
  ('SUB7', 'S4', 88.00, 50.00, 138.00),
  ('SUB8', 'S4', 84.00, 48.00, 132.00),
  ('SUB7', 'S12', 82.00, 45.00, 127.00),
  ('SUB8', 'S12', 85.00, 48.00, 133.00),
  ('SUB7', 'S20', 76.00, 36.00, 112.00),
  ('SUB8', 'S20', 80.00, 40.00, 120.00),
  ('SUB7', 'S28', 78.00, 38.00, 116.00),
  ('SUB8', 'S28', 82.00, 42.00, 124.00);

INSERT INTO Marks (subject_id, stud_id, th_marks, prac_marks, total_marks)
VALUES
  ('SUB9', 'S5', 85.00, 48.00, 133.00),
  ('SUB10', 'S5', 80.00, 45.00, 125.00),
  ('SUB9', 'S13', 76.00, 36.00, 112.00),
  ('SUB10', 'S13', 85.00, 48.00, 133.00),
  ('SUB9', 'S21', 82.00, 42.00, 124.00),
  ('SUB10', 'S21', 78.00, 38.00, 116.00),
  ('SUB9', 'S29', 80.00, 40.00, 120.00),
  ('SUB10', 'S29', 82.00, 45.00, 127.00);

INSERT INTO Marks (subject_id, stud_id, th_marks, prac_marks, total_marks)
VALUES
  ('SUB11', 'S6', 88.00, 50.00, 138.00),
  ('SUB12', 'S6', 84.00, 48.00, 132.00),
  ('SUB11', 'S14', 82.00, 45.00, 127.00),
  ('SUB12', 'S14', 85.00, 48.00, 133.00),
  ('SUB11', 'S22', 76.00, 36.00, 112.00),
  ('SUB12', 'S22', 80.00, 40.00, 120.00),
  ('SUB11', 'S30', 78.00, 38.00, 116.00),
  ('SUB12', 'S30', 82.00, 42.00, 124.00);

INSERT INTO Marks (subject_id, stud_id, th_marks, prac_marks, total_marks)
VALUES
  ('SUB13', 'S7', 85.00, 48.00, 133.00),
  ('SUB14', 'S7', 80.00, 45.00, 125.00),
  ('SUB13', 'S15', 76.00, 36.00, 112.00),
  ('SUB14', 'S15', 85.00, 48.00, 133.00),
  ('SUB13', 'S23', 82.00, 42.00, 124.00),
  ('SUB14', 'S23', 78.00, 38.00, 116.00),
  ('SUB13', 'S31', 80.00, 40.00, 120.00),
  ('SUB14', 'S31', 82.00, 45.00, 127.00);

INSERT INTO Marks (subject_id, stud_id, th_marks, prac_marks, total_marks)
VALUES
  ('SUB13', 'S8', 88.00, 50.00, 138.00),
  ('SUB14', 'S8', 84.00, 48.00, 132.00),
  ('SUB13', 'S16', 82.00, 45.00, 127.00),
  ('SUB14', 'S16', 85.00, 48.00, 133.00),
  ('SUB13', 'S24', 76.00, 36.00, 112.00),
  ('SUB14', 'S24', 80.00, 40.00, 120.00),
  ('SUB13', 'S32', 78.00, 38.00, 116.00),
  ('SUB14', 'S32', 82.00, 42.00, 124.00);


INSERT INTO Teaches (tid, Fid, stud_id)
VALUES
  ('T1', 'FAC1', 'S1'),
  ('T2', 'FAC1', 'S2'),
  ('T3', 'FAC2', 'S3'),
  ('T4', 'FAC2', 'S4'),
  ('T5', 'FAC3', 'S5'),
  ('T6', 'FAC3', 'S6'),
  ('T7', 'FAC4', 'S7'),
  ('T8', 'FAC4', 'S8'),
  ('T9', 'FAC5', 'S9'),
  ('T10', 'FAC5', 'S10'),
  ('T11', 'FAC6', 'S11'),
  ('T12', 'FAC6', 'S12'),
  ('T13', 'FAC7', 'S13'),
  ('T14', 'FAC7', 'S14'),
  ('T15', 'FAC8', 'S15'),
  ('T16', 'FAC8', 'S16'),
  ('T17', 'FAC9', 'S17'),
  ('T18', 'FAC9', 'S18'),
  ('T19', 'FAC10', 'S19'),
  ('T20', 'FAC10', 'S20'),
  ('T21', 'FAC1', 'S21'),
  ('T22', 'FAC1', 'S22'),
  ('T23', 'FAC2', 'S23'),
  ('T24', 'FAC2', 'S24'),
  ('T25', 'FAC3', 'S25'),
  ('T26', 'FAC3', 'S26'),
  ('T27', 'FAC4', 'S27'),
  ('T28', 'FAC4', 'S28'),
  ('T29', 'FAC5', 'S29'),
  ('T30', 'FAC5', 'S30'),
  ('T31', 'FAC6', 'S31'),
  ('T32', 'FAC6', 'S32'),
  ('T33', 'FAC7', 'S33'),
  ('T34', 'FAC7', 'S34'),
  ('T35', 'FAC8', 'S35'),
  ('T36', 'FAC8', 'S36'),
  ('T37', 'FAC9', 'S37'),
  ('T38', 'FAC9', 'S38'),
  ('T39', 'FAC10', 'S39'),
  ('T40', 'FAC10', 'S40');

INSERT INTO Attendance (subject_id, stud_id, th_per, pra_per, overall_per)
VALUES
  ('SUB1', 'S1', 80, 40, 60),
  ('SUB2', 'S1', 75, 35, 55),
  ('SUB1', 'S9', 78, 38, 58),
  ('SUB2', 'S9', 82, 42, 62),
  ('SUB1', 'S17', 76, 36, 56),
  ('SUB2', 'S17', 80, 40, 60),
  ('SUB1', 'S25', 85, 45, 75),
  ('SUB2', 'S25', 78, 38, 58);

INSERT INTO Attendance (subject_id, stud_id, th_per, pra_per, overall_per)
VALUES
  ('SUB3', 'S2', 82, 45, 65),
  ('SUB4', 'S2', 78, 40, 60),
  ('SUB3', 'S10', 78, 38, 58),
  ('SUB4', 'S10', 85, 45, 75),
  ('SUB3', 'S18', 82, 42, 62),
  ('SUB4', 'S18', 76, 36, 56),
  ('SUB3', 'S26', 80, 40, 60),
  ('SUB4', 'S26', 85, 45, 75);

INSERT INTO Attendance (subject_id, stud_id, th_per, pra_per, overall_per)
VALUES
  ('SUB5', 'S3', 85, 48, 70),
  ('SUB6', 'S3', 80, 45, 65),
  ('SUB5', 'S11', 76, 36, 56),
  ('SUB6', 'S11', 85, 48, 70),
  ('SUB5', 'S19', 82, 42, 62),
  ('SUB6', 'S19', 78, 38, 58),
  ('SUB5', 'S27', 80, 40, 60),
  ('SUB6', 'S27', 82, 45, 75);

INSERT INTO Attendance (subject_id, stud_id, th_per, pra_per, overall_per)
VALUES
  ('SUB7', 'S4', 88, 50, 75),
  ('SUB8', 'S4', 84, 48, 70),
  ('SUB7', 'S12', 82, 45, 65),
  ('SUB8', 'S12', 85, 48, 70),
  ('SUB7', 'S20', 76, 36, 56),
  ('SUB8', 'S20', 80, 40, 60),
  ('SUB7', 'S28', 78, 38, 58),
  ('SUB8', 'S28', 82, 42, 62);

INSERT INTO Attendance (subject_id, stud_id, th_per, pra_per, overall_per)
VALUES
  ('SUB9', 'S5', 85, 48, 70),
  ('SUB10', 'S5', 80, 45, 65),
  ('SUB9', 'S13', 76, 36, 56),
  ('SUB10', 'S13', 85, 48, 70),
  ('SUB9', 'S21', 82, 42, 62),
  ('SUB10', 'S21', 78, 38, 58),
  ('SUB9', 'S29', 80, 40, 60),
  ('SUB10', 'S29', 82, 45, 75);

INSERT INTO Attendance (subject_id, stud_id, th_per, pra_per, overall_per)
VALUES
  ('SUB11', 'S6', 88, 50, 75),
  ('SUB12', 'S6', 84, 48, 70),
  ('SUB11', 'S14', 82, 45, 65),
  ('SUB12', 'S14', 85, 48, 70),
  ('SUB11', 'S22', 76, 36, 56),
  ('SUB12', 'S22', 80, 40, 60),
  ('SUB11', 'S30', 78, 38, 58),
  ('SUB12', 'S30', 82, 42, 62);

INSERT INTO Attendance (subject_id, stud_id, th_per, pra_per, overall_per)
VALUES
  ('SUB13', 'S7', 85, 48, 70),
  ('SUB14', 'S7', 80, 45, 65),
  ('SUB13', 'S15', 76, 36, 56),
  ('SUB14', 'S15', 85, 48, 70),
  ('SUB13', 'S23', 82, 42, 62),
  ('SUB14', 'S23', 78, 38, 58),
  ('SUB13', 'S31', 80, 40, 60),
  ('SUB14', 'S31', 82, 45, 75);

INSERT INTO Attendance (subject_id, stud_id, th_per, pra_per, overall_per)
VALUES
  ('SUB13', 'S8', 88, 50, 75),
  ('SUB14', 'S8', 84, 48, 70),
  ('SUB13', 'S16', 82, 45, 65),
  ('SUB14', 'S16', 85, 48, 70),
  ('SUB13', 'S24', 76, 36, 56),
  ('SUB14', 'S24', 80, 40, 60),
  ('SUB13', 'S32', 78, 38, 58),
  ('SUB14', 'S32', 82, 42, 62);

INSERT INTO Fees (receipt_id, tution_fees, exam_fees, total_fees, sem_id)
VALUES
  ('R1', 78500, 5000, 83500, 'SEM1'),
  ('R2', 78500, 5000, 83500, 'SEM2'),
  ('R3', 79500, 5000, 84500, 'SEM3'),
  ('R4', 79500, 5000, 84500, 'SEM4'),
  ('R5', 80000, 5000, 85000, 'SEM5'),
  ('R6', 80000, 5000, 85000, 'SEM6'),
  ('R7', 80000, 5000, 85000, 'SEM7'),
  ('R8', 80000, 5000, 85000, 'SEM8');

