SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [MERGEProcess].[sp_UpdateSFDC_GUIDs]
as

TRUNCATE TABLE MERGEProcess.VerticalDimCust

INSERT INTO MERGEProcess.VerticalDimCust (SSB_CRMSYSTEM_ACCT_ID, SSB_CRMSYSTEM_CONTACT_ID, SFID, DimCustomerID, Master_Flag)
SELECT '' SSB_CRMSYSTEM_ACCT_ID, SSB_CRMSYSTEM_Contact_ID, id SFID, b.Patron_ID__c DimCustomerID
, 0 Master_Flag
--INTO MERGEProcess.VerticalDimCust 
--SELECT * 
FROM MERGEProcess.vw_Account a
INNER JOIN ProdCopy.Account b ON a.SSB_CRMSYSTEM_CONTACT_ID = b.ContactID__c
WHERE 1=1
and CharIndex(',',b.Patron_ID__c,1)= 0
AND b.Patron_ID__c IS NOT NULL

DECLARE @UID INT, @Key NVARCHAR(MAX), @SFID NVARCHAR(18),  @string NVARCHAR(MAX),  @delimiter CHAR(1) , @Counter INT, @MaxCount INT, @Key1 NVARCHAR(MAX)
DECLARE @output TABLE (ACCTID NVARCHAR(MAX), ContactID NVARCHAR(MAX), SFID NVARCHAR(18), splitdata NVARCHAR(MAX) )
DECLARE @HoldingTbl TABLE (UID INT IDENTITY(1,1), SSB_CRMSYSTEM_ACCT_ID NVARCHAR(MAX), SSB_CRMSYSTEM_CONTACT_ID NVARCHAR(MAX), SFID NVARCHAR(18), SSB_DimCust_ID_List NVARCHAR(MAX), Processed bit)

SET @delimiter = ','

-- Identify all DimCust that are concat (include Comma)
INSERT INTO @HoldingTbl
        ( SSB_CRMSYSTEM_ACCT_ID,
		SSB_CRMSYSTEM_CONTACT_ID,
		  sfid ,
          SSB_DimCust_ID_List ,
          Processed
        )
SELECT '' SSB_CRMSYSTEM_Acct_ID__c, a.ContactID__c SSB_CRMSYSTEM_CONTACT_ID__c, id, a.Patron_ID__c, 0 Processed
FROM ProdCopy.Account a
LEFT JOIN (SELECT DISTINCT SSB_CRMSYSTEM_CONTACT_ID FROM MERGEProcess.VerticalDimCust) b ON a.ContactID__c = b.SSB_CRMSYSTEM_CONTACT_ID
WHERE 1=1
AND b.SSB_CRMSYSTEM_CONTACT_ID IS null
and CharIndex(',',a.Patron_ID__c,1) > 0

--SELECT a.SSB_CRMSYSTEM_Contact_ID__c, a.SSB_DimCust_ID_List__c, b.DimCustID_Losers 
--UPDATE a
--SET SSB_DimCust_ID_List__c = b.DimCustID_Losers
--FROM PSPTestMerge.ProdCopy_Contact a
--INNER JOIN PSP_SFDC.dbo.Contact b ON a.SSB_CRMSYSTEM_Contact_ID__c = b.SSB_CRMSYSTEM_CONTACT_ID
--WHERE ISNULL(a.SSB_DimCust_ID_List__c,'a') <> ISNULL(b.DimCustID_Losers,'b')

--SELECT * FROM PSP_SFDC.stg.vwDimCust_NonWinners
--WHERE GUID = '63a8bd7a-4b28-44e3-9ffa-00001e0debd2'
SET @MaxCount = (SELECT COUNT(*) FROM @HoldingTbl)
SET @Counter = 1

WHILE @MaxCount >= @Counter
BEGIN 

SET @Key1 = (SELECT SSB_CRMSYSTEM_ACCT_ID FROM @HoldingTbl WHERE UID = @Counter)
SET @Key = (SELECT SSB_CRMSYSTEM_CONTACT_ID FROM @HoldingTbl WHERE UID = @Counter)
SET @string = (SELECT SSB_DimCust_ID_List FROM @HoldingTbl WHERE UID = @Counter)
SET @SFID = (SELECT SFID FROM @HoldingTbl WHERE UID = @Counter)

    DECLARE @start INT, @end INT 
    SELECT @start = 1, @end = CHARINDEX(@delimiter, @string) 
    WHILE @start < LEN(@string) + 1 BEGIN 
        IF @end = 0  
            SET @end = LEN(@string) + 1
       
        INSERT INTO @output (ACCTID, ContactID, SFID, splitdata)  
        VALUES(@Key1, @Key, @SFID, SUBSTRING(@string, @start, @end - @start)) 
        SET @start = @end + 1 
        SET @end = CHARINDEX(@delimiter, @string, @start)
        
    END 

	SET @Counter = @Counter + 1
	PRINT @Counter
 
END

-- Load all DimCustomerID/GUID into table (change CSV to vertical list)
INSERT INTO MERGEProcess.VerticalDimCust (SSB_CRMSYSTEM_ACCT_ID, SSB_CRMSYSTEM_CONTACT_ID, SFID, DimCustomerID, Master_Flag)
SELECT ACCTID, ContactID, SFID, a.splitdata DimCustomerID
, 0 Master_Flag
FROM @output a

INSERT INTO MERGEProcess.VerticalDimCust (SSB_CRMSYSTEM_ACCT_ID, SSB_CRMSYSTEM_CONTACT_ID, SFID, DimCustomerID, Master_Flag)
SELECT '' SSB_CRMSYSTEM_Acct_ID__c, a.ContactID__c SSB_CRMSYSTEM_CONTACT_ID__c, id, a.Patron_ID__c, 0 Processed
FROM ProdCopy.Account a
LEFT JOIN (SELECT DISTINCT SSB_CRMSYSTEM_CONTACT_ID FROM MERGEProcess.VerticalDimCust) b ON a.ContactID__c = b.SSB_CRMSYSTEM_CONTACT_ID
WHERE 1=1
AND b.SSB_CRMSYSTEM_CONTACT_ID IS null
and CharIndex(',',a.Patron_ID__c,1) = 0 

--SELECT DISTINCT SSB_CRMSYSTEM_CONTACT_ID FROM PSPTestMerge.VerticalPatrons
-- SELECT * FROM MERGEProcess.VerticalPatrons

-- Identify which GUIDs changed
TRUNCATE TABLE MERGEProcess.SFDC_GUIDUpdate

INSERT INTO MERGEProcess.SFDC_GUIDUpdate
SELECT DISTINCT a.SSB_CRMSYSTEM_CONTACT_ID Old_Contact_ID, z.Id SFID, b.ContactId New_Contact_ID
, '' Old_acct_ID--a.SSB_CRMSYSTEM_ACCT_ID Old_Acct_ID
, '' New_Acct_ID --b.SSB_CRMSYSTEM_ACCT_ID New_Acct_ID
-- Select *
FROM MERGEProcess.VerticalDimCust a
INNER JOIN dbo.Patron__c b ON b.Patron = a.DimCustomerID
INNER JOIN ProdCopy.Account z ON a.SSB_CRMSYSTEM_CONTACT_ID = z.ContactID__c
WHERE a.SSB_CRMSYSTEM_CONTACT_ID <> b.ContactId

--TRUNCATE TABLE MERGEProcess.SFDC_Acct_GUIDUpdate

--INSERT INTO MERGEProcess.SFDC_Acct_GUIDUpdate
--SELECT DISTINCT a.SSB_CRMSYSTEM_ACCT_ID Old_Acct_ID, z.Id SFID, b.SSB_CRMSYSTEM_ACCT_ID New_Acct_ID
---- Select *
----INTO MERGEProcess.SFDC_Acct_GUIDUpdate
--FROM MERGEProcess.VerticalDimCust a
--INNER JOIN PSP.dbo.vwDimCustomer_ModAcctId b ON b.DimCustomerId = a.DimCustomerID
--INNER JOIN ProdCopy.Account z ON a.SSB_CRMSYSTEM_ACCT_ID = z.SSB_CRMSYSTEM_ACCT_ID__c
--WHERE a.SSB_CRMSYSTEM_ACCT_ID <> b.SSB_CRMSYSTEM_ACCT_ID

-- CREATE New Instance of ProdCopy
IF EXISTS(SELECT * FROM sys.tables tbl INNER JOIN sys.schemas s ON s.schema_id = tbl.schema_id WHERE tbl.name = 'ProdCopy_Account' AND s.Name = 'MERGEProcess')
BEGIN
DROP TABLE MERGEProcess.ProdCopy_Account
END

SELECT *, CAST(NULL AS DATE) MERGEProcess_Date
, ContactID__c SSB_CRMSYSTEM_Contact_ID
, Patron_ID__c DimCustomerID
INTO MERGEProcess.ProdCopy_Account
FROM ProdCopy.Account

UPDATE a
SET SSB_CRMSYSTEM_CONTACT_ID = b.New_Contact_ID
, MERGEProcess_Date = GETDATE()
FROM MERGEProcess.ProdCopy_Account a
INNER JOIN MERGEProcess.SFDC_GUIDUpdate b ON a.ContactID__c = b.Old_Contact_ID

--UPDATE a
--SET SSB_CRMSYSTEM_Acct_ID__c = b.New_Acct_ID
---- SELECT Distinct a.Id, a.SSB_CRMSYSTEM_Acct_ID__c, b.Old_Acct_id, b.New_Acct_ID
--FROM MERGEProcess.ProdCopy_Contact a 
--INNER JOIN MERGEProcess.SFDC_Acct_GUIDUpdate b ON a.SSB_CRMSYSTEM_Acct_ID__c = b.Old_Acct_ID

--CREATE A VERTICLE WITH UPDATED GUIDs
TRUNCATE TABLE MERGEProcess.VerticalDimCust_Updated

INSERT INTO MERGEProcess.VerticalDimCust_Updated 
SELECT DISTINCT ISNULL(c.New_Acct_ID, a.SSB_CRMSYSTEM_ACCT_ID) SSB_CRMSYSTEM_ACCT_ID, ISNULL(b.New_Contact_ID, a.SSB_CRMSYSTEM_CONTACT_ID) SSB_CRMSYSTEM_CONTACT_ID, a.DimCustomerID, GETDATE() LastUpdated
--INTO MERGEProcess.VerticalDimCust_Updated 
FROM MERGEProcess.VerticalDimCust a
LEFT JOIN MERGEProcess.SFDC_GUIDUpdate b ON a.SSB_CRMSYSTEM_CONTACT_ID = b.Old_Contact_ID
LEFT JOIN MERGEProcess.SFDC_Acct_GUIDUpdate c ON a.SSB_CRMSYSTEM_ACCT_ID = c.Old_Acct_ID

--SELECT * FROM MERGEProcess.SFDC_Account_GUIDUpdate
--WHERE SFAccountID IN (
--SELECT SFAccountID FROM MERGEProcess.SFDC_Account_GUIDUpdate
--GROUP BY SFAccountID
--HAVING COUNT(*) = 1
--)

--SELECT * FROM MergeProcess.SFDC_Account_GUIDUpdate
--WHERE SFAccountID = '0015000000w4epoAAA'

--SELECT * FROM MERGEProcess.VerticalPatrons
--WHERE DW_Contact_ID__c = '130A40C8-2215-4F72-9DC4-9E133CC19721'
GO
