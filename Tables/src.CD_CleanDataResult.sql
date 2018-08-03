CREATE TABLE [src].[CD_CleanDataResult]
(
[CleanDataResultID] [int] NOT NULL IDENTITY(1, 1),
[BatchId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactStatusCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactStatus] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceContactId] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Prefix] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MiddleName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suffix] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Gender] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salutation] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address2] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suite] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[State] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZipCode] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Plus4] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressCounty] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressCountry] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressCountyFips] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressType] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressDeliveryPoint] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZipLatitude] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZipLongitude] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AreaCode] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneExtension] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailAddress] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_Prefix] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_FirstName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_MiddleName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_LastName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_Suffix] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_FullName] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_AddressType] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_Address] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_Address2] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_City] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_State] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_ZipCode] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_AddressCounty] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_AddressCountry] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_PhoneType] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_Phone] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_EmailType] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_Email] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_SourcePriorityRank] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_SourceCreateDate] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_Custom1] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_Custom2] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_Custom3] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_Custom4] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_Custom5] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RunContactMatch] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NameStatus] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressStatus] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneStatus] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailStatus] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_SourceSystem] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ncoaAddress] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ncoaAddress2] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ncoaSuite] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ncoaCity] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ncoaState] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ncoaZipCode] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ncoaPlus4] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ncoaAddressCounty] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ncoaAddressCountry] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ncoaAddressCountyFips] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ncoaAddressType] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ncoaAddressDeliveryPoint] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ncoaZipLatitude] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ncoaZipLongitude] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ncoaMoveEffectiveDate] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsMerged] [bit] NOT NULL CONSTRAINT [DF_CD_CleanDataResult_IsMerged] DEFAULT ((0))
)
GO
ALTER TABLE [src].[CD_CleanDataResult] ADD CONSTRAINT [PK_CD_CleanDataResult] PRIMARY KEY CLUSTERED  ([CleanDataResultID])
GO
CREATE NONCLUSTERED INDEX [IDX_BatchId] ON [src].[CD_CleanDataResult] ([BatchId])
GO
CREATE NONCLUSTERED INDEX [IDX_Input_Custom2] ON [src].[CD_CleanDataResult] ([Input_Custom2])
GO
CREATE NONCLUSTERED INDEX [IDX_Input_Custom3] ON [src].[CD_CleanDataResult] ([Input_Custom3])
GO
CREATE NONCLUSTERED INDEX [CD_CleanDataResult_InputCustom3] ON [src].[CD_CleanDataResult] ([Input_Custom3]) INCLUDE ([EmailAddress], [SourceContactId])
GO
CREATE NONCLUSTERED INDEX [CD_CleanDataResult_InputCustom3_Phone_2] ON [src].[CD_CleanDataResult] ([Input_Custom3], [Phone]) INCLUDE ([SourceContactId])
GO
CREATE NONCLUSTERED INDEX [CD_CleanDataResult_InputCustom3_Phone] ON [src].[CD_CleanDataResult] ([Input_Custom3], [Phone]) INCLUDE ([AreaCode], [PhoneExtension], [SourceContactId])
GO
CREATE NONCLUSTERED INDEX [IDX_SourceContactId] ON [src].[CD_CleanDataResult] ([SourceContactId])
GO
