CREATE TABLE [ProdCopy].[Transactions__c]
(
[Id] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsDeleted] [bit] NULL,
[Name] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NULL,
[CreatedById] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModifiedDate] [datetime] NULL,
[LastModifiedById] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SystemModstamp] [datetime] NULL,
[Account__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Adress_Line_1__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address_Line_2__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address_Type__c] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Amount_Paid__c] [float] NULL,
[Basis__c] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Campaign__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City__c] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Disposition_Code__c] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email__c] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Event_Code__c] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[First_Name__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Home_Phone__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item_Code__c] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item_Price__c] [float] NULL,
[Export_Date_Time__c] [datetime] NULL,
[Last_Name__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Location_Preference__c] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Mobile_Phone__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Office_Phone__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Order_Date__c] [date] NULL,
[Order_Line_ID__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Order_Quantity__c] [float] NULL,
[Orig_Salecode__c] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Orig_Salecode_Name__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Patron_ID__c] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Price_Level__c] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Price_Type__c] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Promo_Code__c] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rep_Code__c] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Season_Code__c] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Seat_Block__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sequence__c] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[State__c] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Ticket_Class__c] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Zip_Code__c] [nvarchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item_Title__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Price_Type_Name__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salecode_Name__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Promo_Code_Name__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Season_Name__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InRefSource__c] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InRefData__c] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Payment_Date__c] [date] NULL,
[Discount__c] [float] NULL,
[Order_Total__c] [float] NULL,
[CopyLoadDate] [datetime] NULL CONSTRAINT [DF__Transacti__CopyL__37C5420D] DEFAULT (getdate())
)
GO
