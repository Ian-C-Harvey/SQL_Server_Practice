-- Pricing
SELECT
  SUM(UnitPrice * Quantity) AS TotalPrice, SUM((UnitPrice * Quantity) - ((UnitPrice * Quantity) * Discount)) AS TotalPriceAfterDiscount
FROM Orders O
JOIN OrderItems OI 
  ON O.OrderID = OI.OrderID
WHERE O.OrderID = 10250;
