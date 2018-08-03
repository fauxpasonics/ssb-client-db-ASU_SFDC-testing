SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE PROCEDURE [dbo].[Merge_patron__c] 

AS
BEGIN 


truncate table [src].[TI_vwSFDC_PATRON_Delta]

insert into [src].[TI_vwSFDC_PATRON_Delta]
(
ActionType, deleted_Address2City, inserted_Address2City, deleted_Address2Country, inserted_Address2Country, deleted_Address2State, inserted_Address2State, deleted_Address2Street, inserted_Address2Street, deleted_Address2Type, inserted_Address2Type, deleted_Address2ZipCode, inserted_Address2ZipCode, deleted_Address3City, inserted_Address3City, deleted_Address3Country, inserted_Address3Country, deleted_Address3State, inserted_Address3State, deleted_Address3Street, inserted_Address3Street, deleted_Address3Type, inserted_Address3Type, deleted_Address3ZipCode, inserted_Address3ZipCode, deleted_BusinessEmail, inserted_BusinessEmail, deleted_BusinessPhone, inserted_BusinessPhone, deleted_CellPhone, inserted_CellPhone, deleted_CustomerStatus, inserted_CustomerStatus, deleted_CustomerType, inserted_CustomerType, deleted_CustomerTypeCode, inserted_CustomerTypeCode, deleted_EvEmail, inserted_EvEmail, deleted_Fax, inserted_Fax, deleted_FullName, inserted_FullName, deleted_Hashkey, inserted_Hashkey, deleted_HomePhone, inserted_HomePhone, deleted_OtherEmail, inserted_OtherEmail, deleted_OtherEmailType, inserted_OtherEmailType, deleted_OtherPhone, inserted_OtherPhone, deleted_OtherPhoneType, inserted_OtherPhoneType, deleted_PacCreateDate, inserted_PacCreateDate, deleted_Patron, inserted_Patron, deleted_PatronStatus, inserted_PatronStatus, deleted_PatronStatusCode, inserted_PatronStatusCode, deleted_PersonalEmail, inserted_PersonalEmail, deleted_PrimaryAddressCity, inserted_PrimaryAddressCity, deleted_PrimaryAddressCountry, inserted_PrimaryAddressCountry, deleted_PrimaryAddressState, inserted_PrimaryAddressState, deleted_PrimaryAddressStreet, inserted_PrimaryAddressStreet, deleted_PrimaryAddressType, inserted_PrimaryAddressType, deleted_PrimaryAddressZipCode, inserted_PrimaryAddressZipCode, deleted_PriorityPtsTix, inserted_PriorityPtsTix, deleted_Suffix, inserted_Suffix, deleted_Title, inserted_Title, deleted_UpdatedDate, inserted_UpdatedDate,srcPatronID)
select 
Actiontype, deleted_Address2City, inserted_Address2City, deleted_Address2Country, inserted_Address2Country, deleted_Address2State, inserted_Address2State, deleted_Address2Street, inserted_Address2Street, deleted_Address2Type, inserted_Address2Type, deleted_Address2ZipCode, inserted_Address2ZipCode, deleted_Address3City, inserted_Address3City, deleted_Address3Country, inserted_Address3Country, deleted_Address3State, inserted_Address3State, deleted_Address3Street, inserted_Address3Street, deleted_Address3Type, inserted_Address3Type, deleted_Address3ZipCode, inserted_Address3ZipCode, deleted_BusinessEmail, inserted_BusinessEmail, deleted_BusinessPhone, inserted_BusinessPhone, deleted_CellPhone, inserted_CellPhone, deleted_CustomerStatus, inserted_CustomerStatus, deleted_CustomerType, inserted_CustomerType, deleted_CustomerTypeCode, inserted_CustomerTypeCode, deleted_EvEmail, inserted_EvEmail, deleted_Fax, inserted_Fax, deleted_FullName, inserted_FullName, deleted_Hashkey, inserted_Hashkey, deleted_HomePhone, inserted_HomePhone, deleted_OtherEmail, inserted_OtherEmail, deleted_OtherEmailType, inserted_OtherEmailType, deleted_OtherPhone, inserted_OtherPhone, deleted_OtherPhoneType, inserted_OtherPhoneType, deleted_PacCreateDate, inserted_PacCreateDate, deleted_Patron, inserted_Patron, deleted_PatronStatus, inserted_PatronStatus, deleted_PatronStatusCode, inserted_PatronStatusCode, deleted_PersonalEmail, inserted_PersonalEmail, deleted_PrimaryAddressCity, inserted_PrimaryAddressCity, deleted_PrimaryAddressCountry, inserted_PrimaryAddressCountry, deleted_PrimaryAddressState, inserted_PrimaryAddressState, deleted_PrimaryAddressStreet, inserted_PrimaryAddressStreet, deleted_PrimaryAddressType, inserted_PrimaryAddressType, deleted_PrimaryAddressZipCode, inserted_PrimaryAddressZipCode, deleted_PriorityPtsTix, inserted_PriorityPtsTix, deleted_Suffix, inserted_Suffix, deleted_Title, inserted_Title, deleted_UpdatedDate, inserted_UpdatedDate,srcpatronid
from 
(
merge into dbo.Patron__c as target
using  src.Patron__c as SOURCE 
on target.patron = source.patron
when matched 
and target.hashkey <> source.hashkey
then 
UPDATE SET 
target.Address2City = source.Address2City
,target.Address2Country = source.Address2Country
,target.Address2State = source.Address2State
,target.Address2Street = source.Address2Street
,target.Address2Type = source.Address2Type
,target.Address2ZipCode = source.Address2ZipCode
,target.Address3City = source.Address3City
,target.Address3Country = source.Address3Country
,target.Address3State = source.Address3State
,target.Address3Street = source.Address3Street
,target.Address3Type = source.Address3Type
,target.Address3ZipCode = source.Address3ZipCode
,target.BusinessEmail = source.BusinessEmail
,target.BusinessPhone = source.BusinessPhone
,target.CellPhone = source.CellPhone
,target.Cust_comments = source.Cust_comments
,target.cust_UD1 = source.cust_UD1
,target.CustomerStatus = source.CustomerStatus
,target.CustomerType = source.CustomerType
,target.CustomerTypeCode = source.CustomerTypeCode
,target.EvEmail = source.EvEmail
,target.Fax = source.Fax
,target.FullName = source.FullName
,target.HashKey = source.HashKey
,target.HomePhone = source.HomePhone
,target.Internet_profile = source.Internet_profile
,target.OtherEmail = source.OtherEmail
,target.OtherEmailType = source.OtherEmailType
,target.OtherPhone = source.OtherPhone
,target.OtherPhoneType = source.OtherPhoneType
,target.PacCreateDate = source.PacCreateDate
,target.Patron = source.Patron
,target.PatronStatus = source.PatronStatus
,target.PatronStatusCode = source.PatronStatusCode
,target.PersonalEmail = source.PersonalEmail
,target.PrimaryAddressCity = source.PrimaryAddressCity
,target.PrimaryAddressCountry = source.PrimaryAddressCountry
,target.PrimaryAddressState = source.PrimaryAddressState
,target.PrimaryAddressStreet = source.PrimaryAddressStreet
,target.PrimaryAddressType = source.PrimaryAddressType
,target.PrimaryAddressZipCode = source.PrimaryAddressZipCode
,target.PriorityPtsTix = source.PriorityPtsTix
,target.Suffix = source.Suffix
,target.Title = source.Title
,target.UpdatedDate = source.UpdatedDate
,target.VIP = source.VIP
,target.changetype = 'c'
,target.dblastupdated = getdate()
when not matched by Target then
INSERT 
(
Address2City
,Address2Country
,Address2State
,Address2Street
,Address2Type
,Address2ZipCode
,Address3City
,Address3Country
,Address3State
,Address3Street
,Address3Type
,Address3ZipCode
,BusinessEmail
,BusinessPhone
,CellPhone
,Cust_comments
,cust_UD1
,CustomerStatus
,CustomerType
,CustomerTypeCode
,EvEmail
,Fax
,FullName
,HashKey
,HomePhone
,Internet_profile
,OtherEmail
,OtherEmailType
,OtherPhone
,OtherPhoneType
,PacCreateDate
,Patron
,PatronStatus
,PatronStatusCode
,PersonalEmail
,PrimaryAddressCity
,PrimaryAddressCountry
,PrimaryAddressState
,PrimaryAddressStreet
,PrimaryAddressType
,PrimaryAddressZipCode
,PriorityPtsTix
,Suffix
,Title
,UpdatedDate
,VIP
,dblastupdated
,changetype
) 
VALUES 
(
source.Address2City
,source.Address2Country
,source.Address2State
,source.Address2Street
,source.Address2Type
,source.Address2ZipCode
,source.Address3City
,source.Address3Country
,source.Address3State
,source.Address3Street
,source.Address3Type
,source.Address3ZipCode
,source.BusinessEmail
,source.BusinessPhone
,source.CellPhone
,source.Cust_comments
,source.cust_UD1
,source.CustomerStatus
,source.CustomerType
,source.CustomerTypeCode
,source.EvEmail
,source.Fax
,source.FullName
,source.HashKey
,source.HomePhone
,source.Internet_profile
,source.OtherEmail
,source.OtherEmailType
,source.OtherPhone
,source.OtherPhoneType
,source.PacCreateDate
,source.Patron
,source.PatronStatus
,source.PatronStatusCode
,source.PersonalEmail
,source.PrimaryAddressCity
,source.PrimaryAddressCountry
,source.PrimaryAddressState
,source.PrimaryAddressStreet
,source.PrimaryAddressType
,source.PrimaryAddressZipCode
,source.PriorityPtsTix
,source.Suffix
,source.Title
,source.UpdatedDate
,source.VIP
,getdate()
,'c'
)
when not matched by source then update set  changetype = 'd',target.dblastupdated = getdate()
output
$action, deleted.Address2City, inserted.Address2City, deleted.Address2Country, inserted.Address2Country, deleted.Address2State
, inserted.Address2State, deleted.Address2Street, inserted.Address2Street, deleted.Address2Type, inserted.Address2Type
, deleted.Address2ZipCode, inserted.Address2ZipCode, deleted.Address3City, inserted.Address3City
, deleted.Address3Country, inserted.Address3Country, deleted.Address3State, inserted.Address3State
, deleted.Address3Street, inserted.Address3Street, deleted.Address3Type, inserted.Address3Type
, deleted.Address3ZipCode, inserted.Address3ZipCode, deleted.BusinessEmail, inserted.BusinessEmail
, deleted.BusinessPhone, inserted.BusinessPhone, deleted.CellPhone, inserted.CellPhone
, deleted.CustomerStatus, inserted.CustomerStatus, deleted.CustomerType, inserted.CustomerType, deleted.CustomerTypeCode
, inserted.CustomerTypeCode, deleted.EvEmail, inserted.EvEmail, deleted.Fax, inserted.Fax, deleted.FullName, inserted.FullName
, deleted.Hashkey, inserted.Hashkey, deleted.HomePhone, inserted.HomePhone, deleted.OtherEmail, inserted.OtherEmail
, deleted.OtherEmailType, inserted.OtherEmailType, deleted.OtherPhone, inserted.OtherPhone, deleted.OtherPhoneType
, inserted.OtherPhoneType, deleted.PacCreateDate, inserted.PacCreateDate, deleted.Patron, inserted.Patron
, deleted.PatronStatus, inserted.PatronStatus, deleted.PatronStatusCode, inserted.PatronStatusCode
, deleted.PersonalEmail, inserted.PersonalEmail, deleted.PrimaryAddressCity
, inserted.PrimaryAddressCity, deleted.PrimaryAddressCountry, inserted.PrimaryAddressCountry
, deleted.PrimaryAddressState, inserted.PrimaryAddressState, deleted.PrimaryAddressStreet
, inserted.PrimaryAddressStreet, deleted.PrimaryAddressType, inserted.PrimaryAddressType
, deleted.PrimaryAddressZipCode, inserted.PrimaryAddressZipCode, deleted.PriorityPtsTix
, inserted.PriorityPtsTix, deleted.Suffix, inserted.Suffix, deleted.Title, inserted.Title, deleted.UpdatedDate, inserted.UpdatedDate, source.patron) 
as changeval (ActionType,deleted_Address2City, inserted_Address2City, deleted_Address2Country, inserted_Address2Country, deleted_Address2State, inserted_Address2State, deleted_Address2Street, inserted_Address2Street, deleted_Address2Type, inserted_Address2Type, deleted_Address2ZipCode, inserted_Address2ZipCode, deleted_Address3City, inserted_Address3City, deleted_Address3Country, inserted_Address3Country, deleted_Address3State, inserted_Address3State, deleted_Address3Street, inserted_Address3Street, deleted_Address3Type, inserted_Address3Type, deleted_Address3ZipCode, inserted_Address3ZipCode, deleted_BusinessEmail, inserted_BusinessEmail, deleted_BusinessPhone, inserted_BusinessPhone, deleted_CellPhone, inserted_CellPhone, deleted_CustomerStatus, inserted_CustomerStatus, deleted_CustomerType, inserted_CustomerType, deleted_CustomerTypeCode, inserted_CustomerTypeCode, deleted_EvEmail, inserted_EvEmail, deleted_Fax, inserted_Fax, deleted_FullName, inserted_FullName, deleted_Hashkey, inserted_Hashkey, deleted_HomePhone, inserted_HomePhone, deleted_OtherEmail, inserted_OtherEmail, deleted_OtherEmailType, inserted_OtherEmailType, deleted_OtherPhone, inserted_OtherPhone, deleted_OtherPhoneType, inserted_OtherPhoneType, deleted_PacCreateDate, inserted_PacCreateDate, deleted_Patron, inserted_Patron, deleted_PatronStatus, inserted_PatronStatus, deleted_PatronStatusCode, inserted_PatronStatusCode, deleted_PersonalEmail, inserted_PersonalEmail, deleted_PrimaryAddressCity, inserted_PrimaryAddressCity, deleted_PrimaryAddressCountry, inserted_PrimaryAddressCountry, deleted_PrimaryAddressState, inserted_PrimaryAddressState, deleted_PrimaryAddressStreet, inserted_PrimaryAddressStreet, deleted_PrimaryAddressType, inserted_PrimaryAddressType, deleted_PrimaryAddressZipCode, inserted_PrimaryAddressZipCode, deleted_PriorityPtsTix, inserted_PriorityPtsTix, deleted_Suffix, inserted_Suffix, deleted_Title, inserted_Title, deleted_UpdatedDate, inserted_UpdatedDate,srcPatronID);

      
END










GO
