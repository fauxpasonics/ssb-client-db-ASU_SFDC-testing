SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE PROCEDURE [dbo].[sp_SFMC_Default]
AS

BEGIN

SELECT 
  EmailPrimary									AS EmailAddress
, composite.SSB_CRMSYSTEM_CONTACT_ID			AS ContactID
, CASE WHEN SourceSystem = 'TI ASU' THEN SSID
	 ELSE NULL END								AS PacPrimary
, NULL											AS PacID
, sdc.ID_NUMBER									AS AdvanceID
, composite.FirstName							AS FirstName
, composite.LastName							AS LastName
, AddressPrimaryCity							AS City
, AddressPrimaryState							AS [State]
, AddressPrimaryZip								AS Zip
, composite.Gender								AS Gender
, NULL											AS Age
, Birthday										AS BirthDate
, composite.CustomerType						AS CustomerType
, sdc.RECORD_TYPE_DESC							AS PrimaryRecordType
, NULL											AS RecordTypes
, sdc.RECORD_STATUS_DESC						AS RecordStatus
, sdc.TYPE_CODE									AS Advance_OtherID_Type
, sdc.CONTIBUTIONS_POINTS						AS PriorityPoints_Cumulative
, sdc.SUN_DEVIL_CLUB_POINTS						AS PriorityPoints_Consecutive
, sdc.SEASON_TICKET_POINTS						AS PriorityPoints_SeasonTickets
, sdc.LETTER_WINNER_POINTS						AS PriorityPoints_LetterWinner
, sdc.MISC_ADJUSTMENT_POINTS					AS PriorityPoints_Misc
, sdc.TOTAL_POINTS								AS PriorityPointsTotal
, sdc.RANKING									AS PriorityPoints_Rank
, CASE WHEN sdc.Active_SDC_Member = 1 
	   THEN 1 ELSE 0 END 						AS Active_SDC_Member
, sdc.GIFT_CLUB_DESC							AS Current_SDC_MemberLevel
, SSCreatedDate									AS JoinDate

FROM ASU.[dbo].[vwCompositeRecord_ModAcctID] composite
LEFT JOIN (SELECT dc.SSB_CRMSYSTEM_CONTACT_ID
			 , bio.ID_NUMBER, RECORD_STATUS_DESC, RECORD_TYPE_DESC, OTHER_ID, TYPE_CODE
			 , SUN_DEVIL_CLUB_POINTS, LETTER_WINNER_POINTS, SEASON_TICKET_POINTS, CONTIBUTIONS_POINTS, MISC_ADJUSTMENT_POINTS, TOTAL_POINTS
			 , RANKING
			 , CASE WHEN GIFT_CLUB_DESC IS NOT NULL THEN 1 ELSE 0 END AS Active_SDC_Member, [GIFT_CLUB_DESC]
			 FROM ASU.[dbo].[vwDimCustomer_ModAcctId] dc
			 INNER JOIN ASU.[dbo].[FD_SDA_ENTITY_BIOGRAPHIC] bio (NOLOCK) ON dc.SourceSystem = 'Advance ASU' AND dc.SSID = bio.ID_NUMBER
			 INNER JOIN ASU.[dbo].[FD_SDA_ENTITY_OTHER_IDS] oid (NOLOCK) ON bio.ID_NUMBER = oid.ID_NUMBER AND TYPE_CODE IN ('SDP', 'SDJ')
			 LEFT JOIN  ASU.[dbo].[FD_SDA_PRIORITY_POINT_SUMMARY] pp  (NOLOCK) ON oid.OTHER_ID = pp.PACIOLAN_ID
			 LEFT JOIN ASU.[dbo].[FD_SDC_GIFT_CLUBS] gc (NOLOCK) ON GIFT_CLUB_ID_NUMBER = bio.ID_NUMBER AND GIFT_CLUB_STATUS = 'A'
			) sdc ON composite.SSB_CRMSYSTEM_CONTACT_ID = sdc.SSB_CRMSYSTEM_CONTACT_ID
INNER JOIN (SELECT DISTINCT SSB_CRMSYSTEM_CONTACT_ID, MAX(MaxTrans) AS MaxTrans
			FROM ( --Ticket Purchasers (Ticketmaster)
					SELECT DISTINCT SSB_CRMSYSTEM_CONTACT_ID, MAX(upd_datetime) MaxTrans 
					FROM ASU.[dbo].[vwDimCustomer_ModAcctId] dc 
					INNER JOIN ASU.ods.TM_Ticket o (NOLOCK) ON dc.SourceSystem = 'TM' AND dc.AccountId = o.acct_id 
					GROUP BY SSB_CRMSYSTEM_CONTACT_ID

					UNION ALL 

					--Ticket Purchasers (Paciolan)
					SELECT DISTINCT SSB_CRMSYSTEM_CONTACT_ID, MAX(I_DATE) MaxTrans 
					FROM ASU.[dbo].[vwDimCustomer_ModAcctId] dc
					INNER JOIN ASU.dbo.TK_ODET o (NOLOCK) ON dc.SourceSystem = 'TI ASU' AND dc.SSID = o.CUSTOMER
					GROUP BY SSB_CRMSYSTEM_CONTACT_ID

					UNION ALL
					--Donors
					SELECT DISTINCT SSB_CRMSYSTEM_CONTACT_ID, MAX(DATE_OF_RECORD) MaxTrans 
					FROM ASU.[dbo].[vwDimCustomer_ModAcctId] dc
					INNER JOIN ASU.[dbo].[FD_SDA_TRANSACTION_DETAIL] t (NOLOCK) ON dc.SourceSystem = 'Advance ASU' AND dc.SSID = t.ID_NUMBER
					GROUP BY SSB_CRMSYSTEM_CONTACT_ID

					UNION ALL 
					--Opt In Email Subscribers
					SELECT DISTINCT SSB_CRMSYSTEM_CONTACT_ID, GETDATE() AS MaxTrans 
					FROM ASU.[dbo].[vwDimCustomer_ModAcctId] dc
					INNER JOIN ASU.ods.SFMC_Subscribers ss ON dc.SourceSystem = 'SFMC' AND dc.SSID = ss.SubscriberId
					INNER JOIN ASU.ods.SFMC_OptInFormDataExtension de ON ss.EmailAddress = de.EmailAddress
					WHERE CustomerStatus = 'Active'
					GROUP BY SSB_CRMSYSTEM_CONTACT_ID

					UNION ALL 
					--Active Email Subscribers
					SELECT DISTINCT SSB_CRMSYSTEM_CONTACT_ID, MAX(CAST(so.EventDate AS DATE)) AS MaxTrans 
					FROM ASU.[dbo].[vwDimCustomer_ModAcctId] dc
					INNER JOIN ASU.ods.SFMC_Subscribers ss ON dc.SourceSystem = 'SFMC' AND dc.SSID = ss.SubscriberId
					INNER JOIN ASU.ods.SFMC_Opens so on ss.EmailAddress = so.EmailAddress
					WHERE CustomerStatus = 'Active'
					GROUP BY SSB_CRMSYSTEM_CONTACT_ID
					HAVING ISNULL(DATEDIFF(DAY, MAX(CAST(so.EventDate AS DATE)), GETDATE()), 100000) < 90


					) purchasehistory 
			WHERE MaxTrans >= DATEADD(YEAR,-3,GETDATE())
			GROUP BY SSB_CRMSYSTEM_CONTACT_ID
			 ) purchasecriteria ON composite.SSB_CRMSYSTEM_CONTACT_ID = purchasecriteria.SSB_CRMSYSTEM_CONTACT_ID

WHERE ISNULL(EmailPrimary,'') != ''
END







GO
