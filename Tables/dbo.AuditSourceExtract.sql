CREATE TABLE [dbo].[AuditSourceExtract]
(
[AuditSourceExtractId] [int] NOT NULL IDENTITY(1, 1),
[BatchId] [int] NOT NULL,
[Source] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IntegrationName] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceTable] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DestinationTable] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IncrementalExtractDate] [datetime] NULL,
[ExecStartDate] [datetime] NOT NULL,
[ExecEndDate] [datetime] NULL,
[FullLoad] [bit] NOT NULL,
[RecordCountSource] [int] NULL,
[RecordCountDataFlow] [int] NULL,
[RecordCountDestination] [int] NULL
)
GO
