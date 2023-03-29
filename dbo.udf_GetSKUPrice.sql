CREATE OR ALTER FUNCTION dbo.getSKUPrice
(@ID_SKU AS INT)
RETURNS decimal(18, 2)
AS
	BEGIN
		DECLARE @val int;
		DECLARE @qty int;
		DECLARE @res numeric;
		SELECT @val = SUM(p.Value)
		FROM dbo.Basket AS p
		WHERE p.ID_SKU = @ID_SKU;
		SELECT @qty = SUM(p.Quantity)
		FROM dbo.Basket AS p
		WHERE p.ID_SKU = @ID_SKU;
		SELECT @res = @val / @qty;
		RETURN @res
	END;
GO