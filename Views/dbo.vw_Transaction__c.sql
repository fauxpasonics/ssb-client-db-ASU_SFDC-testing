SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [dbo].[vw_Transaction__c] AS
SELECT  
'701i0000001EYYtAAO' AS Campaign__c
,CONVERT(DATETIME,odet.dblastupdated, 126) AS Export_Datetime__c
,Season_Code__c, odet.Order_Line_ID__c, Sequence__c, odet.Patron_ID__c, Basis__c
, Disposition_Code__c, SUBSTRING(ISNULL(Event_Code__c,' '),1,255) AS Event_Code__c
, SUBSTRING( Item_Code__c,1,10) AS Item_Code__c , Price_Level__c, Price_Type__c
, Item_Price__c, Order_Date__c, Order_Quantity__c, Order_Total__c
, Amount_Paid__c, Orig_Salecode__c,  Promo_Code__c
, Rep_Code__c, Inrefsource__c, Inrefdata__c
, SUBSTRING(Seat_Block__c,1,255) AS Seat_Block__c
,acct.salesforce_id AS Account__c
   ,CAST(season.salesforce_id AS VARCHAR(100)) AS [Season_Name__c]
      --,substring([Item_Title__c],1,150) as Item_Title__c
 , CAST(item.salesforce_id AS VARCHAR(100)) AS Item_Title__c
      ,[Orig_Salecode_Name__c]
      ,CAST(promo.salesforce_id AS VARCHAR(100)) [Promo_Code_Name__c]
	  , odet.dbLastUpdated
FROM [dbo].Transactions__c odet (NOLOCK)
JOIN dbo.patron__c patron (NOLOCK)
ON odet.Patron_ID__c = patron.patron
JOIN [dbo].Account acct (NOLOCK)
ON patron.ContactId = acct.ContactId
JOIN dbo.Item__c item (NOLOCK) ON odet.Item_Code__c= item.Item__c AND odet.Season_Code__c = item.Season__c
LEFT JOIN dbo.Promo_Code__c promo (NOLOCK)
ON odet.Promo_Code__c = promo.Promo__c AND promo.changeType <> 'd'
JOIN dbo.Season__c season (NOLOCK) ON season.Season__c = item.Season__c
WHERE odet.changetype <> 'd' 
AND item.changeType <> 'd'
AND season.changeType <> 'd'
AND acct.salesforce_id IS NOT NULL 




GO
