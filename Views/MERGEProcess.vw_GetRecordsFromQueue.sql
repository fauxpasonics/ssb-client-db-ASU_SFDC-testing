SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [MERGEProcess].[vw_GetRecordsFromQueue]
as
SELECT a.ObjectType, a.Master_SFID, a.Slave_SFID, a.MergeDetermination, a.PK_QueueID 
from MERGEProcess.Queue a
Where IsNull(Completed,0) = 0
AND a.MergeDetermination = 'Forced Merge'
GO
