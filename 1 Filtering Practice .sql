-- Summarized Instructions:
/*
Column names for SELECT where given.
Person Type = "SP" or postal code begins with 9 and is exactly 5 characters and country is "United states" 
Join Person.BusinessEntityAddress to Person.Person 
Join Person.Address to Person.BusinessEntityAddress. 
Join "State" to "Address" 
Join Person.CountryRegion to Person.StateProvince.
*/

-- Output
SELECT  
[Bussiness Address].[BusinessEntityID] [Business ID],  
[Person].[PersonType], 
CONCAT([Person].[FirstName], ' ', ISNULL([MiddleName],''), ' ', [Person].[Lastname]) [Full Name],
[Address].[AddressLine1] [Address], 
[Address].[City], 
[Address].[PostalCode], 
[State].[Name] [State], 
[Country].[Name] [Country]

-- Joins
FROM [Person].[Person] AS [Person]
INNER JOIN [Person].[BusinessEntityAddress] AS [Bussiness Address] 
	ON [Person].[BusinessEntityID] = [Bussiness Address].[BusinessEntityID] 
INNER JOIN [Person].[Address] AS [Address] 
	ON [Bussiness Address].[AddressID] = [Address].[AddressID]
INNER JOIN [Person].[StateProvince] AS [State]
	ON [Address].[StateProvinceID] = [State].[StateProvinceID]
INNER JOIN [Person].[CountryRegion] AS [Country] 
	ON [State].[CountryRegionCode] = [Country].[CountryRegionCode]
-- Person is the name of a Schema and one of the tables in the database.

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
-- Added subquery for practice.
