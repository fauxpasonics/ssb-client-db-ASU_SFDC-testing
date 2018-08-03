SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE PROCEDURE [dbo].[sp_SFMC_Default_Bkp_PreTMConversion]
AS

BEGIN

-- check 000A87B8-E358-4AF3-81EA-3C2E0B93CF64

IF OBJECT_ID('tempdb..#head') IS NOT NULL
    DROP TABLE #head
create table #head (ContactID varchar(64), PacID varchar(100), AdvanceID varchar(50), EmailAddress varchar(254)) -- header


--Join Advance Information on PacID
insert into #head (ContactID, PacID, AdvanceID, EmailAddress) 
select distinct case when t.ContactID = '00000000-0000-0000-0000-000000000000' then NULL else t.ContactId end as ContactId, 
		t.PacID, 
		a.ID_NUMBER as AdvanceID, 
		ISNULL(t.PersonEmail,a.AdvEmail) as EmailAddress
from
	(select distinct p.ContactId, Patron as PacID, 
	coalesce(
		(case when CD_PersonalEmail not like '%@%' then null else CD_PersonalEmail end), 
		(case when CD_EvEmail not like '%@%' then null else CD_EvEmail end), 
		(case when CD_OtherEmail not like '%@%' then null else CD_OtherEmail end), 
		(case when CD_BusinessEmail not like '%@%' then null else  CD_BusinessEmail end) ) as PersonEmail
	FROM dbo.Patron__c p WITH (NOLOCK)
	) t 
left join --Advance Account not required
	(select distinct i.ID_NUMBER, i.OTHER_ID as PacID, 
	coalesce(
		(case when PRIMARY_EMAIL not like '%@%' then null else PRIMARY_EMAIL end),
		(case when SPOUSE_EMAIL not like '%@%' then null else SPOUSE_EMAIL end) ) as AdvEmail
	from ASU.dbo.FD_SDA_ENTITY_BIOGRAPHIC b WITH (NOLOCK)
	inner join ASU.dbo.FD_SDA_ENTITY_OTHER_IDS i WITH (NOLOCK) on b.ID_NUMBER = i.ID_NUMBER 
	where i.TYPE_CODE = 'SDP' --SDJ added later
	) a on t.PacID = a.PacID 
order by ContactID

create clustered index IDX_ContactID_Head on #head(ContactID)

IF OBJECT_ID('tempdb..#s') IS NOT NULL
    DROP TABLE #s
create table #s (ContactID varchar(64), PacID varchar(100), AdvanceID varchar(50), EmailAddress varchar(254)) -- single ContactID records

insert into #s (ContactID, PacID, AdvanceID, EmailAddress)
select distinct ContactID, PacID, AdvanceID, EmailAddress 
from #head
where ContactID in (select ContactID from (select distinct ContactID, PacID, AdvanceID from #head ) z
					group by ContactID having count(*) = 1	)
				
order by PacID

create clustered index IDX_PacID_Singles on #s(PacID)

IF OBJECT_ID('tempdb..#m') IS NOT NULL
    DROP TABLE #m
create table #m (ContactID varchar(64), PacID varchar(100), AdvanceID varchar(50), EmailAddress varchar(254), AcctOrder int) -- multiple ContactID records, look up most recent order date

insert into #m (ContactID, PacID, AdvanceID, EmailAddress, AcctOrder)
select distinct a.ContactID, a.PacID, AdvanceID, EmailAddress, 
	rank() over (partition by a.ContactID order by case when o.TYPE = 'SH' then '1901-01-01' when o.DT is null then '1901-01-02' else o.DT end desc, cast(a.PacID as bigint) desc ) as AcctOrder
from #head a left join 
(
	select distinct o.CUSTOMER as PacID, c.[TYPE], MAX( [I_DATE]) as DT
	FROM (select distinct PacID from #head where PacID not in (select PacID from #s)) h LEFT join 
		ASU.dbo.TK_Customer c WITH (NOLOCK) on h.PacID = c.Customer  
	LEFT JOIN 	
		(select oo.CUSTOMER, oo.I_DATE from ASU.dbo.TK_ODet oo WITH (NOLOCK)
		 inner join ASU.dbo.TK_Customer cc WITH (NOLOCK) on oo.CUSTOMER = cc.CUSTOMER 
		 where cc.[TYPE] <> 'SH') o on o.CUSTOMER = c.CUSTOMER
	GROUP BY o.CUSTOMER, c.[TYPE]
) o on a.PacID = o.PacID
where ContactID not in (select ContactID from #s)
order by a.ContactID

create clustered index IDX_ContactID_Multi on #m(ContactID)

IF OBJECT_ID('tempdb..#c') IS NOT NULL
    DROP TABLE #c
create table #c (ContactID varchar(64), PacID varchar(100), AdvanceID varchar(50), EmailAddress varchar(254), PacPrimary varchar(50)) -- clean up multiple ContactID records, assign Primary Pac ID

insert into #c (ContactID, AdvanceID, EmailAddress, PacPrimary, PacID)
select distinct main.ContactID, AdvanceID, EmailAddress, p.PacID as PacPrimary,
STUFF(( select ' | ' + sub.PacID AS [text()]
	from (select distinct ContactID, PacID from #m) sub
	where sub.ContactID = main.ContactID
	order by AcctOrder, ContactID 
	for xml path ('')
	) , 1, 3, '') PacID
	from #m main
inner join
(
select distinct sub.PacID
from #m sub
where sub.AcctOrder = 1 
) p on p.PacID = main.PacID
order by PacPrimary

create clustered index IDX_PacID_Multis on #c(PacPrimary)
--select top 100 * from #c  where contactID = '000A87B8-E358-4AF3-81EA-3C2E0B93CF64'

/*
IF OBJECT_ID('tempdb..#a') IS NOT NULL
    DROP TABLE #a
create table #a (ContactID varchar(64), PacID varchar(100), AdvanceID varchar(50), EmailAddress varchar(254), 
PacCreateDate datetime, FirstName varchar(100), LastName varchar(100), 
City varchar(200), [State] varchar(200), ZipCode varchar(25), 
CustomerType varchar(10), RecordStatus varchar(10), 
Gender varchar(1), Age int, BirthDate datetime,
PrimaryRecordType varchar(50), Advance_OtherID_Type varchar(50),
PriorityPoints_Cumulative float, PriorityPoints_Consecutive float, PriorityPoints_SeasonTickets float,	
PriorityPoints_LetterWinner float, PriorityPoints_Misc float, PriorityPointsTotal float, PriorityPoints_Rank int, 
Active_SDC_Member bit, Current_SDC_MemberLevel varchar(40), JoinDate datetime) -- all records


--Join Advance Information on PacID
insert into #a (ContactID, PacID, AdvanceID, EmailAddress, PacCreateDate, FirstName, LastName, City, [State], ZipCode, CustomerType, RecordStatus, Gender, Age, BirthDate,
		PrimaryRecordType, Advance_OtherID_Type, PriorityPoints_Cumulative, PriorityPoints_Consecutive, PriorityPoints_SeasonTickets,	
		PriorityPoints_LetterWinner, PriorityPoints_Misc, PriorityPointsTotal, PriorityPoints_Rank, Active_SDC_Member, Current_SDC_MemberLevel, JoinDate) 
*/





IF OBJECT_ID('tempdb..#sdj') IS NOT NULL
    DROP TABLE #sdj
create table #sdj (EmailAddress varchar(254),  PacID varchar(100), AdvanceID varchar(50), 
FirstName varchar(100), LastName varchar(100), 
City varchar(200), [State] varchar(200), ZipCode varchar(25), 
Gender varchar(1), Age int, BirthDate datetime,
PrimaryRecordType varchar(50), RecordTypes varchar(50), Advance_OtherID_Type varchar(50),
PriorityPoints_Cumulative float, PriorityPoints_Consecutive float, PriorityPoints_SeasonTickets float,	
PriorityPoints_LetterWinner float, PriorityPoints_Misc float, PriorityPointsTotal float, PriorityPoints_Rank int, 
Active_SDC_Member bit, Current_SDC_MemberLevel varchar(40))

insert into #sdj (EmailAddress, PacID, AdvanceID, FirstName, LastName, City, [State], ZipCode, Gender, Age, BirthDate,
		PrimaryRecordType, RecordTypes, Advance_OtherID_Type, PriorityPoints_Cumulative, PriorityPoints_Consecutive, PriorityPoints_SeasonTickets,	
		PriorityPoints_LetterWinner, PriorityPoints_Misc, PriorityPointsTotal, PriorityPoints_Rank, Active_SDC_Member, Current_SDC_MemberLevel) 


select distinct			(case when b.PRIMARY_EMAIL not like '%@%' then null else b.PRIMARY_EMAIL end) as EmailAddress,
						--Contact GUID as ContactID,
						i.OTHER_ID as PacID, 
						i.ID_NUMBER as AdvanceID,
						b.FIRST_NAME as FirstName,
						b.LAST_NAME as LastName,
						b.PREF_CITY as City,
						b.PREF_STATE_CODE as [State],
						b.PREF_SHORT_ZIP as ZipCode,
						b.GENDER_CODE as Gender,
						b.AGE as Age,
						b.BIRTH_DATE as BirthDate,
						--CustomerType
						b.RECORD_TYPE_DESC as PrimaryRecordType,
						b.RECORD_TYPE_DESC as RecordTypes,
						i.TYPE_CODE as Advance_OtherID_Type,
						pp.CONTIBUTIONS_POINTS as PriorityPoints_Cumulative,    --?
						pp.SUN_DEVIL_CLUB_POINTS as PriorityPoints_Consecutive, --?
						pp.SEASON_TICKET_POINTS as PriorityPoints_SeasonTickets,
						pp.LETTER_WINNER_POINTS as PriorityPoints_LetterWinner,
						pp.MISC_ADJUSTMENT_POINTS as PriorityPoints_Misc,
						pp.TOTAL_POINTS as PriorityPointsTotal,
						pp.RANKING as PriorityPoints_Rank,
						case when g.GIFT_CLUB_ID_NUMBER is not null then 1 else 0 end as Active_SDC_Member,
						g.GIFT_CLUB_DESC as Current_SDC_MemberLevel
					from ASU.dbo.FD_SDA_ENTITY_BIOGRAPHIC b
					inner join ASU.dbo.FD_SDA_ENTITY_OTHER_IDS i on b.ID_NUMBER = i.ID_NUMBER 
					left join ASU.dbo.FD_SDA_PRIORITY_POINT_SUMMARY pp on pp.PACIOLAN_ID = i.OTHER_ID
					left join ASU.dbo.FD_SDC_GIFT_CLUBS g on g.GIFT_CLUB_ID_NUMBER = i.ID_NUMBER and  GIFT_CLUB_STATUS = 'A'
					where i.TYPE_CODE = 'SDJ'






IF OBJECT_ID('tempdb..#f') IS NOT NULL
    DROP TABLE #f
create table #f (ContactID varchar(64), PacID varchar(100), PacPrimary varchar(100), AdvanceID varchar(50), EmailAddress varchar(254), 
PacCreateDate datetime, FirstName varchar(100), LastName varchar(100), 
City varchar(200), [State] varchar(200), ZipCode varchar(25), 
CustomerType varchar(10), RecordStatus varchar(10), 
Gender varchar(1), Age int, BirthDate datetime,
PrimaryRecordType varchar(50), RecordTypes varchar(50), Advance_OtherID_Type varchar(50),
PriorityPoints_Cumulative float, PriorityPoints_Consecutive float, PriorityPoints_SeasonTickets float,	
PriorityPoints_LetterWinner float, PriorityPoints_Misc float, PriorityPointsTotal float, PriorityPoints_Rank int, 
Active_SDC_Member bit, Current_SDC_MemberLevel varchar(40), JoinDate datetime) -- all records

INSERT INTO #f (ContactID, PacID, PacPrimary, AdvanceID, EmailAddress, PacCreateDate, FirstName, LastName, City, [State], ZipCode, CustomerType, RecordStatus, Gender, Age, BirthDate,
		PrimaryRecordType, RecordTypes, Advance_OtherID_Type, PriorityPoints_Cumulative, PriorityPoints_Consecutive, PriorityPoints_SeasonTickets,	
		PriorityPoints_LetterWinner, PriorityPoints_Misc, PriorityPointsTotal, PriorityPoints_Rank, Active_SDC_Member, Current_SDC_MemberLevel, JoinDate) 

SELECT x.ContactID, x.PacID, x.PacPrimary, x.AdvanceID, x.EmailAddress, a.PacCreateDate,
a.FirstName, a.LastName, a.City, a.[State], a.ZipCode, 
a.CustomerType, a.RecordStatus, 
a.Gender, a.Age, a.BirthDate, 
a.PrimaryRecordType, a.PrimaryRecordType AS RecordTypes --Didn't see this field
, a.Advance_OtherID_Type, 
a.PriorityPoints_Cumulative, a.PriorityPoints_Consecutive, 
a.PriorityPoints_SeasonTickets, a.PriorityPoints_LetterWinner, a.PriorityPoints_Misc, 
a.PriorityPointsTotal, a.PriorityPoints_Rank,
a.Active_SDC_Member, a.Current_SDC_MemberLevel, a.PacCreateDate AS JoinDate
FROM 
(SELECT  s.EmailAddress , s.ContactID, s.PacID, s.PacID AS PacPrimary, s.AdvanceID
FROM #s s
UNION
SELECT DISTINCT ST2.EmailAddress, ST2.ContactID, ST2.PacID, ST2.PacPrimary,
            STUFF((
                SELECT ' | ' + ST1.AdvanceID  AS [text()]
                FROM #c ST1
                WHERE ST1.EmailAddress IS NOT NULL AND ST1.AdvanceID IS NOT NULL AND ST1.ContactID = ST2.ContactID
                ORDER BY ST1.ContactID
                FOR XML PATH ('')
            ),1,3,'') AS AdvIDs
        FROM #c ST2 
		WHERE ST2.EmailAddress IS NOT NULL 
) x INNER JOIN
				(
				SELECT DISTINCT t.PacID, 
						t.PacCreateDate, t.FirstName, t.LastName, t.City, t.[State], t.ZipCode,
						t.CustomerType, t.RecordStatus,
						a.Gender, a.Age, a.BirthDate, a.PrimaryRecordType, a.Advance_OtherID_Type,	
						a.PriorityPoints_Cumulative, a.PriorityPoints_Consecutive, a.PriorityPoints_SeasonTickets,	
						a.PriorityPoints_LetterWinner, a.PriorityPoints_Misc, a.PriorityPointsTotal, a.PriorityPoints_Rank,
						a.Active_SDC_Member, a.Current_SDC_MemberLevel --PacCreateDate --> use as Join Date?
				FROM
					(SELECT Patron AS PacID, 
					PacCreateDate,
					CD_FirstName AS FirstName,
					CD_LastName AS LastName,
					CD_PrimaryAddressCity AS City,
					CD_PrimaryAddressState AS [State],
					CD_PrimaryAddressZipCode AS ZipCode,
					t.[Status] AS RecordStatus,
					t.[Type] AS CustomerType
					FROM dbo.Patron__c p INNER JOIN
					ASU.dbo.TK_Customer t WITH (NOLOCK) ON p.Patron = t.Customer
					) t 
				LEFT JOIN 
					(SELECT DISTINCT i.OTHER_ID AS PacID, 
						b.GENDER_CODE AS Gender,
						b.AGE AS Age,
						b.BIRTH_DATE AS BirthDate,
						b.RECORD_TYPE_DESC AS PrimaryRecordType,
						i.TYPE_CODE AS Advance_OtherID_Type,
						pp.CONTIBUTIONS_POINTS AS PriorityPoints_Cumulative,    --?
						pp.SUN_DEVIL_CLUB_POINTS AS PriorityPoints_Consecutive, --?
						pp.SEASON_TICKET_POINTS AS PriorityPoints_SeasonTickets,
						pp.LETTER_WINNER_POINTS AS PriorityPoints_LetterWinner,
						pp.MISC_ADJUSTMENT_POINTS AS PriorityPoints_Misc,
						pp.TOTAL_POINTS AS PriorityPointsTotal,
						pp.RANKING AS PriorityPoints_Rank,
						CASE WHEN g.GIFT_CLUB_ID_NUMBER IS NOT NULL THEN 1 ELSE 0 END AS Active_SDC_Member,
						g.GIFT_CLUB_DESC AS Current_SDC_MemberLevel
					FROM ASU.dbo.FD_SDA_ENTITY_BIOGRAPHIC b WITH (NOLOCK)
					INNER JOIN ASU.dbo.FD_SDA_ENTITY_OTHER_IDS i WITH (NOLOCK) ON b.ID_NUMBER = i.ID_NUMBER 
					LEFT JOIN ASU.dbo.FD_SDA_PRIORITY_POINT_SUMMARY pp WITH (NOLOCK) ON pp.PACIOLAN_ID = i.OTHER_ID
					LEFT JOIN ASU.dbo.FD_SDC_GIFT_CLUBS g WITH (NOLOCK) ON g.GIFT_CLUB_ID_NUMBER = i.ID_NUMBER AND  GIFT_CLUB_STATUS = 'A'
					WHERE i.TYPE_CODE = 'SDP' --SDJ added later
					) a ON t.PacID = a.PacID

) a ON x.PacPrimary = a.PacID
--order by ContactID


--select top 100 * from #f


SELECT 
f.EmailAddress, f.ContactID, f.PacPrimary, 
	f.PacID, f.AdvanceID, 
f.FirstName, f.LastName, f.City, f.[State], f.ZipCode, 
f.Gender, f.Age, f.BirthDate, f.CustomerType, 
f.PrimaryRecordType, f.PrimaryRecordType AS RecordTypes --Didn't see this field
, f.RecordStatus, f.Advance_OtherID_Type, 
f.PriorityPoints_Cumulative, f.PriorityPoints_Consecutive, 
f.PriorityPoints_SeasonTickets, f.PriorityPoints_LetterWinner, f.PriorityPoints_Misc, 
f.PriorityPointsTotal, f.PriorityPoints_Rank,
f.Active_SDC_Member, f.Current_SDC_MemberLevel, f.PacCreateDate AS JoinDate
FROM #f f

UNION ALL

SELECT 
sdj.EmailAddress, x.ContactID, x.PacPrimary, 
	x.PacID, sdj.AdvanceID, 
sdj.FirstName, sdj.LastName, sdj.City, sdj.[State], sdj.ZipCode, 
sdj.Gender, sdj.Age, sdj.BirthDate, x.CustomerType, 
sdj.PrimaryRecordType, sdj.PrimaryRecordType AS RecordTypes --Didn't see this field
, x.RecordStatus, sdj.Advance_OtherID_Type, 
sdj.PriorityPoints_Cumulative, sdj.PriorityPoints_Consecutive, 
sdj.PriorityPoints_SeasonTickets, sdj.PriorityPoints_LetterWinner, sdj.PriorityPoints_Misc, 
sdj.PriorityPointsTotal, sdj.PriorityPoints_Rank,
sdj.Active_SDC_Member, sdj.Current_SDC_MemberLevel, x.PacCreateDate AS JoinDate
FROM #sdj sdj
INNER JOIN
(SELECT  f.ContactID, f.PacID, f.PacID AS PacPrimary, f.CustomerType, f.RecordStatus, f.PacCreateDate
FROM #f f
) x ON sdj.PacID = x.PacPrimary

ORDER BY ContactID
END



GO
