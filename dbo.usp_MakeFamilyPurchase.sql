CREATE OR ALTER PROCEDURE dbo.MakeFamilyPurchase
(@FamilySurName AS VARCHAR(255))
AS
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.Family
WHERE SurName = @FamilySurName)
BEGIN
RAISERROR('Фамилия не найдена', 16, 1)
RETURN
END
ELSE
BEGIN
UPDATE A
SET BudgetValue = BudgetValue - B.Budget
FROM dbo.Family A JOIN 
(SELECT D.ID_Family, SUM(D.Value) Budget
FROM dbo.Family C JOIN 
dbo.Basket D 
ON C.ID = D.ID_Family
GROUP BY D.ID_Family) B ON A.ID = B.ID_Family
WHERE A.SurName = @FamilySurName
END
END