/* Use Columns: PurchaseOrderID, PurchaseOrderDetailID, OrderQty, UnitPrice, LineTotal, OrderDate
Requirement for the new “OrderSizeCategory” to be calculated:
  OrderQty > 500, “Large”
  OrderQty > 50 but <= 500, “Medium”
  else "Small”
Shorten product name and subcategory and if they are null return "None".
Date criteria is the month of December. MONTH()
Purchasing.PurchaseOrderDetail & Purchasing.PurchaseOrderHeader should match when joining. (Inner Join)
Production.Product & Purchasing.PurchaseOrderDetail should match when joining. (Inner Join)
Production.ProductSubcategory & Production.Product should show nulls when joining. (Left Outer Join)
Production.ProductCategory & Production.ProductSubcategory should show nulls when joining. (Left Outer Join) *\ 

/*
Data dictonary for Adventure Works DB: 
https://docs.microsoft.com/en-us/previous-versions/sql/sql-server-2008/ms124438(v=sql.100)?redirectedfrom=MSDN
*\
