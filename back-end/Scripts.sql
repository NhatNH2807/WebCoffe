Create database WebCoffee
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
INSERT INTO Role (RoleValue, RoleDescription)
VALUES 
('Admin', 'Administrator with full access'),
('User', 'Regular user with limited access'),
('Staff', 'Staff member with specific responsibilities');

INSERT INTO Users (FullName, Username, Password, RoleValue, IsLocked, CreateAt)
VALUES 
('John Doe', 'johndoe', 'password123', 'Admin', 0, GETDATE()),
('Jane Smith', 'janesmith', 'password123', 'User', 0, GETDATE()),
('Mark Brown', 'markbrown', 'password123', 'User', 0, GETDATE()),
('Alice Green', 'alicegreen', 'password123', 'Staff', 0, GETDATE()),
('Bob White', 'bobwhite', 'password123', 'Staff', 1, GETDATE()),
('Chris Blue', 'chrisblue', 'password123', 'User', 0, GETDATE()),
('Nancy Grey', 'nancygrey', 'password123', 'Admin', 0, GETDATE()),
('Tom Black', 'tomblack', 'password123', 'Staff', 0, GETDATE()),
('Sara Yellow', 'sarayellow', 'password123', 'User', 0, GETDATE()),
('Emma Brown', 'emmabrown', 'password123', 'Admin', 0, GETDATE()),
('Jake White', 'jakewhite', 'password123', 'User', 0, GETDATE()),
('Olivia Green', 'oliviagreen', 'password123', 'Staff', 0, GETDATE());


INSERT INTO Product (ProductName, ProductDescription, ProductPrice, Quantity, Image, IsDeleted, CreateAt)
VALUES 
('Espresso', 'Strong and bold coffee shot', 2.50, 100, 'https://tse1.mm.bing.net/th?id=OIP.-fN7-Y36OOQxV-zlueT-pgHaGQ&pid=Api&P=0&h=220', 0, GETDATE()),
('Cappuccino', 'Espresso with steamed milk and foam', 3.50, 80, 'https://tse4.mm.bing.net/th?id=OIP.zBhnw1zH8lnSABXPCORfQgHaEK&pid=Api&P=0&h=220', 0, GETDATE()),
('Latte', 'Smooth coffee with steamed milk', 3.00, 90, 'https://tse2.mm.bing.net/th?id=OIP.Mw6X_Bqpy7Lgh1FyS4-MJwHaE8&pid=Api&P=0&h=220', 0, GETDATE()),
('Americano', 'Espresso diluted with hot water', 2.75, 110, 'https://tse4.mm.bing.net/th?id=OIP.8ecQTrsnkrbtmgEYOC38dwHaE6&pid=Api&P=0&h=220', 0, GETDATE()),
('Mocha', 'Chocolate-flavored coffee', 3.75, 70, 'https://tse4.mm.bing.net/th?id=OIP.wDiiR4TFgU4BeUOPc-Qp2QHaLH&pid=Api&P=0&h=220', 0, GETDATE()),
('Macchiato', 'Espresso with a small amount of milk', 3.25, 60, 'https://tse3.mm.bing.net/th?id=OIP.HMvjkaiZ_LIpb8rcAXHv2wHaHZ&pid=Api&P=0&h=220', 0, GETDATE()),
('Flat White', 'Richer than a latte, with less foam', 3.50, 85, 'https://tse3.mm.bing.net/th?id=OIP.5srfApOdXgC2MedT1B3LfQHaFj&pid=Api&P=0&h=220', 0, GETDATE()),
('Iced Coffee', 'Chilled coffee served over ice', 2.95, 120, 'https://tse1.mm.bing.net/th?id=OIP.VEBt4QuDdoosNgreLblL-QHaHa&pid=Api&P=0&h=220', 0, GETDATE()),
('Cold Brew', 'Smooth, cold brewed coffee', 3.20, 100, 'https://tse1.mm.bing.net/th?id=OIP.sYiAg-6HlI2yJp7YVgq7zwAAAA&pid=Api&P=0&h=220', 0, GETDATE()),
('Affogato', 'Espresso poured over vanilla ice cream', 4.00, 50, 'https://tse3.mm.bing.net/th?id=OIP.HvW7uw_BINbkmTdSGCQqDwHaE8&pid=Api&P=0&h=220', 0, GETDATE()),

('Caramel Macchiato', 'Espresso with caramel syrup and milk', 3.75, 75, 'https://tse2.mm.bing.net/th?id=OIP.wn2kE9XxU_xtzz_X3mEHhQHaJQ&pid=Api&P=0&h=220', 0, GETDATE()),
('Mocha Latte', 'Latte with mocha syrup', 3.80, 85, 'https://tse4.mm.bing.net/th?id=OIP.YYiUGKCssH6VMS5m5IDb0wHaLH&pid=Api&P=0&h=220', 0, GETDATE()),
('Chai Latte', 'Spiced tea with steamed milk', 3.25, 100, 'https://tse2.mm.bing.net/th?id=OIP.Crxf6bmndK1x9_MZmAC4PgHaLG&pid=Api&P=0&h=220', 0, GETDATE()),
('Turmeric Latte', 'Creamy latte with turmeric spice', 3.50, 60, 'https://tse4.mm.bing.net/th?id=OIP.YirHJ7ykBh8XL2VyPvlkoAHaHa&pid=Api&P=0&h=220', 0, GETDATE()),
('Irish Coffee', 'Coffee with Irish whiskey and cream', 4.25, 40, 'https://tse2.mm.bing.net/th?id=OIP.a7hlOZtENSKZlX9dScXBMgHaE8&pid=Api&P=0&h=220', 0, GETDATE()),
('Affogato', 'Espresso poured over vanilla ice cream', 4.00, 50, 'https://tse3.mm.bing.net/th?id=OIP.HvW7uw_BINbkmTdSGCQqDwHaE8&pid=Api&P=0&h=220', 0, GETDATE()),
('Nitro Coffee', 'Cold brew infused with nitrogen', 3.75, 70, 'https://tse2.mm.bing.net/th?id=OIP.at3scmNbp4jh2hq5snCyfQHaE8&pid=Api&P=0&h=220', 0, GETDATE()),
('Macadamia Latte', 'Latte with macadamia nut syrup', 3.50, 90, 'https://tse2.mm.bing.net/th?id=OIP.B0o2eWTGUqVv2gcnh6EyLgHaHa&pid=Api&P=0&h=220', 0, GETDATE()),
('Honey Almond Milk Latte', 'Latte with honey and almond milk', 3.65, 75, 'https://tse3.mm.bing.net/th?id=OIP.W1dHIp-0e7hA-80Iw5birAHaLH&pid=Api&P=0&h=220', 0, GETDATE()),
('Matcha Latte', 'Green tea latte with creamy milk', 3.80, 85, 'https://tse2.mm.bing.net/th?id=OIP.XXmmjBgzFWiB1YZDSbJu5AAAAA&pid=Api&P=0&h=220', 0, GETDATE());
INSERT INTO Cart (Status, CreateAt, UserId)
VALUES 
('Active', GETDATE(), 2),
('Pending', GETDATE(), 3),
('Completed', GETDATE(), 2),
('Active', GETDATE(), 4),
('Pending', GETDATE(), 5),
('Completed', GETDATE(), 6),
('Active', GETDATE(), 7),
('Pending', GETDATE(), 8),
('Active', GETDATE(), 9),
('Completed', GETDATE(), 10),
('Active', GETDATE(), 11),
('Pending', GETDATE(), 12);

INSERT INTO Product_Cart (ProductId, CartId, ProductQuantity)
VALUES 
(1, 1, 1),  -- Laptop in Jane Smith's cart
(2, 1, 2),  -- 2 Smartphones in Jane Smith's cart
(3, 2, 1),  -- Headphones in Mark Brown's cart
(4, 3, 1),  -- Monitor in Jane Smith's completed cart
(5, 4, 2),  -- 2 Keyboards in Alice Green's cart
(6, 5, 1),  -- Wireless Mouse in Bob White's cart
(7, 6, 1),  -- Printer in Chris Blue's completed cart
(8, 7, 2),  -- 2 Tablets in Nancy Grey's cart
(9, 8, 1),  -- Webcam in Tom Black's cart
(10, 9, 3),  -- 3 Bluetooth Speakers in Sara Yellow's cart
(1, 10, 1),  -- Laptop in Emma Brown's completed cart
(2, 11, 2),  -- 2 Smartphones in Jake White's cart
(3, 12, 1);  -- Headphones in Olivia Green's cart
INSERT INTO Orders (CartId, Status, Amount)
VALUES 
(3, 'Shipped', 1500.00),  -- Jane Smith's completed cart
(5, 'Processing', 200.00), -- Bob White's cart
(6, 'Completed', 250.00),  -- Chris Blue's completed cart
(7, 'Processing', 800.00), -- Nancy Grey's cart
(9, 'Processing', 240.00), -- Sara Yellow's cart
(10, 'Shipped', 1200.00);  -- Emma Brown's completed cart
INSERT INTO Transactions (UserId, Amount, PayType, CreateAt, Status)
VALUES 
(2, 1500.00, 'Credit Card', GETDATE(), 'Completed'),  -- Jane Smith's payment
(4, 200.00, 'PayPal', GETDATE(), 'Pending'), -- Bob White's payment
(6, 250.00, 'Debit Card', GETDATE(), 'Completed'),  -- Chris Blue's payment
(7, 800.00, 'Bank Transfer', GETDATE(), 'Pending'), -- Nancy Grey's payment
(10, 1200.00, 'Credit Card', GETDATE(), 'Completed'), -- Emma Brown's payment
(12, 150.00, 'Cash', GETDATE(), 'Pending'); -- Olivia Green's payment







