/* Use Columns: PurchaseOrderID, PurchaseOrderDetailID, OrderQty, UnitPrice, LineTotal, OrderDate
Requirement for the new “OrderSizeCategory” to be calculated using case:
  OrderQty > 500, “Large”
  OrderQty > 50 but <= 500, “Medium”
  else "Small”
Shorten product name and subcategory and if they are null return "None".
Date criteria is the month of December.
Purchasing.PurchaseOrderDetail & Purchasing.PurchaseOrderHeader should match when joning. 
Production.Product & Purchasing.PurchaseOrderDetail should match when joning.
Production.ProductSubcategory & Production.Product should show nulls when joning.
Production.ProductCategory & Production.ProductSubcategory should show nulls when joning. *\

/*
Data dictonary for Adventure Works DB: 
https://docs.microsoft.com/en-us/previous-versions/sql/sql-server-2008/ms124438(v=sql.100)?redirectedfrom=MSDN
*\
