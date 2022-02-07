
--***** G_10_07_01

--***** extract D_LOCATION_QA equivalent

-- the QA codes match between the MOE and YC databases for both
-- coordinates and elevations; default the QA_ELEV_CONFIDENCE_CODE
-- to 10 (DEM) if the ELEVRC value is not 1

select 
y.BORE_HOLE_ID as LOC_ID
,case 
     when m.UTMRC is null then 9
     else m.UTMRC 
 end 
 as [QA_COORD_CONFIDENCE_CODE]
,case 
     when m.UTMRC is null then 9
     else m.UTMRC 
 end 
 as [QA_COORD_CONFIDENCE_CODE_ORIG]
,m.[LOCATION_METHOD] as [QA_COORD_METHOD]
,case
     when m.ELEVRC=1 then 1
     else 10
 end as [QA_ELEV_CONFIDENCE_CODE]
,m.ELEVRC as [QA_ELEV_CONFIDENCE_CODE_ORIG]
from 
MOE_20210119.dbo.YC_20210119_BH_ID as y
inner join MOE_20210119.dbo.TblBore_Hole as m
on y.BORE_HOLE_ID=m.BORE_HOLE_ID


select 
y.BORE_HOLE_ID as LOC_ID
,case 
     when m.UTMRC is null then 9
     else m.UTMRC 
 end 
 as [QA_COORD_CONFIDENCE_CODE]
,case 
     when m.UTMRC is null then 9
     else m.UTMRC 
 end 
 as [QA_COORD_CONFIDENCE_CODE_ORIG]
,m.[LOCATION_METHOD] as [QA_COORD_METHOD]
,case
     when m.ELEVRC=1 then 1
     else 10
 end as [QA_ELEV_CONFIDENCE_CODE]
,m.ELEVRC as [QA_ELEV_CONFIDENCE_CODE_ORIG]
into MOE_20210119.dbo.M_D_LOCATION_QA
from 
MOE_20210119.dbo.YC_20210119_BH_ID as y
inner join MOE_20210119.dbo.TblBore_Hole as m
on y.BORE_HOLE_ID=m.BORE_HOLE_ID

