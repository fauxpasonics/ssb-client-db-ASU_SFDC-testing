CREATE TABLE [etl].[Foundation_PatronExtract_20150422]
(
[BatchId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactStatusCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactStatus] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceContactId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Prefix] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MiddleName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suffix] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Gender] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salutation] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address2] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suite] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[State] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZipCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Plus4] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressCounty] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressCountry] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressCountyFips] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressDeliveryPoint] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZipLatitude] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZipLongitude] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AreaCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneExtension] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailAddress] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_FullName] [varchar] (55) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO