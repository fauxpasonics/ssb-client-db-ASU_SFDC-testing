CREATE TABLE [src_Production].[Item__c]
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
[Season__c] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item__c] [nvarchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZID__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Deleted__c] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Export_Date_Time__c] [datetime] NULL,
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Item__c__ETL_Cre__375B2DB9] DEFAULT (getdate())
)
GO
