CREATE OR ALTER FUNCTION dbo.getSKUPrice
(@ID_SKU AS INT)
RETURNS decimal(18, 2)
AS
	BEGIN
		DECLARE @val int;
		SELECT @val = p.Value
		FROM dbo.Basket AS p
		WHERE p.ID_SKU = @ID_SKU
		RETURN @val
	END;
GO