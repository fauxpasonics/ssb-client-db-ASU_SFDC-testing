CREATE TABLE [src_Sandbox].[Transaction_Detail__c]
(
[Id] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OwnerId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsDeleted] [bit] NULL,
[Name] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NULL,
[CreatedById] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModifiedDate] [datetime] NULL,
[LastModifiedById] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SystemModstamp] [datetime] NULL,
[Account__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Customer__c] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DW_Hashkey__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Export_DateTime__c] [datetime] NULL,
[Item__c] [nvarchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item_Discount_Amount__c] [float] NULL,
[Item_Price__c] [float] NULL,
[Minimum_Payment_Date__c] [datetime] NULL,
[Order_Quantity__c] [float] NULL,
[Order_Total__c] [float] NULL,
[Paid_Customer__c] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Paid_Total__c] [float] NULL,
[Price_Level__c] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Price_Type__c] [nvarchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Season__c] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Transacti__ETL_C__7CF981FA] DEFAULT (getdate())
)
GO
