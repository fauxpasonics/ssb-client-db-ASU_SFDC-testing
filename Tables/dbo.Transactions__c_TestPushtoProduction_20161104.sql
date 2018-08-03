CREATE TABLE [dbo].[Transactions__c_TestPushtoProduction_20161104]
(
[UpsertType] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Campaign__c] [varchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Export_Datetime__c] [datetime] NULL,
[Season_Code__c] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Order_Line_ID__c] [varchar] (48) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sequence__c] [bigint] NULL,
[Patron_ID__c] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Basis__c] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Disposition_Code__c] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Event_Code__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item_Code__c] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Price_Level__c] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Price_Type__c] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item_Price__c] [numeric] (18, 2) NULL,
[Order_Date__c] [datetime] NULL,
[Order_Quantity__c] [bigint] NULL,
[Order_Total__c] [numeric] (38, 2) NULL,
[Amount_Paid__c] [numeric] (18, 2) NULL,
[Orig_Salecode__c] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Promo_Code__c] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rep_Code__c] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Inrefsource__c] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Inrefdata__c] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Seat_Block__c] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Account__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Season_Name__c] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item_Title__c] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Orig_Salecode_Name__c] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Promo_Code_Name__c] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dbLastUpdated] [datetime] NULL
)
GO