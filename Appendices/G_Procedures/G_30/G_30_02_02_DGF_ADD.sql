


--***** G.30.02.02 D_GEOLOGY_FEATURE Add

--***** Assemble the D_GEOLOGY_FEATURE information

-- this can be inserted directly into OAK_20160831_MASTER.dbo.D_GEOLOGY_FEATURE

-- change DATA_ID, SYS_TEMP1 and SYS_TEMP2

-- v20190509 DATA_ID 521

-- v20190509 7282 rows
-- v20200721 2866 rows
-- v20210119 325 rows

select
y.LOC_ID
,cast(null as int) as FEATURE_ID
,case
when moew.kind is null or moew.kind=0 then null -- not specified
else moew.kind                                  -- matches YC codes
end 
as [FEATURE_CODE]
,'Water Found' as [FEATURE_DESCRIPTION]
,moew.WATER_FOUND_DEPTH as [FEATURE_TOP_OUOM]
,moew.WATER_FOUND_DEPTH_UOM as [FEATURE_UNIT_OUOM]
,cast(523 as int) as DATA_ID
,ROW_NUMBER() over (order by y.LOC_ID) as rkey
into MOE_20210119.dbo.O_D_GEOLOGY_FEATURE
from 
MOE_20210119.dbo.ORMGP_20210119_upd_DGF as y
inner join MOE_20210119.dbo.TblPipe as moep
on y.moe_bore_hole_id=moep.Bore_Hole_ID
inner join MOE_20210119.[dbo].[TblWater] as moew
on moep.PIPE_ID=moew.PIPE_ID

select
count(*)
from 
MOE_20210119.dbo.O_D_GEOLOGY_FEATURE

-- update the FEATURE_ID

select
od.loc_id
,od.rkey
,t2.feature_id
from 
moe_20210119.dbo.o_d_geology_feature as od
inner join
(
select
t.feature_id
,row_number() over (order by t.feature_id) as rkey
from 
(
select
top 1000
v.new_id as feature_id
from 
oak_20160831_master.dbo.v_sys_random_id_bulk_001 as v
where 
v.new_id not in
( select feature_id from oak_20160831_master.dbo.d_geology_feature )
) as t
) as t2
on od.rkey=t2.rkey


update moe_20210119.dbo.o_d_geology_feature
set
feature_id=t2.feature_id
from 
moe_20210119.dbo.o_d_geology_feature as od
inner join
(
select
t.feature_id
,row_number() over (order by t.feature_id) as rkey
from 
(
select
top 1000
v.new_id as feature_id
from 
oak_20160831_master.dbo.v_sys_random_id_bulk_001 as v
where 
v.new_id not in
( select feature_id from oak_20160831_master.dbo.d_geology_feature )
) as t
) as t2
on od.rkey=t2.rkey

-- Add the rows to the D_GEOLOGY_FEATURE table

insert into oak_20160831_master.dbo.d_geology_feature
(
[LOC_ID], 
[FEATURE_ID], 
[FEATURE_CODE], 
[FEATURE_DESCRIPTION], 
[FEATURE_TOP_OUOM], 
[FEATURE_UNIT_OUOM], 
[DATA_ID],
SYS_TEMP1,
SYS_TEMP2
)
select
[LOC_ID], 
[FEATURE_ID], 
[FEATURE_CODE], 
[FEATURE_DESCRIPTION], 
[FEATURE_TOP_OUOM], 
[FEATURE_UNIT_OUOM], 
[DATA_ID],
cast( '20210208a' as varchar(255) ) as SYS_TEMP1,
cast( 20210208 as int ) as SYS_TEMP2
from 
moe_20210119.dbo.o_d_geology_feature



