SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO







CREATE PROCEDURE [api].[GETSTHAccountViewFB15] AS 
BEGIN

           select STH.SEASON AS [Season]
           , pcuser.name AS [Service_Owner]
           , STH.CUSTOMER AS [Customer]
           , pcaccount.Name AS [Name]
           , STH.PurchaseInfo AS [Purchase_Info]
           , STH.SectionInfoPrev AS [F14_Sections]
           , STH.SectionInfoCur AS [F15_Sections]
           , STH.PrevYrSoldQty AS [Sold_Qty_2014]
           , STH.CurYrSoldQty AS [Sold_Qty_2015]
           , STH.AddDrops AS [Adds_Drops]
           , STH.Payment_Plan AS [Payment_Plan]
           , STH.SoldAMT AS [Ticket_Total]
           , STH.TotalPaid AS [Ticket_Paid]
           , STH.TotalTicketBalDue AS [Ticket_Balance]
           , STH.pledge AS [Pledge]
           , STH.donamt AS [Cash_Receipts]
           , STH.DonBalDue AS [Donation_Balance]
           , STH.TotalBalDue AS [Total_Balance]
           , STH.minPmtDate AS [Min_Pmt_Date]
           , STH.email AS [Email]
           , STH.Linked_status AS [Linked_Status]
           , STH.PIN AS [Patron_Pin]
           , STH.CUSTOMER_TYPE AS [Customer_Type]
           , pcaccount.PersonHomePhone AS [Home]
           , pcaccount.Biz_Other_Phone__c AS [Business]
           , pcaccount.PersonMobilePhone AS [Cell]
           , pcaccount.Name AS [Address_Mail_Name]
           , pcaccount.BillingStreet AS [Addr1]
           , '' AS [Addr2]
           , '' AS [Addr3]
           , '' AS [Addr4]
           , concat( pcaccount.BillingCity, ', ', pcaccount.BillingState, '  ', pcaccount.BillingPostalCode ) AS [csz]


           from [172.31.17.15].[ASUTIF1].[dbo].[vwTISTHAccountViewFB15] STH
           left join [ASU_SFDC].[dbo].[patron__C] patron
                     ON STH.Customer = patron.patron
           left join [ASU_SFDC].[dbo].[account] account
                     ON account.contactid = patron.contactid
           left join [ASU_SFDC].[prodcopy].[account] pcaccount
                     ON account.salesforce_ID = pcaccount.id
           left join [ASU_SFDC].[prodcopy].[user] pcuser
                     ON pcaccount.ownerid = pcuser.id
           FOR XML PATH('ASUSeasonTicketAccount'), ROOT('ASUSeasonTicketAccounts')

END


GO
