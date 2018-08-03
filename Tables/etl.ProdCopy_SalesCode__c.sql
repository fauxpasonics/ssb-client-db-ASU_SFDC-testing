CREATE TABLE [etl].[ProdCopy_SalesCode__c]
(
[Id] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NULL,
[CreatedById] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModifiedDate] [datetime] NULL,
[LastModifiedById] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SystemModstamp] [datetime] NULL,
[OwnerId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsDeleted] [bit] NULL,
[ZID__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SaleCode__c] [nvarchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Soft_Delete__c] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETLoad] [datetime] NULL CONSTRAINT [DF__ProdCopy___ETLoa__7849DB76] DEFAULT (getdate())
)
GO
