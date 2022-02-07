
--***** G_10_09_04

--***** Add any missing MOE driller codes (i.e. CONTRACTOR) into the R_BH_DRILLER_CODE table

select
t.BH_DRILLER_DESCRIPTION
,t.BH_DRILLER_DESCRIPTION_LONG
,t.BH_DRILLER_ALT_CODE
from 
(
select
cast('MOE Driller No. ' + cast(moewwr.CONTRACTOR as varchar(255)) as varchar(255)) as BH_DRILLER_DESCRIPTION
,cast('MOE Driller No. ' + cast(moewwr.CONTRACTOR as varchar(255)) as varchar(255)) as BH_DRILLER_DESCRIPTION_LONG
,cast(moewwr.CONTRACTOR as varchar(255)) as BH_DRILLER_ALT_CODE
from 
MOE_20210119.dbo.YC_20210119_BH_ID as y
left outer join MOE_20210119.dbo.TblWWR as moewwr
on y.WELL_ID=moewwr.WELL_ID
left outer join
OAK_20160831_MASTER.dbo.R_BH_DRILLER_CODE as rbdc
on moewwr.CONTRACTOR collate database_default=rbdc.BH_DRILLER_ALT_CODE collate database_default 
where 
rbdc.BH_DRILLER_CODE is null
) as t
group by
t.BH_DRILLER_DESCRIPTION,t.BH_DRILLER_DESCRIPTION_LONG,t.BH_DRILLER_ALT_CODE


-- v20170905 9 rows inserted
-- v20180530 15 rows
-- v20190509 11 rows
-- v20200721 22 rows
-- v20210119 29 rows

insert into [OAK_20160831_MASTER].dbo.R_BH_DRILLER_CODE
(BH_DRILLER_DESCRIPTION,BH_DRILLER_DESCRIPTION_LONG,BH_DRILLER_ALT_CODE)
select
t.BH_DRILLER_DESCRIPTION
,t.BH_DRILLER_DESCRIPTION_LONG
,t.BH_DRILLER_ALT_CODE
from 
(
select
cast('MOE Driller No. ' + cast(moewwr.CONTRACTOR as varchar(255)) as varchar(255)) as BH_DRILLER_DESCRIPTION
,cast('MOE Driller No. ' + cast(moewwr.CONTRACTOR as varchar(255)) as varchar(255)) as BH_DRILLER_DESCRIPTION_LONG
,cast(moewwr.CONTRACTOR as varchar(255)) as BH_DRILLER_ALT_CODE
from 
MOE_20210119.dbo.YC_20210119_BH_ID as y
left outer join MOE_20210119.dbo.TblWWR as moewwr
on y.WELL_ID=moewwr.WELL_ID
left outer join
OAK_20160831_MASTER.dbo.R_BH_DRILLER_CODE as rbdc
on moewwr.CONTRACTOR collate database_default=rbdc.BH_DRILLER_ALT_CODE collate database_default 
where 
rbdc.BH_DRILLER_CODE is null
) as t
group by
t.BH_DRILLER_DESCRIPTION,t.BH_DRILLER_DESCRIPTION_LONG,t.BH_DRILLER_ALT_CODE


--***** v20170905, v20180530
--***** as we're working against a weekly db (not the master, a backup), pull across and hold any drillers
--***** we've added in a temporary table (to be added to the master db table)

select
BH_DRILLER_CODE
,BH_DRILLER_DESCRIPTION
,BH_DRILLER_DESCRIPTION_LONG
,BH_DRILLER_ALT_CODE
,SYS_TIME_STAMP
,SYS_USER_STAMP
into MOE_20210119.dbo.M_R_BH_DRILLER_CODE
from
oak_20160831_master.dbo.r_bh_driller_code
where 
--sys_time_stamp>'2018-06-25'
--sys_time_stamp>'2019-05-15'
--sys_time_stamp>'2020-07-30'
sys_time_stamp>'2021-01-19'
--order by
--sys_time_stamp desc



