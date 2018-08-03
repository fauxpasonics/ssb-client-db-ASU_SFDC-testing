SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [etl].[TI_Export_CD_PATRON_Foundation]

AS
BEGIN


SELECT 
	p.Patron
	, p.FullName PatronFullName
	, CAST(CASE WHEN ISNULL(p.CD_FirstName,'') = '' AND ISNULL(p.CD_LastName,'') = '' THEN dbo.TI_FirstName(p.FullName) ELSE p.CD_FirstName END AS VARCHAR(100)) FirstName
	, CASE WHEN ISNULL(p.CD_FirstName,'') = '' AND ISNULL(p.CD_LastName,'') = '' THEN '' ELSE p.CD_MiddleName END MiddleName
	, CAST(CASE WHEN ISNULL(p.CD_FirstName,'') = '' AND ISNULL(p.CD_LastName,'') = '' THEN master.dbo.TI_LastName(p.FullName) ELSE p.CD_LastName END AS VARCHAR(100)) LastName
	, CASE WHEN ISNULL(p.CD_FirstName,'') = '' AND ISNULL(p.CD_LastName,'') = '' THEN '' ELSE p.CD_Suffix END Suffix

	, case when isnull(p.PrimaryAddressType,'') in ('P', 'S', '') then 'H' else p.PrimaryAddressType end AddressType 
	
	, p.CD_PrimaryAddress Address
	, p.CD_PrimaryAddress2 Address2
	, p.CD_PrimaryAddressSuite Suite
	, p.CD_PrimaryAddressCity City
	, p.CD_PrimaryAddressState State
	, p.CD_PrimaryAddressZipCode ZipCode
	, p.CD_PrimaryAddressCountry AddressCountry

	
	--, CASE WHEN ISNULL(p.CD_PrimaryAddressCity, '') = '' AND p.PrimaryAddressStreet <> '** **' THEN p.PrimaryAddressStreet ELSE p.CD_PrimaryAddress END Address
	--, CASE WHEN ISNULL(p.CD_PrimaryAddressCity, '') = '' AND p.PrimaryAddressStreet <> '** **' THEN '' ELSE p.CD_PrimaryAddress2 END Address2
	--, CASE WHEN ISNULL(p.CD_PrimaryAddressCity, '') = '' AND p.PrimaryAddressStreet <> '** **' THEN '' ELSE p.CD_PrimaryAddressSuite END Suite
	--, CASE WHEN ISNULL(p.CD_PrimaryAddressCity, '') = '' AND p.PrimaryAddressStreet <> '** **' THEN p.PrimaryAddressCity ELSE p.CD_PrimaryAddress2 END City
	--, CASE WHEN ISNULL(p.CD_PrimaryAddressCity, '') = '' AND p.PrimaryAddressStreet <> '** **' THEN p.PrimaryAddressState ELSE p.CD_PrimaryAddressState END State
	--, CASE WHEN ISNULL(p.CD_PrimaryAddressCity, '') = '' AND p.PrimaryAddressStreet <> '** **' THEN p.PrimaryAddressZipCode ELSE p.CD_PrimaryAddressZipCode END ZipCode
	--, CASE WHEN ISNULL(p.CD_PrimaryAddressCity, '') = '' AND p.PrimaryAddressStreet <> '** **' THEN p.PrimaryAddressCountry ELSE p.CD_PrimaryAddressCountry END AddressCountry
	
	, CASE 
		WHEN ISNULL(p.CD_PersonalEmail,'') <> '' THEN p.CD_PersonalEmail
		--WHEN ISNULL(p.PersonalEmail,'') <> '' THEN p.PersonalEmail
		WHEN ISNULL(p.CD_BusinessEmail,'') <> '' THEN p.CD_BusinessEmail
		--WHEN ISNULL(p.BusinessEmail,'') <> '' THEN p.BusinessEmail
		WHEN ISNULL(p.CD_OtherEmail,'') <> '' THEN p.CD_OtherEmail
		--WHEN ISNULL(p.OtherEmail,'') <> '' THEN p.OtherEmail
		ELSE p.EvEmail 
	END EmailAddress
	
	, p.EvEmail
	
	, LEFT(CASE 
		WHEN ISNULL(p.CD_HomePhone,'') <> '' THEN p.CD_HomePhone
		--WHEN ISNULL(p.HomePhone,'') <> '' AND p.HomePhone <> '999-999-9999' AND LEN(p.HomePhone) >= 7 THEN p.HomePhone
		WHEN ISNULL(p.CD_BusinessPhone,'') <> '' THEN p.CD_BusinessPhone
		--WHEN ISNULL(p.BusinessPhone,'') <> '' AND p.BusinessPhone <> '999-999-9999' AND LEN(p.BusinessPhone) >= 7 THEN p.BusinessPhone
		WHEN ISNULL(p.CD_CellPhone,'') <> '' THEN p.CD_CellPhone
		--WHEN ISNULL(p.CellPhone,'') <> '' AND p.CellPhone <> '999-999-9999' AND LEN(p.CellPhone) >= 7 THEN p.CellPhone
		--WHEN ISNULL(p.CD_OtherPhone,'') <> '' THEN p.CD_OtherPhone
		ELSE p.CD_OtherPhone
	END, 25) PrimaryPhone
	
	, CAST(p.CD_HomePhone AS VARCHAR(25)) HomePhone
	, CAST(p.BusinessPhone AS VARCHAR(25)) BusinessPhone
	, CAST(p.CD_CellPhone AS VARCHAR(25)) CellPhone

	--, LEFT(CASE WHEN ISNULL(p.CD_HomePhone, '') = '' AND p.HomePhone <> '999-999-9999' AND LEN(p.HomePhone) >= 7 THEN p.HomePhone ELSE p.CD_HomePhone END, 25) HomePhone
	--, LEFT(CASE WHEN ISNULL(p.CD_BusinessPhone, '') = '' AND p.BusinessPhone <> '999-999-9999' AND LEN(p.BusinessPhone) >= 7 THEN p.BusinessPhone ELSE p.CD_BusinessPhone END, 25) BusinessPhone
	--, LEFT(CASE WHEN ISNULL(p.CD_CellPhone, '') = '' AND p.CellPhone <> '999-999-9999' AND LEN(p.CellPhone) >= 7 THEN p.CellPhone ELSE p.CD_CellPhone END, 25) CellPhone
	
	, cast(case when ISNULL(p.CD_FirstName,'') = '' AND ISNULL(p.CD_LastName,'') = '' then 0 else 1 end as bit) CleanDataStatus

FROM dbo.Patron__c p (nolock)


END

GO
