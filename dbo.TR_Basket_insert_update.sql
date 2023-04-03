CREATE OR ALTER TRIGGER TR_Basket_insert_update
ON dbo.Basket
AFTER INSERT AS 
BEGIN
	IF EXISTS (SELECT ID_SKU FROM dbo.Basket GROUP BY ID_SKU HAVING COUNT(*) >= 2)
	BEGIN 
		UPDATE b
		SET DiscountValue = Value * 0.05
		FROM dbo.Basket AS b
		INNER JOIN dbo.SKU AS s ON b.ID_SKU = s.ID
	END
	ELSE
	BEGIN
		UPDATE b
		SET DiscountValue = 0
		FROM dbo.Basket AS b
		INNER JOIN dbo.SKU AS s ON b.ID_SKU = s.ID
	END
END