CREATE TABLE [MERGEProcess].[Queue]
(
[PK_QueueID] [int] NOT NULL IDENTITY(1, 1),
[ObjectType] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Master_SFID] [varchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Slave_SFID] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MergeDetermination] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Completed] [int] NULL
)
GO
ALTER TABLE [MERGEProcess].[Queue] ADD CONSTRAINT [PK_Queue] PRIMARY KEY CLUSTERED  ([PK_QueueID])
GO
