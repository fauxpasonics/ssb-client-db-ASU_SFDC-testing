SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [MERGEProcess].[vw_Account] AS
SELECT *
, ContactId SSB_CRMSYSTEM_Contact_ID
, Patron DimCustomerID
 FROM dbo.Account


GO
