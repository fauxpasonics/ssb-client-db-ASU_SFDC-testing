CREATE TABLE [dbo].[PotentialNewAccounts_ForReview_20161102]
(
[ContactId] [uniqueidentifier] NULL,
[Patron] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PatronStatusCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PatronStatus] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerTypeCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerType] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerStatus] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriorityPtsTix] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PacCreateDate] [datetime] NULL,
[VIP] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Internet_profile] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cust_comments] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_UD1] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
