SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vw_CD_CleanDataFileInput_Custom] AS 

WITH Patrons AS (
SELECT a.[Patron] FROM dbo.[Account] a
INNER JOIN [dbo].[Patron__c] b ON [b].[Patron] = [a].[Patron]
WHERE [a].[FirstName] <> [b].[CD_FirstName]
OR a.[LastName] <> b.[CD_LastName]
OR [a].[PersonalEmail] <> [b].[CD_PersonalEmail]
OR a.[HomePhone] <> b.[CD_HomePhone]
)

SELECT 
patron SourceContactId, CAST(NULL AS VARCHAR(1)) Prefix, CAST(NULL AS VARCHAR(1)) FirstName, CAST(NULL AS VARCHAR(1)) MiddleName, NULL LastName, CAST(NULL AS VARCHAR(1)) Suffix, FullName
, CAST('Primary' AS VARCHAR(25)) AddressType, CAST(PrimaryAddressStreet AS VARCHAR(500)) Address, CAST(NULL AS VARCHAR(1)) Address2, CAST(PrimaryAddressCity AS VARCHAR(200)) City, CAST(PrimaryAddressState AS VARCHAR(200)) State, CAST(PrimaryAddressZipCode AS VARCHAR(25)) ZipCode, CAST(NULL AS VARCHAR(1)) AddressCounty, CAST(PrimaryAddressCountry AS VARCHAR(200)) AddressCountry
, CAST(NULL AS VARCHAR(25)) PhoneType, CAST(NULL AS VARCHAR(25)) Phone, CAST(NULL AS VARCHAR(25)) EmailType, CAST(NULL AS VARCHAR(256)) Email
, 1 SourcePriorityRank, ISNULL(CONVERT(VARCHAR(25), PacCreateDate, 101), '01/01/1900') SourceCreateDate
, CAST('TI' AS VARCHAR(200)) Custom1, CAST('Match' AS VARCHAR(200)) Custom2, CAST('PrimaryAddress' AS VARCHAR(200)) Custom3, CAST(NULL AS VARCHAR(1)) Custom4, CAST(NULL AS VARCHAR(1)) Custom5
, CAST('True' AS VARCHAR(5)) RunContactMatch
FROM dbo.patron__c p
LEFT OUTER JOIN dbo.CD_ProcessQueue cdq ON p.Patron = cdq.SourceContactId
WHERE 1=1
AND p.[Patron] IN (SELECT Patron FROM [Patrons])
AND (cdq.ContactField = 'PrimaryAddress')-- or p.dbLastUpdated > DATEADD(hour, -12, getdate()))
AND ISNULL(primaryAddressType, '') <> '' AND ISNULL(PrimaryAddressStreet,'') <> ''

	UNION ALL

SELECT 
patron SourceContactId, CAST(NULL AS VARCHAR(1)) Prefix, CAST(NULL AS VARCHAR(1)) FirstName, CAST(NULL AS VARCHAR(1)) MiddleName, NULL LastName, CAST(NULL AS VARCHAR(1)) Suffix, FullName
, CAST('Address2' AS VARCHAR(25)) AddressType, CAST(Address2Street AS VARCHAR(500)) Address, CAST(NULL AS VARCHAR(1)) Address2, CAST(Address2City AS VARCHAR(200)) City, CAST(Address2State AS VARCHAR(200)) State, CAST(Address2ZipCode AS VARCHAR(25)) ZipCode, CAST(NULL AS VARCHAR(1)) AddressCounty, CAST(Address2Country AS VARCHAR(200)) AddressCountry
, CAST(NULL AS VARCHAR(25)) PhoneType, CAST(NULL AS VARCHAR(25)) Phone, CAST(NULL AS VARCHAR(25)) EmailType, CAST(NULL AS VARCHAR(256)) Email
, 1 SourcePriorityRank, ISNULL(CONVERT(VARCHAR(25), PacCreateDate, 101), '01/01/1900') SourceCreateDate
, CAST('TI' AS VARCHAR(200)) Custom1, CAST('Clean' AS VARCHAR(200)) Custom2, CAST('Address2' AS VARCHAR(200)) Custom3, CAST(NULL AS VARCHAR(1)) Custom4, CAST(NULL AS VARCHAR(1)) Custom5
, CAST('False' AS VARCHAR(5)) RunContactMatch
FROM dbo.patron__c p
INNER JOIN dbo.CD_ProcessQueue cdq ON p.Patron = cdq.SourceContactId
WHERE 1=1
AND p.[Patron] IN (SELECT Patron FROM [Patrons])
AND  cdq.ContactField = 'Address2'
AND ISNULL(Address2Type, '') <> '' AND ISNULL(Address2Street,'') <> ''

	UNION ALL

SELECT 
patron SourceContactId, CAST(NULL AS VARCHAR(1)) Prefix, CAST(NULL AS VARCHAR(1)) FirstName, CAST(NULL AS VARCHAR(1)) MiddleName, NULL LastName, CAST(NULL AS VARCHAR(1)) Suffix, FullName
, CAST('Address3' AS VARCHAR(25)) AddressType, CAST(Address3Street AS VARCHAR(500)) Address, CAST(NULL AS VARCHAR(1)) Address3, CAST(Address3City AS VARCHAR(200)) City, CAST(Address3State AS VARCHAR(200)) State, CAST(Address3ZipCode AS VARCHAR(25)) ZipCode, CAST(NULL AS VARCHAR(1)) AddressCounty, CAST(Address3Country AS VARCHAR(200)) AddressCountry
, CAST(NULL AS VARCHAR(25)) PhoneType, CAST(NULL AS VARCHAR(25)) Phone, CAST(NULL AS VARCHAR(25)) EmailType, CAST(NULL AS VARCHAR(256)) Email
, 1 SourcePriorityRank, ISNULL(CONVERT(VARCHAR(25), PacCreateDate, 101), '01/01/1900') SourceCreateDate
, CAST('TI' AS VARCHAR(200)) Custom1, CAST('Clean' AS VARCHAR(200)) Custom2, CAST('Address3' AS VARCHAR(200)) Custom3, CAST(NULL AS VARCHAR(1)) Custom4, CAST(NULL AS VARCHAR(1)) Custom5
, CAST('False' AS VARCHAR(5)) RunContactMatch
FROM dbo.patron__c p
INNER JOIN dbo.CD_ProcessQueue cdq ON p.Patron = cdq.SourceContactId
WHERE 1=1
AND p.[Patron] IN (SELECT Patron FROM [Patrons])
AND cdq.ContactField = 'Address3'
AND ISNULL(Address3Type, '') <> '' AND ISNULL(Address3Street,'') <> ''

	UNION ALL

SELECT 
patron SourceContactId, CAST(NULL AS VARCHAR(1)) Prefix, CAST(NULL AS VARCHAR(1)) FirstName, CAST(NULL AS VARCHAR(1)) MiddleName, NULL LastName, CAST(NULL AS VARCHAR(1)) Suffix, FullName
, CAST(NULL AS VARCHAR(1)) AddressType, CAST(NULL AS VARCHAR(1)) Address, CAST(NULL AS VARCHAR(1)) Address2, CAST(NULL AS VARCHAR(1)) City, CAST(NULL AS VARCHAR(1)) State, CAST(NULL AS VARCHAR(1)) ZipCode, CAST(NULL AS VARCHAR(1)) AddressCounty, CAST(NULL AS VARCHAR(1)) AddressCountry
, 'HomePhone' PhoneType, CAST(HomePhone AS VARCHAR(25)) Phone
, CAST(NULL AS VARCHAR(25)) EmailType, CAST(NULL AS VARCHAR(256)) Email
, 1 SourcePriorityRank, ISNULL(CONVERT(VARCHAR(25), PacCreateDate, 101), '01/01/1900') SourceCreateDate
, CAST('TI' AS VARCHAR(200)) Custom1, CAST('Clean' AS VARCHAR(200)) Custom2, CAST('HomePhone' AS VARCHAR(200)) Custom3, CAST(NULL AS VARCHAR(1)) Custom4, CAST(NULL AS VARCHAR(1)) Custom5
, CAST('False' AS VARCHAR(5)) RunContactMatch
FROM dbo.patron__c p
INNER JOIN dbo.CD_ProcessQueue cdq ON p.Patron = cdq.SourceContactId
WHERE 1=1
AND p.[Patron] IN (SELECT Patron FROM [Patrons])
AND cdq.ContactField = 'HomePhone'
AND ISNULL(HomePhone, '') <> '' AND ISNULL(HomePhone,'') <> ''

	UNION ALL

SELECT 
patron SourceContactId, CAST(NULL AS VARCHAR(1)) Prefix, CAST(NULL AS VARCHAR(1)) FirstName, CAST(NULL AS VARCHAR(1)) MiddleName, NULL LastName, CAST(NULL AS VARCHAR(1)) Suffix, FullName
, CAST(NULL AS VARCHAR(1)) AddressType, CAST(NULL AS VARCHAR(1)) Address, CAST(NULL AS VARCHAR(1)) Address2, CAST(NULL AS VARCHAR(1)) City, CAST(NULL AS VARCHAR(1)) State, CAST(NULL AS VARCHAR(1)) ZipCode, CAST(NULL AS VARCHAR(1)) AddressCounty, CAST(NULL AS VARCHAR(1)) AddressCountry
, 'CellPhone' PhoneType, CAST(CellPhone AS VARCHAR(25)) Phone
, CAST(NULL AS VARCHAR(25)) EmailType, CAST(NULL AS VARCHAR(256)) Email
, 1 SourcePriorityRank, ISNULL(CONVERT(VARCHAR(25), PacCreateDate, 101), '01/01/1900') SourceCreateDate
, CAST('TI' AS VARCHAR(200)) Custom1, CAST('Clean' AS VARCHAR(200)) Custom2, CAST('CellPhone' AS VARCHAR(200)) Custom3, CAST(NULL AS VARCHAR(1)) Custom4, CAST(NULL AS VARCHAR(1)) Custom5
, CAST('False' AS VARCHAR(5)) RunContactMatch
FROM dbo.patron__c p
INNER JOIN dbo.CD_ProcessQueue cdq ON p.Patron = cdq.SourceContactId
WHERE 1=1
AND p.[Patron] IN (SELECT Patron FROM [Patrons])
AND cdq.ContactField = 'CellPhone'
AND ISNULL(CellPhone, '') <> '' AND ISNULL(CellPhone,'') <> ''

	UNION ALL

SELECT 
patron SourceContactId, CAST(NULL AS VARCHAR(1)) Prefix, CAST(NULL AS VARCHAR(1)) FirstName, CAST(NULL AS VARCHAR(1)) MiddleName, NULL LastName, CAST(NULL AS VARCHAR(1)) Suffix, FullName
, CAST(NULL AS VARCHAR(1)) AddressType, CAST(NULL AS VARCHAR(1)) Address, CAST(NULL AS VARCHAR(1)) Address2, CAST(NULL AS VARCHAR(1)) City, CAST(NULL AS VARCHAR(1)) State, CAST(NULL AS VARCHAR(1)) ZipCode, CAST(NULL AS VARCHAR(1)) AddressCounty, CAST(NULL AS VARCHAR(1)) AddressCountry
, 'BusinessPhone' PhoneType, CAST(BusinessPhone AS VARCHAR(25)) Phone
, CAST(NULL AS VARCHAR(25)) EmailType, CAST(NULL AS VARCHAR(256)) Email
, 1 SourcePriorityRank, ISNULL(CONVERT(VARCHAR(25), PacCreateDate, 101), '01/01/1900') SourceCreateDate
, CAST('TI' AS VARCHAR(200)) Custom1, CAST('Clean' AS VARCHAR(200)) Custom2, CAST('BusinessPhone' AS VARCHAR(200)) Custom3, CAST(NULL AS VARCHAR(1)) Custom4, CAST(NULL AS VARCHAR(1)) Custom5
, CAST('False' AS VARCHAR(5)) RunContactMatch
FROM dbo.patron__c p
INNER JOIN dbo.CD_ProcessQueue cdq ON p.Patron = cdq.SourceContactId
WHERE 1=1
AND p.[Patron] IN (SELECT Patron FROM [Patrons])
AND cdq.ContactField = 'BusinessPhone'
AND ISNULL(BusinessPhone, '') <> '' AND ISNULL(BusinessPhone,'') <> ''

	UNION ALL

SELECT 
patron SourceContactId, CAST(NULL AS VARCHAR(1)) Prefix, CAST(NULL AS VARCHAR(1)) FirstName, CAST(NULL AS VARCHAR(1)) MiddleName, NULL LastName, CAST(NULL AS VARCHAR(1)) Suffix, FullName
, CAST(NULL AS VARCHAR(1)) AddressType, CAST(NULL AS VARCHAR(1)) Address, CAST(NULL AS VARCHAR(1)) Address2, CAST(NULL AS VARCHAR(1)) City, CAST(NULL AS VARCHAR(1)) State, CAST(NULL AS VARCHAR(1)) ZipCode, CAST(NULL AS VARCHAR(1)) AddressCounty, CAST(NULL AS VARCHAR(1)) AddressCountry
, 'Fax' PhoneType, CAST(Fax AS VARCHAR(25)) Phone
, CAST(NULL AS VARCHAR(25)) EmailType, CAST(NULL AS VARCHAR(256)) Email
, 1 SourcePriorityRank, ISNULL(CONVERT(VARCHAR(25), PacCreateDate, 101), '01/01/1900') SourceCreateDate
, CAST('TI' AS VARCHAR(200)) Custom1, CAST('Clean' AS VARCHAR(200)) Custom2, CAST('Fax' AS VARCHAR(200)) Custom3, CAST(NULL AS VARCHAR(1)) Custom4, CAST(NULL AS VARCHAR(1)) Custom5
, CAST('False' AS VARCHAR(5)) RunContactMatch
FROM dbo.patron__c p
INNER JOIN dbo.CD_ProcessQueue cdq ON p.Patron = cdq.SourceContactId
WHERE 1=1
AND p.[Patron] IN (SELECT Patron FROM [Patrons])
AND cdq.ContactField = 'Fax'
AND ISNULL(Fax, '') <> '' AND ISNULL(Fax,'') <> ''

	UNION ALL

SELECT 
patron SourceContactId, CAST(NULL AS VARCHAR(1)) Prefix, CAST(NULL AS VARCHAR(1)) FirstName, CAST(NULL AS VARCHAR(1)) MiddleName, NULL LastName, CAST(NULL AS VARCHAR(1)) Suffix, FullName
, CAST(NULL AS VARCHAR(1)) AddressType, CAST(NULL AS VARCHAR(1)) Address, CAST(NULL AS VARCHAR(1)) Address2, CAST(NULL AS VARCHAR(1)) City, CAST(NULL AS VARCHAR(1)) State, CAST(NULL AS VARCHAR(1)) ZipCode, CAST(NULL AS VARCHAR(1)) AddressCounty, CAST(NULL AS VARCHAR(1)) AddressCountry
, 'OtherPhone' PhoneType, CAST(OtherPhone AS VARCHAR(25)) Phone
, CAST(NULL AS VARCHAR(25)) EmailType, CAST(NULL AS VARCHAR(256)) Email
, 1 SourcePriorityRank, ISNULL(CONVERT(VARCHAR(25), PacCreateDate, 101), '01/01/1900') SourceCreateDate
, CAST('TI' AS VARCHAR(200)) Custom1, CAST('Clean' AS VARCHAR(200)) Custom2, CAST('OtherPhone' AS VARCHAR(200)) Custom3, CAST(NULL AS VARCHAR(1)) Custom4, CAST(NULL AS VARCHAR(1)) Custom5
, CAST('False' AS VARCHAR(5)) RunContactMatch
FROM dbo.patron__c p
INNER JOIN dbo.CD_ProcessQueue cdq ON p.Patron = cdq.SourceContactId
WHERE 1=1
AND p.[Patron] IN (SELECT Patron FROM [Patrons])
AND cdq.ContactField = 'OtherPhone'
AND ISNULL(OtherPhone, '') <> '' AND ISNULL(OtherPhone,'') <> ''

	UNION ALL

SELECT 
patron SourceContactId, CAST(NULL AS VARCHAR(1)) Prefix, CAST(NULL AS VARCHAR(1)) FirstName, CAST(NULL AS VARCHAR(1)) MiddleName, NULL LastName, CAST(NULL AS VARCHAR(1)) Suffix, FullName
, CAST(NULL AS VARCHAR(1)) AddressType, CAST(NULL AS VARCHAR(1)) Address, CAST(NULL AS VARCHAR(1)) Address2, CAST(NULL AS VARCHAR(1)) City, CAST(NULL AS VARCHAR(1)) State, CAST(NULL AS VARCHAR(1)) ZipCode, CAST(NULL AS VARCHAR(1)) AddressCounty, CAST(NULL AS VARCHAR(1)) AddressCountry
, CAST(NULL AS VARCHAR(1)) PhoneType, CAST(NULL AS VARCHAR(25)) Phone
, CAST('EvEmail' AS VARCHAR(25)) EmailType, CAST(EvEmail AS VARCHAR(256)) Email
, 1 SourcePriorityRank, ISNULL(CONVERT(VARCHAR(25), PacCreateDate, 101), '01/01/1900') SourceCreateDate
, CAST('TI' AS VARCHAR(200)) Custom1, CAST('Clean' AS VARCHAR(200)) Custom2, CAST('EvEmail' AS VARCHAR(200)) Custom3, CAST(NULL AS VARCHAR(1)) Custom4, CAST(NULL AS VARCHAR(1)) Custom5
, CAST('False' AS VARCHAR(5)) RunContactMatch
FROM dbo.patron__c p
INNER JOIN dbo.CD_ProcessQueue cdq ON p.Patron = cdq.SourceContactId
WHERE 1=1
AND p.[Patron] IN (SELECT Patron FROM [Patrons])
AND cdq.ContactField = 'EvEmail'
AND ISNULL(EvEmail, '') <> '' AND ISNULL(EvEmail,'') <> ''

	UNION ALL

SELECT 
patron SourceContactId, CAST(NULL AS VARCHAR(1)) Prefix, CAST(NULL AS VARCHAR(1)) FirstName, CAST(NULL AS VARCHAR(1)) MiddleName, NULL LastName, CAST(NULL AS VARCHAR(1)) Suffix, FullName
, CAST(NULL AS VARCHAR(1)) AddressType, CAST(NULL AS VARCHAR(1)) Address, CAST(NULL AS VARCHAR(1)) Address2, CAST(NULL AS VARCHAR(1)) City, CAST(NULL AS VARCHAR(1)) State, CAST(NULL AS VARCHAR(1)) ZipCode, CAST(NULL AS VARCHAR(1)) AddressCounty, CAST(NULL AS VARCHAR(1)) AddressCountry
, CAST(NULL AS VARCHAR(1)) PhoneType, CAST(NULL AS VARCHAR(25)) Phone
, CAST('PersonalEmail' AS VARCHAR(25)) EmailType, CAST(PersonalEmail AS VARCHAR(256)) Email
, 1 SourcePriorityRank, ISNULL(CONVERT(VARCHAR(25), PacCreateDate, 101), '01/01/1900') SourceCreateDate
, CAST('TI' AS VARCHAR(200)) Custom1, CAST('Clean' AS VARCHAR(200)) Custom2, CAST('PersonalEmail' AS VARCHAR(200)) Custom3, CAST(NULL AS VARCHAR(1)) Custom4, CAST(NULL AS VARCHAR(1)) Custom5
, CAST('False' AS VARCHAR(5)) RunContactMatch
FROM dbo.patron__c p
INNER JOIN dbo.CD_ProcessQueue cdq ON p.Patron = cdq.SourceContactId
WHERE 1=1
AND p.[Patron] IN (SELECT Patron FROM [Patrons])
AND cdq.ContactField = 'PersonalEmail'
AND ISNULL(PersonalEmail, '') <> '' AND ISNULL(PersonalEmail,'') <> ''

	UNION ALL

SELECT 
patron SourceContactId, CAST(NULL AS VARCHAR(1)) Prefix, CAST(NULL AS VARCHAR(1)) FirstName, CAST(NULL AS VARCHAR(1)) MiddleName, NULL LastName, CAST(NULL AS VARCHAR(1)) Suffix, FullName
, CAST(NULL AS VARCHAR(1)) AddressType, CAST(NULL AS VARCHAR(1)) Address, CAST(NULL AS VARCHAR(1)) Address2, CAST(NULL AS VARCHAR(1)) City, CAST(NULL AS VARCHAR(1)) State, CAST(NULL AS VARCHAR(1)) ZipCode, CAST(NULL AS VARCHAR(1)) AddressCounty, CAST(NULL AS VARCHAR(1)) AddressCountry
, CAST(NULL AS VARCHAR(1)) PhoneType, CAST(NULL AS VARCHAR(25)) Phone
, CAST('BusinessEmail' AS VARCHAR(25)) EmailType, CAST(BusinessEmail AS VARCHAR(256)) Email
, 1 SourcePriorityRank, ISNULL(CONVERT(VARCHAR(25), PacCreateDate, 101), '01/01/1900') SourceCreateDate
, CAST('TI' AS VARCHAR(200)) Custom1, CAST('Clean' AS VARCHAR(200)) Custom2, CAST('BusinessEmail' AS VARCHAR(200)) Custom3, CAST(NULL AS VARCHAR(1)) Custom4, CAST(NULL AS VARCHAR(1)) Custom5
, CAST('False' AS VARCHAR(5)) RunContactMatch
FROM dbo.patron__c p
INNER JOIN dbo.CD_ProcessQueue cdq ON p.Patron = cdq.SourceContactId
WHERE 1=1
AND p.[Patron] IN (SELECT Patron FROM [Patrons])
AND cdq.ContactField = 'BusinessEmail'
AND ISNULL(BusinessEmail, '') <> '' AND ISNULL(BusinessEmail,'') <> ''

	UNION ALL

SELECT 
patron SourceContactId, CAST(NULL AS VARCHAR(1)) Prefix, CAST(NULL AS VARCHAR(1)) FirstName, CAST(NULL AS VARCHAR(1)) MiddleName, NULL LastName, CAST(NULL AS VARCHAR(1)) Suffix, FullName
, CAST(NULL AS VARCHAR(1)) AddressType, CAST(NULL AS VARCHAR(1)) Address, CAST(NULL AS VARCHAR(1)) Address2, CAST(NULL AS VARCHAR(1)) City, CAST(NULL AS VARCHAR(1)) State, CAST(NULL AS VARCHAR(1)) ZipCode, CAST(NULL AS VARCHAR(1)) AddressCounty, CAST(NULL AS VARCHAR(1)) AddressCountry
, CAST(NULL AS VARCHAR(1)) PhoneType, CAST(NULL AS VARCHAR(25)) Phone
, CAST('OtherEmail' AS VARCHAR(25)) EmailType, CAST(OtherEmail AS VARCHAR(256)) Email
, 1 SourcePriorityRank, ISNULL(CONVERT(VARCHAR(25), PacCreateDate, 101), '01/01/1900') SourceCreateDate
, CAST('TI' AS VARCHAR(200)) Custom1, CAST('Clean' AS VARCHAR(200)) Custom2, CAST('OtherEmail' AS VARCHAR(200)) Custom3, CAST(NULL AS VARCHAR(1)) Custom4, CAST(NULL AS VARCHAR(1)) Custom5
, CAST('False' AS VARCHAR(5)) RunContactMatch
FROM dbo.patron__c p
INNER JOIN dbo.CD_ProcessQueue cdq ON p.Patron = cdq.SourceContactId
WHERE 1=1
AND p.[Patron] IN (SELECT Patron FROM [Patrons])
AND cdq.ContactField = 'OtherEmail'
AND ISNULL(OtherEmail, '') <> '' AND ISNULL(OtherEmail,'') <> ''

	UNION ALL

SELECT 
patron SourceContactId, CAST(NULL AS VARCHAR(1)) Prefix, CAST(NULL AS VARCHAR(1)) FirstName, CAST(NULL AS VARCHAR(1)) MiddleName, NULL LastName, CAST(NULL AS VARCHAR(1)) Suffix, FullName
, CAST(NULL AS VARCHAR(1)) AddressType, CAST(NULL AS VARCHAR(1)) Address, CAST(NULL AS VARCHAR(1)) Address2, CAST(NULL AS VARCHAR(1)) City, CAST(NULL AS VARCHAR(1)) State, CAST(NULL AS VARCHAR(1)) ZipCode, CAST(NULL AS VARCHAR(1)) AddressCounty, CAST(NULL AS VARCHAR(1)) AddressCountry
, CAST(NULL AS VARCHAR(25)) PhoneType, CAST(NULL AS VARCHAR(25)) Phone, CAST(NULL AS VARCHAR(25)) EmailType, CAST(NULL AS VARCHAR(256)) Email
, 1 SourcePriorityRank, ISNULL(CONVERT(VARCHAR(25), PacCreateDate, 101), '01/01/1900') SourceCreateDate
, CAST('TI' AS VARCHAR(200)) Custom1, CAST('Clean' AS VARCHAR(200)) Custom2, CAST('FullName' AS VARCHAR(200)) Custom3, CAST(NULL AS VARCHAR(1)) Custom4, CAST(NULL AS VARCHAR(1)) Custom5
, CAST('False' AS VARCHAR(5)) RunContactMatch
FROM dbo.patron__c p
INNER JOIN dbo.CD_ProcessQueue cdq ON p.Patron = cdq.SourceContactId
WHERE 1=1
AND p.[Patron] IN (SELECT Patron FROM [Patrons])
AND cdq.ContactField = 'FullName'
AND ISNULL(FullName, '') <> '' AND ISNULL(FullName,'') <> ''










GO
