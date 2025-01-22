-- Drop the database if it exists
IF DB_ID('JumboElectric') IS NOT NULL
BEGIN
    DROP DATABASE JumboElectric;
END;

-- Create the new database
CREATE DATABASE JumboElectric;

-- Use the new database
USE JumboElectric;

-- Create Suppliers Table
CREATE TABLE Suppliers (
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    SupplierName NVARCHAR(100) NOT NULL,
    ContactPerson NVARCHAR(100),
    Phone NVARCHAR(15),
    Email NVARCHAR(100),
    Address NVARCHAR(255)
);

-- Create Products Table
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    Category NVARCHAR(50),
    Brand NVARCHAR(50),
    UnitPrice DECIMAL(10, 2) NOT NULL,
    QuantityInStock INT NOT NULL DEFAULT 0,
    ReorderLevel INT DEFAULT 10,
    SupplierID INT NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(15),
    Email NVARCHAR(100),
    Address NVARCHAR(255)
);

-- Create Employees Table (Optional)
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeName NVARCHAR(100) NOT NULL,
    Role NVARCHAR(50),
    Phone NVARCHAR(15),
    Email NVARCHAR(100)
);

-- Create Sales Table
CREATE TABLE Sales (
    SaleID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    SaleDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create SalesDetails Table
CREATE TABLE SalesDetails (
    SaleDetailID INT IDENTITY(1,1) PRIMARY KEY,
    SaleID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL DEFAULT 1,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    Subtotal AS (Quantity * UnitPrice) PERSISTED,
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
