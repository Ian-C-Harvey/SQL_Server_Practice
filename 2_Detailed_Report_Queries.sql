-- Pricing
SELECT
  SUM(UnitPrice * Quantity) AS TotalPrice, 
  SUM((UnitPrice * Quantity) - ((UnitPrice * Quantity) * Discount)) AS TotalPriceAfterDiscount
FROM Orders O
  Inner Join OrderItems OI ON O.OrderID = OI.OrderID
WHERE O.OrderID = 10250;

Select 
  C.companyName, 
  SUM((OI.UnitPrice * OI.Quantity) - ((OI.UnitPrice * OI.Quantity) * OI.Discount)) As TotalPaid
From Customers C
  Inner Join Orders O on C.CustomerID = O.CustomerID
  Inner Join OrderItems OI on O.OrderID = OI.OrderID 
WHERE O.OrderDate Between '2016-06-01' AND '2016-07-31'
Group By C.CustomerID, C.CompanyName
Order By totalPaid DESC;
