-- Decided to skip challenge 2, it only involved UNION.
-- Summarized Instructions:


-- Output
SELECT  
	[Bussiness Address] .[BusinessEntityID] AS [Business ID],  
	[Person].[Person].[PersonType], 
	CONCAT([Person].[FirstName], ' ', ISNULL([MiddleN],''), ' ', [Person].[Lastname]) AS "Full Name",
	[Address].[AddressLine1] AS [Address], 
	[Address].[City], 
	[Address].[PostalCode], 
	[State].[Name] AS [State], 
	[Country].[Name] AS [Country]

-- Joins
FROM [Person].[Person]
	INNER JOIN [Person].[BusinessEntityAddress] AS [Bussiness Address] 
		ON [Person].[Person].[BusinessEntityID] = [Bussiness Address].BusinessEntityID 
	INNER JOIN [Person].[Address] AS [Address] 
		ON [Bussiness Address].[AddressID] = [Address].[AddressID]
	INNER JOIN [Person].[StateProvince] AS [State]
		ON [Address].[StateProvinceID] = [State].[StateProvinceID]
	INNER JOIN [Person].[CountryRegion] [Country] 
		ON [State].[CountryRegionCode] = [Country].[CountryRegionCode]

-- Criteria With Subquery
WHERE [Bussiness Address] .[BusinessEntityID] IN 
	(SELECT [Person].[Person].[PersonType] AS [Person Type], [Address].[PostalCode] AS [Postal Code] FROM [Person].[Person]
	INNER JOIN [Person].[BusinessEntityAddress] AS [Bussiness Address] 
		ON [Person].[Person].[BusinessEntityID] = [Bussiness Address].BusinessEntityID 
	INNER JOIN [Person].[Address] AS [Address] 
		ON [Bussiness Address].[AddressID] = [Address].[AddressID]
	WHERE [Person Type] = "SP" OR [Postal Code]

/* 
-- Filter requirements: 
  -- Person Type = "SP" or postal code begins with 9 and is exactly 5 characters and country is "United states" 
  -- LEFT() and LEN() should be used for the postal code. 
  -- Join Person.BusinessEntityAddress to Person.Person 
  -- Join Person.Address to Person.BusinessEntityAddress. 
  -- Join "State" to "Address" 
  -- Join Person.CountryRegion to Person.StateProvince. 
*\
