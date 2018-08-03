SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



Create FUNCTION [dbo].[TI_Zip] (@CSZ nvarchar (Max))  

Returns nvarchar(Max) 

Begin 
 


set @CSZ =  Case When @CSZ like '% %' and @csz like '%[0-9]%' Then 

 
  case when @csz like '% %' then right(@csz, (charindex(' ',reverse(@csz))-1)) end    


 Else  '' End

Return @CSZ 

End 

GO
