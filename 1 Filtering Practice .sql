-- Summarized Instructions:
/*
	Column names for SELECT where given.
	Person Type = "SP" or postal code begins with 9 and is exactly 5 characters and country is "United states" 
	Join Person.BusinessEntityAddress to Person.Person 
	Join Person.Address to Person.BusinessEntityAddress. 
	Join "State" to "Address" 
	Join Person.CountryRegion to Person.StateProvince.
*\

-- Output
SELECT  
	[Bussiness Address] .[BusinessEntityID] AS [Business ID],  
	[Person].[Person].[PersonType], 
	CONCAT([Person].[FirstName], ' ', ISNULL([MiddleName],''), ' ', [Person].[Lastname]) AS "Full Name",
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

-- Criteria with Subquery
WHERE EXISTS
	(SELECT * 
	FROM [Person].[Person]
		INNER JOIN [Person].[BusinessEntityAddress] AS [Bussiness Address] 
			ON [Person].[Person].[BusinessEntityID] = [Bussiness Address].BusinessEntityID 
		INNER JOIN [Person].[Address] AS [Address] 
			ON [Bussiness Address].[AddressID] = [Address].[AddressID]
		INNER JOIN [Person].[StateProvince] AS [State]
			ON [Address].[StateProvinceID] = [State].[StateProvinceID]
		INNER JOIN [Person].[CountryRegion] [Country] 
			ON [State].[CountryRegionCode] = [Country].[CountryRegionCode]
	WHERE ([Person].[Person].[PersonType] = 'SP' OR [Address].[PostalCode] LIKE '9%') AND (LEN([Address].[PostalCode]) = 5 AND [Country].[Name] Like 'United%'));
	-- All of the joins had to be added so I could use Country in the criteria.
	-- Added subquery for practice.
