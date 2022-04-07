---
title:  "Appendix H"
author: "ormgpmd"
date:   "20220202"
output: html_document
knit:   (
            function(input_file, encoding) {
                out_dir <- '';
                rmarkdown::render(
                    input_file,
                    encoding=encoding,
                    output_file=file.path(dirname(input_file), out_dir,
                    'H_Current_Problems.html')
                )
            }
        )
---

## Appendix H - Current Problems (To Be Corrected) or Suggestions

*20121022*

Duplicate reports and report records found in the Report Library (directories) as well as D_LOCATION and D_DOCUMENT.  In some (other) cases, duplicate reports have been deleted from the RL but not removed from D_DOCUMENT/D_LOCATION.  Some files have been loaded into incorrect DOC_FOLDER_ID directories.

*20121030*

Some Environment Canada (precipitation only) data has been loaded twice.  RD_NAME_OUOM's are: Precipitation - Day; Day Precip.  Otherwise all other fields are duplicated.  Refer to Section 3.2.2 ('Total Monthly Precipitation, Average Temperature and Water Level Data') where this problem was first noted.  This problem is down to the repetition of, for example, 'Day Precip' and 'Precipitation - Day' being converted to the same RD_NAME_CODE - the values are then duplicated.  The same occurs for the equivalent fields of 'Day Snow' and 'Day Rain'.

Borehole loggers, recording groundwater temperature data, have been incorrectly tagged with RD_NAME_CODE '369' ('Temperature (Air)').  These should instead be tagged with code '70871' ('Temperature (Water) - Logger').  Refer to Section 3.2.2 (as above) where this problem was first noted. There is also actual 'air' temperatures tagged against a well/borehole interval.

*20121101*

Some values in D_INTERVAL_TEMPORAL_2 have been tagged with a 'no value' key of '-999'.  Should these records be removed entirely or converted to NULL.

*20121203*

Some borehole locations have had (at some previous time - early 2011?) a second 'false' interval (1ft at bottom of hole) added erroneously.

*20130218*

D_LOCATION_AGENCY currently stores locations with the tag 'LTCRA'; this should instead be 'LTRCA'.  Also, the area applied to locations with this tag should, more appropriately, have the tag 'TRENTSWP' with the 'LTRCA' tag applied to the smaller area.

*20130322*

The application of GEOL_SUBCLASS_CODE needs to be reviewed.  At present, most information in D_GEOLOGY_LAYER  has a NULL value applied.  Review changes in R_GEOL_SUBCLASS_CODE (i.e. incorporation of 'Invalid' and 'Alternate' entries).

*20130408*

A review of how useful many of the views are in relation to their long-run times.  Should these be replaced with 'summary' tables containing (monthly?) updateable values for easy reference?

*20130419a*

Regarding the PICKS table - currently, active picking is working (after modification) against the PICKS2 table.   The following changes need to be implemented against PICKS including:

Task 1
Drop the field named by rowguid (note that this is not possible for a replicated table - evaluate in the next database version)

This field appears to prevent table updates.  (SQL Uniqueidentifier field types are also usually not recommended.)

Dynamically adding a unique identifier is handled in changes listed below.

Task 2
Set the Primary Key for fields Loc_id and Formation

This is used to ensure that you cannot make two picks with the same loc_id and formation in one borehole.

Task 3
Add default constraints for UNIQUEID and PICKDATE

UNIQUEID can be used instead of  rowguid for uniqueness identification.  The default Pickdate is set to the current date.

Task 4
Create a Nonclustered Index for Loc_id (for delete performance)

This is needed to improve the delete performance

Notes and SQL statements for this process are to be found in the directory 'v:\db\sql_queries\20130415_picks' on MDM6500.  These have been applied to the PICKS2 table.

In addition, the original GND_ELEV trigger and the user name ('suser_sname()') function call have been reapplied without (much) change in the picking process (i.e. with regard to the time required for creating/deleting pick records).

*20130419b*

With regard to SiteFX - the replication should not examine changes to the SYS_TEMP1 or SYS_TEMP2 fields as SiteFX uses this to temporarily 'tag' individual rows without otherwise changing the actual data.  This tends to apply to entire tables at any one time.  The replication process views this as an actual change for a row and transfers all the information for that row (and, thus, the entire table) between the publisher and subscribers.  It has been suggested to add a SYS_TEMP3 field which can be used to tag rows by the YPDT-CAMC group and partner agencies but is not otherwise recognized by SiteFX.

In addition, the SYS_LAST_MODIFIED and SYS_LAST_MODIFIED_BY fields should be adjusted in the same manner, to look only for changes in data not modification of the temporary fields. 

*20130807*

Look into locking the UTM coordinates for the partners (i.e. disabling the ability to modify the coordinates of a location at the partner agency end; this is to prevent unintentional modification when examining locations in Viewlog).

*20130807*

The table R_GEOL_LAYERTYPE_CODE, originally found in the Access database, needs to be added back into the Master YPDT-CAMC database.

*20130927*

Geology top- and bottom-depths have been found to cross; this appears to be from the MOE imports.  Some areas have been fixed (e.g. Peel and South Simcoe/OGS Wells) but should be consistently looked at (see for example Section G.5 in the Appendix).

*20130927b*

In some cases, the bottom depth of the well has not been included.  If other (valid) information is present (e.g. material codes), it is assumed that the driller stopped at an obstruction (of some sort) with no-to-little advance in depth, recording only the top depth.  A false value of 1ft (or 0.3m) is to be added in these cases.

*20130927c*

Mixing of cm's and m's has occurred.  This needs to be checked as borehole depth values are invalid when this occurs.

*20130927d*

The MOE has changed its original-units-of-measure between releases for some boreholes.  That is, previous wells listed as m's depth are now considered to be in ft.  A global check for this should be (as used in previous cases): if the values are integer only, consider them ft; otherwise they are m's.

*20131016*

The D_INTERVAL_TEMPORAL_1B table should, in the next version of the database, have a primary key setup for both the SAM_ID and the RD_NAME_CODE so as to avoid duplicate information for any particular sample.  Note that this may be difficult as RD_NAME_CODE is created subsequent to the import (the RD_NAME_OUOM field is the one being populated, leading to possible errors as multiple text names can be used for any one parameter; see R_READING_NAME_ALIAS table for examples).

*20131023*

Should another QA_COORD_CONFIDENCE_CODE be made available to indicated those locations whose coordinates are valid but which lie outside of the YPDT-CAMC buffered area and within Ontario.  This would be applied as a substitute for the QA code of '117' (which was originally meant to tag wells with invalid coordinates).

*20131206a*

All fields with varchar(max) should be converted to varchar(255).  This includes

D_GEOLOGY_LAYER
Others ?.

*20131206b*

Update D_LOCATION_ELEV, adding a ELEV_COMMENT field.

*20131209*

SYS_USER_STAMP in D_INTERVAL_TEMPORAL_1B is not automatically being populated.  Correct this and check that this occurs in other tables.

*20131211*

D_CLIMATE should contain no data.  There currently is nothing contained within it that is not found in other tables.  The table likely needs to remain as SiteFX requires it.  The same can likely be said of D_SURFACEWATER, though the drainage area calculations are stored here (can they be moved elsewhere?).

*20140115*

Currently, the INT_NUMBER column is unused in D_INTERVAL_MONITOR.  Should this be populated to avoid the use of on-the-fly calculations of the total number of screens and the screen number for any particular interval?  (See also V_YPDT_SYS_SCREEN_NUM and V_YPDT_SYS_SCREEN_NUM_TOTAL in the OAK_20120615_UPDATE database.)

*20140115b*

SYS_USER_STAMP also (see 20131209) does not have a default value.  To be corrected.

*20140116*

When setting replication, specify that all documents are to be replicated (not limited by being found within a partner agency boundary).

*20140507*

In the D_INTERVAL_MONITOR table, obvious changes in characteristics (e.g. change in diameter) should necessitate a separate INT_ID.  That is, an examination of existing INT_IDs should be carried out where multiple elevations are specified in the monitor table.  These should be broken into multiple INT_IDs where possible.

*20140604*

D_LOCATION_PURPOSE should not have a SYS_RECORD_ID field as the primary key.  Note that an exception to this (which would result in keeping the PK as is) is if we're recording 'all' purposes applied to that location (and then, these should be dated).

*20140723a*

D_INTERVAL_MONITOR - should this be changed to a 'bit' type from 'real'?  At the moment, ranges of values include NULL, '-1' through '2'.  The '-1' values will be changed to '1' and '0' will be changed to NULL.  What is '2' indicating?

*20140723b*

D_PUMPTEST_STEP - all PUMP_RATE values should be standardized to a single unit (IGPM?).

*20140723c*

D_INTERVAL_TEMPORAL_2 - Specific capacity only has a single value for all intervals in this table.  Should we locate this elsewhere as a single column (maybe D_INTERVAL)?

*20140728*

Some pumptest dates and corresponding water level dates do not match - there seems to have been a misapplication of MDY versus DMY import schemes.

*20140728b*

Should all 'unspecified' values in D_DOCUMENT be changed to strictly NULL values (the latter is easier to pick out when reviewing returned results)?

*20140728c*

Add a view that only pulls LOC_IDs that were originally from the MOE database(s).

*20140815*

Should DOC_ID in D_LOCATION_PROPERTY be a foreign key to D_DOCUMENT.

*20140815b*

Indices (on tables) should be renamed such that the indexed field is part of the index name (partially corrected - currently a mixture of field names or the table name for which the field is a foreign key).

*20140818*

Review D_LOCATION_VULNERABILTY - update the names of these fields.  Do we need to repopulate/add information or locations?  Should this table be removed?

*20140818b*

Should all tables with LOC_ID (for example; applies to any _ID field) have their index changed to 'UNIQUE' when the identifier is a foreign key and only a single row should appear for each _ID field.  (An example of this is found in D_SURFACEWATER.)

*20140819*

The watershed fields in D_LOCATION do not reference the watershed tables - should this be corrected.

*20140819b*

In R_LOGGER_TYPE_READING, should the RD_NAME_CODE refer to the R_RD_NAME_CODE table.

*20140820*

What is S_DATA_SEARCH_INTERVALS used for?  Not added by SiteFX (in the lastest edition) and seemingly not modified since 2004.

*20140820b*

What is S_LOGFILE used for?  Not added by SiteFX (in the latest edition) and seemingly not modified since 2010.  This applies to (with the exception of the dates) each of: S_RPTSETTINGS; S_RPTSETTINGSPARA; S_RPTSETTINGSWELL.

*20140826*

Are R_EQ_GROUP/TYPE_CODE any use?  What is 'Profile' used for in R_GEOL_MAT1_CODE?

*20140826b*

Should S_CHANGE_HISTORY be copied between database versions?

*20140827*

From D_BOREHOLE:
Should MOE_BH_GEOLOGY_CLASS be dropped?
What is BH_KB_ELEV, BH_KB_ELEV_OUOM and BH_KB_ELEV_UNIT_OUOM for (currently blank)?

Should D_DATABASE_NOTE be copied (one entry - Mezmure)?

What is INT_MORE_1_PART for in D_INTERVAL (currently empty)?

Add indexes to D_INTERVAL_FORMATION_ASSIGNMENT.  Do we need add additional models to this table?

D_INTERVAL_MONITOR - has a MON_ID and SYS_RECORD_ID; which should we use as the primary key (currently the latter)?

D_INTERVAL_REF_ELEV - REF_POINT should be adjusted (after the conversion to the new database) to reflect information as expected by SiteFX.

For D_LOCATION_QA:
Should we remove QA_PUMPING_CODE
Should we remove QA_WL_STATIC.

*20140908*

Location ID's are not being removed from the D_LOCATION_AGENCY tab le when, likely, they are being removed from D_LOCATION.

*20141008*

There is an issue with partners importing data into their versions of the database and synchronizing against the master.

Even though they are restricted (hopefully) to a designated range of values, they are working with a subset of the database; rows that are present in the master are not available in their version.  As such, their import software can create identifiers that will conflict with identifiers in the master during synchronization.  This is currently happening with the NVCA data.

*20141015*

In the new version of the database, the DATA_ID field (found in most tables) should be NULL by default instead of populating with a random number.  

*20141124*

When populating the SiteFX Access version of the database (i.e. using a blank database created by SiteFX and inserting into the empty tables) at times (the latest example was against D_INTERVAL_TEMPORAL_1B) a row cannot be inserted.  Instead it returns the error:

[Microsoft][ODBC Microsoft Access Driver] Error evaluating  CHECK constraint.  (SQL-HY000) at ?

When the table is cleared and the process restarted, the population completes without further error.  Upon investigation, no data-related reason could be seen for this problem to occur.  Note that this has happened multiple times before but was taken as a data issue.

*20141201*

Users are inputting 'Temperature' records without further selecting the appropriate temperature reading name based upon the interval type (e.g. climate stations should be meteorological, screens should be logger related and spot flows should be field related).  Care should be taken when inputting these values.

In addition, parameters have been assigned to invalid temporal tables (e.g. herbicides to DIT2; water levels to DIT1B).  This is likely due to the default SiteFX import function.

*20150811*

OWN_NAME in D_OWNER should be changed to type varchar(255).  OWN_COMMENT should also be changed to varchar(255).













