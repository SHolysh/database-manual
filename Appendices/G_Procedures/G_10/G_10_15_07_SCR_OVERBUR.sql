
--***** G_10_15_07

--***** The remainder can be considered to be overburden wells

-- how many locations do not have screen info as yet

-- 2016.05.31 13152 rows
-- 2017.09.05 7041 rows
-- 2018.05.30 4600 rows
-- v20190509 5975 rows
-- v20200721 3759 rows
-- v20210119 8737 rows

select
COUNT(*) as [To_Assign_LOC_IDs]
from 
MOE_20210119.dbo.YC_20210119_BH_ID as ybc
where 
ybc.BORE_HOLE_ID not in
( select distinct(tmp_LOC_ID) from MOE_20210119.dbo.YC_20210119_DINTMON )

-- overburden 1ft/0.3m screen above bottom of hole

-- 2018.05.30 2997 rows 
-- v20190509 1554 rows 
-- v20200721 1818 rows
-- v20210119 4591 rows

select 
ycb.BORE_HOLE_ID as tmp_LOC_ID
,19 as tmp_INT_TYPE_CODE
,(ycb.MAX_DEPTH_M-0.3) as MON_TOP_OUOM
,ycb.MAX_DEPTH_M as MON_BOT_OUOM
,'m' as MON_UNIT_OUOM
,'overburden; assumed screen 0.3m above bottom' as MON_COMMENT
from 
MOE_20210119.dbo.YC_20210119_BH_ID as ycb
where 
ycb.BORE_HOLE_ID not in
( select tmp_LOC_ID from MOE_20210119.dbo.YC_20210119_DINTMON )
and ycb.MAX_DEPTH_M is not null

-- how many do not have a valid maximum depth

-- 2018.05.30 1603 rows
-- v20190509 4421 rows
-- v20200721 1941 rows
-- v20210119 4146 rows

select 
COUNT(*) as Invalid_Max_Depth
from 
MOE_20210119.dbo.YC_20210119_BH_ID as ycb
where 
ycb.BORE_HOLE_ID not in
( select tmp_LOC_ID from MOE_20210119.dbo.YC_20210119_DINTMON )
and ycb.MAX_DEPTH_M is null

-- notice that if the number returned here is less than the total remaining,
-- check that these are because the maximum depth is not known

-- 2016.05.31 8981 rows is less than the total remaining of 15152
-- 2017.09.05 3017 rows is less than the total remaining of 7041
-- 2018.05.30 1603 rows is less than the total remaining of 4600
-- v20190509  4421 rows is less than the total remaining of 5975
-- v20200721  1941 rows is less than the total remaining of 3759
-- v20210119  4146 rows is less than the total remaining of 4591

-- 2016.05.31 4171 locations don't have a bottom depth; 8981+4171=13152; this accounts for all locations
-- 2017.09.05 4024 rows do not have a bottom depth; 3017+4024=7041; this accounts for all locations
-- 2018.05.30 1603 rows do not have a bottom depth; 2997+1603=4600; this accounts for all locations
-- v20190509 4421 rows do not have a bottom depth; 1554+4421=5975; this accounts for all locations
-- v20200721 1941 rows do not have a bottom depth: 1818+1941=3759; this accounts for all locations
-- v20210119 4146 rows do not have a bottom depth; 4146+4591=8737; this accounts for all locations (the later value is the remaining locations without a screen interval)

-- if there is a problem - i.e. the numbers don't match - we'll need to fix it;
-- otherwise apply the results (as is the case here)

insert into MOE_20210119.dbo.YC_20210119_DINTMON
(tmp_LOC_ID,tmp_INT_TYPE_CODE,MON_TOP_OUOM,MON_BOT_OUOM,MON_UNIT_OUOM,MON_COMMENT)
select 
ycb.BORE_HOLE_ID as tmp_LOC_ID
,19 as tmp_INT_TYPE_CODE
,(ycb.MAX_DEPTH_M-0.3) as MON_TOP_OUOM
,ycb.MAX_DEPTH_M as MON_BOT_OUOM
,'m' as MON_UNIT_OUOM
,'overburden; assumed screen 0.3m above bottom' as MON_COMMENT
from 
MOE_20210119.dbo.YC_20210119_BH_ID as ycb
where 
ycb.BORE_HOLE_ID not in
( select tmp_LOC_ID from MOE_20210119.dbo.YC_20210119_DINTMON )
and ycb.MAX_DEPTH_M is not null

-- Checks

select
*
from 
MOE_20210119.dbo.YC_20210119_DINTMON as y
where 
tmp_int_type_code= 19


