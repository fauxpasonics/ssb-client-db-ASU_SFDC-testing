SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE proc [dbo].[sp_SFMC_Header_old_20161026]
as

begin


IF OBJECT_ID('tempdb..#a') IS NOT NULL
    DROP TABLE #a
create table #a (ContactID varchar(64), PacID varchar(100), AdvanceID varchar(50), EmailAddress varchar(254)) -- all records

IF OBJECT_ID('tempdb..#s') IS NOT NULL
    DROP TABLE #s
create table #s (ContactID varchar(64), PacID varchar(100), AdvanceID varchar(50), EmailAddress varchar(254)) -- single ContactID records

IF OBJECT_ID('tempdb..#m') IS NOT NULL
    DROP TABLE #m
create table #m (ContactID varchar(64), PacID varchar(100), AdvanceID varchar(50), EmailAddress varchar(254)) -- multiple ContactID records

IF OBJECT_ID('tempdb..#c') IS NOT NULL
    DROP TABLE #c
create table #c (ContactID varchar(64), PacID varchar(100), AdvanceID varchar(50), EmailAddress varchar(254)) -- clean up multiple ContactID records

--Temporarily Convert PacIDs from String to Rows
;with tmp(ContactID, PersonEmail, Pac, Patron) as (
select DW_ContactId__c as ContactID, PersonEmail, LEFT(Patron_ID__c, CHARINDEX(',',Patron_ID__c+',')-1),
	STUFF(Patron_ID__c, 1, CHARINDEX(',',Patron_ID__c+','),'')
from dbo.vw_Account --Using CleanData.io Output to get clean emails, originates from Pac:PD_PATRON_PHONE_TYPE
	union all
select ContactId, PersonEmail, LEFT(Patron, CHARINDEX(',',Patron+',')-1),
	STUFF(Patron, 1, CHARINDEX(',',Patron+','),'')
from tmp
where Patron > ''
),
--Join Advance Information on PacID
merged(ContactID, PacID, AdvanceID, EmailAddress) as(
select t.ContactID, t.PacID, a.ID_NUMBER as AdvanceID, 
case when ISNULL(t.PersonEmail,a.AdvEmail) not like '%@%' then null else ISNULL(t.PersonEmail,a.AdvEmail) end as EmailAddress
from
	(select case when ContactID = '00000000-0000-0000-0000-000000000000' then NULL else ContactID end as ContactID,
		PersonEmail, ltrim(rtrim(Pac)) as PacID
	from tmp
	) t 
left join 
	(
	select i.ID_NUMBER, i.OTHER_ID as PacID, isnull(PRIMARY_EMAIL,SPOUSE_EMAIL) as AdvEmail 
	from ASU.dbo.FD_SDA_ENTITY_BIOGRAPHIC b
	inner join ASU.dbo.FD_SDA_ENTITY_OTHER_IDS i on b.ID_NUMBER = i.ID_NUMBER
	where i.TYPE_CODE = 'SDP' --Business Rule: only use SunDevil Primary Records
	) a on t.PacID = a.PacID ) 

--Convert PacIDs back to string, pipe delimited. Singled out multiple ContactIDs for performance

insert into #a (ContactID, PacID, AdvanceID, EmailAddress)
select ContactID, PacID, AdvanceID, EmailAddress 
from merged

insert into #s (ContactID, PacID, AdvanceID, EmailAddress)
select ContactID, PacID, AdvanceID, EmailAddress 
from #a
where ContactID in (select ContactID from #a group by ContactID having count(*) = 1)

insert into #m (ContactID, PacID, AdvanceID, EmailAddress)
select ContactID, PacID, AdvanceID, EmailAddress 
from #a
where ContactID in (select ContactID from #a group by ContactID having count(*) > 1)

insert into #c (ContactID, AdvanceID, EmailAddress, PacID)
Select Main.ContactID, Main.AdvanceID, Main.EmailAddress,
       STUFF(Main.PacIDs,1,3,'') As PacIDs
From
    (
        Select distinct ST2.ContactID, ST2.AdvanceID, ST2.EmailAddress,
            (
                Select ' | ' + ST1.PacID  AS [text()]
                From #m ST1
                Where ST1.ContactID = ST2.ContactID
                ORDER BY ST1.ContactID
                For XML PATH ('')
            ) PacIDs
        From #m ST2
    ) [Main]


select ContactID, PacID, AdvanceID, EmailAddress from #s
union
Select Main.ContactID, Main.PacID,
       STUFF(Main.AdvIDs,1,3,'') As AdvanceIDs, Main.EmailAddress
From
    (
        Select distinct ST2.ContactID, ST2.PacID, ST2.EmailAddress,
            (
                Select ' | ' + ST1.AdvanceID  AS [text()]
                From #c ST1
                Where ST1.EmailAddress is not null and ST1.AdvanceID is not null and ST1.ContactID = ST2.ContactID
                ORDER BY ST1.ContactID
                For XML PATH ('')
            ) AdvIDs
        From #c ST2
		Where ST2.EmailAddress is not null
    ) [Main] 

end
GO
