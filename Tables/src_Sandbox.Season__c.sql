CREATE TABLE [src_Sandbox].[Season__c]
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
[Activity__c] [nvarchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Status__c] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZID__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Deleted__c] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Export_Date_Time__c] [datetime] NULL,
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Season__c__ETL_C__00CA12DE] DEFAULT (getdate())
)
GO
