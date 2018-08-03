SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE  FUNCTION [dbo].[TI_State] (@CSZ nvarchar (Max))  

Returns nvarchar(Max) 

Begin 
 


set @CSZ =  

 
  case when @csz like '%, __ %' then substring(@csz, (charindex(',', @csz) + 2 ),2)     


 Else  '' End

Return @CSZ 

End 

GO
