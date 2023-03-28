CREATE TABLE dbo.SKU
(
ID INT PRIMARY KEY IDENTITY,
Code AS 's' + ID UNIQUE,
Name VARCHAR
);
CREATE TABLE dbo.Family
(
ID INT PRIMARY KEY IDENTITY,
SurName VARCHAR,
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
