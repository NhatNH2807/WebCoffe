CREATE TABLE Role (
    RoleValue VARCHAR(50) PRIMARY KEY,
    RoleDescription TEXT
);

CREATE TABLE Users (
    Id INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(255),
    Username VARCHAR(100) UNIQUE,
    Password VARCHAR(255),
    RoleValue VARCHAR(50),  -- Thêm cột RoleValue để liên kết với bảng Role
    IsLocked BIT,
    CreateAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (RoleValue) REFERENCES Role(RoleValue)  -- Thiết lập khóa ngoại liên kết tới bảng Role
);

CREATE TABLE Cart (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Status VARCHAR(50),
    CreateAt DATETIME DEFAULT GETDATE(),
    UserId INT,
    FOREIGN KEY (UserId) REFERENCES Users(Id)
);

CREATE TABLE Product (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(255),
    ProductDescription TEXT,
    ProductPrice DECIMAL(10, 2),
    Quantity INT,
    Image TEXT,
    IsDeleted BIT DEFAULT 0,
    CreateAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Product_Cart (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ProductId INT,
    CartId INT,
    ProductQuantity INT,
    FOREIGN KEY (ProductId) REFERENCES Product(Id),
    FOREIGN KEY (CartId) REFERENCES Cart(Id)
);

CREATE TABLE Orders (
    Id INT PRIMARY KEY IDENTITY(1,1),
    CartId INT,
    Status VARCHAR(50),
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CartId) REFERENCES Cart(Id)
);

CREATE TABLE Transactions (
    Id INT PRIMARY KEY IDENTITY(1,1),
    UserId INT,
    Amount DECIMAL(10, 2),
    PayType VARCHAR(50),
    CreateAt DATETIME DEFAULT GETDATE(),
    Status VARCHAR(50),
    FOREIGN KEY (UserId) REFERENCES Users(Id)
);
