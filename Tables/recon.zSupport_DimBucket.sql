CREATE TABLE [recon].[zSupport_DimBucket]
(
[BucketID] [int] NOT NULL,
[Name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastChange] [datetime] NULL CONSTRAINT [DF__zSupport___LastC__5C6CB6D7] DEFAULT (getdate())
)
GO
ALTER TABLE [recon].[zSupport_DimBucket] ADD CONSTRAINT [PK_zSupport_DimBucket] PRIMARY KEY CLUSTERED  ([BucketID])
GO
