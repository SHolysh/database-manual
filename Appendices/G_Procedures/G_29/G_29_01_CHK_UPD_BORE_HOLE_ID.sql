
--***** G.29 Update MOE BORE_HOLE_ID (D_LOCATION_ALIAS)

-- the following scripts are used to evaluate and then incorporate
-- BORE_HOLE_ID identifiers into the ORMGPDB associated with the 
-- appropriate LOC_ID (based upon WELL_ID)

-- v20190509 18116 rows
-- v20200721 89 rows

select
v.loc_id
,t3.well_id
,t3.bore_hole_id
,v.moe_bore_hole_id
--count(*) as rcount
from 
(
select
cast(t2.well_id as int) as well_id
,b2.bore_hole_id
from 
(
select
t.well_id
from 
(
select
b.well_id
,count(*) as bhi_num
from 
moe_20200721.dbo.tblbore_hole as b
group by
well_id
) as t
where 
t.bhi_num= 1
) as t2
inner join moe_20200721.dbo.tblbore_hole as b2
on t2.well_id=b2.well_id
) as t3
inner join oak_20160831_master.dbo.v_sys_moe_locations as v
on t3.well_id=v.moe_well_id
where 
v.moe_bore_hole_id is null

-- v20190509 18116 rows
-- v20200721 89 rows

insert into d_location_alias
(
loc_id, loc_name_alias, loc_alias_type_code, data_id, sys_temp1, sys_temp2
)
select
v.loc_id
,cast(t3.bore_hole_id as varchar(255)) as loc_name_alias
,3 as loc_alias_type_code
,522 as data_id
,'20200807f' as sys_temp1
,20200807 as sys_temp2
from 
(
select
cast(t2.well_id as int) as well_id
,b2.bore_hole_id
from 
(
select
t.well_id
from 
(
select
b.well_id
,count(*) as bhi_num
from 
moe_20200721.dbo.tblbore_hole as b
group by
well_id
) as t
where 
t.bhi_num= 1
) as t2
inner join moe_20200721.dbo.tblbore_hole as b2
on t2.well_id=b2.well_id
) as t3
inner join oak_20160831_master.dbo.v_sys_moe_locations as v
on t3.well_id=v.moe_well_id
where 
v.moe_bore_hole_id is null
