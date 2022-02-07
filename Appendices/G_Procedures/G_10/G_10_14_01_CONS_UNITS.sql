
--***** G_10_14_01

--***** determine the maximum depth from construction

-- make sure that the units are in m or ft only; we're doing it
-- here as there is multiple inputs into the construction table

-- v20170905 all units m or ft
-- v20180530 25 rows - inch
-- v20190509 0 rows
-- v20200721 9 rows
-- v20210119 

select 
ycb.LOC_ID
,ycb.BH_ID
,ycm.*
from 
MOE_20210119.dbo.YC_20210119_BH_ID as ycb
inner join MOE_20210119.dbo.M_D_BOREHOLE_CONSTRUCTION as ycm
on ycb.BORE_HOLE_ID=ycm.BH_ID
where 
not(ycm.CON_UNIT_OUOM in ('m','ft'))

-- for construction, we're assuming anything that's an inch should be a ft
-- a note is added to CON_COMMENT for this

update MOE_20210119.dbo.M_D_BOREHOLE_CONSTRUCTION
set
 CON_UNIT_OUOM='ft'
,CON_TOP_OUOM=CON_TOP_OUOM/12
,CON_BOT_OUOM=CON_BOT_OUOM/12
,CON_COMMENT='depths original indicated as inch; converted to ft'
where 
CON_UNIT_OUOM='inch'

-- for construction we're assuming anything that's a cm should be m's
-- a note is added to CON_COMMENT for this 

--update [MOE_20160531].dbo.M_D_BOREHOLE_CONSTRUCTION
--set
--CON_UNIT_OUOM='m'
--,CON_COMMENT='depths original indicated as cm; changed to m'
--where 
--CON_UNIT_OUOM='cm'