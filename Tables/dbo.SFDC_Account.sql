CREATE TABLE [dbo].[SFDC_Account]
(
[Id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsDeleted] [bit] NULL,
[Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordTypeId] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NULL,
[LastModifiedDate] [datetime] NULL,
[IsPersonAccount] [bit] NULL,
[Patron_ID__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Full_Account_ID__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactID__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__SFDC_Acco__ETL_C__335592AB] DEFAULT (getdate())
)
GO
