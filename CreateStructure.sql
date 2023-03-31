CREATE TABLE dbo.SKU
(
ID INT PRIMARY KEY IDENTITY,
Code AS CONCAT('s', CONVERT(VARCHAR, ID)) UNIQUE,
Name VARCHAR(255)
);
CREATE TABLE dbo.Family
(
ID INT PRIMARY KEY IDENTITY,
SurName VARCHAR(255),
BudgetValue INT
);
CREATE TABLE dbo.Basket
(
ID INT PRIMARY KEY IDENTITY,
ID_SKU INT,
ID_Family INT,
Quantity INT
CHECK(Quantity >= 0),
Value INT
CHECK(Value >= 0),
PurchaseDate DATE
DEFAULT getDate(),
DiscountValue NUMERIC,


FOREIGN KEY(ID_SKU)
REFERENCES dbo.SKU(ID),
FOREIGN KEY(ID_Family)
REFERENCES dbo.Family(ID)
);

INSERT INTO dbo.Family VALUES
('Иванов', '1000');
INSERT INTO dbo.Family VALUES
('Синичкин', '250');
INSERT INTO dbo.Family VALUES
('Стародубцев', '5000');
INSERT INTO dbo.SKU VALUES
('Молоко');
INSERT INTO dbo.SKU VALUES
('Колбаса');
INSERT INTO dbo.SKU VALUES
('Хлеб');
INSERT INTO dbo.Basket VALUES
('1', '1', '2', '60', '20230331', '0')
INSERT INTO dbo.Basket VALUES
('2', '2', '1', '130', '20230331', '0')
