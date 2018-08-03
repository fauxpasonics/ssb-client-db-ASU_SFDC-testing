CREATE TABLE [etl].[ProdCopy_PromoCode__c]
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
[Deleted__c] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Promo__c] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETLLoad] [datetime] NULL CONSTRAINT [DF__ProdCopy___ETLLo__76619304] DEFAULT (getdate())
)
GO
