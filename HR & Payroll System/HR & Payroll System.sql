
-- 1. Departments Table
CREATE TABLE Departments 
(
    D_ID INT PRIMARY KEY IDENTITY,
    D_Name VARCHAR(100) NOT NULL
);

-- 2. Employees Table
CREATE TABLE Employees
(
    E_ID INT PRIMARY KEY IDENTITY,
    FName VARCHAR(50),
    LName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    HireDate DATE,
    D_ID INT,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (D_ID) REFERENCES Departments(D_ID)
);

-- 3. Attendance Table
CREATE TABLE Attendance 
(
    A_ID INT PRIMARY KEY IDENTITY,
    E_ID INT,
    Date DATE,
    Status VARCHAR(10), -- Present, Absent, Late
    FOREIGN KEY (E_ID) REFERENCES Employees(E_ID)
);

-- 4. Leaves Table
CREATE TABLE Leaves 
(
    L_ID INT PRIMARY KEY IDENTITY,
    E_ID INT,
    LeaveType VARCHAR(20), -- Sick, Vacation
    StartDate DATE,
    EndDate DATE,
    Status VARCHAR(20), -- Approved, Pending, Rejected
    FOREIGN KEY (E_ID) REFERENCES Employees(E_ID)
);

-- 5. Bonuses Table
CREATE TABLE Bonuses 
(
    B_ID INT PRIMARY KEY IDENTITY,
    E_ID INT,
    Amount DECIMAL(10, 2),
    Reason VARCHAR(255),
    DateGiven DATE,
    FOREIGN KEY (E_ID) REFERENCES Employees(E_ID)
);

-- 6. Payroll Table
CREATE TABLE Payroll
(
    P_ID INT PRIMARY KEY IDENTITY,
    E_ID INT,
    PayStart DATE,
    PayEnd DATE,
    BasicSalary DECIMAL(10,2),
    BonusAmount DECIMAL(10,2),
    Deductions DECIMAL(10,2),
    TotalPay DECIMAL(10,2),
    FOREIGN KEY (E_ID) REFERENCES Employees(E_ID)
);

-- Data for Departments
INSERT INTO Departments (D_Name) VALUES
('HR'),
('Finance'),
('IT'),
('Marketing');

-- Data for Employees
INSERT INTO Employees (FName, LName, Email, Phone, HireDate, D_ID, Salary) VALUES
('Salim', 'Al-Harthy', 'salim.harthy@company.om', '968-92123456', '2022-04-01', 1, 850.000),
('Aisha', 'Al-Maawali', 'aisha.maawali@company.om', '968-92345678', '2021-08-15', 2, 950.000),
('Khalid', 'Al-Rawahi', 'khalid.rawahi@company.om', '968-93456789', '2020-12-05', 3, 1100.000),
('Fatma', 'Al-Balushi', 'fatma.balushi@company.om', '968-91234567', '2023-02-10', 4, 780.000);

-- Data for Attendance
INSERT INTO Attendance (E_ID, Date, Status) VALUES
(1, '2025-05-01', 'Present'),
(1, '2025-05-02', 'Absent'),
(2, '2025-05-01', 'Present'),
(2, '2025-05-02', 'Present'),
(3, '2025-05-01', 'Late'),
(3, '2025-05-02', 'Present'),
(4, '2025-05-01', 'Present'),
(4, '2025-05-02', 'Absent');

-- Data for Leaves
INSERT INTO Leaves (E_ID, LeaveType, StartDate, EndDate, Status) VALUES
(1, 'Sick', '2025-05-02', '2025-05-03', 'Approved'),
(4, 'Vacation', '2025-05-10', '2025-05-14', 'Pending');

-- Data for Bonuses
INSERT INTO Bonuses (E_ID, Amount, Reason, DateGiven) VALUES
(1, 100.000, 'Excellent Performance', '2025-05-05'),
(3, 150.000, 'Project Completion Bonus', '2025-05-07');

-- Data for Payroll
INSERT INTO Payroll (E_ID, PayStart, PayEnd, BasicSalary, BonusAmount, Deductions, TotalPay) VALUES
(1, '2025-05-01', '2025-05-15', 425.000, 100.000, 20.000, 505.000),
(2, '2025-05-01', '2025-05-15', 475.000, 0.000, 15.000, 460.000),
(3, '2025-05-01', '2025-05-15', 550.000, 150.000, 30.000, 670.000),
(4, '2025-05-01', '2025-05-15', 390.000, 0.000, 10.000, 380.000);

