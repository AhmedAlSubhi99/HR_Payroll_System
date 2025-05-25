-- 1. Departments Table
CREATE TABLE Departments 
(
    DepartmentID INT PRIMARY KEY IDENTITY,
    DepartmentName VARCHAR(100) NOT NULL
);

-- 2. Employees Table
CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY IDENTITY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    HireDate DATE,
    DepartmentID INT,
    BaseSalary DECIMAL(10, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- 3. Attendance Table
CREATE TABLE Attendance 
(
    AttendanceID INT PRIMARY KEY IDENTITY,
    EmployeeID INT,
    Date DATE,
    Status VARCHAR(10), -- Present, Absent, Late
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- 4. Leaves Table
CREATE TABLE Leaves 
(
    LeaveID INT PRIMARY KEY IDENTITY,
    EmployeeID INT,
    LeaveType VARCHAR(20), -- Sick, Vacation, etc.
    StartDate DATE,
    EndDate DATE,
    Status VARCHAR(20), -- Approved, Pending, Rejected
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- 5. Bonuses Table
CREATE TABLE Bonuses 
(
    BonusID INT PRIMARY KEY IDENTITY,
    EmployeeID INT,
    Amount DECIMAL(10, 2),
    Reason VARCHAR(255),
    DateGiven DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- 6. Payroll Table
CREATE TABLE Payroll
(
    PayrollID INT PRIMARY KEY IDENTITY,
    EmployeeID INT,
    PayPeriodStart DATE,
    PayPeriodEnd DATE,
    BasicSalary DECIMAL(10,2),
    BonusAmount DECIMAL(10,2),
    Deductions DECIMAL(10,2),
    NetPay DECIMAL(10,2),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Data for Departments
INSERT INTO Departments (DepartmentName) VALUES
('HR'),
('Finance'),
('IT'),
('Marketing');

-- Data for Employees
INSERT INTO Employees (FirstName, LastName, Email, Phone, HireDate, DepartmentID, BaseSalary) VALUES
('Salim', 'Al-Harthy', 'salim.harthy@company.om', '968-92123456', '2022-04-01', 1, 850.000),
('Aisha', 'Al-Maawali', 'aisha.maawali@company.om', '968-92345678', '2021-08-15', 2, 950.000),
('Khalid', 'Al-Rawahi', 'khalid.rawahi@company.om', '968-93456789', '2020-12-05', 3, 1100.000),
('Fatma', 'Al-Balushi', 'fatma.balushi@company.om', '968-91234567', '2023-02-10', 4, 780.000);

-- Data for Attendance
INSERT INTO Attendance (EmployeeID, Date, Status) VALUES
(1, '2025-05-01', 'Present'),
(1, '2025-05-02', 'Absent'),
(2, '2025-05-01', 'Present'),
(2, '2025-05-02', 'Present'),
(3, '2025-05-01', 'Late'),
(3, '2025-05-02', 'Present'),
(4, '2025-05-01', 'Present'),
(4, '2025-05-02', 'Absent');

-- Data for Leaves
INSERT INTO Leaves (EmployeeID, LeaveType, StartDate, EndDate, Status) VALUES
(1, 'Sick', '2025-05-02', '2025-05-03', 'Approved'),
(4, 'Vacation', '2025-05-10', '2025-05-14', 'Pending');

-- Data for Bonuses
INSERT INTO Bonuses (EmployeeID, Amount, Reason, DateGiven) VALUES
(1, 100.000, 'Excellent Performance', '2025-05-05'),
(3, 150.000, 'Project Completion Bonus', '2025-05-07');

-- Data for Payroll
INSERT INTO Payroll (EmployeeID, PayPeriodStart, PayPeriodEnd, BasicSalary, BonusAmount, Deductions, NetPay) VALUES
(1, '2025-05-01', '2025-05-15', 425.000, 100.000, 20.000, 505.000),
(2, '2025-05-01', '2025-05-15', 475.000, 0.000, 15.000, 460.000),
(3, '2025-05-01', '2025-05-15', 550.000, 150.000, 30.000, 670.000),
(4, '2025-05-01', '2025-05-15', 390.000, 0.000, 10.000, 380.000);

