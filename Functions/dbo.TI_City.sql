SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


Create FUNCTION [dbo].[TI_City] (@CSZ nvarchar (Max))  

Returns nvarchar(Max) 

Begin 
 


set @CSZ =  Case When @CSZ like '%,%' Then 

 left(@CSZ,(charindex (',',@CSZ)-1))   


 Else  '' End

Return @CSZ 

End 

GO
