--***** G.27 York Database - Incorporation of Temporal Data

--** This series of scripts is used to merge data from a York DB (YKDB)
--** source (in, basically but not entirely, SiteFX format) into
--** the master ORMGP database (ORMDB).  It is based on the association of
--** intervals between the databases as found in the
--** D_INTERVAL_ALIAS table (i.e. those with an INT_ALIAS_TYPE_CODE
--** of '1'.

--** Creates a series of views to assemble the data that will be
--** imported (either 'new' or 'modified' information; the latter
--** changes will take precedence over any 'current' data found
--** within the master ORMGP db).   Note that changes in this case
--** only refer to the _D_INTERVAL_TEMPORAL_2 (and related) tables.

--** To hold the YKDB exported data (i.e. for import into ORMDB)
--** a temporary database of the form 'yorkhold_<yyyymmdd>' is to
--** be created (separately).

--** Last Updated: 20210721

-- D_INTERVAL_TEMPORAL_1A

-- Note that this extracts all data from the YKDB; those not 
-- present in the MADB will have a NULL YPDT_SAM_ID.

create view v_tr_dit1a as
select
t.int_id as ypdt_int_id
,t.york_int_id
,t2.ypdt_sam_id
,dit1a.sam_id as sam_id
,dit1a.sam_sample_name
,t2.ypdt_sam_sample_name
,dit1a.sam_sample_date
,dit1a.sam_analysis_date
,dit1a.sam_lab_sample_id
,t2.ypdt_sam_lab_sample_id
,dit1a.sam_lab_job_number
,t2.ypdt_sam_lab_job_number
,dit1a.sam_internal_id
,dit1a.sam_sample_name_ouom
,dit1a.sam_type_code
,t2.ypdt_sam_type_code
,dit1a.sam_sample_date_ouom
,dit1a.sam_comment
,dit1a.sam_data_file
,dit1a.sys_time_stamp
,dit1a.data_id
,row_number() over (order by dit1a.sam_id) as rkey
from 
yorkdb_20210503.dbo.d_interval_temporal_1a as dit1a
inner join 
-- this is the york-to-ypdt int_id conversion
(
select
dia.int_id
,cast(dia.int_name_alias as int) as york_int_id
from 
oak_20160831_master.dbo.d_interval_alias as dia
where dia.int_alias_type_code=1
) as t
on dit1a.int_id=t.york_int_id
left outer join 
-- this is the current contents of the master db
(
select
dit1a.int_id
,dit1a.sam_id as ypdt_sam_id
,dit1a.sam_sample_date 
,dit1a.sam_sample_name as ypdt_sam_sample_name
,dit1a.sam_lab_sample_id as ypdt_sam_lab_sample_id
,dit1a.sam_lab_job_number as ypdt_sam_lab_job_number
,dit1a.sam_type_code as ypdt_sam_type_code
from 
oak_20160831_master.dbo.d_interval_temporal_1a as dit1a
inner join oak_20160831_master.dbo.d_interval_alias as dia
on dit1a.int_id=dia.int_id
where 
dia.int_alias_type_code=1
) as t2
on t.int_id=t2.int_id and t2.sam_sample_date=dit1a.sam_sample_date and dit1a.sam_type_code=t2.ypdt_sam_type_code

-- D_INTERVAL_TEMPORAL_1B

-- Note that there is an issue matching the RD_NAME_CODEs between 
-- the DBs; as such, this view is used to compare the RD_NAME_OUOM
-- and RD_NAME_DESCRIPTION.  Unmatched names should either be added
-- to R_READING_ALIAS (where the parameter already exists) or 
-- R_RD_NAME_CODE (if it does not).  These will have a value of
-- -'-9999' for YPDT_RD_NAME_CODE

create view v_tr_rd_name_code as
select
t.rd_name_ouom
,case
when rrnc.rd_name_code is not null then rrnc.rd_name_code
when rrna.rd_name_code is not null then rrna.rd_name_code
else -9999
end as ypdt_rd_name_code
,case
when rrnc.rd_name_code is not null then rrnc.rd_name_description
when rrna.rd_name_code is not null then rrna.reading_name_alias
else '-9999'
end as ypdt_rd_name_description
from 
(
select
distinct( dit1b.rd_name_ouom ) as rd_name_ouom
from 
yorkdb_20210503.dbo.d_interval_temporal_1b as dit1b
inner join yorkdb_20210503.dbo.v_tr_dit1a as v
on dit1b.sam_id=v.sam_id
) as t
left outer join oak_20160831_master.dbo.r_rd_name_code as rrnc
on t.rd_name_ouom like rrnc.rd_name_description
left outer join oak_20160831_master.dbo.r_reading_name_alias as rrna
on t.rd_name_ouom like rrna.reading_name_alias

-- D_INTERVAL_TEMPORAL_1B; UNIT_CODE

-- Note that, similarly to RD_NAME_CODEs, the UNIT_CODEs should
-- also be examined.  These should also be incorporated (or 
-- modified) as necessary.

create view v_tr_unit_code as
select
t.rd_unit_ouom
,t.rcount
,case
when ruc.unit_code is not null then ruc.unit_code
else
case
when t.rd_unit_ouom = 'pH' then 32
when t.rd_unit_ouom = 'mV' then 106
when t.rd_unit_ouom = '/100mL' then 207
else -9999
end
end as ypdt_unit_code
,case
when ruc.unit_code is not null then ruc.unit_description
else
case
when t.rd_unit_ouom = 'pH' then 'pH Units'
when t.rd_unit_ouom = 'mV' then 'millivolts'
when t.rd_unit_ouom = '/100mL' then 'per100mL'
else '-9999'
end
end as ypdt_unit_description 
from 
(
select
rd_unit_ouom
,count(*) as rcount
from 
yorkdb_20210503.dbo.d_interval_temporal_1b as d1b
inner join yorkdb_20210503.dbo.v_tr_dit1a as v
on d1b.sam_id=v.sam_id
group by 
rd_unit_ouom
) as t
left outer join oak_20160831_master.dbo.r_unit_code as ruc
on t.rd_unit_ouom = ruc.unit_description

-- D_INTERVAL_TEMPORAL_1B

-- Note that this extracts records from D_INTERVAL_TEMPORAL_1B
-- based upon v_tr_dit1a

create view v_tr_dit1b as
select
d1b.sam_id
,v.ypdt_sam_id
,d1b.rd_value_qualifier
,d1b.rd_value
,vrnc.ypdt_rd_name_code
,vuc.ypdt_unit_code
,d1b.rd_mdl
,d1b.rd_rdl
,vrnc.ypdt_rd_name_description
,d1b.rd_value_ouom
,vuc.ypdt_unit_description
,d1b.rd_mdl_ouom
,d1b.rd_rdl_ouom
,d1b.rd_comment
,d1b.sys_record_id
,cast(null as integer) as ypdt_sys_record_id
,d1b.sys_time_stamp
,row_number() over (order by d1b.sys_record_id) as rkey
from 
yorkdb_20210503.dbo.d_interval_temporal_1b as d1b
inner join
(
select
*
from 
yorkdb_20210503.dbo.v_tr_dit1a
where 
ypdt_sam_id is null
) as v
on d1b.sam_id=v.sam_id 
inner join yorkdb_20210503.dbo.v_tr_rd_name_code as vrnc
on d1b.rd_name_ouom=vrnc.rd_name_ouom
inner join yorkdb_20210503.dbo.v_tr_unit_code as vuc
on d1b.rd_unit_ouom=vuc.rd_unit_ouom

-- This is the old version; it seems to take quite a long
-- time to run in conjunction with subsequent statements

create view v_tr_dit1b as
select
d1b.sam_id
,v.ypdt_sam_id
,d1b.rd_value_qualifier
,d1b.rd_value
,vrnc.ypdt_rd_name_code
,vuc.ypdt_unit_code
,d1b.rd_mdl
,d1b.rd_rdl
,vrnc.ypdt_rd_name_description
,d1b.rd_value_ouom
,vuc.ypdt_unit_description
,d1b.rd_mdl_ouom
,d1b.rd_rdl_ouom
,d1b.rd_comment
,d1b.sys_record_id
,cast(null as integer) as ypdt_sys_record_id
,d1b.sys_time_stamp
,row_number() over (order by d1b.sys_record_id) as rkey
from 
york_20170823.dbo.d_interval_temporal_1b as d1b
inner join york_20170823.dbo.v_tr_dit1a as v
on d1b.sam_id=v.sam_id 
inner join york_20170823.dbo.v_tr_rd_name_code as vrnc
on d1b.rd_name_ouom=vrnc.rd_name_ouom
inner join york_20170823.dbo.v_tr_unit_code as vuc
on d1b.rd_unit_ouom=vuc.rd_unit_ouom

-- Create D_INTERVAL_TEMPORAL_1A/B tables for incorporation

SELECT
ypdt_int_id,
york_int_id,
ypdt_sam_id,
sam_id,
sam_sample_name,
ypdt_sam_sample_name,
sam_sample_date,
sam_analysis_date,
sam_lab_sample_id,
ypdt_sam_lab_sample_id,
sam_lab_job_number,
ypdt_sam_lab_job_number,
sam_internal_id,
sam_sample_name_ouom,
sam_type_code,
ypdt_sam_type_code,
sam_sample_date_ouom,
sam_comment,
sam_data_file,
sys_time_stamp,
data_id,
rkey
into yorkdb_20210503.dbo.dit1a
FROM 
yorkdb_20210503.dbo.v_tr_dit1a
where 
ypdt_sam_id is null

SELECT
sam_id,
ypdt_sam_id,
rd_value_qualifier,
rd_value,
ypdt_rd_name_code,
ypdt_unit_code,
rd_mdl,
rd_rdl,
ypdt_rd_name_description,
rd_value_ouom,
ypdt_unit_description,
rd_mdl_ouom,
rd_rdl_ouom,
rd_comment,
sys_record_id,
ypdt_sys_record_id,
sys_time_stamp,
rkey
into yorkdb_20210503.dbo.dit1b
FROM 
yorkdb_20210503.dbo.v_tr_dit1b

-- Make sure to add a DATA_ID to D_DATA_SOURCE for the chemistry info

insert into oak_20160831_master.dbo.d_data_source
( data_id,data_type,data_description,data_filename )
values 
( 240003500,'Chemistry','Updated York Data - Chemistry; York DB 20210503','YKR-DBS30$SQLDB1_SiteFX_FULL_20210421_194243.bak' )

--** Three equivalent (format) D_INTERVAL_TEMPORAL_2 tables
--** reside in the YKDB; a view that examines the data for
--** each must be created.  The tables are:

--** D_INTERVAL_TEMPORAL_2
--** D_INTERVAL_TEMPORAL_EXT
--** D_INTERVAL_TEMPORAL_YORK
--** D_INTVL_TEMP2

--** The basic structure of each view is basically the same

-- D_INTERVAL_TEMPORAL_2

create view v_tr_dit2 as
select
t.int_id as ypdt_int_id
,t.york_int_id
,d.rd_date
,case 
    when d.rd_name_code=707 then 67
    when d.rd_name_code=711 then 85
    else null 
end as rd_type_code
,case
    when d.rd_name_code=163 then 71037 
    when d.rd_name_code=369 then 70871
    when d.rd_name_code=699 then 447
    when d.rd_name_code=700 then 629
    when d.rd_name_code=701 then 611
    when d.rd_name_code=702 then 612
    when d.rd_name_code=703 then 628
    when d.rd_name_code=706 then 70899
    when d.rd_name_code=707 then 70899
    when d.rd_name_code=711 then 629
    else null 
end as rd_name_code
,case 
    when d.unit_code=45 then d.rd_value*0.001
    else d.rd_value
end as rd_value
,case 
    when unit_code=45 then 74
    when unit_code=6  then 6
    when unit_code=3  then 3
    else null
end as unit_code
,d.rd_name_ouom
,d.rd_value_ouom
,d.rd_unit_ouom
,d.sys_record_id
,cast(null as integer) as ypdt_sys_record_id
from 
yorkdb_20210503.dbo.d_interval_temporal_2 as d
inner join 
(
select
dia.int_id
,cast(dia.int_name_alias as int) as york_int_id
from 
oak_20160831_master.dbo.d_interval_alias as dia
where dia.int_alias_type_code=1
) as t
on d.int_id=t.york_int_id
where 
d.rd_name_code in (163,369,699,700,701,702,703,706,707)

-- D_INTERVAL_TEMPORAL_EXT

create view v_tr_ditext as
select
t.int_id as ypdt_int_id
,t.york_int_id
,d.rd_date
,case 
    when d.rd_name_code=707 then 67
    when d.rd_name_code=711 then 85
    else null 
end as rd_type_code
,case
    when d.rd_name_code=163 then 71037 
    when d.rd_name_code=369 then 70871
    when d.rd_name_code=699 then 447
    when d.rd_name_code=700 then 629
    when d.rd_name_code=701 then 611
    when d.rd_name_code=702 then 612
    when d.rd_name_code=703 then 628
    when d.rd_name_code=706 then 70899
    when d.rd_name_code=707 then 70899
    when d.rd_name_code=711 then 629
    else null 
end as rd_name_code
,case 
    when d.unit_code=45 then d.rd_value*0.001
    else d.rd_value
end as rd_value
,case 
    when unit_code=45 then 74
    when unit_code=6  then 6
    when unit_code=3  then 3
    else null
end as unit_code
,d.rd_name_ouom
,d.rd_value_ouom
,d.rd_unit_ouom
,d.sys_record_id
,cast(null as integer) as ypdt_sys_record_id
from 
yorkdb_20210503.dbo.d_interval_temporal_ext as d
inner join 
(
select
dia.int_id
,cast(dia.int_name_alias as int) as york_int_id
from 
oak_20160831_master.dbo.d_interval_alias as dia
where dia.int_alias_type_code=1
) as t
on d.int_id=t.york_int_id
where 
d.rd_name_code in (163,369,699,700,701,702,703,706,707)

-- D_INTERVAL_TEMPORAL_YORK

create view v_tr_dityork as
select
t.int_id as ypdt_int_id
,t.york_int_id
,d.rd_date
,case 
    when d.rd_name_code=707 then 67
    when d.rd_name_code=711 then 85
    else null 
end as rd_type_code
,case
    when d.rd_name_code=163 then 71037 
    when d.rd_name_code=369 then 70871
    when d.rd_name_code=699 then 447
    when d.rd_name_code=700 then 629
    when d.rd_name_code=701 then 611
    when d.rd_name_code=702 then 612
    when d.rd_name_code=703 then 628
    when d.rd_name_code=706 then 70899
    when d.rd_name_code=707 then 70899
    when d.rd_name_code=711 then 629
    else null 
end as rd_name_code
,case 
    when d.unit_code=45 then d.rd_value*0.001
    else d.rd_value
end as rd_value
,case 
    when unit_code=45 then 74
    when unit_code=6  then 6
    when unit_code=3  then 3
    else null
end as unit_code
,d.rd_name_ouom
,d.rd_value_ouom
,d.rd_unit_ouom
,d.sys_record_id
,cast(null as integer) as ypdt_sys_record_id
from 
yorkdb_20210503.dbo.d_interval_temporal_york as d
inner join 
(
select
dia.int_id
,cast(dia.int_name_alias as int) as york_int_id
from 
oak_20160831_master.dbo.d_interval_alias as dia
where dia.int_alias_type_code=1
) as t
on d.int_id=t.york_int_id
where 
d.rd_name_code in (163,369,699,700,701,702,703,706,707)

-- D_INTVL_TEMP2

create view v_tr_ditvl2 as
select
t.int_id as ypdt_int_id
,t.york_int_id
,d.rd_date
,case 
    when d.rd_name_code=707 then 67
    when d.rd_name_code=711 then 85
    else null 
end as rd_type_code
,case
    when d.rd_name_code=163 then 71037 
    when d.rd_name_code=369 then 70871
    when d.rd_name_code=699 then 447
    when d.rd_name_code=700 then 629
    when d.rd_name_code=701 then 611
    when d.rd_name_code=702 then 612
    when d.rd_name_code=703 then 628
    when d.rd_name_code=706 then 70899
    when d.rd_name_code=707 then 70899
    when d.rd_name_code=711 then 629
    else null 
end as rd_name_code
,case 
    when d.unit_code=45 then d.rd_value*0.001
    else d.rd_value
end as rd_value
,case 
    when unit_code=45 then 74
    when unit_code=6  then 6
    when unit_code=3  then 3
    else null
end as unit_code
,d.rd_name_ouom
,d.rd_value_ouom
,d.rd_unit_ouom
,d.sys_record_id
,cast(null as integer) as ypdt_sys_record_id
from 
yorkdb_20210503.dbo.d_intvl_temp2 as d
inner join 
(
select
dia.int_id
,cast(dia.int_name_alias as int) as york_int_id
from 
oak_20160831_master.dbo.d_interval_alias as dia
where dia.int_alias_type_code=1
) as t
on d.int_id=t.york_int_id
where 
d.rd_name_code in (163,369,699,700,701,702,703,706,707)

-- D_INTERVAL_TEMPORAL_2 - Extract

-- Note that this creates the export DIT2 table 

select
v.ypdt_int_id
,v.york_int_id
,v.sys_record_id
,v.ypdt_sys_record_id as ormgp_add_sys_record_id
,d.sys_record_id as ormgp_cur_sys_record_id
,v.rd_date
,v.rd_type_code
,v.rd_name_code
,v.rd_value
,d.rd_value as ormgp_cur_rd_value
,v.unit_code
,v.rd_name_ouom
,v.rd_value_ouom
,v.rd_unit_ouom
,row_number() over (order by v.sys_record_id) as rkey
into yorkdb_20210503.dbo.dit2
from 
yorkdb_20210503.dbo.v_tr_dit2 as v
left outer join oak_20160831_master.dbo.d_interval_temporal_2 as d
on v.ypdt_int_id=d.int_id and v.rd_date=d.rd_date and v.rd_name_code=d.rd_name_code
where 
v.rd_value is not null
and ( d.sys_record_id is null or (d.sys_record_id is not null and not( v.rd_value between (d.rd_value-0.001) and (d.rd_value+0.001) ) ) )

-- Get the current count

-- v20210503 13567485 rows

select
max(rkey) 
from 
yorkdb_20210503.dbo.dit2

-- D_INTERVAL_TEMPORAL_EXT - Extract

-- Note that this adds to the export DIT2 table; update
-- the rkey value (i.e. addition)

insert into yorkdb_20210503.dbo.dit2
(
ypdt_int_id
,york_int_id
,sys_record_id
,ormgp_add_sys_record_id
,ormgp_cur_sys_record_id
,rd_date
,rd_type_code
,rd_name_code
,rd_value
,ormgp_cur_rd_value
,unit_code
,rd_name_ouom
,rd_value_ouom
,rd_unit_ouom
,rkey
)
select
v.ypdt_int_id
,v.york_int_id
,v.sys_record_id
,v.ypdt_sys_record_id as ormgp_add_sys_record_id
,d.sys_record_id as ormgp_cur_sys_record_id
,v.rd_date
,v.rd_type_code
,v.rd_name_code
,v.rd_value
,d.rd_value as ormgp_cur_rd_value
,v.unit_code
,v.rd_name_ouom
,v.rd_value_ouom
,v.rd_unit_ouom
,( row_number() over (order by v.sys_record_id) ) + 13567485 as rkey
from 
yorkdb_20210503.dbo.v_tr_ditext as v
left outer join oak_20160831_master.dbo.d_interval_temporal_2 as d
on v.ypdt_int_id=d.int_id and v.rd_date=d.rd_date and v.rd_name_code=d.rd_name_code 
where 
v.rd_value is not null
and ( d.sys_record_id is null or (d.sys_record_id is not null and not( v.rd_value between (d.rd_value-0.001) and (d.rd_value+0.001) ) ) )

-- v20210503 13586981 rows

select
max(rkey) 
from 
yorkdb_20210503.dbo.dit2

-- D_INTERVAL_TEMPORAL_YORK - Extract

-- Note that this adds to the DIT2 export table; update
-- the rkey value (i.e. addition)

insert into yorkdb_20210503.dbo.dit2
(
ypdt_int_id
,york_int_id
,sys_record_id
,ormgp_add_sys_record_id
,ormgp_cur_sys_record_id
,rd_date
,rd_type_code
,rd_name_code
,rd_value
,ormgp_cur_rd_value
,unit_code
,rd_name_ouom
,rd_value_ouom
,rd_unit_ouom
,rkey
)
select
v.ypdt_int_id
,v.york_int_id
,v.sys_record_id
,v.ypdt_sys_record_id as ormgp_add_sys_record_id
,d.sys_record_id as ormgp_cur_sys_record_id
,v.rd_date
,v.rd_type_code
,v.rd_name_code
,v.rd_value
,d.rd_value as ormgp_cur_rd_value
,v.unit_code
,v.rd_name_ouom
,v.rd_value_ouom
,v.rd_unit_ouom
,( row_number() over (order by v.sys_record_id) ) + 13586981 as rkey
from 
yorkdb_20210503.dbo.v_tr_dityork as v
left outer join oak_20160831_master.dbo.d_interval_temporal_2 as d
on v.ypdt_int_id=d.int_id and v.rd_date=d.rd_date and v.rd_name_code=d.rd_name_code 
where 
v.rd_value is not null
and ( d.sys_record_id is null or (d.sys_record_id is not null and not( v.rd_value between (d.rd_value-0.001) and (d.rd_value+0.001) ) ) )

-- v20210503 14568344 rows

select
max(rkey) 
from 
yorkdb_20210503.dbo.dit2

-- D_INTVL_TEMP2 - Extract

-- Note that this adds to the DIT2 export table; update
-- the rkey value (i.e. addition)

insert into yorkdb_20210503.dbo.dit2
(
ypdt_int_id
,york_int_id
,sys_record_id
,ormgp_add_sys_record_id
,ormgp_cur_sys_record_id
,rd_date
,rd_type_code
,rd_name_code
,rd_value
,ormgp_cur_rd_value
,unit_code
,rd_name_ouom
,rd_value_ouom
,rd_unit_ouom
,rkey
)
select
v.ypdt_int_id
,v.york_int_id
,v.sys_record_id
,v.ypdt_sys_record_id as ormgp_add_sys_record_id
,d.sys_record_id as ormgp_cur_sys_record_id
,v.rd_date
,v.rd_type_code
,v.rd_name_code
,v.rd_value
,d.rd_value as ormgp_cur_rd_value
,v.unit_code
,v.rd_name_ouom
,v.rd_value_ouom
,v.rd_unit_ouom
,( row_number() over (order by v.sys_record_id) ) + 14568344 as rkey
from 
yorkdb_20210503.dbo.v_tr_ditvl2 as v
left outer join oak_20160831_master.dbo.d_interval_temporal_2 as d
on v.ypdt_int_id=d.int_id and v.rd_date=d.rd_date and v.rd_name_code=d.rd_name_code 
where 
v.rd_value is not null
and ( d.sys_record_id is null or (d.sys_record_id is not null and not( v.rd_value between (d.rd_value-0.001) and (d.rd_value+0.001) ) ) )

-- v20210503 14568355 rows

select
max(rkey) 
from 
yorkdb_20210503.dbo.dit2

-- v20210503 14568355 rows total

select 
count(*) 
from 
yorkdb_20210503.dbo.dit2


-- v20210503 1861164 rows updated

select 
count(*) 
from 
yorkdb_20210503.dbo.dit2
where 
ormgp_cur_sys_record_id is not null


-- v20210503 12707191 rows new

select 
count(*) 
from 
yorkdb_20210503.dbo.dit2
where 
ormgp_cur_sys_record_id is null



-- Make sure to add a DATA_ID for each of the updated and new data

insert into oak_20160831_master.dbo.d_data_source
( data_id,data_type,data_description,data_filename )
values 
( 240003501,'Water Levels and Other','Updated York Data - Various Temporal 2 (new); York DB 20210503','YKR-DBS30$SQLDB1_SiteFX_FULL_20210421_194243.bak' )

insert into oak_20160831_master.dbo.d_data_source
( data_id,data_type,data_description,data_filename )
values 
( 240003502,'Water Levels and Other','Updated York Data - Various Temporal 2 (replacement); York DB 20210503','YKR-DBS30$SQLDB1_SiteFX_FULL_20210421_194243.bak' )

-- Those records with a non-null ormgp_cur_sys_record_id will use an update
-- query; note the DATA_ID and the removal of the _ouom field values

update oak_20160831_master.dbo.d_interval_temporal_2
set
data_id= 240003502
,rd_value= d.rd_value
,rd_value_ouom=null
,rd_unit_ouom=null
from 
oak_20160831_master.dbo.d_interval_temporal_2 as d2
inner join temphold.dbo.yorkdb_dit2_20210723 as d
on d2.sys_record_id=d.ormgp_cur_sys_record_id

-- Those records with a null ormgp_cur_sys_record_id will be inserted; note
-- the DATA_ID and the matching of the _ouom field values

-- populate the ormgp_add_sys_record_id field; note that if a large number of records
-- are to be added, this will need to be done in stages (say 2,000,000 at-a-time)

insert into oak_20160831_master.dbo.d_interval_temporal_2
(
int_id,
sys_record_id,
rd_date,
rd_type_code,
rd_name_code,
rd_value,
unit_code,
rd_value_ouom,
rd_name_ouom,
rd_unit_ouom,
data_id,
sys_temp1,
sys_temp2
)
SELECT
ypdt_int_id as int_id,
ormgp_add_sys_record_id as sys_record_id,
d.rd_date,
d.rd_type_code,
d.rd_name_code,
d.rd_value,
d.unit_code,
d.rd_value as rd_value_ouom,
rrnc.rd_name_description as rd_name_ouom,
ruc.unit_description as rd_unit_ouom,
240003501 as data_id,
'20210723a' as sys_temp1,
20210723 as sys_temp2
FROM 
temphold.dbo.yorkdb_dit2_20210723 as d
inner join oak_20160831_master.dbo.r_rd_name_code as rrnc
on d.rd_name_code=rrnc.rd_name_code
left outer join oak_20160831_master.dbo.r_unit_code as ruc
on d.unit_code=ruc.unit_code
where 
ormgp_cur_sys_record_id is null



