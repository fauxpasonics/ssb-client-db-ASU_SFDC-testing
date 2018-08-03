SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO











CREATE VIEW [dbo].[vw_Account] AS 
(


SELECT 
r.id AS RecordtypeId
, CAST(a.ContactId AS NVARCHAR(50)) AS DW_ContactId__c
,a.contactid
, CASE WHEN a.FullName IS NULL THEN ' ' WHEN a.fullname = '' THEN ' ' ELSE a.FullName END AS FullName
, ISNULL(a.FirstName,'') AS FirstName
,CASE WHEN a.IsBusinessAccount = 1 THEN a.fullname ELSE a.LastName END AS LastName
, a.Patron AS Patron_ID__c
, a.PatronStatus AS Patron_Status__c
, a.CustomerType AS Customer_Type__c
, a.CustomerStatus AS Customer_Status__c
, a.PrimaryAddressStreet AS BillingStreet
, a.PrimaryAddressCity AS BillingCity
, a.PrimaryAddressState AS BillingState
, a.PrimaryAddressZipCode AS BillingPostalCode
, a.PrimaryAddressCountry AS BillingCountry
, NULL AS PersonMailingStreet --Address3Street
, NULL AS PersonMailingCity
, NULL AS PersonMailingState
, NULL AS PersonMailingPostalCode
, NULL AS PersonMailingCountry
, a.HomePhone AS PersonHomePhone
, a.CellPhone AS PersonMobilePhone
, a.BusinessPhone AS Biz_Other_Phone__c
, a.Fax AS Fax
, ISNULL(a.OtherEmail,'') AS PAH_Email__pc
, a.PersonalEmail AS PersonEmail
, a.VIP AS VIP_Code__c
, a.Internet_profile AS Internet_Profile__c
, SUBSTRING(a.Cust_comments,1,255) AS Customer_Comments__c
, SUBSTRING(a.cust_UD1,1,50) AS Donor_ID__c
,CONVERT(DATETIME, a.dblastupdated, 126) AS Export_Datetime__c
,a.dbLastUpdated
,a.IsBusinessAccount
 FROM dbo.Account a
 LEFT JOIN dbo.SFDC_Recordtype r
	ON CASE WHEN a.isBusinessAccount = 1 THEN 'Business Account' ELSE 'Person Account' END = r.name
-----	Remove after initial push to SF
LEFT JOIN dbo.Account_PatronsAlreadyExist_DoNotPush DNP
	ON a.ContactId = DNP.ContactId
WHERE DNP.ContactId IS NULL
-----	Remove after initial push to SF

 )










GO
