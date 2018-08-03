CREATE TABLE [recon].[SFDC_Profile]
(
[UID] [int] NOT NULL IDENTITY(1, 1),
[SFDC_Account_ID] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CommonID] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactID] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Type] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[bucket1] [int] NULL,
[bucket2] [int] NULL,
[bucket3] [int] NULL,
[bucket4] [int] NULL,
[bucket5] [int] NULL,
[bucket6] [int] NULL,
[bucket7] [int] NULL,
[bucket8] [int] NULL,
[bucket9] [int] NULL,
[bucket10] [int] NULL,
[bucket11] [int] NULL,
[bucket12] [int] NULL,
[bucket13] [int] NULL,
[bucket14] [int] NULL,
[bucket15] [int] NULL,
[bucket16] [int] NULL,
[bucket17] [int] NULL,
[bucket18] [int] NULL,
[bucket19] [int] NULL,
[bucket20] [int] NULL,
[bucket21] [int] NULL,
[bucket22] [int] NULL,
[bucket23] [int] NULL,
[bucket24] [int] NULL,
[bucket25] [int] NULL,
[bucket26] [int] NULL,
[bucket27] [int] NULL,
[bucket28] [int] NULL,
[bucket29] [int] NULL,
[bucket30] [int] NULL
)
GO
ALTER TABLE [recon].[SFDC_Profile] ADD CONSTRAINT [PK__SFDC_Pro__C5B196025AF5CCC6] PRIMARY KEY CLUSTERED  ([UID])
GO
CREATE NONCLUSTERED INDEX [IDX_SFDCProfile_Bucket1] ON [recon].[SFDC_Profile] ([CommonID], [bucket1]) INCLUDE ([ContactID], [SFDC_Account_ID], [Type], [UID])
GO
CREATE NONCLUSTERED INDEX [IDX_SFDCProfile_Bucket2] ON [recon].[SFDC_Profile] ([CommonID], [bucket2]) INCLUDE ([ContactID], [SFDC_Account_ID], [Type], [UID])
GO
CREATE NONCLUSTERED INDEX [IDX_SFDCProfile_Bucket3] ON [recon].[SFDC_Profile] ([CommonID], [bucket3]) INCLUDE ([ContactID], [SFDC_Account_ID], [Type], [UID])
GO
