-- Summarized Instructions 
/* 
Names of Columns for SELECT are given in the instructions.
Requirement for the new “OrderSizeCategory” to be calculated: (CASE WHEN)
  OrderQty > 500, “Large”
  OrderQty > 50 but <= 500, “Medium”
  else "Small”
Shorten product name and subcategory and if they are null return "None". ISNULL()
Date criteria is the month of December. MONTH()
Purchasing.PurchaseOrderDetail & Purchasing.PurchaseOrderHeader should match when joining. (Inner Join)
Production.Product & Purchasing.PurchaseOrderDetail should match when joining. (Inner Join)
Production.ProductSubcategory & Production.Product should show nulls when joining. (Left Outer Join)
Production.ProductCategory & Production.ProductSubcategory should show nulls when joining. (Left Outer Join) 
*/

-- Layout
/*
Data dictonary for Adventure Works DB: 
https://docs.microsoft.com/en-us/previous-versions/sql/sql-server-2008/ms124438(v=sql.100)?redirectedfrom=MSDN
No entity relationship diagram provided.
SQL Order of Operations: 
FROM, JOIN, WHERE, GROUP BY, HAVING, SELECT, ORDER BY 
I assume all columns mentioned in the question need to be in the output.
*/

-- Ensuring the correct database
USE AdventureWorks2019;  
GO  

-- Creating the View
CREATE VIEW VPurchaseDetails AS
SELECT
[PurchaseOrderDetail].[PurchaseOrderID],
[PurchaseOrderDetail].[PurchaseOrderDetailID],
[PurchaseOrderDetail].[OrderQty],
[PurchaseOrderDetail].[UnitPrice],
[PurchaseOrderDetail].[LineTotal],
"orderhead".[OrderDate] [Date],
MONTH("orderhead".[OrderDate]) [Month Number],
ISNULL("Product".[Name], 'None') [Product Name],
ISNULL("Productsub".[Name], 'None') [Sub Category],
ISNULL("productcat".[Name], 'None') [Product Category],
CASE 
	WHEN [PurchaseOrderDetail].[OrderQty] > 500 THEN 'Large'
	WHEN [PurchaseOrderDetail].[OrderQty] > 500 THEN 'Medium'
	Else 'Small' END AS 'OrderSizeCategory'

-- Joins
FROM [AdventureWorks2019].[Purchasing].[PurchaseOrderDetail]
INNER JOIN [Purchasing].[PurchaseOrderHeader] AS "Orderhead" ON [PurchaseOrderDetail].[PurchaseOrderID] = "Orderhead".[PurchaseOrderID]
INNER JOIN [Production].[Product] AS "Product" ON [PurchaseOrderDetail].[ProductID] = "Product".[ProductID]
LEFT Outer Join [Production].[ProductSubcategory] AS "Productsub" ON "Productsub".ProductSubcategoryID = "Product".[ProductID]
RIGHT OUTER JOIN [Production].[ProductCategory] AS Productcat ON "Productsub".[ProductCategoryID] = "Productcat".[ProductCategoryID]
GO

-- Using the View
SELECT * FROM VPurchaseDetails
WHERE [Month Number] = 12;
