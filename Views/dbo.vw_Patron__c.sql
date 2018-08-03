SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE view [dbo].[vw_Patron__c]
 as 
(
select 
 case when patron.fullname is null then ' ' when patron.fullname = '' then ' ' end  as name
,acct.salesforce_id as Account__c
,patron.patron  as Patron_ID__c
,cast(acct.contactid  as varchar(100))+ ':' + patron.patron as zid__c
,cast(acct.contactid as varchar(50)) as DW_ContactId__c 
,CONVERT(datetime, patron.dblastupdated, 126) as Export_datetime__c
,patron.dbLastUpdated 
 From dbo.patron__c patron join [dbo].Account acct
 on patron.contactid = acct.contactid
)
GO
