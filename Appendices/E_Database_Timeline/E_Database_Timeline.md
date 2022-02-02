---
title:  "Appendix E"
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
                    'E_Database_Timeline.html')
                )
            }
        )
---

## Appendix E - YPDT-CAMC (ORMGP) Database Timeline

#### Database Release 1 (First Released 2003)

*20040629 ('YPDT Database Meeting - June 29, 2004' Memo)*

Comments
* Report library to be kept as separate database; reports should have LOC_ID's assigned
* ID's will be random
* Report database should have columns for tracking info (e.g. does it have boreholes, geophysics, etc ...)
* SiteFX should be developed to access reports in C:\OAKRIDGES directory through selection

July Database Release
* Some P1 wells have changed location (up to 4km)
* Errors in locations (coordinates): Nottawasaga, Scugog, York
* Elevation code of '1' should never be updated (these wells do not match the DEM)
* Implement QA code for elevation; keep the difference between the DEM and original elevation
* Outline database policy in manual/user guide
* UGAIS geology - split spoon samples only; first three columns would be Materials 1-3 and column 4 will be the sample interval; blow counts, etc ... will also be incorporated; water levels in feet - to be fixed
* Screens are to be assigned to hydrostratigraphy

Water Level Discussion
* Create a temporary water level inventory table for each well - provides a synthesis of water level information (e.g. maximum, minimum, average, last)
* Table will have all locations (possible more than once; e.g. water level and water level for pumping rates)
* Skip chemistry (for now)

Water Level Structure
* Existing structure is York region (logger's produce 100000 records per year)
* Access time rather than amount of data introduces difficulties
* Archive data that isn't being used?
* Use multiple linked tables segregated on a time interval (say five years)
* Using BLOB's for water level data - is it too much of a black box? (i.e. will it be accessible?)
* All temporal data tables to be treated as a single table within SiteFX
* Policy needed on how to switch to archive
* Validating of data
* Link GSC database for internal QA
* Update County and Township codes for all wells 
* York wants to (continue to) use Microsoft SQL Server
    + Keep all water levels in one SQL Server table; install the Microsoft Database Engine so that Microsoft Access can read/process the SQL Server table
    + Use BLOB's to reduce the size of the tables

#### Database Release 2 (First Released 2004)

*20050117 ('YPDT Database Meeting' Memo)*

Comments
* Additional GSC database components to be added to the database
* Modification of records should only be accomplished by a single person
* A running record of changes should be kept
* QA/QC procedures need to be in place (for acceptance of data into the database)
    + Track changes form to be returned with database submissions
    + No trading of databases (between partners)
    + All changes to be approved by overseer (one for each of: West; Central; and East)
    + Each synchronization requires SiteFX document outlining changes and including explanations
* Reconciliation is currently too long and painful (import/export through SiteFX?)
* Agency flag table should be in the database and populated - include a buffer around the agency
* Location names must be standardized
* When adding information to the database:
    + The data source must be populated (master source and then details concerning the source)
    + The location table must be tidied up to reflect at least one and maybe two levels of water (the primary watershed flowing into Lake Ontario or Lake Simcoe and the secondary watershed that may or may not be populated)
    + Location QA code must be populated; standard methodology must be documented
    + All locations must have a DEM elevation and wells have a bottom depth and elevation
    + A linkage from a location to a report must be established; links between log information and scanned original
* Next database reconciliation August 1, 2005
* Proposed Import/Export tool (in SiteFX); incorporate into February training course

*20050322 ('YPDT Database Meeting' memo)*

Comments
* INT_GEOLOGY in D_INTERVAL table will be used to manually assign screen to a geologic unit (anyone can fill this column); this can override the automatic updated table if a head map is produced
* Addition of D_LOCATION_HYDROSTRAT; automatically populated; includes LOC_ID, HYDROSTRAT_UNIT, TOP_ELEV, BOT_ELEV
* DEM will always be the top of RAC; each unit will be represented in each BH (RAC, HKT Aquitard, ORAC, NT Aquitard, TAC, SD Aquitard, SAC, WBAC, Bedrock Aquitard, Channel silts, Channel sands
* Naming conventions - four aquifer complexes: SAC; TAC; ORAC; RAC (Recent surficial stuff); longer term - each of these can have a modifier that describes a more local aquifer setting (e.g. we can have ORAC-Caledon or ORAC-Brougham, etc ...)
* An IBOUNDS file should be set up to reflect existence of each unit (once geology finalized); used to clip head maps in each aquifer; should be created automatically
* Get new wells from Azimuth, Jagger-Hims, Golder
* Review bedrock surface (process and/or methodology; include outcrop)
* Produce series of equations to calculated vertical gradients between two aquifers (only where both aquifers present)

*20060303 through 20060426 ('New Database Notes' Memo)*

Comments
* Import db table D_LIBRARY; reconcile lookup tables with existing; remove/archive D_DOC_BH, D_DOC_DOCUMENT and D_DOC_ASSOC
* D_INTERVAL_EQUIPMENT; check and dump
* Should specific capacity be assigned an interval property - is it more a function of the well (especially bedrock wells); leave for now (change in next database?)
* D_INTERVAL_PUMP; remove
* D_INTERVAL_SOIL; replace with D_INTERVAL_HYDROMETER and D_INTERVAL_SPLITSPOON?; review, take soils data out of database and redefine tables
* D_HYDROMETER and D_HYDROMETER_READINGS; remove
* D_INTERVAL_TEMPORAL_BASEFLOW_EC_ZIP; contains blob's; keep ADV and L tables as summary of contents; include sample queries for de-blobbing/access; all EC_ZIP tables combined into single table D_INTERVAL_TEMPORAL_TYPE_ENVCAN
* D_INTERVAL_TEMPORAL_BULK; contains flow rates from spot flow locations; information should be moved into spotflow tables - SWFLOW_EC and SWFLOW_OTHER coded with station type; restructure all temporal data table into 4 tables, only
* D_DATA_SOURCE is used to describe datasets; linked to DATA_ID fields
* D_INTERVAL_TEMPORAL_CLIMATE; empty, remove
* D_INTERVAL_MONITOR; many intervals with 'good' top- and bottom-depths, calculated elevations -10000; these are from 'nodata' markers of -99999; SiteFX needs to recalculate elevations using DEM as base; many intervals with screens greater than 10m (some greater than 50m); no action at present; review interval types
* D_INTERVAL_PROPERTY; leave as is - use RD_NAME_CODE to map _OUOM to reading code; handled through SiteFX
* D_INTERVAL_TEMPORAL_DATA; move all water levels to D_INTERVAL_TEMPORAL_WL; include soil and water quality data?
* D_INTERVAL_TEMPORAL_DATA_DETAILS should be linked to D_INTERVAL_TEMPORAL_DATA; should these be relabelled to chemistry data?
* D_INTERVAL_TEMPORAL_LOGGER_ZIP; empty, remove and add logger files to _WL_ZIP
* D_INTERVAL_TEMPORAL_PROD; no field descriptions; York tracking?; remove and extract WL and pumping data;
* D_INTERVAL_TEMPORAL_PUMP; remove, data extracted
* D_INTERVAL_TEMPORAL_PUMP_ADV; remove, data extracted
* D_INTERVAL_TEMPORAL_SWFLOW; empty, remove
* D_INTERVAL_TEMPORAL_SWFLOW_ADV; empty, remove
* D_INTERVAL_TEMPORAL_SWFLOW_BASEFLOW; where did this information go; review
* D_INTERVAL_TEMPORAL_WL; reconcile consistent name of tables (table classes: WL, WL_ADV, WL_Summary, WL_ZIP, WL_EC_ZIP); repeat for _SWFLOW; latter must contain all partner spotflows; tables keeping should have consistent fields in consistent order (some of these temporal tables have extra fields)
* Repeat previous structure with: CLIMATE; WQ; PUMP; remove BULK
* Incorporate all PGMN data, municipal data, MOE data into 4 (previously mentioned) temporal tables; do not have a temporal table per partner agency per data type; queries should separate the data, not the tables
* Correct Bathurst water levels (check codes)
* Merge York water level data; some records in fasl; information out of date?
* INTERVAL_TEMPORAL_WL_HISTORICAL; mix of water levels from various well sources here; clean up and move to 4 temporal tables
* _OUOM has special meaning throughout database; cannot be changed (used by SiteFX?)
* D_LOCATION
    + added a CA code, keep
    + LOC_USER_ID, remove this field 
    + UTM_ZONE_OUOM, left as is, not changed to UTM_ZONE as suggested
    + LOC_ACTIVE vs LOC_STATUS; move the active code field (as they both pertain to the same information)
    + correct LOC_COUNTY_CODE for locations where it is missing; same for LOC_TOWNSHIP_CODE
    + LOC_BASIN1 to 11; remove; populate Watershed1 field using Viewlog
    + remove WATERSHED_DEV field
    + no sources identified for a number of locations; add D_DATA_SOURCE table and reference
    + review climate station locations (counts are off)
    + add location (and interval) confidentiality codes and look-up table
    + D_LOCATION_PURPOSE separate from LOC_USE_PRIMARY_CODE and LOC_USE_SECONDARY_CODE, the latter being populated by MOE codes
    + LOC_CORR; unknown MOE flag
    + change name in LOC_NAME_ALT1 to 'Owner name withheld by MOE' for new wells added (from MOE)
* D_LOCATION_ACTIVITY; used to track changes if required; not standardized
* A number of locations do not have an AVI code in the AVI table; re-run analysis?
* LOC_PURPOSE; review to include all locations (not just boreholes?)
* D_LOCATION_QA
    + some locations do not have QA codes; this needs to be fixed (catch it in SiteFX)
    + include revised date (for elevation update) in QA_ELEV_METHOD
    + rename QA_ELEV_CONFIDENCE_CODE?
    + change coordinate confidence codes for Environment Canada stations (elevations should be blank); same for surface water stations
    + All outcrops assigned a QA_ELEV_CONFIDENCE_CODE of '2' (from DEM); keep or review
    + QA_ELEVATION_CONFIDENCE_CODE not assigned for locations from MOE WWDB 2004
    + under R_LOC_DATA_SOURCE_CODE, change 'suspected' to 'inspected'; should this table have a 'QA' in its name
    + a large number of records do not have a QA_DATA_SOURCE_CODE; update before next synchronization
    + a large number of records do not have a QA_DRILLER_ACCURACY_CODE; update or drop?
    + same issue with QA_PUMPING_CODE and QA_WL_STATIC fields
    + shouldn't the relationship between this table and D_LOCATION be 1:1
* D_LOG; should be hidden, not necessary to distribute; remove?
* D_LOGGER_CALIBRATION_READINGS, D_LOGGER_IMPORT_ERROR, D_LOGGER_IMPORT_HISTORY, D_LOGGER_NAME; all used for importing of data from York; keep
* D_OWNER; make sure wells are being linked to this table
* D_PUMPTEST and D_PUMPTEST_STEP; has any new MOE data been incorporated?
* D_SURFACE_WATER; add the data from the CRA study here; why is there a special SW_ID; parallels D_BOREHOLE
* D_VERSION; references required SiteFX version (regarding structure changes)
* D_WATERUSE_*; exclude permits outside area?; change to D_PTTW_* instead (next release?)
*  D_BOREHOLE; many locations do not have a BH_GND_ELEV_DEM value
* Include RD_NAME_CODES from CLOCA
* D_CLIMATE; GND_ELEV - update?; start and end dates?
* D_CRITERIA; data deleted from table
* D_DATABASE_DEVELOPMENT; remove
* D_GEOLOGY_FEATURE; add information from new MOE WWDB
* D_GEOLOGY_LAYER; remove GEOL_UNIT_CODE if table of formation tops added
* D_INTERVAL; what is INT_REGULATORY_CODE; what is DWS# - drinking water system (stems from work being carried out at York Region)
* Procedure when new coordinates replace existing coordinates?
* A location is not required to have an interval
* Should make plain relationship between R_ and D_ tables before next database release
* R_BH_CONSULTANTS; leave in database
* Change BH_GND_ELEV_QA_CODE to R_LOC_ELEV_QA_CODE
* R_BH_STATUS; info comes from the MOE; leave for later
* R_CONV_CLASS; for dealing with elevation, depth and temporal data conversions
* R_DOC_FORMAT_CODE, R_DOC_GROUP_CODE and R_DOC_TYPE_CODE cannot be removed at present due to SiteFX relationships
* D_GEOLOGY_FEATURE; water found descriptions cleaned up; remove geology descriptions
* R_GEOL_LAYERTYPE_CODE; legacy table; determine if we can remove it
* Material code tables should be made consistent; this is a possible future problem as users can add values to one (or more) of the tables without checks in place
* R_GEOL_SUBCLASS_CODE; originally intended to track different geology interpretations
* R_PUMP_TYPE_CODE; removed

*20060627 ('Database Meeting - June 27, 2006' Memo)*

Comments
* What other problems are there to be fixed
* Do we need to adopt a Policy Manual regarding changes in the future, for example
    + Changes to database - do we accept changes or only do them ourselves
    + New locations - should these only be accepted through SiteFX
    + How often do we update Environment Canada data; what is the most efficient way of getting this information
    + Do the baseflow procedures/calculations need to be re-run every time (i.e. at each new database release) or should this be fixed; should this information be contained in it's own table if it's to remain static
    + What other big databases are to be incorporated
* Picks table - should it be part of the database; how do we streamline the reconciliation process
* How is the master database to be managed; where is it to reside

#### Database Release 3 (First Released 2006, July)

*20060830 ('Database Meeting Notes' Memo)*

Comments upon '2006 Database Release'
* Synchronization
    + Extended time for database synchronization
    + Source datasets inadequate
    + Unrealistic re: assumptions about 'automation'
    + Poor QA/QC on incoming datasets (overlapping datasets, subsets of data, multiple sharing/processing)
    + Original '2005' synchronization did not go well (problems with GSC and other import problems)
    + Lookup tables should auto-increment
* New and Updated Datasets
    + Poor/inconsistent instructions on the level of detail required to capture the information
    + Many changes/evolution since the original MOE update (difficult to replicate the import/translation process)
    + Comprehensive inventory analysis on new datasets was not done
* Correction and Revision of Data
* Database Check, Normalization and Translation
    + Data inconsistencies (e.g. watershed codes, municipalities, usuage, etc...); application of lookup tables
    + Incomplete/uneven classification (e.g. all wells need a purpose and QA code)
* Software and Query Compatibility
* Pitfalls or Challenge Tasks
    + Clients require full database access (i.e. not just through tools)
    + Synchronizing data between agencies
    + Adding new locations (most visible problem)
    + Database complexity (e.g. blobs, multiple related tables, overlapping/unclear storage, evolving MOE database)
* Review of User Needs
    + User groups: Conservation Authorities; Municipalities
    + Mandate - what data should be captured (only groundwater data)?
    + Integration with user databases
    + Evolving user needs; no longer a regional tool, move to more detailed studies and analysis
* Data Directions and Data Needs
    + Future database needs: modelling, municpal monitoring, permit allocation
    + Future data directions: MOE and MNR collection plans; who is the integrator of the datasets?; what datasets will become the definitive data source; how do we handle corrections and updates
    + Golden spikes?
    +abase Scope and Objectives
    + Evaluate needs, data directions and mandate to determine: what to include/exclude (clear goals/objectives); what is the CAMC mandate for database storage; what is the mandate for source water protection
    + Confidentiality
    + Internal data (e.g. York pumping data)
* Technical Issues
    + Platform (SQL Server)
    + Interface/Tools (SiteFX, web)
    + Dataset refresh (MOE WWDB, climate, HYDAT, PTTW)
    + New datasets (evaluation, translation and merging)
* Technical Issues - New Synchronizations
    + Option A (not an option); repeat of '2006' synchronization process; one monumental update
    + Option B (not an option); database synchronization - EarthFX runs synchronization algorithms, child database synchronized un-reviewed; data is either accepted or rejected by algorithms
    + Option C; SiteFX update tool; tool handles submittal and checking of data changes; DB synchronization through user-specified intervals; datasets held in review by CAMC (location comparison, spatial tools); lookup tables and data locked; users flag (some) data as 'do not submit'; good web based user feedback
    + Option D; Full time database administrator; strategic planning
* Staffing and Management Issues
    + Scientific/directions team (define goals, objectives, etc ...)
    + Database Administrator; coordinate uploads, updates, delivery, etc ...
    + QA/QC review team
    + Programming/Tools team

*20060830 ('Database Release Notes' Memo)*

Comments
* Late release of database: scope of database grown considerably; data errors had crept in; event based update process does not work
* Quality Control Issues
    + Cannot rely on junior staff; need knowledge of database, data formats, applications
    + Database structure complex (more SiteFX data entry rules?)
    + Update/Addition process; numerous steps and decisions made
    + Central database; central server into which all data is loaded; simple terminal services client system
    + Need scheduled update process; well defined tasks and deliverables; long term planning and scheduling
* Data Streams
    + PGMN integration and check
    + York Region catch-up
    + Integration with Peel and Durham
    + Water Quality
    + Report mining
    + Internal QA coding and cleanup
    + ARCHydro integration?
    + MNR SW connection?
* Evolving Needs
    + Transient
    + Site scale analysis/refinement
    + Confidentiality
* Responsibility
    + Review and identify data gaps
    + Rules, guidelines, checks, documentation, training manual update, data entry rules, data QA queries, visual checks of the data
    + Tools; web entry tools, web based datasets, air photos and other web based data; processing
    + Political issues and commitment; firm commitment and dedication of staff for training and support

*20061106 ('Database Meeting - November 6, 2006' Memo)*

Comments
* Protocol required regarding making changes to database
* Proposed to treat solid samples as intervals; we may change the number and type of intervals and add appropriate tables to hold results; could this be accommodated in existing database structure
* Blow counts; do we want this information to be displayed on log guides or is it a geologic feature or and interval attribute
* SiteFX does not allow 'bedrock encountered' to be selected
* Area of gauge station to be added for surface water types; add whether a surface gauge is natural or regulated (the latter being an Environment Canada site)
* Incorporate LOC_STUDY approach of REG into the database
* Master database remains July 2006 (the issues surrounding [the use of the] DEM left hanging)
* FTP access (for changes?) setup on Halton's site; remote-access restricted to 5pm to 7am
* Change Justification - new table
    + LOCID
    + ChangeDate
    + ChangeReason
    + ChangeComment
    + ChangeAuthor
    + ChangeJustification (duplicate of reason?)
    + ChangeTable (maybe)
    + ChangeField (maybe)

*20061129 ('2006 Database Synchronization - Summary of Activities' Memo)*

The 2006 database synchronization involved several key additions and changes to the database.  Broad outlines of the changes made to the database between the 2004 and 2006 versions include

* Expansion of the number of records in the recorded dataset
* Inclusion of Report Library data and reference tables
* Addition and population (through Viewlog) of D_FORMATION_SCREEN_ASSIGNMENT 
* Addition of D_DATA_FILE_SOURCE for tracking of data files
* Expansion of D_SURFACE_WATER to include all surface water stations (not just the Hydat stations); this includes CA's and GSC stations
* Addition of D_AGENCY table (for associated partner agencies with particular locations)
* Addition of D_GEOPHYSICAL_* tables for handling of geophysical data
* Addition of R_GEOL_UNIT_CODE table to standardize geology
* Addition of R_GEOL_FORMATION_CODE; to assist in understanding the formation nomenclature used by the Ontario Geological Survey as well as by the Oil and Gas Industry; it is expected that this table will replace R_GEOL_UNIT_CODE in next database version
* Addition of R_INT_REGULATORY_CODE; used to track the DWS or CofA numbers that a well might be tied to; associated with field in D_INTERVAL
* Tables dropped
    + D_INTERVAL_EQUIPMENT
    + D_INTERVAL_PUMP
    + D_HYDROMETER
    + D_HYDROMETER_READINGS
    + D_DOC_ASSOCIATION
    + D_DOC_BOREHOLE
    + D_DOC_DOCUMENT
    + D_INTERVAL_SURFACE_WATER
    + D_SPLITSPOON
    + D_WATERUSE_MUNICIPAL
    + D_WATERUSE_CAPTUREZONE
    + D_OPERATOR
    + D_PROPERTY_ENVRISK
    + D_PROPERTY_ENVRISK_EQUIPMENT
    + D_PROPERTY_ENVRISK_MATERIAL
    + D_PROPERTY_ENVRISK_WELL
    + D_LAS_HEADER
    + D_LAS_DATA
    + D_OWNER_BAK
    + L_PTTW_CITYTOWNSHIP_LIST
    + L_PTTW_DISTRICT_LIST
    + L_PTTW_UPPER_TIER_LIST
    + L_SW_SUMMARY
    + L_TEMPORAL_DATA_STATS
    + L_WELL_WATERUSE_LINK
    + L_WL_SUMMARY
    + R_RD_METHOD
    + R_WATER_TYPE_CODE
    + R_MOE_PTTW_DATUM_CODE
    + R_PTTW_UTM_ACCURACY
    + R_WATERUSE_DISCHARGE
    + R_WATERUSE_POND_TYPE
    + R_WATERUSE_PUMPING_ROUTINE
    + R_WATERUSE_WELL_TYPE
    + R_NAICS_CODE
    + R_CITYTOWNSHIP_LIST_ONT
    + R_BH_CONSULTANTS
    + R_MOE_TEST_METHOD_CODE
    + R_MOE_CODE_MUN
    + R_MOE_WATERUSE_CODE
    + R_MUNICIPALITY_TYPE_CODE
    + R_DATA_CORRECTION_SOURCE
* PTTW information is now found in the D_PTTW_* tables
* D_INTERVAL_PROPERTY can now be populated through SiteFX; includes the specific capacity values for the new MOE wells
* D_INTERVAL_TEMPORAL_SUMMARY provides a summary of the different types of temporal data in the database (counts)
* New temporal data should now go into D_INTERVAL_TEMPORAL_7
* BLOB's (Binary Large Objects)  have been added to the database to make more efficient use of memory; this applies to D_INTERVAL_TEMPORAL_4 (data-logger information) and D_INTERVAL_TEMPORAL_5 (Environment Canada and Hydat information); queries have been included in the database to search or extract information from these tables
* D_INTERVAL_TEMPORAL_6 provides baseflow separation results
* D_INTERVAL_MONITOR has been corrected for erroneous values
* D_LOCATION has had the following fields removed
    + LOC_BASIN fields
    + LOC_USER_ID
    + LOC_ACTIVE
    + WATERSHED_DEV
* R_PURPOSE_PRIMARY and _SECONDARY have been updated to include Oil and Gas wells as well as climate and surface water monitoring stations
* PGMN wells have been flagged with the unique Primary and Secondary purpose values 'Engineering' (3) and 'PGMN Monitoring Well' (57)
* D_INTERVAL has had the new field D_INT_REGULATORY_CODE added to store information regarding (for example) 'Drinking Water System Number'
* R_BH_DRILLER_CODE; additional drillers have been added (with their MOE code)

In addition, LOC_QA codes (for location and elevation) were reviewed; in
general, the following applies:

* Outcrops/Bedrock Outcrops/Geological Sections
    + LOC_QA_CODE; generally assigned a value of '4' (coordinates taken by GSC staff from 1:50000 mapping)
    + ELEV_QA_CODE; assigned a value of '10' (elevation taken from the 10m DEM obtained from MNR)
* Climate Stations
    + LOC_QA_CODE; generally assigned a value of '7' (coordinates provided by Environment Canada); this will be changed to '5' (to be considered reasonably located)
    + ELEV_QA_CODE; assigned a value of '5' (no elevations assigned or required for these locations); this should be changed in a future database version
* Surface Water Locations
    + LOC_QA_CODE; generally assigned a value of '2', '3', or '4' (coordinates provided by the CA's or the GSC)
    + ELEV_QA_CODE; assigned a value of '5'; however, the elevations in the D_SURFACE_WATER_TABLE are from the DEM; this should change in a future database version
    +
    + LOC_QA_CODE; generally assigned a value of '4' (coordinates taken by GSC staff from 1:50000 map)
    + ELEV_QA_CODE; ELEV_QA_CODE; assigned a value of '10' (elevation taken from the 10m DEM obtained from MNR)
* Seismic Stations
    + LOC_QA_CODE; assigned a value of '3' (coordinates provided by GSC)
    + ELEV_QA_CODE; assigned a value of '3'; no elevations are currently found in the database
* Oil and Gas Wells
    + LOC_QA_CODE; assigned a value of '4' (coordinates provided by MNR)
    + ELEV_QA_CODE; assigned a value of '10' (elevation taken from the 10m DEM obtained from the MNR)
* UGAIS Wells
    + LOC_QA_CODE; assigned a value of '3' or '4' (coordinates provided from an OGS database)
    + ELEV_QA_CODE; assigned a value of '10' (elevation taken from the 10m DEM obtained from the MNR)
* MOE Wells
    + LOC_QA_CODE; original QA code from the MOE was retained
    + ELEV_QA_CODE; assigned a value of '10' (elevation taken from the 10m DEM obtained from the MNR)

*20061222+*

Incorporation of additional MOE boreholes/locations, primarily from the Crowe Region CA (refer to Appendix G for details).

*20080110 ('Notes For New 200[8] Database Release' Memo)*

The following should be examined prior to the next release of the database (in 2008)

* Review solid versus liquid sample handling
* D_INTERVAL_MONITOR; elevations not updated
* R_INTERVAL_TYPE_CODES; review
* D_INTERVAL; populate interval end dates (e.g. MOE wells should have the same start and end dates)
* York monitoring wells missing a DATA_SOURCE
* D_SURFACE_WATER; populate drainage areas for spotflow stations; differentiate between a surface gauge and spotflow location
* Reconcile D_PUMPTEST and D_PUMPTEST_STEP
* Documents - do we have link between the digital document and the database
* D_LOCATION_ACTIVITY does not match with R_ACTIVITY_CODE
* D_INTERVAL_TEMPORAL_3; most records do not have a reading type code
* D_INTERVAL_TEMPORAL_4; no relationship with D_INTERVAL
* D_INTERVAL_TEMPORAL_5; no relationship with D_INTERVAL
* D_INTERVAL_TEMPORAL_2; many locations where static values mixed between masl and fasl - SiteFX should make these consistent (converted)
* Some wells do not have a borehole record; some surface water stations have a borehole record; some outcrops do not have a borehole record
* D_INT_TYPE_CODE has not been assigned to all intervals - do so
* D_BOREHOLE_CONSTRUCTION; standardize the units used
* Check bedrock indicator (and lack thereof) in many cases
* Not consistent between D_INTERVAL_MONITOR (flowing tag) and D_PUMPTEST (FLOWING_RATE); correct
* Correct D_INTERVAL_TEMPORAL_2 records with no RD_VALUE
* Check surface water spot stations with no spot flow value
* Fix dates (some up to 2029) in D_INTERVAL_TEMPORAL_SUMMARY
* D_INTERVAL_TEMPORAL_2; pumping rates and flows not converted to 'system' rates
* Check DATA_ID usage and purpose in D_INTERVAL_TEMPORAL_1A/1B
* Check locations with no COUNTY_CODE and TOWNSHIP_CODE
* Add R_CONFIDENTIALITY_CODE with
    + 1 - Location information is open; no restrictions
    + 2 - Location information restricted to partner agencies; not Province; not Public
    + 3 - Location information restricted to agencies with jurisdiction over location
    + 4 - Location information restricted to CVC
    + 5 - Location information restricted to TRCA
    + etc ...
    + Test pits currently only have a primary purpose of 'Government Mapping/Research'; review and change
    + SiteFX needs adjustment to require a Coordinate QA code upon entry of new data
    + Many locations have no LOC_COORD_QA code
    + What data is attached to GSC seismic locations?  Return to 2002-2003 usage
    + PTTW locations have been assigned an elevation QA code; no elevation associated with them, change to reflect
    + Many MOE wells indicated to have coordinates from the MNR in D_LOCATION_QA; change to come from the MOE
    + Bring back the MOE elevation data to the respective _OUOM field and add a column for the MOE elevation reliability code in the QA table
    + QA_Driller_Accuracy_Code, QA_Pumping_Code and QA_Water_Level_Static need to be updated for new MOE wells
    + What is the purpose of the D_LOGGER tables (they are empty)
    + D_PUMPTEST; some records that do not have a data source (or it is erroneous)
    + D_SURFACE_WATER; move SW_GROUND_ELEV_SOURCE to D_LOCATION_QA; populate the drainage area for spot flow locations
    + D_CLIMATE; add a start and ending year; include two new fields to be updated each time new data is entered
    + D_CRITERIA; can this table be dropped (it is empty)
    + Check boreholes - many have a DEM ground elevation of less than 75m
    + Add note to the look-up fields in each table (i.e. Table-Properties) designating which R_\* table it references
    + R_BH_CONSULTANTS; was removed; do we want to keep it
    + Merge or remove old document system (e.g. R_DOC_FORMAT_CODE, R_DOC_GROUP_CODE, etc...)
    + D_GEOL_FEATURE; some descriptions of geology should be moved to D_GEOL_LAYER
    + Add an interval type for a surface water flow gauge with logger and a second for surface water (only?)
    + Correct wells with a data source of '7' to 'CLOCA'
    + Develop a method for tracking soil/rock samples from boreholes
    + Check some MOE wells that are based on new coordinates
    + GRCA-PGMN and Lake Simcoe files were not incorporated due to poor quality; check and prepare for next time
    + Reading name codes need to be tidied up - many duplicates and group codes not used appropriately
    + Elevations in D_BOREHOLE table need to be repopulated (the _OUOM field)
    + R_CONFIDENTIALITY table still needs to be updated
    + D_CLIMATE; DEM elevation _OUOM fields should be empty
    + QA code for climate stations should be changed to '5' - assumed to be reasonably located
    + Surface water stations have no elevation received from Environment Canada; db should reflect this
    + QA_DATA_SOURCE_CODE not equivalent to that in LOC_DATA_SOURCE_CODE; review
    + QA_DRILLER_ACCURACY_CODE not updated; remove
    + D_LOCATION_QA; update or delete fields
    + Elevations of water levels in D_INTERVAL_TEMPORAL_6 are not being converted properly; correct
    + Add a formation number column to D_GEOL_LAYER; GEOL_UNIT_CODE and SUBCLASS_CODE can probably be dropped
    + BH_STATUS_CODE used haphazardly for non-MOE wells; review
    + R_DOC_FORMAT_CODE can be dropped (tied to old document tables)
    + R_EQ_\* tables related to deleted equipment tables; remove
    + R_ECDATA has been removed; re-think or explain deletion
    + R_FEATURE_CODE descriptions revised for 'Water Found - Fresh' and etc ...; the description 'Water Found' can be removed from D_GEOL_FEATURE
    + R_GEOL_CLASS_CODE; what is this table for
    + D_GEOL_LAYER_TYPE code should be built into Material 1-4 lists (where they have been used and where they apply)
    + R_GEOL_MAT\*; these tables should be identical
    + R_GEOL_ORGANIC; remove unless used
    + GSC seismic locations are present in the db but have no data tied to them; review

#### Database Release 4 (Unreleased)

*20080717 ('Management of Temporal Data' Memo)*

The following direction or additions to the YPDT-CAMC database should be implemented

* De-blobbing the temporal files (when moving from MS Access to MS SQL Server)
* Inclusion of min-, max- and avg-daily water levels; partner agencies to maintain any higher-resolution datasets (or on a case-by-case basis)
* Specifying recommended update times (bi-yearly)
* Inclusion of water quality information (municipal pumping and other borehole sampling)
* Suggestion that water quality data from private domestic wells be NOT included [in the database]
* Inclusion of Provincial Water Quality Data and other miscellaneous datasets
* Inclusion of pumping data from the regional municipality's production wells (at a minimum, the daily pumping rate)
* Suggestion that short-term pumping information NOT be included 
* Inclusion of streamflow data from both Conservation Authorities and the Provincial/Federal Hydat network

*20081202 ('Agenda Items for Upcoming Database Meeting' Memo)*

The 2006 database synchronization involved several key additions and changes to the database.  The following broadly outlines the changes that were made to the database between the 2004 and the 2006 versions.  (See also the information under the date '20061129', above).

Comments
* Temporal Data; Both of the Environment Canada Datasets have been updated: i) Climate data now extends to between February and April, 2005 (depending on the individual station); ii) Hydat data goes until December 31, 2004.
* Report Library; The D_Doc table and 12 associated R_Doc tables that have been added to the database.  These tables describe the reports that have been scanned and are available on the website.
* D_FORMATION_SCREEN_ASSIGNMENT; this table is populated from Viewlog using the current geological layers.  For every location, the table is populated with the top of each layer.  The screened interval is also assigned to the aquifer in which it is interpreted to be situated.  Note that in the D_Interval table there is a field (Int_Manual_Screen_Geology) that can be used to record the formation that the screen is set in outside of the Viewlog interpretation - ideally the two should match when the surfaces are updated.
* D_DATA_FILE_SOURCE; this is a new table that tracks data files that have been incorporated into the project - it is used to track files that have temporal data.
* D_SURFACE_WATER; This table previously only had the Hydat stations as well as the CRA spot flow stations (520 records).  The table has been expanded to track all of the Surface Water stations including those from partner agency CAs as well as the GSC stations.  The number of records has increased to 4,585 records.  Most of the spot flow locations have not had the drainage area populated - this will be done for the next update.
* D_AGENCY; This table flags all locations as being linked to a particular agency.  The table is set up to include wells within a ~5 km buffer of each agency.  Any location can have more than one flag indicating that it is linked to more than one agency.
* D_GEOPHYSICAL_\*; D_Geophysical_Log_Databin; Field_Details; Litho_Descriptions; Location_Details - these four tables have been added to deal with the borehole geophysics data collected across the area over the past few years.  
* R_GEOL_UNIT_CODE; This table has been populated with both bedrock and overburden formation names used in the study area - the tble currently links to the Geol_Unit_Code field in the D_Geol_Layer table and is to be filled out manually if a geologist wishes to assign a geological formation to a particular interval within a well.
* R_GEOL_FORMATION_CODE; This table was constructed to assist in understanding the formation nomenclature used by the Ontario Geological Survey as well as by the Oil and Gas industry.  Certain Formation names are not standard between the two datasets.  In the next database release this table will replace the R_Geol_Unit_Code table and will link to a revised field in the D_Geol_Layer table.
* R_INT_REGULATORY_CODE; This table has been added by Earthfx to possibly track the DWS # or CofA # that a well might be tied to - we'll see how and if it is used before determining whether to keep it or not.  It is tied to a field in the D_Interval table.

Comments Regarding Elevations

There is a concern that we haven't been keeping a good track on how the elevation is assigned to a well and how it might change over time as the database is updated and changed.  The problem is of concern from two different perspectives:

* In particular this is a significant issue with respect to making picks on the geology - if the elevation changes after picks are made then the picks must be adjusted to reflect the new elevation.  It is recommended that the picks table be altered to add a new field and that Viewlog be adjusted to write the ground elevation at the time of picking to the picks table.
* If we have drawn - and circulated - cross-sections in the past and the DEM subsequently changes - then wells that might have previously been located at the bottom of a valley might now be on the shoulder or even at the top of the valley.  Given the resolution and better DEM maps that have come along this is likely not to be a significant issue into the future.

The current three Elevation Fields in the D_BOREHOLE Table must be used more rigorously and effectively.  Depending on capabilities of selecting the 'Best' Elevation on the fly we might add another field called BH_BEST_GND_ELEV (or to keep the 'Best' as BH_GND_ELEV).

For MOE Wells:

* The BH_GND_ELEV_OUOM field is to house the original MOE well elevation in feet or metres.  We have to go back to the original MOE datasets and roll back this field to match the MOE value - we don't ever want DEM elevations in this field.  
* The BH_GND_ELEV field is to house a surveyed elevation if one is available - in the case of MOE wells - where the MOE code is 1 the MOE value can be copied to this field.  Should this field be renamed to BH_ GND_ SURV_ELEV?  If there is no surveyed elevation this field will remain blank - we don't ever want DEM elevations in this field.
* The BH_DEM_GND_ELEV is to house the DEM elevation from the 10 m MNR DEM as provided to us a few years back.  This field can be overwritten every time the database or DEM is updated.

For other wells:

* The BH_GND_ELEV_OUOM field is to house the original well elevation in feet or metres as derived from the borehole record or scanned report.  For UGAIS, MTO, Oil and Gas wells etc. whatever elevation was provided will go into this filed in its original units (we will not, at present, to back to the original datasets to check this).  We'll leave it blank if the original is gone - we don't ever want DEM elevations in this field.
* The BH_GND_SURV_ELEV field is to house a surveyed elevation if one is available - if the elevation is noted to be a surveyed elevation on the borehole record then the elevation can be copied into this field.  If there is uncertainty as to how the elevation was derived then this field will remain blank - we don't ever want DEM elevations in this field.
* The BH_DEM_GND_ELEV is to house the DEM elevation from the 10 m MNR DEM as provided to us a few years back.  This field can be overwritten every time the database is updated.

For consistency I would like these three ELEV fields to be named in a consistent fashion

* BH_GND_ELEV_ORIG (rather than OUOM)
* BH_GND_ELEV_SURV
* BH_GND_ELEV_DEM

If we keep the 'BEST' field - then it could become BH_GND_ELEV (this then becomes the best elevation to use.  This is what Sitefx uses to calculate geology, screens, etc)

All reference to elevations (and coordinates) should be removed from the surface water and climate tables.

The fields QA_ELEV_SOURCE, QA_ELEV_METHOD and QA_ELEV_COMMENT need to be reviewed and corrected.

Elevation Reliability Coding - ELEV_OUOM

Currently the MOE elevation reliability code has been overwritten in most cases and is lost.  We need to go back and repopulate the MOE reliability code into the D_LOCATION_QA table.  We should rename the field from QA_ELEV_CONFIDENCE_CODE to QA_ELEV_ORIG_CONFIDENCE_CODE - this field should then be repopulated with the original MOE value.  In conjunction with this, the R_QA_ELEV_CONFIDENCE_CODE table should be re-named to R_QA_ELEV_ORIG_CONFIDENCE_CODE and expanded to account for the ability now for folks to estimate "original" elevations off of digital maps etc.

Given a an elevation confidence code of '0', the following could be added

* Code 20 = Elevation obtained from BH log (unknown accuracy)
* Code 21 = Elevation obtained from BH log (\<1 m accuracy)
* Code 22 = Elevation obtained from BH log (noted as surveyed \<5 m accuracy)
* Code 23 - Elevation obtained from GPS (unknown accuracy)
* Code 24 - Elevation obtained from GPS (\<5 m accuracy)
* Code 22 = Elevation estimated from Viewlog (~5 - 10 m accuracy)
* Code 23 - Elevation estimated from other GIS mapping (~5 -10 m accuracy)

We can add whatever else we come up against - the main thing is that this field addresses the accuracy of the ORIGINAL Elevation estimate - so [it contains] MOE plus extra stuff.  Although typically we do not need to make "original" elevation estimates anymore since the DEM populated elevation would be the general default.

Elevation Reliability Coding - SURF_ELEV

Given that we are now going to have the Second elevation field reflect the Surveyed Elevations (BH_GND_ELEV_SURV) we must have another field in the D_LOCATION_QA table called - QA_ELEV_SURV_CONFIDENCE_CODE - this will link to a new R_ table which we can call R_QA_ELEV_SURV_CONFIDENCE_CODE

The codes would then be

* Code 1 - Consultant Report - Survey 
* Code 2 = Golder Survey
* Code 3 = PJB BH Log - BH Drilled in bottom of Pit
* Code 4 = RG - TS Survey
* Code 5 = CRA TS Survey
* Code 6 = Mount Albert EA Study Survey
* Code 7 = MMM Survey (Murray Gomer)
* Code 8 = Driller Survey - from BH log
* Code 9 = King City Water Supply - Survey
* Code 10 = IWA Survey

This could be generalized or specific but this table would only relate to the Surveyed Elevations.  This table will capture much of what is currently found in two fields in the D_LOCATION_QA Table, namely the QA_COORD_SOURCE and the QA_COORD_METHOD fields.  Both of these fields are largely tied to various consultant surveys that we know about - so they would vanish from the D_LOCATION_QA Table.

Elevation Reliability Coding - DEM_ELEV

We also will do the same thing with the BH_GND_ELEV_DEM field.  There will be a new field in the D_LOCATION_QA Table that will be called QA_ELEV_DEM_CONFIDENCE_CODE.  This field will link to a new R table which we can call R_QA_ELEV_DEM_CONFIDENCE_CODE.

The codes would then look like (each time the elevations are replaced by a new DEM, a new code would be introduced)

* Code 1 = Ver 1 DEM - 30 m received from MNR 2001 (used between 2001 & 2004)
* Code 2 = Ver 2 DEM - 10 m received from MNR 2004 (used between 2004 & 2007)
* Code 3 = City of Toronto DEM - 50 m due to inaccurate MNR DEM (Used between 2001 and 2003)
* Code 4 = 1 m DEM provided by City of Toronto from Ortho photography - (used between 2008 and 2012)

Comments Regarding Geology

The geological descriptions (including both formation and comments fields in various tables) in the database have become confused and the purpose of some of the existing tables remains unclear.  One issue we should resolve is the issue of Mat1/2/3/4 codes - we had decided early on to stick with the MOE's protocol of simple geological coding (Mat 1; Mat 2: Mat 3 - adding Mat 4).  More complicated geological descriptions were to be entered into the "Full Description" memo field.  The City of Toronto wells were granted an exception since they were imported in from a database - but these should be fixed now.  Another problem is that similar information is being entered into different fields.

Proposed

* Go through the Material 1, Mat 2, Mat 3 and Mat 4 fields in the D_Geol_Layer table and look for ways to remove the more entangled descriptions (generally those with codes of 1000 or greater)
* Delete the R_Geol_Subclass_Code table (see D_GEOLOGY_LAYER below)
* Combine the R_Geol_Unit_Code table into the R_Geol_Formation_Code table - these should be merged into one table. In order to merge them we would have to add the few overburden units from Geol_Unit_Code to the Geol_Formation_Table (even though they are not proper "Formations": Channel - clay; Channel - silt; Channel - sand; Channel - gravel; Iroquois; Oak Ridges; and maybe undifferentiated Paleocene Bedrock)
* Within the R_Geol_Formation_Code table - we should change the name of the Geol_Unit_Code to Geol_Formation_Number - the additional "Formations" that will come from the Geol_Unit_Code table will need to receive a Formation_Number.
* D_GEOLOGY_LAYER
    + remove the GEOL_SUBCLASS_FIELD (two classes, not clear the source of each)
    + change GEOL_UNIT_CODE to GEOL_FORMATION_CODE
    + for Oil & Gas records, the GEOL_TOP_ELEV has been populated but the GEOL_BOTTOM_ELEV has not
    + GEOL_NAME redundant (as it should be in R_GEOL_FORMATION_CODE); check and remove
    + GEOL_COMMENT contains many geological descriptions; review (should this information be elsewhere)
    + should a LAYER_NUMBER be re-implemented
    + DATA_SOURCE should be dropped (should be contained in D_DATA_SOURCE)
    + Material layer type '5' (Bedrock) for many UGAIS wells do not have bedrock descriptions - review and correct
    + the GEOL_MAT_GSC_CODE needs to be populated
    + DATA_FILE; as DATA_SOURCE (above)
    + MAP_UNIT_NUMBER is only partially populated; if keeping, populate
* R_GEOL_CLASS_CODE; table should be dropped
* D_GEOPHYSICAL_\*; additional records to be added from DGI
* should a new location type (for geophysical locations)  be added OR should locations be flagged for geophysical information
* D_GEOLOGY_FEATURE; move feature codes to D_GEOLOGY_LAYER (should contain, mostly, water found information)
* all material tables should be made identical
* D_INTERVAL_SOIL and D_BOREHOLE_SAMPLE contain similar information; consolidate

Comments Regarding Screens

In D_FORMATION_SCREEN_ASSIGNMENT, do we want to keep the screen assignment (GEOL_UNIT_CODE) within this table or move to an interval table.  If moved, then this becomes the D_FORMATION_TOP table only holding the geology from the gridded surfaces.  Fields should be added to reflect surface version.  Fields should be included for updated geological units.

Why are there differences (in counts) between D_INTERVAL and D_INTERVAL_MONITOR (checked - OK).

For D_INTERVAL_MONITOR

* the screened interval is captured within the Mon_Comment field - however this field again hasn't been used very effectively - there are a few formations in here and there are lots of comments on the sand pack extents - in addition, there [are a] number of records that are not tagged with how the screen was assigned
* there are a number of records with no top and no bottom depths or elevations recorded, these should be dropped; other have \*_OUOM value but these have not been converted to elevations
* MON_TOP_OUOM; a number of records do not have a top recorded; these may or may not have a MON_BOT_OUOM as well

Comments - Miscellaneous Tables

* DATA_SOURCE and DATA_FILE
    + numerous tables have both of these fields, incompletely populated; many record similar information; review which tables should keep these fields (and how they are used)
* D_LOCATION_ACTIVITY
    + need to be more specific regarding what 'part' of the location is being updated
    + ACTIVITY_CODE; not generally populated; remove?
    + ACT_FLAG; what is this for?
* D_LOCATION_DEM; what is the purpose of this table
* D_LOCATION_QA
    + QA_COORD_CONFIDENCE_CODE_UPDATE; an empty boolean field; review how this is to be used
    + QA_COORD_SOURCE; this is not used in a systematic way - a methodology needs to be developed (possibly populated through SiteFX); should be a connection to D_LOCATION_ACTIVITY
    + QA_COORD_METHOD, QA_COORD_COMMENT and QA_COORD_SOURCE fields contain much duplication; standardize (e.g. through the use of R_UTM_COORD_METHOD_CODE)
    + QA_DATA_SOURCE_CODE; what is the value of this field and where did the information populating it come from; remove
    + QA_WL_STATIC_FIELD; what is this field used for; remove (information should be put somewhere else)
* D_LOG; unused since 2004; remove
* D_OWNER; remove unused fields (e.g. OWN_ADD_LOT, OWN_ADD_CON, OWN_ADD_COUNTY, etc ...)
* D_PUMPTEST and D_PUMPTEST_STEP; should these be combined
* D_SURFACE_WATER; the elevation and coordinate fields should be removed (the information should be duplicated in D_LOCATION)
* D_CLIMATE; as D_SURFACE_WATER, above
* D_VERSION; what is this table used for
* R_RD_NAME_CODE; review and remove equivalent names (move these to R_READING_NAME_ALIAS)

*20081209 ('Minutes & Actions from Dec 9 Meeting - December 11, 2008' Memo)*

Comments

* YPDT-CAMC report library and website to be run against a single (Master) database (i.e. no duplicate databases)
* One-way synchronization to be enabled first (two-way subsequently)
* Hidden S_\* tables track SiteFX changes
* DATA_SOURCE and DATA_FILE should be dropped from all tables with the exception of D_DATA_SOURCE
* Location fields removed from D_CLIMATE and D_SURFACEWATER (duplicates of the fields in D_LOCATION)
* D_INTERVAL_PROPERTY; field names should be changed to be more specific and understandable
* D_DOCUMENT; only two _ID codes will be carried
* D_PUMPTEST and D_PUMPTEST_STEP; initially proposed to be made a single table; this idea has been discarded - keep them separate
* Incorporate tables to incorporate 'Grouping' concept; D_GROUP, D_GROUP_OBJECT, etc ...; should LOC_STUDY or LOC_AREA be incorporated as a series of groups? (with the idea that these fields would eventually be dropped)
* D_LOCATION_DEM; to be removed (replaced by D_LOCATION_ELEV)
* R_GEOL_FORMATION; information to be moved to R_GEOL_UNIT then dropped
* R_GEOL_SUBCLASS; leave for now
* GEOL_NAME to be renamed GEOL_LOCAL_NAME (to record a local name that may be of interest)
* Elevations should be included in 'Picks' table at time of picking; review of how elevations are handled in the various tables in the database and through SiteFX

#### Database Release 5 (First Released 2012-06-15)

*200908+*

Initial evaluation of conversion between MS Access and MSSQL2008.

*200910+*

Expansion of the D_DOCUMENT  table and addition of supporting table to expand the capability of the database with regard to the report library.  Inclusion of REG library. 

*200911+*

Testing of Viewlog with initial MSSQL2008 version.  Correction and simplification of geologic material types.

*200912+*

Re-evaluation of RD_NAME_CODE table begins (including updates).   CLOCA interval data incorporated.  Correction of pumptest data.  Incorporation of interval data in MSSQL2008 database (i.e. un-blobbed).

*201001+*

Incorporation of MTO wells started.

*201002+*

Beginning of process of conversion from MS Access to MSSQL2008.  Testing begins of replication process (over VPN) with between Downsview and EarthFX.  Bedrock 	wells - evaluation and correction.  Screen lengths check and correction.

*201004+*

Setup and evaluation of replication process begins.  Interval and group types evaluated.

*201005+*

Replication testing begins.  Timeout problems due to size of interval-temporal tables.

*201006+*

Use of Groups and LOC_STUDY formalized.  Initial problems with 'identity' fields using distributed replication.  Incorporation of 'Scarborough Report' data.  Re-evaluation of D_DOCUMENT (and supporting) tables.

*20100610,23,30 ('Database Meeting with Kelsy - June 10, 23 and 30' Memo)*

Comments

* Assume that wells have been added within study geographic area (including SWP extensions) plus a 10km buffer
* Review of R_LOC_TYPE (removal of duplicates)
* All MOE wells will have a LOC_TYPE_CODE of '1'; all MOE wells will have an INT_TYPE_CODE of '15' (Screen)
* Wells with a COUNTY_CODE of '0' or '99' modified to '72' (Not specified)
* Wells with a TOWNSHIP_CODE of '69713' changed to '1500' (Not specified)
* MOE only uses '1' and '3' LOC_STATUS_CODE; add '13' (Alteration) and '14' (Other status); '0' code dropped
* Can the description of columns/tables be reincorporated from Microsoft Access version of database
* R_LOC_MOE_USE_1ST_CODE changes to match MOE WWDB (with the exception of 'Cooling & A/C' versus 'Cooling or A/C') 
* R_LOC_MODE_USE_2ND_CODE made identical
* R_DRILL_METHOD_CODE
    + 'Direct Push' equivalent to 'Driving'
    + 'Digging' equivalent to 'Hand Auger'
    + 'Other' changed to 'Unknown'
    + 'Sonic' equivalent to 'Rotosonic'
    + 'Auger' changed to 'Power Auger'
* R_BH_DRILLER_CODE; to be repopulated; delete all BH_DRILLER_DESCRIPTION (for the ones 'Not Classified'), repopulated with 'MOE Driller No. XXX'
* R_MAT_CODE_\* tables; '1115' and '27' changed to 'Other'; remove 'Cobbles' and 'Bedrock' (duplicate entries; '27' subsequently removed
* R_GEOL_MAT_GSC_CODE no longer included with MOE WWDB
* GEOL_MOE_LAYER to be added (back) into 'D_GEOLOGY_LAYER' (for old wells in addition, if possible)
* R_FEATURE_CODE; need to determine codes '8' and '9' from MOE; D_GEOLOGY FEATURE to be populated
* R_CON_SUBTYPE_CODE; should change back to MOE default but ... for now, all subtype codes in MOE database changed to match YPDT-CAMC
* Cleaned up R_CON_TYPE_CODE and R_CON_SUBTYPE_CODE
* D_DOCUMENT; DOC_USER_ID dropped; DOC_FORMAT_CODE should only be defined by two values - 'Digital' and 'Digital and Hard Copy' (only reports YPDT-CAMC has possession of should be included in the Report Library); R_DOC_GROUP_CODE removed;
* To deal with missing wells - all remaining MOE water well records will be translated into YPDT-CAMC format (and include all MOE wells in our database)
* R_CON_TYPE_CODE; 'Sand' changed to 'Annulus - Sand Pack'; 'Seal' changed to 'Annulus - Seal'
* For pump tests (from MOE), is GPM implied to be Imperial?
* D_PUMPTEST; duplicates to be removed; day/month flipped (on second entry into the database)
* PUMPTEST_METHOD_CODE and PUMPTEST_TYPE_CODE moved from D_PUMPTEST_STEP to D_PUMPTEST
* R_PUMPTEST_TYPE_CODE; 'Slug' and 'Packer' added; now consist of 'Constant Rate', 'Variable Rate', 'Slug' and 'Packer'; no recovery test (water levels flagged as recovery water levels as necessary)
* R_WATER_CLARITY_CODE; added as a look-up table

*201007+*	

Delivery of initial MSSQL2008 version(s) and testing begins.  Querytimeout parameters modified to correct issues with interval-temporal tables.  Trusted versus untrusted connection problems with SiteFX/Viewlog.  Corrected with new versions (of each).  Replication through FTP is enabled.

*20100728 ('Database Meeting with Kelsy - June 10, 23 and 30' Memo)*

Comments

* Downsview and EarthFX servers replicating against each other (test database)
* Field/table descriptions must be added manually to new SQL Server database
* For replication, should R_\* tables be uni-directional only (i.e. from Master to Partners; changes at Downsview only); exception would be R_GROUP_\* tables
* SiteFX constantly asks for password when accessing SQL Server through non-Windows Authentication (SQL Server login/passwords)
* Grouping functions work in SiteFX
* With respect to missing wells (e.g. Barrie), take all wells from all Counties covered by YPDT-CAMC project and add them to the database
* Review location status versus borehole status

*20100826 ('Database Meeting - August 26, 2010' Memo)*

Discussed and approved database backup procedure using 'Simple' database model.  York reading name codes found to not (necessarily) be equivalent to YPDT-CAMC codes (SiteFX adds new codes whenever reading name not present).  Now corrected.  Proposed adding of last modified user and date to all tables (for tracking purposes).  'Identity' field problems with primary keys (with regard to replication).  Decision made to keep.  

Data source and DATA_ID issues

* DATA_DESCRIPTION poorly populated
* Many tables have a text-based DATA_ID field (instead of numeric); corrected
* Any data incorporated is given a new DATA_ID, even if related to a previous DATA_ID - is this a potential problem

Twelve baseflow methods (calculations) now included in the D_INTERVAL_TEMPORAL_2 table.  All bad pumping test data have been removed.  Target for first version SQL Server version of 'Master' database slated for 20100903.

*201009+*

First test of the replication process with CLOCA (over VPN).  Inclusion of SYS_TEMP* fields in every table.

*20100914*

First working (Master) version within MSSQL2008 resulting from conversion of the original Microsoft Access database.  All subsequent changes are to this version only.

*201010+*

Problems with D_GEOPHYSICAL\* tables (blobbed data; no primary keys).  Temporal data incorporated into two interval-temporal tables.  Methodology for and assignment of geologic unit to screen interval begins.  Calculation of 'mbgs' for all intervals incorporated.

*201011+*	

RD_NAME_CODE (along with RD_NAME_ALIAS) re-evaluations continue.  Assessment of required tables for SiteFX and streamlining of table information begins.  Inclusion of surficial geologic unit.   Bedrock depth calculation moved to a view.  Additional fields included in interval-temporal 1A/B for method tracking and uncertainty.

*20101112 ('Database Meeting - November 12, 2010' Memo)*

Comments

* Viewlog and connections to SQL Server database problems
* Duplicate location corrections (including temporal data)
* R_PURPOSE_SECONDARY_CODE; Remove primary purpose fields; add 'Not Viable - Abandoned' and 'Other - Research'
* Check of 'Reported Screens' in YPDT-CAMC database against MOE WWDB
* Check for 'Open Hole' in overburden wells
* Make sure primary and secondary purpose codes assigned correctly as part of the interval type designation
* Review MOE well records and re-assign to one of the following interval types
    + Reported Screen
    + Reported Open Hole
    + Overburden Well - 1m Screen Assigned
    + Assumed Open Hole (Screen assigned from bottom of casing - bottom of hole)
    + Assumed Open Hole (Screen assigned from top of bedrock - bottom of hole)
* For non-MOE wells, screens need to be investigated for interval category to be assigned

*20101119*

Comparison between YPDT-CAMC database and MOE WWDB, for wells where there is only one screen reported there is some discrepancy between OUOM fields; to be overwritten with MOE data

*201012+*

First phase of table removal and data transfer (in general to
D_INTERVAL_TEMPORAL_\* tables).  Evaluation of necessary 'Views' begins.  Versioning by date recommended and approved.  Added 'last modified' tracking columns for both date and user to most tables.  Addition of SYS_LAST_MODIFED and SYS_LAST_MODIFIED_BY.  Correction of some MOE wells, changing 'Early Warning Well' to 'Supply Well' - re-examining records for reported screens.  Removal of duplicates and transfer of temporal data for various Ballantrae, Nobleton and Alton wells.

*201101+*

R_RD_NAME_CODE, R_RD_TYPE_CODE and R_READING_GROUP_CODE tables modified.  Evaluate usage of D_BOREHOLE_SAMPLE and D_INTERVAL_SOIL.  Sample data included from 'Scarborough Report' (Eyles and Doughty, 1996).

*20110112 ('Database Meeting Notes - January 12, 2011' Memo)*

Comments

* Interval type conversion
    + Interval type conversion nearly complete (30000 wells left without new code when running conversion rule test)
    + Proposed rule to ignore 'Open Hole' record in overburden wells; if no screen reported, given 1ft screen (at bottom)
    + 'Abandoned' MOE wells should have no interval applied as a default screen
* BH/Screen Diameter
    + No (metric) conversions should take place with regard to diameters (e.g. inches converted to m's); correct
* D_BOREHOLE_SAMPLE
    + Data should be incorporated into D_INTERVAL_TEMPORAL_1A/1B and D_INTERVAL_SOIL
* UNIT_CODE
    + Check of unit codes necessary for SiteFX
* Analytical Method Table
    + Incorporation of analytical methods to be included as a look-up table but not included into SiteFX; these codes should be added to D_INTERVAL_TEMPORAL_* and D_INTERVAL_PROPERTY as necessary
* Data Logger Files and YPDT data; determine 'best' methods by which to incorporate data (e.g. straight from logger; through analyzed spreadsheet)

*201102+*	

Presentation of replication methodology (including distribution of partner databases from the 'Master') at Peel.  Incorporation of DEM information (multiple sources).  Proposed replication testing at Peel.  Review diameter in borehole table and correct any problems.  Check and removal of duplicate interval-temporal data.

*201103+*

Second phase of table removal and data transfer.  Evaluation of fields within tables required by SiteFX.  Review of requirements necessary for evaluation of replication methodology at Peel - overview documentation prepared and sent.  Geologic screen assignments revisited.  Duplicates in geology-layers checked and removed.  Review dates and fix errors.

*20110302 ('Database Meeting Notes - March 2, 2011' Memo)*

Comments

* Elevations
    + DEM elevations to now be stored in D_LOCATION_ELEV; will house 'Master DEM' field for unsurveyed locations and will then be used to populate BH_GND_ELEV, SW_GND_ELEV and CL_GND_ELEV (in associated tables)
    + Removal of these fields from any table other than D_LOCATION_ELEV shelved, currently, as this would require many changes in SiteFX
    +erval Types
    + 'Screen Information Omitted' requires checking
    + Some 'Reported Screen' intervals with no top or bottom _OUOM values; generally from having multiple screens within a single interval (from MOE); should be deleted; note, different diameters and slots sizes recorded - need to be re-examined
* Bedrock Elevation to be calculated on demand; proposed changing 'Material 1' code of 'Bedrock' to 'Boulder' - used to flag false bedrock indicators
* D_GEOLOGY_LAYER; Re-examine removal of GEOL_CONSISTENCY_CODE, GEOL_MOISTURE_CODE, GEOL_TEXTURE_CODE, GEOL_ORGANIC_CODE (need to figure out a way to save the data from the Toronto BHs that use them)
* NULL Fields; need to generate a list of required SiteFX fields; looking at removal of unnecessary/unused fields
* R_UNIT_CODE; clean up table
* D_BOREHOLE_SAMPLE; has missing records - need to re-import
* Incorporation of analytical methods in D_INTERVAL_TEMPORAL_\* tables

*201104+*

Removal of D_BOREHOLE_SAMPLE and incorporation of data into D_INTERVAL, D_INTERVAL_SOIL and the D_INTERVAL_TEMPORAL_* tables.  Evaluation of QA confidence codes and inclusion of out-of-area codes.  Duplicate intervals and geology removed.  Example consultant view prepared.  Top and bottom depths of intervals calculated and included in interval-monitor table.

*201105+*

Geologic unit codes updated and assigned.  Include model geologic unit assignments to intervals.  Example databases for each agency prepared and distributed (for testing only).  Halton and York database checks and comparison with master database.  Check and remove invalid DATA_ID's.  Checked PGMN locations.

*201106+*

Addition of manual formation assignments to formation assignment table.  Trust relationship problems between workstations and primary server (MSSQL2008).  Incorporated old MOE water level data.  Changed structure of D_LOCATION_ELEV table.

*201107+* 

Start incorporation of historical chemistry data.  Water level imports.   Halton and York intitial database fixes (before import).  Various reading units reviewed (e.g. water 	levels) and modified.

*201108+*

Addition of reading name aliases to include all interval data.  Methodology for incorporation of logger data developed.  Geologic and 'consultant' views added.  Corrected problems with cascaded deletes (from within SiteFX).  Start of Halton temporal data import.  Correction of document table errors.

*201109+*

Initial review of to-date views.  Amalgamation/correction of 'flows' reading name 	codes.  Addition/update of reference elevations.  Added views for use with Viewlog.

*201110+*

Corrections to isotope data.  Removal of bedrock fields from D_BOREHOLE table (now calculated on-the-fly using V_General_BHs_Bedrock).

*201111+*

Addition of new tables to match latest SiteFX version(s).  Initial training session (at Peel) using the MSSQL2008 database.  Invalid coordinates 'nulled' and assigned appropriate QA code.  Correction of D_BOREHOLE table due to missing BH_ID's.  Removal of invalid PICKS information.  Initial setup of replication-over-web begins.  Corrected pump information with regard to conversion between liters and gallons.  Comprehensive review of required views.  Moved specific capacity information to D_INTERVAL_TEMPORAL_2.

*201112+*

Amalgamation (and correction) of all PICKS information.

*201201+*

Simplification of all water level codes.  Database manual preparation started.  Correction of interval-temporal lab data.

*201202+*

Simplification of all pumping codes.  General View's (i.e. non-expert) setup.  Evaluation of coordinate QA's versus elevation QA's.  Removal of lab info from the interval-temporal tables with no associated data.  Removal of duplicate records in D_INTERVAL_TEMPORAL_2.

*20120224*

Version of database standardized to this date (unreleased).

*201203+* 

D_AGENCY abandoned and functionality moved to D_LOCATION_AGENCY (with change in structure).  Use of type codes for tracking logger (and other) manufacturers implemented.  Removed duplicates found imported interval-temporal tables.  Applied type code methodology to interval-temporal tables.  Corrected depths using D_BOREHOLE_CONSTRUCTION and D_GEOLOGY_LAYER.

*201204+*	

Views for pumping and chemistry updated (returning additional fields).  Bibliographic view implemented.  Further correction of chemistry data, interval-temporal 1A/B tables (invalid number of SAM_ID's).  Re-evaluation of chemistry and water level R_RD_NAME_CODES.  Unit codes modified to correct for conversion problems.  Standardized to 'mbref' for all depth units.  Populated all 'null' OUOM fields in the temporal tables. 

*201205+*

Replication-over-web setup and trouble-shooting (for all partners).  'Identity' field problems return.

*20120528*

Addition of views to OAK_SUP for listing technical information on all tables in the master database.

*201206+* 

Replication-over-web setup issues continue.

*20120612*

Check re-seeding of ident fields in various tables.

*20120615*

Version of database standardized to this date.

*20120703+*

Initial evaluation of D_INT_FORM_ASSIGN for duplicate intervals (i.e. duplicate top- and bottom-depths for a single INT_ID).

*20120727+*

Correction of D_GEOL_LAYER for Peel Region (spatial extent).  Evaluation of methodology (in SQL) for determining shallow water table surface.

*20120808*

Initial evaluation of determining sand and gravel thicknesses as an indicator of aquifer availability.

*20120809*

Addition of V_WL_Average_lt_20m to OAK_SUP (for determination of shallow water table surface).

*20120815*

Correction of TRCA PGMN water levels (where no water level is recorded).

*20120816*

Initial evaluation of master-partner database checking (in SQL).

*20120821*

Corrected top- and bottom-depths of geologic layers in D_GEOL_LAYER.

*20120823*

Moved incorrectly located static water levels from D_INT_TEMP_1A/1B to D_INT_TEMP_2.  Creation of LOC_ID QA/QC checks by EV (first draft).

*20120827*

Updated/corrected location elevations in D_LOC_ELEV and D_BOREHOLE.

*20120907*

Updated/corrected D_INT_REF_ELEV.

*201210+*

Updated OAK_SUP with V_SG_\* views (for determining sand and gravel thicknesses for less-than and greater-than-or-equal-too 20m depths).  Updated OAK_CHECKS with V_D_INT_FM_ASSIGN_* for checking whether an existing model has been applied against an interval and well as evaluating the top- and bottom-depths of screens (for correctness/conversion).  Added V_D_DOCUMENT_..., V_D_INTERVAL_... and V_D_LOCATION_... to be used for checking (when importing) existing _ID's.

*20121016+*

Reviewed D_INT_MON.  A number of records are present (i.e. multiple monitor tops and bottoms) tied to a single INT_ID - this needs to be corrected.  Likely tied back to MOE WWDB nested well configurations (checked against two intervals - this turned out to be the case).  These should be changed to multiple locations each with a single interval.

*20121024*

Updated all valid intervals with the geologic models in D_INT_FM_ASSIGN - added the interpreted information for the Durham Model (2007).  Re-calculated the ASSIGNED_UNIT field (to accommodate the additional model in the assignment logic; see Section 2.4.1).

*20121118*

Updated descriptions to all tables (D_ and R_) in database.

*20121120*

Added missing locations and elevations to D_LOC_ELEV.

*20121128*

Correction of ground elevations in D_BOREHOLE.  Examination and initial correction of D_INT_REF_ELEV reference elevations.  Added descriptions to all views in database.

*20121130 (Database Meeting)*

*20121211+*

Correction of chemistry data and sample information in D_INT_TMP_1A and D_INT_TMP_1B.

*20121212*

Updated D_INTERVAL setting all INT_TYPE_CODEs of 118 to 29 ('Soil' to 'Sample').  Changed 'Sample' to 'Soil or Rock' (29) and dropped 'Soil' (118).  Added values to 'R_REC_STATUS_CODE' to tag information that is not to be used in certain instances.  Anything less than 100 is kept.  Started work on D_INT_REF_ELEV removing all intervals whose INT_TYPE_CODEs are not related to having a reference elevation.  Added missing intervals whose INT_TYPE_CODEs do relate (these would include type codes: 18,19,20,21,22,27,28,101,102,112).  Removal of duplicate chemistry readings.

*20121214*

After discussion, decided to (in this version of the database) use INT_TYPE_ALT_CODE in R_INT_TYPE_CODE as a field for grouping similar interval 'types' together, for use in simplifying queries.  As this is a text field, these groups must be specified as text strings.  Currently only the grouping 'Screen' has been applied.  The usage of this field can be applied to other reference tables as well (as needed).  In subsequent version of the database, this may be replaced with a function similar to the R_RD_NAME_CODE and R_READING_GROUP_CODE tables.

*20121217*

Finished working on updating D_INT_REF_ELEV; updated all possible NULL REF_ELEVs with 'ASSIGNED_ELEV + 0.75m' values (~100000 updated; ~20000 remaining NULL values with either no ASSIGNED_ELEV or no BH_DRILL_END_DATE).  Removal of duplicate intervals (i.e. intervals formed from having multiple screens within a single borehole).

*20130109*

Corrected D_BOREHOLE null bottom elevations (when available, assigned either the minimum bottom elevation of geology - from D_GEOLOGY_LAYER - for borehole OR minimum bottom elevation of construction element - from D_BOREHOLE_CONSTRUCTION - for borehole).

*20130110+*

Correcting D_GEOLOGY_LAYER for null GEOL_BOT_OUOM values begins (mainly a problem for Oil & Gas wells).

*20130122*

Updated D_BOREHOLE, modifying the BH_BOTTOM_ELEV, BH_BOTTOM_DEPTH, BH_BOTTOM_OUOM and BH_BOTTOM_UNIT_OUOM fields.  As many of the boreholes present in this table (~22000) had NULL or invalid bottom elevations (or depths), these were corrected (previously) based upon construction or geology details (D_BOREHOLE_CONSTRUCTION and D_GEOLOGY_LAYER, respectively).  For the remainder, any screen present in the D_INTERVAL_MONITOR table was used to extract a bottom depth (plus 0.3m) then converted to an elevation.  If the borehole did not have a screen, the BH_BOTTOM_ELEV was given the same value as the BH_GND_ELEV and the remainder of the _BOTTOM fields assigned NULL values.

*20130214+*

Updated D_LOCATION_QA; all those locations with a NULL QA_COORD_CONFIDENCE_CODE have had a '9' (i.e. 'Unknown') assigned.  York has started comparing records of their municipal wells - some problems that need to be corrected.

*20130218*

Addition of 'V_D_LOCATION_Geometry' to OAK_SUP (for spatial objects in the 'Master' database).  Addition of the BH_BEDROCK_ELEV column to D_BOREHOLE - this is to be used instead of the dynamic-search implemented in 'V_General_BHs_Bedrock' (for speed considerations).

*20130306*

Addition of the field MON_WL_ELEV_AVG to D_INTERVAL_MONITOR.  Contains the average water-level at the interval across the whole temporal record available.

*20130311+*

Initial examination of monthly water levels as compared to the DEM show invalid water level elevations (far above surface).  Start of the correction of elevation and water level values for locations.

*20130313+*

Many borehole depths (seemingly) invalid (not including 20130122, above).  Start of re-examination and population of borehole depths (in D_BOREHOLE).

*20130314*

Added 'Alternate' ('6'; Class Code 'Lithology', '1') to R_GEOL_SUBCLASS_CODE.   This is used to differentiate between geologic interpretations for the same location/borehole.

*20130319*

Corrected stratigraphic top-and-bottom problems for various MOE bedrock wells (previously missing top- or bottom- depth/elevations).  Updated values copied into D_BOREHOLE (BH_BEDROCK_ELEV).

*20130320*

Added 'Original (Invalid)' ('7'; Class Code 'Lithology', '1') to R_GEOL_SUBCLASS_CODE.  This is used to tag invalid geologic interpretations (usually problem units from the MOE, mainly lack of elevation/depth data).  The 'Original' subclass description is now changed to 'Original (or Corrected)'.

*20130401+*

Start of process for addition of tagged locations for each partner agency into D_LOCATION_AGENCY.  Methodology now incorporates data from the OAK_SPATIAL accessory database.

*20130405*

Added INT_NAME_MAP to D_INTERVAL.  This is to be used for plotting of intervals in plan (i.e. overhead) view and matches LOC_NAME_MAP in D_LOCATION.  These names for intervals/locations can be no longer than ten characters in length.

*20130407*

Added soil intervals - those with tops and bottoms - to the D_INTERVAL_FORMATION_ASSIGNMENT table and applied the CORE Model (2004) interpretation.  These are to be incorporated along with the screen intervals in future updates.

*20130408+*

Started correcting intervals in both D_INT_MON and D_INT_SOIL creating top- and/or bottom-depths and elevations as appropriate (or available).  These are subsequently to be used in populating D_INT_FM_ASSIGN.

*20130419*

Alternate PICKS2 created with indexes and keys setup using the method described in Appendix H (dated 20130419b).  This is to be used for the foreseeable future to avoid the pick-delay problems with the original PICKS table.  This is to be fixed in the next version of the database.

*20130501*

Dropped RD_NAME_CODE of '630' ('Water Level - MOE Well Record') from R_RD_NAME_CODE and R_READING_NAME_ALIAS.  Use the appropriate R_RD_TYPE_CODE to access MOE water levels.

Updated R_GEOL_UNIT_CODE, standardizing the YPDT-CAMC model layer names.  Added an AQUIFER tag (a NULL, '0' or '1' value; '1' indicating an aquifer unit) to be used when assigning formations in D_INTERVAL_FORMATION_ASSIGNMENT (allowing the 'aquifer' layer to be assigned preferentially if the top and bottom of the screen do not match).

*20130506*

Added ~130000 rows to D_LOCATION_ALIAS - these are BORE_HOLE_IDs (from the MOE WWDB) that were otherwise missing.  As WELL_ID is not a primary key, we used WELL_ID, EAST83, NORTH83 and ELEVATION to match against LOC_IDs in D_LOCATION.  This has been included as a comment if any checking is required.  Note that there still a number of BORE_HOLE_IDs not matched to LOC_IDs in the database as these four fields were not matched exactly.  This still needs to be corrected.

ELEV_ORIGINAL is now populated in D_LOCATION_ELEV based on these new aliases (i.e. linked back to the MOE WWDB 201304 cut).

*20130510*

Corrected formations - mainly related to bedrock elevations - for another set of boreholes (mostly MOE).  Update D_BOREHOLE with new elevations.

*20130604*

Updated D_LOCATION_GEOM; start of updating D_LOCATION_AGENCY based upon temporary CHK_* views (as tables).  Re-initialized York and LSRCA databases.

*20130607*

Completed updating D_LOCATION_AGENCY.

*201307*

Start work on the next version of the database (tentatively referenced as OAK_20130701_MASTER or v20130701).  This includes: complete SQL scripts for creation of all tables and their associated keys, indexes and triggers; evaluate methods (including functions and stored procedures) to implement partner-specific ranges of values without resort to identity fields (this involves the user of the bigint type; problems using this are to be examined); re-evaluate the replication method including the presence of SYS_TEMP* fields (which must be included for access by SiteFX but should not be replicated) and SiteFX specific S_* tables.

*201308*

Initial evaluation of the CLOCA partner database for import of differences
into the master db.  Problems encountered between conflicting primary keys -
partner db's and the master db can end up with the same primary keys in some
tables.  One table uses incremental values (an S_\* table) which guarantees this.  The development of the official QA/QC procedures/methods is necessary.

*20130826*

In D_LOCATION, where LOC_COORD_OUOM_CODE is null, copied the LOC_COORD_EASTING
and LOC_COORD_NORTHING values (if non-null) into their respective \*_OUOM fields and assigned a value of '4' (i.e. UTMz17 NAD83) to the LOC_COORD_OUOM_CODE field.  Various coordinate corrections (and QA_COORD_CONFIDENCE_CODE corrections) during this process.

*20130927*

Corrected layer info in D_GEOLOGY_LAYER (examining units and NULL values) and updated D_BOREHOLE as required.

*20130930*

Corrected layer info in D_GEOLOGY_LAYER (examining units and NULL values) and 
updated D_BOREHOLE as required.

*20131004*

Corrected chemistry parameters in D_INTERVAL_TEMP_1B and added aliases (as necessary and appropriate) into R_READING_NAME_ALIAS.

*20131007*

Focussed look at the CLOCA partner database for inclusion within the master db.  Note that this is to be used as a test case for the QA/QC methods/procedures (and is the continuation of an earlier test).

*20131011*

CLOCA partner database information has been added to the master db.

*20131018a*

Correction of the location of 'Conductivity' (temporal) values, moving them from D_INTERVAL_TEMPORAL_1A/1B to D_INTERVAL_TEMPORAL_2 (note that it is possible that values can be present in the 1A/1B tables - the analysis would have to be lab based only).

*20131018b*

Addition of 'Active (Monitoring)' and 'Inactive (Monitoring)' codes to the R_LOC_STATUS_CODE table (to differentiate from the MOE WWDB understanding of 'Active' and 'Inactive').

*20131022 and 23*

Updated D_LOCATION coordinates (translated as necessary) prior to examining elevations. QA code '117' is beginning to be used to tag those locations outside of the YPDT-CAMC buffered area. 

Re-examined elevations in D_BOREHOLE and D_LOCATION_ELEV.  Each of BH_GND_ELEV, BH_GND_ELEV_OUOM and BH_DEM_GND_ELEV should now match (for those locations with a valid QA, i.e. not '117') that of the ASSIGNED_ELEV in D_LOCATION_ELEV.  The BH_GND_ELEV_OUOM values have been copied/converted to ELEV_ORIGINAL (if not already present).  The BH_GND_ELEV_UNIT_OUOM has been standardized to 'masl' (the BH_GND_ELEV_OUOM value was converted as necessary).  

*20131202*

Evaluated possible problem with 'V_General_Consultant_Hydrogeology' - turns out that multiple instances of an INT_ID in D_INTERVAL_FORMATION_ASSIGNMENT results in the doubling (or other multiplier) of the number of water levels associated with the interval.  Note that this is not an error with a view but with the population of the the formation assignment table - there should only be one row/tuple for each INT_ID.  The supplementary check database view 'CHK_D_INT_FM_ASSIGN_Multiple_INT_IDs' should be run periodically to correct this.  Note also that these 'blank' rows (i.e. the additional INT_IDs) have been added in many cases by the 'NT Authority' or 'YKREGION\SQLAgentAdmin' user - this is not mapped to an actual user (so where are these runs coming from?  Is this a SiteFX issue? - supposedly not).

*20131209*

Fixed various data constraint issues (i.e. information currently in the database not correctly matching 'new' constraints) when developing methodology and testing conversion/translation of data between database and spreadsheet formats.  This included (but were not necessarily limited to) the tables D_BOREHOLE, D_DOCUMENT, D_GEOLOGY_LAYER, D_GROUP_LOCATION, D_INTERVAL_REF_ELEV, D_LOCATION_ALIAS and D_LOCATION_PURPOSE.  

*20131211*

Updated D_INTERVAL_TEMPORAL_2; all rows with no values, no OUOM values and no comments were removed.  This should be consistently applied in the future.

*20140115*

Deleted ~1100 records from D_INTERVAL_FORMATION_ASSIGNMENT that contained repeating blank/empty rows for various INT_IDs.  There are multiple SYS_LAST_MODIFIED_BY users (no SYS_USER_STAMP) from both Y-C and the partner agencies - is there some automatic processing running?  Monitor these occurrences.

*20140117*

Modified V_Random_ID_Creator to randomize ID's between specified values (actually a lower value and range).  A view needs to be created for each user/partner (according to the uniqueIDrange as found in S_USER for SiteFX).  Currently V_Random_ID_Creator_MD and V_Random_ID_Creator_REG has been created.

*20140206*

Started in 20130923, the methodology for the MOE WWDB updates to be included as part of the YPDT-CAMC database are near-completion.  The final steps concerning the inclusion of boreholes with no geology remain.  Notes regarding possible issues and corrections applied (as needed) are shown here.

Notes on 2013 MOE Well Import File

* D_Location - the field Loc_Start Date - is typically empty for MOE wells - usually the only MOE date gets stored in the Drill_End_Date field in D_Borehole.
    + NOT MODIFIED
* D_Location - Loc_Name_Alt1 - should read "MOE Well 2013 - Name Witheld by MOE' - this will make it consistent with the other MOE wells that Kelsy brought in in 2010.
    + MODIFIED
* D_Location - If I do a Group By query on D_Location using Master_Loc_ID and Loc_ID - I can't see any of the famous MOE multi wellls - did we decide to give each BH its own LocID?  Even then though we should have them linked through the Master Loc_ID (which would be the Loc_ID of the Well that has the MOE Geology) - right?.
    + CHECK
* D_Location - I think Sitefx needs the wells to be assigned a Site_ID of 1 (for YPDT-CAMC).
    + MODIFIED
* D_Location - the tblWWR table contains the MOE data source code - did none of the new wells have a code to bring in?  should go to Loc_Data_Source in the D_Location table.
    + MODIFIED (18 bhs)
* D_Location - We should also assign the Loc_Confidentiality_Code of 1 - for accessible to all - for these wells.
    + MODIFIED
* D_Location_Alias - looks OK
    + NOT MODIFIED
* D_Location_Purpose - This is a big one - The MOE Use 1st and MOE USE 2nd have to be properly translated to our Loc_Use_Primary and Loc_Use_Secondary Codes - they are not the same - see attached table below.
    + MODIFIED
* D_Location_QA - What about the Elev_Codes in the Loc_QA table?  In the Loc_QA table - we don't have two columns for Elev Code (as we do for the UTM Code) - so we still have a number of old MOE Codes in here that are no longer relevant.  Should we add another field in the table for Elev_Reliability_Code_OUOM?  then the Elev_Code would be switched to either a 10 or a 1.  As an aside - do you know where the QA_DATA_SOURCE_CODE field in the QA table links to?  Should the QA_ELEV_SOURCE field in this table be updated to MNR DEM ver 2 - for most wells?  (i.e. remove the "MNR DEM Ver1" terminology from here).  All new wells should get a code of QA_Elev_Confidence_Code of 10 right?  With appropriate comment in the QA_ELEV_SOURCE Field.  Also for the UTM Codes we should probably populate the QA_COORD_METHOD from the "Location Method" field in the tblBore_Hole table. (as long as the code is not p1 through p9).
    + MODIFIED (some notes not addressed - external to import procedure)
* D_Location_Elev - looks ok
    + NOT MODIFIED
* D_Borehole - we still need all of the Elev fields to be populated so that they appear in Sitefx.  I think we can make them all the same for the new BHs.
    + MODIFIED; elevs to be added at a later step
* D_Borehole - the BH_Bottom (Depth, OUOM and Unit_OUM) fields need to be filled in - I think we need to take the deepest of either the geology or the BH_Construction depths
    + MODIFIED; elevs and depths to be added at a later step
* D_Borehole - Let's fill in BH Dip to be 90 and BH_Azimuth to 0
    + MODIFIED
* D_Borehole - can we populate the BH_Bedrock_Elev field?
    + NOT MODIFIED; this is a process external to import procedure
* D_Borehole - we should populate the MOE_BH_Geology_Class field - the data is found in tblBore_Hole (CODEOB field) - and is linked to the code_Well_Type Table
    + MODIFIED
* D_Borehole_Construction - looks good
    + NOT MODIFIED
* D_Geology_Feature - it looks to me like Sitefx doesn't touch this table - I think we should just do the conversions and populate the "Final" fields and bypass the OUOM fields.
    + NOT MODIFIED; as more than MOE data can be included here, there should be a separate procedure for dealing with these values (depths)
* D_Geol_Layer - looks good   -   As an aside - do you know what the Geol_LayerType_Code field links to?
    + NOT MODIFIED; GEOL_LAYERTYPE_CODE reference table?
* D_Interval - why do we have 125 Int_Type = 28 (Screen Information Omitted)?  Why aren't these changed to 19 (1ft above bottom of BH)?  Can't tell if its because they have no bottom depth since that field isn't populated in D_Borehole
    + NOT MODIFIED; no depth data associated with these intervals/locations (neither geology, construction or screen details)
* D_Interval - I also wanted to confirm that the ones you coded with an Int_type of 21 - were indeed bedrock holes
    + NOT MODIFIED; bedrock determination (elevation) is through a separate process not related to the import procedure; this should be an external check (i.e. evaluating all INT_TYPE_CODE tagged intervals with value '21')
* D_Interval - we should populate the Int_Confidentiality_Code with a 1 - indicating share with everyone
    + MODIFIED
* D_Interval - I think that all of the existing Intervals have a "-1" in the Int_Active field - I have never used this field and I don't think it will ever be used - but maybe we should be consistent and put a "-1 in here?
    + NOT MODIFIED; INT_ACTIVE is a bit field - '-1' indicates a 'true' value for Microsoft products; should automatically be converted (as it is not '0') on import
* D_Interval_Monitor - We have 8,492 Intervals that we are pulling in and 8,583 records in D_Interval_Monitor - are all of these situations where there are more than one pipe at a location? or are there some intervals that have a multi-part screen and if so have we handled them OK?  There is a field in D_Interval called Int_More_1_Part - should we fill that in if there are two or more parts to a screen?
    + NOT MODIFIED; this check was originally made (see Section G.10.15) - for duplicates and multiple static water levels assigned to a single INT_ID; re-examined manually (with no results modified); note that overlapping screens (and, elsewhere, geologic layers) need to be investigated external to this import process - as such, those checks are not made here (manually, 1 overlapping screen found)
* D_Interval_Monitor - looks like you have introduced a coding for the Mon_Screen_Material field - is that correct (its written out in existing table)?  Do you have a corresponding "R_" table?
    + MODIFIED; no, this is a direct copy from the MOE data; is the MOE using the codes from _code_casing_material?; the assumption has been made that this is the case and the relevant code has been updated
* D_Interval_Monitor - what is the "mum field for? just temporary?
    + NOT MODIFIED; all rnum fields are for internal (before import) use only
* D_Interval_Monitor - How about populating the Mon_Top_Depth_M and Mon_Bot_Depth_M while we do the import?
    + NOT MODIFIED; this is a separate process outside of the MOE import/conversion
* D_Interval_Monitor - is it easier to infill the Mon_WL_Elev_Avg for these MOE wells now - just use the static WL?
    + NOT MODIFIED; this is a separate process outside of the MOE import/conversion
* D_Int_Ref_Elev - looks OK except for numbers - there are 8,492 records in here - but we have 8,583 records in D_Int_Monitor - the extra pipes should also be assigned a Ref_Elev - right?  or are there two (or more) part screens - see above?
    + NOT MODIFIED; these are all multi-part screens; one ref elevation per INT_ID
* D_Int_Temporal_2 - I see a bunch of WL in here where the date is "null" and others where it has been defaulted as discussed to July 1, 1867 - what is the difference between the two sets of WLs?
    + NOT MODIFIED; the default dates only apply to pumping/recovery data (where the time interval is of interest); are we imposing dates on static water levels?; these are for wells with no completion or starting date
* D_Int_Temporal_2 - There are quite a few dates between 2002 and 1951 - are you sure that these are correct?  I would have suspected that all of the wells we are pulling in would be drilled between 2006/2007 and 2012/2013 - it is possible that MOE added a few old wells in the meantime - but just want to make sure.
    + NOT MODIFIED; there are 67 locations/intervals with dates prior to 2007-01-01; this matches to 670 values in the D_INT_TEMP_2 table
* D_Int_Temporal_2 - I think that you have brouhgt in too many WL duplicates to this table - e.g if you look at IntID -2128160263 o -2111097950 - for both of these there are 27 WLs tied to the Int - all are the same on the same 1867 date/time - can you see what the issue is with this?  Don't know if its just the 1867 ones or if there are others - just check IntID -2132667689 - and it also has 11 duplicate WLs (as a guide we should probably have about 8,441 x 5 or about 40,000 WLs in the D_Temporal 2 Table at the most - since many of the MOE wells have 0 or only 1 water level - the existing table has 58,239  measurents).
    + NOT MODIFIED; these are pumping/recovery levels and static water levels
* D_Int_Temporal_2 - I only see 3,415 static water levels (Rd_Name_Code = 628) for the 8,441 wells that we are bringing in - are you sure there aren't more static WLs - this seems low?
    + NOT MODIFIED; checked but no additional static water levels located; this assumes that these levels are stored in 'TblPump_Test'
* D_Int_Temporal_2 - There are quite a few WLs where the Reading Value is less than 75mASL - I see that the OUOMs are quite ridiiculous - lets see how many remain when the duplicates are removed from the table - but maybe we can check to see if the OUOMs are elevations instead of depths?
    + CHECK; but ? this may be a check to be performed within the db itself as, is likely, there will be similar errors
* D_Int_Temporal_2 - don't know what Rec_Status Code is for but it looks like it is typically populated with a 1 - should we do similar?
    + MODIFIED
* D_Pumptest - the field "Flowing_Rate_IGPM - should only be populated if the monitor is flowing naturally - it doesn't record the same value as the Rec_Pump_Rate_IGPM - so it should be largely blank except for a few values when the monitor is flowing.  MOE might have this screwed up - I think Albert and I went through and fixed records in the DB a while ago - 
    + If the Monitor Flowing field is -1 - then we assume it is really flowing and we can leave the value alone - regardless of whether the Rec_Pump_Rate and the Flowing_rate are the same - some are really high though) (77 instances where they are the same; 1 instance where Flowing>Rec; and 4 instances where the Rec>Flowing);
    + If there is no Monitor_Flowing Flag and the Rec_Pumping Rate is the same as the Flowing Rate - then we assume it is not flowing and we delete the Flowing_Rate_IGPM value (2359 instances).
    + If there is no Monitor_Flowing Flag and if there is a flowing rate and no Rec_Pump_rate - then we can assume it is flowing and add a -1 to the Monitor_Flowing Flag (2 instances).
    + If there is no Monitor_Flowing Flag and if the Flowing Rate is less than the Rec_Pumping Rate - then we add a -1 to the Monitor Flowing field and assume it is really flowing (17 instances).
    + If there is no Monitor_Flowing Flag and if the Flowing Rate is greater than the Rec_Pumping Rate - then we assume there is an error and the monitor is not flowing - delete Flowing_Rate value (1 instance).
    + MODIFIED
* D_Pumptest - only 125 of 3038 records have a PumpTest_Method_Code - seams low - is that right?
    + NOT MODIFIED; the remainder have been given a '0' value ('Unknown'; translated to NULL)
* D_Pumptest_Step - I think the import is messed up in here - there should only be multiple PumpTest IDs in here if the test was done at a variable pumping rate - if the rate is constant - as is the case for most/all of the MOE wells - then they should only appear once in here.  There are many cases where they appearing multiple times - up to 13 times - I think in our existing table we only have 2 pumping tests where the pumping rate was changed during the test.  We should have about 3038 records in this table - or less if no pumping rate is specified.
    + MODIFIED; this has been modified to only record the varying pumping rates (and their time intervals) for any particular PUMP_TEST_ID (which will now result in, basically, a single record for each identifier); this reduced to ~2700 records
* D_Pumptest_Step - Typically we have started the pumping test at 12:00 AM on the day it occurred - and then based on how many water levels were provided (usually four at 15, 30, 45 and 60 minutes - we stop the test at 1:00 AM - I see many of your test starting at 12:03 or so and ending 1 minute later - don't know how you populated these times - but they should be dictated by the WLs provided.
    + NOT MODIFIED; these have been examined and found to be correct
* D_Pumptest_Step - are the fields "mum", "testlevel", "testlevel_uom", and "testtype" just temporary?
    + NOT MODIFIED; all lowercase fields are only temporary holders (of data) and are not for final import

*20140605-06*

Started in 20130923, the methodology for the MOE WWDB updates to be included as part of the YPDT-CAMC database are complete (refer to Section G.10 for methodology).  This new information has now been added to the database.  Notes regarding possible issues and corrections applied (as needed) are shown here.

Notes on MOE 2013 Well Import
D-Location - 16525 Wells coming into DB
Min LocID  = 240000035
Max LocID = 241680698

**D_BOREHOLE TABLE**

* Ground Elevation - Max = 529.6 mASL
* Ground Elevation - Min = 67.4 mASL - this well is in Lake Ontario (checked)  (10 wells (all have same WellID) - with zero elevation) BATHYMETRY SUBSTITUTED
* Reduce the # of decimal places in the BH_GND_ELEV; BH_GND_ELEV_OUOM, BH_DEM_GND_ELEV, BH_BOTTOM_ELEV, BH_BOTTOM_DEPTH and BH_BOTTOM_DEPTH_OUOM to 2 places SEPARATE PROCEDURE
* 5,148 BHs have no specified depth; 3 have a depth of <0; 4 have a depth of 0 DEPTH <0 FIXED
* Max Depth = 1167.5? - 2nd largest is 445 m before that (once errors are fixed - the greatest depth should be 402 m)
* Min Depth = .1524
* 835 BHs with no drill_end_date (ok)
* Min Drill_End_Date = 06/07/1951
* Max Min Drill_End_Date = 22/03/2012
* Many wells with no BH_Geol_Class (ok)
* A few MOE errors that I caught - we need to fix either before or after import?..
    + MOE ERROR - LocID 240087270 - Change Depth from 1167.5 m to 1167.5 x .3048 = 355.85 m (note the geology only goes to 333 m - I think MOE messed up units. FIXED
    + I can't figure where you got the depth of 445 m for LocID 240097354 - the deepest element I can find for this well is the plug at 6.75 m - just maybe check to see that this isn't a more systemic error. FROM BH_CONS; FIXED
    + MOE ERROR - I think the depth of 395 m is incorrect for LocID 240001642 - both the Casing and the Fm go to 30.5 m - I think that is more reasonable GEOL_LAY CORR
    + MOE ERROR - LocID 240938223 - Fm table goes to 255 ft - I think the MOE units are wrong and should be feet - therefore depth = 266 x .3048 = 81.08 GEOL_LAY CORR
    + I can't figure where you got the depth of 250 m for LocID 240416215 - the deepest element I can find for this well is the Geology at 258 ft - therefore depth = 258 x .3048 = 78.64 m - just maybe check to see that this isn't a more systemic error. GEOL_LAY CORR
    + MOE Error - LocID 240500279 - everything is in ft except the Plug - likely an error - depth should be 180 x .3048 = 54.86 m GEOL_LAY CORR
    + LocID 240183435 - Plug From indicates 55 ft - depth should be 55 x .3048 = 16.76 m (look for Plug From for a depth if none available - LocID - 240183511 (11 ft); LocID 240183453 - (17 ft) DONE
* CHECK FOR ADDITIONAL TOP OF PLUG NO BOTTOM FOR NULL DEPTHS (DONE 20140527)

**D_BOREHOLE_CONSTRUCTION TABLE**

* Looks like top and bottom were exchanged if the top of the construction element was deeper than the bottom - good
* Some errors in BH Diameter - some too big - some too small - looks like mostly an issue of inappropriate units (Max Diam = 6125 inch) - should likely be 6.25 inch - also several 625 inch - all should be 6.25 inch - typically bored wells are 3 ft in diameter (36 inch (91.44 cm)  MODIFIED
* Smallest BH Diameter = 0.0041 cm (a few 0 diameter) - should be evaluated once in DB and appropriate changes made NOT MODIFIED
* Only 8 Con subtypes used (10, 16, 21, 23, 24, 25, 31, 32) - seals (31) and casings only - no sand packs 

**D_GEOLOGY_FEATURE_CODE TABLE**

* No codes 7 in table (Iron Water found)
* Mostly fresh (Code =1 - 3002 records) or untested (Code = 8 - 1722 records)
* Shallowest water found = 0.2 m / deepest water found = 550 ft
* 10,224 Water found records (732 Well Ids have more than 1 Water Found Record)

**D_GEOL_LAYER TABLE**

* There are 28 layers where the top is below the bottom - I didn't check in more detail - but wonder if it makes sense to switch the Top and Bottom fields so that they are proper. THIS IS NOT STRAIGHTFORWARD  - THERE ARE MANY CASES WHERE THE DECIMAL PLACE HAS BEEN MISPLACED AND ETC FIXED
* If a layer has no top and no bottom specified - should we even bring it into this table?  Don't know why there are all these blanks?  There are 1664 records (layers) in the table where the top and bottom are null and Mat 1 = 0 - should we just delete these?  
* There are around 90 cases where the Mat 1 assignment is 0 - but there are regular values assigned to Mat 2 or Mat 3 - wonder if we should do the same thing you did when the Mat 1 code was empty - move the assignments from Mat2 &/or Mat 3 up to Mat 1?  MOVED MAT2 TO MAT1; MAT3 DIDN'T SEEM REASONABLE

**D_INTERVAL TABLE** 

* Table looks good
* there are 16,525 Intervals coming into the DB - Int_Type Code 
    + 21 - Assumed Open Hole (Bot. of Casing to Bot. of BH) (28 Ints); 
    + 18  - Reported Screen (6,061 Ints); 
    + 19 - Overburden - Assumed (1 ft Screen above Bot. of Hole) (2,989 Ints);
    + 22 - Assumed Open Hole (Top of Bedrock to Bot. of Hole) (2,299 Ints);
    + 28 - Screen Information Omitted (5,148 Ints)
    + ADDED 123 - TOP INFO ONLY
* There are equal number of BHs and Intervals - therefore no Loc contains more than one screen - right? AN INTERVAL CAN HAVE MORE THAN ONE SCREEN IN A SINGLE PIPE (133)

**D_INTERVAL_MONITOR TABLE**

* 133 Int IDs have more than 1 record in this table - we should look for those cases where it appears to be two pipes in one BH (e.g. the diameter of plastic pipes changes - from 2 inch to 1 inch) - other cases are simply a change in slot size and that is OK.  IN SOME CASES (3 OUT OF 3), THE DEPTH VALUES EXACTLY MATCH SUCH THAT THE SCREENS APPEAR CONTIGUOUS - SHOULD ALL OF THESE 133 BE EXAMINED AND SEPARATED
* MOE Error - D_Interval_Monitor - there are 208 cases where the Mon Top OUOM is greater than the Mon Bot OUOM - how about we switch them so that the top is always less than the bottom (unless units are m(ft)asl) FIXED
* D_Interval_Monitor - why don't we make the "Mon_Screen_Slot" a number field instead of Text?  Also in our DB - I guess we should check with Sitefx - it might need text.  NOT AN ISSUE WILL BE CONVERTED UPON IMPORT (IS REAL IN MASTER DB)

**D_INTERVAL_REF_ELEV TABLE**

* Can we reduce the number of decimal places to 2 in the Ref_Elev and OUOM fields WILL BE RECTIFIED ON IMPORT AUTOMATICALLY (CHANGE IN TYPE)
* For the 10 Ints where we have no Ground Surface (I think they are in Lake Ont - can we remove the Ref_Elev of 0.75 mASL - just make null FIXED FOR BATHYMETRY

**D_LOCATION**

* There are 347 locations that have more than 1 Well tied to them (linked using Master Loc_ID)
* Well-ID 7140211 - has 258 wells tied to it; Loc ID 7140275 has 234 wells tied to it   - this is totally unreasonable (should make a note to Tim at MOE) - when I searched in the MOE DB to see if these numbers were correct - I wind up with 246 wells tied to 7140275 and 272 wells tied to 7140211 - did we make a mistake bringing these into our format - are we missing some of the BHs tied to these multi-0location well ids? DIFFERENCES IN COUNTS DUE TO INVALID COORDINATES;  NOTE DEPTHS COME FROM SPECIFIED MOE DEPTH
* Why are there 10 LocIDs with no elevation?  No coordinates or no DEM? BATHYMETRY, NOW NONE

**D_LOCATION_ELEV**

* looks good - none of the imported wells has an ElevRC of 1 - therefore no elevations to preserve.

**D_LOCATION_QA**

* There are 1,125 wells where the Loc_Coord_Confidence_Code (i.e. the one you assigned) is lower than the Loc_Coord_Confidence_Code_Orig - some are flagged with "MOE 201304 Import - Coordinate Conversion (possible error)" - but not all of them.  Wonder why these wells had the codes changed and what the possible import error might be?  IN SOME CASES THE UTM COORDINATES WERE CORRECTED (IF POSSIBLE); IN OTHER CASES, THE UTM COORDINATES WERE INVALID SO A GEOCODING METHODOLOGY WAS IMPOSED - THESE ARE TAGGED WITH A SEPARATE CODE AS THEY WILL NOT BE AS ACCURATE (IF CORRECT) AS SPECIFIED COORDINATES
* Were any of the Wells in Zone 18 and converted to Zone 17 equivalents?  Do we retain that in the UTM Zone - or somewhere?  Just curious - the UTMs OUOM match the UTM Final - so are we losing this info and do we care? THE ORIGINAL COORDINATES, WHETHER Z18 OR Z17 HAVE BEEN MAINTAINED

*20140606*

As part of the MOE WWDB import (201304 version), various corrections for other locations were applied using standard procedures/methodology as developed for the water well database.

D_INTERVAL_MONITOR rows were found with no bottom elevations/depths; these were found to correspond to zero thickness bedrock wells.  In these cases, '0.3m' screen intervals were imposed above the bottom of the well.

*201406*

Started assembling information for creating a new version of the database; both this document and Appendix H ('Current Problems') will be examined for necessary changes.  The schema created by SiteFX will be reviewed and both additions and modifications will be included as necessary.

*20140716*

An SSMA_Timestamp should be incorporated into each table - they help avoid errors when Access updates records in tables linked to SQL Server.  Review 'Supporting Concurrency Checks' from Microsoft documents.  In particular, 'The timestamp column increases automatically every time a new value is assigned to any column in the table.  Access automatically detects when a table contains this type of column and uses it in the WHERE clause of all UPDATE and DELETE statements affecting that table' (Stack Overflow, 2012).

*20140723*

At the moment, ranges of values include NULL, '-1' through '2'.  The '-1' values will be changed to '1' and '0' will be changed to NULL.  What is '2' indicating?

*201408*

Started implementing the new version of the database.  Corrections will be made on-the-fly with regard to errors while copying information between the old and the new versions.

*20140908*

Updated R_LOC_WATERSHED1_CODE removing multiple 'Rouge River' indicators.

*20140909*

D_INTERVAL_REF_ELEV has NULL values for REF_ELEV_START_DATE - this has been corrected (assigned the 'holder' value '1867-07-01').  A note should be made to populate this field upon data entry (this should be a constraint in the new version of the database).

In D_LOCATION_QA, what is QA_COORD_CONFIDENCE_CODE_UPDATE (a 'bit' field) being used for?  Should this be removed (likely, yes).

For D_LOCATION_VULNERABILITY:
Should this table be re-evaluated?
'AVI_Feb2003_Final 3 tier' column name should be changed.
'Water Table Sept 04 from model' column name should be changed.

Added R_GEOL_LAYERTYPE_CODE into OAK_20120615_MASTER (non-replicating) and populated manually from the original Microsoft Access database.  The '0' value was not included (no description was tagged to GEOL_LAYERTYPE_CODE '0').  This value (i.e. '0') was removed (assigned a NULL value) from D_GEOLOGY_LAYER  (the GEOL_LAYERTYPE_CODE field).

*20140910*

For D_INTERVAL_FORMATION_ASSIGNMENT:
SYS_RECORD_ID has been removed as both a key and a field - there should be only a single row per INT_ID.  Refer to Section 2.4.1 for the reasoning behind this.
Do we want to re-think the setup of this table?  Instead of adding additional columns for each model, should we simplify the table and add a look-up table for model codes?  An example would be:

INT_ID,ASSIGN_CODE,ASSIGN_DATE,GEOL_UNIT_CODE,MODEL_CODE,
VDIST

Where ASSIGN_CODE (a look-up table) would consist of (for example):

*Top Layer
*Bottom Layer
*Next Layer
*Previous Layer
*Assigned Unit
*Override Unit
*Manual Unit

And MODEL_CODE (a look-up table) would consist of (for example):

*Core Model 2004
*Regional Model 2004
*Extended Core Model 2006
*Durham Model 2007
*East Model 2010

Note that VDIST would only be populated for 'Next ?' and 'Previous ?' records.

There are various problems with this table (invalid GEOL_UNIT_CODE; invalid INT_ID) that should be addressed.

*20141017*

D_INTERVAL_TEMPORAL_1B and D_INTERVAL_TEMPORAL_2 have had their SYS_RECORD_ID's substituted for ranges of values that have been assigned to PEEL, CLOCA, YORK and NVCA.  This is to, temporarily, avoid errors when incorporating temporal data in the database where the primary keys conflict.  This arises from each of the partner agencies having a subset of the total database - keys can exist in the master that do not exist in their copy (and will conflict during replication).  Note that some sort of fix should be applied to all tables with identifiers.

*20141022*

D_INTERVAL_MONITOR is missing screened intervals (as specified in D_INTERVAL); this includes INT_TYPE_CODE's of: 18, 19, 21, 22 and 27.  Each is assigned tops and bottoms as appropriate.  See write-up in Section G.23.

*20141110*

D_LOCATION_PURPOSE is setup in a manner such that multiple purposes can be assigned to a particular location - this can take the form of multiple 'rows' of information.  Upon examination, it is found that there has been locations with more than two purposes assigned them (i.e. other than a single row with PURPOSE_PRIMARY_CODE and PURPOSE_SECONDARY_CODE).  There is an end date indicator (PURPOSE_DATE_END) but this is not being used.  In this case the multiples are repeating purposes (i.e. duplicates) for that particular location - these duplicates have now been removed.  However, more than two purposes can be assigned to any particular location, still (see the PTTW dataset).  If this is to continue, an indicator field - PRIMACY - is suggested which will tag the rows in the order that they should be considered.

*20141111*

Corrected location issue with regard to the MOE WWDB 201304 import - geocoding issues placed a subset of wells (~900) in the likely incorrect location.  This should continually be checked (using D_LOCATION_QA) when working with these locations.  QA_COORD_SOURCE and QA_COORD_COMMENT contain the relative details regarding the coordinate assignment.

*20141112*

Re-populated the contents of D_LOCATION_GEOM so as to incorporate changes in the D_LOCATION table (including the update of the MOE 201304 imported boreholes).

Examined resulting table (through plotting).  Corrected locations with invalid coordinates or assigned the invalid tag of '117' in D_LOCATION_QA.

It was noticed, during these coordinate corrections, that at times a 6-digit number actually conforms to a lat/long designation in 'ddmmss' format.  This is primarily found for Environment Canada climate stations and surface water sites.  This was then checked against other locations in D_LOCATION with coordinates modified as appropriate.  If addresses were found, an attempt at geocoding was performed.

*20141201*

Values within the temporal tables are found to have RD_NAME_CODEs that do not have a READING_GROUP_CODE assigned.  These have been updated as appropriate (either by modifying the RD_NAME_CODE and RD_NAME_OUOM or by applying a READING_GROUP_CODE to the RD_NAME_CODE).  Note that in the case of temperatures, some seem to exceed that which would be appropriate to groundwater but are associated with a 'reported screen'.

Users are assigning parameters to invalid temporal tables (e.g. herbicides in DIT2; water levels in DIT1B).  This is likely due to the default SiteFX setup.  RD_NAME_CODEs have been evaluated and re-assigned as necessary.

*20141215*

Reset invalid 'Temperature' records, reassigning them to the specific RD_NAME_CODE for their interval type (either a barometric logger or water level/temperature logger).

Corrected invalid DIT2 and DIT1B rows to appropriate table.

*201502+*

Start if review of 'new' database format (views and tables).

*20150224*

D_BOREHOLE and D_LOCATION_ELEV elevations are once again out-of-sync.  Some of these are tagged as 'surveyed' but still have their elevations changed - once this tag is in place, no elevation changes should ever again be made.  Corrected all of the changes (based on the QA_COORD_CONFIDENCE_CODE).

Updated all elevations (BH_GND_ELEV, BH_GND_ELEV_OUOM and BH_DEM_GND_ELEV) setting them to equivalent values (namely the ASSIGNED_ELEV); assigned BH_GND_ELEV_UNIT_OUOM to 'masl'.  Where the location did not have an ELEV_ORIGINAL, the BH_GND_ELEV_OUOM was used to populate the field (converting to 'masl' as appropriate).

Updated/corrected all BH_BEDROCK_ELEV where the elevation has changed (subsequent to the correction of elevations, above).

Removed 'soil' intervals (1) and 'surface water spot stage elevation' intervals (27) from D_INTERVAL_MONITOR.  Removed duplicates from D_INTERVAL_MONITOR.  Starting correcting of top- and bottom-screen intervals based upon various assumptions (e.g. '0.3' metres above bottom of hole for INT_TYPE_CODE '19').  Started re-examining incorporation of various screens into D_INTERVAL_MONITOR based upon various assumptions (e.g. as in the preceding sentence).

*20150225*

Incorporated 'new' intervals into D_INTERVAL_MONITOR with INT_TYPE_CODE 21 where:

INT_TYPE_CODE 21 - Assumed Open Hole (Bot. of Casing to Bot. of Hole)
these are assumed bedrock wells (i.e. they have casing that extends to
approx top of bedrock)

Boreholes with a difference between the bottom of the hole and the bottom of casing greater than 0.1m were incorporated as is.  The bottom-of-casing is considered to be the top-of-bedrock (and an update was made in D_BOREHOLE).

*20150227*

Finished updating/modifying INT_TYPE_CODE '21'; reassigned those (to '123') that were not appropriate.  Approximately 4000 do not have elevations due to invalid coordinates.  Update required some evaluation of BH_BEDROCK_ELEV and changes in D_GEOLOGY_LAYER; for the latter, a review of 'fbgs' OUOMs (which tend to be integer values) and 'mbgs' OUOMs (which tend to be real values) should be evaluatated.  It appears that some current 'mbgs' should be re-tagged as 'fbgs'.

*20150303*

Updating INT_TYPE_CODE '28' (Screen Information Omitted).  UGAIS wells (DATA_ID '2076806159', i.e. DATA_DESCRIPTION 'MNDM - Ontario Geological Survey (UGAIS Wells)') are assigned INT_TYPE_CODE '22' (Assumed open hole, top of bedrock to bottom of hole) where the BH_BEDROCK_ELEV is greater than 0.3m above the BH_BOTTOM_ELEV.  Note that only a subset of these records contain actual water level readings.

*20150305*

Updating INT_TYPE_CODE '28' (Screen Information Omitted).  Changed to INT_TYPE_CODE '22' or '19' based upon the presence of a BH_BEDROCK_ELEV.  Deleted those records with no valid bottom depth of any kind (the remainder were from the MOE WWDB 201304 import).  Twenty-four of these remain.  There are >8000 INT_TYPE_CODEs '28' remaining.

*20150306*

Update D_BOREHOLE_CONSTRUCTION; corrected CON_TOP_OUOM and CON_BOT_OUOM based upon casing information.  Units are converted from 'inch' and 'cm' to 'mbgs'.  Where CON_UNIT_OUOM is NULL, numeric 'integer' depths are assigned 'fbgs'; numeric 'real' (i.e. with a decimal) depths are assigned 'mbgs'.  Corrected (added) depths based upon construction details.

*20150313*

Summary review of 'new' database views (and related tables).

*DB REVIEW - March 13, 2015*

Views
1. V_Consultant_Document - OK
2. V_Consultant_General
    + Well Depth is missing
    + Change Surface_Elev to Ground Elev
    + Change Interval_Monitor_Num - to Number_Of_Screens
    + Change BH_Diameter_M to BH_Diameter_cm - (or whatever the correct unit is - it is not metres)
    + Given that the Number/StartDate/EndDate of the Water Levels and Water Quality info is already in the "V_Consultant_Hydrogeology" View and the intent is to provide all of these together - I think we can remove these fields from this table.
    + Wonder about the Several "Water_Found" fields at the end of the table - with no depth provided I don't know if this is all that useful to include in the view
3. V_Consultant_Geology - OK 
4. V_Consultant_Hydrogeology
    + We should add "Screened Formation" to this view
    + What is the difference between Pumptest_Start and Pump_Start_Date (and Pumptest_End vs Pump_End_Date
    + Similarly - doesn't Pumptest_Date_MDY relect the Pumptest_Start - they look the same - except maybe the time?
    + Does the Field "Pump_Readings_Num" record the number of water levels during the pump test? Or a change in pumping rate?  Maybe change to "Test_WL_Readings_Num"?
    + How come the "Pumptest_Rate_IGPM" is in whole numbers and the "Pumptest_Rec_Rate_IGPM" has decimal places - check the numbers to make sure that we didn't convert Gal to L or vice versa - make decimal places consistent between two fields.  No decimal places unless we converted from L to gal - then maybe 2 decimals.
    + Wonder if we should add "Daily_Pumping_Volume_Num" (and start/end dates) to provide indication of the data availability for the main pumping wells.
5. V_Consultant_Pick
    + This View doesn't return any records.
6. V_General
    + Purpose_Primary and Purpose_Secondary (Fix spelling) - do not appear to pull the data correctly - they are all null - should pull description from the correct R tables;
    + Move "QA_Coord_Code" - so that is right beside "Coord_Confidence" field;
    + Move "Status_Code" so that it is located beside the "Status" field;
    + Move "Type_Code" so that it is located right beside the "Type" field - also change name from "Type" to "Location_Type"
    + What does "Access_Code" refer to?  Do we need it here?
    + I see some of the 2006 PTTW records in here - did you create this DB before we deleted and replaced them?
7. V_General_Borehole
    + Since all records in View are from the D_Borehole  - we can probably remove the "Type" field (are there any outcrops in this view?  Maybe we remove them from here.
    + Change "Surface_Elev" to "Ground_Elev"
    + Change "Bottom_Depth" to "Bottom_Depth_m"
    + Change "Data_MDY" to "Date_Drilled_MDY"
    + Change "Interval_Monitor_Num"  - to "Number_Of_Screens"
    + Change "Screen_Geol_Unit" to "Screened_Geol_Unit"
    + What does "Screen_Geol_Unit_Elev" point to? Top/Middle/bottom of geol Unit? Top of screen? Bottom of Screen?
    + I don't think we would need "Status_Code", "Access_Code" or "Type_Code" in this View
8. V_General_Borehole_Bedrock
    + Do we need this View anymore?  It's the same as previous except the Bedrock Field is never null.  If we keep it - then we might want to change name to "Bedrock_Reached"  _ notice there are lots of wells in the table where the screen is in an overburden unit and not in the bedrock.
9. V_General_Borehole_Outcrop
    + Change name to V_General_Outcrop
    + I think the Alternative_Name and the Study fields are both Null for all Outcrops - maybe we can remove them
    + Remove "Type" field?
    + Change name of "Bottom_Depth" to Bottom_Depth_m)
    + Remove "Borehole_Diameter_cm" - not applicable
    + Do any of the outcrops have a date associated with them?  If not then remove - if yes then let's change the name from "Date_MDY" to "Date_Logged_MDY"
    + Remove fields "Interval_Monitor_Num"; "Interval_Soil_Num"; "Screen_Geol_Unit"; "Screen_Geol_Unit_Elev"; "Status_Code"; "Access_Code" and "Type_Code" all are not applicable and/or blank/consistent.
    + Maybe we could add a Field "Num_of_Geol_Layers" - and record the number of records for each outcrop in the D_Geol_Layer table.
10. V_General_Chemistry
    + What is in this view?  Does it include everything from all of the following Chemistry Views? If yes - should we change name to "V_General_Chemistry_All"
    + Change "Name" to "Loc_Name"
    + What does "Formation" refer to?  Change to "Screened_Formation".
    + I don't think anyone would care about "Bedrock_Elevation" in here - delete field.
    + Change "Group_Code" to the description - or add description and leave the Code.
    + What does Int_Access_Code refer to?  Remove?
    + What does Int_Active_Code - refer to?  Is it updated/used?  Remove?
    + This view also returns all of the soil grain size analyses and other lab data that pertains to soils - which I guess is why we called it "Lab" before.  Don't know if we should change name or change what the view returns (Int_Type <>  "Soil or Rock") - we should discuss.
11. V_General_Chemistry_Bacteriologicals
    + Same points as for V_General_Chemistry
12. V_General_Chemistry_Extractables
    + Same points as for V_General_Chemistry
    + Maybe we should add the "Qualifier" Field so that all of the "<" signs pop up
13. V_General_Chemistry_Herbicides_Pesticides
    + Same points as for V_General_Chemistry
    + Maybe we should add the "Qualifier" Field so that all of the "<" signs pop up
14. V_General_Chemistry_Ions
    + Same points as for V_General_Chemistry
15. V_General_Chemistry_Isotopes
    + Same points as for V_General_Chemistry
16. V_General_Chemistry_Metals
    + Same points as for V_General_Chemistry
    + Maybe we should add the "Qualifier" Field so that all of the "<" signs pop up
17. V_General_Chemistry_Organics
    + Same points as for V_General_Chemistry
    + Maybe we should add the "Qualifier" Field so that all of the "<" signs pop up
18. V_General_Chemistry_SVOCs
    + Same points as for V_General_Chemistry
    + Maybe we should add the "Qualifier" Field so that all of the "<" signs pop up
19. V_General_Chemistry_VOCs
    + Same points as for V_General_Chemistry
    + Maybe we should add the "Qualifier" Field so that all of the "<" signs pop up
20. V_General_Document
    + Remove "Study" field - not used for documents
21.	V_General_Document_Bibliography - OK
22.	V_General_Field
    + What does this View Return? All Field Data?  Change Name to "General_Field_All"?
    + Change "Name" to "Loc_Name"
    + Change "Parameter_Type" to "Measurement_Descriptor"
    + Remove "Bedrock_Elev" - not relevant to this View
    + Remove "Int_Access_Code" and "Int_Active_Code"
23. V_General_Field_Metereological
    + Change "Name" to "Loc__Alternative_Name" - the AltName field has the Environment Canada Name - so its easier for folks to quickly know the Climate Station location
    + Maybe remove the "Int_Type" and "Int_Type_Code" - since all of these should be climate station intervals?
    + What about adding RD_NAME_CODE to this View - someone might want to query out snowpack or something and the code might be handy (rather than text);
    + Change "Parameter_Type" to "Measurement_Descriptor"
    + Isn't the "Group_Code" all 22 for the metereological data?   If it doesn't change then maybe we can delete this field. 
    + Remove "Int_Access_Code" and "Int_Active_Code"
24. V_General_Field_Stream_Flow
    + I didn't check all - but if the Int_Alt_Name always has the Env Canada Long Name - then its fine - however if it doesn't then maybe we have to add Loc_Alternative_Name to show this.
    + Maybe remove the "Int_Type" and "Int_Type_Code" - since all of these should be surface water stations?
    + Isn't the "Group_Code" all 25 for the stream flow data?   If it doesn't change then maybe we can delete this field. 
    + Change "Parameter_Type" to "Measurement_Descriptor"
    + Remove "Int_Access_Code" and "Int_Active_Code"
25. V_General_Field_Summary
    + So does this summarize the Count and start/end dates for each Parameter for each Interval from Int 2?  Looks like Climate and Streamflow Ints are omitted.  Maybe change name to reflect this - "V_General_Field_Summary_BHs"
    + Remove "Bedrock_Elev" - not relevant to this View
    + Wonder if a "Value_Avg" would be a useful addition to this table?
    + Remove "Int_Access_Code" and "Int_Active_Code"
26. V_General_Geology
    + Change "Name" to "Loc_Name"
    + Maybe add "Layer_Thickness"?
    + Don't know if we need UTMs and QA code in here - don't think that plotting would occur very often from this View
    + Remove Type_Code; Access_Code; and Status_Code - not needed
    + For those wells that have it - it might be nice to add in the "GSC_Code"
27. V_General_Geology_Deepest_Nonrock
    + Don't know if we need UTMs and QA code in here - don't think that plotting would occur very often from this View
    + Remove Type_Code; Access_Code; and Status_Code - not needed
28. V_General_Geology_Outcrop
    + If we separate Outcrops - then should we rename V_General_Geology - to "V_General_Geology_BHs"?
    + Same points as above
29. V_General_Hydrogeology
    + This view only pulls BHs right?  Therefore the Type and Type_Code are likely not needed
    + Access_Code not needed
    + Same as for "V_Consultant_Hydrogeology" - Rectify difference between Pump_Readings and Pumping_Test - is one showing the daily pumping rates?  If yes - let's try find a better name - how about "Daily Pumped Volume_Num" (too long?)
    + We should add "Screened Formation" to this view
    + Is "Name" - the "Int Name" or the "Loc_Name"? - clarify
    + We need to check the field "PUMPTEST_REC_RATE_IGPM" - the values do not appear to be whole numbers - even when the pumping rate is a whole number - did we do a conversion here that we didn't mean to?
30. V_General_MOE_Report
    + What is the field "WellNumbers? - mostly contains ND(ND)ND?
    + Does "Water" indicate "Water_Found"?  Maybe change name? 
31. V_General_MOE_Well
    + We need to add a field for MOE_Well_ID (Loc Original Name)
    + I don't think that Primary and Secondary Use are being populated correctly - they are all null for the first 1000 records
    + "Access Code" and "Type Code" and "Type" are probably not needed
32. V_General_Pick
    + View doesn't return any records
33. V_General_Station_Climate
    + How about changing name to "V_General_Field_Summary_Meteorological" - similar to #25
    + We should add Int_ID and Maybe IntNAme - so if someone wants to quickly find the info the Int_ID is right here.
    + Type; Type_Code; and Access_Code are likely not needed
    + There are quite a few stations that have no Precip or Temp readings - is that correct?  No data for them - wonder if we should delete them?
34. V_General_Station_SurfaceWater
    + How about changing name to "V_General_Field_Summary_SurfaceWater" - similar to #25
    + What about adding in the Max and Min Water Level so that the Staff Gauges get summarized
    + Any chance that for the staff gauges we could have the min/max/avg/start date/end date and number of WL readings  - I guess this might mean we need two sets of readings here (one for WLev and one for streamflow)
    + I think the status code should also be in text (i.e. "Active" vs "Not Active")
35. V_General_Water_Level_Best
    + I don't like the name of this view - cannot tell what is returned?
    + If we keep this View - how about changing WL_Source to WL_Type (i.e. static vs logger vs other?)
36. "General"
    + What do you think of removing "General" from all of the Views - I don't think it provides any info that is useful.  If you/Rick want to go for only "pure" views that have codes only or no change in field names - then why not preface those with a "YPDT"  - it looks to me that most of your stuff/Rick's stuff is tucked away in your linked DBs anyway.  Let's discuss again.
37. "Names"
    + In general you tend to use Name - in many of the views - and this is tied to LocName - I think the Loc_Name_Alt1 is a much more informative name in general - for spot flows and MOE wells - the AltName1 is better.  Just thinking about what I have said below here - that we should combine "Consultant Views" with the General Vviews" to provide one - we are not supposed to give out "Owner" - so wondering if Loc_Name_Alt1" is different enough from "owner" that I can plead it wasn't intentional or if we should have one separate view for consultants - where we drop the Alt_1 name.  We should discuss when you read this.
38. Sitefx_SearchLoc_YPDT_Custom_view
    + Provides the info for one template format that we need to keep - there might be others - so this view should be transferred to the new DB
39. Overburden Wells
    + To get overburden wells - we would filter General_BHs for "Bedrock_Elev is null" - correct?  [Which way are we approaching this - users that know exactly what they're doing OR general users?]
40. Consultant PTTW
    + We formerly had a View Consultant PTTW - we should likely make a new one with our revised PTTW tables. [Revised tables have not, thus far, been approved.]
41. V_Consultant_TemporalData
    + We also had a V_Consultant_TemporalData - the intent of this view was to pull info from Interval_Temporal 2 - where a flag in D_Location (SysTemp1 or SysTemp2) was inserted.  The consultants were to be given the first views and based on the info - largely in Consultant_Hydrogeology - they would be able to see if they needed any of the temporal data.
42. Climate station views
    + The Views for the Climate Stations are missing - We should restore V_General_Climate_Annual_Prec_Summary - this provides the number of readings in any given year as well as the Avg/Max/Min for the year - it looks like to me the Avg is only calculated when the number of readings in any given year reaches close to 365 (maybe above 360) - but I don't know if the annual avg precip is all that valueable - we can discuss - but maybe we dump the Avg and just keep the max and min?  I also see some stations where the number of readings in a year exceeds 365 - can we check to see why that is? (See point below)
43. V_General_Climate_Annual_Temp_Summary
    + Restore - this view is similar to the above - except with Temp.  Again some years have more than 365 readings (e.g. Toronto City - 2004 has 397 readings - I suppose that if they took more than one measurement per day this could happen - don't know how it would affect the Avg calculation though - if it is an issue - then maybe we can dump the Avg. (See point below)
44. General_Climate_Data_Range 
    + The current view takes too long to run (>11 minutes) - but I thought you were going to rejig things to have some of the key info temporarily stored in Summary Tables?  Off-hand I don't see any tables that house summarized climate data - but I do see the View YPDT_Sys_Summary_Temp_Air that basically appears to do the same as the old view - but only for Temp.  I see YPDT_Sys_Summary_Precip does the same for precip.  These views are infinitely faster - so they must be relying on a built table somewhere.  Wonder if we want to have them in the same view and pull it out of the "Sys_View" pile and put it up in general?
45. The View "General Climate Stations" View (repeat for Streamflow stations)
    + Can be restored - its pretty basic - but at least should provide the status for all of the climate stations (active vs non-active). - ok I see it below with new name.
    + How about for Climate Stations/Meteorological - what if we have the following views:
    + V_General_Station_Climate_All_Data (currently named "Field_Meteorological"
    + V_General_Station_Climate_Summary (currently named "Station_Climate")
    + V_General_Station_Climate_Annual_Temp_Summary
    + V_General_Station_Climate_Annual_Precip_Summary
    + V_General_Station_Streamflow_All_Data (currently named "Field_Stream_Flow")
    + V_General_Station_Streamflow_Summary (currently named "Station_Surface_Water")
    + V_General_Station_Streamflow_Annual_Flow_Summary 
    + We should discuss whether "Station" comes before or after "Streamflow" and "Climate"
46. V_General_Surface_Water_Station_Spotflow
    + I think we should bring this back so that folks remember we have data and that they should add info to DB 
47. V_General_Documents
    + Similar to the Consultant View but has slightly more info - maybe we can discuss and fold into only one View - V_General_Documents_(Consultant)?
48. V_General_Field 
    + Does this view only contain data from the BHs (i.e. not metereological stations nor surface water stations?) - if yes maybe we change name to V_General_Field_Borehole?  Then we would have V_General_Field_ 1) BH; 2) Meteorological; and 3) Stream Flow as well as the V_General_Field_Summary - which includes all three of above.
49. V_General_Geology
    + We can probably look at adding a couple of fields to V_Consultant_Geology (maybe i) Ground Elev and ii) Bottom Elev (of the well - not the layer) and iii) Formation (Interpreted)) and merging the two views V_General_Geology_(Consultant) - Don't know how many layers would have a populated Material 4 - but we may want to include it in the view so that partners etc. would know that it is available;  
50. V_General_Hydrogeology vs V_Consultant_Hydrogeology 
    + Maybe combine to one view  - there are a few fields in the General one that aren't in the Consultant one that I would think we should add (i) Interpreted Formation (screen top); ii) Interpreted Formation (screen bottom); iii) First Measured WL (mASL); iv) Most recent measured WL (mASL); v) Drawdown During Pumptest (m); v) Completion date; vi) screen type)
51. V_General_Outcrops
    + Maybe bring back- just so folks are reminded that they are in the DB - just found it with new name - don't know if I like calling it Borehole?  
52. V_General_Locations
    + Similar to above - maybe we combine this with the "Consultant_General" View  - re-name to V_General_Locations_(Consultant)
53. V_General_Permits
    + We should probably develop a new View that works with the new PTTW table(s) AND COMBINE WITH Consultant view - re-name to V_General_PTTW_(Consultant)
54. V_General_Pick
    + Let's add the "s" back - "V_General_Picks"
55. LOC_TYPE 
    + Wonder if we should add the Loc_Type to the chemistry views - so that folks can readily screen out SW vs GW
56. General_Chemistry
    + Maybe change the name of General_Chemistry to General_Chemistry_All
56. Locs/Ints with Chemistry
    + How about a view (a group by) that pulls out the Locations/Intervals that have chemistry data associated with them?  Maybe called V_Chemistry_Present? - I don't think we need to necessarily pull the chemistry values - but maybe the number of "dates" that appear in Int1a/b - and the first/last date.
57. Temporal_BHs_Discharge_Production
    + I would like to bring back the Temporal_BHs_Discharge_Production" view - should focus on the "Production - Pumped Volume (Total Daily)" Rd_Name Code.
58. Viewlog views
    + For the Viewlog views (VL) - I think I would want to keep the names the same (especially for VL_Log_Header) since everyone's Viewlog project would be looking for this view to show wells in cross section.  We can talk specifically about these - I think the ones you omitted are ok to leave out for now.
59. General_Temporal_Chemistry_General_Water_Soil_Rock
    + We might want to bring this one back - Waterfront Toronto is thinking of asking us to put in 15,000 BHs into the DB - all having soil chemistry results.

*20150317-19*

Reassigned INT_TYPE_CODEs '27' (i.e. 'Reported Open Hole - derived from bh construction') to one of '21' and '22' based upon the presence of casing and a bedrock elevation.  Started corrections of D_INTERVAL_MONITOR with invalid or duplicate rows for particular INT_IDs.  Started corrections of D_GEOLOGY_LAYER with possibly invalid units.  

*20150320*

Updated D_LOCATION_ELEV for new locations (~800).

*20150407-08*

With regard to the new database version: Reworked D_INTERVAL_FORMATION_ASSIGNMENT view(s); added the number of geologic layers to the summary tables; incorporated the SITEFX_SEARCHLOC view; added the V_GENERAL_WATER_LEVEL_OTHER view; added the V_GENERAL_HYDROGEOLOGY_BEDROCK view; added the V_GENERAL_WATER_FOUND view; updated various other views to reflect underlying changes.

*20150410*

Exchanged LOC_NAME and LOC_NAME_ALT1 for the climate stations.  Added the spot flow view(s) to the new database version.

*20150413*

Modified V_CONSULTANT_HYDROGEOLOGY in new version of database.  Add V_SUMMARY_CHEMISTRY_SAMPLES and V_GENERAL_FIELD_PUMPING_PRODUCTION.  Examined duplicate INT_IDs and combined data to single INT_ID.

*20150415+*

Corrected D_GEOLOGY_LAYER based on duplicate '0' depth values (and other errors).

*20150420*

Worked on PICKS table (trying to decrease access/update speed).

*20150507-12*

Incorporated UGAIS grainsize (with corrections) data previously included as part of the GEOL_DESCRIPTION within D_GEOLOGY_LAYER.  Additional soil intervals were created (in some cases) in some instances(where they previously did not exist).

*20150515+*

Start of the water level (DIT2) corrections as part of a shallow water table calculation across the entire area.  The first phase is the examination of those values that greatly exceed '20m' depth (at which depth the shallow wells are arbitrarily defined).  Various modifications are made including (for example): depths such as '203m'  for boreholes that are only '4m' deep are assigned a value of '2.03m' instead; units are converted from (some combination of) 'ft' to 'm' (or vice-versa) as appropriate based upon the depth of the well or depth of the screen.

Note that these modifications have/may affect borehole details  especially with regard to depths and including modification of REF_ELEV from D_INTERVAL_REF_ELEV as appropriate.

There is a real issue with regard to multiple instances of elevations throughout the various tables (e.g. D_BOREHOLE, D_LOCATION_ELEV, D_INTERVAL_REF_ELEV, D_INTERVAL_MONITOR, and etc?).  Mismatched elevations  occur between these tables - an effort should be made to reduce these to single value with all others changed to depths (instead).  This is an issue with SiteFX, however.

In addition, correction of the water levels themselves (as found in D_INTERVAL_TEMPORAL_2) has-been/is-being performed.  This includes adjustment of 'masl' units to depth units (based upon, usually, the original elevation) - a similar problem, as described above, was found.

*20150529*

Evaluated R_BH_DRILLER_CODE to swap BH_DRILLER_DESCRIPTION and BH_DRILLER_DESCRIPTION_LONG; not possible as there are duplicates in the latter.

*201506+*

Worked with TRCA on Portlands data (extraction and addition of).  Evaluated the presence of boreholes in the lake for this area (UGAIS wells; they were drilled through in the lake itself and is not an locational error).  Determed that Toronto uses a modified NAD27 datum - modified Portlands locations based upon this.

*20150623*

Reset all Y/N fields in D_DOCUMENT; 'N' is changed to a NULL value and 'Y' changed to a '1' value for consistency.

*20150814*

Change BH_BEDROCK_ELEV values to four decimal places.  This should be standardized across all relevant (i.e. REAL types) columns (e.g. elevations and depths).

*201509+*

Major push to finish database structure (including views) for the updated master database release.  Note that if replication is to be discontinued, the auto-increment (i.e. IDENT) columns can be reinstated (from the programming - maximum determination - currently imposed).  Remember, IDENT fields are very finicky with regard to multiple users and replication.

*20150904

R_GEOL_MA\T*_CODE out of sync (mainly MAT3 and MAT4).  Corrected these and D_GEOLOGY_LAYER.

*20150908*

Applied a GEOL_SUBCLASS_CODE of '7' ('Original (Invalid)') to those records in D_GEOL_LAYER where the GEOL_TOP_OUOM and GEOL_BOT_OUOM have NULL values.  This is code (i.e. '7') should be used to weed out invalid geology layers in the various views (as required; e.g. V_GENERAL_MOE_REPORT).

*20150923*

Corrected D_GEOLOGY_LAYER for those wells in the 'Yonge St. Aquifer' study.  Mainly, these have zeroed elevation layers; in some cases, geology for a single layer is spread over multiple rows.

*20151005*

Incorporation of Permite-to-take-Water database (from 20141003) using the newly developed structure.

*20151103*

Changed water level data in D_INTERVAL_TEMPORAL_2 from 628/629 to 70899 when the RD_VALUE is NULL due to: frozen; dry; other ...  The RD_TYPE_CODE is adjusted to match as well.

*201606-08*

A tracking mechanism is implemented for both coordinates (D_LOCATION_COORD_HIST) and elevations (D_LOCATION_ELEV_HIST).

*20160831*

A new version of the database is created - this incorporates all changes as originally implemented in the OAK_20120615_VIEWS database.  All views and tables are now found entirely in a single database.

*20170115*

Secondary version number change (now 20160831.20170115).  This is tied to the update of the master database to match the current SiteFX schema base.  Comment added to D_VERSION_CURRENT was 'Matched to subset of SiteFX db v16082201'.

*20170524*

Secondary version number change (now 20160831.20170524).  All meteorological data (i.e. from climate stations) have now been moved into the D_INTERVAL_TEMPORAL_3 table; updates to the various views are ongoing.  Comment added to D_VERSION_CURRENT was 'Climate data moved to DIT3'.


