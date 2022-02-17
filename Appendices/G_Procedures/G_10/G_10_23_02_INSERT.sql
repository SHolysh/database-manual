
--***** G_10_23_02

--***** Insert the data into the appropriate tables

-- R_BH_DRILLER_CODE
--***** As of 20200721, this has been moved to be part of the checks statements

-- 2016.05.31
-- 2017.09.05
-- 2018.05.30 15 rows
-- v20190509 
-- v20200721 21 rows

-- D_LOCATION

select
[LOC_ID]
,[LOC_NAME]
,[LOC_NAME_ALT1]
,[LOC_TYPE_CODE]
,[LOC_ORIGINAL_NAME]
,[LOC_MASTER_LOC_ID]
,[LOC_COORD_EASTING]
,[LOC_COORD_NORTHING]
,[LOC_COORD_EASTING_OUOM]
,[LOC_COORD_NORTHING_OUOM]
,[LOC_COORD_OUOM_CODE]
,[LOC_COUNTY_CODE]
,[LOC_TOWNSHIP_CODE]
,[LOC_STATUS_CODE]
,[LOC_START_DATE]
,[SITE_ID]
,[LOC_CONFIDENTIALITY_CODE]
,[LOC_DATA_SOURCE_CODE]
,[LOC_CON]
,[LOC_LOT]
,[LOC_ADDRESS_INFO1]
,[LOC_ADDRESS_CTY]
,[LOC_MOE_USE_1ST_CODE]
,[LOC_MOE_USE_2ND_CODE]
,[DATA_ID]
from 
MOE_20210119.[dbo].[M_D_LOCATION]

insert into [OAK_20160831_MASTER].dbo.D_LOCATION
(
[LOC_ID]
,[LOC_NAME]
,[LOC_NAME_ALT1]
,[LOC_TYPE_CODE]
,[LOC_ORIGINAL_NAME]
,[LOC_MASTER_LOC_ID]
,[LOC_COORD_EASTING]
,[LOC_COORD_NORTHING]
,[LOC_COORD_EASTING_OUOM]
,[LOC_COORD_NORTHING_OUOM]
,[LOC_COORD_OUOM_CODE]
,[LOC_COUNTY_CODE]
,[LOC_TOWNSHIP_CODE]
,[LOC_STATUS_CODE]
,[LOC_START_DATE]
,[SITE_ID]
,[LOC_CONFIDENTIALITY_CODE]
,[LOC_DATA_SOURCE_CODE]
,[LOC_CON]
,[LOC_LOT]
,[LOC_ADDRESS_INFO1]
,[LOC_ADDRESS_CITY]
,[LOC_MOE_USE_1ST_CODE]
,[LOC_MOE_USE_2ND_CODE]
,[DATA_ID]
)
select
[LOC_ID]
,[LOC_NAME]
,[LOC_NAME_ALT1]
,[LOC_TYPE_CODE]
,[LOC_ORIGINAL_NAME]
,[LOC_MASTER_LOC_ID]
,[LOC_COORD_EASTING]
,[LOC_COORD_NORTHING]
,[LOC_COORD_EASTING_OUOM]
,[LOC_COORD_NORTHING_OUOM]
,[LOC_COORD_OUOM_CODE]
,[LOC_COUNTY_CODE]
,[LOC_TOWNSHIP_CODE]
,[LOC_STATUS_CODE]
,[LOC_START_DATE]
,[SITE_ID]
,[LOC_CONFIDENTIALITY_CODE]
,[LOC_DATA_SOURCE_CODE]
,[LOC_CON]
,[LOC_LOT]
,[LOC_ADDRESS_INFO1]
,[LOC_ADDRESS_CTY]
,[LOC_MOE_USE_1ST_CODE]
,[LOC_MOE_USE_2ND_CODE]
,[DATA_ID]
from 
MOE_20210119.[dbo].[M_D_LOCATION]


-- D_BOREHOLE

SELECT 
[BH_ID]
,[LOC_ID]
,[BH_GND_ELEV]
,[BH_GND_ELEV_OUOM]
,[BH_GND_ELEV_UNIT_OUOM]
,[BH_DEM_GND_ELEV]
,[BH_BOTTOM_ELEV]
,[BH_BOTTOM_DEPTH]
,[BH_BOTTOM_OUOM]
,[BH_BOTTOM_UNIT_OUOM]
,[BH_DRILL_METHOD_CODE]
,[BH_DRILLER_CODE]
,[BH_DRILL_END_DATE]
,[BH_STATUS_CODE]
,[BH_DIP]
,[BH_AZIMUTH]
,[BH_DIAMETER_OUOM]
,[BH_DIAMETER_UNIT_OUOM]
,[MOE_BH_GEOLOGY_CLASS]
,BH_COMMENT
FROM 
MOE_20210119.[dbo].[M_D_BOREHOLE]

insert into [OAK_20160831_MASTER].dbo.D_BOREHOLE
(
[BH_ID]
,[LOC_ID]
,[BH_GND_ELEV]
,[BH_GND_ELEV_OUOM]
,[BH_GND_ELEV_UNIT_OUOM]
,[BH_DEM_GND_ELEV]
,[BH_BOTTOM_ELEV]
,[BH_BOTTOM_DEPTH]
,[BH_BOTTOM_OUOM]
,[BH_BOTTOM_UNIT_OUOM]
,[BH_DRILL_METHOD_CODE]
,[BH_DRILLER_CODE]
,[BH_DRILL_END_DATE]
,[BH_STATUS_CODE]
,[BH_DIP]
,[BH_AZIMUTH]
,[BH_DIAMETER_OUOM]
,[BH_DIAMETER_UNIT_OUOM]
,[MOE_BH_GEOLOGY_CLASS]
,BH_COMMENT
)
SELECT 
[BH_ID]
,[LOC_ID]
,[BH_GND_ELEV]
,[BH_GND_ELEV_OUOM]
,[BH_GND_ELEV_UNIT_OUOM]
,[BH_DEM_GND_ELEV]
,[BH_BOTTOM_ELEV]
,[BH_BOTTOM_DEPTH]
,[BH_BOTTOM_OUOM]
,[BH_BOTTOM_UNIT_OUOM]
,[BH_DRILL_METHOD_CODE]
,[BH_DRILLER_CODE]
,[BH_DRILL_END_DATE]
,[BH_STATUS_CODE]
,[BH_DIP]
,[BH_AZIMUTH]
,[BH_DIAMETER_OUOM]
,[BH_DIAMETER_UNIT_OUOM]
,[MOE_BH_GEOLOGY_CLASS]
,BH_COMMENT
FROM 
MOE_20210119.[dbo].[M_D_BOREHOLE]


-- D_BOREHOLE_CONSTRUCTION

SELECT 
[BH_ID]
,[CON_SUBTYPE_CODE]
,[CON_TOP_OUOM]
,[CON_BOT_OUOM]
,[CON_UNIT_OUOM]
,[CON_DIAMETER_OUOM]
,[CON_DIAMETER_UNIT_OUOM]
,[CON_COMMENT]
,[SYS_RECORD_ID]
FROM 
MOE_20210119.[dbo].[M_D_BOREHOLE_CONSTRUCTION]

insert into [OAK_20160831_MASTER].dbo.D_BOREHOLE_CONSTRUCTION
(
[BH_ID]
,[CON_SUBTYPE_CODE]
,[CON_TOP_OUOM]
,[CON_BOT_OUOM]
,[CON_UNIT_OUOM]
,[CON_DIAMETER_OUOM]
,[CON_DIAMETER_UNIT_OUOM]
,[CON_COMMENT]
,[SYS_RECORD_ID]
)
SELECT 
[BH_ID]
,[CON_SUBTYPE_CODE]
,[CON_TOP_OUOM]
,[CON_BOT_OUOM]
,[CON_UNIT_OUOM]
,[CON_DIAMETER_OUOM]
,[CON_DIAMETER_UNIT_OUOM]
,[CON_COMMENT]
,[SYS_RECORD_ID]
FROM 
MOE_20210119.[dbo].[M_D_BOREHOLE_CONSTRUCTION]



-- D_GEOLOGY_FEATURE

SELECT
[LOC_ID]
,[FEATURE_CODE]
,[FEATURE_DESCRIPTION]
,[FEATURE_TOP_OUOM]
,[FEATURE_UNIT_OUOM]
,[SYS_RECORD_ID] as FEATURE_ID
FROM 
MOE_20210119.[dbo].[M_D_GEOLOGY_FEATURE]

insert into [OAK_20160831_MASTER].dbo.D_GEOLOGY_FEATURE
(
[LOC_ID]
,[FEATURE_CODE]
,[FEATURE_DESCRIPTION]
,[FEATURE_TOP_OUOM]
,[FEATURE_UNIT_OUOM]
,FEATURE_ID
)
SELECT
[LOC_ID]
,[FEATURE_CODE]
,[FEATURE_DESCRIPTION]
,[FEATURE_TOP_OUOM]
,[FEATURE_UNIT_OUOM]
,[SYS_RECORD_ID] as FEATURE_ID
FROM 
MOE_20210119.[dbo].[M_D_GEOLOGY_FEATURE]



-- D_GEOLOGY_LAYER

SELECT 
[LOC_ID]
,[GEOL_MAT_COLOUR_CODE]
,[GEOL_TOP_OUOM]
,[GEOL_BOT_OUOM]
,[GEOL_UNIT_OUOM]
,[GEOL_MOE_LAYER]
,[GEOL_MAT1_CODE]
,[GEOL_MAT2_CODE]
,[GEOL_MAT3_CODE]
,[GEOL_COMMENT]
,[SYS_RECORD_ID] as GEOL_ID
FROM 
MOE_20210119.[dbo].[M_D_GEOLOGY_LAYER]


insert into [OAK_20160831_MASTER].dbo.D_GEOLOGY_LAYER
(
[LOC_ID]
,[GEOL_MAT_COLOUR_CODE]
,[GEOL_TOP_OUOM]
,[GEOL_BOT_OUOM]
,[GEOL_UNIT_OUOM]
,[GEOL_MOE_LAYER]
,[GEOL_MAT1_CODE]
,[GEOL_MAT2_CODE]
,[GEOL_MAT3_CODE]
,[GEOL_COMMENT]
,GEOL_ID
)
SELECT 
[LOC_ID]
,[GEOL_MAT_COLOUR_CODE]
,[GEOL_TOP_OUOM]
,[GEOL_BOT_OUOM]
,[GEOL_UNIT_OUOM]
,[GEOL_MOE_LAYER]
,[GEOL_MAT1_CODE]
,[GEOL_MAT2_CODE]
,[GEOL_MAT3_CODE]
,[GEOL_COMMENT]
,[SYS_RECORD_ID] as GEOL_ID
FROM 
MOE_20210119.[dbo].[M_D_GEOLOGY_LAYER]



-- D_LOCATION_ALIAS

SELECT 
[LOC_ID]
,[LOC_NAME_ALIAS]
,[LOC_ALIAS_TYPE_CODE]
,[SYS_RECORD_ID]
FROM 
MOE_20210119.[dbo].[M_D_LOCATION_ALIAS]


insert into [OAK_20160831_MASTER].dbo.D_LOCATION_ALIAS 
(
[LOC_ID]
,[LOC_NAME_ALIAS]
,[LOC_ALIAS_TYPE_CODE]
,[SYS_RECORD_ID]
)
SELECT 
[LOC_ID]
,[LOC_NAME_ALIAS]
,[LOC_ALIAS_TYPE_CODE]
,[SYS_RECORD_ID]
FROM 
MOE_20210119.[dbo].[M_D_LOCATION_ALIAS]

-- D_LOCATION_PURPOSE

select
LOC_ID
,PRIMARY_PURPOSE_CODE
,SECONDARY_PURPOSE_CODE
,SYS_RECORD_ID
from 
MOE_20210119.dbo.m_d_location_purpose

insert into oak_20160831_master.dbo.d_location_purpose
(
LOC_ID
,PURPOSE_PRIMARY_CODE
,PURPOSE_SECONDARY_CODE
,SYS_RECORD_ID
)
select
LOC_ID
,PRIMARY_PURPOSE_CODE
,SECONDARY_PURPOSE_CODE
,SYS_RECORD_ID
from 
MOE_20210119.dbo.m_d_location_purpose


-- D_LOCATION_QA

SELECT
[LOC_ID]
,[QA_COORD_CONFIDENCE_CODE]
,[QA_COORD_CONFIDENCE_CODE_ORIG]
,[QA_COORD_METHOD]
,[QA_ELEV_CONFIDENCE_CODE]
--,[QA_ELEV_CONFIDENCE_CODE_ORIG]
FROM MOE_20210119.[dbo].[M_D_LOCATION_QA]


insert into [OAK_20160831_MASTER].dbo.D_LOCATION_QA
(
[LOC_ID]
,[QA_COORD_CONFIDENCE_CODE]
,[QA_COORD_CONFIDENCE_CODE_ORIG]
,[QA_COORD_METHOD]
,[QA_ELEV_CONFIDENCE_CODE]
--,[QA_ELEV_CONFIDENCE_CODE_ORIG]
)
SELECT
[LOC_ID]
,[QA_COORD_CONFIDENCE_CODE]
,[QA_COORD_CONFIDENCE_CODE_ORIG]
,[QA_COORD_METHOD]
,[QA_ELEV_CONFIDENCE_CODE]
--,[QA_ELEV_CONFIDENCE_CODE_ORIG]
FROM MOE_20210119.[dbo].[M_D_LOCATION_QA]


-- D_INTERVAL

SELECT 
[INT_ID]
,[LOC_ID]
,[INT_NAME]
,[INT_NAME_ALT2]
,[INT_TYPE_CODE]
,[INT_START_DATE]
,[INT_CONFIDENTIALITY_CODE]
,[INT_ACTIVE]
,[DATA_ID]
FROM
MOE_20210119.[dbo].[M_D_INTERVAL]

insert into [OAK_20160831_MASTER].dbo.D_INTERVAL
(
[INT_ID]
,[LOC_ID]
,[INT_NAME]
,[INT_NAME_ALT2]
,[INT_TYPE_CODE]
,[INT_START_DATE]
,[INT_CONFIDENTIALITY_CODE]
,[INT_ACTIVE]
,[DATA_ID]
)
SELECT 
[INT_ID]
,[LOC_ID]
,[INT_NAME]
,[INT_NAME_ALT2]
,[INT_TYPE_CODE]
,[INT_START_DATE]
,[INT_CONFIDENTIALITY_CODE]
,[INT_ACTIVE]
,[DATA_ID]
FROM
MOE_20210119.[dbo].[M_D_INTERVAL]



-- D_INTERVAL_MONITOR

SELECT 
[INT_ID]
,[MON_SCREEN_SLOT]
,[MON_SCREEN_MATERIAL]
,[MON_DIAMETER_OUOM]
,[MON_DIAMETER_UNIT_OUOM]
,[MON_TOP_OUOM]
,[MON_BOT_OUOM]
,[MON_UNIT_OUOM]
,[MON_COMMENT]
,[MON_FLOWING]
,[SYS_RECORD_ID] as MON_ID
FROM 
MOE_20210119.[dbo].[M_D_INTERVAL_MONITOR]


insert into [OAK_20160831_MASTER].dbo.D_INTERVAL_MONITOR 
(
[INT_ID]
,[MON_SCREEN_SLOT]
,[MON_SCREEN_MATERIAL]
,[MON_DIAMETER_OUOM]
,[MON_DIAMETER_UNIT_OUOM]
,[MON_TOP_OUOM]
,[MON_BOT_OUOM]
,[MON_UNIT_OUOM]
,[MON_COMMENT]
,[MON_FLOWING]
,MON_ID
)
SELECT 
[INT_ID]
,[MON_SCREEN_SLOT]
,[MON_SCREEN_MATERIAL]
,[MON_DIAMETER_OUOM]
,[MON_DIAMETER_UNIT_OUOM]
,[MON_TOP_OUOM]
,[MON_BOT_OUOM]
,[MON_UNIT_OUOM]
,[MON_COMMENT]
,[MON_FLOWING]
,[SYS_RECORD_ID] as MON_ID
FROM 
MOE_20210119.[dbo].[M_D_INTERVAL_MONITOR]


-- D_INTERVAL_REF_ELEV

SELECT 
[INT_ID]
,[REF_ELEV_START_DATE]
,REF_STICK_UP
,[REF_ELEV]
,[REF_ELEV_OUOM]
,[REF_ELEV_UNIT_OUOM]
,[REF_COMMENT]
,[SYS_RECORD_ID]
,[DATA_ID]
FROM 
MOE_20210119.[dbo].[M_D_INTERVAL_REF_ELEV]

insert into [OAK_20160831_MASTER].dbo.D_INTERVAL_REF_ELEV
(
[INT_ID]
,[REF_ELEV_START_DATE]
,REF_STICK_UP
,[REF_ELEV]
,[REF_ELEV_OUOM]
,[REF_ELEV_UNIT_OUOM]
,[REF_COMMENT]
,[SYS_RECORD_ID]
,[DATA_ID]
)
SELECT 
[INT_ID]
,[REF_ELEV_START_DATE]
,REF_STICK_UP
,[REF_ELEV]
,[REF_ELEV_OUOM]
,[REF_ELEV_UNIT_OUOM]
,[REF_COMMENT]
,[SYS_RECORD_ID]
,[DATA_ID]
FROM 
MOE_20210119.[dbo].[M_D_INTERVAL_REF_ELEV]



-- D_INTERVAL_TEMPORAL_2

SELECT 
[INT_ID]
,[RD_TYPE_CODE]
,[RD_NAME_CODE]
,[RD_DATE]
,[RD_VALUE]
,[UNIT_CODE]
,[RD_NAME_OUOM]
,[RD_VALUE_OUOM]
,[RD_UNIT_OUOM]
,[REC_STATUS_CODE]
,[RD_COMMENT]
,[DATA_ID]
,[SYS_RECORD_ID]
FROM 
MOE_20210119.[dbo].[M_D_INTERVAL_TEMPORAL_2]

insert into [OAK_20160831_MASTER].dbo.D_INTERVAL_TEMPORAL_2
(
[INT_ID]
,[RD_TYPE_CODE]
,[RD_NAME_CODE]
,[RD_DATE]
,[RD_VALUE]
,[UNIT_CODE]
,[RD_NAME_OUOM]
,[RD_VALUE_OUOM]
,[RD_UNIT_OUOM]
,[REC_STATUS_CODE]
,[RD_COMMENT]
,[DATA_ID]
,[SYS_RECORD_ID]
)
SELECT 
[INT_ID]
,[RD_TYPE_CODE]
,[RD_NAME_CODE]
,[RD_DATE]
,[RD_VALUE]
,[UNIT_CODE]
,[RD_NAME_OUOM]
,[RD_VALUE_OUOM]
,[RD_UNIT_OUOM]
,[REC_STATUS_CODE]
,[RD_COMMENT]
,[DATA_ID]
,[SYS_RECORD_ID]
FROM 
MOE_20210119.[dbo].[M_D_INTERVAL_TEMPORAL_2]

select
*
from 
MOE_20210119.[dbo].[M_D_INTERVAL_TEMPORAL_2]
where 
sys_record_id in ( 1001327976 )
--sys_record_id in ( 1001327975, 1001327976 )
--sys_record_id in ( 1000814167, 1000815313, 1000813716 )
--sys_record_id in ( 1000814168, 1000815314, 1000813717 )

select * from oak_20160831_master.dbo.d_interval_temporal_2 where sys_record_id= 1001327977

update MOE_20210119.[dbo].[M_D_INTERVAL_TEMPORAL_2]
set
sys_record_id= 1001327977
where
sys_record_id=  1001327976

update MOE_20210119.[dbo].[M_D_INTERVAL_TEMPORAL_2]
set
sys_record_id= 1001327976
where
int_id= 242605359 and rd_name_code= 628 

select
*
from 
(
select
sys_record_id
,count(*) as rcount
from 
MOE_20210119.[dbo].[M_D_INTERVAL_TEMPORAL_2]
group by
sys_record_id
) as t
where 
t.rcount>1


-- D_PUMPTEST

SELECT 
[PUMP_TEST_ID]
,[INT_ID]
,[PUMPTEST_DATE]
,[PUMPTEST_NAME]
,[REC_PUMP_DEPTH_METERS]
,[REC_PUMP_RATE_IGPM]
,[FLOWING_RATE_IGPM]
,[DATA_ID]
,[PUMPTEST_METHOD_CODE]
,[PUMPTEST_TYPE_CODE]
,[WATER_CLARITY_CODE]
FROM 
MOE_20210119.[dbo].[M_D_PUMPTEST]

insert into [OAK_20160831_MASTER].dbo.D_PUMPTEST
(
[PUMP_TEST_ID]
,[INT_ID]
,[PUMPTEST_DATE]
,[PUMPTEST_NAME]
,[REC_PUMP_DEPTH_METERS]
,[REC_PUMP_RATE_IGPM]
,[FLOWING_RATE_IGPM]
,[DATA_ID]
,[PUMPTEST_METHOD_CODE]
,[PUMPTEST_TYPE_CODE]
,[WATER_CLARITY_CODE]
)
SELECT 
[PUMP_TEST_ID]
,[INT_ID]
,[PUMPTEST_DATE]
,[PUMPTEST_NAME]
,[REC_PUMP_DEPTH_METERS]
,[REC_PUMP_RATE_IGPM]
,[FLOWING_RATE_IGPM]
,[DATA_ID]
,[PUMPTEST_METHOD_CODE]
,[PUMPTEST_TYPE_CODE]
,[WATER_CLARITY_CODE]
FROM 
MOE_20210119.[dbo].[M_D_PUMPTEST]



-- D_PUMPTEST_STEP

SELECT 
[PUMP_TEST_ID]
,[PUMP_RATE]
,[PUMP_RATE_UNITS]
,[PUMP_RATE_OUOM]
,[PUMP_RATE_UNITS_OUOM]
,[PUMP_START]
,[PUMP_END]
,[DATA_ID]
,[SYS_RECORD_ID]
FROM 
MOE_20210119.[dbo].[M_D_PUMPTEST_STEP]

insert into [OAK_20160831_MASTER].dbo.D_PUMPTEST_STEP
(
[PUMP_TEST_ID]
,[PUMP_RATE]
,[PUMP_RATE_UNITS]
,[PUMP_RATE_OUOM]
,[PUMP_RATE_UNITS_OUOM]
,[PUMP_START]
,[PUMP_END]
,[DATA_ID]
,[SYS_RECORD_ID]
)
SELECT 
[PUMP_TEST_ID]
,[PUMP_RATE]
,[PUMP_RATE_UNITS]
,[PUMP_RATE_OUOM]
,[PUMP_RATE_UNITS_OUOM]
,[PUMP_START]
,[PUMP_END]
,[DATA_ID]
,[SYS_RECORD_ID]
FROM 
MOE_20210119.[dbo].[M_D_PUMPTEST_STEP]










