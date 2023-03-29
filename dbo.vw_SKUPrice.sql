CREATE OR ALTER VIEW dbo.SKUPrice
AS
SELECT *, dbo.getSKUPrice(ID) AS Price
FROM dbo.SKU
GO