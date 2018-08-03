CREATE TABLE [MERGEProcess].[VerticalDimCust]
(
[SSB_CRMSYSTEM_ACCT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_Contact_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SFID] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DimCustomerID] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Master_Flag] [int] NOT NULL
)
GO
