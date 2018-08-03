SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [recon].[sp_Output] as
BEGIN

Drop Table recon.SFDC_Output

Create Table recon.SFDC_Output (
UID int identity(1,1) Primary Key,
BucketID int,
Value int,
LastRun datetime default getdate()
)

-- 
INSERT INTO recon.SFDC_Output (BucketID, Value)
Select 1 BucketID, (Select Count(Distinct ContactID) from recon.SFDC_Profile Where Bucket1 = 1) Value

INSERT INTO recon.SFDC_Output (BucketID, Value)
Select 2 BucketID, (Select Count(Distinct ContactID) from recon.SFDC_Profile Where Bucket2 = 1) Value

INSERT INTO recon.SFDC_Output (BucketID, Value)
Select 3 BucketID, (Select Count(Distinct ContactID) from recon.SFDC_Profile Where Bucket3 = 1) Value

INSERT INTO recon.SFDC_Output (BucketID, Value)
Select 4 BucketID, (Select COUNT(Distinct ContactID + CommonID) from recon.SFDC_Profile Where Bucket1 = 1) Value

INSERT INTO recon.SFDC_Output (BucketID, Value)
Select 5 BucketID, (Select COUNT(Distinct ContactID + CommonID) from recon.SFDC_Profile Where Bucket2 = 1) Value

INSERT INTO recon.SFDC_Output (BucketID, Value)
Select 6 BucketID, (Select COUNT(Distinct ContactID + CommonID) from recon.SFDC_Profile Where Bucket3 = 1) Value

INSERT INTO recon.SFDC_Output (BucketID, Value)
Select 7 BucketID, (Select Sum(Bucket7) from recon.SFDC_Profile Where Bucket7 = 1) Value

INSERT INTO recon.SFDC_Output (BucketID, Value)
Select 8 BucketID, (Select Sum(Bucket8) from recon.SFDC_Profile Where Bucket8 = 1) Value

INSERT INTO recon.SFDC_Output (BucketID, Value)
Select 9 BucketID, (Select Sum(Bucket9) from recon.SFDC_Profile Where Bucket9 = 1) Value

INSERT INTO recon.SFDC_Output (BucketID, Value)
Select 10 BucketID, (Select Sum(Bucket10) from recon.SFDC_Profile Where Bucket10 = 1) Value

INSERT INTO recon.SFDC_Output (BucketID, Value)
Select 11 BucketID, (Select Sum(Bucket11) from recon.SFDC_Profile Where Bucket11 = 1) Value

INSERT INTO recon.SFDC_Output (BucketID, Value)
Select 12 BucketID, (Select Sum(Bucket12) from recon.SFDC_Profile Where Bucket12 = 1) Value

INSERT INTO recon.SFDC_Output (BucketID, Value)
Select 13 BucketID, (Select Sum(Bucket13) from recon.SFDC_Profile Where Bucket13 = 1) Value

INSERT INTO recon.SFDC_Output (BucketID, Value)
Select 14 BucketID, (Select Sum(Bucket14) from recon.SFDC_Profile Where Bucket14 = 1) Value

INSERT INTO recon.SFDC_Output (BucketID, Value)
Select 15 BucketID, (Select Count(Distinct ContactID) from recon.SFDC_Profile Where Bucket13 = 1) Value

INSERT INTO recon.SFDC_Output (BucketID, Value)
Select 16 BucketID, (Select Count(Distinct ContactID) From (Select ContactID from recon.SFDC_Profile Where Bucket7 = 1 Group By ContactID Having Count(*) > 1) z) Value

INSERT INTO recon.SFDC_Output (BucketID, Value)
Select 17 BucketID, ISNULL((Select Sum(Bucket17) from recon.SFDC_Profile
							Where Bucket17 = 1 and Bucket3 = 1 and Bucket19 = 1),0) Value

INSERT INTO recon.SFDC_Output (BucketID, Value)
Select 19 BucketID, ISNULL((Select Sum(Bucket17) from recon.SFDC_Profile
							Where Bucket17 = 1 and Bucket19 <> 1 and Bucket3 = 1 and Bucket9 <> 1),0) Value

INSERT INTO recon.SFDC_Output (BucketID, Value)
Select 18 BucketID, ISNULL((Select Sum(Bucket18) from recon.SFDC_Profile 
							Where Bucket18 = 1 and Bucket3 = 1 and Bucket19 <> 1),0) Value

INSERT INTO recon.SFDC_Output (BucketID, Value)
Select 20 BucketID, ISNULL((Select Sum(Bucket18) from recon.SFDC_Profile 
							Where Bucket18 = 1 and Bucket3 = 1 and Bucket19 = 1),0) Value

INSERT INTO recon.SFDC_Output (BucketID, Value)
Select 28 BucketID, (Select Count(Distinct ContactID) From (Select ContactID from recon.SFDC_Profile Where Bucket1 = 1 Group By ContactID Having Count(*) > 1) z) Value

INSERT INTO recon.SFDC_Output (BucketID, Value)
Select 29 BucketID, (Select Sum(Bucket29) from recon.SFDC_Profile Where Bucket29 = 1) Value

Select a.BucketID, b.Name, IsNull(a.Value,0) Value from recon.SFDC_Output a 
inner join recon.zSupport_DimBucket b on a.BucketID = b.BucketID

END
GO
