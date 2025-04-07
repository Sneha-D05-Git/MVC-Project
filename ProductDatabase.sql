create database productsales
use productsales

CREATE TABLE Userss (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) UNIQUE NOT NULL,
    Password NVARCHAR(50) NOT NULL,
    Role NVARCHAR(20) NOT NULL CHECK (Role IN ('Admin', 'User'))
);

INSERT INTO Userss (Username, Password, Role) VALUES 
('sneha', '55555', 'Admin');
INSERT INTO Userss (Username, Password, Role) VALUES 
('aditi', '12345', 'User');

select * from Userss

CREATE TABLE Products (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL,
    Category NVARCHAR(50),
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Sales (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ProductId INT FOREIGN KEY REFERENCES Products(Id),
    Quantity INT NOT NULL,
    TotalPrice DECIMAL(10,2) NOT NULL,
    SaleDate DATETIME DEFAULT GETDATE(),
    UserId INT FOREIGN KEY REFERENCES Userss(Id)
);

CREATE TABLE ActivityLogs (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(100),
    Action NVARCHAR(255),
    ActionTime DATETIME DEFAULT GETDATE()
);
select * from ActivityLogs

CREATE TABLE Orders (
    Id INT PRIMARY KEY IDENTITY(1,1),
    UserId INT FOREIGN KEY REFERENCES Userss(Id),
    ProductId INT FOREIGN KEY REFERENCES Products(Id),
    Quantity INT,
    TotalPrice DECIMAL(10,2),
    OrderDate DATETIME DEFAULT GETDATE()
);
select * from Orders