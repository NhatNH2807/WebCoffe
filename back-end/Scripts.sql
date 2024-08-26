CREATE
DATABASE WebCoffeeNhat
GO
USE WebCoffeeNhat
GO
CREATE TABLE Role
(
    RoleValue       VARCHAR(50) PRIMARY KEY,
    RoleDescription TEXT
);

CREATE TABLE Users
(
    Id        INT PRIMARY KEY IDENTITY(1,1),
    FullName  VARCHAR(255),
    Username  VARCHAR(100) UNIQUE,
    Password  VARCHAR(255),
    RoleValue VARCHAR(50),                              -- Thêm cột RoleValue để liên kết với bảng Role
    IsLocked  BIT,
    IsActive  BIT,
    CreateAt  DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (RoleValue) REFERENCES Role (RoleValue) -- Thiết lập khóa ngoại liên kết tới bảng Role
);

CREATE TABLE Token
(
    Id          INT PRIMARY KEY IDENTITY(1, 1),
    TokenValue  NVARCHAR(500),
    IsUsed      BIT,
    ExpiredTime DATETIME,
    Type        VARCHAR(50),
    CreatedAt   DATETIME,
    UserId      INT,
    FOREIGN KEY (UserId) REFERENCES Users (Id)
);

CREATE TABLE Cart
(
    Id       INT PRIMARY KEY IDENTITY(1,1),
    Status   VARCHAR(50),
    CreateAt DATETIME DEFAULT GETDATE(),
    UserId   INT,
    FOREIGN KEY (UserId) REFERENCES Users (Id)
);

CREATE TABLE Product
(
    Id                 INT PRIMARY KEY IDENTITY(1,1),
    ProductName        VARCHAR(255),
    ProductDescription TEXT,
    ProductPrice       DECIMAL(10, 2),
    Quantity           INT,
    Image              TEXT,
    IsDeleted          BIT      DEFAULT 0,
    CreateAt           DATETIME DEFAULT GETDATE()
);

CREATE TABLE Product_Cart
(
    Id              INT PRIMARY KEY IDENTITY(1,1),
    ProductId       INT,
    CartId          INT,
    ProductQuantity INT,
    FOREIGN KEY (ProductId) REFERENCES Product (Id),
    FOREIGN KEY (CartId) REFERENCES Cart (Id)
);

CREATE TABLE Orders
(
    Id     INT PRIMARY KEY IDENTITY(1,1),
    CartId INT,
    Status VARCHAR(50),
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CartId) REFERENCES Cart (Id)
);

CREATE TABLE Transactions
(
    Id       INT PRIMARY KEY IDENTITY(1,1),
    UserId   INT,
    Amount   DECIMAL(10, 2),
    PayType  VARCHAR(50),
    CreateAt DATETIME DEFAULT GETDATE(),
    Status   VARCHAR(50),
    FOREIGN KEY (UserId) REFERENCES Users (Id)
);

INSERT INTO Product (ProductName, ProductDescription, ProductPrice, Quantity, Image, IsDeleted, CreateAt)
VALUES ('Espresso', 'Strong and bold coffee shot', 2.50, 100,
        'https://tse1.mm.bing.net/th?id=OIP.-fN7-Y36OOQxV-zlueT-pgHaGQ&pid=Api&P=0&h=220', 0, GETDATE()),
       ('Cappuccino', 'Espresso with steamed milk and foam', 3.50, 80,
        'https://tse4.mm.bing.net/th?id=OIP.zBhnw1zH8lnSABXPCORfQgHaEK&pid=Api&P=0&h=220', 0, GETDATE()),
       ('Latte', 'Smooth coffee with steamed milk', 3.00, 90,
        'https://tse2.mm.bing.net/th?id=OIP.Mw6X_Bqpy7Lgh1FyS4-MJwHaE8&pid=Api&P=0&h=220', 0, GETDATE()),
       ('Americano', 'Espresso diluted with hot water', 2.75, 110,
        'https://tse4.mm.bing.net/th?id=OIP.8ecQTrsnkrbtmgEYOC38dwHaE6&pid=Api&P=0&h=220', 0, GETDATE()),
       ('Mocha', 'Chocolate-flavored coffee', 3.75, 70,
        'https://tse4.mm.bing.net/th?id=OIP.wDiiR4TFgU4BeUOPc-Qp2QHaLH&pid=Api&P=0&h=220', 0, GETDATE()),
       ('Macchiato', 'Espresso with a small amount of milk', 3.25, 60,
        'https://tse3.mm.bing.net/th?id=OIP.HMvjkaiZ_LIpb8rcAXHv2wHaHZ&pid=Api&P=0&h=220', 0, GETDATE()),
       ('Flat White', 'Richer than a latte, with less foam', 3.50, 85,
        'https://tse3.mm.bing.net/th?id=OIP.5srfApOdXgC2MedT1B3LfQHaFj&pid=Api&P=0&h=220', 0, GETDATE()),
       ('Iced Coffee', 'Chilled coffee served over ice', 2.95, 120,
        'https://tse1.mm.bing.net/th?id=OIP.VEBt4QuDdoosNgreLblL-QHaHa&pid=Api&P=0&h=220', 0, GETDATE()),
       ('Cold Brew', 'Smooth, cold brewed coffee', 3.20, 100,
        'https://tse1.mm.bing.net/th?id=OIP.sYiAg-6HlI2yJp7YVgq7zwAAAA&pid=Api&P=0&h=220', 0, GETDATE()),
       ('Affogato', 'Espresso poured over vanilla ice cream', 4.00, 50,
        'https://tse3.mm.bing.net/th?id=OIP.HvW7uw_BINbkmTdSGCQqDwHaE8&pid=Api&P=0&h=220', 0, GETDATE()),

       ('Caramel Macchiato', 'Espresso with caramel syrup and milk', 3.75, 75,
        'https://tse2.mm.bing.net/th?id=OIP.wn2kE9XxU_xtzz_X3mEHhQHaJQ&pid=Api&P=0&h=220', 0, GETDATE()),
       ('Mocha Latte', 'Latte with mocha syrup', 3.80, 85,
        'https://tse4.mm.bing.net/th?id=OIP.YYiUGKCssH6VMS5m5IDb0wHaLH&pid=Api&P=0&h=220', 0, GETDATE()),
       ('Chai Latte', 'Spiced tea with steamed milk', 3.25, 100,
        'https://tse2.mm.bing.net/th?id=OIP.Crxf6bmndK1x9_MZmAC4PgHaLG&pid=Api&P=0&h=220', 0, GETDATE()),
       ('Turmeric Latte', 'Creamy latte with turmeric spice', 3.50, 60,
        'https://tse4.mm.bing.net/th?id=OIP.YirHJ7ykBh8XL2VyPvlkoAHaHa&pid=Api&P=0&h=220', 0, GETDATE()),
       ('Irish Coffee', 'Coffee with Irish whiskey and cream', 4.25, 40,
        'https://tse2.mm.bing.net/th?id=OIP.a7hlOZtENSKZlX9dScXBMgHaE8&pid=Api&P=0&h=220', 0, GETDATE()),
       ('Affogato', 'Espresso poured over vanilla ice cream', 4.00, 50,
        'https://tse3.mm.bing.net/th?id=OIP.HvW7uw_BINbkmTdSGCQqDwHaE8&pid=Api&P=0&h=220', 0, GETDATE()),
       ('Nitro Coffee', 'Cold brew infused with nitrogen', 3.75, 70,
        'https://tse2.mm.bing.net/th?id=OIP.at3scmNbp4jh2hq5snCyfQHaE8&pid=Api&P=0&h=220', 0, GETDATE()),
       ('Macadamia Latte', 'Latte with macadamia nut syrup', 3.50, 90,
        'https://tse2.mm.bing.net/th?id=OIP.B0o2eWTGUqVv2gcnh6EyLgHaHa&pid=Api&P=0&h=220', 0, GETDATE()),
       ('Honey Almond Milk Latte', 'Latte with honey and almond milk', 3.65, 75,
        'https://tse3.mm.bing.net/th?id=OIP.W1dHIp-0e7hA-80Iw5birAHaLH&pid=Api&P=0&h=220', 0, GETDATE()),
       ('Matcha Latte', 'Green tea latte with creamy milk', 3.80, 85,
        'https://tse2.mm.bing.net/th?id=OIP.XXmmjBgzFWiB1YZDSbJu5AAAAA&pid=Api&P=0&h=220', 0, GETDATE());

INSERT INTO Role (RoleValue, RoleDescription)
VALUES ('USER', 'USER'),
       ('ADMIN', 'ADMIN'),
       ('STAFF', 'STAFF');