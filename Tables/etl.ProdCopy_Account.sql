CREATE TABLE [etl].[ProdCopy_Account]
(
[Id] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NULL,
[CreatedById] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModifiedDate] [datetime] NULL,
[LastModifiedById] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SystemModstamp] [datetime] NULL,
[OwnerId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsDeleted] [bit] NULL,
[Patron_ID__c] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MasterRecordId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salutation] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Type] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordTypeId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ParentId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingStreet] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingCity] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingState] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingPostalCode] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingCountry] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingStreet] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingCity] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingState] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingPostalCode] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingCountry] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Fax] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountNumber] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Website] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sic] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Industry] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AnnualRevenue] [float] NULL,
[NumberOfEmployees] [int] NULL,
[Ownership] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TickerSymbol] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rating] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Site] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastActivityDate] [date] NULL,
[PersonContactId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsPersonAccount] [bit] NULL,
[PersonMailingStreet] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonMailingCity] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonMailingState] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonMailingPostalCode] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonMailingCountry] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonOtherStreet] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonOtherCity] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonOtherState] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonOtherPostalCode] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonOtherCountry] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonMobilePhone] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonHomePhone] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonOtherPhone] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonAssistantPhone] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonEmail] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonTitle] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonDepartment] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonAssistantName] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonLeadSource] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonBirthdate] [date] NULL,
[PersonLastCURequestDate] [datetime] NULL,
[PersonLastCUUpdateDate] [datetime] NULL,
[PersonEmailBouncedReason] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonEmailBouncedDate] [datetime] NULL,
[Jigsaw] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[JigsawCompanyId] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountSource] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SicDesc] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__One2OneContact__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__SYSTEMIsIndividual__c] [bit] NULL,
[npe01__FirstDonationDate__c] [date] NULL,
[npe01__LastDonationDate__c] [date] NULL,
[npe01__LifetimeDonationHistory_Amount__c] [float] NULL,
[npe01__LifetimeDonationHistory_Number__c] [float] NULL,
[npe01__SYSTEM_AccountType__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__AverageAmount__c] [float] NULL,
[npo02__FirstCloseDate__c] [date] NULL,
[npo02__LargestAmount__c] [float] NULL,
[npo02__LastCloseDate__c] [date] NULL,
[npo02__LastMembershipAmount__c] [float] NULL,
[npo02__LastMembershipDate__c] [date] NULL,
[npo02__LastMembershipLevel__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__LastMembershipOrigin__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__LastOppAmount__c] [float] NULL,
[npo02__MembershipEndDate__c] [date] NULL,
[npo02__MembershipJoinDate__c] [date] NULL,
[npo02__NumberOfClosedOpps__c] [float] NULL,
[npo02__NumberOfMembershipOpps__c] [float] NULL,
[npo02__OppAmount2YearsAgo__c] [float] NULL,
[npo02__OppAmountLastNDays__c] [float] NULL,
[npo02__OppAmountLastYear__c] [float] NULL,
[npo02__OppAmountThisYear__c] [float] NULL,
[npo02__OppsClosed2YearsAgo__c] [float] NULL,
[npo02__OppsClosedLastNDays__c] [float] NULL,
[npo02__OppsClosedLastYear__c] [float] NULL,
[npo02__OppsClosedThisYear__c] [float] NULL,
[npo02__SmallestAmount__c] [float] NULL,
[npo02__TotalMembershipOppAmount__c] [float] NULL,
[npo02__TotalOppAmount__c] [float] NULL,
[bde__Batch__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Best_Gift_Year_Total__c] [float] NULL,
[npo02__Best_Gift_Year__c] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Account_ID__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Biz_Other_Phone__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Preferred_Name__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reasons_Why_Bought__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Football_Full__c] [bit] NULL,
[Football_Partial__c] [bit] NULL,
[Football_Rookie__c] [bit] NULL,
[MBB_Full__c] [bit] NULL,
[MBB_Partial__c] [bit] NULL,
[MBB_Rookie__c] [bit] NULL,
[WBB_Full__c] [bit] NULL,
[WBB_Partial__c] [bit] NULL,
[WBB_Rookie__c] [bit] NULL,
[Baseball_Full__c] [bit] NULL,
[Baseball_Partial__c] [bit] NULL,
[Baseball_Rookie__c] [bit] NULL,
[Softball_Full__c] [bit] NULL,
[Softball_Rookie__c] [bit] NULL,
[Pitchfork_Pass__c] [bit] NULL,
[Account_Type__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Donor_Warning__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Donor_Flag__c] [bit] NULL,
[Employer__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CLV__c] [float] NULL,
[Soft_Delete__c] [bit] NULL,
[ContactID__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Customer_Type__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Service_Owner__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__AlternateEmail__pc] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__HomeEmail__pc] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Home_Address__pc] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Last_Donation_Date__pc] [date] NULL,
[npe01__Lifetime_Giving_History_Amount__pc] [float] NULL,
[npe01__Organization_Type__pc] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Other_Address__pc] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__PreferredPhone__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Preferred_Email__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Primary_Address_Type__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Private__pc] [bit] NULL,
[npe01__Secondary_Address_Type__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__SystemAccountProcessor__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__WorkEmail__pc] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__WorkPhone__pc] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Work_Address__pc] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Formula_HouseholdMailingAddress__pc] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Formula_HouseholdPhone__pc] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Household__pc] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__SystemHouseholdProcessor__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__AverageAmount__pc] [float] NULL,
[npe01__Type_of_Account__pc] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__FirstCloseDate__pc] [date] NULL,
[npo02__LargestAmount__pc] [float] NULL,
[npo02__LastCloseDateHH__pc] [date] NULL,
[npo02__LastCloseDate__pc] [date] NULL,
[npo02__LastMembershipAmount__pc] [float] NULL,
[npo02__LastMembershipDate__pc] [date] NULL,
[npo02__LastMembershipLevel__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__LastMembershipOrigin__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__LastOppAmount__pc] [float] NULL,
[npo02__MembershipEndDate__pc] [date] NULL,
[npo02__MembershipJoinDate__pc] [date] NULL,
[npo02__NumberOfClosedOpps__pc] [float] NULL,
[npo02__NumberOfMembershipOpps__pc] [float] NULL,
[npo02__OppAmount2YearsAgo__pc] [float] NULL,
[npo02__OppAmountLastNDays__pc] [float] NULL,
[npo02__OppAmountLastYearHH__pc] [float] NULL,
[npo02__OppAmountLastYear__pc] [float] NULL,
[npo02__OppAmountThisYearHH__pc] [float] NULL,
[npo02__OppAmountThisYear__pc] [float] NULL,
[npo02__OppsClosed2YearsAgo__pc] [float] NULL,
[npo02__OppsClosedLastNDays__pc] [float] NULL,
[npo02__OppsClosedLastYear__pc] [float] NULL,
[npo02__OppsClosedThisYear__pc] [float] NULL,
[npo02__SmallestAmount__pc] [float] NULL,
[npo02__TotalMembershipOppAmount__pc] [float] NULL,
[npo02__TotalOppAmount__pc] [float] NULL,
[npo02__Total_Household_Gifts__pc] [float] NULL,
[npo02__Naming_Exclusions__pc] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[bde__Batch__pc] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Best_Gift_Year_Total__pc] [float] NULL,
[npo02__Best_Gift_Year__pc] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Household_Naming_Order__pc] [float] NULL,
[npo02__Soft_Credit_Last_Year__pc] [float] NULL,
[npo02__Soft_Credit_This_Year__pc] [float] NULL,
[npo02__Soft_Credit_Total__pc] [float] NULL,
[npo02__Soft_Credit_Two_Years_Ago__pc] [float] NULL,
[Discretionary_Income_Index__pc] [float] NULL,
[ASU_FB_Rating__pc] [float] NULL,
[ASU_MBB_Rating__pc] [float] NULL,
[Personicx_Cluster_Code__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Personicx_Cluster_Name__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Personicx_Group_Code__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Personicx_Group_Name__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CLV_Contact__pc] [float] NULL,
[Soft_Delete__pc] [bit] NULL,
[Email_2__pc] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Inactive__pc] [bit] NULL,
[ETLLoad] [datetime] NULL CONSTRAINT [DF__ProdCopy___ETLLo__251C81ED] DEFAULT (getdate())
)
GO
