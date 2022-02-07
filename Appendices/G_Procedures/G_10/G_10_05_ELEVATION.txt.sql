
--**** G_10_05

--***** Use GRASS GIS and the Giant System to extract the elevations at each borehole location

-- create a view and place it in the temphold database

create view MOE_LOCN_20210119 as
select
d.loc_id
,cast(d.loc_coord_easting as int) as x
,cast(d.loc_coord_northing as int) as y
from 
MOE_20210119.dbo.M_D_LOCATION as d

--drop view MOE_LOCN_20210119

--drop table MOE_ELEV_20210119

-- in Grass, run the Giant commands to extract the elevations by loc_id; make sure to change the password fields

-- MNR
gnat grid_examine -grass -grid=DEM_MNR_v2_10m_BATHY_25km_buffer -i=odbc,ormgpdb2016_temphold,mdsqlrw,public,moe_locn_20210119 -o=odbc,ormgpdb2016_temphold,mdsqlrw,xxxxxxxxxx,moe_elev_20210119 -method=locnrwf -headers=x,y,loc_id

select
*
from 
temphold.dbo.MOE_ELEV_20210119
where 
value= -9999

-- SRTM; this is used if -9999 values show up from the MNR dataset
gnat grid_examine -grass -grid=DEM_SRTMv41_100m -i=odbc,ormgpdb2016_temphold,mdsqlrw,public,moe_locn_20210119 -o=odbc,ormgpdb2016_temphold,mdsqlrw,xxxxxxxxxx,moe_elev_srtm_20210119 -method=locnrwf -headers=x,y,loc_id

select
*
from 
temphold.dbo.MOE_ELEV_SRTM_20210119
where
value= -9999

---- this locn had a -9999 value for the MNR
--select
--*
--from 
--moe_locn_20210119
--where 
--loc_id= 1007278050

-- loc_id/bore_hole_id
-- srtm elev 149

select
*
from 
MOE_ELEV_SRTM_20210119
where 
loc_id= 1007278050

-- assemble these into the format described by the manual, Section G.10.5

select
m.loc_id as BORE_HOLE_ID
,m.value as DEM_MNR
,s.value as DEM_SRTM
from 
temphold.dbo.moe_elev_20210119 as m
inner join temphold.dbo.moe_elev_srtm_20210119 as s
on m.loc_id=s.loc_id

select
m.loc_id as BORE_HOLE_ID
,m.value as DEM_MNR
,s.value as DEM_SRTM
into MOE_20210119.dbo.YC_20210119_BORE_HOLE_ID_ELEVS
from 
temphold.dbo.moe_elev_20210119 as m
inner join temphold.dbo.moe_elev_srtm_20210119 as s
on m.loc_id=s.loc_id

-- 11851 rows v20190509
-- 11760 rows v20200721
-- 24619 rows v20210119

select
count(*) 
from 
moe_20210119.dbo.yc_20210119_bore_hole_id_elevs

select
*
from 
moe_20210119.dbo.yc_20210119_bore_hole_id_elevs
where
--dem_mnr= -9999
dem_srtm= -9999
--dem_mnr=-9999 and dem_srtm=-9999




