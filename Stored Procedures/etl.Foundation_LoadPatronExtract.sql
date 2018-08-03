SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [etl].[Foundation_LoadPatronExtract]

AS
BEGIN


SELECT BatchId, ContactId, ContactStatusCode, ContactStatus, SourceContactId, Prefix, FirstName, MiddleName, LastName, Suffix
	, Gender, Salutation, Address, Address2, Suite, City, State, ZipCode, Plus4, AddressCounty, AddressCountry, AddressCountyFips, AddressType
	, AddressDeliveryPoint, ZipLatitude, ZipLongitude, Input_FullName
INTO #PatronAddress
FROM (
	select BatchId, ContactId, ContactStatusCode, ContactStatus, SourceContactId, Prefix, FirstName, MiddleName, LastName, Suffix
		, Gender, Salutation, Address, Address2, Suite, City, State, ZipCode, Plus4, AddressCounty, AddressCountry, AddressCountyFips, AddressType
		, AddressDeliveryPoint, ZipLatitude, ZipLongitude, Input_FullName
	, ROW_NUMBER() OVER(
					PARTITION BY SourceContactId 
					ORDER BY Input_Custom2 DESC
					, CASE WHEN Input_Custom3 = 'PrimaryAddress' THEN 1 WHEN Input_Custom3 = 'FullName' THEN 2 ELSE 3 end
	) AS RowNumber
	from [src].[CD_CleanDataResult]
) address
WHERE RowNumber = 1		


SELECT SourceContactId, AreaCode, Phone, PhoneExtension
INTO #PatronPhone
FROM (

	SELECT *
	, ROW_NUMBER() OVER(PARTITION BY SourceContactId ORDER BY TypeRank) PriorityRank
	FROM (

		SELECT SourceContactId, AreaCode, Phone, PhoneExtension, 1 TypeRank
		FROM [src].[CD_CleanDataResult]
		WHERE Input_Custom3 = 'HomePhone'
		AND ISNULL(Phone, '') <> ''
		AND Phone <> '(999) 999-9999'

		UNION ALL 

		SELECT SourceContactId, AreaCode, Phone, PhoneExtension, 2 TypeRank
		FROM [src].[CD_CleanDataResult]
		WHERE Input_Custom3 = 'CellPhone'
		AND ISNULL(Phone, '') <> ''
		AND Phone <> '(999) 999-9999'

		UNION ALL 

		SELECT SourceContactId, AreaCode, Phone, PhoneExtension, 3 TypeRank
		FROM [src].[CD_CleanDataResult]
		WHERE Input_Custom3 = 'BusinessPhone'
		AND ISNULL(Phone, '') <> ''
		AND Phone <> '(999) 999-9999'

		UNION ALL 

		SELECT SourceContactId, AreaCode, Phone, PhoneExtension, 4 TypeRank
		FROM [src].[CD_CleanDataResult]
		WHERE Input_Custom3 = 'OtherPhone'
		AND ISNULL(Phone, '') <> ''
		AND Phone <> '(999) 999-9999'

	) phone

) phone
WHERE phone.PriorityRank = 1


SELECT SourceContactId, EmailAddress
INTO #PatronEmail
FROM (

	SELECT *
	, ROW_NUMBER() OVER(PARTITION BY SourceContactId ORDER BY TypeRank) PriorityRank
	FROM (

		SELECT SourceContactId, EmailAddress, 1 TypeRank
		FROM [src].[CD_CleanDataResult]
		WHERE Input_Custom3 = 'PersonalEmail'
		AND ISNULL(EmailAddress, '') <> ''		

		UNION ALL 

		SELECT SourceContactId, EmailAddress, 2 TypeRank
		FROM [src].[CD_CleanDataResult]
		WHERE Input_Custom3 = 'EvEmail'
		AND ISNULL(EmailAddress, '') <> ''	

		UNION ALL 

		SELECT SourceContactId, EmailAddress, 3 TypeRank
		FROM [src].[CD_CleanDataResult]
		WHERE Input_Custom3 = 'BusinessEmail'
		AND ISNULL(EmailAddress, '') <> ''	

		UNION ALL 

		SELECT SourceContactId, EmailAddress, 4 TypeRank
		FROM [src].[CD_CleanDataResult]
		WHERE Input_Custom3 = 'OtherEmail'
		AND ISNULL(EmailAddress, '') <> ''	

	) email

) email
WHERE email.PriorityRank = 1


CREATE NONCLUSTERED INDEX [IDX_SourceContactId] ON #PatronAddress
(
	SourceContactId ASC
)

CREATE NONCLUSTERED INDEX [IDX_SourceContactId] ON #PatronPhone
(
	SourceContactId ASC
)

CREATE NONCLUSTERED INDEX [IDX_SourceContactId] ON #PatronEmail
(
	SourceContactId ASC
)



INSERT INTO etl.Foundation_PatronExtract (BatchId, ContactId, ContactStatusCode, ContactStatus, SourceContactId, Prefix, FirstName, MiddleName, LastName, Suffix, Gender, Salutation, Address, Address2, Suite, City, State, ZipCode, Plus4, AddressCounty, AddressCountry, AddressCountyFips, AddressType, AddressDeliveryPoint, ZipLatitude, ZipLongitude, AreaCode, Phone, PhoneExtension, EmailAddress, Input_FullName)
SELECT  a.BatchId ,
        a.ContactId ,
        a.ContactStatusCode ,
        a.ContactStatus ,
        a.SourceContactId ,
        a.Prefix ,
        a.FirstName ,
        a.MiddleName ,
        a.LastName ,
        a.Suffix ,
        a.Gender ,
        a.Salutation ,
        a.Address ,
        a.Address2 ,
        a.Suite ,
        a.City ,
        a.State ,
        a.ZipCode ,
        a.Plus4 ,
        a.AddressCounty ,
        a.AddressCountry ,
        a.AddressCountyFips ,
        a.AddressType ,
        a.AddressDeliveryPoint ,
        a.ZipLatitude ,
        a.ZipLongitude        
		, p.AreaCode
		, p.Phone
		, p.PhoneExtension
		, e.EmailAddress
		, a.Input_FullName
FROM #PatronAddress a
LEFT OUTER JOIN #PatronPhone p ON p.SourceContactId = a.SourceContactId
LEFT OUTER JOIN #PatronEmail e ON e.SourceContactId = a.SourceContactId


END













GO
