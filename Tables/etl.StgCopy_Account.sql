CREATE TABLE [etl].[StgCopy_Account]
(
[ContactId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SFID] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountName] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PatronId] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingStreet] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingCity] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingState] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingPostalCode] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingCountry] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OwnerMarkCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerType] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExportDatetime] [datetime] NULL
)
GO
