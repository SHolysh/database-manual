
--***** G_10_17_01

--***** Build the M_D_INTERVAL_REF_ELEV table from M_D_INTERVAL and
--***** M_D_LOCATION_ELEV

-- note that we're assuming a 0.75m stickup for all MOE wells; note 
-- that we're using a row count for SYS_RECORD_ID

-- v20180530 520 data_id
-- v20190509 521 data_id
-- v20200721 522 
-- v20210119 523

--***** v20210119 Update to include D_LOCATION_SPATIAL_HIST

--***** 20210129 - change this in the next update to use 
--***** M_D_BOREHOLE as a source instead (which will simplify
--***** the script

SELECT 
dint.[INT_ID]
,case
 when dint.INT_START_DATE is not null then dint.INT_START_DATE
 else cast('1867-07-01' as datetime)
 end 
 as REF_ELEV_START_DATE
,cast('0.75' as varchar(50)) as REF_STICK_UP
,(delev.LOC_ELEV+0.75) as [REF_ELEV]
,(delev.LOC_ELEV+0.75) as [REF_ELEV_OUOM]
,cast('masl' as varchar(50)) as REF_ELEV_UNIT_OUOM
,cast('ASSIGNED_ELEV + 0.75m' as varchar(255)) as REF_COMMENT
,row_number() over (order by dint.INT_ID) as SYS_RECORD_ID
,convert(int,523) as [DATA_ID]
FROM 
MOE_20210119.[dbo].[M_D_INTERVAL] as dint
inner join
(
select
dlsh.LOC_ID
,LOC_ELEV
from 
MOE_20210119.dbo.M_D_LOCATION_SPATIAL_HIST as dlsh
where
dlsh.LOC_ELEV_CODE=3
-- Only load the SRTM elev if no MNR elev
union
select
dlsh.LOC_ID
,LOC_ELEV
from 
MOE_20210119.dbo.M_D_LOCATION_SPATIAL_HIST as dlsh
where
dlsh.LOC_ELEV_CODE=5
) as delev
on dint.loc_id=delev.LOC_ID
where 
delev.LOC_ELEV is not null

--SELECT 
--dint.[INT_ID]
--,case
-- when dint.INT_START_DATE is not null then dint.INT_START_DATE
-- else cast('1867-07-01' as datetime)
-- end 
-- as REF_ELEV_START_DATE
--,cast('0.75' as varchar(50)) as REF_STICK_UP
--,(delev.ASSIGNED_ELEV+0.75) as [REF_ELEV]
--,(delev.ASSIGNED_ELEV+0.75) as [REF_ELEV_OUOM]
--,cast('masl' as varchar(50)) as REF_ELEV_UNIT_OUOM
--,cast('ASSIGNED_ELEV + 0.75m' as varchar(255)) as REF_COMMENT
--,row_number() over (order by dint.INT_ID) as SYS_RECORD_ID
--,convert(int,523) as [DATA_ID]
--FROM 
--MOE_20210119.[dbo].[M_D_INTERVAL] as dint
--inner join MOE_20210119.dbo.M_D_LOCATION_ELEV as delev
--on dint.loc_id=delev.LOC_ID
--where 
--delev.ASSIGNED_ELEV is not null

SELECT 
dint.[INT_ID]
,case
 when dint.INT_START_DATE is not null then dint.INT_START_DATE
 else cast('1867-07-01' as datetime)
 end 
 as REF_ELEV_START_DATE
,cast('0.75' as varchar(50)) as REF_STICK_UP
,(delev.LOC_ELEV+0.75) as [REF_ELEV]
,(delev.LOC_ELEV+0.75) as [REF_ELEV_OUOM]
,cast('masl' as varchar(50)) as REF_ELEV_UNIT_OUOM
,cast('ASSIGNED_ELEV + 0.75m' as varchar(255)) as REF_COMMENT
,row_number() over (order by dint.INT_ID) as SYS_RECORD_ID
,convert(int,523) as [DATA_ID]
into MOE_20210119.dbo.M_D_INTERVAL_REF_ELEV
FROM 
MOE_20210119.[dbo].[M_D_INTERVAL] as dint
inner join
(
select
dlsh.LOC_ID
,LOC_ELEV
from 
MOE_20210119.dbo.M_D_LOCATION_SPATIAL_HIST as dlsh
where
dlsh.LOC_ELEV_CODE=3
-- Only load the SRTM elev if no MNR elev
union
select
dlsh.LOC_ID
,LOC_ELEV
from 
MOE_20210119.dbo.M_D_LOCATION_SPATIAL_HIST as dlsh
where
dlsh.LOC_ELEV_CODE=5
) as delev
on dint.loc_id=delev.LOC_ID
where 
delev.LOC_ELEV is not null

--SELECT 
--dint.[INT_ID]
--,case
-- when dint.INT_START_DATE is not null then dint.INT_START_DATE
-- else cast('1867-07-01' as datetime)
-- end 
-- as REF_ELEV_START_DATE
--,cast('0.75' as varchar(50)) as REF_STICK_UP
--,(delev.ASSIGNED_ELEV+0.75) as [REF_ELEV]
--,(delev.ASSIGNED_ELEV+0.75) as [REF_ELEV_OUOM]
--,cast('masl' as varchar(50)) as REF_ELEV_UNIT_OUOM
--,cast('ASSIGNED_ELEV + 0.75m' as varchar(255)) as REF_COMMENT
--,row_number() over (order by dint.INT_ID) as SYS_RECORD_ID
--,convert(int,522) as [DATA_ID]
--into MOE_20210119.dbo.M_D_INTERVAL_REF_ELEV
--FROM 
--MOE_20210119.[dbo].[M_D_INTERVAL] as dint
--inner join MOE_20210119.dbo.M_D_LOCATION_ELEV as delev
--on dint.loc_id=delev.LOC_ID
--where 
--delev.ASSIGNED_ELEV is not null

-- 2017.09.05 17185 rows
-- 2018.05.30 15578 rows
-- v20190509 11851 rows 
-- v20200721 11760 rows

select
count(*)
from 
MOE_20210119.[dbo].m_d_interval_ref_elev





