CREATE TABLE [src].[Patron__c]
(
[Suffix] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FullName] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Patron] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Title] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PatronStatusCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PatronStatus] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerTypeCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerType] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerStatus] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriorityPtsTix] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PacCreateDate] [datetime] NULL,
[PrimaryAddressType] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrimaryAddressStreet] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrimaryAddressCity] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrimaryAddressState] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrimaryAddressZipCode] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrimaryAddressCountry] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address2Type] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address2Street] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address2City] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address2State] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address2ZipCode] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address2Country] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address3Type] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address3Street] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address3City] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address3State] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address3ZipCode] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address3Country] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HomePhone] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CellPhone] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BusinessPhone] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Fax] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherPhoneType] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherPhone] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EvEmail] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonalEmail] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BusinessEmail] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherEmailType] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherEmail] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VIP] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Internet_profile] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cust_comments] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cust_UD1] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UpdatedDate] [datetime] NULL,
[HashKey] [varbinary] (8000) NULL
)
GO
CREATE NONCLUSTERED INDEX [idx_src_CD_patron_hashkey] ON [src].[Patron__c] ([HashKey])
GO
