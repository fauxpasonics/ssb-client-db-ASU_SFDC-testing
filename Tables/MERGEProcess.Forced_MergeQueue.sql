CREATE TABLE [MERGEProcess].[Forced_MergeQueue]
(
[PK_MergeID] [int] NOT NULL,
[Winning_DimCustomerID] [int] NULL,
[Loser_DimCustomerID] [int] NULL,
[Master_SFID] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Slave_SFID] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PK_QueueID] [int] NOT NULL
)
GO
