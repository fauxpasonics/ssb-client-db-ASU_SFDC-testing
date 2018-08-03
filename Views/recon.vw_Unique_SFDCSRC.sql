SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [recon].[vw_Unique_SFDCSRC] as
Select SFDC.UID, SFDC.SFDC_Account_ID, SFDC.ID SFDC_ID, SRC.ID SRC_ID  from recon.SFDC_Profile SFDC
inner join recon.SFDC_Profile SRC on SFDC.ID = SRC.ID and SFDC.Type = 'SFDC' and SRC.TYPE = 'Source'
GO
