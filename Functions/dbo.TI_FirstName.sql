SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[TI_FirstName] (@Name nvarchar (Max))  

Returns nvarchar(Max) 

Begin 
 
set @Name =  Case When @Name like '%,%' and (len(@Name) - charindex (',',@Name) ) <> 0
Then right(@Name,(len(@Name) - charindex (',',@Name) ) - 1 ) Else  @Name End

Return @Name 

End 


/*
Old code - changed 3/15/2016

Begin 
 


set @Name =  Case When @Name like '%,%' Then right(@Name,(len(@Name) - charindex (',',@Name) ) - 1 ) Else  @Name End

Return @Name 

End 
*/


GO
