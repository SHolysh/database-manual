
--***** G.30.03.01 D_INTERVAL BORE_HOLE_ID

-- determine those BORE_HOLE_IDs that do not have any records/screens in D_INTERVAL
-- these are the report screens

-- get all the affected BORE_HOLE_IDs

select
dbore.loc_id
,v.moe_bore_hole_id
into moe_20190509_final.dbo.ORMGP_20190509_base_DIM
from 
oak_20160831_master.dbo.d_borehole as dbore
inner join oak_20160831_master.dbo.d_location as dloc
on dbore.loc_id=dloc.loc_id
inner join oak_20160831_master.dbo.d_location_qa as dlqa
on dbore.loc_id=dlqa.loc_id
inner join oak_20160831_master.dbo.v_sys_agency_ypdt as yc
on dbore.loc_id=yc.loc_id
left outer join 
(
select
loc_id
,count(*) as rcount
from 
oak_20160831_master.dbo.d_interval
group by 
loc_id
) as d
on dbore.loc_id=d.loc_id
inner join oak_20160831_master.dbo.v_sys_moe_locations as v
on dbore.loc_id=v.loc_id
where 
d.rcount is null
and dloc.loc_type_code=1
and dlqa.qa_coord_confidence_code<>117
and v.moe_bore_hole_id is not null
group by
dbore.loc_id,v.moe_bore_hole_id

-- get those that actually have reported screens

-- v20190509 2152 rows

select
d.*
into moe_20190509_final.dbo.ORMGP_20190509_upd_DIM
from 
[ORMGP_20190509_base_DGF] as d
inner join 
(
select
moep.bore_hole_id
,count(*) as rcount_moe
from 
MOE_20190509_final.dbo.TblPipe as moep
inner join MOE_20190509_final.dbo.TblScreen as moes
on moep.PIPE_ID=moes.PIPE_ID
group by
moep.bore_hole_id
) as t
on d.moe_bore_hole_id=t.bore_hole_id

-- create the intial DIM table

-- v20190509 1059 rows

select 
d.LOC_ID
,d.moe_bore_hole_id as TMP_INT_ID
,18 as tmp_INT_TYPE_CODE
,moeslot.CONV_YC_SLOT as MON_SCREEN_SLOT
,moes.SCRN_MATERIAL as MON_SCREEN_MATERIAL
,moes.SCRN_DIAMETER as MON_DIAMETER_OUOM
,moes.SCRN_DIAMETER_UOM as MON_DIAMETER_UNIT_OUOM
,moes.SCRN_TOP_DEPTH as MON_TOP_OUOM
,moes.SCRN_END_DEPTH as MON_BOT_OUOM
,moes.SCRN_DEPTH_UOM as MON_UNIT_OUOM
,cast(null as varchar(255)) as MON_COMMENT
into moe_20190509_final.dbo.O_D_INTERVAL_MONITOR
from 
moe_20190509_final.dbo.ORMGP_20190509_upd_DINT as d
inner join 
MOE_20190509_final.dbo.TblPipe as moep
on d.moe_bore_hole_id=moep.Bore_Hole_ID
inner join
MOE_20190509_final.dbo.TblScreen as moes
on moep.PIPE_ID=moes.PIPE_ID
left outer join
MOE_20190509_final.dbo.YC_20190509_MOE_SLOT as moeslot
on moes.Slot=moeslot.MOE_SLOT
where 
moes.SCRN_TOP_DEPTH is not null 
or moes.SCRN_END_DEPTH is not null


