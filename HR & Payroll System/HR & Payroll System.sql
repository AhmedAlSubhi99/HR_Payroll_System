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
