CREATE OR ALTER PROC dbo.MakeFamilyPurchase
(@FamilySurName AS VARCHAR(255))
AS
DECLARE @price numeric;
DECLARE @id int;
SELECT @id = ID FROM dbo.Family
WHERE SurName = @FamilySurName;
SELECT @price = Value 
FROM dbo.Basket
WHERE ID_Family = @id;
BEGIN TRY
UPDATE dbo.Family
SET BudgetValue = BudgetValue - SUM(@price)
WHERE SurName = @FamilySurName;
END TRY
BEGIN CATCH
PRINT 'Фамилия не найдена';
END CATCH
GO