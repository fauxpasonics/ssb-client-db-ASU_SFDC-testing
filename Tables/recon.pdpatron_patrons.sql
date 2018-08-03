CREATE TABLE [recon].[pdpatron_patrons]
(
[patron] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
CREATE UNIQUE NONCLUSTERED INDEX [idxo1] ON [recon].[pdpatron_patrons] ([patron])
GO
