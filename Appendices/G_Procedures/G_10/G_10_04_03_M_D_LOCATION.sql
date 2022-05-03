
--***** G_10_04_03

--***** extract D_LOCATION equivalent information

-- note that we've found for the 201304 MOE db that using the zone, easting and northing
-- along with the presence in the fm table returns a single BORE_HOLE_ID for each
-- WELL_ID; this has been assigned to LOC_MASTER_LOC_ID; this latter will need to be
-- used in subsequent imports from the MOE db not using the fm and zone, easting and northing
-- to reduce the number of rows to be imported

-- for MOE_20160531 and MOE_20220328, the BORE_HOLE_ID is being used to differentiate locations;
-- the WELL_ID is going into LOC_ORIGINAL_NAME (we'll alias it later)

-- D_DATA_SOURCE

-- what is the correct DATA_ID code
-- 517 MOE WWR Database - v201304 Update
-- 518 MOE WWR Database - v20160531 Update
-- 519 MOE WWR Database - v20170905
-- 520 MOE WWR Database - v20180530
-- 521 MOE WWR Database - v20190509
-- 522 MOE WWR Database - v20200721
-- 523 MOE WWR Database - v20210119
-- 524 MOE WWR Database - v20220328

SELECT
DATA_ID,
DATA_TYPE,
DATA_DESCRIPTION,
DATA_COMMENT,
DATA_FILENAME,
DATA_ADDED_METHOD,
DATA_ADDED_USER,
DATA_ADDED_DATE,
SYS_TIME_STAMP,
SYS_USER_STAMP
from
oak_20160831_master.dbo.v_sys_moe_data_id

select
*
from 
oak_20160831_master.dbo.d_data_source
where
data_id= 524

-- the view, above, substitutes for the following query

--select
--*
--from 
--oak_20160831_master.dbo.d_data_source
--where
--data_id>500 and data_id<550

insert into oak_20160831_master.dbo.d_data_source
(data_id,data_type,data_description,data_comment)
values
(524,'Well or Borehole','MOE WWR Database - 20220328','Refer to Appendix G.10 in the database manual for import methodology')

-- create the M_D_LOCATION table
-- don't forget to change LOC_NAME_ALT1 and DATA_ID

--****** v20210119; updated v20220328
--****** we have changed the coordinate check - east83_orig and north83_orig contain the original coordinates
--****** not matter what zone it occurs in; use zone to check 

select 
y.BORE_HOLE_ID as LOC_ID
,cast(bh.WELL_ID as varchar(255)) as [LOC_NAME]
,cast('MOE Well 20220328 - Name Witheld by MOE' as varchar(255)) as [LOC_NAME_ALT1]
,cast(1 as int) as [LOC_TYPE_CODE]
,cast(bh.WELL_ID as varchar(255)) as [LOC_ORIGINAL_NAME]
,y.[LOC_MASTER_LOC_ID]
,yccoords.[EAST83] as [LOC_COORD_EASTING]
,yccoords.[NORTH83] as [LOC_COORD_NORTHING]
,yccoords.east83_orig as LOC_COORD_EASTING_OUOM
,yccoords.north83_orig as LOC_COORD_NORTHING_OUOM
,case
when yccoords.zone= 17 then 4
else 5
end as LOC_COORD_OUOM_CODE
,cast(wwr.COUNTY as int) as [LOC_COUNTY_CODE]
,cast(wwr.MUNIC_CODE as int) as [LOC_TOWNSHIP_CODE]
,ycfs.LOC_STATUS_CODE
,bh.DATE_COMPLETED as [LOC_START_DATE]
,cast(1 as int) as [SITE_ID]
,cast(1 as int) as [LOC_CONFIDENTIALITY_CODE]
,cast(wwr.DATA_SRC as int) as [LOC_DATA_SOURCE_CODE]
,cast(wwr.CONN as varchar(50)) as [LOC_CON]
,cast(wwr.LOT as varchar(50)) as [LOC_LOT]
,cast(RTRIM(LTRIM(wwr.STREET)) as varchar(255)) as [LOC_ADDRESS_INFO1]
,cast(RTRIM(LTRIM(wwr.CITY)) as varchar(255)) as [LOC_ADDRESS_CTY]
,ycmoeu1.MOE_USE as [LOC_MOE_USE_1ST_CODE]
,ycmoeu2.MOE_USE as [LOC_MOE_USE_2ND_CODE]
,524 as DATA_ID                            
from 
MOE_20220328.dbo.YC_20220328_BH_ID as y
inner join MOE_20220328.dbo.TblBore_Hole as bh
on y.BORE_HOLE_ID=bh.BORE_HOLE_ID
left outer join MOE_20220328.dbo.TblWWR as wwr
on bh.WELL_ID=wwr.WELL_ID
left outer join MOE_20220328.dbo.YC_20220328_LOC_COORD_OUOM_CODE as yccode
on bh.ZONE=yccode.ZONE
--inner join MOE_20220328.dbo.YC_20220328_FINAL_STATUS as ycfs
left outer join MOE_20220328.dbo.YC_20220328_FINAL_STATUS as ycfs
on wwr.FINAL_STA=ycfs.FINAL_STA
inner join MOE_20220328.dbo.YC_20220328_MOE_USE as ycmoeu1
on wwr.USE_1ST=ycmoeu1.USE_1ST
inner join MOE_20220328.dbo.YC_20220328_MOE_USE as ycmoeu2
on wwr.USE_2ND=ycmoeu2.USE_1ST
inner join MOE_20220328.dbo.YC_20220328_BORE_HOLE_ID_COORDS_YC as yccoords
on y.BORE_HOLE_ID=yccoords.BORE_HOLE_ID

select 
y.BORE_HOLE_ID as LOC_ID
,cast(bh.WELL_ID as varchar(255)) as [LOC_NAME]
,cast('MOE Well 20220328 - Name Witheld by MOE' as varchar(255)) as [LOC_NAME_ALT1]
,cast(1 as int) as [LOC_TYPE_CODE]
,cast(bh.WELL_ID as varchar(255)) as [LOC_ORIGINAL_NAME]
,y.[LOC_MASTER_LOC_ID]
,yccoords.[EAST83] as [LOC_COORD_EASTING]
,yccoords.[NORTH83] as [LOC_COORD_NORTHING]
,yccoords.east83_orig as LOC_COORD_EASTING_OUOM
,yccoords.north83_orig as LOC_COORD_NORTHING_OUOM
,case
when yccoords.zone= 17 then 4
else 5
end as LOC_COORD_OUOM_CODE
,cast(wwr.COUNTY as int) as [LOC_COUNTY_CODE]
,cast(wwr.MUNIC_CODE as int) as [LOC_TOWNSHIP_CODE]
,ycfs.LOC_STATUS_CODE
,bh.DATE_COMPLETED as [LOC_START_DATE]
,cast(1 as int) as [SITE_ID]
,cast(1 as int) as [LOC_CONFIDENTIALITY_CODE]
,cast(wwr.DATA_SRC as int) as [LOC_DATA_SOURCE_CODE]
,cast(wwr.CONN as varchar(50)) as [LOC_CON]
,cast(wwr.LOT as varchar(50)) as [LOC_LOT]
,cast(RTRIM(LTRIM(wwr.STREET)) as varchar(255)) as [LOC_ADDRESS_INFO1]
,cast(RTRIM(LTRIM(wwr.CITY)) as varchar(255)) as [LOC_ADDRESS_CTY]
,ycmoeu1.MOE_USE as [LOC_MOE_USE_1ST_CODE]
,ycmoeu2.MOE_USE as [LOC_MOE_USE_2ND_CODE]
,524 as DATA_ID  
into MOE_20220328.dbo.M_D_LOCATION                             
from 
MOE_20220328.dbo.YC_20220328_BH_ID as y
inner join MOE_20220328.dbo.TblBore_Hole as bh
on y.BORE_HOLE_ID=bh.BORE_HOLE_ID
left outer join MOE_20220328.dbo.TblWWR as wwr
on bh.WELL_ID=wwr.WELL_ID
left outer join MOE_20220328.dbo.YC_20220328_LOC_COORD_OUOM_CODE as yccode
on bh.ZONE=yccode.ZONE
left outer join MOE_20220328.dbo.YC_20220328_FINAL_STATUS as ycfs
on wwr.FINAL_STA=ycfs.FINAL_STA
inner join MOE_20220328.dbo.YC_20220328_MOE_USE as ycmoeu1
on wwr.USE_1ST=ycmoeu1.USE_1ST
inner join MOE_20220328.dbo.YC_20220328_MOE_USE as ycmoeu2
on wwr.USE_2ND=ycmoeu2.USE_1ST
inner join MOE_20220328.dbo.YC_20220328_BORE_HOLE_ID_COORDS_YC as yccoords
on y.BORE_HOLE_ID=yccoords.BORE_HOLE_ID

-- drop table M_D_LOCATION

-- 17185 rows v20170905
-- 14357 rows v20180530 initially before changing to left outer joins
-- 15578 rows v20180530 final
-- 11851 rows v20190509 final
-- 11760 rows v20200721 
-- 24619 rows v20210119
-- 15235 rows v20220328

select
count(*) 
from 
MOE_20220328.dbo.M_D_LOCATION

-- 17185 rows v20170905; match
-- 15578 rows v20180530; match final
-- 11851 rows v20190509; match final (above)
-- 11760 rows v20200721; match above
-- 24619 rows v20210119; match above
-- 15235 rows v20220328; match above

select
count(*) 
from 
MOE_20220328.dbo.YC_20220328_BORE_HOLE_ID_COORDS_YC

-- check for zero length address information

select 
m.*
from 
MOE_20220328.dbo.M_D_LOCATION as m
where 
len(LOC_ADDRESS_INFO1)=0

-- 4728 rows v20170905
-- 2226 rows v20180530 initial
-- 3445 rows v20180530 final
-- 4393 rows v20190509 final
-- 2734 rows v20200721 
-- 6266 rows v20210119
-- 9060 rows v20220328

update MOE_20220328.dbo.M_D_LOCATION
set
LOC_ADDRESS_INFO1=null 
from 
MOE_20220328.dbo.M_D_LOCATION as m
where 
len(LOC_ADDRESS_INFO1)=0

-- check this table

select
*
from 
MOE_20220328.dbo.M_D_LOCATION

select
distinct(loc_coord_ouom_code)
from 
MOE_20220328.dbo.M_D_LOCATION

select
distinct(loc_status_code)
from 
MOE_20220328.dbo.M_D_LOCATION









