CREATE TABLE [src_Production].[Account_BeforePushtoSalesforce_20161101]
(
[Id] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsDeleted] [bit] NULL,
[MasterRecordId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salutation] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Type] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordTypeId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ParentId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingStreet] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingCity] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingState] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingPostalCode] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingCountry] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingLatitude] [float] NULL,
[BillingLongitude] [float] NULL,
[BillingGeocodeAccuracy] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingAddress] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingStreet] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingCity] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingState] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingPostalCode] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingCountry] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingLatitude] [float] NULL,
[ShippingLongitude] [float] NULL,
[ShippingGeocodeAccuracy] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingAddress] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Fax] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountNumber] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Website] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhotoUrl] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sic] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Industry] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AnnualRevenue] [float] NULL,
[NumberOfEmployees] [int] NULL,
[Ownership] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TickerSymbol] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rating] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Site] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OwnerId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NULL,
[CreatedById] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModifiedDate] [datetime] NULL,
[LastModifiedById] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SystemModstamp] [datetime] NULL,
[LastActivityDate] [date] NULL,
[LastViewedDate] [datetime] NULL,
[LastReferencedDate] [datetime] NULL,
[PersonContactId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsPersonAccount] [bit] NULL,
[PersonMailingStreet] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonMailingCity] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonMailingState] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonMailingPostalCode] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonMailingCountry] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonMailingLatitude] [float] NULL,
[PersonMailingLongitude] [float] NULL,
[PersonMailingGeocodeAccuracy] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonMailingAddress] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonOtherStreet] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonOtherCity] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonOtherState] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonOtherPostalCode] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonOtherCountry] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonOtherLatitude] [float] NULL,
[PersonOtherLongitude] [float] NULL,
[PersonOtherGeocodeAccuracy] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonOtherAddress] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
[Patron_ID__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Full_Account_ID__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
[Temporary_Patron_ID__c] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SDC_Member_Level__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Active__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Agency__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Authorized_Signor__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Export_DateTime__c] [datetime] NULL,
[Sponsorship_Warning__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__BillingContact__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Coordinator__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__CustomerPriority__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__External_Account_ID__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Future_LTV__c] [float] NULL,
[koreps__Industry__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Legal_Name__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__NumberofLocations__c] [float] NULL,
[koreps__Premium_Coordinator__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Premium_Salesperson__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__PrimaryContact__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__SLAExpirationDate__c] [date] NULL,
[koreps__SLASerialNumber__c] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__SLA__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Salesperson__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__SponsorshipIndustry__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__State_Of_Incorporation__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Stripped_Name__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Total_Lifetime_Value__c] [float] NULL,
[koreps__UpsellOpportunity__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__ltvtodate__c] [float] NULL,
[SDC_Rep__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Multiple_Sport_Season_Ticket_Buyer__c] [bit] NULL,
[Turnkey_Net_Worth_Gold__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Turnkey_Discretionary_Income_Index__c] [float] NULL,
[Turnkey_Presence_of_Children__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Turnkey_PersonicX_Cluster__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Turnkey_Football_Priority_Score__c] [float] NULL,
[Turnkey_Football_Capacity_Score__c] [float] NULL,
[koreps__Miles_From_Facility__c] [float] NULL,
[koreps__SyncPriority__c] [float] NULL,
[Turnkey_Basketball_Capacity_Score__c] [float] NULL,
[Turnkey_Baseball_Capacity_Score__c] [float] NULL,
[Turnkey_Basketball_Priority_Score__c] [float] NULL,
[Turnkey_Baseball_Priority_Score__c] [float] NULL,
[Turnkey_Age_Input_Individual__c] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Turnkey_Marital_Status__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
[koreps__FICO_Score__pc] [float] NULL,
[koreps__Disable_Contact_Sync__pc] [bit] NULL,
[ASU_MBB_Rating__pc] [float] NULL,
[koreps__SyncPriority__pc] [float] NULL,
[koreps__Ticketing_Account_Type__pc] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CLV_Contact__pc] [float] NULL,
[Soft_Delete__pc] [bit] NULL,
[PAH_Email__pc] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Inactive__pc] [bit] NULL,
[koreps__Account_Stripped_Name__pc] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Alma_Mater_College__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Archtics_IDs__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Checked_Out_By__pc] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Checked_Out_Until__pc] [date] NULL,
[koreps__Company_Id__pc] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__External_Contact_Id__pc] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Facebook_Page__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Favorite_Arena_Food__pc] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Favorite_Beverage__pc] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Favorite_Music__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Favorite_Opponent__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Favorite_Player__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Favorite_Team_Legend__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Gender__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Grandchildren_Birthday__pc] [date] NULL,
[koreps__Grandchildren_Interests__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Grandchildren_Names__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Grandchildren_Other__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Group_Buyer__pc] [bit] NULL,
[koreps__Group_Category__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Group_Sales_Rep__pc] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Heritage_Nationality__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Highlight_Memory__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Hobbies__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Instagram_Page__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Invalid_Email__pc] [bit] NULL,
[koreps__Kid_s_Interests__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Kids_Birthday__pc] [date] NULL,
[koreps__Kids_Names__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Kids_Other__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Languages__pc] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Level__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Marital_Status__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Method_of_Travel_To_Game__pc] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Mini_Plan_Holder__pc] [bit] NULL,
[koreps__Niece_Nephew_Other_Birthday__pc] [date] NULL,
[koreps__Niece_Nephew_Other_Interests__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Niece_Nephew_Other_Name_s__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Normally_Attends_Games_With__pc] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Number_Of_Kids__pc] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Other_Favorite_Sports_Teams__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Other_Sport_STH__pc] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Override_Checkout_Expiration__pc] [bit] NULL,
[koreps__Photo_Location__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Primary_Archtics_Id__pc] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Season_Ticket_Holder__pc] [bit] NULL,
[koreps__Secondary_Archtics_Name__pc] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Secondary_Email__pc] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Share_Partner__pc] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Share_Partners__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Shirt_Size__pc] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Source__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Spouse_Birthday__pc] [date] NULL,
[koreps__Spouse_Name__pc] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Suite_Buyer__pc] [bit] NULL,
[koreps__Suites_Sales_Rep__pc] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Ticket_Use__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Ticketing_Sales_Rep__pc] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Ticketing_Service_Rep__pc] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Twitter_Handle__pc] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Use_Of_Unused_Tickets__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__kore_milesfromfacility__pc] [float] NULL,
[koreps__kore_ticketingContactType__pc] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Contact_Type__pc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sponsorship_Account__pc] [bit] NULL,
[ETL_CreatedDate] [datetime] NOT NULL
)
GO