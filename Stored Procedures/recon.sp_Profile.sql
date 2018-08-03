SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [recon].[sp_Profile]
as
BEGIN
-- Exec [recon].[sp_Profile]
Drop Table recon.SFDC_Profile

--6 seconds
CREATE TABLE recon.SFDC_Profile
(UID int identity(1,1) Primary Key,
SFDC_Account_ID varchar(100)
,CommonID varchar (100)
,ContactID varchar (100)
,Type varchar(100)
,bucket1 int
,bucket2 int
,bucket3 int
,bucket4 int
,bucket5 int
,bucket6 int
,bucket7 int
,bucket8 int
,bucket9 int
,bucket10 int
,bucket11 int
,bucket12 int
,bucket13 int
,bucket14 int
,bucket15 int
, bucket16 int
, bucket17 int
, bucket18 int
,bucket19 int
,bucket20 int
,bucket21 int
,bucket22 int
,bucket23 int
,bucket24 int
,bucket25 int
,bucket26 int
,bucket27 int
,bucket28 int
,bucket29 int
,bucket30 int
)

INSERT INTO recon.SFDC_Profile (SFDC_Account_ID, CommonID, ContactID, Type) 
-- De-normalize the PatronIDs - CSV to Pure Rows
Select Account_ID__c, Patron_ID__c, ContactID__c, 'SFDC' Type from etl.ProdCopy_Account a WITH(NOLOCK)
Where CharIndex(',',Patron_ID__c,1) = 0

Select Account_ID__c, Patron_ID__c, ContactID__c, 'SFDC' Type 
INTO #tmpDenormal
from etl.ProdCopy_Account a WITH(NOLOCK)
Where CharIndex(',',Patron_ID__c,1) > 0

ALTER TABLE #tmpDenormal Add UID int identity(1,1)

-- Select * from #tmpDenormal

DECLARE @Loops int, @Counter int, @MorePatrons bit
DECLARE @Account_ID varchar(100), @OrgPatronID varchar(100), @PatronID varchar(100), @ContactID varchar(100), @Type varchar(100)
DECLARE @CommaPos int

SET @Loops = (Select COUNT(*) FROM #tmpDenormal)
SET @Counter = 1
SET @MorePatrons = 1

WHILE @Loops >= @Counter
BEGIN
SET @Account_ID = (Select Account_ID__c from #tmpDenormal Where UID = @Counter)
SET @OrgPatronID = (Select Patron_ID__c from #tmpDenormal Where UID = @Counter)
SET @ContactID = (Select ContactID__c from #tmpDenormal Where UID = @Counter)
SET @Type = (Select Type from #tmpDenormal Where UID = @Counter)
SET @MorePatrons = 1

	WHILE @MorePatrons > 0
		BEGIN
		SET @CommaPos = CharIndex(',',@OrgPatronID,1)
		SET @PatronID = Left(@OrgPatronID,@CommaPOS-1)
		
		PRINT @CommaPOS
		PRINT @PatronID
		
		INSERT INTO recon.SFDC_Profile (SFDC_Account_ID, CommonID, ContactID, Type) 
		Select @Account_ID, @PatronID, @ContactID, @Type

		SET @OrgPatronID = LTRIM(Right(@OrgPatronID,Len(@OrgPatronID)-@CommaPos))
		SET @CommaPos = IsNull(CharIndex(',',@OrgPatronID,1),0)
		SET @MorePatrons = Case when @CommaPos > 0 then 1 Else 0 END
		PRINT @OrgPatronID
		PRINT @CommaPOS
		PRINT @MorePatrons

		END

SET @Counter = @Counter + 1
PRINT @COUNTER
END

INSERT INTO recon.SFDC_Profile (CommonID, ContactID, Type)
Select Patron, ContactID, 'Source' Type from dbo.Patron__c

-- Count Unique ID that SFDC and Src Share
Update y
SET Bucket3 = 1
-- Select *
from recon.sfdc_Profile y inner join 
(Select a.UID, a.ContactID from recon.SFDC_Profile a
inner join recon.SFDC_Profile b on a.type = 'SFDC' and b.Type = 'Source' and a.ContactID = b.ContactID) z on y.ContactID = z.ContactID

-- Count Unique IDs that are only in SFDC
Update y
SET Bucket1 = 1
from recon.sfdc_Profile y inner join 
(Select SFDC.UID, SFDC.ContactID from recon.SFDC_Profile SFDC
LEFT join recon.SFDC_Profile SRC on SFDC.type = 'SFDC' and SRC.Type = 'Source' and SFDC.ContactID = SRC.ContactID and SFDC.ContactID IS NOT NULL
Where SRC.ContactID IS NULL 
) z on y.UID = z.UID and y.TYPE = 'SFDC'

-- Count Unique IDs that are only in SRC
Update y
SET Bucket2 = 1
from recon.sfdc_Profile y inner join 
(Select SRC.UID, SRC.ContactID from recon.SFDC_Profile SFDC
RIGHT join recon.SFDC_Profile SRC on SFDC.type = 'SFDC' and SRC.Type = 'Source' and SFDC.ContactID = SRC.ContactID
Where SFDC.ContactID IS NULL
) z on y.UID = z.UID and y.TYPE = 'Source'

-- Count Unique SFDC Account IDs that have no Patron ID
Update y
SET Bucket29 = 1
-- Select *
from recon.sfdc_Profile y inner join 
(Select UID, SFDC.SFDC_Account_ID from recon.SFDC_Profile SFDC
Where SFDC.ContactID IS NULL and SFDC.Type = 'SFDC'
) z on y.UID = z.UID and y.TYPE = 'SFDC'

Select Cast(ContactID__c as varchar(100)) SFDC_ID, Cast(SRC.ContactID as varchar(100)) SRC_ID, PersonEmail Email
INTO #tmpEmailDetail
-- Select *
from Etl.ProdCopy_Account SFDC inner join 
dbo.Account SRC on SFDC.PersonEmail = SRC.PersonalEmail
Where SFDC.PersonEmail IS NOT NULL AND SRC.PersonalEmail IS NOT NULL

INSERT INTO #tmpEmailDetail (SRC_ID, Email)
 Select Patron, PersonalEmail
 from src.Patron__c SRC
Where SRC.PersonalEmail IS NOT NULL
and SRC.PersonalEmail Not In (Select EMail from #tmpEmailDetail)

INSERT INTO #tmpEmailDetail (SFDC_ID, Email)
 Select ID, PersonEmail
 from Etl.ProdCopy_Account SFDC 
Where SFDC.PersonEmail IS NOT NULL
and SFDC.PersonEmail Not In (Select EMail from #tmpEmailDetail)

-- DROP TABLE #tmpEmailMatch
-- DROP TABLE #tmpEmailDetail

-- Update E-mail Match from SFDC
Update z
SET Bucket7 = 1
-- Select *
From recon.SFDC_Profile z
inner join #tmpEmailDetail y on z.ContactID = y.SFDC_ID and z.Type = 'SFDC'

-- Update E-mail Match from Source
Update z
SET Bucket7 = 1
-- Select *
From recon.SFDC_Profile z
inner join #tmpEmailDetail y on z.ContactID = y.SRC_ID and z.Type = 'Source'
Where Bucket7 IS NULL

-- Of Criteria (E-mail) account matches, how many are in SFDC today?
Update a
SET Bucket15 = 1
-- Select *
From recon.SFDC_Profile a
inner join #tmpEmailDetail b on a.ContactID = b.SFDC_ID

-- Of Criteria (E-mail) account matches, how many are NOT in SFDC today?
Update a
SET bucket14 = 1
-- Select *
From recon.SFDC_Profile a
INNER join #tmpEmailDetail b on a.ContactID = b.SRC_ID and a.Type = 'Source'
Where b.SFDC_ID IS NULL

-- Of Criteria (E-mail) account matches, how many ARE in SFDC and PAC today?
Update a
SET bucket13 = 1
-- Select *
From recon.SFDC_Profile a
INNER join #tmpEmailDetail b on a.ContactID = b.SRC_ID and a.Type = 'Source'
Where b.SFDC_ID IS NOT NULL

DROP TABLE #tmpEmailDetail

-- No Transaction within the last year = Accounts in both SFDC and SRC
Update a
SET Bucket9 = 1
-- Select *
from recon.SFDC_Profile a inner join 
dbo.Transactions__c trans ON a.CommonID = trans.Patron_ID__c
Where DateDiff(Month,Order_Date__c,GetDate()) > 12
and a.Bucket3 = 1

-- Transaction within the year = Accounts in both SFDC and SRC
Update a
SET Bucket10 = 1
from recon.SFDC_Profile a inner join 
src.Transactions__c trans ON a.CommonID = trans.Patron_ID__c 
Where DateDiff(Month,Order_Date__c,GetDate()) between 0 and 12
and Bucket3 = 1

-- No Transaction within the last year = Accounts in ONLY SRC
Update a
SET Bucket11 = 1
from recon.SFDC_Profile a inner join 
src.Transactions__c trans ON a.CommonID = trans.Patron_ID__c and a.Type = 'Source'
Where DateDiff(Month,Order_Date__c,GetDate()) > 12
and a.Bucket2 = 1

-- Transaction within the year = Accounts in ONLY SRC
Update a
SET Bucket12 = 1
from recon.SFDC_Profile a inner join 
src.Transactions__c trans ON a.CommonID = trans.Patron_ID__c and a.Type = 'Source'
Where DateDiff(Month,Order_Date__c,GetDate()) between 0 and 12
and Bucket2 = 1

Update a
SET Bucket17 = 1
-- Select * 
from recon.SFDC_Profile a inner join 
etl.ProdCopy_Account SFDC on a.CommonID = SFDC.Patron_ID__c
INNER JOIN etl.ProdCopy_RecordType rt on sfdc.RecordTypeId = rt.Id
Where rt.Name = 'Business Account'

Update a
SET Bucket18 = 1
-- Select * 
from recon.SFDC_Profile a inner join 
etl.ProdCopy_Account SFDC on a.CommonID = SFDC.Patron_ID__c
INNER JOIN etl.ProdCopy_RecordType rt on sfdc.RecordTypeId = rt.Id
Where rt.Name = 'Person Account'

-- With Commas = Person Account
update a 
SET Bucket19 = 1
-- Select *
from recon.SFDC_Profile a 
inner join src.Patron__c b on a.CommonID = b.Patron
Where CharIndex(',',b.FullName, 1) > 0

END

GO
