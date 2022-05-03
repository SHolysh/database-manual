
--**** G_10_05

--***** Use GRASS GIS and the Giant System to extract the elevations at each borehole location

-- create a view and place it in the temphold database

create view MOE_LOCN_20220328 as
select
d.loc_id
,cast(d.loc_coord_easting as int) as x
,cast(d.loc_coord_northing as int) as y
from 
MOE_20220328.dbo.M_D_LOCATION as d

--drop view MOE_LOCN_20220328

--drop table MOE_ELEV_20220328

-- in Grass, run the Giant commands to extract the elevations by loc_id; make sure to change the password fields

-- MNR

gnat grid_examine -grass -grid=DEM_MNR_v2_10m_BATHY_25km_buffer_20210205 "-i=odbc,gisdbserver_moe_20220328,mdsqlrw,xxxx,moe_locn_20220328" "-o=odbc,gisdbserver_moe_20220328,mdsqlrw,xxxx,moe_elev_20220328" -method=locnrwf "-headers=x,y,loc_id"

select
*
from 
MOE_ELEV_20220328
where 
value= -9999

select * from moe_locn_20220328 where loc_id in
( select loc_id from moe_elev_20220328 where value= -9999 )

-- SRTM; this is used if -9999 values show up from the MNR dataset

gnat grid_examine -grass -grid=DEM_SRTMv41_100m "-i=odbc,gisdbserver_moe_20220328,mdsqlrw,xxxx,moe_locn_20220328" "-o=odbc,gisdbserver_moe_20220328,mdsqlrw,xxxx,moe_elev_srtm_20220328" -method=locnrwf "-headers=x,y,loc_id"

select
s.*
from 
MOE_ELEV_SRTM_20220328 as s
inner join moe_elev_20220328 as m
on s.loc_id=m.loc_id
where
m.value= -9999

---- this locn had a -9999 value for the MNR
--select
--*
--from 
--moe_locn_20220328
--where 
--loc_id= 1007278050

-- loc_id/bore_hole_id
-- srtm elev 149

select
*
from 
MOE_ELEV_SRTM_20220328
where 
loc_id= 1007278050

-- assemble these into the format described by the manual, Section G.10.5

select
m.loc_id as BORE_HOLE_ID
,m.value as DEM_MNR
,s.value as DEM_SRTM
from 
.moe_elev_20220328 as m
inner join moe_elev_srtm_20220328 as s
on m.loc_id=s.loc_id

select
m.loc_id as BORE_HOLE_ID
,m.value as DEM_MNR
,s.value as DEM_SRTM
into MOE_20220328.dbo.YC_20220328_BORE_HOLE_ID_ELEVS
from 
moe_elev_20220328 as m
inner join moe_elev_srtm_20220328 as s
on m.loc_id=s.loc_id

-- 11851 rows v20190509
-- 11760 rows v20200721
-- 24619 rows v20210119
-- 15235 rows v20220328

select
count(*) 
from 
moe_20220328.dbo.yc_20220328_bore_hole_id_elevs

select
*
from 
moe_20220328.dbo.yc_20220328_bore_hole_id_elevs
where
--dem_mnr= -9999
dem_srtm= -9999
--dem_mnr=-9999 and dem_srtm=-9999




