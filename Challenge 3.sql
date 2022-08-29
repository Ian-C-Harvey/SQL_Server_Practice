-- Decided to skip challenge 2, it only involved UNION.
-- Summarized Instructions:

/* 
SELECT  
[Person].[BusinessEntityID],  
[Person].[PersonType], 
Person.Person.  
  -- A derived column, aliased as “FullName”, that combines the first, last, and middle names from Person.Person
  -- One space between each of the names. 
  -- Middle name maybe null 
  -- ISNULL() will result in an unwanted space 
  -- Need to account for the middle name being NULL in a CASE statement (try using two separate columns) 
[Address].[AddressLine1] [Address], 
[Address].[City], 
[Address].[PostalCode], 
[StateProvince].[Name] [State], 
[CountryRegion].[Name] [Country] 

-- Filter requirements: 
  -- Person Type = "SP" or postal code begins with 9 and is exactly 5 characters and country is "United states" 
  -- LEFT() and LEN() should be used for the postal code. 
  -- Join Person.BusinessEntityAddress to Person.Person 
  -- Join Person.Address to Person.BusinessEntityAddress. 
  -- Join "State" to "Address" 
  -- Join Person.CountryRegion to Person.StateProvince. 
*\ 
