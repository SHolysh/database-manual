
--***** Include any coordinate updates in D_LOCATION_COORD_HIST; these should be tagged with 
--***** a LOC_COORD_HIST_CODE of 5 with the DATA_ID of the current import

-- note that as of 20200721, this has been updated to match the D_LOCATION_SPATIAL_HIST
-- format for direct insertion; updates of related tables are not shown here

--***** DATA_ID Update

-- 2016.05.31 518
-- 2018.05.30 520
-- v20190509 521
-- v20200721 522
-- v20210202 523 

--***** Coordinate Check 00 - MOE Z17 Coordinates

-- The coordinates for Z17 and Z18 should be combined into a single table for reference; this
-- needs to be created/updated as part of the MOE import process

--***** v20210119
--***** These two zones are now combined in the table YC_20210119_BORE_HOLE_ID_COORDS_YC_SRC;
--***** a number of checks have already been performed with regard to its creation using
--***** the G.10 instructions

-- v20200721 417008 rows
-- v20210119 380097 rows (bore_hole_id)
--           689971 rows (well_id)

select
v.loc_id
,c.east83
,c.north83
,c.east83_orig
,c.north83_orig
,c.zone_orig
,m.utmrc
,m.location_method
,m.improvement_location_source
,m.improvement_location_method
,m.elevation
,m.elevrc
,row_number() over (order by v.loc_id) as rkey
into moe_20210119.dbo.YC_20210119_BORE_HOLE_ID_COORDS_UPD
from 
oak_20160831_master.dbo.v_sys_moe_locations as v
inner join moe_20210119.dbo.YC_20210119_BORE_HOLE_ID_COORDS_YC_SRC as c
on v.moe_bore_hole_id=c.bore_hole_id
--on v.moe_well_id=c.well_id
inner join oak_20160831_master.dbo.d_location as d
on v.loc_id=d.loc_id
inner join moe_20210119.dbo.tblbore_hole as m
on v.moe_bore_hole_id=m.bore_hole_id
where
d.loc_type_code= 1
group by
v.loc_id,c.east83,c.north83,c.east83_orig,c.north83_orig,c.zone_orig
,m.utmrc,m.location_method,m.improvement_location_source,m.improvement_location_method
,m.elevation,m.elevrc

-- remove the duplicates based on LOC_ID

-- v20210119 11083 duplicates (well_id)
--           8 duplicates (bore_hole_id)

select
t.*
from 
(
select
loc_id
,min(rkey) as rkey_keep
,count(*) as rcount
from 
moe_20210119.dbo.YC_20210119_BORE_HOLE_ID_COORDS_UPD
group by
loc_id
) as t
where
t.rcount>1

delete from moe_20210119.dbo.YC_20210119_BORE_HOLE_ID_COORDS_UPD 
where
rkey in
(
select
m.rkey
from 
moe_20210119.dbo.YC_20210119_BORE_HOLE_ID_COORDS_UPD as m
inner join
(
select
t.loc_id
,t.rkey_keep
from 
(
select
loc_id
,min(rkey) as rkey_keep
,count(*) as rcount
from 
moe_20210119.dbo.YC_20210119_BORE_HOLE_ID_COORDS_UPD
group by
loc_id
) as t
where
t.rcount>1
) as t2
on m.loc_id=t2.loc_id
where
m.rkey<>t2.rkey_keep
)


--***** Coordinate Check 01 - MOE Coordinates - Township (QA 118)

-- remember, these didn't have valid coordinates; these are township centroids

-- the text fields should be checked for zero-length

-- update DATA_ID, SYS_TEMP1 and SYS_TEMP2

-- 2018.05.30 0 rows
-- v20200721 240 rows
-- v20210119 770 rows

select
dloc.LOC_ID
,dloc.LOC_COORD_EASTING
,dloc.LOC_COORD_NORTHING
,cast( 5 as int ) as LOC_COORD_HIST_CODE 
,cast( '2021-01-19' as datetime ) as LOC_COORD_DATE
,m.east83 as X
,m.north83 as Y
,cast( 26917 as int ) as EPSG_CODE
,m.east83_orig as X_OUOM
,m.north83_orig as Y_OUOM
,case
when m.zone_orig=18 then 26918
else 26917
end as EPSG_CODE_OUOM
--,m.utmrc as QA_COORD_CODE
,case
when m.utmrc is not null then cast(m.utmrc as int) 
else null
end as QA_COORD_CODE
,cast(
case
when m.location_method is not null then m.location_method + '; '
else ''
end
+
case
when m.improvement_location_method is not null then m.improvement_location_method + '; '
else ''
end
+
case
when m.improvement_location_source is not null then m.improvement_location_source + '; '
else ''
end
as varchar(255)) as LOC_COORD_METHOD
,cast( 'Updated from QA_COORD_CODE [118]' as varchar(255) ) as LOC_COORD_COMMENT
,cast( 523 as int ) as LOC_COORD_DATA_ID
,case
when m.elevation is not null then cast( 2 as int ) 
else null
end as LOC_ELEV_CODE
,case 
when m.elevation is not null then cast( '2021-01-19' as datetime ) 
else null
end as LOC_ELEV_DATE
,m.elevation as LOC_ELEV
,case
when m.elevation is not null then cast( 6 as int ) 
else null
end as LOC_ELEV_UNIT_CODE
--,m.elevrc as QA_ELEV_CODE
,case
when len(m.elevrc)>0 then cast(m.elevrc as int) 
else null
end as QA_ELEV_CODE
,cast( '20210202a' as varchar(255) ) as SYS_TEMP1
,cast( 20210202 as int ) as SYS_TEMP2
from 
moe_20210119.dbo.yc_20210119_bore_hole_id_coords_upd as m
inner join oak_20160831_master.dbo.d_location as dloc
on m.loc_id=dloc.loc_id
inner join oak_20160831_master.dbo.d_location_qa as dlqa
on dloc.loc_id=dlqa.loc_id
where
-- make sure to not include the current DATA_ID
( dloc.data_id is null or dloc.data_id<>523 )
and dlqa.qa_coord_confidence_code= 118
and dloc.loc_coord_easting between (m.east83 - 25000) and (m.east83 + 25000)
and dloc.loc_coord_northing between (m.north83 - 25000) and (m.north83 + 25000)


insert into oak_20160831_master.dbo.d_location_spatial_hist
(
loc_id
,loc_coord_hist_code
,loc_coord_date
,x
,y
,epsg_code
,x_ouom
,y_ouom
,epsg_code_ouom
,qa_coord_code
,loc_coord_method
,loc_coord_comment
,loc_coord_data_id
,loc_elev_code
,loc_elev_date
,loc_elev
,loc_elev_unit_code
,qa_elev_code
,sys_temp1
,sys_temp2
)
select
dloc.LOC_ID
,cast( 5 as int ) as LOC_COORD_HIST_CODE 
,cast( '2021-01-19' as datetime ) as LOC_COORD_DATE
,m.east83 as X
,m.north83 as Y
,cast( 26917 as int ) as EPSG_CODE
,m.east83_orig as X_OUOM
,m.north83_orig as Y_OUOM
,case
when m.zone_orig=18 then 26918
else 26917
end as EPSG_CODE_OUOM
--,m.utmrc as QA_COORD_CODE
,case
when m.utmrc is not null then cast(m.utmrc as int) 
else null
end as QA_COORD_CODE
,cast(
case
when m.location_method is not null then m.location_method + '; '
else ''
end
+
case
when m.improvement_location_method is not null then m.improvement_location_method + '; '
else ''
end
+
case
when m.improvement_location_source is not null then m.improvement_location_source + '; '
else ''
end
as varchar(255)) as LOC_COORD_METHOD
,cast( 'Updated from QA_COORD_CODE [118]' as varchar(255) ) as LOC_COORD_COMMENT
,cast( 523 as int ) as LOC_COORD_DATA_ID
,case
when m.elevation is not null then cast( 2 as int ) 
else null
end as LOC_ELEV_CODE
,case 
when m.elevation is not null then cast( '2021-01-19' as datetime ) 
else null
end as LOC_ELEV_DATE
,m.elevation as LOC_ELEV
,case
when m.elevation is not null then cast( 6 as int ) 
else null
end as LOC_ELEV_UNIT_CODE
--,m.elevrc as QA_ELEV_CODE
,case
when len(m.elevrc)>0 then cast(m.elevrc as int) 
else null
end as QA_ELEV_CODE
,cast( '20210202a' as varchar(255) ) as SYS_TEMP1
,cast( 20210202 as int ) as SYS_TEMP2
from 
moe_20210119.dbo.yc_20210119_bore_hole_id_coords_upd as m
inner join oak_20160831_master.dbo.d_location as dloc
on m.loc_id=dloc.loc_id
inner join oak_20160831_master.dbo.d_location_qa as dlqa
on dloc.loc_id=dlqa.loc_id
where
-- make sure to not include the current DATA_ID
( dloc.data_id is null or dloc.data_id<>523 )
and dlqa.qa_coord_confidence_code= 118
and dloc.loc_coord_easting between (m.east83 - 25000) and (m.east83 + 25000)
and dloc.loc_coord_northing between (m.north83 - 25000) and (m.north83 + 25000)

select
*
from 
oak_20160831_master.dbo.d_location_spatial_hist
where
sys_temp1= '20210202a'


--***** Coordinate Check 02 - MOE Coordinates - Invalid (QA 117)

-- add the present field to the YC_20210119_BORE_HOLE_ID_COORDS_UPD table

alter table YC_20210119_BORE_HOLE_ID_COORDS_UPD add present int

-- we need to tag those whose coordinates are already present in the 
-- master database

-- v20210119 2 rows

select
m.*
from 
moe_20210119.dbo.yc_20210119_bore_hole_id_coords_upd as m
inner join oak_20160831_master.dbo.d_location_qa as dlqa
on m.loc_id=dlqa.loc_id
inner join 
(
select
loc_id
,x
,y
from 
oak_20160831_master.dbo.d_location_spatial_hist
where
x is not null and y is not null
group by
loc_id,x,y
) as t
on m.loc_id=t.loc_id and m.east83=t.x and m.north83=t.y
where
dlqa.qa_coord_confidence_code= 117

update moe_20210119.dbo.yc_20210119_bore_hole_id_coords_upd
set
present= 1
from 
moe_20210119.dbo.yc_20210119_bore_hole_id_coords_upd as m
inner join oak_20160831_master.dbo.d_location_qa as dlqa
on m.loc_id=dlqa.loc_id
inner join 
(
select
loc_id
,x
,y
from 
oak_20160831_master.dbo.d_location_spatial_hist
where
x is not null and y is not null
group by
loc_id,x,y
) as t
on m.loc_id=t.loc_id and m.east83=t.x and m.north83=t.y
where
dlqa.qa_coord_confidence_code= 117

-- 2018.05.30 UTMZ17 2 rows; UTMZ18 0 rows
-- v20190509 UTMZ17 2 rows; UTMZ18 0 rows
-- v20200721 1 row (note that z17 and z18 tests are no longer necessary)
-- v20210119 0 rows

-- update DATA_ID, SYS_TEMP1 and SYS_TEMP2 as well as the dates

select
dloc.LOC_ID
,dloc.LOC_COORD_EASTING
,dloc.LOC_COORD_NORTHING
,cast( 5 as int ) as LOC_COORD_HIST_CODE 
,cast( '2021-01-19' as datetime ) as LOC_COORD_DATE
,m.east83 as X
,m.north83 as Y
,cast( 26917 as int ) as EPSG_CODE
,m.east83_orig as X_OUOM
,m.north83_orig as Y_OUOM
,case
when m.zone_orig=18 then 26918
else 26917
end as EPSG_CODE_OUOM
--,m.utmrc as QA_COORD_CODE
,case
when m.utmrc is not null then cast(m.utmrc as int) 
else null
end as QA_COORD_CODE
,cast(
case
when m.location_method is not null then m.location_method + '; '
else ''
end
+
case
when m.improvement_location_method is not null then m.improvement_location_method + '; '
else ''
end
+
case
when m.improvement_location_source is not null then m.improvement_location_source + '; '
else ''
end
as varchar(255)) as LOC_COORD_METHOD
,cast( 'Updated from QA_COORD_CODE [117]' as varchar(255) ) as LOC_COORD_COMMENT
,cast( 523 as int ) as LOC_COORD_DATA_ID
,case
when m.elevation is not null then cast( 2 as int ) 
else null
end as LOC_ELEV_CODE
,case 
when m.elevation is not null then cast( '2021-01-19' as datetime ) 
else null
end as LOC_ELEV_DATE
,m.elevation as LOC_ELEV
,case
when m.elevation is not null then cast( 6 as int ) 
else null
end as LOC_ELEV_UNIT_CODE
--,m.elevrc as QA_ELEV_CODE
,case
when len(m.elevrc)>0 then cast(m.elevrc as int) 
else null
end as QA_ELEV_CODE
,cast( '20210202b' as varchar(255) ) as SYS_TEMP1
,cast( 20210202 as int ) as SYS_TEMP2
from 
moe_20210119.dbo.yc_20210119_bore_hole_id_coords_upd as m
inner join oak_20160831_master.dbo.d_location as dloc
on m.loc_id=dloc.loc_id
inner join oak_20160831_master.dbo.d_location_qa as dlqa
on dloc.loc_id=dlqa.loc_id
where
dlqa.qa_coord_confidence_code= 117
and m.present is null
and 
(
not( dloc.loc_coord_easting between (m.east83 - 1) and (m.east83 + 1) )
or not( dloc.loc_coord_northing between (m.north83 - 1) and (m.north83 + 1) )
)


insert into d_location_spatial_hist
(
loc_id
,loc_coord_hist_code
,loc_coord_date
,x
,y
,epsg_code
,x_ouom
,y_ouom
,epsg_code_ouom
,qa_coord_code
,loc_coord_method
,loc_coord_comment
,loc_coord_data_id
,loc_elev_code
,loc_elev_date
,loc_elev
,loc_elev_unit_code
,qa_elev_code
,sys_temp1
,sys_temp2
)
select
dloc.LOC_ID
,dloc.LOC_COORD_EASTING
,dloc.LOC_COORD_NORTHING
,cast( 5 as int ) as LOC_COORD_HIST_CODE 
,cast( '2021-01-19' as datetime ) as LOC_COORD_DATE
,m.east83 as X
,m.north83 as Y
,cast( 26917 as int ) as EPSG_CODE
,m.east83_orig as X_OUOM
,m.north83_orig as Y_OUOM
,case
when m.zone_orig=18 then 26918
else 26917
end as EPSG_CODE_OUOM
--,m.utmrc as QA_COORD_CODE
,case
when m.utmrc is not null then cast(m.utmrc as int) 
else null
end as QA_COORD_CODE
,cast(
case
when m.location_method is not null then m.location_method + '; '
else ''
end
+
case
when m.improvement_location_method is not null then m.improvement_location_method + '; '
else ''
end
+
case
when m.improvement_location_source is not null then m.improvement_location_source + '; '
else ''
end
as varchar(255)) as LOC_COORD_METHOD
,cast( 'Updated from QA_COORD_CODE [117]' as varchar(255) ) as LOC_COORD_COMMENT
,cast( 523 as int ) as LOC_COORD_DATA_ID
,case
when m.elevation is not null then cast( 2 as int ) 
else null
end as LOC_ELEV_CODE
,case 
when m.elevation is not null then cast( '2021-01-19' as datetime ) 
else null
end as LOC_ELEV_DATE
,m.elevation as LOC_ELEV
,case
when m.elevation is not null then cast( 6 as int ) 
else null
end as LOC_ELEV_UNIT_CODE
--,m.elevrc as QA_ELEV_CODE
,case
when len(m.elevrc)>0 then cast(m.elevrc as int) 
else null
end as QA_ELEV_CODE
,cast( '20210202b' as varchar(255) ) as SYS_TEMP1
,cast( 20210202 as int ) as SYS_TEMP2
from 
moe_20210119.dbo.yc_20210119_bore_hole_id_coords_upd as m
inner join oak_20160831_master.dbo.d_location as dloc
on m.loc_id=dloc.loc_id
inner join oak_20160831_master.dbo.d_location_qa as dlqa
on dloc.loc_id=dlqa.loc_id
where
dlqa.qa_coord_confidence_code= 117
and m.present is null
and 
(
not( dloc.loc_coord_easting between (m.east83 - 1) and (m.east83 + 1) )
or not( dloc.loc_coord_northing between (m.north83 - 1) and (m.north83 + 1) )
)


--***** Coordinate Check 03 - MOE Coordinates - Valid Coordinates (non-QA 117)
--***** note that we're excluding QA 117/118; we're also excluding MOE
--***** coordinates that have already been loaded

-- make sure to check whether these have already been added to DLSH; remember, these
-- return those records that are currently present and need to be marked

-- v20210119 240200

select
--count(*)
m.*
from 
moe_20210119.dbo.yc_20210119_bore_hole_id_coords_upd as m
inner join oak_20160831_master.dbo.d_location_qa as dlqa
on m.loc_id=dlqa.loc_id
inner join 
(
select
loc_id
,x
,y
from 
oak_20160831_master.dbo.d_location_spatial_hist
where
x is not null and y is not null
group by
loc_id,x,y
) as t
on m.loc_id=t.loc_id and m.east83=t.x and m.north83=t.y
where
dlqa.qa_coord_confidence_code not in ( 117, 118 )

update moe_20210119.dbo.yc_20210119_bore_hole_id_coords_upd
set
present= 2
from 
moe_20210119.dbo.yc_20210119_bore_hole_id_coords_upd as m
inner join oak_20160831_master.dbo.d_location_qa as dlqa
on m.loc_id=dlqa.loc_id
inner join 
(
select
loc_id
,x
,y
from 
oak_20160831_master.dbo.d_location_spatial_hist
where
x is not null and y is not null
group by
loc_id,x,y
) as t
on m.loc_id=t.loc_id and m.east83=t.x and m.north83=t.y
where
dlqa.qa_coord_confidence_code not in ( 117, 118 )

-- We're going to round the final coordinates for locations in Zone 18

-- Don't forget to change the values of DATA_ID, SYS_TEMP1 and SYS_TEMP2

-- 2018.05.30 8355 records
-- v20190509 192 rows
-- v20200721 12977 rows
-- v20210119 121 rows


select
dloc.LOC_ID
,dloc.LOC_COORD_EASTING
,dloc.LOC_COORD_NORTHING
,cast( 5 as int ) as LOC_COORD_HIST_CODE 
,cast( '2021-01-19' as datetime ) as LOC_COORD_DATE
,m.east83 as X
,m.north83 as Y
,cast( 26917 as int ) as EPSG_CODE
,m.east83_orig as X_OUOM
,m.north83_orig as Y_OUOM
,case
when m.zone_orig=18 then 26918
else 26917
end as EPSG_CODE_OUOM
--,m.utmrc as QA_COORD_CODE
,case
when m.utmrc is not null then cast(m.utmrc as int) 
else null
end as QA_COORD_CODE
,cast(
case
when m.location_method is not null then m.location_method + '; '
else ''
end
+
case
when m.improvement_location_method is not null then m.improvement_location_method + '; '
else ''
end
+
case
when m.improvement_location_source is not null then m.improvement_location_source + '; '
else ''
end
as varchar(255)) as LOC_COORD_METHOD
,cast( 'Updated from various QA_COORD_CODEs (CHECK03)' as varchar(255) ) as LOC_COORD_COMMENT
,cast( 523 as int ) as LOC_COORD_DATA_ID
,case
when m.elevation is not null then cast( 2 as int ) 
else null
end as LOC_ELEV_CODE
,case 
when m.elevation is not null then cast( '2021-01-19' as datetime ) 
else null
end as LOC_ELEV_DATE
,m.elevation as LOC_ELEV
,case
when m.elevation is not null then cast( 6 as int ) 
else null
end as LOC_ELEV_UNIT_CODE
--,m.elevrc as QA_ELEV_CODE
,case
when len(m.elevrc)>0 then cast(m.elevrc as int) 
else null
end as QA_ELEV_CODE
,cast( '20210202c' as varchar(255) ) as SYS_TEMP1
,cast( 20210202 as int ) as SYS_TEMP2
from 
moe_20210119.dbo.yc_20210119_bore_hole_id_coords_upd as m
inner join oak_20160831_master.dbo.d_location as dloc
on m.loc_id=dloc.loc_id
inner join oak_20160831_master.dbo.d_location_qa as dlqa
on dloc.loc_id=dlqa.loc_id
where
(dloc.data_id is null or dloc.data_id<>523 )
and dlqa.qa_coord_confidence_code not in ( 117, 118 )
and m.present is null
and 
(
not( dloc.loc_coord_easting between (m.east83 - 1) and (m.east83 + 1) )
or not( dloc.loc_coord_northing between (m.north83 - 1) and (m.north83 + 1) )
)
and m.east83 is not null and m.north83 is not null
and m.east83 between ( 100000 ) and ( 1000000 )
and m.north83 between ( 1000000 ) and ( 6000000 )
and dloc.loc_id not in
(
select
distinct(loc_id)
from 
oak_20160831_master.dbo.d_location_spatial_hist
where
loc_coord_hist_code=5
)


insert into oak_20160831_master.dbo.d_location_spatial_hist
(
loc_id
,loc_coord_hist_code
,loc_coord_date
,x
,y
,epsg_code
,x_ouom
,y_ouom
,epsg_code_ouom
,qa_coord_code
,loc_coord_method
,loc_coord_comment
,loc_coord_data_id
,loc_elev_code
,loc_elev_date
,loc_elev
,loc_elev_unit_code
,qa_elev_code
,sys_temp1
,sys_temp2
)
select
dloc.LOC_ID
,cast( 5 as int ) as LOC_COORD_HIST_CODE 
,cast( '2021-01-19' as datetime ) as LOC_COORD_DATE
,m.east83 as X
,m.north83 as Y
,cast( 26917 as int ) as EPSG_CODE
,m.east83_orig as X_OUOM
,m.north83_orig as Y_OUOM
,case
when m.zone_orig=18 then 26918
else 26917
end as EPSG_CODE_OUOM
--,m.utmrc as QA_COORD_CODE
,case
when m.utmrc is not null then cast(m.utmrc as int) 
else null
end as QA_COORD_CODE
,cast(
case
when m.location_method is not null then m.location_method + '; '
else ''
end
+
case
when m.improvement_location_method is not null then m.improvement_location_method + '; '
else ''
end
+
case
when m.improvement_location_source is not null then m.improvement_location_source + '; '
else ''
end
as varchar(255)) as LOC_COORD_METHOD
,cast( 'Updated from various QA_COORD_CODEs (CHECK03)' as varchar(255) ) as LOC_COORD_COMMENT
,cast( 523 as int ) as LOC_COORD_DATA_ID
,case
when m.elevation is not null then cast( 2 as int ) 
else null
end as LOC_ELEV_CODE
,case 
when m.elevation is not null then cast( '2021-01-19' as datetime ) 
else null
end as LOC_ELEV_DATE
,m.elevation as LOC_ELEV
,case
when m.elevation is not null then cast( 6 as int ) 
else null
end as LOC_ELEV_UNIT_CODE
--,m.elevrc as QA_ELEV_CODE
,case
when len(m.elevrc)>0 then cast(m.elevrc as int) 
else null
end as QA_ELEV_CODE
,cast( '20210202c' as varchar(255) ) as SYS_TEMP1
,cast( 20210202 as int ) as SYS_TEMP2
from 
moe_20210119.dbo.yc_20210119_bore_hole_id_coords_upd as m
inner join oak_20160831_master.dbo.d_location as dloc
on m.loc_id=dloc.loc_id
inner join oak_20160831_master.dbo.d_location_qa as dlqa
on dloc.loc_id=dlqa.loc_id
where
(dloc.data_id is null or dloc.data_id<>523 )
and dlqa.qa_coord_confidence_code not in ( 117, 118 )
and m.present is null
and 
(
not( dloc.loc_coord_easting between (m.east83 - 1) and (m.east83 + 1) )
or not( dloc.loc_coord_northing between (m.north83 - 1) and (m.north83 + 1) )
)
and m.east83 is not null and m.north83 is not null
and m.east83 between ( 100000 ) and ( 1000000 )
and m.north83 between ( 1000000 ) and ( 6000000 )
and dloc.loc_id not in
(
select
distinct(loc_id)
from 
oak_20160831_master.dbo.d_location_spatial_hist
where
loc_coord_hist_code=5
)


--***** Coordinate Check 06 - MOE Coordinates - Invalid (QA 117 or 118)

-- these we will populate with the MNR DEM elevations

-- change the DATA_ID, dates and SYS_TEMP* fields

-- v20190509 0 rows
-- v20200721 241 rows
-- v20210202 770 rows

select
dloc.loc_id
,dlsh.loc_coord_hist_code
,dlsh.loc_coord_date
,dlsh.x
,dlsh.y
,dlsh.epsg_code
,dlsh.x_ouom
,dlsh.y_ouom
,dlsh.epsg_code_ouom
,dlsh.qa_coord_code
,dlsh.loc_coord_data_id
,dlsh.loc_coord_method 
,dlsh.loc_coord_comment 
,3 as loc_elev_code
,cast( '2021-01-19' as datetime ) as loc_elev_date
,6 as loc_elev_unit_code
,10 as qa_elev_code
,'20210202d' as sys_temp1
,20210202 as sys_temp2
from 
oak_20160831_master.dbo.d_location as dloc
inner join oak_20160831_master.dbo.d_location_qa as dlqa
on dloc.loc_id=dlqa.loc_id
inner join oak_20160831_master.dbo.d_location_spatial_hist as dlsh
on dloc.loc_id=dlsh.loc_id
where 
dlqa.qa_coord_confidence_code in ( 117, 118 )
and dlsh.loc_coord_data_id= 523
and ( dlsh.qa_elev_code is null or dlsh.qa_elev_code<>1 )

select
*
from 
oak_20160831_master.dbo.d_location_spatial_hist
where
sys_temp1= '20210202d'

insert into oak_20160831_master.dbo.d_location_spatial_hist
(
loc_id
,loc_coord_hist_code
,loc_coord_date
,x
,y
,epsg_code
,x_ouom
,y_ouom
,epsg_code_ouom
,qa_coord_code
,loc_coord_data_id
,loc_coord_method
,loc_coord_comment
,loc_elev_code
,loc_elev_date
,loc_elev_unit_code
,qa_elev_code
,sys_temp1
,sys_temp2
)
select
dloc.loc_id
,dlsh.loc_coord_hist_code
,dlsh.loc_coord_date
,dlsh.x
,dlsh.y
,dlsh.epsg_code
,dlsh.x_ouom
,dlsh.y_ouom
,dlsh.epsg_code_ouom
,dlsh.qa_coord_code
,dlsh.loc_coord_data_id
,dlsh.loc_coord_method 
,dlsh.loc_coord_comment 
,3 as loc_elev_code
,cast( '2021-01-19' as datetime ) as loc_elev_date
,6 as loc_elev_unit_code
,10 as qa_elev_code
,'20210202d' as sys_temp1
,20210202 as sys_temp2
from 
oak_20160831_master.dbo.d_location as dloc
inner join oak_20160831_master.dbo.d_location_qa as dlqa
on dloc.loc_id=dlqa.loc_id
inner join oak_20160831_master.dbo.d_location_spatial_hist as dlsh
on dloc.loc_id=dlsh.loc_id
where 
dlqa.qa_coord_confidence_code in ( 117, 118 )
and dlsh.loc_coord_data_id= 523
and ( dlsh.qa_elev_code is null or dlsh.qa_elev_code<>1 )


--***** Coordinate Check 07 - MOE Coordinates - QA Improvement

-- check for QA code updates; also, check to see if these have previously been corrected

-- make sure to update DATA_ID, SYS_TEMP* and various other fields

-- the following does not include separation of QA 9 and the remainder
-- v20190509 45 rows

-- we'll first check against current QA codes of 9; note that we don't want the elevations
-- as these will be updated with the current DEM

-- v20200721 4796 rows (8219 rows total)
-- v20210119 0 rows

select
dlsh.loc_id
,dlsh.loc_coord_hist_code
,dlsh.loc_coord_date
,dlsh.x
,dlsh.y
,dlsh.epsg_code
,dlsh.x_ouom
,dlsh.y_ouom
,dlsh.epsg_code_ouom
,dlsh.qa_coord_code
,dlsh.loc_coord_method
,dlsh.loc_coord_comment + '; Updated from QA_COORD_CODE 9 (CHECK07)' as loc_coord_comment
,dlsh.loc_coord_data_id
,cast( 3 as int ) as loc_elev_code
,cast( '2021-01-19' as datetime ) as loc_elev_date
,cast( 6 as int ) as loc_elev_unit_code
,cast( 10 as int ) as qa_elev_code
,'20210202e' as sys_temp1
,20210202 as sys_temp2
from 
oak_20160831_master.dbo.d_location_spatial_hist as dlsh
inner join oak_20160831_master.dbo.v_sys_loc_coords as v
on dlsh.loc_id=v.loc_id
where 
dlsh.sys_temp1= '20210119b'
and dlsh.qa_coord_code < v.qa_coord_code
and v.qa_coord_code= 9

insert into d_location_spatial_hist
(
loc_id
,loc_coord_hist_code
,loc_coord_date
,x
,y
,epsg_code
,x_ouom
,y_ouom
,epsg_code_ouom
,qa_coord_code
,loc_coord_method
,loc_coord_comment
,loc_coord_data_id
,loc_elev_code
,loc_elev_date
,loc_elev_unit_code
,qa_elev_code
,sys_temp1
,sys_temp2
)
select
dlsh.loc_id
,dlsh.loc_coord_hist_code
,dlsh.loc_coord_date
,dlsh.x
,dlsh.y
,dlsh.epsg_code
,dlsh.x_ouom
,dlsh.y_ouom
,dlsh.epsg_code_ouom
,dlsh.qa_coord_code
,dlsh.loc_coord_method
,dlsh.loc_coord_comment + '; Updated from QA_COORD_CODE 9 (CHECK07)' as loc_coord_comment
,dlsh.loc_coord_data_id
,cast( 3 as int ) as loc_elev_code
,cast( '2021-01-19' as datetime ) as loc_elev_date
,cast( 6 as int ) as loc_elev_unit_code
,cast( 10 as int ) as qa_elev_code
,'20210202e' as sys_temp1
,20210202 as sys_temp2
from 
oak_20160831_master.dbo.d_location_spatial_hist as dlsh
inner join oak_20160831_master.dbo.v_sys_loc_coords as v
on dlsh.loc_id=v.loc_id
where 
dlsh.sys_temp1= '20210119b'
and dlsh.qa_coord_code < v.qa_coord_code
and v.qa_coord_code= 9


-- we'll now check against the remaing current QA codes; note that we don't want the elevations
-- as these will be updated with the current DEM

-- v20200721 3423 rows (3359 after checking for manual edits)
-- v20210119 0 rows

select
dlsh.loc_id
,dlsh.loc_coord_hist_code
,dlsh.loc_coord_date
,dlsh.x
,dlsh.y
,dlsh.epsg_code
,dlsh.x_ouom
,dlsh.y_ouom
,dlsh.epsg_code_ouom
,dlsh.qa_coord_code
,dlsh.loc_coord_method
,dlsh.loc_coord_comment + '; Updated from QA_COORD_CODE ' + cast( v.qa_coord_code as varchar(255) ) + ' (CHECK07)' as loc_coord_comment
,dlsh.loc_coord_data_id
,cast( 3 as int ) as loc_elev_code
,cast( '2021-01-19' as datetime ) as loc_elev_date
,cast( 6 as int ) as loc_elev_unit_code
,cast( 10 as int ) as qa_elev_code
,'20210202f' as sys_temp1
,20210202 as sys_temp2
from 
oak_20160831_master.dbo.d_location_spatial_hist as dlsh
inner join oak_20160831_master.dbo.v_sys_loc_coords as v
on dlsh.loc_id=v.loc_id
inner join oak_20160831_master.dbo.d_location_spatial_hist as dlsh2
on v.spat_id=dlsh2.spat_id
where 
dlsh.sys_temp1= '20210202b'
and dlsh.qa_coord_code < v.qa_coord_code
and v.qa_coord_code <> 9 
and dlsh2.loc_coord_hist_code < 6

-- have any of these been updated manually; assign a LOC_COORD_HIST_CODE of '8' to these;
-- note that we're reviewing the comment fields, the sys_user_stamp field and loc_elev_code
-- field (the latter for those marked as 'surveyed'); the loc_coord_hist_code is being used
-- as an initial filter as anything 6 or above has been manually edited (in some way)

-- v20210119 0 rows

select
dlsh2.*
--distinct( dlsh2.loc_coord_comment )
from 
oak_20160831_master.dbo.d_location_spatial_hist as dlsh
inner join oak_20160831_master.dbo.v_sys_loc_coords as v
on dlsh.loc_id=v.loc_id
inner join oak_20160831_master.dbo.d_location_spatial_hist as dlsh2
on v.spat_id=dlsh2.spat_id
where
dlsh.sys_temp1= '20210202b'
and dlsh.qa_coord_code < v.qa_coord_code
and v.qa_coord_code <> 9 
and dlsh2.loc_coord_hist_code < 6

-- insert these into d_location_spatial_hist and update the elevations; tag the DLS table

insert into d_location_spatial_hist
(
loc_id
,loc_coord_hist_code
,loc_coord_date
,x
,y
,epsg_code
,x_ouom
,y_ouom
,epsg_code_ouom
,qa_coord_code
,loc_coord_method
,loc_coord_comment
,loc_coord_data_id
,loc_elev_code
,loc_elev_date 
,loc_elev_unit_code
,qa_elev_code
,sys_temp1
,sys_temp2
)
select
dlsh.loc_id
,dlsh.loc_coord_hist_code
,dlsh.loc_coord_date
,dlsh.x
,dlsh.y
,dlsh.epsg_code
,dlsh.x_ouom
,dlsh.y_ouom
,dlsh.epsg_code_ouom
,dlsh.qa_coord_code
,dlsh.loc_coord_method
,dlsh.loc_coord_comment + '; Updated from QA_COORD_CODE ' + cast( v.qa_coord_code as varchar(255) ) + ' (CHECK07)' as loc_coord_comment
,dlsh.loc_coord_data_id
,cast( 3 as int ) as loc_elev_code
,cast( '2020-08-07' as datetime ) as loc_elev_date
,cast( 6 as int ) as loc_elev_unit_code
,cast( 10 as int ) as qa_elev_code
,'20200807b' as sys_temp1
,20200807 as sys_temp2
from 
d_location_spatial_hist as dlsh
inner join v_sys_loc_coords as v
on dlsh.loc_id=v.loc_id
inner join d_location_spatial_hist as dlsh2
on v.spat_id=dlsh2.spat_id
where 
dlsh.sys_temp1= '20200806b'
and dlsh.qa_coord_code < v.qa_coord_code
and v.qa_coord_code <> 9 
and dlsh2.loc_coord_hist_code < 6

