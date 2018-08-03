CREATE TABLE [src_Production].[Case]
(
[Id] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsDeleted] [bit] NULL,
[CaseNumber] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssetId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ParentId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SuppliedName] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SuppliedEmail] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SuppliedPhone] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SuppliedCompany] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Type] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Status] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reason] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Origin] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Subject] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Priority] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsClosed] [bit] NULL,
[ClosedDate] [datetime] NULL,
[IsEscalated] [bit] NULL,
[HasCommentsUnreadByOwner] [bit] NULL,
[HasSelfServiceComments] [bit] NULL,
[OwnerId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NULL,
[CreatedById] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModifiedDate] [datetime] NULL,
[LastModifiedById] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SystemModstamp] [datetime] NULL,
[LastViewedDate] [datetime] NULL,
[LastReferencedDate] [datetime] NULL,
[Related_Sport__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Location__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Specify_Other__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sub_Type__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Campaign__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Date_of_Incident__c] [date] NULL,
[koreps__EngineeringReqNumber__c] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__PotentialLiability__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Product__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Resolution_Cost__c] [float] NULL,
[koreps__Resolution__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__SLAViolation__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Satisfaction__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__SyncPriority__c] [float] NULL,
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Case__ETL_Create__47919582] DEFAULT (getdate())
)
GO
