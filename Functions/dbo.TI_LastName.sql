SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


Create FUNCTION [dbo].[TI_LastName] (@Name nvarchar (Max))  

Returns nvarchar(Max) 

Begin 
 


set @Name =  Case When @Name like '%,%' Then 

 left(@Name,(charindex (',',@Name)-1))   


 Else  '' End

Return @Name 

End 



GO
