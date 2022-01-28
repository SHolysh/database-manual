---
title:  "Section 2.1"
author: "ormgpmd"
date:   "20220128"
output: html_document
knit:   (
            function(input_file, encoding) {
                out_dir <- '';
                rmarkdown::render(
                    input_file,
                    encoding=encoding,
                    output_file=file.path(dirname(input_file), out_dir,
                    '02_01_Tables_and_Views.html')
                )
            }
        )
---

## Section 2.1 Tables And Views

#### *Overview*

Real world objects are stored as approximations within a database - the data model itself describes how the object's information is stored, where it is stored and how it is to be accessed.

Data models include the definition of tables and their fields (i.e. what information goes where) and how tables are related.  Embedded within a table and its field description is a definition of field types (e.g. text, date and numeric), field size (the maximum character size or numeric range, real versus integer values), relationships between tables and the data in the tables (e.g. one-to-one, one-to-many), cardinality, and indexes.

In general, field names have been chosen to be as meaningful as possible to the user, to contain no spaces or punctuation and to be unique.  Field names in data and look-up/reference tables in general are always capitalized.

Refer to Section 2.2 with regard to relationships between the tables.  Refer to Section 4 (Technical) for complete descriptions of individual tables, views and fields.

#### *Identification Fields (\*_ID)*

Identification fields are the internal *_ID numbers assigned to each major entity in the database.  Each location whether a well, climate station, surface water station report or other type, as well as the related key attributes (e.g. boreholes, documents, screens or intervals has a unique integer (i.e. a whole) number (e.g. LOC_ID, BH_ID, DOC_ID and INT_ID) that allows characteristics/attributes for the entity to be 'linked' across multiple tables (i.e. the relation in 'Relational Database').  Once assigned, these unique identifiers do not change and should not be modified.

#### *Data Fields*

The other fields (other than system fields, described below) contain
information related to a particular entity.  In general the data and its
nomenclature are table specific, however in many cases fields containing a
particular  type of information will have a consistent naming (e.g. RD_DATE is
consistent wherever it appears in the D_INTERVAL_\* tables).

#### *Original Data Fields (\*_OUOM)*

At the time of the creation of the database it was thought that data capture into the database (especially with respect to metric versus imperial units) should be in its original format rather than performing conversions outside of the database and then importing the data.  This allowed for the data to be compared to the source files at any future date should data quality issues arise.  Therefore the term "Original Units of Measure" or OUOM was developed at the time to reflect that a particular field contained "original" data.    A parallel series of fields, usually the same name with the '_OUOM' suffix removed, holds the converted/corrected data   SiteFX, the SiteFX software program that has been developed to assist with database management, was originally developed to convert units to "system" units as dictated by the database managers.  As an example, all elevations within the database are presented in metres above sea level (i.e. 'masl').  The related OUOM field may contain units such as 'fbgs' (feet below ground surface) or 'mbgs' (metres below ground surface).  A unit conversion table (R_UNIT_CONV) is built right into the database for this purpose and a built-in SiteFX routine makes use of the R_UNIT_CODE and the R_UNIT_CONV tables and goes through the database converting the OUOM data fields into "system" units (in separate data fields).  Of course, data conversion can also take place without SiteFX.

Note that if the SiteFX conversion routine is run against the database then any changes that have been made directly to the converted/corrected fields will be overwritten since SiteFX looks to the OUOM field to re-populate the converted/corrected field.  As such, it is recommended that to maintain permanent changes, the '_OUOM' fields should be modified to reflect any change that is needed.

#### *System Fields*

System fields are generally located at the end/right side of most tables.  These tables are generally not used except by the data management software/views (e.g. SiteFX) to manage or track the database.  These are typically named with a 'SYS_' prefix.  Some of these, for example SYS_CHANGE_EXPLANATION (used for tracking user corrections to the data), SYS_TIME_STAMP (the date of initial entry of the data into the database) and SYS_USER_STAMP (the user who created the row in the database) are useful for the user.  Most system fields, though, should not be used to store permanent data as they are often overwritten during internal management tasks.  Both the SYS_TEMP1 (text) and SYS_TEMP2 (numeric - integer) fields can be used for flagging records in the database for a particular task, however they must not be relied upon to maintain their user defined value over the long term.

The fields SYS_LAST_MODIFIED and SYS_LAST_MODIFIED_BY have been implemented in almost all tables - these contain the last user (and date) to have modified the particular row in the database.  These function as a first-order data tracking system.

One particular SYS_ field, namely SYS_RECORD_ID, is used in many tables as a primary key - i.e. the value found here distinguishes a row from any other row in the table.  It is important to note that it cannot be used to join/link tables with a similarly named field.

## Section 2.1.1 Data Tables (D_\*)

Prefixed with 'D_', these tables are populated with data specific to the table (name).  These include:

* D_AREA_GEOM
* D_BOREHOLE
* D_BOREHOLE_CONSTRUCTION
* D_CLIMATE
* D_CRITERIA
* D_DATA_INFO
* D_DATA_SOURCE
* D_DATABASE_NOTE
* D_DOCUMENT
* D_DOCUMENT_ASSOCIATION
* D_DOCUMENT_ASSOCIATION_INTERVAL
* D_GEOLOGY_FEATURE
* D_GEOLOGY_LAYER
* D_GEOPHYSICAL_LOG_DATABIN
* D_GEOPHYSICAL_LOG_FIELD_DETAILS
* D_GEOPHYSICAL_LOG_LITHO_DESCRIPTIONS
* D_GEOPHYSICAL_LOG_LOCATION_DETAILS
* D_GROUP_INTERVAL
* D_GROUP_LOCATION
* D_GROUP_READING
* D_INTERVAL
* D_INTERVAL_ADVERSE_EVENT
* D_INTERVAL_ALIAS
* D_INTERVAL_ATTRIBUTE
* D_INTERVAL_ATTRIBUTE_LOOKUP
* D_INTERVAL_ATTRIBUTE_VALUE
* D_INTERVAL_FORM_ASSIGN
* D_INTERVAL_FORM_ASSIGN_FINAL
* D_INTERVAL_INFO
* D_INTERVAL_INFO_DETAIL
* D_INTERVAL_MONITOR
* D_INTERVAL_PROPERTY
* D_INTERVAL_QC_DATA
* D_INTERVAL_REF_ELEV
* D_INTERVAL_SOIL
* D_INTERVAL_SUMMARY
* D_INTERVAL_TEMPORAL_1A
* D_INTERVAL_TEMPORAL_1B
* D_INTERVAL_TEMPORAL_2
* D_INTERVAL_TEMPORAL_3
* D_INTERVAL_TEMPORAL_4
* D_INTERVAL_TEMPORAL_5
* D_LOCATION
* D_LOCATION_ACTIVITY
* D_LOCATION_ALIAS
* D_LOCATION_ATTRIBUTE
* D_LOCATION_ATTRIBUTE_LOOKUP
* D_LOCATION_ATTRIBUTE_VALUE
* D_LOCATION_DEPTH_DATA
* D_LOCATION_GEOM
* D_LOCATION_INFO
* D_LOCATION_INFO_DETAIL
* D_LOCATION_PURPOSE
* D_LOCATION_QA
* D_LOCATION_QC
* D_LOCATION_SPATIAL
* D_LOCATION_SPATIAL_HIST
* D_LOCATION_SUMMARY
* D_LOCATION_VULNERABILITY
* D_LOGGER_BARO_COMPENSATION
* D_LOGGER_CALIBRATION
* D_LOGGER_CALIBRATION_READINGS
* D_LOGGER_CORRECTION
* D_LOGGER_INSTALLATION
* D_LOGGER_INVENTORY
* D_LOGGER_INVENTORY_MODULE
* D_LOGGER_INVENTORY_MODULE_ATTRIBUTE
* D_LOGGER_INVENTORY_SENSOR
* D_LOGGER_INVENTORY_SIM
* D_LOGGER_NAME
* D_LOGGER_QC
* D_LOGGER_QC_DDS
* D_OWNER
* D_PICK
* D_PICK_EXTERNAL
* D_PROJECT_LOCATION
* D_PROJECT_USER_GROUP
* D_PTTW
* D_PTTW_RELATED
* D_PTTW_RELATED_SRC
* D_PUMPTEST
* D_PUMPTEST_STEP
* D_SITE
* D_SURFACEWATER
* D_USER_GROUP
* D_VERSION
* D_VERSION_CURRENT
* D_VERSION_STATUS

A (short) discussion of these tables, as used by the ORMGP, follows.

#### D_AREA_GEOM

This table takes uses the spatial geometry type in SQL SERVER to store various polygons used within the ORMGP.  These include, for example, the extents of the regions (Durham, Peel, Toronto and York) as well as the Conservation Authority partners.  The GEOM field holds the native spatial geometry while the GEOM_WKB holds the 'Well-Known-Binary' format.  Various views rely upon these objects to delimit locations by area (instead of using, previously, the D_LOCATION_AGENCY table).

#### D_BOREHOLE

This table is used to store the main details related to a well installation including such attributes as elevation (BH_GND_ELEV), date installed/completed (BH_DRILL_START_DATE/BH_DRILL_END_DATE), drilling method (BH_DRILL_METHOD_CODE) and driller (BH_DRILLER_CODE), depths (BH_BOTTOM_ELEV and BH_BOTTOM_DEPTH - as a side note if the depth is not directly provided, it can be calculated from, or checked against, either the construction details, found in D_BOREHOLE_CONSTRUCTION, or from geology as found in D_GEOLOGY_LAYER).  Every well or borehole in the database should have a record in the D_BOREHOLE table and there is a one-to-one relationship between objects in this table and that of D_LOCATION.

In addition to wells or boreholes, additional geologic-related locations can be found here in order to be included when working with cross-sections (within, for example, Viewlog).  A specified top- and bottom-elevation is required in these cases and an 'artificial borehole' record is introduced.  The following location types are can be currently found in this table

* Well or Borehole
* Archive
* Surface Water
* Outcrop
* Oil and Gas Well
* Geological Section
* Bedrock Outcrop
* Testpit

Refer to Section 2.4 with regard to the assignment of elevations within this table.

#### D_BOREHOLE_CONSTRUCTION

Construction details including depths (CON_TOP_ELEV and CON_BOT_ELEV) , diameter (CON_DIAMETER) and type (CON_SUBTYPE_CODE) are specified here.  This includes information on, for example, casing(s), sand packs and seals (a listing of construction types can be found in R_CON_SUBTYPE_CODE and R_CON_TYPE_CODE).  Within this table, there can be many records/rows associated with a particular borehole.  Note that the CON_DIAMETER field is not currently converted to a standard unit system (cm) - users should refer to the CON_DIAMETER_OUOM and CON_DIAMETER_UNIT_OUOM fields.

#### D_CLIMATE

Contains the source information from Environment Canada regarding the climate stations within the ORMGP database.  Note that this table is infrequently used and generally only contains historical source data (e.g. Latitude & Longitude) that can be used for for back-checking.  Most of the information in this table has been incorporated into the D_LOCATION table.  This table should be discarded in a subsequent database version.

#### D_DATA_SOURCE

Used for tracking data that comes into the database and is mostly used for: i) locations that are added (either through agencies, consultants or reports); or ii) temporal data that has been incorporated (and includes the agency as well as file directory structure and source name).  Even though the DATA_ID field is present in almost all tables, it is frequently left blank or is inherited from the same DATA_ID from the D_LOCATION table.  The overall intent of the table is to identify the data's original source. 

This table is automatically updated when uploading temporal files (e.g. water levels, pumping rates, etc.) through SiteFX.  When locations are being input, or when manually uploading temporal data directly into the database this table must be directly edited by the user.  The primary fields of interest in the latter case are

* DATA_ID: a randomly generated integer used as a primary key in this table (i.e. this value should not be duplicated)
* DATA_TYPE: a single work describing the type of data being loaded (e.g. 'Waterlevels'); usually blank for a non-temporal data import
* DATA_DESCRIPTION: a short description of the data being imported; should usually be identified with a project and an area 
* DATA_FILENAME: the source filename (whether it be an Excel, Access or other type of file); ideally this file should be made accessible to the ORMGP to be used for back-checking in the cases of data errors/problems
* DATA_ADDED_USER: the user name, usually the users Windows or SQL login name
* DATA_ADDED_DATE: this field is automatically updated (if the information is being added by SiteFX); the date is actually when the records were added to the appropriate tables

#### D_DOCUMENT

This table holds general bibliographic information (e.g. author, date, client, etc...) concerning documents found in the ORMGP document library.  Also specifies whether additional data is present in the report (e.g. boreholes, water levels, pumping, geology, etc.) and whether that information has been entered into the database - this is enabled through a series of true/false fields.  

Documents have been tagged as a location type (refer to R_LOC_TYPE_CODE) and each document, if available, has coordinates associated with it allowing plotting along with other locations.  Note that the document identifier (the DOC_FOLDER_ID) and the title of the report is found in the D_LOCATION table in the LOC_NAME and LOC_NAME_ALT1 fields (respectively).

#### D_DOCUMENT_ASSOCIATION

This table allows specification of a link between documents found in the ORMGP document library and a particular location (e.g. boreholes).  This allows, for example, the user to determine what report(s) a particular location/entity is tied to, thus allowing back-checking of, for example, the geology or water levels.  Any particular location can be referenced by multiple reports.

#### D_DOCUMENT_ASSOCIATION_INTERVAL

Similar to D_DOCUMENT_ASSOCIATION, this table allows a link to be specified between documents found in the ORMGP document library and a particular interval (e.g. screens).  Any particular interval can be referenced by multiple reports.

#### D_GEOLOGY_FEATURE

This table is provided as support for geologic features which may not fit into D_GEOLOGY_LAYER (see below) due to size constraints (especially with regard to material descriptions) or for inclusion of hydrogeological features such as water found depth (and type) or the presence of fractures or other similarly planar features that do not necessarily have both a top and bottom elevation.  Note that this table is currently used almost exclusively for recording the water found depths reported by drillers within the MOE Water Well database.

#### D_GEOLOGY_LAYER

This is a key table that holds the geologic record (specified by from- and to-depths) related to a particular location (e.g. boreholes, outcrop, trenches, etc...) describing the sequential stratigraphic layers encountered.  Note that through SiteFX, the original depths (GEOL_TOP_OUOM and GEOL_BOT_OUOM, based on units specified in GEOL_UNIT_OUOM) are converted to elevations for visualization or comparison based on the ground elevation in BH_GND_ELEV from the D_BOREHOLE table.  Note that the BH_GND_ELEV value should match that in ASSIGNED_ELEV in the D_LOCATION_ELEV table.  The longer term intent is to remove the elevation fields from D_BOREHOLE.

Four material types can be assigned for each geological layer (additional material types - or additional details - can be included by using the D_GEOLOGY_FEATURE table; note that the former is discouraged).  The material types that can be used to describe a layer are largely taken from the original MOE database - however a few additional geological 'Materials' have been added.  Refer to R_GEOL_MAT1_CODE ('_MAT2_' through '_MAT4_' look-up tables are also available but each are equivalent and only used for reducing internal database complexity) for available material types/codes.  Any layer may be linked to a 'Geologic Formation' (see R_GEOL_UNIT_CODE) through the use of the GEOL_UNIT field.  In addition, the incorporation of the 'GSC Codes' (GEOL_MAT_GSC_CODE) allows for a re-interpretation (as necessary) of the geologic layers through methodology developed by the GSC in the late 1990's.

Additional information on colour, consistency, moisture, texture and organics can also be recorded (each has a look-up table as well).  It should be noted however that these fields (except for colour) were incorporated into the database as a result of their presence in the various geotechnical databases that were merged into the Master database.  As a result they are generally not populated for the MOE well records.  Indeed some terms such as 'Dense' are material codes within the MOE structure.  The fields are also not accessed readily through SiteFX.

Using the GEOL_SUBCLASS_CODE field, users can specify (as necessary) alternate geologic descriptions/interpretations for the location/borehole (see R_GEOL_SUBCLASS_CODE).  A value of '5' (the default) indicates the 'Original (or Corrected)' description (if present, this value indicates that the geology has been re-evaluated , usually by reviewing the borehole documentation, and possibly corrected).  At present, alternate interpretations can be specified based upon PICKS (i.e. a '4' - 'Other (e.g. Picks)') or just as 'Alternate' (i.e. a '6'; when, for example, the database contains both an MOE description and a consultant's original report for a borehole).  If there is a problem with the original geologic descriptions (usually related to lack of elevations or depths), a GEOL_SUBCLASS_CODE of '7' (i.e. 'Original (Invalid)') can be applied.  If so, there may be a code of '6' (i.e. 'Original (or Corrected)') applied to an alternate-corrected interpretation.  See also R_GEOL_CLASS_CODE.  For a NULL values in GEOL_SUBCLASS_CODE, it is assumed the layer to be original/unmodified (this should be the default).

Refer to Section 3.3.4 for details-by-example regarding the assignment of geologic information to this table.

#### D_GEOPHYSICAL_LOG_\*

This includes each of

* D_GEOPHYSICAL_LOG_DATABIN
* D_GEOPHYSICAL_LOG_FIELD_DETAILS
* D_GEOPHYSICAL_LOG_LITHO_DESCRIPTIONS
* D_GEOPHYSICAL_LOG_LOCATION_DETAILS
  
These four tables are likely to be re-evaluated in the next version of the database in that much of the information contained in these four tables is already located elsewhere in the database.  Together the four tables contain the geophysical logging results from those wells that have been logged.  Viewlog currently links to these tables to display the geophysical logs in section.  Due to the considerable size of the information related to geophysical logging, the geophysical data is stored in the D_GEOPHYSICAL_LOG_DATABIN table as Binary-Large-Object (BLOB) files.  As such, specialty software (e.g. Viewlog) or queries are required to access the data.  These fields should reevaluated in a future database version.

'HoleName' is the primary key relating all the geophysical tables and D_GEOPHYSICAL_LOG_LOCATION_DETAILS provides the link to D_LOCATION through LocID (i.e. LOC_ID).  

#### D_GROUP_INTERVAL

This table allows intervals (based upon their INT_ID) to be associated together based upon a GROUP_INT_CODE.  For example, all of the screens (intervals) that have been sampled for isotopes form a group; intervals that are measured during a pumping test could also be grouped.  The current groups are described/listed/found in R_GROUP_INT_CODE.  

#### D_GROUP_LOCATION

Allows locations (based upon their LOC_ID) to be associated together based upon a GROUP_LOC_CODE.  As an example, all of the PGMN wells have been grouped together (GROUP_LOC_CODE '99').  The current groups are described/listed/found in R_GROUP_LOC_CODE.

#### D_INTERVAL

This is a key table that houses the main information related to intervals, where an interval is the base entity (representing real-word objects like, for example, a well screen) for linking temporal data within the database.  All temporal data (i.e. measured values relative to a particular date; whether it be a water level, pumping record, surface water flow measurement, precipitation data at a climate station, etc...) must tie to a particular interval which, in turn (in this table), is tied to a particular location (using the identifier fields LOC_ID and INT_ID).  Any particular location can have multiple intervals.  So, for example, one borehole could have many screens.  

This table does not contain much information other than the interval name (INT_NAME, INT_NAME_ALT1) which is, in general, equivalent to that of the LOC_NAME.  Also present is the INT_NAME_MAP field (similar to the LOC_NAME_MAP field in D_LOCATION) which is to be used for storing 'short' names that can be used when plotting.  The INT_TYPE_CODE, an important field, allows intervals to be specified as a particular type (e.g. whether the particular interval is a climate gauge, soil sample, surface water gauge, a reported screen, an open hole in bedrock, etc...); a full list of available types is found in R_INT_TYPE_CODE.

Some locations (many located in Durham) have multiple intervals tied to specific single screen.  In this case, the interval is recording information based upon either of the 'raw' water samples that are being collected or the 'treated' water samples that are being analyzed.  This difference should be captured by the INT_SAMPLE_TYPE_DESC field (a free form text field) with the former being specified as 'raw' and the latter being specified as 'treated'.

#### D_INTERVAL_ALIAS

This table allows additional names to be associated with intervals (through an INT_ID) as found in D_INTERVAL (note that three names INT_NAME, INT_NAME_ALT1 and INT_NAME_ALT2 are already available for naming intervals in the D_INTERVAL table).

#### D_INTERVAL_FORM_ASSIGN

This table has been completely reevaluated (for the second time) in comparison with previous versions of the database.  This version allows for multiple model representations (as listed in R_FORM_MODEL_CODE) to be easily incorporated, tracking the associated information for each model-to-interval relationship.  

Multiple geologic models (incorporated into the ORMGP program) have been interpreted for each interval present in this table.  Any particular interval can be found to be in a different geologic unit depending upon the geological interpretation at the time of the surface/model construction.  Note that these are updated automatically (refer to Appendix G for details) when any relevant information (e.g. coordinates or depths) are changed.

Further details and how the table is populated can be found in Sections 2.4.1 and 2.4.5.

Only intervals (i.e. INT_ID's) found in either of D_INTERVAL_MONITOR or D_INTERVAL_SOIL (with valid top- and bottom-elevations/depths) will be present in this table.  The fields in the table include:

* ASSIGNED_UNIT is the geologic unit, for this particular geologic model to which the interval is assigned (see FORM_MODEL_CODE)
* FORM_MODEL_CODE identifies the geologic model to which this record for this interval applies (where there will be one record for each interval for each geologic model being examined)
* SLAYER is the surficial geologic unit for this location/interval.
* TLAYER is the geologic unit in which the top of the interval lies
* BLAYER is the geologic unit in which the bottom of the interval lies
* PLAYER is the previous/upper geologic unit above the top of the interval
* PLAYER_VDIST is the distance from the top of the interval to the top of the previous geologic unit
* TNLAYER is the next geologic unit down from the top of the interval
* TNLAYER_VDIST is the distance from the top of the interval to the top of the next geologic unit (down from the top of the interval)
* NLAYER is the next geologic unit down from the bottom of the interval
* NLAYER_VDIST is the distance from the bottom of the interval to the top of the next geologic unit (from the bottom of the interval)
* BPLAYER is the previous geologic unit up from the bottom of the interval
* BPLAYER_VDIST is the distance from the bottom of the interval to the top of the previous geologic unit (from the bottom of the interval)
* THICKNESS_M is the thickness of the geologic unit (normally an aquifer) to which this interval has been assigned (as stored in ASSIGNED_UNIT)
* T is the Transmissivity (m2/s)
* K is the Hydraulic Conductivity (m/s)
* T_ITER is the number of iterations necessary to calculate T
* T_ERR is the final calculated error difference between this calculated T and the previously calculated T
* SC_LPMM is the calculated Specific Capacity incorporating Well Loss (liters-per-minute per metre)

#### D_INTERVAL_FORM_ASSIGN_FINAL

The ASSIGNED_UNIT for the specific INT_ID in this table  is considered to be the 'best guess' allowing a complete geologic representation across the entire study area using the various available models.  Refer to Section 2.4.1 for details on how this field is populated and for a listing of the geologic models evaluated.

The fields in the table include:

* ASSIGNED_UNIT is the appropriate 'final' (or 'best') geologic unit that should be associated with this interval based upon the geologic models represented in D_INTERVAL_FORM_ASSIGN (see OVERRIDE_UNIT for an exception)
* OVERRIDE_UNIT is the geologic unit which should be assigned to this interval; if populated, this field will take precedence over any geologic unit found in D_INTERVAL_FORM_ASSIGN; values should be assigned to this field only until an appropriate geologic model is representative for this interval at which point the field should be set to NULL
* MANUAL_UNIT is the geologic unit which has been defined for this interval by some trusted, external source (e.g. a high-quality consultant report) - either of the DATA_ID or FINAL_COMMENT fields should indicate this source; this is for reference or historical purposes only (and can be used to temporarily populate OVERRIDE_UNIT)

#### D_INTERVAL_MONITOR

This table provides details of the (possibly assumed) screened interval for, in general, well or borehole locations.  In many cases, when reported, the screen top and bottom depth are provided - these are (subsequently) converted into elevations (usually by SiteFX).  For wells that have no reported screen, the database defaults to assigning a one foot long screen (or 0.3m for those wells whose OUOM units are metric) just above the bottom of the hole (this "Assumed Screen" type of interval is captured in the R_INT_TYPE_CODE table).  There can only be one interval monitor record for each interval. 

The following interval types are currently found in this table

* Assumed Open Hole (Bot. of Casing to Bot. of Hole)
* Assumed Open Hole (Top of Bedrock to Bot. of Hole)
* Assumed Screen (Overburden Well, 1ft Screen assigned); this is assumed to be above the bottom of the borehole/well
* Assumed Screen (Top/Bot of info only); this is usually applied when only a single (top or bottom) depth value is present, usually from D_BOREHOLE_CONSTRUCTION; a 1 ft screen is assumed
* Pumping Station
* Reported Open Hole
* Reported Screen
* Screen Information Omitted
* Surface Water Spot Stage Elevation (this should be removed)

#### D_INTERVAL_PROPERTY

This table is currently underutilized and will be re-evaluated in the next version of the database.

#### D_INTERVAL_REF_ELEV

Water levels measured in a well are generally taken either from the 'Top of Pipe' (or reference point) or from ground surface.  In order to convert recorded water level depths to elevations, the elevation of this 'reference' point is recorded in this table.  Each REF_ELEV (reference elevation) value has a start and end date tied to it, bracketing the period at which any particular elevation is applied.  Multiple elevations resulting from, for example, damage to the monitoring pipe that modify the reference elevation are recorded in this way.  For locations where no reference elevation has been recorded, a default 0.75m stick-up is assumed and the ASSIGNED_ELEV from D_LOCATION_ELEV is used as a ground level (this information is stored in the REF_COMMENT field and is generally of the form 'ASSIGNED_ELEV + 0.75m').  A new field, REF_STICK_UP, is used to store the height of the reference point (above the ground surface) in meters.  New SiteFX fields (REF_OFFSET, REF_OFFSET_OUOM and REF_OFFSET_UNIT_OUOM) now perform the same function.  All the numeric values previously held (as a temporary measure) in REF_POINT have been copied into REF_STICK_UP.

In the case that no valid date exists in REF_ELEV_START_DATE for a particular interval, the default non-null value '1867-07-01' will be assumed (as a marker) - a valid date must exist for comparison purposes.

#### D_INTERVAL_SOIL

The top and bottom elevations (converted, generally, from depths) from which a soil sample is taken are recorded here, allowing temporal data to be associated with the sample (including laboratory and other physical/field measurements).  The table also directly houses three specific soil related measurements: the actual blow count necessary for penetrating a 6-inch depth when split-spoon sampling; the recovery percentage; and the estimated moisture percentage.  Note that each of these are 'field' measurements.

For those soil intervals without a top- or bottom-depth (one of, not both), an assumed 0.1m depth is assigned.  An appropriate comment is also included in SOIL_COMMENT.

#### D_INTERVAL_TEMPORAL_\* Tables

The volume of temporal data increases rapidly in comparison with the location data.  As such (especially with regard to D_INTERVAL_TEMPORAL_2), accessing these tables can be slow in comparison with other D_* tables.  Through the use of indexing (and etc...) efforts have been made to optimize these tables to reduce access times.  The use of D_INTERVAL_TEMPORAL_3 (previously unused) has now been implemented.

#### D_INTERVAL_TEMPORAL_1A and D_INTERVAL_TEMPORAL_1B

These tables record the results from samples that have been taken from a specific interval (usually a well screen) and sent to a laboratory for analyses.  Laboratory (e.g. Lab ID, Lab sample #, etc.) and sample information (sample date, sample type - water vs soil, etc?) are recorded in table '1A' and the results of the sample analysis (individual parameters such as Mg, Na, etc.) are recorded in table '1B'.  The testing of one sample for many parameters (e.g. testing for Fe, Ca, Mg, etc...) results in multiple records (one row for each parameter) in '1B' but only a single record (one row for the sample) in '1A'.  Parameter names/codes are listed in the R_RD_NAME_CODE table.

Note that a particular parameter may have multiple real-world names associated with it due to different laboratory reporting terms (e.g. Zinc (total); Zinc as Zn; Zn; Zinc by ICPMS; Zinc (ICPMS)); the R_RD_NAME_CODE table should have only one of these names available, the one most commonly used (or chosen as most applicable by the ORMGP).  The R_READING_NAME_ALIAS table contains those additional names tagged to a particular value RD_NAME_CODE - on import into the database, these 'aliases' are converted to the appropriate (single) reading name code.

#### D_INTERVAL_TEMPORAL_2

This table records any 'field' data for a particular interval for a particular date.  For these measurements there is no need to track a sample or laboratory, therefore the data need only be added to one table.  This results in one parameter per record/row.  Water levels (both logger and manual) and stream flow data would be prime examples of information stored herein. However, the table also holds some field measured pH, conductivity and other similar data.  Parameter names are listed in the R_RD_NAME_CODE table.  Additional information (where available) regarding the instrumentation used for collecting the particular value can be recorded in RD_TYPE_CODE - refer to the R_RD_TYPE_CODE look-up table for available types.

Refer to the above discussion (under D_INTERVAL_TEMPORAL_1A) with regard to the reading name codes (RD_NAME_CODE) and the use of aliases in the database.

#### D_INTERVAL_TEMPORAL_3

A similar description applies here as to that of D_INTERVAL_TEMPORAL_2.  However, as of 'Database Version 6', this table contains information available from climate stations (which previously resided in the second temporal table).

#### D_INTERVAL_TEMPORAL_5

A similar description applies here as to that of D_INTERVAL_TEMPORAL_2.  However, as of 'Database Version 6', this table contains information available from surface water stations (which previously resided in the second temporal table).

#### D_LOCATION

A location is a natural, constructed or artificial (i.e. a place-holder) object and is the primary means of representing real-world entities (e.g. a borehole, climate station, surface water gauge, documents, etc...) within the database.  Refer to R_LOC_TYPE_CODE for a list of available location types.  D_LOCATION should be considered the central table in all database queries by users where information is being sought on an object-by-object basis.

Locations should never be deleted from the database (an exception would be in the case of duplicates); for those locations that cease to be in operation, its status would be changed from active to either inactive, decommissioned, abandoned or archived (as appropriate).

The key fields found within this table relate to two main features of a location:

* Naming; there are five naming fields available in this table - LOC_NAME, LOC_NAME_ALT1, LOC_NAME _ALT2, LOC_ORIGINAL NAME, LOC_NAME_MAP
* Spatial location (LOC_COORD_EASTING, LOC_COORD_NORTHING); all locations are re-projected (if necessary) to NAD83, UTM Zone 17 (the original coordinates are stored in the equivalent '_OUOM' fields); a coordinate tracking system has been implemented within the table D_LOCATION_COORD_HIST
*
* more minor attributes of a Location that are stored in this table include:
* the Lot and Concession (mainly from the MOE) 
* Ownership information (for owners of many wells; e.g. York Region);
* Location status (e.g. active, decommissioned, in-active, etc.)
* Address and Contact info
* Confidentiality code (not currently used but established to assist in screening locations that are not to be widely circulated (set by partner agencies)
*
*ding the naming of locations, the following general guidelines are provided: 
*
* LOC_NAME is intended to be relatively short for easy display purposes
* LOC_NAME_ALT1 is intended to convey information about consultants, geography and/or location ownership
* LOC_ORIGINAL_NAME is primarily used for the MOE identification number or as the original name of the well (also found in D_LOCATION_ALIAS); where the well is not a part of the MOE database, the original name can reflect the name assigned by the consultant/owner at the time of drilling; in some cases, this identifier is currently the same as the LOC_NAME
* LOC_NAME_ALT2 - this field is currently not used to any great extent; in the future we could add in the MOE's Tag Number or Audit Number (these are both currently found in the D_LOCATION_ALIAS table)
* LOC_NAME_MAP - this name is limited to 6 characters and is designed to show a very localized name that would show up easily when posted in a map 

When assigning a name to a new location, the user should think about key features of the name that might be used by someone in the future if they were querying to see if the location is in the database.  Due to the high incidence of duplicates over the past few years the naming of key wells has become much more explicit so that the chances of someone re-entering a well are minimized.

Additional details regarding naming conventions are outlined in Section 3.3.1.

One method of associating locations is through the LOC_MASTER_ID field.  If the LOC_ID and LOC_MASTER_ID fields are equivalent, it indicates that no other locations have been linked (or are associated) to this one.  Alternatively, if the LOC_MASTER_ID differs from the LOC_ID, it indicates an association between locations.  In such a case the LOC_MASTER_ID would be set as the LOC_ID from the 'master' location.  An example of its use is the tracking of MOE WWDB nested wells.  Also, updated surface water stations are linked to their old/original locations in this manner.

Through the D_GROUP_LOCATION table, locations can also be grouped into families to reflect (for example) nested monitoring wells or an amalgamation of locations (such as a pump house).

#### D_LOCATION_ACTIVITY

This table is, currently, not actively used and will be re-evaluated in the next version of the database.

The original intent of the table was to track significant changes occurring within the database.  'S_' system tables have now replaced the need for this table's functionality.

#### D_LOCATION_ALIAS

Where additional names (beyond the number currently available in D_LOCATION table) are required (or known) for a particular location, these names are stored here, tagged by their LOC_ID.  For the more recently drilled MOE wells, the Audit Number and the Tag Number are stored in this table.  As of 'Database Version 6', the MOE 'Well_ID' and 'Bore_Hole_ID' are stored here as well.

SiteFX looks at this table (as well) when searching for a specified location name.

#### D_LOCATION_COORD_HIST

This table tracks changes in the coordinates for a particular location.  All coordinates that have been assigned/used by a location should be stored here; the current coordinates (as found in D_LOCATION) will be tagged with a value of '1' in CURRENT_COORD (all others will be NULL).  The QA_COORD_CONFIDENCE_CODE is also tracked here (i.e. one for each coordinate record).

The X_UTMZ17NAD83 and Y_UTMZ17NAD83 fields are the default coordinates for the program and should match LOC_COORD_EASTING and LOC_COORD_NORTHING (respectively) in D_LOCATION (i.e. they are all UTM Zone 17, NAD83 datum coordinates).  Their equivalent latitude and longitude values (also with a datum of NAD83) are also stored here (and accessed by applications whose default coordinates are latitude/longitude).  The LOC_COORD_OUOM_CODE will only be populated if the value was/is present in D_LOCATION.

In addition, the LOC_ELEV_ID field can be used to reference a particular elevation (as found in D_LOCATION_ELEV_HIST) with a particular coordinate.

Details concerning the coordinate source and method(s) are found in R_LOC_COORD_HIST_CODE (by LOC_COORD_HIST_CODE) supplemented by comments in COORD_HIST_LOC_METHOD and COORD_HIST_LOC_COMMENT.

#### D_LOCATION_ELEV

***The use of this table has been replaced by D_LOCATION_SPATIAL***

This table is used to address the issue of the handling of multiple elevations for any given location (previously, elevations were stored in multiple tables by location type; e.g. climate stations, surface water stations, etc...)  The most up-to-date/reliable elevation for each location is found, here, in the ASSIGNED_ELEV field.  Multiple elevations have been recorded over time for any particular location.  As such, a particular logic is used when populating the ASSIGNED_ELEV field, in order of:

1. If a survey has been carried out at the location, the value in SURVEYED_ELEV is used (refer also to D_LOCATION_QA)
2. If the location lies within the ORMGP study area, the DEM_MNR_10m_v2 value is used (Ministry of Natural Resources, 10m resolution DEM, version 2)
3. If the location lies outside the ORMGP study area, the coarser DEM_SRTM_90m_v41 value is used (Shuttle Radar Topography Mission, 90m resolution DEM, version 4.1)
4. As of 'Database Version 6', only those locations with a QA_ELEV_CONFIDENCE_CODE of '1' will be considered a surveyed elevation; this has not been applied retroactively

Each of these (as well as any original or other elevation; this includes historical EarthFX specific elevations) is tracked in the D_LOCATION_ELEV_HIST table; the actual value is referenced using the LOC_ELEV_ID.  In the case of MOE wells, the MOE assigned elevation is stored as the 'original' elevation.

It is important to note that SiteFX does not access this table directly.  Instead, elevation values in BH_GND_ELEV from D_BOREHOLE are used for calculation of elevations/depths.  Currently there is a routine check to ensure that the two values match (ASSIGNED_ELEV and BH_GND_ELEV) for any particular location.

#### D_LOCATION_ELEV_HIST

***The use of this table has been replaced by D_LOCATION_SPATIAL_HIST***

This table holds all elevations associated with a specific location - each elevation will be tied to a particular source, as found in R_LOC_ELEV_CODE.  Refer to D_LOCATION_ELEV, above, for additional details.  Note that the QA_ELEV_CONFIDENCE_CODE is tracked here for 'each' elevation value.

#### D_LOCATION_GEOM

This table holds the spatial geometry of each location using both the Microsoft SQL Server geometry type (GEOM) as well as the 'Well-Known-Binary' format (GEOM_WKB).  Not all external software supports both formats.  These are calculated from the coordinates in D_LOCATION and are assigned the 'UTM Z17 NAD93' projection (EPSG code 26917).  For tracking of changes in the coordinate values (in D_LOCATION), the COORD_CHECK field is incremented (initially from a NULL value to '1') whenever the calculated geometry differs from that stored in this table.  This acts as a tag to indicate that the location should be checked.

#### D_LOCATION_PURPOSE

This table records the primary and secondary purpose codes for each location.  The available codes are an amalgamation of those from the original MOE Water Well database, but they have been supplemented, largely (but not exclusively) from the purposes used to track MOE issued Water Taking Permits (refer to R_PURPOSE_PRIMARY and R_PURPOSE_SECONDARY for details).  Note that, for the MOE wells, many of the purpose classifications were based upon the original well owner's name (e.g. wells drilled for a church could reasonably accurately be coded with a PURPOSE_PRIMARY_CODE of '1' - 'Water Supply' and a SECONDARY_PURPOSE_CODE of '53' - 'Church').  With the removal of this information after 2006 (due to privacy concerns), this coding ability has been lost and therefore, the purpose codes for more recently incorporated wells less accurately reflect their purpose.

Note that the MOE still maintains a mix of purpose and status in the 'Status Field' within their database (e.g. Water Supply, Observation Wells, Abandoned-Supply, etc...).  This MOE code is currently stored in the BH_STATUS field of the D_BOREHOLE table.  The MOE also maintains the USE_1ST and USE_2ND fields, which are stored in the equivalent LOC_MOE_USE_1ST and LOC_MOE_USE_2ND fields in the D_LOCATION table (in the ORMGP database).  These fields are now used to translate a code into the LOC_PURPOSE table for the newly imported MOE wells (refer to Appendix G for the methodology). 

#### D_LOCATION_QA

This table provides two major fields for tracking uncertainty, both of which originated with the MOE water well record database:
    - the QA_COORD_CONFIDENCE_CODE tracks errors associated with the coordinates (e.g. horizontal error); refer to R_QA_COORD_CONFIDENCE_CODE for error values
    - the QA_ELEV_CONFIDENCE_CODE tracks errors associated with the elevation (e.g. vertical error); refer to R_QA_ELEV_CONFIDENCE_CODE for error values

Within the ORMGP database the functionality of the QA_ELEV_CONFIDENCE CODE has been redesigned to simply record whether a particular location has had its elevation accurately surveyed or a DEM value assigned.  A QA_ELEV_CONFIDENCE_CODE of '1' indicates that the location has been surveyed and a DEM elevation will not be assigned (note that the QA_ELEV_SOURCE, QA_ELEV_METHOD and QA_ELEV_COMMENT fields can be used to store information regarding the type of survey undertaken).  All other locations are regularly assigned an elevation from the most up-to-date DEM surface as supplied via the MNR (see D_LOCATION_ELEV and D_LOCATION_ELEV_HIST, above, for details).  Any legacy QA_ELEV_CONFIDENCE CODES (i.e. those greater than 1 with the exception of the DEM codes) found in the table no longer serve any practical function.

As a general rule a QA_COORD_CONFIDENCE_CODE value of '5' or less (i.e. equivalent to a maximum tolerance of 300 m or less horizontal error) is used to separate 'good' locations from 'erroneous' locations.  The QA codes are included in all of the views (i.e. built-in queries) within the database so that the user can specify or define their own QA acceptability when querying the database.

In the case of reassignment of the original MOE (assigned) coordinate confidence code (i.e. through re-evaluation of the location), the original MOE value will be stored in QA_COORD_CONFIDENCE_CODE_ORIG and the value then replaced (by the updated value) in QA_COORD_CONFIDENCE_CODE.  In particular, this has been used where the coordinates are obviously wrong and have been assigned a new code of '117' (i.e. 'Outside of Ontario or Invalid').

Two fields, the QA_PUMPING_CODE, and QA_WL_STATIC are currently under evaluation and contents should be ignored.  The QA_DATA_SOURCE_CODE reflects the MOE coding of the location (well) source (typically the code for MOE wells is '1', 'from Driller'); refer to the R_LOC_DATA_SOURCE_CODE for possible codes.  This field has not been populated for any of the non-MOE wells in the database.

Note that all Locations in the D_LOCATION table should have an associated record in this table.

#### D_LOCATION_QC

Records are added to this table in order to track checks or changes to locations (and associated intervals) within the database.  This is used to prevent unnecessary re-examination of data for possibly problematic data for locations that have already been checked or corrected.  The marked check/correction can be table-general (e.g. pumptest and pumping rates) through table-field specific (e.g. screen top and bottom depths).  This is indicated by the CHECK_CODE (indicating the actual check performed) and CHECK_PROCESS_CODE (indicating the success or failure, in various ways, of the check or correction).  These are referenced through R_CHECK_CODE and R_CHECK_PROCESS_CODE.  Note that there will (likely) be multiple records per location as each could describe a separate check undertaken (and possibly at another date, as indicated by PROCESS_DATE).  The INT_ID should only be populated when the check is performed against an interval (linked to a location).  An additional COMMENT can be included to more fully describe the information being evaluated.

#### D_LOCATION_SUMMARY

This table stores weekly-calculated or -updated information for each location in D_LOCATION; the main purpose of which is to speed up various general views available to users of the database (instead of calculating these values on-the-fly).  Some of the data here, normally tied to intervals, is summarized for all intervals found at the particular location.

#### D_LOCATION_VULNERABILITY

This is a legacy table from an exercise carried out in 2003 for the MOE to delineate areas on the Oak Ridges Moraine that were potentially vulnerable to contamination.  The values (0, 1, or 2) in the 'AVI_Feb2003_Final 3tier' field are directly tied to a Low/Med/High vulnerability based on the 2003 procedure as agreed to by the MOE at the time.  These values directly correlate to and are reflected in the vulnerability map that constitutes part of the ORM Conservation.  This table should be reevaluated in a future version of the database.

#### D_LOGGER_CALIBRATION_READINGS

This table is required by and is populated through SiteFX.  This table is used for the import of logger data.  Further details ???

#### D_LOGGER_CORRECTION

This table is required by and is populated through SiteFX.  This table is used for the import of logger data and identifies when logger data has been adjusted by a fixed amount to match a manual measurement.   Further details ???

#### D_LOGGER_INVENTORY

This table is required by and is populated through SiteFX.  This table is used for the import of logger data.  Further details ??? 

#### D_LOGGER_NAME

This table is required by and is populated through SiteFX.  This table is used for the import of logger data and tracks the name of loggers and the interval that they are associated with.  

#### D_OWNER

This table was created prior to the MOE removing the OWN_NAME from their database for concerns of privacy.  At the time, the table was meant to provide a useful searching and/or grouping tool particularly for Municipal and Conservation Authority wells, but it also allowed wells drilled by larger companies (e.g. development companies) or other organizations (e.g. Ontario Hydro) to be grouped together.   The owners listed here are linked to D_LOCATION through OWN_ID.  With the onset of the D_GROUP_LOCATION table the need for the D_OWNER table has diminished and the role this table plays in future versions of the database will be re-evaluated.

#### D_PICK

This table was previously referenced as PICKS.  The table contains the FORMATION name (e.g. 'Top of Thorncliffe Fm') and the elevation of the pick (TOP_ELEV) as well as the user who made the pick (SYS_USER_STAMP) and the time (SYS_TIME_STAMP) at which it was made.    The current ground elevation (GND_ELEV) for the location is also stored.  The field GEOL_UNIT_CODE is currently non-populated - in the future this should be used as an alternate to the text field FORMATION.  The SESSIONNUM field is mainly historical, originally used to identify distinct sessions when incorporating pick information from multiple Microsoft Access databases. 

Each pick row is linked to D_LOCATION via its LOC_ID.

#### D_PICK_EXTERNAL

Similar to D_PICK, the records in this table contain formation information (using both the FORMATION and GEOL_UNIT_CODE fields) tied to a specific coordinate (x,y) location as well as an elevation (z).  These do not correspond, however, to the database location schema but are instead self-referencing where all information concerning a record occurs either within this table or within the linked data source (through DATA_ID which must be populated).  This includes the various quality assurance information (normally found in D_LOCATION_QA) as well as supplementary elevation information (as found in D_LOCATION_SPATIAL_HIST).  In particular, the latter should reference the particular ground surface elevation (usually a DEM) used as a reference base while the RD_VALUE_OUOM should be populated using the depth of the 'pick'.  This latter value can be calculated if the original value was an elevation.

The date of the source (or the source data) should be included in the PDATE field (which should match Z_DATE unless this was calculated using a difference source).  The default mode is a single record equated to a single 'pick'.  In the case where a polyline (or polygon) was used to to capture coordinate information and its original form is important with regard to its inclusion within the database, the PGROUP field can be used to 'name' the associated records and their order can be specified within the PORDER field.  In most cases these fields will not be populated.

This table was first used to capture outcrop locations (and their elevation) from the Gao et al (2006) dataset.

#### D_PROJECT_LOCATION

Currently empty.  This table is part of the structure for a future release of SiteFX (version 6; some support in version 5) and is to be used to control access (by partner agencies) to locations within their areal extent.  This is part of the replacement for the original D_LOCATION_AGENCY table and relates to D_LOCATION using LOC_ID.

#### D_PROJECT_USER_GROUP

Currently empty.  This table is part of the structure for a future release of SiteFX (version 6; some support in version 5) and is to be used to control access (by partner agencies) to locations within their areal extent.  This is part of the replacement for the original D_LOCATION_AGENCY table and relates to R_PROJECT_TIER2_CODE using PRJ_TIER2_CODE.

#### D_PTTW

This table incorporates information from the 'Permit to Take Water' spreadsheet available through the MOE.  The methodology for doing so is described in Appendix G.  Note that when possible, the particular permit (a location type) has been linked to a source location (e.g. a well) through the LOC_MASTER_LOC_ID in D_LOCATION.

The interpreted source type (PTTW_SOURCEID_CODE) and water type (PTTW_WATER_SOURCE_CODE; either, or both, of ground or surface water) is identified.

#### D_PTTW_RELATED

This table specifically links all permits tied together through subsequent permit numbers (PTTW_PERMIT_NUMBER in D_PTTW; e.g. renewed permits) as indicated by a PTTW_PERMIT_NUMBER having a PTTW_AMENDED_BY or PTTW_EXPIRED_BY in D_PTTW (where these new permits could, again, have been expired or amended; this is considered a left-to-right relationship).  The INVERSE_RELATED field (a true/false field) indicates where a PTTW_PERMIT_NUMBER is referenced by either PTTW_AMENDED_BY or PTTW_EXPIRED_BY (a right-to-left relationship; i.e. the inverse of the previous) only. 

#### D_PTTW_RELATED_SRC

This table has been implemented as an alternative to the general relation
between a PTTW record and a location based upon the LOC_MASTER_LOC_ID of the
former.  Here, they are directly tracked using LOC_ID and LOC_ID_SRC; the
latter will indicate the location of the water source.  In some cases, a
single permit may reference more than a single source.

#### D_PUMPTEST

Most of the information in the table comes from the MOE database and contains the date and time of the pump test and the driller's recommended pump rates and depths deduced from the test properties of the overall pump test.  Note that the actual pumping values (and times) are found in the D_INTERVAL_TEMPORAL_2 table.  

#### D_PUMPTEST_STEP

This table lists the pump rate (and units) of each step for each pump test (along with the duration).  Note that all pumping values (and times) are found in the D_INTERVAL_TEMPORAL_2 table.  

#### D_SITE

This table is required by SiteFX and allows locations to be linked to a particular site or project.  This table contains a single record - indicative of the ORMGP 'site' (a value of '1') - this links to the SITE_ID column in D_LOCATION (which must be populated).

#### D_SURFACEWATER

Contains some minor information (e.g. drainage, elevation, and coordinates)
concerning surface water stations including HYDAT and spot-flow locations.
Surface water subtypes are indicated by the SW_SUBTYPE_CODE (linked to
R_SW_SUBTYPE_CODE).

#### D_VERSION

This table is required by SiteFX and contains the 'Database_Version', used internally by that program.

#### D_VERSION_CURRENT

This table contains the current primary and secondary versions (i.e. the dated version) of the database.  The single row, here, is accessed when distributing a subset of the database to specify the PRIMARY_VERSION and SECONDARY_VERSION (as well as the CUT_VERSION which is populated in the output database) within the distributed database itself.

The VERSION_COMMENT should be updated whenever the SECONDARY_VERSION is changed (it should provide an explanation for the change).  These changes should also be captured in the database timeline as found in Appendix E.

#### D_VERSION_STATUS

This table captures the 'status' of the database at various stages, tied to the 'Dated Version' (both primary and secondary).  This includes the number of records for each available location type, each available interval type and each available reading group code type.

## Section 2.1.2 Look-Up/Reference Tables (R_\*)

Prefixed with an 'R_', these tables are populated with data that is used to code information within the 'D_' data tables (listed above).  Only those used by the ORMGP are included.  These are:

* R_ACTIVITY_CODE
* R_ADVERSE_COMMENT_CODE
* R_ADVERSE_TYPE_CODE
* R_BH_DRILL_METHOD_CODE
* R_BH_DRILLER_CODE
* R_BH_STATUS_CODE
* R_CHECK_CODE
* R_CHECK_PROCESS_CODE
* R_CHECK_TYPE_CODE
* R_CON_SUBTYPE_CODE
* R_CON_TYPE_CODE
* R_CONFIDENTIALITY_CODE
* R_CONFIGURATION_CODE
* R_CONV_CLASS_CODE
* R_CRIT_GROUP_CODE
* R_CRIT_TYPE_CODE
* R_DOC_AUTHOR_AGENCY_CODE
* R_DOC_CLIENT_AGENCY_CODE
* R_DOC_FORMAT_CODE
* R_DOC_JOURNAL_CODE
* R_DOC_LANGUAGE_CODE
* R_DOC_LOCATION_CODE
* R_DOC_TOPIC_CODE
* R_DOC_TYPE_CODE
* R_EQ_GROUP_CODE
* R_EQ_TYPE_CODE
* R_FEATURE_CODE
* R_FORM_MODEL_CODE
* R_GEOL_CLASS_CODE
* R_GEOL_CONSISTENCY_CODE
* R_GEOL_LAYERTYPE_CODE
* R_GEOL_MAT1_CODE
* R_GEOL_MAT2_CODE
* R_GEOL_MAT3_CODE
* R_GEOL_MAT4_CODE
* R_GEOL_MAT_COLOUR_CODE
* R_GEOL_MAT_GSC_CODE
* R_GEOL_MOISTURE_CODE
* R_GEOL_ORGANIC_CODE
* R_GEOL_SUBCLASS_CODE
* R_GEOL_TEXTURE_CODE
* R_GEOL_UNIT_CODE
* R_GROUP_INT_CODE
* R_GROUP_INT_TYPE_CODE
* R_GROUP_LOC_CODE
* R_GROUP_LOC_TYPE_CODE
* R_GROUP_READING_CODE
* R_GROUP_READING_TYPE_CODE
* R_INT_ALIAS_TYPE_CODE
* R_INT_REGULATORY_CODE
* R_INT_SAMPLE_MATRIX_DESC
* R_INT_SAMPLE_TYPE_DESC
* R_INT_SAMPLE_USER_FILTER_DESC
* R_INT_TYPE_CODE
* R_LI_BATTERY_CODE
* R_LMD_STATUS_CODE
* R_LMD_TYPE_CODE
* R_LMD_TYPE_CODE_ATTRIBUTE
* R_LOC_ALIAS_TYPE_CODE
* R_LOC_COORD_CODE
* R_LOC_COORD_HIST_CODE
* R_LOC_COORD_OUOM_ALIAS
* R_LOC_COORD_OUOM_CODE
* R_LOC_CORR_WATER_CODE
* R_LOC_COUNTY_CODE
* R_LOC_DATA_SOURCE_CODE
* R_LOC_ELEV_CODE
* R_LOC_INFO_CODE
* R_LOC_INFO_GROUP_CODE
* R_LOC_INFO_TYPE_CODE
* R_LOC_MOE_USE_PRIMARY_CODE
* R_LOC_MOE_USE_SECONDARY_CODE
* R_LOC_STATUS_CODE
* R_LOC_TIER1_CODE
* R_LOC_TIER2_CODE
* R_LOC_TIER3_CODE
* R_LOC_TOWNSHIP_CODE
* R_LOC_TYPE_CODE
* R_LOC_WATERSHED1_CODE
* R_LOC_WATERSHED2_CODE
* R_LOC_WATERSHED3_CODE
* R_LOGGER_TYPE_CODE
* R_LOGGER_TYPE_READING
* R_LSR_TYPE_CODE
* R_LSR_TYPE_READING
* R_OWN_TYPE_CODE
* R_PROJECT_AGENCY_CODE
* R_PROJECT_TIER1_CODE
* R_PROJECT_TIER2_CODE
* R_PROJECT_TYPE_CODE
* R_PTTW_SOURCEID_CODE
* R_PTTW_WATER_SOURCE_CODE
* R_PUMPTEST_METHOD_CODE
* R_PUMPTEST_TYPE_CODE
* R_PURPOSE_PRIMARY_CODE
* R_PURPOSE_SECONDARY_CODE
* R_QA_COORD_CONFIDENCE_CODE
* R_QA_ELEV_CONFIDENCE_CODE
* R_RD_FILTER_CODE
* R_RD_LOOKUP_CODE
* R_RD_NAME_CODE
* R_RD_NAME_LOOKUP
* R_RD_TYPE_CODE
* R_READING_GROUP_CODE
* R_READING_NAME_ALIAS
* R_REC_STATUS_CODE
* R_SAM_TYPE_CODE
* R_SAM_TYPE_KEYWORD
* R_SW_SUBTYPE_CODE
* R_SYS_GROUP_SEARCH_CODE
* R_SYS_GROUP_TYPE_CODE
* R_SYS_INT_DETAIL_CODE
* R_SYS_REF_TYPE_CODE
* R_SYS_VALUE_QUALIFIER
* R_UNIT_CODE
* R_UNIT_CONV
* R_USER_CODE
* R_USER_GROUP_CODE
* R_USER_GROUP_TYPE_CODE
* R_WATER_CLARITY_CODE
* R_WQ_STANDARD
* R_WQ_STANDARD_SOURCE
* S_CONSTANT
* S_DESC_FIELD
* S_DESC_TABLE
* S_DESC_VIEW

#### R_ACTVITY_CODE

The table is required by SiteFX and links to the D_LOCATION_ACTIVITY table.  It is presently not effectively used within the database.

#### R_BH_DRILL_METHOD_CODE

This table lists various drilling methods.  This is related through BH_DRILL_METHOD_CODE in the D_BOREHOLE table.

R_BH_DRILLER_CODE

Identifies the driller (or drilling company) of a particular borehole.  This is related through BH_DRILLER_CODE in the D_BOREHOLE table.  The codes are directly from the MOE database and, as much as possible, the BH_DRILLER_DESCRIPTION_LONG has been populated so that the MOE codes are related to a particular drilling company.  The BH_DRILLER_QA_CODE is largely unpopulated but does provide an opportunity to screen well locations based on the quality of the well driller (There should be an explanation for this ???).

R_BH_STATUS_CODE

This table was adapted from the original MOE database codes and is related through BH_STATUS_CODE in the D_BOREHOLE table.  The codes are a mix of well use and status and are generally not used directly within the database.  As appropriate, the code has been translated to either the LOC_STATUS code in the D_LOCATION table or to the PURPOSE_PRIMARY_CODE and/or PURPOSE_SECONDARY_CODE in the D_LOCATION_PURPOSE table.

R_CHECK_CODE

Each record here indicates a specific check that can be performed against a location or interval.  This is related to a combination of a table and/or particular field within that table.  The type of check made (e.g. any of depth or elevation, missing values, etc ?) is determined by its CHECK_TYPE_CODE (as found in R_CHECK_TYPE_CODE).

R_CHECK_PROCESS_CODE

The final result of the check is indicated here.  This can include whether the check validated the current information or that the information needed to be modified.  The inability to locate source data can also be indicated (allowing for a later check of affected locations in the instance, for example of missing MOE PDF's).

R_CHECK_TYPE_CODE

The specific type of check made is indicated here.  This can be one of elevations, depths, missing values, units, etc ?  This table is reference through R_CHECK_CODE.

R_CON_SUBTYPE_CODE

Related through CON_SUBTYPE_CODE to the D_BOREHOLE_CONSTRUCTION table, this table contains descriptions for borehole casings, seals and sandpacks. 

R_CON_TYPE_CODE

Related through CON_TYPE_CODE to the R_CON_SUBTYPE_CODE table (as the construction types - i.e. the CON_TYPE's -  are generally repeated within the construction subtype - i.e. the CON_SUBTYPE's -  descriptions, they are not directly related to any data table).

R_CONFIDENTIALITY_CODE

Allows tagging of individual locations and/or intervals as confidential to a particular partner (but could be expanded beyond partner agencies if needed).  Currently the partner agencies have not made use of the confidentiality coding within the database.  If a specific location is flagged with a confidentiality code then no information will be distributed regarding the location.  Where a particular interval is flagged, information at the location/borehole level will be made available (e.g. name, geology, etc.), but no information related to the interval (e.g. screen details, chemistry or water level data, etc...) would be distributed.  Such information would not be made available through the consultant V_CON_* views.

This is related through CONFIDENTIALITY_CODE in the D_LOCATION and D_INTERVAL tables.

R_CONV_CLASS_CODE

These codes are used internally within SiteFX to specify conversion details (for example, with regard to calculation of elevations from depths).  This is related through CONV_CLASS_CODE in D_INTERVAL and R_UNIT_CONV.

R_CRIT_GROUP_CODE

Originally established to provide a means of comparing, within SiteFX, chemistry data held in the database to a specified, published criteria (e.g. compare this sample to the Ontario Drinking Water Standards).  The table is not currently used in the database (and is only partially populated) but is required by SiteFX.

R_CRIT_TYPE_CODE

Originally established to provide a means of comparing, within SiteFX, chemistry data held in the database to a specified, published criteria (e.g. compare this sample to the Ontario Drinking Water Standards).  The table is not currently used in the database (and is only partially populated) but is required by SiteFX.

R_DOC_AUTHOR_AGENCY_CODE

Author agencies (as found in DOC_AUTHOR_AGENCY_DESCRIPTION) are the employer or associated agency of the author (as specified through DOC_AUTHOR in D_DOCUMENT).  Related through DOC_AUTHOR_AGENCY_CODE in D_DOCUMENT (note that to account for multiple authors for a document, and therefore multiple author agencies, the D_DOCUMENT table has two available fields containing author agency code details and a third allowing a free-form text description).  In some instances an author may not be associated with any particular agency and this field, in D_DOCUMENT, would remain blank.

R_DOC_CLIENT_AGENCY_CODE

Client agencies (as found in DOC_CLIENT_AGENCY_DESCRIPTION) reflect the agency for which particular document in the library has been prepared (e.g. a water supply study undertaken for the community of 'Ballantrae' would have 'York Region' as the client agency).  Related through DOC_CLIENT_AGENCY_CODE in D_DOCUMENT (note that the D_DOCUMENT table has a single available field for client agency code details and a second field allowing a free-form text description for those cases where a document has been prepared for more than one client agency).

R_DOC_FORMAT_CODE

The table is used to reflect whether a hard copy of a particular document is available at the ORMGP office.  The DOC_FORMAT_DESCRIPTION is generally limited to one (or both) of 'Electronic' or 'Hard Copy'.  Note that all reports listed in D_DOCUMENT should be available as digital files in the ORMGP report library (refer to Section 2.6).  As most documents are made available in digital form only, the 'Hard Copy' availability will eventually become invalid.

R_DOC_JOURNAL_CODE

Source journal names for papers present in the report library.  This is related through DOC_JOURNAL_CODE in D_DOCUMENT.

R_DOC_LOCATION_CODE

This table is used mostly to flag: 

    - Documents that are located outside of the ORMGP study area and therefore have no (valid, local) UTM coordinates (e.g. a report on Ohio tills would be flagged as 'USA' or 'Ohio' in this field)
    - Documents that cover a broad region within the ORMGP study area (e.g. a report that covered groundwater within the Region of Peel would be flagged as DOC_LOCATION_CODE '3' ('Regional') even though the document would be assigned coordinates in the centroid of Peel Region.

These codes (as described in DOC_LOCATION) allow further details regarding the location and/or spatial extent covered by the document and should be used as supporting information when performing a report library search based upon location.  Note that the use of this table (and associated field) is optional when valid coordinates are available.  This is related through DOC_LOCATION_CODE in D_DOCUMENT.

R_DOC_TOPIC_CODE

Topics attributed to a particular report.  This is related through DOC_TOPIC_CODE in D_DOCUMENT (note that D_DOCUMENT has three available fields to capture topic details).

R_DOC_TYPE_CODE

The original type of the document or report (e.g. Consultant Report, USGS Report, Journal Paper, etc...).  This is related through DOC_TYPE_CODE in D_DOCUMENT.

R_EQ_GROUP_CODE

This table was established to track equipment that might be used at any location and is required by SiteFX.  The table is not currently used and the table will be re-evaluated in the next version of the database.

R_EQ_TYPE_CODE

This table was established to track equipment that might be used at any location and is required by SiteFX.  The table is not currently used and the table will be re-evaluated in the next version of the database.

R_FEATURE_CODE

The information contained here were adapted from the original MOE database codes describing the type of 'Water Found' (e.g. fresh, mineralized, iron, etc.).  This is related through FEATURE_CODE in D_GEOLOGY_FEATURE.

R_FORM_ASSIGN_CODE

The codes here relate to data found in the D_INTERVAL_FORMATION_ASSIGNMENT (DIFA) table detailing, namely, the attributes that each interval can have with regard to a particular geologic model (see R_FORM_MODEL_CODE).  

R_FORM_MODEL_CODE

The codes here relate to data found in the D_INTERVAL_FORM_ASSIGN (DIFA) table.  Any number of geologic or hydrogeologic models can be specified.  Note that the specialty model, 'YPDT-CAMC Final' is no longer used (it was used to indicate the interpreted geologic unit that should be assigned to a particular interval; this was part of a previously defined methodology for populating DIFA).  Refer to R_GEOL_UNIT_CODE and DIFA for details.

R_GEOL_CLASS_CODE

This table specifies the type of classification code available to the geologic subclasses - the latter allow different geological interpretations to be stored for the same geologic layer.  Only two options are available - either a 'lithologic' layer or a geologic 'pick'.  This is related through GEOL_CLASS_CODE in R_GEOL_SUBCLASS_CODE.

R_GEOL_CONSISTENCY_CODE

The table is used to track the standard geotechnical consistency codes for each sample/layer encountered in a borehole (e.g. compact, firm, dense, soft, stiff, etc?).  Data is generally only provided for the geotechnical boreholes in the database (either City of Toronto, UGAIS, or other consultant boreholes; refer to Appendix D).  This is related through GEOL_CONSISTENCY_CODE in D_GEOLOGY_LAYER.

R_GEOL_MAT_COLOUR_CODE

These codes are adapted from the original MOE database codes, assigning a colour to a geologic layer.  This is related through GEOL_MAT_COLOUR_CODE in D_GEOLOGY_LAYER.

R_GEOL_MAT_GSC_CODE

The codes used by the GSC as interpreted from the original MOE material codes.  This is related through GEOL_MAT_GSC_CODE in D_GEOLOGY_LAYER (note that the latter has been only incompletely populated).

R_GEOL_MAT1_CODE (Includes MAT2, MAT3 and MAT4 descriptions)

These are the available descriptions (found in GEOL_MAT1_DESCRIPTION) for geologic layers.  Note that there are four tables of these descriptions

    - R_GEOL_MAT1_CODE
    - R_GEOL_MAT2_CODE
    - R_GEOL_MAT3_CODE
    - R_GEOL_MAT4_CODE

All four tables are consistent (i.e. containing the same coded information) - these multiple tables are necessary for internal use when writing queries.  The codes are largely taken from the MOE database, though several additional geologic type/descriptions have been added.  These are related through GEOL_MAT1_CODE in D_GEOLOGY_LAYER (this also includes each of GEOL_MAT2_CODE, GEOL_MAT3_CODE and GEOL_MAT4_CODE).  Note that the ROCK field designates (if true) whether the unit can be considered bedrock.

R_GEOL_MOISTURE_CODE

This table is used to track the standard geotechnical moisture codes for each sample/layer encountered in a borehole (e.g. wet, moist, damp, dry).  Data is generally only provided for the geotechnical boreholes in the database (e.g. City of Toronto, UGAIS, or other consultant boreholes; refer to Appendix D).  This is related through GEOL_MOISTURE_CODE in D_GEOLOGY_LAYER.

R_GEOL_ORGANIC_CODE

This table is used to provide additional detail regarding the organic materials within geologic layers.  Data is generally only available for the geotechnical boreholes in the database (e.g. City of Toronto, UGAIS, or other consultant boreholes; refer to Appendix D).  This is related through GEOL_ORGANIC_CODE in D_GEOLOGY_LAYER.

R_GEOL_SUBCLASS_CODE

This table allows different geological interpretations to be stored for the same geologic layer.  This is related through GEOL_SUBCLASS_CODE in D_GEOLOGY_LAYER.  In D_GEOLOGY_LAYER, a blank (i.e. NULL) GEOL_SUBCLASS_CODE generally indicates that the geologic coding is the 'original'; a value of '5' indicates that geologic coding has been checked against the original source and found to be valid OR has been corrected.  The other common code used is '7' (i.e. 'Invalid'), used to remove layers from consideration.

R_GEOL_TEXTURE_CODE

The table is used to track the standard geotechnical texture codes for each sample/layer encountered in a borehole (e.g. amorphous, fibrous, coarse, etc?).  Data is generally only provided for the geotechnical boreholes in the database (e.g. City of Toronto, UGAIS, or other consultant boreholes; refer to Appendix D).  This is related through GEOL_TEXTURE_CODE in D_GEOLOGY_LAYER.

R_GEOL_UNIT_CODE

This table contains the various geologic units as encountered, generally, in the ORMGP Study Area.  These unit descriptions have been derived from various sources (mainly from the OGS and the GSC).  Formations that are not formally recognized and that are used informally in the ORMGP are pre-pended with a 'YPDT' description.  This is related through GEOL_UNIT_CODE in D_GEOLOGY_LAYER and D_INTERVAL_FORM_ASSIGN.  The AQUIFER field, usually only for the ORMGP layers, is used to indicate (when populated by a non-null value, generally a '1') that the unit is considered an aquifer.  This is used as part of the logic when determining the 'Assigned Unit' in D_INTERVAL_FORM_ASSIGN.

R_GROUP_INT_CODE

This table contains user-specified group codes allowing the grouping of intervals (by INT_ID) by a common category or attribute.  This is related through GROUP_INT_CODE in D_GROUP_INTERVAL.

R_GROUP_INT_TYPE_CODE

This table provides the capability to categorize the different groups of intervals created (i.e. in R_GROUP_CODE).  The table is used by SiteFX when importing logger data (for barometric correction).  This is related through GROUP_INT_TYPE_CODE in R_GROUP_INT_CODE.

R_GROUP_LOC_CODE

This table contains user-specified group codes allowing the grouping of locations (by LOC_ID) by a common category or attribute.  This is related through GROUP_LOC_CODE in D_GROUP_LOCATION.

R_GROUP_LOC_TYPE_CODE

This table provides the capability to categorize the different groups of locations created.  This is related through GROUP_LOC_TYPE_CODE in R_GROUP_LOC_CODE.

R_INT_TYPE_CODE

The table holds the various interval types (found under INT_TYPE_DESCRIPTION) within the database.  Note that the interval types largely pertain to the wells/boreholes in the database.  For both the stream and climate station locations the INT_TYPE has not been broken down into specific equipment components (e.g. temperature recorder, rain gauge recorder, etc?).  This is related through INT_TYPE_CODE in D_INTERVAL.  The INT_TYPE_ALT_CODE field is used here to 'group' similar interval types.    Currently, all 'screen' interval types are tagged with the text 'Screen' in this field.

R_LOC_ALIAS_TYPE_CODE

The table provides a means to specify to what group an 'aliased' name applies.  Currently the table is being used to track the supplementary MOE database identifiers as found in D_LOCATION_ALIAS: Tag Number; Audit Number; WELL ID; and the Borehole ID Field.  This is related through LOC_ALIAS_TYPE_CODE in D_LOCATION_ALIAS.

R_LOC_COORD_HIST_CODE

This table is implemented as part of the tracking mechanism for changes in location coordinates.  This is related through LOC_COORD_HIST_CODE in D_LOCATION_COORD_HIST. Any 'new' coordinates should be stored with an explanation for the change - as described in LOC_COORD_HIST_DESCRIPTION and LOC_COORD_HIST_DESCRIPTION_LONG (or COORD_HIST_COMMENT in the referenced table).

R_LOC_COORD_OUOM_CODE

This table allows the specification of the projection (and datum) of the original coordinates for locations as found in D_LOCATION (and, optionally, in D_LOCATION_COORD_HIST).  Used by SiteFX when converting to system units (i.e. UTM Zone 17, NAD 83).  This is related through LOC_COORD_OUOM_CODE in D_LOCATION and D_LOCATION_COORD_HIST.

R_LOC_COUNTY_CODE

Adapted from the MOE database and allows linking to a (province of) Ontario county (as found in LOC_COUNTY_DESCRIPTION) for a particular location (note that this is currently used only for those wells from the MOE database given that county boundaries have changed over time and that GIS systems can better be used to track the particular county in which a location is found).  This is related through LOC_COUNTY_CODE in D_LOCATION.

R_LOC_DATA_SOURCE_CODE

The table has been incorporated from the MOE database and slightly adapted.  In general the table is not extensively used.  The MOE used the table to coarsely identify whether a particular well record was submitted from a driller (most commonly) versus any other source (e.g. Consultant, MOE or MNR Staff, Industry, etc?).  This is related through LOC_DATA_SOURCE_CODE in D_LOCATION.

R_LOC_ELEV_CODE

This table is implemented as part of the tracking mechanism for changes in elevation for a location.  This is related through LOC_ELEV_CODE in D_LOCATION_ELEV_HIST. Any 'new' elevations should be stored with an explanation for the change - as described in LOC_ELEV_DESCRIPTION and LOC_ELEV_DESCRIPTION_LONG (or ELEV_HIST_COMMENT in the referenced table).  LOC_ELEV_SURVEY and LOC_ELEV_DEM, when the values are non-null, indicate that the particular code can be considered to be 'surveyed' or a 'digital elevation model' (respectively). 

R_LOC_MOE_USE_PRIMARY_CODE

Adapted from the MOE database and holds the original MOE primary use descriptions (as found in LOC_USE_PRIMARY_DESCRIPTION).  This is related through LOC_USE_PRIMARY_CODE in D_LOCATION (using the field LOC_MOE_USE_1ST_CODE in the latter table).

R_LOC_MOE_USE_SECONDARY_CODE

Adapted from the MOE database and holds the original MOE secondary use descriptions (as found in LOC_USE_SECONDARY_DESCRIPTION).  This is related through LOC_USE_SECONDARY_CODE in D_LOCATION (using the field LOC_MOE_USE_2ND_CODE in the latter table).

R_LOC_STATUS_CODE

This table allows specification of a location's current status.  The codes are somewhat related to the MOE's status codes but additional categories have been incorporated to clarify the location's status (e.g. categories such as destroyed, decommissioned, etc? have been added).  This is related through LOC_STATUS_CODE in D_LOCATION.

R_LOC_TOWNSHIP_CODE

Adapted from the MOE database and allows linking to a (province of) Ontario township (as found in LOC_TOWNSHIP_DESCRIPTION) for a particular location (note that this is generally used only for those wells from the MOE database given that the township boundaries have changed over time and that GIS systems can better be used to track the particular county in which a location is found).  This is related through LOC_TOWNSHIP_CODE in D_LOCATION.

R_LOC_TYPE_CODE

This table allows specification of a location type and is related through LOC_TYPE_CODE in D_LOCATION.  Note that not all of the location types listed in this table can be found in the database but they allow for incorporation of additional, varying location types into the future.  

R_LOC_WATERSHED1_CODE (includes WATERSHED2 and WATERSHED3 codes)

These tables originated from the MOE database and were designed to record the watershed (at different scales) in which a location is found.  The tables list all of the primary watersheds that drain from the Oak Ridges Moraine.  Using GIS, two of the three fields (LOC_WATERSHED1_CODE and LOC_WATERSHED2_CODE) in the D_LOCATION table were populated several years ago.  However, the fields are not frequently used and are not regularly updated.

This is related through LOC_WATERSHED1_CODE (as well as LOC_WATERSHED2_CODE and LOC_WATERSHED3_CODE) in D_LOCATION.

R_OWN_TYPE_CODE

This table was originally populated by grouping and counting the number of wells that were listed by a particular 'owner' in the MOE database.  All owners that had more than 5 to 10 locations associated with them were added as an OWN_TYPE_DESCRIPTION (with associated code) to this table.  With the removal of the owner information from the MOE database, this table and its related D_OWNER table are no longer updated.  This is related through OWN_TYPE_CODE in D_OWNER.

R_PROJECT_AGENCY_CODE

Currently empty.  This table is part of the structure for a future release of SiteFX (version 6; some support in version 5) and is to be used to control access (by partner agencies) to locations within their areal extent.  This is part of the replacement for the original D_LOCATION_AGENCY table.  This relates to R_PROJECT_TIER1_CODE using PRJ_AG_CODE

R_PROJECT_TIER1_CODE

Currently empty.  This table is part of the structure for a future release of SiteFX (version 6; some support in version 5) and is to be used to control access (by partner agencies) to locations within their areal extent.  This is part of the replacement for the original D_LOCATION_AGENCY table and relates to D_PROJECT_LOCATION using PRJ_TIER1_CODE.

R_PROJECT_TIER2_CODE

Currently empty.  This table is part of the structure for a future release of SiteFX (version 6; some support in version 5) and is to be used to control access (by partner agencies) to locations within their areal extent.  This is part of the replacement for the original D_LOCATION_AGENCY table and relates to R_PROJECT_TIER1_CODE using PRJ_TIER1_CODE.

R_PROJECT_TYPE_CODE

Currently empty.  This table is part of the structure for a future release of SiteFX (version 6; some support in version 5) and is to be used to control access (by partner agencies) to locations within their areal extent.  This is part of the replacement for the original D_LOCATION_AGENCY table and relates to R_PROJECT_TIER1_CODE using PRJ_TYPE_CODE.

R_PTTW_SOURCEID_CODE

This table was originally populated from the sources found in the MOE 'Permit to Take Water' database.  These include a list of structures from which are being used as a water source (e.g. Well, Reservoir, Quarry, etc?).  This relates to D_PTTW through PTTW_SOURCEID_CODE.

R_PTTW_WATER_SOURCE_CODE

This table is based upon the type of structure or description in the original MOE 'Permit to Take Water' database; a PTTW location source is classified as one or both of 'Groundwater' or 'Surfacewater'.  This relates to D_PTTW through PTTW_WATER_SOURCE_CODE.

R_PUMPTEST_METHOD_CODE

Original information was incorporated from the MOE WWDB database but has been supplemented with additional categories allowing specification of a pumptest method (e.g. Air, Bailor, Pump, etc...; as found in PUMPTEST_METHOD_DESCRIPTION).  This is related through PUMPTEST_METHOD_CODE in D_PUMPTEST.

R_PUMPTEST_TYPE_CODE

This table allows specification of a pumptest type (e.g. Constant Rate, Variable Rate, etc...; as found in PUMPTEST_TYPE_DESCRIPTION).  This is related through PUMPTEST_TYPE_CODE in D_PUMPTEST.

R_PURPOSE_PRIMARY_CODE

This table allows specification of a primary purpose to a particular location and is populated through a combination of uses found within any of 

    - The MOE water well database 
    - The MOE Permit to Take Water database 
    - Other uses not utilized by the MOE  

This is related through PURPOSE_PRIMARY_CODE in D_LOCATION_PURPOSE.

R_PURPOSE_SECONDARY_CODE

This table allows specification of a secondary purpose to a particular location.  See R_PURPOSE_PRIMARY_CODE (above) for population details.  This is related through PURPOSE_SECONDARY_CODE in D_LOCATION_PURPOSE.

R_QA_COORD_CONFIDENCE_CODE

This table is adapted from the MOE water well database table and allows specification of the inherent horizontal error (found in QA_COORD_CONFIDENCE_DESCRIPTION) for any particular location.  Note that in general, users (and most views) should only rely upon information with a QA_COORD_CONFIDENCE_CODE of less than '6' (i.e. '5' - 'Margin of Error: 100 m - 300 m' - or less).  Codes that have added over the years by the MOE in their 'Code_Location_Method' table are also found in this table with a re-interpretation as to how they have been redefined to fit within the original MOE reliability coding of '1' through '9'.  The special code '117' ('YPDT - Coordinate Invalid OR Outside Ontario (10km Buffer)') is used when the coordinates are invalid - this should correspond to NULL values in both LOC_COORD_EASTING and LOC_COORD_NORTHING (as found in D_LOCATION).  The special code '118' ('YPDT - Assigned Township Centroid') is used when no (valid) coordinates were available but the LOC_TOWNSHIP_CODE (in D_LOCATION) was populated.  The centroid coordinates of the latter were then used to populated LOC_COORD_EASTING and LOC_COORD_NORTHING as a temporary measure (i.e. these are used as a review indicator).  Note that a code of '1' is used to indicate a 'surveyed' location (but this does not translate into surveyed elevation; see R_QA_ELEV_CONFIDENCE_CODE, below).

This is related through QA_COORD_CONFIDENCE_CODE in D_LOCATION_QA.

R_QA_ELEV_CONFIDENCE_CODE

This table is adapted from the MOE water well database table and allows specification of the inherent vertical error (found in QA_ELEV_CONFIDENCE_DESCRIPTION) for any particular location.  Note that a code of '1' ('1 ft - Surveyed in field from known Bench Mark') is used to indicate that a location has been 'surveyed' for elevation.  In general the elevation coding is no longer used as the elevations now are no longer assigned by the MOE and are, instead, populated from a MNR DEM.  Within the database the codes are now only used to differentiate 'surveyed' locations ('1'; these will never have their elevation over-written by a DEM elevation) versus 'non-surveyed' locations ('10'; these elevation values would be over-written by a DEM value).  This is related through QA_ELEV_CONFIDENCE_CODE in D_LOCATION_QA.

Refer to Section 2.4.2 for additional details regarding location elevation assignment.

R_RD_NAME_CODE

The table contains standardized names used in the D_INTERVAL_TEMPORAL_* tables (and related through the RD_NAME_CODE field).  A single name has been chosen to represent a parameter out of all possible names available (e.g. 'Na' instead of 'Sodium').  The table R_READING_NAME_ALIAS (described below) is used to associate the various possible names with the single name, stored here.

R_RD_TYPE_CODE

Allows additional information to be included for any particular reading in the D_INTERVAL_TEMPORAL_* tables (using the RD_TYPE_CODE field).  For example a water level reading with a code of '628' ('Water Level - Manual - Static') can be further tagged with a RD_TYPE_CODE of '0' ('WL - MOE Well Record - Static') indicating that the static reading came from the MOE water well database.  Data loggers of varying make can also be identified using the RD_TYPE_CODE (e.g. code '59' is used to identify 'Troll - Logger').  Additional codes refer to specific data loggers by type and serial number; this can be applied against any type of recording or measuring equipment.  Climate data recording notes (e.g. 'Climate - estimated, with snow cover') and surface water notes also have specific RD_TYPE_CODE's.  This lookup table is currently underused in the database.

R_READING_GROUP_CODE

This table associates related RD_NAME_CODE's (as found in R_RD_NAME_CODE) allowing them to be grouped as necessary.  For example, a READING_GROUP_CODE of '23' is used to indicate all RD_NAME_CODE's that are associated with water level measurements.  This is related through READING_GROUP_CODE in the R_RD_NAME_CODE table.

R_READING_NAME_ALIAS

As chemistry data (in particular) can come from many different laboratories (each using a differing but equivalent name for any particular parameter) a single parameter can be known by multiple names.  A single name, only, should be used within the 'primary' database table (i.e. R_RD_NAME_CODE) to reduce the chances for excluding (temporal) data from a query or search.  Alternate parameter names have been stored within this table linked to the 'chosen-representative' name (found in R_RD_NAME_CODE) that is to be used for the particular parameter in the database.  This table is referenced by SiteFX when converting from the OUOM specified parameter.

R_REC_STATUS_CODE

Allows any reading in the D_INTERVAL_TEMPORAL_1B and _2 tables to be tagged with additional information, currently pertaining to a QA check (e.g. '1' indicates an 'unreviewed data  record', '2' a 'reviewed - record is valid').  This table and the associated fields are not extensively used and should be re-evaluated or updated in the next database release.  This is related through REC_STATUS_CODE (found in both of these tables) in D_INTERVAL_TEMPORAL_1B and D_INTERVAL_TEMPORAL_2.

R_SAM_TYPE_CODE

This table allows samples in D_INTERVAL_TEMPORAL_1A to be flagged with designations such as 'Duplicate', 'Field Blank', etc...  This is related through SAM_TYPE_CODE in the D_INTERVAL_TEMPORAL 1A table.

R_SAM_TYPE_KEYWORD

The table is not currently used in the database but is required by SiteFX.  It appears to act as an alias table for the SAM_TYPE_CODE table.  This is related through SAM_TYPE_CODE in the D_INTERVAL_TEMPORAL_1A table. 

R_SYS_GROUP_SEARCH

This table is used and populated by SiteFX.

R_SYS_GROUP_TYPE_CODE

This table is used and populated by SiteFX.

R_SYS_INT_DETAIL_CODE

This table is used and populated by SiteFX.

R_SYS_VALUE_QUALIFIER

This table is used and populated by SiteFX.

R_UNIT_CODE

This table allows specification of all allowed 'system' unit codes within the database.  The values, here, are paired with R_UNIT_CONV to allow SiteFX (or other software) to convert values to specified system units.  Note that if the OUOM units are not found within this table when importing data, SiteFX can add them (to both R_UNIT_CODE and R_UNIT_CONV) rather than returning a 'not found' message (though it will write the results of an import to an external log, if desired).  This capability is user (and system-wide) selectable.  This is related through UNIT_CODE in D_INTERVAL_TEMPORAL_1B and D_INTERVAL_TEMPORAL_2.

R_UNIT_CONV

This table allows specification of the conversion of various unit codes to specified system units.  Paired with R_UNIT_CODE (described above) and, also, related to R_CONV_CLASS_CODE (also described above) through CONV_CLASS_CODE.  The CONV_UNIT_OUOM unit is specified (in text) along with the related output UNIT_CODE (as found in R_RD_NAME_CODE) and with a (possible) multiplier in CONV_UNIT_OUOM_MULTIPLIER (as necessary; this defaults to a '1' - i.e. no change).  This allows for parameters to be defaulted to one set of 'system' units for all parameters imported into the database.  Where CONV_CLASS_CODE has a

    - Value of '1' ('class1') - no change save by multiplier
    - Value of '2' ('soil') - ?????
    - Value of '3' ('elevation') - no change save by multiplier
    - Value of '4' ('depth') - no change save by multiplier
    - Value of '5' ('property')

For example readings imported (i.e. reported/recorded) as 'mg/kg' would be converted to 'ug/g' for soil samples (a CONV_CLASS_CODE of '2') and to 'mg/L' for water samples (a code of '1').

With regard to conversion of depths to elevations, SiteFX does not use the above table.  Instead, any of the following units (as found in D_INTERVAL_TEMPORAL_2) are automatically converted (to 'masl') if a 'reference' elevation (as found in D_INTERVAL_REF_ELEV) is specified for the interval.

    - ftbref
    - fbref
    - fbtop
    - fbtoc
    - f
    - ft
    - feet
    - fbgs
    - mbref
    - mbtop
    - mbtoc
    - m
    - metres
    - meters
    - meter
    - metre
    - mbgs

R_WATER_CLARITY_CODE

This is adapted from the MOE water well database and is related through WATER_CLARITY_CODE in D_PUMPTEST.

Section 2.1.3 Other Tables

Other table prefixes are used within the database, mainly S_*.  These tables are used for a variety of purposes but are not generally accessed directly by a user (outside of specific software).  Those tables not described in Section 2.1.1 or 2.1.2 (or this section) are unused in this version of the database (and are empty) or are SiteFX specific.  Many of these will be related to SiteFX's sample or history tracking/management capability.  

Other tables that are important with regard to the ORMGP include:

    - S_USER
    - W_GENERAL
    - W_GENERAL_DOCUMENT
    - W_GENERAL_GW_LEVEL
    - W_GENERAL_OTHER
    - W_GENERAL_SCREEN
    - W_GEOLOGY_LAYER

S_USER

This table is exclusively used by SiteFX for user tracking.

Though also mentioned in Section 2.1.3 (Other; below), this table also contains the 'range' of numeric identifiers available to each partner agency (refer also to V_SYS_S_USER_ID_RANGES).  This allows data to be input at each partner agency without the possibility of primary key conflicts when synchronizing between partner agencies.  Note that the changeover from a database replication sharing to a remote (and web) database access has reduced the importance of this feature.

Users/partners using SiteFX will automatically be limited to their own range (note that these are keyed by the user-login which should be specific to the partner agency; all logins for a particular agency will be given the same range of values).  The users of alternative software must take care that any keys used created for the import of data correspond to their particular partner agency range (refer to the views V_SYS_RANDOM_ID_* for this purpose).  

The ranges of values are shown in the following table.



W_GENERAL

Each of the 'W_' data tables contain summaries of information used specifically for 'web' access, especially with regard to online mapping (almost all contain a GEOM field for coordinates as well as each of a CA_ID, REG_ID and SWP_ID relating to the contained area in which the location lies).  Each of the tables includes a GIS_ID field with values greater than zero - such a key is required by the mapping backend software (Geocortex - Latitude Geographics, 2017; and ArcGIS - ESRI, 2017).

This table contains 'general' location information, mainly focused on boreholes.  Temporal data availability and ranges is also listed.  This is related to D_LOCATION using LOC_ID.

Note that all 'W_*' tables are automatically re-populated weekly and rely upon information present in the D_LOCATION_SUMMARY and D_INTERVAL_SUMMARY tables (though not exclusively).

W_GENERAL_DOCUMENT

This table contains information from the D_LOCATION and D_DOCUMENT tables and includes a formatted bibliographic reference field (BIBLIO).  This is related to D_LOCATION using LOC_ID.  Refer to W_GENERAL, above, for information concerning the 'W_' tables.

W_GENERAL_GW_LEVEL

This table contains daily averages of water levels as well as (if available) manual water levels for any interval with more than 25 records.  This table is used in conjunction with W_GENERAL_SCREEN for plotting purposes.   This is related to D_LOCATION using LOC_ID and D_INTERVAL using INT_ID.  Refer to W_GENERAL, above, for information concerning the 'W_' tables.

W_GENERAL_OTHER

This table contains summary information for non-borehole locations as specified in the field TYPE (e.g. Climate Stations and Surface Water Stations).  It is related to D_LOCATION using LOC_ID and D_INTERVAL using INT_ID.  Refer to W_GENERAL, above, for information concerning the 'W_' tables.

W_GENERAL_SCREEN

This table contains summary information for screened intervals (i.e. screened well intervals) as described in R_INT_TYPE_CODE (above).  It is related to D_LOCATION using LOC_ID and D_INTERVAL using INT_ID.  This table is used as a locational reference for information in W_GENERAL_GW_LEVEL.  Refer to W_GENERAL, above, for information concerning the 'W_' tables.

Section 2.1.4 View Outline

A series of views have been developed within the database to provide easier access to information (by removing the complexity of creating joined tables when querying the database).  In most cases, look-up values have been removed and replaced with their equivalent descriptions allowing direct perusal by the user.  Also, the location and/or interval name(s) (as appropriate) are found in almost all the views so that they may be filtered to obtain specific results.

Note that many of the field names carried in these views will be of a simplified form and, thus, different from those in the source tables (e.g. NAME for LOC_NAME: ALTERNATE_NAME for LOC_NAME_ALT1; X_UTMNAD83 and Y_UTMNAD83 for LOC_COORD_EASTING and LOC_COORD_NORTHING; etc?).

The views are broken into categories defined by a 3-letter code (in general) following the 'V_'.  These include:

    - V_CON_*
        ? Consultant views. These results are meant to be used for submittal of information for consultants either through, for example, Excel spreadsheets or Access databases.  The rows returned are limited by the location and interval confidentiality codes.
    - V_GEN_*
        ? General views.  These are meant to be used directly by the partner agencies; an effort has been made to identify data searches and formats required. 
    - V_GROUP_*
        ? Group views.  These are meant to be used to identify and manage 'groups' within the database; that is, linked locations and intervals with common attributes (e.g. all PGMN wells by CA; nested wells; etc?).
    - V_QA_*
        ? Quality Assurance views.  These are meant to be used to review 'new' locations and intervals as a quality check (this is considered to be any location or interval added in the last 60 days).
    - V_SUM_*
        ? Summary Data views.  These calculate summary data for locations and intervals on-the-fly.  Some are used for tracking purposes (see D_VERSION_STATUS, above).
    - V_SYS_*
        ? System views.  Many of these are used in combination with the above groups and should not, in the main, be used directly (there will be exceptions).  These views tend to honour the source field names and preferentially use lookup codes rather than the equivalent text descriptions.
        ? A subset of these, V_SYS_CHK_* are used for various data checks within the database.
        ? Another subset, V_SYS_ORMGP_* deals directly with locations and intervals associated with the ORMGP
    - V_VL_*
        ? Viewlog views.  These views are directly tied to certain capabilities in the Viewlog software.

Note that additional views can be added at any time.  Partner agencies should request additions or modifications to existing views as well as the creation of new views that meet their requirements.

Section 2.1.5 Main Views

These views were created specifically for general users to allows 'snapshots' of information to be extracted from the database without having to manipulate the underlying tables directly.  Any look-up (i.e. reference) values should include their text descriptions.

These include:

    - V_CON_DOCUMENT
    - V_CON_GENERAL
    - V_CON_GEOLOGY
    - V_CON_HYDROGEOLOGY
    - V_CON_HYDROGEOLOGY_FULL
    - V_CON_PICK
    - V_CON_PTTW
    - V_CON_WATER_LEVEL_AVG_DAILY
    - V_GEN
    - V_GEN_BOREHOLE
    - V_GEN_BOREHOLE_BEDROCK
    - V_GEN_BOREHOLE_OUTCROP
    - V_GEN_DOCUMENT
    - V_GEN_DOCUMENT_ASSOCIATION
    - V_GEN_DOCUMENT_BIBLIOGRAPHY
    - V_GEN_FIELD
    - V_GEN_FIELD_CLIMATE
    - V_GEN_FIELD_CLIMATE_SUMMARY
    - V_GEN_FIELD_METEOROLOGICAL
    - V_GEN_FIELD_PUMPING_PRODUCTION
    - V_GEN_FIELD_STREAM_FLOW
    - V_GEN_FIELD_STREAM_FLOW_SUMMARY
    - V_GEN_FIELD_SUMMARY
    - V_GEN_GEOLOGY
    - V_GEN_GEOLOGY_DEEPEST_NONROCK
    - V_GEN_GEOLOGY_OUTCROP
    - V_GEN_HYDROGEOLOGY
    - V_GEN_HYDROGEOLOGY_BEDROCK
    - V_GEN_HYDROGEOLOGY_FULL
    - V_GEN_INTERVAL_FORMATION
    - V_GEN_INTERVAL_INFO_DURHAM
    - V_GEN_LAB
    - V_GEN_LAB_BACTERIOLOGICALS
    - V_GEN_LAB_EXTRACTABLES
    - V_GEN_LAB_GENERAL
    - V_GEN_LAB_HERBICIDES_PESTICIDES
    - V_GEN_LAB_IONS
    - V_GEN_LAB_ISOTOPES
    - V_GEN_LAB_METALS
    - V_GEN_LAB_ORGANICS
    - V_GEN_LAB_SOIL
    - V_GEN_LAB_SUMMARY
    - V_GEN_LAB_SUMMARY_GROUP
    - V_GEN_LAB_SUMMARY_SAMPLE_COUNT
    - V_GEN_LAB_SUMMARY_SAMPLE_COUNT_DETAIL
    - V_GEN_LAB_SUMMARY_SAMPLE_COUNT_YEARLY
    - V_GEN_LAB_SUMMARY_SAMPLE_COUNT_YEARLY_SOIL
    - V_GEN_LAB_SUMMARY_SAMPLE_GROUP
    - V_GEN_LAB_SVOCS
    - V_GEN_LAB_VOCS
    - V_GEN_MOE_REPORT
    - V_GEN_MOE_WELL
    - V_GEN_PICK
    - V_GEN_PTTW
    - V_GEN_PTTW_RELATED
    - V_GEN_PTTW_SOURCE
    - V_GEN_PUMPING_MUNICIPAL_PTTW_VOLUME_YEARLY
    - V_GEN_PUMPING_MUNICIPAL_VOLUME_MONTHLY
    - V_GEN_PUMPING_MUNICIPAL_VOLUME_YEARLY
    - V_GEN_PUMPING_VOLUME_MONTHLY
    - V_GEN_PUMPING_VOLUME_YEARLY
    - V_GEN_STATION_CLIMATE
    - V_GEN_STATION_CLIMATE_PRECIP_ANNUAL
    - V_GEN_STATION_SURFACEWATER
    - V_GEN_STATION_SURFACEWATER_ANNUAL
    - V_GEN_WATER_FOUND
    - V_GEN_WATER_LEVEL
    - V_GEN_WATER_LEVEL_AVG
    - V_GEN_WATER_LEVEL_AVG_DAILY
    - V_GEN_WATER_LEVEL_AVG_DAILY_LOGGER
    - V_GEN_WATER_LEVEL_MANUAL
    - V_GEN_WATER_LEVEL_OTHER
    - V_GEN_WATERLEVEL_BARO_YEARLY
    - V_GEN_WATERLEVEL_LOGGER_YEARLY
    - V_GEN_WATERLEVEL_MANUAL_YEARLY
    - V_GEN_WATERLEVEL_YEARLY
    - V_GROUP_INTERVAL
    - V_GROUP_LOCATION
    - V_QA_NEW_D_BOREHOLE
    - V_QA_NEW_D_INTERVAL
    - V_QA_NEW_D_LOCATION
    - V_SUM_FIELD_LAB_VALUES
    - V_SUM_FIELD_VALUES
    - V_SUM_INT_TYPE_COUNTS
    - V_SUM_LAB_PARAMETER_COUNT
    - V_SUM_LAB_SAMPLES
    - V_SUM_LOC_TYPE_COUNTS
    - V_SUM_READING_GROUP_COUNTS
    - V_SUM_SAMPLE_NUM_SAMPLE_COUNT
    - V_SUM_SCREEN_COUNTS
    - V_SUM_STATION_BARO_WL
    - V_SUM_STATION_CLIMATE_PRECIP
    - V_SUM_STATION_CLIMATE_RAINFALL
    - V_SUM_STATION_CLIMATE_SNOWFALL
    - V_SUM_STATION_CLIMATE_TEMP
    - V_SUM_SURFACE_WATER_FIELD
    - V_SUM_SW_SUBTYPE_COUNTS
    - V_SUM_TABLE_CHANGES
    - V_SUM_TOTAL_CHANGES
    - V_VL_BOREHOLES
    - V_VL_GEO_GSC
    - V_VL_GEO_MAT123
    - V_VL_GEOLOGY
    - V_VL_HEADER_LOG
    - V_VL_HEADER_SCREEN

V_CON_* (Consultant Views)

These views were prepared to provide a 'cutout' of information from the database that can be provided to consultants working in a specific geographic area of a partner agencies jurisdiction.  Rather than providing the entire database to a consultant, specific locations in the project area can be flagged by making use, for example, of the SYS_TEMP_1 or SYS_TEMP_2 fields (though there are alternative methods).  Once the locations have been flagged using a specific, searchable, value (possibly created spatially through, for example, Viewlog or a GIS) then the V_CON_* views can be filtered to extract the locations (and their information) required by the consultant.  See also Appendix J.3 for an (internal) Microsoft SQL Server solution.  Note that these views honour the settings in LOC_CONFIDENTIALITY_CODE and INT_CONFIENTIALITY_CODE.

The views contain a subset of available data fields as well as introducing summary fields (especially with regard to temporal data) of available information found at each location.  All look-up codes have been translated to their named equivalents.  

V_CON_DOCUMENT

This view simplifies the listing of the documents residing within the ORMGP report library.  Only a certain number of fields from the D_LOCATION and D_DOCUMENT tables are included here.  Consultants may then wish to request specific report files as a follow up action.  The data returned here is meant to be a subset of V_GEN_DOCUMENT.

V_CON_GENERAL

This view summarizes the main location information from a number of tables including location names, coordinates, borehole depth, ground surface elevation, etc?  It also includes

    - The number of water level readings associated with the/any screens
    - The number of soil samples from the borehole
    - The number of pumping measurements taken
    - The number of water quality readings taken
    - The number of geologic layers present
    - The number of screens present

V_CON_GEOLOGY

This view includes the top- and bottom-elevations of the geologic units associated with a location.  In addition, the material codes have converted to their text descriptions.  The data returned here is meant to be a subset of V_GEN_GEOLOGY.

V_CON_HYDROGEOLOGY

This view includes the screen information by location (multiple screens at a location would be represented across multiple records).  Any associated pumping and water level data (including the date for the former and the date range for the latter) are indicated.  The formation assigned to the screen (if identified) is shown.  A well flowing tag (FLOWING) is also returned.  The data returned here is meant to be a subset of V_GEN_HYDROGEOLOGY.

V_CON_PICK

This view returns information from the PICKS table - additions including the location name and study as well as the borehole depth.  The data returned here is meant to be a subset of V_GEN_PICK.

V_CON_PTTW

This view returns information from the D_LOCATION and D_PTTW tables.  The data returned here is meant to be a subset of V_GEN_PTTW.

V_CON_WATER_LEVEL_AVG_DAILY

This view returns the daily calculated average water level as well as associated information (e.g. reference point, ground elevation, screen depths, etc?).

V_GEN_* (General Views)

The base views provided in the database, and discussed here, are for the partner agencies to readily access information from the multitude of tables that have been described, above.  The purpose of the views is to pull or query out key information from the database and present it in an easy to understand manner.  The V_GEN_* views are preferentially to be used when accessing the database (by non-expert users).  Each view contains basic information from a particular location (e.g. LOC_ID, LOC_NAME, LOC_NAME_ALT1, LOC_COORD_EASTING, LOC_COORD_NORTHING, etc...) as well as information related to the particular view name (e.g. in addition to the previously mentioned fields, the V_GEN_GEOLOGY view contains BH_GND_ELEV, BH_TOP_ELEV, BH_BOTTOM_ELEV, etc...).  In many cases, the original field names have been modified to for ease of use or to more adequately describe the data contained within.

V_GEN

This is the base view used by many other V_GEN_* views.  Only basic information is available here (e.g. name, coordinates, purpose, etc?).

V_GEN_BOREHOLE

This view contains basic borehole information, combining data from D_LOCATION and D_BOREHOLE (in which the location must be present) as well as some screen information (if available).

V_GEN_BOREHOLE_BEDROCK

This view uses V_GEN_BOREHOLE as a base only extracting those locations that encounter bedrock.  This is dependent upon the BH_BEDROCK_ELEV being populated (in D_BOREHOLE; refer to Appendix G with regards to how this is accomplished).

V_GEN_BOREHOLE_OUTCROP

This view uses V_GEN_BOREHOLE as a base only extracting those locations that are identified as outcrop (i.e. LOC_TYPE_CODE '11').

V_GEN_DOCUMENT

This view extracts document (i.e. LOC_TYPE_CODE '25') information from the D_LOCATION and D_DOCUMENT tables.  Only basic information such as the title and folder number (as found within the ORMGP report library) and the author and client agencies are included.

V_GEN_DOCUMENT_ASSOCIATION

This view extracts all locations (usually boreholes) associated with a particular document.  This information is accessed from the D_DOCUMENT_ASSOCIATION table.

V_GEN_DOCUMENT_BIBLIOGRAPHY

This view assembles a bibliographic reference for each document in D_DOCUMENT.  The format handles reports, journal articles and texts appropriately.

V_GEN_FIELD

This view extracts all field data (i.e. from D_INTERVAL_TEMPORAL_2) by interval and location.  Parameter codes are converted to their text description.

V_GEN_FIELD_CLIMATE

This view extracts all climate data stored in D_INTERVAL_TEMPORAL_3 - this information is tied to an actual climate station.  The query only applies to data with a READING_GROUP_CODE of '22' (i.e. 'Meteorological').

V_GEN_FIELD_CLIMATE_SUMMARY

This view extracts summaries of climate data stored in D_INTERVAL_TEMPORAL_3.  Intervals are not checked with regard to being climate stations.

 V_GEN_FIELD_METEOROLOGICAL

This view extracts all climate data stored in D_INTERVAL_TEMPORAL_2.  The query only applies to data with a READING_GROUP_CODE of '22' (i.e. 'Meteorological').  This is a subset of the V_GEN_FIELD view.

V_GEN_FIELD_PUMPING_PRODUCTION

This view extracts all pumping data stored in D_INTERVAL_TEMPORAL_2.  The query only applies to data with a READING_GROUP_CODE of '35' (i.e. 'Discharge/Production - From Wells?').

V_GEN_FIELD_STREAM_FLOW

This view extracts all stream flow data stored in D_INTERVAL_TEMPORAL_5.  The query only applies to data with a READING_GROUP_CODE of '25' (i.e. 'Stream Flow Related').  

V_GEN_FIELD_STREAM_FLOW_SUMMARY

This view extracts summaries of data stored in D_INTERVAL_TEMPORAL_5.  Intervals are not checked for being streamflow stations.

V_GEN_FIELD_SUMMARY

This view summarizes the data in D_INTERVAL_TEMPORAL_2 grouped by interval, parameter and parameter units (the latter should be used as a quality check).  This returns the start and end dates, count and average for each parameter.

V_GEN_GEOLOGY

This view extracts the information from D_GEOLOGY_LAYER by location.  Parameters are converted to their text descriptions.

V_GEN_GEOLOGY_DEEPEST_NONROCK

This view extracts the lowest geologic layer from D_GEOLOGY_LAYER for locations that do not intercept the bedrock surface.  Note that this relies upon BH_BEDROCK_ELEV being populated in D_BOREHOLE.

V_GEN_GEOLOGY_OUTCROP

This view extracts information from D_GEOLOGY_LAYER where the location has a LOC_TYPE_CODE of '7' (i.e. 'Testpit'), '11' (i.e. 'Outcrop') or '19' (i.e. 'Bedrock Outcrop').  This is a subset of V_GEN_GEOLOGY.

V_GEN_HYDROGEOLOGY

This view extracts hydrogeologic information by screened interval (based upon the presence of the interval in D_INTERVAL_MONITOR) and includes data on: screens; water levels; water quality; and pumping.  Note that D_INTERVAL_SUMMARY is used as a source for all summary data.  This view combines all intervals with the same INT_ID in D_INTERVAL_MONITOR (see V_GEN_HYDROGEOLOGY_FULL, below, if this is not desired).

V_GEN_HYDROGEOLOGY_BEDROCK

This view extracts hydrogeologic information by screened interval using V_GEN_HYDROGEOLOGY as the source.  All intervals here must have the bottom screen elevation below that of the bedrock surface (as found in D_BOREHOLE).

V_GEN_HYDROGEOLOGY_FULL

This view extracts information in a similar manner to V_GEN_HYDROGEOLOGY.  However, this view does not combine interval information in D_INTERVAL_MONITOR (where multiple records exist with the same INT_ID but differing top- and bottom-elevations).

V_GEN_INTERVAL_FORMATION

This view mimics the original format of the D_INTERVAL_FORMATION_ASSIGNMENT table extracting, for each screen or soil interval: the assigned geologic unit; the next and previous geologic unit; and the vertical distance to the next and previous geologic units.

V_GEN_LAB

This view extracts all laboratory data (i.e. from D_INTERVAL_TEMPORAL_1A and D_INTERVAL_TEMPORAL_1B) by interval and location.  Parameter codes are converted to their text description.

V_GEN_LAB_BACTERIOLOGICALS

This view returns a subset of V_GEN_LAB extracting only those parameters having a READING GROUP_CODE of '36' (i.e. 'Water - Bacteriological Related').

V_GEN_LAB_EXTRACTABLES

This view returns a subset of V_GEN_LAB extracting only those parameters having a READING GROUP_CODE of '5' (i.e. 'Water - Extractables').

V_GEN_LAB_GENERAL

This view returns a subset of V_GEN_LAB extracting only those parameters having a READING GROUP_CODE of '26' (i.e. 'Chemistry - General).

V_GEN_LAB_HERBICIDES_PESTICIDES

This view returns a subset of V_GEN_LAB extracting only those parameters having a READING GROUP_CODE of '4' (i.e. 'Water - Pesticides and Herbicides').

V_GEN_LAB_IONS

This view returns a subset of V_GEN_LAB extracting only those parameters having a READING GROUP_CODE of '1' (i.e. 'Water - Major Ions').

V_GEN_LAB_ISOTOPES

This view returns a subset of V_GEN_LAB extracting only those parameters having a READING GROUP_CODE of '15' (i.e. 'Water - Isotopes').

V_GEN_LAB_METALS

This view returns a subset of V_GEN_LAB extracting only those parameters having a READING GROUP_CODE of '2' (i.e. 'Chemistry - Metals').

V_GEN_LAB_ORGANICS

This view returns a subset of V_GEN_LAB extracting only those parameters having a READING GROUP_CODE of '28' (i.e. 'Water - Miscellaneous Organics').

V_GEN_LAB_SOIL

This view returns a subset of V_GEN_LAB extracting only those intervals that are soil samples.

V_GEN_LAB_SUMMARY

This view summarizes the contents of D_INTERVAL_TEMPORAL_1A and D_INTERVAL_TEMPORAL_1B grouped by interval, parameter and parameter units (note that the latter should be used as a QA check).  This returns the start and end dates, count and average for each parameter.

V_GEN_LAB_SUMMARY_GROUP

This view summarizes each of the V_GEN_LAB_* views, returning the start and end dates as well as the number of records associated with a particular reading group.

V_GEN_LAB_SUMMARY_SAMPLE_COUNT

This view summarizes the V_GEN_LAB_* views, returning the minimum and maximum dates of all samples as well as the count of each reading group.

V_GEN_LAB_SUMMARY_SAMPLE_COUNT_DETAIL

This view summarizes the V_GEN_LAB_* views, returning the minimum and maximum dates and a count for each reading group.

V_GEN_LAB_SUMMARY_SAMPLE_COUNT_YEARLY

This view returns a count of samples by year for each interval in D_INTERVAL_TEMPORAL_1A.

V_GEN_LAB_SUMMARY_SAMPLE_COUNT_YEARLY_SOIL

This view returns a count of samples by year for each soil interval in D_INTERVAL_TEMPORAL_1A.  A subset of V_GEN_LAB_SUMMARY_SAMPLE_COUNT_YEARLY, using the INT_TYPE_CODE '29' (i.e. 'Soil or Rock'), is the source of this view.

V_GEN_LAB_SUMMARY_SAMPLE_GROUP

This view returns a number of readings count (by group) for a particular sample for a particular interval.

V_GEN_LAB_SVOCS

This view returns a subset of V_GEN_LAB extracting only those parameters having a READING GROUP_CODE of '29' (i.e. 'SVOCs').

V_GEN_LAB_VOCS

This view returns a subset of V_GEN_LAB extracting only those parameters having a READING GROUP_CODE of '3' (i.e. 'Water - VOCs').

V_GEN_MOE_REPORT

This view returns each MOE well in the old 'green book' format.  A value of 'ND' indicates 'not defined' (i.e. no value) for the particular column.

V_GEN_MOE_WELL

This view returns all the MOE wells (as tagged by DATA_ID in D_DATA_SOURCE) as a subset of V_GEN.  As of 20170614, these DATA_IDs are: -1809069713, 517, 156458478, 1229103552, 1257268550, 1285616179, 1350796350 and 1846079169.

V_GEN_PICK

This view returns the information from D_PICK in addition to location information from D_LOCATION.

V_GEN_PTTW

This view extracts all 'Permit to Take Water' records (i.e. LOC_TYPE_CODE '22') and associated location details.  All look-up codes are converted to their text descriptions.

V_GEN_PTTW_RELATED

This view returns all 'Permit to Take Water' (PTTW) records related to a particular PTTW record; the latter LOC_ID will be available in LOC_ID_RELATED.

V_GEN_PTTW_SOURCE

This view extracts all 'Permit to Take Water' (PTTW) records for which their source has been identified within the Master database.  In this case, the LOC_MASTER_LOC_ID for the PTTW record will contain the source LOC_ID.  The PERMIT_LOC_ID is the identifier for the PTTW; LOC_ID will be the source identifier.  Note that not all the PTTW records have been successfully linked to a source (these will have their LOC_ID present in LOC_MASTER_LOC_ID in D_LOCATION).

V_GEN_PUMPING_MUNICIPAL_PTTW_VOLUME_YEARLY

This view uses V_GEN_PUMPING_MUNICIPAL_VOLUME_YEARLY (below) as a source, including 'Permit to Take Water' (PTTW) data from V_SYS_PTTW_SOURCE_VOLUME where the source for the PTTW has been determined (refer to V_GEN_PTTW_SOURCE, above, for details).

V_GEN_PUMPING_MUNICIPAL_VOLUME_MONTHLY

This view is similar to V_GEN_PUMPING_VOLUME_MONTHLY (below) with the exception that only intervals with an LOC_STATUS_CODE of '8' (i.e. 'Standby Municipal Pumping Well'), '11' (i.e. 'Active Municipal Pumping Well'), '12' (i.e. 'In-active Municipal Pumping Well') or '13' (i.e. 'Decommissioned Municipal Pumping Well') will have data returned.  Note that these locations must not have a QA_COORD_CONFIDENCE_CODE of '117' (i.e. 'YPDT - Coordinate Invalid ?').

V_GEN_PUMPING_MUNICIPAL_VOLUME_YEARLY

This view is similar to V_GEN_PUMPING_VOLUME_YEARLY (below) with the exception that only municipal pumping well data will be returned, as V_GEN_PUMPING_MUNICIPAL_VOLUME_MONTHLY (above).

V_GEN_PUMPING_VOLUME_MONTHLY

This view extracts pumping data from D_INTERVAL_TEMPORAL_2 (using RD_NAME_CODE '447' - 'Production - Pumped Volume (Total Daily)' - and UNIT_CODE '74' - 'm3/d') calculating the minimum, maximum, average and total volume as well as the total number of records by interval for each month (for which data exists).  

V_GEN_PUMPING_VOLUME_YEARLY

This view is similar to V_GEN_PUMPING_VOLUME_YEARLY (above) with the exception that data is calculated for each interval for each year for which data exists.  In addition, the total volume is divided by '365' to calculate AVG_VOLUME_M3_D_YEAR.

V_GEN_STATION_BASEFLOW_ANNUAL

This view returns the minimum, maximum and average (as well as the total number of records) baseflow values from D_INTERVAL_TEMPORAL_2 (using RD_NAME_CODES '1002', '1003', '1004', '1005', '1006', '1007', '1008', '1009', '1010', '1011', '1012', '1013' and '70980') for each interval and year of data.

V_GEN_STATION_CLIMATE

This view extracts summary precipitation and temperature data (from D_LOCATION_SUMMARY) for all climate stations (i.e. LOC_TYPE_CODE '9') within the database.

V_GEN_STATION_CLIMATE_PRECIP_ANNUAL

This view determines the yearly maximum, average and number of precipitation records (having a RD_NAME_CODE of '551' - 'Precipitation - Daily Total') from D_INTERVAL_TEMPORAL_3 for the climate stations found in V_GEN_STATION_CLIMATE (above).

V_GEN_STATION_SURFACEWATER

For those locations of LOC_TYPE_CODE '6' (i.e. 'Surface Water'), this view extracts the various streamflow values present in D_LOCATION_SUMMARY.

V_GEN_STATION_SURFACEWATER_ANNUAL

This view calculates the yearly average, minimum, maximum and total number of records with RD_NAME_CODE '1001' (i.e. 'Stream Flow - Daily Discharge ?') and '70870' (i.e. 'Stream Flow - Spot Flow') for all intervals in D_INTERVAL_TEMPORAL_2.  Note that those values with UNIT_CODE '30' (i.e. 'L/s') are converted to 'm3/s' on-the-fly.

V_GEN_WATERLEVEL_BARO_YEARLY

This view returns the minimum, maximum and number of records for each interval for each year of record (from D_INTERVAL_TEMPORAL_2); V_SYS_WATERLEVELS_BARO_YEARLY is used as the source of the calculations.  Note that only those rows with an INT_TYPE_CODE of '122' ('Barometric Logger Interval'), an RD_NAME_CODE of '629' ('Water Level - Logger (Compensated & Corrected)') and UNIT_CODE of '128' ('cmap baro') will be included.

V_GEN_WATERLEVEL_LOGGER_YEARLY

This view returns the minimum, maximum, average and number of records for each interval for each year of record (from D_INTERVAL_TEMPORAL_2); V_SYS_WATERLEVELS_LOGGER_YEARLY is used as the source of the calculations.  Note that only those rows with a RD_NAME_CODE of '629' (i.e. 'Water Level - Logger (Compensated & Corrected)') and UNIT_CODE of '6' (i.e. 'masl') will be included.

V_GEN_WATERLEVEL_MANUAL_YEARLY

This view returns the minimum, maximum, average and number of records for each interval for each year of record (from D_INTERVAL_TEMPORAL_2); V_SYS_WATERLEVELS_MANUAL_YEARLY is used as the source of the calculations.  Note that only those rows with a RD_NAMECODE of '628' (i.e. 'Water Level - Manual - Static') and UNIT_CODE of '6' (i.e. 'masl') will be included.

V_GEN_WATERLEVEL_YEARLY

This view returns a combination of the data from V_GEN_WATERLEVEL_LOGGER_YEARLY and V_GEN_WATERLEVEL_MANUAL_YEARLY (as described above).  Note that the source of calculations, here, is V_SYS_WATERLEVELS_YEARLY_BOTH.

V_GEN_WATER_FOUND

This view returns the records from D_GEOLOGY_FEATURE where the top elevation is not null and the FEATURE_CODE is any of:

    - WATER FOUND - FRESH (i.e. '1')
    - WATER FOUND - SALTY (i.e. '2')
    - WATER FOUND - SULPHUR (i.e. '3')
    - WATER FOUND - MINERIAL (i.e. '4')
    - WATER FOUND - NOT STATED (i.e. '5')
    - WATER FOUND - GAS (i.e. '6')
    - WATER FOUND - IRON (i.e. '7')
    - WATER FOUND - Untested (i.e. '8')

Note that these, in general, relate to the original MOE records.

V_GEN_WATER_LEVEL

This view extracts all records from D_INTERVAL_TEMPORAL_2 that have a RD_NAME_CODE of '628' (i.e. 'Water Level - Manual - Static') or '629' (i.e. 'Water Level - Logger (Compensated & Corrected)').

V_GEN_WATER_LEVEL_AVG

This view returns the calculated average water level and number of records for each interval; note that V_GEN_WATER_LEVEL (above) is used as the source.

V_GEN_WATER_LEVEL_AVG_DAILY

This view returns the calculated daily average water level and number of records from D_INTERVAL_TEMPORAL_2 for each interval and day of record; similar to V_GEN_WATERLEVEL_YEARLY_BOTH (above) it uses manual and logger water level data as the source.  The lowest SYS_RECORD_ID value is also included.  Note that the RD_NAME_CODE of '645' (i.e. 'Water Level - Logger - Calc - Average Daily') is substituted instead of the original codes.

V_GEN_WATER_LEVEL_AVG_DAILY_LOGGER

This view returns the calculated daily average water level and number of records from D_INTERVAL_TEMPORAL_2 for each interval and day of record; similar to V_GEN_WATERLEVEL_LOGGER_YEARLY (above) it uses only logger water level data as the source.  Refer to V_GEN_WATER_LEVEL_AVG_DAILY (above) for additional details.

V_GEN_WATER_LEVEL_OTHER

This view extracts all water level records from D_INTERVAL_TEMPORAL_2 whose RD_NAME_CODE is associated with READING_GROUP_CODE '23' (i.e. 'Water Level') with the exception of RD_NAME_CODE's '628 (i.e. 'Water Level - Manual - Static') and '629' (i.e. 'Water Level - Logger (Compensated & Corrected)').

V_GROUP_INTERVAL

This view returns the number of intervals associated with a particular interval group.  The descriptive text for the interval groups and interval group types are included.  Note that empty (i.e. non-assigned) groups will also be included.

V_GROUP_LOCATION

This view returns the number of locations associated with a particular location group.  The descriptive text for the location groups and location group types are included.  Note that empty (i.e. non-assigned) groups will also be included.

V_QA_NEW_BOREHOLE

This view returns all 'new' records from the D_BOREHOLE table; this corresponds to any record entered into the database within the last 60 days.  The SYS_TIME_STAMP field is used as the date reference.

V_QA_NEW_D_INTERVAL

This view returns all 'new' records from the D_INTERVAL table.  Refer to V_QA_NEW_BOREHOLE (above) for additional details.

V_QA_NEW_D_LOCATION

This view returns all 'new' records from the D_LOCATION table.  Refer to V_QA_NEW_D_BOREHOLE (above) for additional details.

V_SUM_FIELD_LAB_VALUES

This view returns the summary of laboratory records (from D_INTERVAL_TEMPORAL_1A/1B) and field records (from D_INTERVAL_TEMPORAL_2) for all intervals.  The range of dates for each is indicated as well as the number of records.  Each of V_SUM_FIELD_VALUES and V_SUM_LAB_SAMPLES (see below) are used as a source.

V_SUM_FIELD_VALUES

This view returns the summary of field records (from D_INTERVAL_TEMPORAL_2) for all intervals.  The range of dates is indicated as well as the number of records.

V_SUM_INT_TYPE_COUNTS

This view returns the total number of intervals by interval type (see R_INT_TYPE_CODE) as found in D_INTERVAL.  Note that empty interval types will be indicated.  This view is used to (partially) populate D_VERSION_STATUS on a semi-regular basis.

V_SUM_LAB_SAMPLES

This view returns the summary of laboratory records (From D_INTERVAL_TEMPORAL_1A/1B) for all intervals.  The range of dates is indicated as is the number of samples as well as the number of individual values.

V_SUM_LOC_TYPE_COUNTS

This view returns the total number of locations by location type (see R_LOC_TYPE_CODE) as found in D_LOCATION.  Note that empty location types will be indicated.  This view is used to (partially) populate D_VERSION_STATUS on a semi-regular basis.

V_SUM_READING_GROUP_COUNTS

This view returns the total number of readings by reading group code (see R_RD_NAME_CODE and R_READING_GROUP_CODE) as found in D_INTERVAL_TEMPORAL_1B and D_INTERVAL_TEMPORAL_2.  The source for the particular record (i.e. from which of the temporal tables) is indicated by a '(DIT1)' or '(DIT2)' being appended to the reading group name.  Note that empty reading groups will not be indicated.  This view is used to (partially) populate D_VERSION_STATUS on a semi-regular basis.

This view should also be used as a quality check with regard to the appropriateness of data records residing in a particular temporal table (e.g. water level records should not occur in D_INTERVAL_TEMPORAL_1A/1B).

V_SUM_SCREEN_COUNTS

This view returns the number of screens by screen type present in the database.  Note that D_INTERVAL_MONITOR is used to delimit the intervals instead of reliance upon the INT_TYPE_CODE.

V_SUM_STATION_CLIMATE_PRECIP

This view returns the total precipitation (and record count) by year for each interval.  Note that only those records with an RD_NAME_CODE of '551' (i.e. 'Precipitation - Daily Total') will be included.  The source data is found in D_INTERVAL_TEMPORAL_3.

V_SUM_STATION_CLIMATE_RAINFALL

This view returns the total rainfall (and record count) by year for each interval.  Note that only those records with an RD_NAME_CODE of '549' (i.e. 'Rainfall (Daily Total)') will be included.  The source data is found in D_INTERVAL_TEMPORAL_3.

V_SUM_STATION_CLIMATE_SNOWFALL

This view returns the total snowfall (and record count) by year for each interval.  Note that only those records with an RD_NAME_CODE of '550' (i.e. 'Snowfall (Daily Total)') will be included.  The source data is found in D_INTERVAL_TEMPORAL_3.

V_SUM_STATION_CLIMATE_TEMP

This returns the minimum, maximum and average temperature (as well as the record count) by year for each interval.  Note that only those records with an RD_NAME_CODE of '548' (i.e. 'Temperature (Air) - Daily Mean') will be included.  The source data is found in D_INTERVAL_TEMPORAL_3.

V_SUM_SURFACE_WATER_FIELD

This view returns the yearly minimum, maximum and record count values for LOC_TYPE_CODE '6' (i.e. 'Surface Water') and the interval types (INT_TYPE_CODE)

    - Surface Water Flow Gauge ('4')
    - Surface Water Spot Flow ('10')
    - Surface Water Spot Stage Elevation ('14')

Note that this does not include the any of the calculated baseflow RD_NAME_CODE's (i.e. codes '1002' through '1013').  If multiple UNIT_CODE's occur in the database, these will appear as multiple rows.

V_VL_BOREHOLES

This view returns the information necessary for Viewlog to plot and interact with boreholes when working with cross-sections.

V_VL_GEO_GSC

This view returns the information necessary or Viewlog to plot and interact with boreholes when working with cross-sections.  In particular, the GSC interpreted description of the geologic layer material (as well as its top and bottom elevations) are returned.  This description is converted to uppercase.

V_VL_GEO_MAT123

This view returns the information necessary for Viewlog to plot and interact with boreholes when working with cross-sections.  This is similar to V_VL_GEOLOGY with the exception that the GSC description is included (if available).  Additional fields are included from D_GEOLOGY_LAYER.

V_VL_GEOLOGY

This view returns the information necessary for Viewlog to plot and interact with boreholes when working with cross-sections.  In particular, the three possible materials for each geologic layer as well as their top and bottom elevations are returned.  The descriptive text is converted to uppercase.  

V_VL_HEADER_LOG

This view returns the information necessary for Viewlog to plot and interact with boreholes.  In particular, this view is used to populate a single borehole page for inclusion in reports.

V_VL_HEADER_SCREEN

This view returns the information necessary for Viewlog to plot and interact with boreholes when working with cross-sections.  In particular, top and bottom elevations for screens are returned for applicable locations; the TEXT field (name) must be populated with 'SCREEN'.

Section 2.1.6 System Views

These views are not meant for the general user.  Instead, many of the views found in Section 2.1.5 use these as sources for accessing the data (D_*) and reference (R_*) information within the database.  In addition, most of these will not remove the complexities of the table and field information and will rely upon the user having a certain familiarity with the database and the ability to write SQL code to manipulate it.

These include:

    - V_SYS_AGENCY_BARRIE
    - V_SYS_AGENCY_BARRIE_ALL
    - V_SYS_AGENCY_CLOCA
    - V_SYS_AGENCY_CLOCA_ALL
    - V_SYS_AGENCY_CLOCA_DLS
    - V_SYS_AGENCY_CLOCA_NOBUF
    - V_SYS_AGENCY_CVC
    - V_SYS_AGENCY_CVC_ALL
    - V_SYS_AGENCY_CVC_DLS
    - V_SYS_AGENCY_CVC_NOBUF
    - V_SYS_AGENCY_DURHAM
    - V_SYS_AGENCY_DURHAM_ALL
    - V_SYS_AGENCY_DURHAM_DLS
    - V_SYS_AGENCY_DURHAM_NOBUF
    - V_SYS_AGENCY_GRCA
    - V_SYS_AGENCY_GRCA_ALL
    - V_SYS_AGENCY_GRCA_DLS
    - V_SYS_AGENCY_GRCA_NOBUF
    - V_SYS_AGENCY_HALTON
    - V_SYS_AGENCY_HALTON_ALL
    - V_SYS_AGENCY_HALTON_DLS
    - V_SYS_AGENCY_HALTON_NOBUF
    - V_SYS_AGENCY_KCA
    - V_SYS_AGENCY_KCA_ALL
    - V_SYS_AGENCY_KCA_DLS
    - V_SYS_AGENCY_KCA_NOBUF
    - V_SYS_AGENCY_LSRCA
    - V_SYS_AGENCY_LSRCA_ALL
    - V_SYS_AGENCY_LSRCA_DLS
    - V_SYS_AGENCY_LSRCA_NOBUF
    - V_SYS_AGENCY_LTRCA
    - V_SYS_AGENCY_LTRCA_ALL
    - V_SYS_AGENCY_LTRCA_DLS
    - V_SYS_AGENCY_LTRCA_NOBUF
    - V_SYS_AGENCY_NVCA
    - V_SYS_AGENCY_NVCA_ALL
    - V_SYS_AGENCY_NVCA_DLS
    - V_SYS_AGENCY_NVCA_NOBUF
    - V_SYS_AGENCY_ORCA
    - V_SYS_AGENCY_ORCA_ALL
    - V_SYS_AGENCY_ORCA_DLS
    - V_SYS_AGENCY_ORCA_NOBUF
    - V_SYS_AGENCY_ORMGP
    - V_SYS_AGENCY_ORMGP_ALL
    - V_SYS_AGENCY_ORMGP_LARGE
    - V_SYS_AGENCY_PEEL
    - V_SYS_AGENCY_PEEL_ALL
    - V_SYS_AGENCY_PEEL_DLS
    - V_SYS_AGENCY_PEEL_NOBUF
    - V_SYS_AGENCY_SWP_CTC_DLS
    - V_SYS_AGENCY_SWP_CTC_NOBUF
    - V_SYS_AGENCY_SWP_LS_DLS
    - V_SYS_AGENCY_SWP_LS_NOBUF
    - V_SYS_AGENCY_SWP_TRENT_DLS
    - V_SYS_AGENCY_SWP_TRENT_NOBUF
    - V_SYS_AGENCY_TORONTO
    - V_SYS_AGENCY_TORONTO_ALL
    - V_SYS_AGENCY_TORONTO_DLS
    - V_SYS_AGENCY_TORONTO_NOBUF
    - V_SYS_AGENCY_TRCA
    - V_SYS_AGENCY_TRCA_ALL
    - V_SYS_AGENCY_TRCA_DLS
    - V_SYS_AGENCY_TRCA_NOBUF
    - V_SYS_AGENCY_YORK
    - V_SYS_AGENCY_YORK_ALL
    - V_SYS_AGENCY_YORK_DLS
    - V_SYS_AGENCY_YORK_NOBUF
    - V_SYS_AGENCY_YPDT
    - V_SYS_AGENCY_YPDT_ALL
    - V_SYS_AREA_CA
    - V_SYS_AREA_GEOMETRY_WKB
    - V_SYS_AREA_REGION
    - V_SYS_AREA_SWP
    - V_SYS_BH_BEDROCK_ELEV
    - V_SYS_BH_CASING_SUMMARY
    - V_SYS_BH_DIAMETER_ALL
    - V_SYS_CHK_ALIAS_NAME
    - V_SYS_CHK_ALIAS_NAME_MOE_TAG
    - V_SYS_CHK_BH_BEDROCK_ASSIGNED
    - V_SYS_CHK_BH_BEDROCK_ASSIGNED_ANY
    - V_SYS_CHK_BH_BEDROCK_ASSIGNED_GRANITE
    - V_SYS_CHK_BH_BEDROCK_ASSIGNED_OTHER
    - V_SYS_CHK_BH_BEDROCK_ASSIGNED_SANDSTONE
    - V_SYS_CHK_BH_BEDROCK_ASSIGNED_SHALE
    - V_SYS_CHK_BH_BEDROCK_ELEV_RANGE
    - V_SYS_CHK_BH_CASING_BOTTOM_MAX
    - V_SYS_CHK_BH_CONS_BOTTOM_MAX
    - V_SYS_CHK_BH_CONS_TOP_MAX
    - V_SYS_CHK_BH_DEPTH
    - V_SYS_CHK_BH_DEPTH_BASE
    - V_SYS_CHK_BH_ELEV
    - V_SYS_CHK_BH_ELEV_BASE
    - V_SYS_CHK_BH_ELEV_BASE_UPDATE
    - V_SYS_CHK_BH_ELEV_BOT_ELEV
    - V_SYS_CHK_BH_ELEV_BOT_ELEV_DEPTH_EMPTY
    - V_SYS_CHK_BH_ELEV_MISSING
    - V_SYS_CHK_CORR_DEPTH_DBC_FBGS
    - V_SYS_CHK_CORR_DEPTH_DBORE_FBGS
    - V_SYS_CHK_CORR_DEPTH_DGF_FBGS
    - V_SYS_CHK_CORR_DEPTH_DGL_FBGS
    - V_SYS_CHK_CORR_DEPTH_DIM_FBGS
    - V_SYS_CHK_CORR_DEPTH_DIT2_FBGS
    - V_SYS_CHK_CORR_DEPTH_DPICK_FBGS
    - V_SYS_CHK_CORR_ELEV_CMP
    - V_SYS_CHK_CORR_ELEV_CMP_UNQ
    - V_SYS_CHK_CORR_ELEV_D2
    - V_SYS_CHK_CORR_ELEV_DBC
    - V_SYS_CHK_CORR_ELEV_DBORE
    - V_SYS_CHK_CORR_ELEV_DGF
    - V_SYS_CHK_CORR_ELEV_DGL
    - V_SYS_CHK_CORR_ELEV_DIM
    - V_SYS_CHK_CORR_ELEV_DIRE
    - V_SYS_CHK_CORR_ELEV_DIS
    - V_SYS_CHK_CORR_ELEV_DPICK
    - V_SYS_CHK_CORR_ELEV_TAG
    - V_SYS_CHK_CORR_WLS_BARO
    - V_SYS_CHK_DGEOM_ELEV
    - V_SYS_CHK_DGL_COUNTS
    - V_SYS_CHK_DGL_DEPTHS_MOE
    - V_SYS_CHK_DGL_ELEV_OUOM
    - V_SYS_CHK_DGL_ELEVS
    - V_SYS_CHK_DGL_MAT1_DCR
    - V_SYS_CHK_DGL_MAT1_NULL_DCR
    - V_SYS_CHK_DGL_MULT_UNIT_OUOM
    - V_SYS_CHK_DGL_SINGLE_LIME
    - V_SYS_CHK_DGL_SINGLE_UNKN
    - V_SYS_CHK_DGL_SINGLE_UNKN_SFC
    - V_SYS_CHK_DGL_SINGLE_UNKN_SFC_NOPUMP
    - V_SYS_CHK_DGL_SINGLE_UNKN_SFC_NOPUMP_ABD
    - V_SYS_CHK_DGL_UNITS
    - V_SYS_CHK_DGL_UNITS_UPDATE
    - V_SYS_CHK_DIFA_CM2004_ADD
    - V_SYS_CHK_DIFA_CM2004_REMOVE
    - V_SYS_CHK_DIFA_DM2007_ADD
    - V_SYS_CHK_DIFA_DM2007_REMOVE
    - V_SYS_CHK_DIFA_ECM2006_ADD
    - V_SYS_CHK_DIFA_ECM2006_REMOVE
    - V_SYS_CHK_DIFA_EM2010_ADD
    - V_SYS_CHK_DIFA_EM2010_REMOVE
    - V_SYS_CHK_DIFA_GL_CHANSAND_CM2004_THICK
    - V_SYS_CHK_DIFA_GL_CHANSAND_YT32011_THICK
    - V_SYS_CHK_DIFA_GL_OAKRIDGES_CM2004_THICK
    - V_SYS_CHK_DIFA_GL_OAKRIDGES_WB2018_THICK
    - V_SYS_CHK_DIFA_GL_OAKRIDGES_YT32011_THICK
    - V_SYS_CHK_DIFA_GL_SCARBOROUGH_CM2004_THICK
    - V_SYS_CHK_DIFA_GL_SCARBOROUGH_WB2018_THICK
    - V_SYS_CHK_DIFA_GL_SCARBOROUGH_YT32011_THICK
    - V_SYS_CHK_DIFA_GL_THORNCLIFFE_CM2004_THICK
    - V_SYS_CHK_DIFA_GL_THORNCLIFFE_WB2018_THICK
    - V_SYS_CHK_DIFA_GL_THORNCLIFFE_YT32011_THICK
    - V_SYS_CHK_DIFA_RM2004_ADD
    - V_SYS_CHK_DIFA_RM2004_REMOVE
    - V_SYS_CHK_DIFA_WB2018_ADD
    - V_SYS_CHK_DIFA_WB2018_REMOVE
    - V_SYS_CHK_DIFA_YT32011_ADD
    - V_SYS_CHK_DIFA_YT32011_REMOVE
    - V_SYS_CHK_DIRE
    - V_SYS_CHK_DLCH_ALL_ELEV_ID
    - V_SYS_CHK_DLCH_BH_ELEV_ID
    - V_SYS_CHK_DLSH_ELEV_UPD
    - V_SYS_CHK_DOC_AUTHOR_AGENCY
    - V_SYS_CHK_DOC_YN_FIELDS
    - V_SYS_CHK_DUP_DGEOLLAY
    - V_SYS_CHK_DUP_DGEOLLAY_DEL
    - V_SYS_CHK_DUP_DINT
    - V_SYS_CHK_DUP_DINT_ALT1
    - V_SYS_CHK_DUP_DINT_ALT1_DEL
    - V_SYS_CHK_DUP_DINT_DEL
    - V_SYS_CHK_DUP_DINT_DEL_MAX
    - V_SYS_CHK_DUP_DINTMON
    - V_SYS_CHK_DUP_DINTMON_DEL
    - V_SYS_CHK_DUP_DINTSOIL
    - V_SYS_CHK_DUP_DINTSOIL_DEL
    - V_SYS_CHK_DUP_DINTSOIL_DEL_MAX
    - V_SYS_CHK_DUP_DIRE
    - V_SYS_CHK_DUP_DIRE_DEL
    - V_SYS_CHK_DUP_DIT1AB
    - V_SYS_CHK_DUP_DIT1B_DEL
    - V_SYS_CHK_ELEV_DBORE
    - V_SYS_CHK_ELEV_DBORE_UPD
    - V_SYS_CHK_ELEV_DPICK
    - V_SYS_CHK_GEOL_LAY_BOT_ELEV_DEPTH
    - V_SYS_CHK_GEOL_LAY_ELEV
    - V_SYS_CHK_INT_ELEVS_DEPTHS
    - V_SYS_CHK_INT_ELEVS_DEPTHS_BH_MON_BOT_DIFF
    - V_SYS_CHK_INT_ELEVS_DEPTHS_BH_VS_MAX
    - V_SYS_CHK_INT_ELEVS_DEPTHS_BH_VS_MON_BOT
    - V_SYS_CHK_INT_ELEVS_DEPTHS_BH_VS_WL
    - V_SYS_CHK_INT_ELEVS_DEPTHS_MON_BOT_LT_0
    - V_SYS_CHK_INT_ELEVS_DEPTHS_MON_BOT_TOP
    - V_SYS_CHK_INT_ELEVS_DEPTHS_MON_M_LT_0
    - V_SYS_CHK_INT_MON_DEPTHS_M
    - V_SYS_CHK_INT_MON_ELEV_DEPTH
    - V_SYS_CHK_INT_REF_ELEV
    - V_SYS_CHK_INT_REF_ELEV2
    - V_SYS_CHK_INT_REF_ELEV2_DIT2
    - V_SYS_CHK_INT_REF_ELEV2_DIT2_DEPTHS
    - V_SYS_CHK_INT_REF_ELEV2_ERR
    - V_SYS_CHK_INT_REF_ELEV_CURRENT
    - V_SYS_CHK_INT_REF_ELEV_DIT2
    - V_SYS_CHK_INT_REF_ELEV_DIT2_DEPTHS
    - V_SYS_CHK_INT_REF_OFFSET
    - V_SYS_CHK_INT_SOIL_DEPTHS_M
    - V_SYS_CHK_INT_SUM_ADD
    - V_SYS_CHK_INT_SUM_REMOVE
    - V_SYS_CHK_INT_TMP1_DUPLICATES
    - V_SYS_CHK_INT_TMP1_DUPLICATES_DEL_SRI
    - V_SYS_CHK_INT_TMP1_DUPLICATES_NUM
    - V_SYS_CHK_INT_TMP1_DUPLICATES_NUM_DEL
    - V_SYS_CHK_INT_TMP1_UNITS
    - V_SYS_CHK_INT_TMP1A_SAID
    - V_SYS_CHK_INT_TMP1A_SAMID
    - V_SYS_CHK_INT_TMP1B_MOVE
    - V_SYS_CHK_INT_TMP1B_SAMID
    - V_SYS_CHK_INT_TMP2_DUPLICATES
    - V_SYS_CHK_INT_TMP2_DUPLICATES_DEL_SRI
    - V_SYS_CHK_INT_TMP2_DUPLICATES_NUM
    - V_SYS_CHK_INT_TMP2_DUPLICATES_NUM_DEL
    - V_SYS_CHK_INT_TMP2_SOIL
    - V_SYS_CHK_INT_TMP5_DUPLICATES
    - V_SYS_CHK_INT_TMP5_DUPLICATES_DEL_SRI
    - V_SYS_CHK_LOC_ADDRESS
    - V_SYS_CHK_LOC_COORDS
    - V_SYS_CHK_LOC_COORDS_CHECK
    - V_SYS_CHK_LOC_COORDS_CHECK_UPDATE
    - V_SYS_CHK_LOC_COORDS_CURR
    - V_SYS_CHK_LOC_COORDS_HIST
    - V_SYS_CHK_LOC_COORDS_HIST_CURRENT_COUNT
    - V_SYS_CHK_LOC_COORDS_HIST_LIST
    - V_SYS_CHK_LOC_ELEV
    - V_SYS_CHK_LOC_ELEV_ASSIGNED_ALL
    - V_SYS_CHK_LOC_ELEV_BH_ELEV
    - V_SYS_CHK_LOC_ELEV_BH_ELEV_MOD
    - V_SYS_CHK_LOC_ELEV_MISSING
    - V_SYS_CHK_LOC_ELEV_MISSING_DEM_GEOM
    - V_SYS_CHK_LOC_ELEV_MISSING_GEOM
    - V_SYS_CHK_LOC_ELEV_MISSING_LIST
    - V_SYS_CHK_LOC_ELEV_MISSING_LIST_QA
    - V_SYS_CHK_LOC_ELEV_SURV_NULL
    - V_SYS_CHK_LOC_GEOM_ADD
    - V_SYS_CHK_LOC_GEOM_CHANGE
    - V_SYS_CHK_LOC_GEOM_COORD_CHECK
    - V_SYS_CHK_LOC_GEOM_COORD_CHECK_REVIEW
    - V_SYS_CHK_LOC_GEOM_REMOVE
    - V_SYS_CHK_LOC_GEOM_WKB_UPDATE
    - V_SYS_CHK_LOC_SUM_ADD
    - V_SYS_CHK_LOC_SUM_REMOVE
    - V_SYS_CHK_MOE_WELL_ID_ATAG
    - V_SYS_CHK_MOE_WELL_ID_DUP
    - V_SYS_CHK_MOE_WELL_ID_DUP_UPD
    - V_SYS_CHK_MOE_WELL_ID_DUP_UPD2
    - V_SYS_CHK_MOE_WELL_ID_DUP_UPD3
    - V_SYS_CHK_MOE_WELL_ID_DUP_UPD4
    - V_SYS_CHK_MOE_WELL_ID_DUP_UPD5
    - V_SYS_CHK_MOE_WELL_ID_DUP_UPD6
    - V_SYS_CHK_MOE_WELL_ID_DUP_UPD7
    - V_SYS_CHK_MOE_WELL_ID_LON
    - V_SYS_CHK_MON_BOT_GT_BOT_ELEV
    - V_SYS_CHK_PARAM_UNITS_DIT1B
    - V_SYS_CHK_PARAM_UNITS_DIT1B_MGL
    - V_SYS_CHK_PARAM_UNITS_DIT1B_UGL
    - V_SYS_CHK_PICK_ABOVE_GND_BELOW_BOT
    - V_SYS_CHK_PICK_ELEV
    - V_SYS_CHK_PICK_ELEV_CMP
    - V_SYS_CHK_PICK_ELEV_CMP_BEDROCK
    - V_SYS_CHK_PICK_ELEV_CMP_CHANAQUIFER
    - V_SYS_CHK_PICK_ELEV_CMP_CHANAQUITARD
    - V_SYS_CHK_PICK_ELEV_CMP_HALTON
    - V_SYS_CHK_PICK_ELEV_CMP_LATESTAG
    - V_SYS_CHK_PICK_ELEV_CMP_MISORAC
    - V_SYS_CHK_PICK_ELEV_CMP_NEWMARKINT
    - V_SYS_CHK_PICK_ELEV_CMP_NEWMARKLOW
    - V_SYS_CHK_PICK_ELEV_CMP_NEWMARKUPP
    - V_SYS_CHK_PICK_ELEV_CMP_SCARBOROUGH
    - V_SYS_CHK_PICK_ELEV_CMP_SUNNYBROOK
    - V_SYS_CHK_PICK_ELEV_CMP_THORNCLIFFE
    - V_SYS_CHK_PICK_ORIG_GND_ELEV
    - V_SYS_CHK_PICK_ORIG_GND_ELEV_DIFF
    - V_SYS_CHK_SCREEN_ASSUMED
    - V_SYS_CHK_SEARCH
    - V_SYS_CHK_SEARCH_XYR
    - V_SYS_CHK_SPEC_CAP_CALC
    - V_SYS_CHK_WL_LOGGER
    - V_SYS_CHK_WL_MIN_GT_BOT_ELEV
    - V_SYS_CHK_WL_OUOM_CORR
    - V_SYS_CHK_WL_RUO_REF_ELEV
    - V_SYS_CHK_WL_STATIC
    - V_SYS_CHK_WL_STATIC_CMP
    - V_SYS_CHK_WLS_GEOL_UNIT_RD_UNIT
    - V_SYS_CLIMATE_MARK_ACTIVE
    - V_SYS_CONST_ELEV_RANGE
    - V_SYS_DATETIME_STR
    - V_SYS_DBLIST_FIELDS
    - V_SYS_DBLIST_FIELDS_INFO
    - V_SYS_DBLIST_FIELDS_MISSING
    - V_SYS_DBLIST_TABLES
    - V_SYS_DBLIST_TABLES_MISSING
    - V_SYS_DBLIST_TABLES_REMOVED
    - V_SYS_DBLIST_VIEWS
    - V_SYS_DBLIST_VIEWS_MISSING
    - V_SYS_DBLIST_VIEWS_REMOVED
    - V_SYS_DGF_TOP_FEATURE
    - V_SYS_DGL_TOTAL_GEOL_MAT1
    - V_SYS_DGL_TOTAL_GEOL_MAT1_MAX
    - V_SYS_DGL_TOTAL_GRAVEL
    - V_SYS_DGL_TOTAL_SAND_GRAVEL
    - V_SYS_DIFA_ASSIGNED_FINAL
    - V_SYS_DIFA_GL
    - V_SYS_DIFA_GL_ASSIGN
    - V_SYS_DIFA_GL_CHANSAND
    - V_SYS_DIFA_GL_CHANSAND_CM2004
    - V_SYS_DIFA_GL_CHANSAND_YT32011
    - V_SYS_DIFA_GL_MOD_CM2004
    - V_SYS_DIFA_GL_MOD_WB2018
    - V_SYS_DIFA_GL_MOD_YT32011
    - V_SYS_DIFA_GL_OAKRIDGES
    - V_SYS_DIFA_GL_OAKRIDGES_CM2004
    - V_SYS_DIFA_GL_OAKRIDGES_WB2018
    - V_SYS_DIFA_GL_OAKRIDGES_YT32011
    - V_SYS_DIFA_GL_SCARBOROUGH
    - V_SYS_DIFA_GL_SCARBOROUGH_CM2004
    - V_SYS_DIFA_GL_SCARBOROUGH_WB2018
    - V_SYS_DIFA_GL_SCARBOROUGH_YT32011
    - V_SYS_DIFA_GL_THORNCLIFFE
    - V_SYS_DIFA_GL_THORNCLIFFE_CM2004
    - V_SYS_DIFA_GL_THORNCLIFFE_WB2018
    - V_SYS_DIFA_GL_THORNCLIFFE_YT32011
    - V_SYS_DIFAF_ASSIGN
    - V_SYS_DIT1_INT_PAR_DAY
    - V_SYS_DIT_COUNTS
    - V_SYS_DOC_BH_NONMOE_LOCNS
    - V_SYS_DOC_REPLIB_ENTRY
    - V_SYS_ELEV_ASSIGNED
    - V_SYS_ELEV_ASSIGNED_ALL
    - V_SYS_ELEV_ASSIGNED_UPDATE
    - V_SYS_ELEV_DEM_MNR_V2
    - V_SYS_ELEV_DEM_SRTM_V41
    - V_SYS_ELEV_ORIGINAL
    - V_SYS_ELEV_SURVEYED
    - V_SYS_ELEV_SURVEYED_DURHAM
    - V_SYS_EXAMPLE_SHEET_A_LOCATION
    - V_SYS_EXAMPLE_SHEET_B_BOREHOLE
    - V_SYS_EXAMPLE_SHEET_C_GEOLOGY
    - V_SYS_EXAMPLE_SHEET_D_SCREEN
    - V_SYS_EXAMPLE_SHEET_D_SCREEN_AND_SOIL
    - V_SYS_EXAMPLE_SHEET_D_SOIL
    - V_SYS_EXAMPLE_SHEET_E_LAB_DATA
    - V_SYS_EXAMPLE_SHEET_F_FIELD_DATA
    - V_SYS_FIELD_WATERLEVELS_DAILY
    - V_SYS_FIELD_WATERLEVELS_YEARLY
    - V_SYS_GEN_BH_INT_MUNIC_WELL
    - V_SYS_GEN_BH_INT_MUNIC_WELL_CHANNEL
    - V_SYS_GEN_BH_INT_MUNIC_WELL_DEEP
    - V_SYS_GEN_BH_INT_MUNIC_WELL_SHALLOW
    - V_SYS_GEN_LAB_SAMPLES_ISOTOPES
    - V_SYS_GEN_LAB_STANDARD
    - V_SYS_GEN_LOC_INFO
    - V_SYS_GEN_WL_AVERAGE
    - V_SYS_GEN_WL_AVERAGE_DEEP
    - V_SYS_GEN_WL_AVERAGE_DEEP_BR
    - V_SYS_GEN_WL_AVERAGE_DEEP_NBR
    - V_SYS_GEN_WL_AVERAGE_MID
    - V_SYS_GEN_WL_AVERAGE_SHALLOW
    - V_SYS_GEN_WL_AVERAGE_SHALLOW_MOD
    - V_SYS_GEN_WL_AVERAGE_UNIT_SCAR
    - V_SYS_GEN_WL_AVERAGE_UNIT_SHAL
    - V_SYS_GEN_WL_AVERAGE_UNIT_THORN
    - V_SYS_GENERAL
    - V_SYS_GENERAL_INTERVAL
    - V_SYS_GENERAL_INTERVAL_MON
    - V_SYS_GEOL_LAY_ELEVS
    - V_SYS_GEOL_LAY_ELEVS_BH
    - V_SYS_GEOL_LAY_TOP_BOT_M
    - V_SYS_GEOL_LAY_UNIT_OUOM
    - V_SYS_GEOL_LAYER_COUNT
    - V_SYS_GEOL_LOCATION
    - V_SYS_GEOL_UNIT_CHANNEL
    - V_SYS_GEOL_UNIT_DEEP
    - V_SYS_GEOL_UNIT_LNT
    - V_SYS_GEOL_UNIT_SHALLOW
    - V_SYS_GEOM_BOREHOLE
    - V_SYS_GW_KNOWLEDGE
    - V_SYS_INT_MON_COORDS
    - V_SYS_INT_MON_COORDS_FLOWING
    - V_SYS_INT_MON_DEPTHS_M
    - V_SYS_INT_MON_ELEVS
    - V_SYS_INT_MON_GEOL
    - V_SYS_INT_MON_MAX_MIN
    - V_SYS_INT_REF_ELEV_COUNT
    - V_SYS_INT_REF_ELEV_CURRENT
    - V_SYS_INT_REF_ELEV_RANGE
    - V_SYS_INT_SOIL_COORDS
    - V_SYS_INT_TYPE_CODE_DIFA
    - V_SYS_INT_TYPE_CODE_SCREEN
    - V_SYS_INT_WLS_MIN_LIST
    - V_SYS_INTERVAL_ELEV
    - V_SYS_LAB_CB_BASE
    - V_SYS_LAB_CB_BASE_SAID
    - V_SYS_LAB_CB_PERC
    - V_SYS_LAB_CB_PERC_FINAL
    - V_SYS_LAB_PARAM_COUNT
    - V_SYS_LAB_PARAM_MGL_COUNT
    - V_SYS_LAB_PARAM_WQ_AO
    - V_SYS_LAB_PARAM_WQ_AO_SUM
    - V_SYS_LAB_PARAM_WQ_MAC
    - V_SYS_LAB_PARAM_WQ_MAC_SUM
    - V_SYS_LAB_SAMPLES_ISOTOPES
    - V_SYS_LAB_WATER_TYPE_MHM
    - V_SYS_LAB_WATER_TYPE_MHM_AVG
    - V_SYS_LOC_COORD_HIST_ADD
    - V_SYS_LOC_COORDS
    - V_SYS_LOC_DATA_SOURCE
    - V_SYS_LOC_GEOMETRY
    - V_SYS_LOC_GEOMETRY_WKB
    - V_SYS_LOC_MET
    - V_SYS_LOC_MODEL_CM2004
    - V_SYS_LOC_MODEL_CM2004BUF
    - V_SYS_LOC_MODEL_DM2007
    - V_SYS_LOC_MODEL_DM2007BUF
    - V_SYS_LOC_MODEL_ECM2006
    - V_SYS_LOC_MODEL_ECM2006BUF
    - V_SYS_LOC_MODEL_EM2010
    - V_SYS_LOC_MODEL_EM2010BUF
    - V_SYS_LOC_MODEL_RM2004
    - V_SYS_LOC_MODEL_RM2004BUF
    - V_SYS_LOC_MODEL_WB2018
    - V_SYS_LOC_MODEL_YT32011
    - V_SYS_LOC_MON_MAX_MIN
    - V_SYS_LOC_SPAT_ADD
    - V_SYS_LOC_SPAT_ALL
    - V_SYS_LOC_SPAT_CURRENT
    - V_SYS_LOC_SPAT_HIST_ADD
    - V_SYS_LOC_SW
    - V_SYS_LOC_TYPE_FIND_ELEV
    - V_SYS_LOC_UPD_CHANGES
    - V_SYS_LOC_UPD_CHANGES_XY
    - V_SYS_LOC_UPD_COORDS_XY
    - V_SYS_LOC_UPD_DIT
    - V_SYS_LOC_UPD_DIT_XY
    - V_SYS_LOC_UPD_NEW
    - V_SYS_LOC_UPD_NEW_XY
    - V_SYS_MJF_DEEPEST_NON-ROCK_UNIT
    - V_SYS_MJF_DEEPEST_NON-ROCK_UNIT_WITHOUT_BR_PICKS
    - V_SYS_MJF_GEO_LOC_NO-BR-PICK
    - V_SYS_MJF_GEO_LOC_RESTRICTED
    - V_SYS_MJF_GEO_PICKS_BEDROCK_TOP
    - V_SYS_MJF_GEOL_ROCK_LAYER_COUNT
    - V_SYS_MJF_LOC_QA>5
    - V_SYS_MJF_PRECAMBRIAN_TOP
    - V_SYS_MOE_ALL
    - V_SYS_MOE_BORE_HOLE_ID
    - V_SYS_MOE_CLUSTER_ALL
    - V_SYS_MOE_CLUSTER_MASTER
    - V_SYS_MOE_DATA_ID
    - V_SYS_MOE_DATA_ID_COUNT
    - V_SYS_MOE_LOCATIONS
    - V_SYS_MOE_LOCATIONS_FIRST
    - V_SYS_MOE_WELL
    - V_SYS_MOE_WELL_ID
    - V_SYS_MOE_WELL_ID_DLA
    - V_SYS_MOE_WELL_ID_DLA_DUP
    - V_SYS_MOE_WELL_ID_DLA_FIRST
    - V_SYS_NAME
    - V_SYS_NAME_ALL
    - V_SYS_NAME_INTERVAL
    - V_SYS_NAME_LOCATION
    - V_SYS_NAME_MAIN
    - V_SYS_NAME_STUDY_AREA
    - V_SYS_NAME_STUDY_AREA_ALL
    - V_SYS_ORMGP_DATA_SOURCE
    - V_SYS_ORMGP_MANUALS_DATA_SOURCE
    - V_SYS_ORMGP_MON_INTERVAL
    - V_SYS_ORMGP_MON_INTERVAL_NEW
    - V_SYS_ORMGP_MON_LOCATION
    - V_SYS_ORMGP_MON_LOCATION_NEW
    - V_SYS_PICK_ALL
    - V_SYS_PICK_BEDROCK_TOP
    - V_SYS_PICK_CHANNEL_AQUIFER_TOP
    - V_SYS_PICK_CHANNEL_AQUITARD_TOP
    - V_SYS_PICK_HALTON_TOP
    - V_SYS_PICK_LATE_STAGE_TOP
    - V_SYS_PICK_MIS_TOP
    - V_SYS_PICK_NEWMARKET_INTER_TOP
    - V_SYS_PICK_NEWMARKET_LOWER_TOP
    - V_SYS_PICK_NEWMARKET_UPPER_TOP
    - V_SYS_PICK_NORTHERN_NEWMARKET_TOP
    - V_SYS_PICK_ORAC_BOTTOM
    - V_SYS_PICK_ORAC_TOP
    - V_SYS_PICK_SCARBOROUGH_TOP
    - V_SYS_PICK_SUNNYBROOK_TOP
    - V_SYS_PICK_THORNCLIFFE_TOP
    - V_SYS_PICK_TOTAL_NUM
    - V_SYS_PICK_UNCONFORMITY_TOP
    - V_SYS_PICK_YORK_TOP
    - V_SYS_PTTW_EXPIRY_DATE_MAX
    - V_SYS_PTTW_FIND_PRESENT
    - V_SYS_PTTW_FIND_RELATED_ALL
    - V_SYS_PTTW_FIND_RELATED_NEW
    - V_SYS_PTTW_MARK_ACTIVE
    - V_SYS_PTTW_RELATED_ALL
    - V_SYS_PTTW_RELATED_PRIMARY
    - V_SYS_PTTW_SOURCE
    - V_SYS_PTTW_SOURCE_PERMIT_NUMS
    - V_SYS_PTTW_SOURCE_VOLUME
    - V_SYS_PTTW_VOLUME
    - V_SYS_PUMP_LATEST
    - V_SYS_PUMP_MOE_DRAWDOWN
    - V_SYS_PUMP_MOE_TEST
    - V_SYS_PUMP_MOE_TEST_DATES
    - V_SYS_PUMP_MOE_TEST_PWLS
    - V_SYS_PUMP_MOE_TEST_STWL
    - V_SYS_PUMP_MOE_TRANS
    - V_SYS_PUMP_MOE_TRANS_BR1985
    - V_SYS_PUMP_MOE_TRANS_CMP
    - V_SYS_PUMP_MOE_TRANS_SOURCE
    - V_SYS_PUMP_MOE_TRANS_SOURCE2
    - V_SYS_PUMP_MOE_TRANS_SOURCE2_BR1985
    - V_SYS_PUMP_MOE_TRANS_SOURCE_BR1985
    - V_SYS_PUMP_OFF_WATERLEVEL
    - V_SYS_PUMP_ON_WATERLEVEL
    - V_SYS_PUMP_TEST_RATE
    - V_SYS_PUMP_VOLUME_MONTHLY
    - V_SYS_PUMP_VOLUME_YEARLY
    - V_SYS_RANDOM_ID_001
    - V_SYS_RANDOM_ID_002
    - V_SYS_RANDOM_ID_003
    - V_SYS_RANDOM_ID_004
    - V_SYS_RANDOM_ID_005
    - V_SYS_RANDOM_ID_BULK_001
    - V_SYS_RANDOM_ID_BULK_002
    - V_SYS_RANDOM_ID_CLOCA
    - V_SYS_RANDOM_ID_CVC
    - V_SYS_RANDOM_ID_DURHAM
    - V_SYS_RANDOM_ID_GRCA
    - V_SYS_RANDOM_ID_KCA
    - V_SYS_RANDOM_ID_LSRCA
    - V_SYS_RANDOM_ID_LTRCA
    - V_SYS_RANDOM_ID_NVCA
    - V_SYS_RANDOM_ID_ORCA
    - V_SYS_RANDOM_ID_PEEL
    - V_SYS_RANDOM_ID_TORONTO
    - V_SYS_RANDOM_ID_TRCA
    - V_SYS_RANDOM_ID_YORK
    - V_SYS_RD_NAME_DESCRIPTION_ALL
    - V_SYS_RD_NAME_DESCRIPTION_ALL_LC
    - V_SYS_S_USER_ID_RANGES
    - V_SYS_SFLOW_YEARLY
    - V_SYS_SHYDROLOGY
    - V_SYS_SPEC_CAP_MOE_CALC
    - V_SYS_STAT_WLS_LOGGER
    - V_SYS_STAT_WLS_LOGGER_MED
    - V_SYS_STAT_WLS_LOGGER_MODE
    - V_SYS_STAT_WLS_LOGGER_MODE_RANGE
    - V_SYS_STAT_WLS_LOGGER_MODEC
    - V_SYS_STAT_WLS_MANUAL
    - V_SYS_STAT_WLS_MANUAL_MED
    - V_SYS_STAT_WLS_MANUAL_MODE
    - V_SYS_STAT_WLS_MANUAL_MODE_RANGE
    - V_SYS_STAT_WLS_MANUAL_MODEC
    - V_SYS_STATCOUNT_BOREHOLE
    - V_SYS_STATCOUNT_BOREHOLE_MOE
    - V_SYS_STATCOUNT_CHEM_ANALYSIS_PARA
    - V_SYS_STATCOUNT_CLIMATE_MEASURE
    - V_SYS_STATCOUNT_CLIMATE_STN
    - V_SYS_STATCOUNT_DOCUMENT
    - V_SYS_STATCOUNT_GEOLOGY_LAYER
    - V_SYS_STATCOUNT_OUTCROP
    - V_SYS_STATCOUNT_PUMP_RATE_MUNIC
    - V_SYS_STATCOUNT_SFC_WATER_MEASURE
    - V_SYS_STATCOUNT_SFC_WATER_STN
    - V_SYS_STATCOUNT_WATER_LEVEL
    - V_SYS_STATUS_INT_TYPE_CODE
    - V_SYS_STATUS_LOC_TYPE_CODE
    - V_SYS_STATUS_READING_GROUP_CODE
    - V_SYS_SUM_INT_TYPE_COUNTS
    - V_SYS_SUM_LOC_TYPE_COUNTS
    - V_SYS_SUM_READING_GROUP_COUNTS
    - V_SYS_SUMMARY_DEEPEST_SCREEN_TOP
    - V_SYS_SUMMARY_GEOL_LAYER_NUM
    - V_SYS_SUMMARY_MON_FLOWING
    - V_SYS_SUMMARY_MON_NUM
    - V_SYS_SUMMARY_PRECIP
    - V_SYS_SUMMARY_PUMP
    - V_SYS_SUMMARY_PUMP_DAILY_VOL
    - V_SYS_SUMMARY_PUMP_RATE
    - V_SYS_SUMMARY_SFLOW
    - V_SYS_SUMMARY_SOIL
    - V_SYS_SUMMARY_SOIL_GEOTECH
    - V_SYS_SUMMARY_SPEC_CAP
    - V_SYS_SUMMARY_TEMP_AIR
    - V_SYS_SUMMARY_WL
    - V_SYS_SUMMARY_WL_ALL
    - V_SYS_SUMMARY_WL_AVG
    - V_SYS_SUMMARY_WL_LOGGER
    - V_SYS_SUMMARY_WL_MANUAL
    - V_SYS_SUMMARY_WQ
    - V_SYS_SUMMARY_WQ_SAMPLES
    - V_SYS_SW_AGGREGATE
    - V_SYS_SW_GAUGE_MARK_ACTIVE
    - V_SYS_SW_LOCATION_FWIS
    - V_SYS_SW_SPOTFLOW_MARK_ACTIVE
    - V_SYS_UGAIS_ALL
    - V_SYS_UGAIS_LOCATION
    - V_SYS_UGAIS_SCREEN
    - V_SYS_UGAIS_SOIL
    - V_SYS_VERSION_CURRENT
    - V_SYS_W_GENERAL
    - V_SYS_W_GENERAL_DOCUMENT
    - V_SYS_W_GENERAL_GW_LEVEL_LOG
    - V_SYS_W_GENERAL_GW_LEVEL_MAN
    - V_SYS_W_GENERAL_LOC_MET
    - V_SYS_W_GENERAL_LOC_SW
    - V_SYS_W_GENERAL_OTHER
    - V_SYS_W_GENERAL_OTHER_AGG
    - V_SYS_W_GENERAL_OTHER_PTTW_ACTIVE
    - V_SYS_W_GENERAL_PICK
    - V_SYS_W_GENERAL_SCREEN
    - V_SYS_W_GENERAL_SCREEN_NEST
    - V_SYS_W_GEOLOGY_LAYER
    - V_SYS_WATERLEVELS_BARO_DAILY
    - V_SYS_WATERLEVELS_BARO_OUOM_YEARLY
    - V_SYS_WATERLEVELS_BARO_YEARLY
    - V_SYS_WATERLEVELS_MANUAL_FIRST
    - V_SYS_WATERLEVELS_RANGE
    - V_SYS_WATERLEVELS_YEARLY_AVG
    - V_SYS_WATERLEVELS_YEARLY_BOTH
    - V_SYS_WATERLEVELS_YEARLY_LOGGER
    - V_SYS_WATERLEVELS_YEARLY_MANUAL

V_SYS_AGENCY_*

Each partner agency and region (as well as the ORMGP study area and the 'Source Water Protection' - SWP - areas) have three views associated with them:

    - V_SYS_AGENCY_<partner agency>
        ? This view extracts all locations (i.e. the LOC_ID) that lie within the areal extent of the agency (plus a defined buffer); these locations must have valid coordinates (as defined by QA_COORD_CONFIDENCE_CODE) and are present in D_LOCATION_GEOM.   The ORMGP 'Viewlog Header Well' is included by default in this list.
    - V_SYS_AGENCY_<partner agency>_ALL
        ? This view includes all locations from V_SYS_AGENCY_<name> and adds all locations from D_DOCUMENT regardless of valid coordinates.
    - V_SYS_AGENCY_<partner agency>_NOBUF
        ? This view is similar to V_SYS_AGENCY_<name> but no buffer is added to the areal extent.

All of these views use the built-in spatial support of Microsoft SQL Server when checking the geometric location against the geometric area (refer to D_AREA_GEOM and D_LOCATION_GEOM).  Note that the 'SWP_*' areas only have a single view while the ORMGP area have two.

The names of the areal extents used for each partner agency are listed as follows (the buffered area first followed by the non-buffered area; the AREA_ID, from D_AREA_GEOM, is enclosed in quotes).

    - CLOCA
        ? CLOCA Boundary 5km Buffer ('2')
        ? CLOCA Boundary ('30')
    - CVC
        ? CVC Boundary 5km Buffer ('3')
        ? CVC Boundary ('32')
    - DURHAM
        ? Durham Boundary 5km Buffer ('13')
        ? Durham Boundary ('40')
    - GRCA
        ? GRCA Boundary 5km Buffer ('4')
        ? GRCA Boundary ('33')
    - KCA
        ? KCA Boundary 5km Buffer ('5')
        ? KCA Boundary ('34')
    - LSRCA
        ? LSRCA Boundary 5km Buffer ('6')
        ? LSRCA Boundary ('35')
    - LTRCA
        ? LTRCA Boundary 5km Buffer ('7')
        ? LTRCA Boundary ('36')
    - NVCA
        ? NVCA Boundary 5km Buffer ('8')
        ? NVCA Boundary ('37')
    - ORCA
        ? ORCA Boundary 5km Buffer ('9')
        ? ORCA Boundary ('38')
    - ORMGP
        ? ORMGP Boundary 20210205 (73)
        ? ORMGP Boundary 20210205 25km Buffer (70)
        ? ORMGP Boundary 20210205 5km Buffer (76)
    - PEEL
        ? Peel Boundary 5km Buffer ('14')
        ? Peel Boundary ('41')
    - SWP_CTC
        ? SWP-CTC Boundary ('44')
    - SWP_LS
        ? SWP-Lake Simcoe Boundary ('60')
    - SWP_TRENT
        ? SWP-Trent Boundary ('51')
    - TORONTO
        ? Toronto Boundary 5km Buffer ('15')
        ? Toronto Boundary ('42')
    - TRCA
        ? TRCA Boundary 20km Buffer ('61')
        ? TRCA Boundary ('39')
    - YORK
        ? York Boundary 5km Buffer ('16')
        ? York Boundary ('43')
    - YPDT
        ? YPDT-CAMC SWP Area - 20km Buffer ('62')

V_SYS_AREA_CA

This view returns the LOC_ID and AREA_ID for each location (as found in D_LOCATION_GEOM) when compared (using intersection) against the area polygons in D_AREA_GEOM.  This is only for the conservation authority partner agencies.  Note that this can be a slow process.

V_SYS_AREA_GEOMETRY_WKB

This view converts the AREA_GEOM in D_AREA_GEOM from a geometry type to a binary type.  The latter will be in 'Well Known Binary' (WKB) format -  this is supported by a number of external software packages.

V_SYS_AREA_REGION

This view returns the LOC_ID and AREA_ID for each location (as found in D_LOCATION_GEOM) when compared (using intersection) against the area polygons in D_AREA_GEOM.  This is only for the region partner agencies.  Note that this can be a slow process.

V_SYS_AREA_SWP

This view returns the LOC_ID and AREA_ID for each location (as found in D_LOCATION_GEOM) when compared (using intersection) against the area polygons in D_AREA_GEOM.  This is only for the 'Source Water Protection' (SWP) areas.  Note that this can be a slow process.

V_SYS_BASEFLOW_YEARLY

This view returns the yearly minimum, maximum, average and record count for all calculated baseflow readings for all intervals in D_INTERVAL_TEMPORAL_2.  This includes all RD_NAME_CODE's '1002' through '1013' as well as '70980'.

V_SYS_BH_BEDROCK_ELEV

This view returns the current bedrock elevation (if present) from D_BOREHOLE as well as calculating a new bedrock elevation from the geologic descriptions in D_GEOLOGY_LAYER.  Note that any material type assigned a '1' value for GEOL_MAT1_ROCK is considered bedrock for the purposes of this calculation.  In addition, a second value is calculated for the new bedrock elevation - this is limited to two decimal places (and is the value used for populated BH_BEDROCK_ELEV in D_BOREHOLE).

V_SYS_BH_CASING_SUMMARY

This view determines the minimum and maximum casing elevations and diameters (as well as the number of records) for each location in D_BOREHOLE.  Any diameters are also shown in inches.  This is limited to a CON_TYPE_CODE of '3' (i.e. 'Casing') in D_BOREHOLE_CONSTRUCTION.

V_SYS_CHK_ALIAS_NAME

This view checks for duplicate LOC_NAME_ALIAS text across multiple LOC_ID's (these cannot occur for the same LOC_ID - a built-in constraint prevents this).  This can be used to determine where multiple LOC_ID's actually refer to the same borehole/well (in particular, this can be easily applied against multiple MOE WWDB imports).  However, multiple aliases can occur for MOE nested wells; it could also occur by happenstance so an immediate problem should not be assumed.

V_SYS_CHK_ALIAS_NAME_MOE_TAG

This view uses V_SYS_CHK_ALIAS_NAME as a source, only extracting those rows that have a LOC_ALIAS_TYPE_CODE of '1' (i.e. 'MOE Tag Number').

V_SYS_CHK_BH_BEDROCK_ASSIGNED

This view uses each of V_SYS_BH_BEDROCK_ELEV, V_SYS_SUMMARY_GEOL_LAYER_NUM and D_GEOLOGY_LAYER as sources.  It returns the calculated bedrock elevation (where GEOL_MAT1_ROCK is '1' from R_GEOL_MAT1_CODE), the elevation of the next layer below this, the total number of geologic layers and the number of geologic layers below the calculated bedrock elevation (ERR_GEOL_LAYER_NUM) for a particular location.  Note that the subsequent layers cannot have a GEOL_MAT1_ROCK of '1' nor have a GEOL_MAT1_CODE of '0' (i.e. 'Unknown') or '105' (i.e. 'Refusal') and are not included if so.

V_SYS_CHK_BH_BEDROCK_ASSIGNED_ANY

This view, using V_SYS_CHK_BH_BEDROCK_ASSIGNED (above) as a base, returns information on the geologic layers below the calculated bedrock elevation.

V_SYS_CHK_BH_BEDROCK_ASSIGNED_GRANITE

This view, using V_SYS_CHK_BH_BEDROCK_ASSIGNED_ANY (above) as a base, returns rows that correspond to GEOL_MAT1_CODE of '21' (i.e. 'Granite').  Where non-rock subsequent layers exist, this is likely an error.  Additional fields are available to update D_GEOLOGY_LAYER (and remove the bedrock tag) if this is the case.

V_SYS_CHK_BH_BEDROCK_ASSIGNED_OTHER

This view, using V_SYS_CHK_BH_BEDROCK_ASSIGNED_ANY (above) as a base, returns rows that correspond to various GEOL_MAT1_DESCRIPTION's, including:

    - Greenstone ('22')
    - Basalt ('36')
    - Chert ('37')
    - Conglomerate ('38')
    - Feldspar ('39')
    - Flint ('40')
    - Gneiss ('41')
    - Greywacke ('42')
    - Marble ('45')
    - Quartz ('46')
    - Soapstone ('48')

Refer to V_SYS_CHK_BH_BEDROCK_ASSIGNED_GRANITE (above) for additional details.

V_SYS_CHK_BH_BEDROCK_ASSIGNED_SANDSTONE

This view, using V_SYS_CHK_BH_BEDROCK_ASSIGNED_ANY (above) as a base, returns rows that correspond to GEOL_MAT1_CODE of '18' (i.e. 'Sandstone').  Refer to V_SYS_CHK_BH_BEDROCK_ASSIGNED_GRANITE (above) for additional details.

V_SYS_CHK_BH_BEDROCK_ASSIGNED_SHALE

This view, using V_SYS_CHK_BH_BEDROCK_ASSIGNED_ANY (above) as a base, returns rows that correspond to GEOL_MAT1_CODE of '17' (i.e. 'Shale').  Refer to V_SYS_CHK_BH_BEDROCK_ASSIGNED_GRANITE (above) for additional details.

V_SYS_CHK_BH_BEDROCK_ELEV_RANGE

This view uses V_SYS_BH_BEDROCK_ELEV as a base.  It returns rows where the BH_BEDROCK_ELEV (from D_BOREHOLE) is not within +/- 0.001m of the 'new' calculated bedrock elevation or is NULL.

V_SYS_CHK_BH_CASING_BOTTOM_MAX

This view returns the deepest bottom-of-casing depth from D_BOREHOLE_CONSTRUCTION (where CON_TYPE_CODE is '3', i.e. 'CASING', from R_CON_TYPE_CODE).  The original 'units of measure' are returned but the depth is converted to 'metres' (from 'fbgs' as necessary).  Note that if the original units are not one of 'm', 'mbgs' or 'fbgs' then a '-9999' value is returned.

V_SYS_CHK_BH_CONS_BOTTOM_MAX

This view returns the deepest construction detail (bottom) depth from D_BOREHOLE_CONSTRUCTION.  Refer to V_SYS_CHK_BH_CASING_BOTTOM_MAX for additional details.

V_SYS_CHK_BH_CONS_TOP_MAX

This view returns the deepest construction detail (top) depth from D_BOREHOLE_CONSTRUCTION.  Refer to V_SYS_CHK_BH_CASING_BOTTOM_MAX for additional details.  This is used in the case when only a top depth is present to indicated maximum depth of a borehole.

V_SYS_CHK_BH_ELEV

This view returns a number of elevations associated with a borehole location where: BH_GND_ELEV is NULL; BH_DEM_GND_ELEV is NULL; or BH_GND_ELEV_OUOM is NULL.  These elevations can be used to populate the associated fields.  Note that all three fields in D_BOREHOLE should contain the same value; if BH_GND_ELEV is kept blank, SiteFX considers this row as 'new' data when re-calculating elevations.  The QA_COORD_CONFIDENCE_CODE must not be '117' (i.e. 'YPDT - Coordinate Invalid ?').

V_SYS_CHK_BH_ELEV_MISSING

This view returns borehole and location information where the BH_GND_ELEV and BH_GND_ELEV_OUOM is NULL and LOC_COORD_EASTING and LOC_COORD_NORTHING are not.

V_SYS_CHK_DGL_COUNTS

This view returns the number of geologic layers in D_GEOLOGY_LAYER as well as the number of these layers that consist only of whole numbers.  Likely, multiple rows of whole numbers for a particular location indicate that the row(s) should likely have the units 'fbgs' (or similar).

V_SYS_CHK_DGL_DEPTHS_MOE

This view returns information from D_GEOLOGY_LAYER where: the location is identified as from the MOE WWDB; the units for the row is identified as 'mbgs'; the values for the row are whole numbers; the GEOL_SUBCLASS_CODE is not '5' (i.e. 'Original (or Corrected)').  The MOE_PDF_LINK is incorporated from W_GENERAL.  A total number of geologic layers as well as the number of geologic layers whose depths are whole numbers is calculated.

V_SYS_CHK_DGL_MAT1_DCR

This view checks D_GEOLOGY_LAYER where the particular location has an INT_TYPE_CODE of '27' ('Decommissioned'; i.e. DCR) and returns the number of geologic layers whose materials match common 'fill' (i.e. well decommissioning) materials.  These include:

    - Clay ('5')
    - Fill ('1')
    - Gravel ('11')
    - Limestone ('28')
    - Stones ('12') 

The count of these layers as well as the count of the total number of geologic layers (from V_SYS_SUMMARY_GEOL_LAYER_NUM) is returned.  If these values match (or are close) then it's possible that the well is decommissioned (otherwise, it may be a valid well/borehole).  

V_SYS_CHK_DGL_MAT1_NULL_DCR

This view checks D_GEOLOGY_LAYER where the particular location has an INT_TYPE_CODE of '27' ('Decommissioned'; i.e. DCR) and returns the number of geologic layers where the GEOL_MAT1_CODE is NULL.  The total number of geologic layers (from V_SYS_SUMMARY_GEOL_LAYER_NUM) is returned as well.  If these values match, it's likely that the well is decommissioned.

V_SYS_CHK_DGL_MULT_UNIT_OUOM

This view examines the D_GEOLOGY_LAYER looking for rows, from a single location, where differing 'original units of measure' (OUOM) for depth have been used (i.e. the field GEOL_UNIT_OUOM).  These rows should subsequently be updated to a single measurement unit consistent for that location.  Note that this should be done before a number of the other V_SYS_CHK_DGL_* views are examined.

V_SYS_CHK_DGL_SINGLE_LIME

This view returns those locations where only a single geologic layer has been specified (using V_SYS_GEOL_LAY_UNIT_OUOM) and that layer material type has been specified as GEOL_MAT1_CODE '15' (i.e. 'Limestone').  Note that the GEOL_SUBCLASS_CODE (which is used to 'tag' those locations that have been checked and/or corrected) must have a NULL value.  This is used to determine those possible locations (generally from the MOE) where the original record is for decommissioning a well (and the limestone reference here is for 'limestone screenings' or gravel).  However, in many cases, a single record of limestone will be correct; this should be handled on a case-by-case basis.

V_SYS_CHK_DGL_SINGLE_UNKN

This view is similar to V_SYS_CHK_DGL_SINGLE_LIME (above) with the exception that GEOL_MAT1_CODE is '0' (i.e. 'Unknown').

V_SYS_CHK_DGL_SINGLE_UNKN_SFC

This view is similar to V_SYS_CHECK_DGL_SINGLE_UNKN; here, though, an additional check is made as to whether the layer is occurring at surface (i.e. GEOL_TOP_OUOM is '0').

V_SYS_CHK_DGL_SINGLE_UNKN_SFC_NOPUMP

This view is similar to V_SYS_CHK_DGL_SINGLE_UNKNOWN_SFC; here, though, an additional check is made as to whether there is any pumping information associated with this location.

V_SYS_CHK_DGL_SINGLE_UNKN_SFC_NOPUMP_ABD

This view is similar to V_SYS_CHK_DGL_SINGLE_UNKN_SFC_NOPUMP; here, though, an additional check is made as to whether the locations LOC_STATUS_CODE has a value of '3' (i.e. 'Abandoned').

V_SYS_CHK_DGL_UNITS

This view returns information from D_GEOLOGY_LAYER using locations (i.e. the LOC_ID) that appear in V_SYS_CHK_DGL_COUNTS.  This allows a check of the depth units for the complete geology at a particular location.

V_SYS_CHK_DOC_AUTHOR_AGENCY

This view assembles information from D_DOCUMENT where the DOC_AUTHOR_AGENCY_CODE is NULL (or the DOC_AUTHOR_AGENCY_DESCRIPTION is NULL).

V_SYS_CHK_DOC_YN_FIELDS

This view examines the D_DOCUMENT table, specifically the '*_YN' fields.  It reassigns all '0' values to NULL and all '-1' values to '1' (for consistency).  These values need to be reassigned back to the source table.

V_SYS_CHK_GEOL_LAY_BOT_ELEV_DEPTH

This view returns the deepest geologic layer elevation and calculated depth (for the latter, subtracting the smallest elevation value from the largest elevation value).

V_SYS_CHK_GEOL_LAY_ELEV

This view returns a subset of D_GEOLOGY_LAYER information as well as associated elevation (from D_LOCATION_ELEV) for all locations.

V_SYS_CHK_INT_ELEVS_DEPTHS

This view returns all associated elevations and depths for all intervals.  This includes all elevations from D_BOREHOLE, D_INTERVAL_REF_ELEV (including REF_STICK_UP and REF_OFFSET) and D_LOCATION_ELEV_HIST.  In addition, each of the following is included: the deepest geologic formation from D_GEOLOGY_LAYER; the top and bottom elevation and depths from D_INTERVAL_MONITOR; the deepest construction bottom from D_BOREHOLE_CONSTRUCTION; and the average water level elevation (and calculated depth) from D_INTERVAL_SUMMARY.  Only those locations with valid coordinates are examined.

This was originally used for correcting borehole depths (and screen depths).

V_SYS_CHK_INT_ELEVS_DEPTHS_*

These series of views use V_SYS_CHK_INT_ELEVS_DEPTHS as a base with comparisons between fields specifically defined to detect particular errors (in borehole depth, screen elevations, etc?).  All of these views do not consider any location whose QA_COORD_CONFIDENCE_CODE is '118' (i.e. 'YPDT - Assigned Township Centroid').  These include

    - V_SYS_CHK_INT_ELEVS_DEPTHS_BH_MON_BOT_DIFF
        ? This view returns those rows whose BH_BOTTOM_ELEV and MON_BOTTOM_ELEV have a difference greater than '10m'.
    - V_SYS_CHK_INT_ELEVS_DEPTHS_BH_VS_MAX
        ? This view returns those rows whose BH_BOTTOM_DEPTH (plus '0.1m') is less than the MAX_DEPTH_M (i.e. the borehole bottom depth from D_BOREHOLE is above the maximum calculated depth available).
    - V_SYS_CHK_INT_ELEVS_DEPTHS_BH_VS_MON_BOT
        ? This view returns those rows whose BH_BOTTOM_ELEV is greater than the MON_BOT_ELEV (plus '0.1m'; i.e. the borehole bottom elevation from D_BOREHOLE is above the bottom of the screen elevation).  
    - V_SYS_CHK_INT_ELEVS_DEPTHS_BH_VS_WL
        ? This view returns those rows whose BH_BOTTOM_ELEV is greater than the WL_AVG_MASL (i.e. the average water level is below the bottom of the borehole).
    - V_SYS_CHK_INT_ELEVS_DEPTHS_MON_BOT_LT_0
        ? This view returns those rows whose MON_BOT_ELEV has a value less than zero.
    - V_SYS_CHK_INT_ELEVS_DEPTHS_MON_BOT_TOP
        ? This view returns those rows whose MON_BOT_ELEV is above that of the MON_TOP_ELEV (i.e. the top and bottom screen elevations are likely reversed).
    - V_SYS_CHK_INT_ELEVS_DEPTHS_MON_M_LT_0
        ? This view returns those rows whose MON_TOP_DEPTH_M or MON_BOT_DEPTH_M are less than zero.

V_SYS_CHK_INT_MON_DEPTHS_M

This view returns the calculated screen depths from D_INTERVAL_MONITOR where MON_TOP_DEPTH_M and MON_BOT_DEPTH_M is NULL and MON_TOP_OUOM and MON_BOT_OUOM is not NULL.  Using the OUOM fields, the depths are calculated for the original units of 'mbgs', 'fbgs' and 'masl' (which is subtracted from ASSIGNED_ELEV); a '-9999' tag is returned for other units.  Only those with valid coordinates are examined.

V_SYS_CHK_INT_MON_ELEV_DEPTH

This view returns the current depths and elevations from D_INTERVAL_MONITOR as well as BH_GND_ELEV, BH_GND_BOTTOM_ELEV and BH_BOTTOM_DEPTH from D_BOREHOLE.   The ASSIGNED_ELEV is extracted from D_LOCATION_ELEV and LOC_ELEV_MASL_ORIG is from V_SYS_ELEV_ORIGINAL. This should be used as a check between the borehole depth and screened interval depth.

V_SYS_CHK_INT_REF_ELEV

This view returns those locations where the ASSIGNED_ELEV (from D_LOCATION_ELEV) does not lie within the REF_ELEV minus the REF_STICK_UP (from D_INTERVAL_REF_ELEV).  Only those locations where ASSIGNED_ELEV matches BH_GND_ELEV (from D_BOREHOLE) and only a single record (for the particular interval) is present in D_INTERVAL_REF_ELEV (using V_SYS_INT_REF_ELEV_COUNT) are considered.  The reference ground elevation, the new reference elevation (using ASSIGNED_ELEV and REF_STICK_UP) and the absolute difference between ASSIGNED_ELEV and the reference ground elevation is calculated.

V_SYS_CHK_INT_REF_ELEV2

This view returns locations similarly to V_SYS_CHK_INT_REF_ELEV for those locations with multiple records (i.e. time intervals) in D_INTERVAL_REF_ELEV.  The REF_ELEV_START_DATE and REF_ELEV_END_DATE are included; the latter is assigned the current date if, at present, it is NULL (i.e. it is the current reference elevation record).

V_SYS_CHK_INT_REF_ELEV2_DIT2

This view is equivalent to V_SYS_CHK_INT_REF_ELEV_DIT2 (below) for those intervals with multiple records in D_INTERVAL_REF_ELEV.  The start and end dates are used to determine the applicable 'new' reference elevation.

V_SYS_CHK_INT_REF_ELEV2_DIT2_DEPTHS

This view is equivalent to V_SYS_CHK_INT_REF_ELEV_DIT2_DEPTHS (below) for those intervals with multiple records in D_INTERVAL_REF_ELEV (using V_SYS_CHK_INT_REF_ELEV2_DIT2 as a source).

V_SYS_CHK_INT_REF_ELEV_DIT2

This view returns all records from D_INTERVAL_TEMPORAL_2 for intervals present in V_SYS_CHK_REF_ELEV and with READING_GROUP_CODE of '23' (i.e. 'Water Level').  This can be used to determine those records that could be affected by updating (i.e. correcting) the reference elevation (the new, calculated reference elevation is included).

V_SYS_CHK_INT_REF_ELEV_DIT2_DEPTHS

This view returns all records from V_SYS_CHK_INT_REF_ELEV_DIT2 where the original units of measure are depths (e.g. 'mbgs', 'fbgs', etc?) - these are the only records that should be modified by a change in REF_ELEV.  Units such as 'masl' should remain unchanged.  The corrected RD_VALUE is present in RD_VALUE_NEW.  The SYS_RECORD_ID from D_INTERVAL_TEMPORAL_2 is included.

V_SYS_CHK_INT_REF_ELEV2_ERR

This view returns all records from D_INTERVAL_REF_ELEV where multiple reference elevations have been specified but their date ranges are invalid.  This should be used to correct those date ranges.

V_SYS_CHK_INT_SOIL_DEPTHS_M

This view returns the calculated SOIL_TOP_M and SOIL_BOT_M from D_INTERVAL_SOIL.  Both depths ('fbgs' and 'mbgs') and elevations ('masl'; the latter in conjunction with ASSIGNED_ELEV) in the original units of measure are used; a value of '-9999' is otherwise returned.  The original values must be present and the SOIL_TOP_M and SOIL_BOT_M must be NULL.

V_SYS_CHK_INT_SUM_ADD

This view returns a list of INT_ID's not present in D_INTERVAL_SUMMARY.  This is used to automatically update the table with new intervals.

V_SYS_CHK_INT_SUM_REMOVE

This view turns a list of INT_ID's that exist in D_INTERVAL_SUMMARY but are no longer found in D_INTERVAL.  This is used to automatically remove rows from the summary table.  Note that CASCADE rules are present as part of the database schema to automatically remove intervals from this table once they have been removed from D_INTERVAL.

V_SYS_CHK_INT_TMP1_DUPLICATES

This view returns duplicate records from D_INTERVAL_TEMPORAL_1B/1A using comparisons between INT_ID, RD_NAME_CODE, SAM_SAMPLE_DATE, RD_VALUE and UNIT_CODE.  The number of records and the minimum SYS_RECORD_ID (from D_INTERVAL_TEMPORAL_1B) is also returned - the latter is chosen, by default, to remain in the database.  Refer to V_SYS_CHK_INT_TMP1_DUPLICATES_DEL_SRI, below.  Information from D_DATA_SOURCE (tagged by DATA_ID) is included.

V_SYS_CHK_INT_TMP1_DUPLICATES_DEL_SRI

This view returns the duplicate row SYS_RECORD_ID values - these can be used to remove the records from D_INTERVAL_TEMPORAL_1B.

V_SYS_CHK_INT_TMP1_DUPLICATES_NUM

This view, using V_SYS_CHK_INT_TMP1_DUPLICATES as a source, returns the number of duplicate records in D_INTERVAL_TEMPORAL_1B.  This includes all rows.

V_SYS_CHK_INT_TMP1_DUPLICATES_NUM_DEL

This view, using V_SYS_CHK_INT_TMP1_DUPLICATES as a source, returns the number of records to be deleted from D_INTERVAL_TEMPORAL_1B.  This value should be less than that returned from V_SYS_CHK_INT_TMP1_DUPLICATES_NUM.

V_SYS_CHK_INT_TMP1_UNITS

This view returns those records from D_INTERVAL_TEMPORAL_1A and D_INTERVAL_TEMPORAL_1B where units in the latter table are inappropriate for lab-based analysis (e.g.'masl' and 'mbgs'; any rows tagged with these units should likely be in D_INTERVAL_TEMPORAL_2).

V_SYS_CHK_INT_TMP1A_SAMID

This view returns a list of SAM_ID's from D_INTERVAL_TEMPORAL_1A that have no related records in D_INTERVAL_TEMPORAL_1B.  This should be used to remove these records.

V_SYS_CHK_INT_TMP1B_SAMID

This view returns a list of SAM_ID's from D_INTERVAL_TEMPORAL_1B that have no related records in D_INTERVAL_TEMPORAL_1A.  This should be used to remove these records.

V_SYS_CHK_INT_TMP2_DUPLICATES

This view returns duplicate records from D_INTERVAL_TEMPORAL_2 using comparisons between INT_ID, RD_NAME_CODE, RD_DATE, RD_VALUE and UNIT_CODE.  The number of records and the minimum as well as the maximum SYS_RECORD_ID (from D_INTERVAL_TEMPORAL_2) is also returned - the minimum is usually chosen, by default, to remain in the database.  Refer to V_SYS_CHK_INT_TMP2_DUPLICATES_DEL_SRI, below.  Information from D_DATA_SOURCE (tagged by DATA_ID) is included.

V_SYS_CHK_INT_TMP2_DUPLICATES_DEL_SRI

This view returns the duplicate row SYS_RECORD_ID values - these can be used to remove the records from D_INTERVAL_TEMPORAL_2.  The minimum SYS_RECORD_ID (i.e. MIN_SYS_RECORD_ID) is used in this case.

V_SYS_CHK_INT_TMP2_DUPLICATES_NUM

This view, using V_SYS_CHK_INT_TMP2_DUPLICATES as a source, returns the number of duplicate records in D_INTERVAL_TEMPORAL_2.  This includes all rows.

V_SYS_CHK_INT_TMP2_DUPLICATES_NUM_DEL

This view, using V_SYS_CHK_INT_TMP2_DUPLICATES as a source, returns the number of records to be deleted from D_INTERVAL_TEMPORAL_2.  This value should be less than that returned from V_SYS_CHK_INT_TMP2_DUPLICATES_NUM.

V_SYS_CHK_INT_TMP2_SOIL

This view returns all records from D_INTERVAL_TEMPORAL_2 that are associated with soil intervals (i.e. INT_TYPE_CODE '29').

V_SYS_CHK_LOC_COORDS

This view returns the coordinate and coordinate-quality information (from D_LOCATION and D_LOCATION_QA) where LOC_COORD_EASTING or LOC_COORD_NORTHING is NULL.  Only QA_COORD_CONFIDENCE_CODE's that do not have a value of '117' (i.e. 'YPDT - Invalid ?') are considered.

V_SYS_CHK_LOC_COORDS_CHECK

This view returns those locations whose spatial coordinates in D_LOCATION_GEOM (i.e. in GEOM) do not match the (x,y) coordinates in D_LOCATION (i.e. LOC_COORD_EASTING and LOC_COORD_NORTHING).  This is signified by COORD_CHECK (in D_LOCATION_GEOM) having a non-null value (this column is increment using a weekly check process).  The CURRENT_COORD coordinates from D_LOCATION_COORD_HIST, if available, are also returned.  This should be used to monitor and correct invalid changes in coordinates.

V_SYS_CHK_LOC_COORDS_CHECK_UPDATE

This view returns the calculated GEOM and GEOM_WKB for a location where COORD_CHECK (from D_LOCATION_GEOM) is not null; the latter signifies that a change has been made in the coordinates that do match the spatial geometry (i.e. GEOM).  Note that the current coordinates in D_LOCATION_COORD_HIST must match the coordinate values in D_LOCATION.  The two spatial geometry fields, here, should be used to update the fields in D_LOCATION_GEOM.

V_SYS_CHK_LOC_COORDS_CURR

This view returns the coordinates from D_LOCATION where the location currently has no recorded values in D_LOCATION_COORD_HIST.  This is used to update the latter table - a CURRENT_COORD field is present set to a '1' value (indicating that this is the current coordinates).  Note that there must be a valid coordinate in either (or both) of LOC_COORD_EASTING or LOC_COORD_NORTHING.

V_SYS_CHK_LOC_COORDS_HIST

This view extracts all records from D_LOCATION_COORD_HIST (DLCH) with associated information from D_LOCATION.  Note that the QA_COORD_CONFIDENCE_CODE from DLCH will be referred to as QA_new - from D_LOCATION_QA it will be referred to as QA_old.  Similarly, LOC_COORD_OUOM_CODE from DLCH will be referred to as LCOC_DLCH - from D_LOCATION it will be referred to as LCOC_DLOC.

V_SYS_CHK_LOC_COORDS_HIST_CURRENT_COUNT

This view returns all locations with multiple CURRENT_COORD's set in D_LOCATION_COORD_HIST.  Note that a recent change in the database schema should prevent this from occurring in the future (disabling the need for this view).

V_SYS_CHK_LOC_COORDS_HIST_LIST

This view returns those locations whose LOC_COORD_EASTING and LOC_COORD_NORTHING values (from D_LOCATION) are not within '+/- 0.1m' of the current X_UTMZ17NAD83 and Y_UTMZ17NAD83 (from D_LOCATION_COORD_HIST; where CURRENT_COORD is '1').  In addition, all coordinates associated with the location (i.e. LOC_COORD_HIST_CODE's '1' through '8') are included.  This should be used to monitor invalid changes to coordinates.

V_SYS_CHK_LOC_ELEV

This view extracts all elevations from D_LOCATION_ELEV_HIST and D_BORHOLE where the ASSIGNED_ELEV in D_LOCATION_ELEV is NULL.  This can be used to populate the latter table (with an ASSIGNED_ELEV value).  Note that this is an older view and should be updated to incorporate changes in the two location-elevation tables or discarded.

V_SYS_CHK_LOC_ELEV_ASSIGNED_ALL

This view returns all elevations from the D_LOCATION_ELEV and D_LOCATION_ELEV_HIST (the latter through a series of views) associated with a particular location.

V_SYS_CHK_LOC_ELEV_BH_ELEV

This view returns all elevations similar to V_SYS_CHK_LOC_ELEV_ASSIGNED_ALL but only for those locations whose ASSIGNED_ELEV does not match BH_GND_ELEV (from D_BOREHOLE) within a range of '+/- 0.0001m'.  The QA_COORD_CONFIDENCE_CODE cannot have a value of '117' (i.e. 'YPDT - Coordinate Invalid ?').  This allows comparisons between the elevation tables and D_BOREHOLE as the latter can be modified readily in SiteFX.

V_SYS_CHK_LOC_ELEV_MISSING

This view returns all locations (by LOC_ID) that are currently not found in D_LOCATION_ELEV (i.e. there is no ASSIGNED_ELEV).  Note that LOC_TYPE_CODE's '22' (i.e. 'Permit to Take Water') and '25' (i.e. 'Documents') are excluded.  The QA_COORD_CONFIDENCE_CODE for the location cannot be '117' (i.e. 'YPDT - Coordinate Invalid ?').

V_SYS_CHK_LOC_ELEV_MISSING_DEM_GEOM

This view returns the LOC_ID and GEOM from D_LOCATION_GEOM; this is mainly used to determine various DEM elevations for these locations.  Note that LOC_TYPE_CODE's '22' (i.e. 'Permit to Take Water') and '25' (i.e. 'Documents') are excluded as well as those locations with a QA_COORD_CONFIDENCE_CODE of '117' (i.e. 'YPDT - Coordinate Invalid ?') or '118' (i.e. 'YPDT - Assigned Township Centroid ?').  The location is excluded, in addition, if it already has the elevations from the 'DEM - MNR 10m v2' or 'DEM - SRTM 90m v41' surfaces (i.e. LOC_ELEV_CODE's '3' and '5' as found in D_LOCATION_ELEV_HIST). 

V_SYS_CHK_LOC_ELEV_MISSING_GEOM

Using V_SYS_CHK_LOC_ELEV_MISSING as a source this view returns the LOC_ID and GEOM for each location.

V_SYS_CHK_LOC_ELEV_MISSING_LIST

This view returns all elevations associated with a particular location using V_SYS_CHK_LOC_ELEV_MISSING and V_SYS_CHK_LOC_ELEV_ASSIGNED_ALL as sources.  This can be used to determine the ASSIGNED_ELEV to be used for a location.

V_SYS_CHK_LOC_ELEV_MISSING_LIST_QA

This view returns all elevations associated with a particular location (using V_SYS_CHK_LOC_ELEV_MISSING_LIST) with the addition of the particular QA/QC codes and various other information allowing for direct addition into D_LOCATION_ELEV_HIST.

V_SYS_CHK_LOC_ELEV_SURV_NULL

This view returns all elevations associated with a particular location (similarly to V_SYS_CHK_LOC_ELEV_MISSING_LIST) where the QA_ELEV_CONFIDENCE_CODE is '1' (i.e. it has been surveyed) but no surveyed elevation is present in D_LOCATION_ELEV_HIST (i.e. having a LOC_ELEV_CODE of '1').  This should be used to determine the input surveyed elevation.

V_SYS_CHK_LOC_GEOM_ADD

This view returns any LOC_ID not currently present in D_LOCATION_GEOM (that has a valid location).  This is used to automatically add missing locations into the latter table.

V_SYS_CHK_LOC_GEOM_CHANGE

This view returns any LOC_ID where the calculated spatial geometry (from V_SYS_LOC_GEOMETRY) does not match the stored spatial geometry in D_LOCATION_GEOM.  This is used to automatically tag locations whose coordinates should be checked.  Note that this view uses the built-in function 'STEquals' for spatial geometry comparisons (the function returns a '1' if they match, a '0' otherwise).

V_SYS_CHK_LOC_GEOM_COORD_CHECK

This returns all locations as well as their spatial geometry from D_LOCATION_GEOM where COORD_CHECK is not NULL.  The latter indicates where the spatial geometry differs from the current LOC_COORD_EASTING and LOC_COORD_NORTHING in D_LOCATION.

V_SYS_CHK_LOC_GEOM_COORD_CHECK_REVIEW

This view returns the original spatial geometries (both GEOM and GEOM_WKB) as well as the new calculated spatial geometries (new_GEOM and new_GEOM_WKB) for a location where the COORD_CHECK value is not NULL.  This can be used to update D_LOCATION_GEOM after checking.

V_SYS_CHK_LOC_GEOM_REMOVE

This view returns all locations (by LOC_ID) from D_LOCATION_GEOM that no longer exist in D_LOCATION.  Note that the database schema has been updated with CASCADE statements to automate this removal process - this view may be removed in the future.

V_SYS_CHK_LOC_GEOM_WKB_UPDATE

This view returns all locations (by LOC_ID) where GEOM_WKB in D_LOCATION_GEOM is currently a NULL value.  This is used to tag locations where this field should be populated.

V_SYS_CHK_LOC_SUM_ADD

This view returns all locations (by LOC_ID) from D_LOCATION that are currently not found in D_LOCATION_SUMMARY.  This is used to automatically add locations to the latter table.

V_SYS_CHK_LOC_SUM_REMOVE

This view returns all locations (by LOC_ID) from D_LOCATION_SUMMARY that are no longer found in D_LOCATION.  This is used to automatically remove locations from the former table.  Note that changes to the database schema using CASCADE statements  may have made the use of this view surplus - it may be removed in the future.

V_SYS_CHK_MON_BOT_GT_BOT_ELEV

This view checks if the elevation of the bottom of any screen (from D_INTERVAL_MONITOR) is below the elevation of the bottom of the borehole (from D_BOREHOLE).  Note that a value of '0.001' is added to the former to account for slight rounding errors introduced during data entry.

V_SYS_CHK_PICK_ELEV

This view compares the GND_ELEV (from D_PICK) with that of BH_GND_ELEV (from D_BOREHOLE) and ASSIGNED_ELEV (from D_LOCATION_ELEV), calculating their differences.  If either of these differences (which should contain the same value) are greater than an absolute value of '0.1m' the resultant row(s) are returned.  The difference can be added to TOP_ELEV (and GND_ELEV) as a correction factor.

V_SYS_CHK_PICK_ORIG_GND_ELEV

This view compares the original ground elevation (from D_LOCATION_ELEV_HIST using a LOC_ELEV_CODE of '2', i.e. 'Original') with the GND_ELEV from D_PICK.  If the difference is larger than +/- 1, a record is returned.  Note that SYS_RECORD_ID is from D_PICK.

V_SYS_CHK_PICK_ORIG_GND_ELEV_DIFF

This view returns a variety of information using V_SYS_CHK_PICK_ORIG_GND_ELEV as a base.  It is to be used to evaluate pick errors from D_PICK.

V_SYS_CHK_SPEC_CAP_CALC

This view returns calculated values of specific capacity, using V_SYS_SPEC_CAP_CALC as a source, that do not already appear in D_INTERVAL_TEMPORAL_2 (by interval and date).  Note that the RD_NAME_CODE '748' (i.e. 'Specific Capacity') is returned and used as a check.  The calculated specific capacity cannot be a NULL value. 

V_SYS_CHK_WL_MIN_GT_BOT_ELEV

This view checks if the elevation of the lowest water level (from D_INTERVAL_TEMPORAL_2) is below the elevation of the bottom of the borehole (from D_BOREHOLE).  Note that a value of '0.001' is added to the former to account for slight rounding errors introduced during data entry.  The minimum water level is determined using V_SYS_WATERLEVELS_RANGE.

V_SYS_CHK_WLS_GEOL_UNIT_RD_UNIT

This view compares water level elevation values and geology layer elevation values based upon their OUOM units.  Where the average water level elevation is below that of the bottom of the borehole, the GEOL_UNIT_OUOM and RD_UNIT_OUOM values are returned along with the count of number of records.  Note that UGAIS wells are specifically ignored (using V_SYS_UGAIS_ALL).

V_SYS_DIFAF_ASSIGN



V_SYS_DIFA_ASSIGNED_FINAL



V_SYS_DOC_REPLIB_ENTRY

This view returns the fields and values from D_DOCUMENT and D_LOCATION that mimics the format of the table in the Microsoft Access Report Library template.  It is used as a source to represent all documents currently stored in the database.

V_SYS_ELEV_ASSIGNED

This view returns the 'assigned' elevation (as found in D_LOCATION_ELEV) with the supporting information from D_LOCATION_ELEV_HIST (linked on LOC_ELEV_ID).

V_SYS_ELEV_ASSIGNED_ALL

This view returns all elevations associated with a particular location (by LOC_ID).  Note that these include:

    - Assigned Elevation (from D_LOCATION_ELEV)
    - Surveyed (LOC_ELEV_CODE '1' - 'Surveyed') as LOC_ELEV_MASL_SURV
    - Original Elevation (LOC_ELEV_CODE '2' - 'Original') as LOC_ELEV_MASL_ORIG
    - Ministry of Natural Resources (MNR) Digital Elevation Model (DEM), version 2 (10m resolution; LOC_ELEV_CODE '3' - 'DEM - MNR 10m v2') as LOC_ELEV_MASL_MNRV2
    - Shuttle Radar Topography Mission (SRTM) DEM, version 4.1 (90m resolution; LOC_ELEV_CODE '5' - 'DEM - SRTM 90m v41') as LOC_ELEV_MASL_SRTMV41

Additional elevations, not listed here, may be available in D_LOCATION_ELEV_HIST (refer to R_LOC_ELEV_CODE).  This uses V_SYS_ELEV_ASSIGNED (which must have a value for a particular location), V_SYS_ELEV_DEM_MNR_V2, V_SYS_ELEV_DEM_SRTM_V41, V_SYS_ELEV_ORIGINAL and V_SYS_ELEV_SURVEYED as sources.

V_SYS_ELEV_DEM_MNR_V2

This view returns the elevations for all locations that have a LOC_ELEV_CODE of '3' (i.e. 'DEM - MNR 10m v2').

V_SYS_ELEV_DEM_SRTM_V41

This view returns the elevations for all locations that have a LOC_ELEV_CODE of '5' (i.e. 'DEM - SRTM 90m v41')

V_SYS_ELEV_ORIGINAL

This view returns the elevations for all locations that have a LOC_ELEV_CODE of '2' (i.e. 'Original').

V_SYS_ELEV_SURVEYED

This view returns the elevations for all locations that have a LOC_ELEV_CODE of '1' (i.e. 'Surveyed').

V_SYS_ELEV_SURVEYED_DURHAM

This view returns the elevations for all locations that have a LOC_ELEV_CODE of '10' (i.e. 'Surveyed - Durham Update').  These were all assumed to be surveyed at the time of entry/update.

V_SYS_EXAMPLE_SHEET_*

These views return location and interval data, from the database, in the format required for manual data entry using the spreadsheet(s) as described in Section 3.4.  These are to be used to provide familiar example information to requisite partner agencies whom are undergoing entry of data into a database-friendly format outside of the SiteFX environment.  The resultant rows should be included in the file sent to the partner agency as example worksheets (in addition to the blank, data entry sheets).  Note that fields with NULL values are converted to empty strings for incorporating into spreadsheets.

The example data extracted include each of the following:

    - V_SYS_EXAMPLE_SHEET_A_LOCATION
        ? This view incorporates data from D_LOCATION, D_LOCATION_QA and D_DATA_SOURCE.
    - V_SYS_EXAMPLE_SHEET_B_BOREHOLE
        ? This view incorporates data from D_BOREHOLE and D_LOCATION.
    - V_SYS_EXAMPLE_SHEET_C_GEOLOGY
        ? This view incorporates data from V_GEN_GEOLOGY and D_GEOLOGY_LAYER.
    - V_SYS_EXAMPLE_SHEET_D_SCREEN
        ? This view incorporates data from V_GEN_HYDROGEOLOGY, D_INTERVAL, D_INTERVAL_REF_ELEV and D_INTERVAL_MONITOR.  This is used as a source in '*_SCREEN_AND_SOIL', below.
    - V_SYS_EXAMPLE_SHEET_D_SOIL
        ? This view incorporates data from D_INTERVAL_SOIL, D_INTERVAL and V_GEN_BOREHOLE.  This is used as a source in '*_SCREEN_AND_SOIL', below.
    - V_SYS_EXAMPLE_SHEET_D_SCREEN_AND_SOIL
        ? This view combines the results from V_SYS_EXAMPLE_SHEET_D_SCREEN and V_SYS_EXAMPLE_SHEET_D_SOIL, above, into a single view.
    - V_SYS_EXAMPLE_SHEET_E_LAB_DATA
        ? This view incorporates data from V_GEN_LAB and D_INTERVAL_TEMPORAL_1A.
    - V_SYS_EXAMPLE_SHEET_F_FIELD_DATA
        ? This view incorporates data from V_GEN_FIELD.

V_SYS_FIELD_WATERLEVELS_DAILY

This view returns the calculated daily average water level for both logger (RD_NAME_CODE '629') and manual (RD_NAME_CODE '628') data for each interval, if available.  Only those rows in D_INTERVAL_TEMPORAL_2 with UNIT_CODE '6' (i.e. 'masl') are included.  Note that the maximum SYS_RECORD_ID is included for referencing (i.e. in order to distinguish between rows in the resultant dataset).  The datetime field (RD_DATE) is modified, dropping the hour and minute data.

V_SYS_FIELD_WATERLEVELS_YEARLY

This view returns the water level minimum, maximum, difference and total number of records for each interval for each year of data.  Note that data from RD_NAME_CODEs '628' (i.e. 'Water Level - Manual - Static') and '629' (i.e. 'Water Level - Logger (Compensated & Corrected)') are combined for these calculations.  Only those records with UNIT_CODE '6' (i.e. 'masl') are included.

V_SYS_GEN_BH_INT_MUNIC_WELL

This view returns various associated information for municipal wells.  The latter is defined as having the following attributes:

    - PURPOSE_PRIMARY_CODE of '10' (i.e. 'Water Supply')
    - PURPOSE_SECONDARY_CODE of '22' (i.e. 'Municipal Supply')
    - LOC_TYPE_CODE of '1' (i.e. 'Well or Borehole')

V_SYS_GEN_BH_INT_MUNIC_WELL_CHANNEL

This view returns all municipal wells, using V_SYS_GEN_BH_INT_MUNIC_WELL as a source, that are determined to be screened within a 'channel' geologic unit (as defined by V_SYS_GEOL_UNIT_CHANNEL).

V_SYS_GEN_BH_INT_MUNIC_WELL_DEEP

This view returns all municipal wells, using V_SYS_GEN_BH_INT_MUNIC_WELL as a source, that are determined to be screened within 'deep' geologic units (as defined by V_SYS_GEOL_UNIT_DEEP).

V_SYS_GEN_BH_INT_MUNIC_WELL_SHALLOW

This view returns all municipal wells, using V_SYS_GEN_BH_INT_MUNIC_WELL as a source, that are determined to be screened within 'shallow' geologic units (as defined by V_SYS_GEOL_UNIT_SHALLOW).

V_SYS_GEN_LAB_STANDARD

This view returns all records from D_INTERVAL_TEMPORAL_1B/1A where the specific parameter (as defined by RD_NAME_CODE) is considered to be a 'standard' parameter.  In addition, the REC_STATUS_CODE must have a value less than '10'(values '10' or higher are considered to be unreliable).  Standard parameters include (the parameter RD_NAME_CODE is in brackets):

    - Alkalinity (86)
    - Alkalinity (as CaCO3) (653)
    - Alkalinity (Total Fixed Endpoint) (10813)
    - Aluminum (92)
    - Ammonia (93)
    - Ammonia (as Nitrogen) (94)
    - Antimony (96)
    - Arsenic (97)
    - Barium (100)
    - Benzene (102)
    - Beryllium (109)
    - Bicarbonate (as HCO3) (111)
    - Bismuth (119)
    - Boron (121)
    - Bromide (124)
    - Cadmium (132)
    - Calcium (133)
    - Chloride (143)
    - Chromium (152)
    - Cobalt (160)
    - Conductivity (163)
    - Conductivity (Calculated) (680)
    - Copper (164)
    - Cyanide (Free) (169)
    - Cyanide (Total) (168)
    - Dissolved Inorganic Carbon (10759)
    - Dissolved Organic Carbon (200)
    - Ethylbenzene (215)
    - Fluoride (226)
    - Fluorine, (227)
    - Hardness (as CaCO3) (235)
    - Ionic Balance (504)
    - Iron (252)
    - Langelier Index (506)
    - Lead (258)
    - Magnesium (268)
    - Manganese (270)
    - Mercury (273)
    - Molybdenum (290)
    - Nickel (297)
    - Nitrate (298)
    - Nitrate (as Nitrogen) (718)
    - Nitrate + Nitrite (as Nitrogen) (716)
    - Nitrite (300)
    - Nitrite (as Nitrogen) (723)
    - Orthophosphate (314)
    - pH (326)
    - pH at Saturation (327)
    - pH at Saturation (Estimated) (10784)
    - Potassium (339)
    - Selenium (353)
    - Silica (354)
    - Silver (356)
    - SiO2 (70772)
    - Sodium (358)
    - Strontium (362)
    - Sulphate (364)
    - Thallium (374)
    - Thorium (375)
    - Titanium (377)
    - Toluene (379)
    - Total Dissolved Solids (384)
    - Total Kjeldahl Nitrogen (388)
    - Total Phosphorus (334)
    - Trichloroethylene (407)
    - Turbidity (412)
    - Uranium (413)
    - Vanadium (414)
    - Vinyl Chloride (417)
    - Xylene (395)
    - Zinc (424)

V_SYS_GEN_WL_AVERAGE

This view, using V_SYS_CHK_INT_ELEVS_DEPTHS as a source, returns those records where WL_MASL_AVG is not null and the QA_COORD_CONFIDENCE_CODE is less than '6' (i.e. 'Margin of Error: 300m - 1km'; the uncertainty, then, would be less than 300m horizontal).  Both the spatial geometry (from D_LOCATION_GEOM) and the coordinates (from D_LOCATION) are included.  This can then be used for creating regional water level surfaces.

V_SYS_GENERAL

This view extracts locations from D_LOCATION with valid coordinates (i.e. not having a QA_COORD_CONFIDENCE_CODE of '117').  Note that documents (LOC_TYPE_CODE '25') and the 'Viewlog Well Header' location (i.e. LOC_ID '-2147483443') are not included.  This is used as a base for many V_GEN_* views.

V_SYS_GENERAL_INTERVAL

This view extracts all intervals from D_INTERVAL that are present in V_SYS_GENERAL; refer to V_SYS_GENERAL, above.  This is used as a base for many V_GEN_* views that include interval information.

V_SYS_GEOL_LAYER_COUNT

This view is not official and should be removed.

V_SYS_GEOL_LAY_ELEVS

This view returns the current elevations found in D_GEOLOGY_LAYER as well as newly calculated elevations based upon the *_OUOM fields (based upon the specified units) and the current ASSIGNED_ELEV.  This can be used as a check against the current geologic layer elevations and the BH_GND_ELEV (from D_BOREHOLE).

V_SYS_GEOL_LAY_TOP_BOT_M

This view returns calculated depths for all geologic records in D_GEOLOGY_LAYER (referenced by GEOL_ID) for locations with valid coordinates (i.e. not having a QA_COORD_CONFIDENCE_CODE of '117').  In addition, a number of checks are made:

    - ASSIGNED_ELEV cannot be null
    - GEOL_TOP_ELEV and GEOL_BOT_ELEV cannot be null and must not exceed the ASSIGNED_ELEV value
    - All calculated depths must be greater than zero
    - GEOL_TOP_ELEV must have a larger value than GEOL_BOT_ELEV

V_SYS_GEOL_LAY_UNIT_OUOM

This view returns the number of geologic layers for a location (from V_SYS_SUMMARY_GEOL_LAYER_NUM, below) as well as the number of geologic layers that have OUOM values (of depth or elevation) that are whole numbers (i.e. having no fractional value).  The original 'units of measure' area also returned.  This can be used as a base of comparison to determine whether the original 'units of measure' (also listed) are correct; the assumption, here, being that units of 'ft' or 'fasl' (and others) will have whole numbers while metric units will have fractional/decimal numbers.

V_SYS_GEOL_UNIT_CHANNEL

This view extracts all records from R_GEOL_UNIT_CODE whose geologic units are considered 'channel' related.  Note that these will almost exclusively consist of 'YPDT ?' units.

V_SYS_GEOL_UNIT_DEEP

This view extracts all records from R_GEOL_UNIT_CODE whose geologic units are considered to be 'deep'.  Note that these will almost exclusively consist of 'YPDT ?' units.

V_SYS_GEOL_UNIT_LNT

This view extracts all records from R_GEOL_UNIT_CODE whose geologic units are considered to be related to the 'Lower Northern Till'.

V_SYS_GEOL_UNIT_SHALLOW

This view extracts all records from R_GEOL_UNIT_CODE whose geologic units are considered to be 'shallow'.  Note that these will almost exclusively consist of 'YPDT ?' units.

V_SYS_GEOM_BOREHOLE

This view extracts all records from D_LOCATION_GEOM where the location's LOC_TYPE_CODE is '1' (i.e. 'Well or Borehole').  Both the native spatial geometry and the 'well known binary' (WKB) geometry for the location is returned.

V_SYS_INT_MON_COORDS

This view returns the coordinates and top- and bottom-depths for all valid screened intervals.  Note that MON_TOP_DEPTH_M and MON_BOT_DEPTH_M cannot be NULL and the former must be smaller than the latter.  The views V_SYS_INT_MON_MAX_MIN and V_SYS_GENERAL_INTERVAL are used as sources.

V_SYS_INT_MON_COORDS_FLOWING

This view is similar to V_SYS_INT_MON_COORDS; only intervals where MON_FLOWING (from D_INTERVAL_MONITOR) is true are returned.

V_SYS_INT_MON_DEPTHS_M

This view returns the top and bottom elevations of intervals in D_INTERVAL_MONITOR.  In addition, both MON_TOP_DEPTH_M and MON_BOT_DEPTH_M are calculated.  Note that BH_GND_ELEV, MON_TOP_ELEV and MON_BOT_ELEV cannot be NULL.

V_SYS_INT_MON_ELEVS

This view returns the elevations currently found in D_INTERVAL_MONITOR as well as the calculated elevations based upon the *_OUOM fields and the current ASSIGNED_ELEV.  This can be used to compare the elevation fields and BH_GND_ELEV (from D_BOREHOLE).

V_SYS_INT_MON_MAX_MIN

This view returns the maximum and minimum elevations and depths as well as a count of the number of records associated with a screened interval in D_INTERVAL_MONITOR.  This view should be used as a source for these values instead of accessing the data from the source table directly.

V_SYS_INT_REF_ELEV_COUNT

This view returns the number of records associated with a particular interval from D_INTERVAL_REF_ELEV.  Multiple records can exist in this table (for each interval) when tracking changes in reference elevation over time.

V_SYS_INT_REF_ELEV_CURRENT

This view returns the information for the 'current' interval reference elevation.  Current is defined as the latest, and still applicable (i.e. it has no ending date), reference elevation.

V_SYS_INT_SOIL_COORDS

This view returns the coordinates as well as the top and bottom elevations and depths of soil intervals (i.e. samples) from D_INTERVAL_SOIL.  Note that SOIL_TOP_M and SOIL_BOT_M cannot be null and the latter must be larger value than the former.

V_SYS_INT_TYPE_CODE_SCREEN

This view returns all INT_TYPE_CODE's whose INT_TYPE_ALT_CODE (in R_INT_TYPE_CODE) matches 'Screen'.  All of these are considered 'screened' intervals that will (likely) appear in D_INTERVAL_MONITOR.

V_SYS_INTERVAL_ELEV

This view returns the top- and bottom-elevation of screened intervals in D_INTERVAL_MONITOR.  Note that MON_TOP_ELEV and MON_BOT_ELEV cannot be NULL.

V_SYS_LOC_COORD_HIST_ADD

This view assembles the pertinent information from D_LOCATION and D_LOCATION_QA into a format needed for inserting data into D_LOCATION_COORD_HIST.  Only those locations that do not already exist in the latter table will be returned.  These will be tagged as a CURRENT_COORD (which will be set to '1').  Both LOC_COORD_EASTING and LOC_COORD_NORTHING cannot be NULL.

V_SYS_LOC_DATA_SOURCE

This view returns, for each location in D_LOCATION: location names; location study; data source information (based on DATA_ID); and, if the location was an MOE well, each of the MOE ATAG, MOETAG and BORE_HOLE_ID.  In addition, W_GENERAL is used as a source for MOE_PDF_LINK.

V_SYS_LOC_GEOMETRY

This view returns the calculated spatial geometry for each valid location (i.e. not having a QA_COORD_CONFIDENCE_CODE of '117') in D_LOCATION.  This is accomplished through the built-in function 'STGeomFromText'; the EPSG projection code used is '26917'.

V_SYS_LOC_GEOMETRY_WKB

This view returns the calculated 'well known binary' (WKB) spatial geometry (return as a varbinary type) for all locations in D_LOCATION_GEOM.  This is accomplished through the built-in function 'STAsBinary'.

V_SYS_LOC_MODEL_<model>BUF

Each of these views returns the location (as LOC_ID) whose spatial geometry (from D_LOCATION_GEOM) intersects the spatial geometry of the specified model (with buffer) polygon (from D_AREA_GEOM).  The models and area objects include:

    - CM2004 - AREA_ID '20' (i.e. 'YPDT-CAMC CORE Model 2004 5km Buffer')
    - DM2007 - AREA_ID '23' (i.e. 'YPDT-CAMC DURHAM Model 2007 5km Buffer')
    - ECM2006 - AREA_ID '29' (i.e. 'YPDT-CAMC EXTENDED CORE Model 2006 5km Buffer')
    - EM2010 - AREA_ID '25' (i.e. 'YPDT-CAMC EAST Model 2010 5km Buffer')
    - RM2004 - AREA_ID '27' (i.e. 'YPDT-CAMC REGIONAL Model 2004 5km Buffer')

These views use the built-in function 'STIntersects'.

V_SYS_LOC_MODEL_YT32011

This view returns the location (as LOC_ID) whose spatial geometry (from D_LOCATION_GEOM) intersects the spatial geometry of this model (with no buffer applied; from D_AREA_GEOM).  This spatial area defined the 'York Tier 3 Model - 2011' (whose AREA_ID is '63').

V_SYS_MOE_BORE_HOLE_ID

This view returns all locations from D_LOCATION_ALIAS where LOC_ALIAS_TYPE_CODE is '3' (i.e. 'MOE bore_hold_id field').  Note that LOC_NAME_ALIAS must convert to a numeric (integer) form.  If it cannot convert correctly, a '-9999' value is returned instead.

V_SYS_MOE_DATA_ID

This view returns all DATA_ID's (and associated information) that are manually specified as MOE WWDB imports.

V_SYS_MOE_DATA_ID_COUNT

This view returns the calculated number of records from D_LOCATION associated with the MOE import DATA_ID's from V_SYS_MOE_DATA_ID.

V_SYS_MOE_LOCATIONS

This view returns the UNION of V_SYS_MOE_WELL_ID and V_SYS_MOE_WELL_ID_DLA where the MOE_WELL_ID code is not '-9999'.  In addition, the MOD_PDF_LINK is calculated.  The view V_SYS_MOE_BORE_HOLE_ID is used as the source for MOE_BORE_HOLE_ID.

V_SYS_MOE_WELL

This view returns all locations from D_LOCATION that have a DATA_ID associated with an MOE WWDB import using V_SYS_MOE_DATA_ID.  Only those locations with a LOC_TYPE_CODE of '1' (i.e. 'Well or Borehole') are included.

V_SYS_MOE_WELL_ID

Using V_SYS_MOE_WELL as a source, the LOC_ORIGINAL_NAME from D_LOCATION is used to calculate the MOE_WELL_ID field.  This value must be convertible to a numeric (integer), a '-9999' value is returned otherwise.  

V_SYS_MOE_WELL_ID_DLA

This view returns all locations from D_LOCATION_ALIAS where LOC_ALIAS_TYPE_CODE is '4' (i.e. 'MOE well_id field').  Note that LOC_NAME_ALIAS must be converted to a numeric (integer) form.  If it cannot convert correctly, a '-9999' value is returned instead.

V_SYS_MOE_WELL_ID_DLA_DUP

This view returns all locations from D_LOCATION_ALIAS where LOC_ALIAS_TYPE_CODE is '5' ('MOE WELL_ID field - Duplicate').  Note that LOC_NAME_ALIAS must be converted to a numeric (integer) form.  If it cannot convert correctly, a '-9999' value is returned instead.

V_SYS_NAME

This view returns all names for a given location and interval as found in D_LOCATION, D_LOCATION_ALIAS, D_INTERVAL and D_INTERVAL_ALIAS - each is found on a separate row tagged with a LOC_ID.  The INT_ID is included if the name is sourced from an interval table.  All names will be non-NULL.  Note that only LOC_ALIAS_TYPE_CODE's '1' (i.e. 'MOE Tag Number', '2' (i.e. 'MOE Audit Number') or NULL will be extracted from D_LOCATION_ALIAS.  This returns the minimum number of rows (some INT_IDs may be missed in this first-pass view).

V_SYS_NAME_ALL

This view is similar to V_SYS_NAME, above.  In this case, a maximum number of rows are returned - all relations will be specified; in some cases there will be duplicates.  V_SYS_NAME is used as a base for this view.

V_SYS_NAME_INTERVAL

This view returns all names tied to intervals (i.e. INT_IDs).

V_SYS_NAME_LOCATION

This view returns all names tied to locations (i.e. LOC_IDs).

V_SYS_NAME_STUDY_AREA

This view uses V_SYS_NAME as a base and includes LOC_STUDY and LOC_AREA from D_LOCATION.  This returns the minimum number of rows (see V_SYS_NAME, above).

V_SYS_NAME_STUDY_AREA_ALL

This view uses V_SYS_NAME_STUDY_AREA as a base.  This returns a maximum number of rows (see V_SYS_NAME_ALL, above).

V_SYS_ORMGP_MON_INTERVAL

This view returns those intervals (and associated information) that are directly related or monitored by the ORMGP.  In particular, an interval group (i.e. GROUP_INT_CODE '22', 'YPDT-CAMC Groundwater Monitoring') is used to access these INT_ID's.  Note that these are the 'old' intervals; refer to V_SYS_GW_MON_INTERVAL_NEW, below.

V_SYS_ORMGP_MON_INTERVAL_NEW

This view is similar to V_SYS_ORMGP_MON_INTERVAL but uses, instead, the GROUP_INT_CODE '18504083' (i.e. 'YPDT-CAMC Groundwater Monitoring - Update').

V_SYS_ORMGP_MON_LOCATION

This view returns those locations (and associated information) that are directly related or monitored by the ORMGP program.  Refer to V_SYS_GW_MON_INTERVAL (above) for details.

V_SYS_ORMGP_MON_LOCATION_NEW

V_SYS_PICK_*

These series of views extract records from V_GEN_PICK based upon the text description of each geologic unit.

V_SYS_PTTW_EXPIRY_DATE_MAX

This view returns the maximum (i.e. latest) expiry date for a permit or related permit using V_SYS_PTTW_RELATED_ALL.

V_SYS_PTTW_FIND_*

These series of views are used when importing 'new' PTTW locations into the master database.  They are not for the general user.

V_SYS_PTTW_FIND_PRESENT

This view returns all LOC_IDs indicating a PTTW location as well as any related PTTW locations.

V_SYS_PTTW_FIND_RELATED_ALL

This view returns all permutations of PTTW_PERMIT_NUMBER (with LOC_ID) along with their PTTW_EXPIRED_BY and PTTW_AMENDED_BY permit numbers.

V_SYS_PTTW_FIND_RELATED_NEW

Using V_SYS_PTTW_FIND_PRESENT and V_SYS_PTTW_FIND_RELATED_ALL as a base, this view returns all 'new' related permits LOC_IDs.

V_SYS_PTTW_RELATED_ALL

This view returns the list of all locations (from D_PTTW) related to their primary location from V_SYS_PTTW_RELATED_PRIMARY (below).  Note that the primary location is listed, here, as being related to itself (i.e. the same LOC_ID and PERMIT_NUMBER will appear, also, as LOC_ID_RELATED and PERMIT_NUMBER_RELATED).

V_SYS_PTTW_RELATED_PRIMARY

This view returns a distinct list of locations (by LOC_ID) and their associated PTTW_PERMIT_NUMBER from D_PTTW_RELATED.

V_SYS_PTTW_SOURCE

This view returns the source location (by LOC_ID, renamed SOURCE_LOC_ID) linked to a 'permit to take water' (PTTW) location (i.e. the LOC_TYPE_CODE is '22').  A record is returned if the LOC_ID does not have the same LOC_MASTER_LOC_ID value (i.e. the latter is the source).

V_SYS_PTTW_SOURCE_VOLUME
This view combines the results of V_SYS_PTTW_SOURCE (above) and V_SYS_PTTW_VOLUME (below).

V_SYS_PTTW_VOLUME

This view returns the calculated yearly volume (based upon the PTTW_MAX_L_DAY and PTTW_MAX_DAYS_YEAR) between the years specified by PTTW_ISSUEDDATE and PTTW_PERMIT_END.  Note that the former must be an earlier date than the latter.

V_SYS_PUMP_LATEST

This returns the latest pump test information for each interval (using PUMPTEST_DATE from D_PUMPTEST).

V_SYS_PUMP_MOE_DRAWDOWN

This view returns the minimum elevation and calculated depth of drawdown from D_INTERVAL_TEMPORAL_2 where RD_NAME_CODE is '70899' (i.e. 'Water Level - Manual - Other') and RD_TYPE_CODE is '65' (i.e. 'WL - MOE Well Record - Pumping') or '64' (i.e. 'WL - MOE Well Record - Recovery').  The information is linked to any records in D_PUMPTEST (based on INT_ID, RD_DATE and PUMPTEST_DATE).  The ASSIGNED_ELEV is used to calculate the depths.

V_SYS_PUMP_OFF_WATERLEVEL

This view returns the pump off water levels by interval where RD_TYPE_CODE is '67' (i.e. 'WL - Pump Off').

V_SYS_PUMP_ON_WATERLEVEL

This view returns the pump on water levels by interval where RD_TYPE_CODE is '66' (i.e. 'WL - Pump On').

V_SYS_PUMP_VOLUME_MONTHLY

This view calculates the monthly pumping volume minimum, maximum, average, sum and number of records by interval from D_INTERVAL_TEMPORAL_2 where RD_NAME_CODE is '447' (i.e. 'Production - Pumped Volume (Daily Total)') and UNIT_CODE is '74' (i.e. 'm3/d').

V_SYS_PUMP_VOLUME_YEARLY

This view is similar to V_SYS_PUMP_VOLUME_MONTHLY (above).  The field AVG_VOLUME_M3_D_YEAR is the AVG_VOLUME_M3_D divided by '365'.

V_SYS_RANDOM_ID_<numeric>

Each of these views returns a series of numeric, non-repeating numbers within the specified range of values assigned to various ORMGP personnel (make sure to specify 'TOP <number>' as part of your query code - up to ~1000000 rows can be returned).  The following figure specifies the ranges.

V_SYS_RANDOM_ID_BULK_<numeric>

These views are similar to V_SYS_RANDOM_ID_<numeric> (above); they are used when a large number of records are to be input into the database. 

V_SYS_RANDOM_ID_<partner agency>

These views are similar to V_SYS_RANDOM_ID_<numeric> (above); they are used to assign ranges based upon a particular partner agency.

V_SYS_S_USER_ID_RANGES

This view returns the user specified numeric ranges (see V_SYS_RANDOM_ID_*, above) as assigned within SiteFX.  These values are stored in S_USER where 'Name' matches 'uniqueIDranges'.

V_SYS_SFLOW_YEARLY

This view returns yearly stream flow minimum, maximum, average and number of records by interval from D_INTERVAL_TEMPORAL_2 where RD_NAME_CODE is '1001' (i.e. 'Stream Flow - Daily Discharge (Average)') or '70870' (i.e. 'Stream Flow (Spot Flow)').

V_SYS_SHYDROLOGY

This view returns information specifically formatted for the ORMGP website (through the 'S-Hydrology' web-application) under 'Surface Water Hydrograph Tools'.

V_SYS_SPEC_CAP_CALC

This view calculates the specific capacity for intervals from D_INTERVAL_TEMPORAL_2 where: 

    - Water levels are calculated from manual readings where RD_NAME_CODE is '628' (i.e. 'Water Level - Manual - Static') and RD_TYPE_CODE is '0' (i.e. 'WL - MOE Well Record - Static')
    - Pumping water levels area available where RD_NAME_CODE is '70899' (i.e. 'Water Level - Manual - Other') and RD_TYPE_CODE is '65' (i.e. 'WL - MOE Well Record - Pumping')
    - Pumping test data is available in D_PUMPTEST and D_PUMPTEST_STEP; all pumping rates are converted to 'litres per minute' (i.e. 'lpm').

Note that the static water level must be shallower than the pumping water level; a NULL is returned otherwise.

V_SYS_STAT_WLS_LOGGER/_MANUAL

This view assembles various statistical measures of the water level logger and manual record distributions (by INT_ID).  This includes

    - Minimum value (WLS_MIN)
    - Maximum value (WLS_MAX)
    - Average (mean) value (WLS_MEAN)
    - The range of values (WLS_RANGE)
    - Median value (WLS_MED); note that this value is being determined using the SQL Server function 'percentile_cont' which is only available in versions after (and including) v2016
    - Mode value; note that a minimum (WLS_MODE_MIN) and maximum (WLS_MODE_MAX) is determined - if these values differ, it indicates that more than a single value has the highest number of occurrences for a particular INT_ID
    - The number of records with the particular mode value (WLS_MODE_NUM)
    - The total number of records with the highest occurrences of the mode values (MODE_NUM)
    - The standard deviation (WLS_STDEV)
    - The variance (WLS_VAR) 
    - The start (WLS_START_DATE) and end (WLS_END_DATE) dates for the records

In general, the data can be described as right-skewed (i.e. positive skewed) if 

WLS_MODE < WLS_MED < WLS_MEAN

and left-skewed  (i.e. negative skewed) if

WLS_MEAN < WLS_MED < WLS_MOD.

V_SYS_STAT_WLS_LOGGER_MED/_MANUAL_MED

Calculate the median water level value for logger and manual records.

V_SYS_STAT_WLS_LOGGER_MODE/_MANUAL_MODE

Calculate the water level mode value (i.e. the most common occurrence of a particular values within the dataset) for the logger and manual records.  Note that the minimum and maximum value is calculated in the case that more than one particular value as the largest number of records.

V_SYS_STAT_WLS_LOGGER_MODEC/_MANUAL_MODEC

Rounds the values of the water level records (for manual and logger data) to five significant digits to allow calculation of the mode value(s).

V_SYS_STAT_WLS_LOGGER_MODE_RANGE/_MANUAL_MODE_RANGE

Returns the highest and lowest mode values calculated when more than a single mode value is present for a particular logger and manual water level dataset.

V_SYS_STATCOUNT_BOREHOLE

This view calculates the number of boreholes present in the database.  This uses D_BOREHOLE and LOC_TYPE_CODE of '1' (i.e. 'Well or Borehole').

V_SYS_STATCOUNT_BOREHOLE_MOE

This view is similar to V_SYS_STATCOUNT_BOREHOLE.  In addition, the borehole must be originally from the MOE WWDB (this is determined by V_SYS_MOE_WELL).

V_SYS_STATCOUNT_CHEM_ANALYSIS_PARA

This view calculates the number of readings present in D_INTERVAL_TEMPORAL_1B.  This should be equivalent to the number of rows.

V_SYS_STATCOUNT_CLIMATE_MEASURE

This view calculates the number of climate readings present in D_INTERVAL_TEMPORAL_3.  This should be equivalent to the number of rows.

V_SYS_STATCOUNT_CLIMATE_STN

This view determines the number of climate stations in the database.  These are LOC_TYPE_CODE's of '9' (i.e. 'Climate Station').

V_SYS_STATCOUNT_DOCUMENT

This view determines the number of documents in the database.  This is calculated by the number of records in D_DOCUMENT. 

V_SYS_STATCOUNT_GEOLOGY_LAYER

This view determines the number of geology layers in the database.  This is calculated by the number of records in D_GEOLOGY_LAYER.

V_SYS_STATCOUNT_OUTCROP

This view determines the number of outcrops present in D_BOREHOLE.  These are LOC_TYPE_CODE's of '11' (i.e. 'Outcrop').

V_SYS_STATCOUNT_PUMP_RATE_MUNIC

This view determines the number of pumping municipal records in D_INTERVAL_TEMPORAL_2 where RD_NAME_CODE is '447' (i.e. 'Production - Pumped Volume (Total Daily)' and LOC_STATUS_CODE is '11' (i.e. 'Active Municipal Pumping Well').

V_SYS_STATCOUNT_SFC_WATER_MEASURE
This view determines the number of surface water readings in D_INTERVAL_TEMPORAL_2 where LOC_TYPE_CODE is '6' (i.e. 'Surface Water').

V_SYS_STATCOUNT_SFC_WATER_STN

This view determines the number of surface water stations in the database.  These are LOC_TYPE_CODE's of '6' (i.e. 'Surface Water').

V_SYS_STATCOUNT_WATER_LEVEL

This view determines the number of water levels in D_INTERVAL_TEMPORAL_2.  These correspond to any with a READING_GROUP_CODE of '23' (i.e. 'Water Level').

V_SYS_STATUS_INT_TYPE_CODE

This view extracts the number of interval types present in the database over time.  D_VERSION_STATUS is used as the source.

V_SYS_STATUS_LOC_TYPE_CODE

This view extracts the number of location types present in the database over time.  D_VERSION_STATUS is used as the source.

V_SYS_STATUS_READING_GROUP_CODE

This view extracts the number of values associated with particular reading groups (from R_READING_GROUP_CODE) in the database over time.  D_VERSION_STATUS is used as the source.  Note that 'DIT1' or 'DIT2' is appended to indicate the original temporal source table.

V_SYS_SUM_INT_TYPE_COUNTS

This view, using D_VERSION_CURRENT and V_SUM_INT_TYPE_COUNTS as sources, formats interval type count data into a format for insertion into D_VERSION_STATUS.  Note that CURRENT_VERSION corresponds to the current 'yyymmdd' format.

V_SYS_SUM_LOC_TYPE_COUNTS

This view, using D_VERSION_CURRENT and V_SUM_LOC_TYPE_COUNTS as sources, formats location type count data into a format for insertion into D_VERSION_STATUS.  Note that CURRENT_VERSION corresponds to the current 'yyyymmdd' format.

V_SYS_SUM_READING_GROUP_COUNTS

This view, using D_VERSION_CURRENT and V_SUM_READING_GROUP_COUNTS as sources, formats reading group count data into a format for insertion into D_VERSION_STATUS.  Note that CURRENT_VERSION corresponds to the current 'yyyymmdd' format.

V_SYS_SUMMARY_DEEPEST_SCREEN_TOP

This view returns the top elevation of the deepest screened interval (from D_INTERVAL_MONITOR) and its associated assigned geologic unit code (from V_SYS_DIFA_ASSIGNED_FINAL).  

V_SYS_SUMMARY_GEOL_LAYER_NUM

This view returns the number of geologic layers associated with a particular location from D_GEOLOGY_LAYER.

V_SYS_SUMMARY_MON_FLOWING

This view returns the locations that are tagged as flowing in D_INTERVAL_MONITOR (i.e. MON_FLOWING is true).

V_SYS_SUMMARY_MON_NUM

This view returns the number of intervals associated with a location in D_INTERVAL.

V_SYS_SUMMARY_PRECIP

This view returns the minimum and maximum dates as well as the number of precipitation records by interval in D_INTERVAL_TEMPORAL_3.  The RD_NAME_CODE used is '551' (i.e. 'Precipitation (Daily Total)').

V_SYS_SUMMARY_PUMP

This view returns the minimum and maximum dates as well as the number of pumping records by interval in D_INTERVAL_TEMPORAL_2.  The RD_TYPE_CODE's must be '64' (i.e. 'WL - MOE Well Record - Recovery') or '65' (i.e. 'WL - MOE Well Record - Pumping') or the READING_GROUP_CODE must be '35' (i.e. 'Discharge/Production - From Wells ?').

V_SYS_SUMMARY_PUMP_DAILY_VOL

This view returns the minimum and maximum dates as well as the number of pumping volume records by interval in D_INTERVAL_TEMPORAL_2.  The RD_NAME_CODE used is '447' (i.e. 'Production - Pumped Volume (Total Daily)').

V_SYS_SUMMARY_PUMP_RATE

This view returns the maximum REC_PUMP_RATE_IGPM by location from D_PUMPTEST.  Note that REC_PUMP_RATE_IGPM must be greater than '50'.

V_SYS_SUMMARY_SFLOW

This view returns the minimum and maximum dates as well as the number of streamflow records by interval in D_INTERVAL_TEMPORAL_2.  In addition, minimum, maximum and average streamflow is calculated.  The RD_NAME_CODE's are '1001' (i.e. 'Stream Flow - Daily Discharge (Average)') or '70870' (i.e. 'Stream Flow (Spot Flow)').

V_SYS_SUMMARY_SOIL

This view calculates the number of soil samples (from D_INTERVAL) and the number of soil sample readings (from D_INTERVAL_TEMPORAL_1A/1B) for a particular location.  Note that INT_TYPE_CODE is '29' (i.e. 'Soil or Rock').

V_SYS_SUMMARY_SOIL_GEOTECH

This view returns counts of interval geotechnical information for each location (i.e. where it is available).  Both the temporal tables (1A/1B) and D_INTERVAL_SOIL are examined.

V_SYS_SUMMARY_SPEC_CAP

This view determines the minimum, maximum and number of specific capacity values by interval from D_INTERVAL_TEMPORAL_2.  The RD_NAME_CODE is '748' (i.e. 'Specific Capacity').

V_SYS_SUMMARY_TEMP_AIR

This view returns the minimum and maximum dates as well as the number of air temperature readings in D_INTERVAL_TEMPORAL_3.  The RD_NAME_CODE's used include '369' (i.e. 'Temperature (Air)'), '546' (i.e. 'Temperature (Air) - Daily Max'), '547' (i.e. 'Temperature (Air) - Daily Min') and '548' (i.e. 'Temperature (Air) - Daily Mean').

V_SYS_SUMMARY_WL

This view returns the minimum and maximum dates as well as the number of water level readings in D_INTERVAL_TEMPORAL_2.  The READING_GROUP_CODE used is '23' (i.e. 'Water Level').

V_SYS_SUMMARY_WL_ALL

This view returns all water level readings in D_INTERVAL_TEMPORAL_2 where the READING_GROUP_CODE is '23' (i.e. 'Water Level').

V_SYS_SUMMARY_WL_AVG

This view returns the average as well as the number of water level records by interval in D_INTERVAL_TEMPORAL_2 where the RD_NAME_CODE's are '628' (i.e. 'Water Level - Manual - Static') or '629' (i.e. 'Water Level - Logger (Compensated & Corrected)').  Note that UNIT_CODE must be '6' (i.e. 'masl') and the value must not be NULL.  In addition, the REC_STATUS_CODE for a record must be null or have a value of less than '100'.

V_SYS_SUMMARY_WL_LOGGER

This view returns the first and last date and logger water level value as well as the total number of records by interval from D_INTERVAL_TEMPORAL_2 where the RD_NAME_CODE is '629' (i.e. 'Water Level - Logger (Compensated & Corrected)').

V_SYS_SUMMARY_WL_MANUAL

This view is similar to V_SYS_SUMMARY_WL_MANUAL with the exception that the RD_NAME_CODE is '628' (i.e. 'Water Level - Manual - Static').

V_SYS_SUMMARY_WQ

This view returns the minimum and maximum dates as well as the number of water quality readings by interval in D_INTERVAL_TEMPORAL_1B.  Note that those intervals of INT_TYPE_CODE '29' (i.e. 'Soil or Rock') are excluded.

V_SYS_SUMMARY_WQ_SAMPLES

This view returns the number of samples by interval in D_INTERVAL_TEMPORAL_1A.  Note that the interval samples are grouped by sample date (dropping the hour and minute information, if present) to avoid possible duplication.

V_SYS_UGAIS_ALL

This view returns all LOC_ID's and associated INT_ID's identified as a UGAIS source (i.e. from the Ontario Borehole Database 'Urban Geology Analysis Information System').  The latter value may be a NULL (if no intervals are assigned).  The UGAIS field is populated with a '1' value; this can be used as a check in table joins.  These locations are determined by testing the text string '%ugais%' against LOC_NAME in D_LOCATION.

V_SYS_UGAIS_LOCATION

V_SYS_UGAIS_SCREEN

Similar to V_SYS_GEN_UGAIS_ALL, this view returns all LOC_ID's and INT_ID's with an identified screen type (using V_SYS_INT_TYPE_CODE_SCREEN).  No INT_ID values will be NULL.

V_SYS_UGAIS_SOIL

Similar to V_SYS_GEN_UGAIS_SCREEN, this view returns all LOC_ID's and INT_ID's with an INT_TYPE_CODE of '29' (i.e. 'Soil or Rock').

V_SYS_S_USER_ID_RANGES

This view returns the user identifier ranges (as specified through SiteFX; this is based on names assigned to licensed accounts) as found in the S_USER table tagged with 'uniqueIDranges'.  These range-of-values should conform to those specified in the various V_SYS_RANDOM_ID_* views, above.

V_SYS_VERSION_CURRENT

This view returns the database version from D_VERSION_CURRENT and assigns the current date to CUT_DATE.  This is used to record the current database version and date-stamp exported datasets. 

V_SYS_W_GENERAL

This view is used to populate the W_GENERAL table (generally weekly) and consisting of those locations present in D_BOREHOLE.  Various substitutions, in general, are made (for viewing purposes): NULL values are converted to '0'; NULL date fields are converted to NA; the bedrock elevation has a text field (in addition to the numeric) where a NULL is converted to NA; the flowing field has a text field (in addition to the numeric) where a 'Y' or 'N' is added, appropriately.  Note that only those locations present in V_SYS_AGENCY_YPDT are included here.  Those locations with LOC_TYPE_CODE of '20' (i.e. 'Archive') are also not present.

A number of data tables and views are accessed to extract information, these include:

    - V_CON_GENERAL
    - D_LOCATION_GEOM
    - D_LOCATION_SUMMARY
    - V_SYS_MOE_WELL_ID
    - D_LOCATION_PURPOSE
    - D_BOREHOLE
    - V_SYS_SUMMARY_MON_FLOWING
    - V_SYS_SUMMARY_FLOW_RATE
    - D_LOCATION

V_SYS_W_GENERAL_DOCUMENT

This view is used to populate the W_GENERAL_DOCUMENT table (generally weekly).  This includes the bibliographic information for each document (using V_GEN_DOCUMENT_BIBLIOGRAPHY) and their coordinates along with their sptail geometry (if available).

V_SYS_W_GENERAL_GW_LEVEL_LOG

This view is used to populate the W_GENERAL_GW_LEVEL table (generally weekly) with logger water levels.  Here, the daily water level average and number of records are extracted from V_GEN_WATER_LEVEL_AVG_DAILY_LOGGER while the date is converted to 'mm/dd/yyyy' format and the RD_NAME_CODE changed to '645' (i.e. 'Water Level - Logger - Calc - Daily Average').  Note that only intervals where the WL_LOGGER_TOTAL_NUM is greater than '25' (or the WL_LOGGER_TOTAL_NUM plus the WL_MANUAL_TOTAL_NUM is greater than '25') are included.  The latter two fields are found in D_INTERVAL_SUMMARY.

V_SYS_W_GENERAL_GW_LEVEL_MAN

This view is used to populate the W_GENERAL_GW_LEVEL table (generally weekly) with manual water levels.  Here, the manual water levels are extracted from D_INTERVAL_TEMPORAL_2 where the RD_NAME_CODE is '628' (i.e. 'Water Level - Manual - Static').  Note that only intervals where the WL_LOGGER_TOTAL_NUM or WL_MANUAL_TOTAL_NUM (or the combination) is greater than '25' are included here.  These two fields are found in D_INTERVAL_SUMMARY.  In addition, note that the field name used WL_AVG_MASL does not apply to manuals (i.e. they are not an average).  No NULL RD_DATE's are included.

V_SYS_W_GENERAL_OTHER

This view is used to populate the W_GENERAL_OTHER table (generally weekly).  Only the following location types are included (LOC_TYPE_CODE in brackets):

    - Surface Water ('6')
    - Climate Station ('9')
    - Pumping Station ('10')
    - Seismic Station ('15')
    - Permit to Take Water ('22')

Refer to V_SYS_W_GENERAL (above) for additional details and changes.  A number of data tables and views are accessed to extract information, these include:

    - V_GEN
    - V_SYS_GENERAL_INTERVAL
    - D_LOCATION_GEOM
    - D_LOCATION_SUMMARY
    - D_INTERVAL_SUMMARY
    - D_LOCATION_PURPOSE
    - V_GEN_PTTW

V_SYS_W_GENERAL_OTHER_PTTW_ACTIVE

This view is used to change the status of 'permit to take water' (PTTW) locations in W_GENERAL_OTHER (using the STATUS field).  If the PTTW_EXPIRYDATE is in the future or within 6 months of the present the LOC_STATUS_DESCRIPTION 'PTTW Active' (i.e. LOC_STATUS_CODE '19') is returned.

V_SYS_W_GENERAL_SCREEN

This view is used to populate the W_GENERAL_SCREEN table (generally weekly).  Refer to V_SYS_W_GENERAL (above) for additional details and changes.  A number of data tables and views are access to extract information, these include:

    - V_CON_HYDROGEOLOGY
    - D_LOCATION_GEOM
    - D_LOCATION_SUMMARY
    - D_LOCATION_PURPOSE
W_GENERAL
    - V_SYS_DIFA_ASSIGNED_FINAL
    - D_BOREHOLE
    - V_SYS_W_GENERAL_SCREEN_NEST

V_SYS_W_GENERAL_SCREEN_NEST

This view returns those locations that have been tagged as belonging to a 'nest' of wells (i.e. a grouping of wells usually from the same general area); the GROUP_LOC_CODE (from D_GROUP_LOCATION) is included.  Note that these groupings will correspond to GROUP_LOC_TYPE_CODE '6' (i.e. 'Well Nest').

V_SYS_WATERLEVELS_BARO_DAILY

This view returns the number of barologger readings on a particular day for a particular interval.  Only those intervals classified as 'Barometric Logger Interval' ('122') are examined.  The RD_NAME_CODE must be '629' ('Water Level - Logger (Compensated & Corrected)' with a UNIT_CODE of '128' ('cmap baro') for a record (from D_INTERVAL_TEMPORAL_2) to be included.  Note that each of year, month and day are returned as separate integer fields.

V_SYS_WATERLEVELS_BARO_YEARLY

This view returns the minimum and maximum barologger readings as well as starting and ending dates (for the data) on a yearly basis, by interval.  The number of days with barologger data is also indicated (using V_SYS_WATERLEVELS_BARO_DAILY).

V_SYS_WATERLEVELS_MANUAL_FIRST

This view returns the first manual water level from D_INTERVAL_TEMPORAL_2 for each interval.  These will have a RD_NAME_CODE of '628' (i.e. 'Water Level - Manual - Static'); the date is converted to 'mm/dd/yyyy'.

V_SYS_WATERLEVELS_RANGE

This view returns the minimum, maximum and average value as well as number of water level records from D_INTERVAL_TEMPORAL_2 for each interval.  These will have an RD_NAME_CODE of '628' (i.e. 'Water Level - Manual - Static') or '629' (i.e. 'Water Level - Logger (Compensated & Corrected)') as well as a UNIT_CODE of '6' (i.e. 'masl').

V_SYS_WATERLEVELS_YEARLY_AVG

This view returns the minimum, maximum and average value as well as the number of water level records from V_CON_HYDROGEOLOGY for each interval for each year of data.  The same reading name codes and unit codes as V_SYS_WATERLEVELS_RANGE (above) are used.  In addition, only those intervals that have greater than 25 water level records are included.  

V_SYS_WATERLEVELS_YEARLY_BOTH

This view returns the calculated minimum, maximum and average value as well as the number of water level records from D_INTERVAL_TEMPORAL_2 for each interval for each year of data.  This is similar to V_SYS_WATERLEVELS_YEARLY_LOGGER and V_SYS_WATERLEVELS_YEARLY_MANUAL (below) with the exception that the logger and manual data is combined to determine the values.

V_SYS_WATERLEVELS_YEARLY_LOGGER

This view returns the calculated minimum, maximum and average value as well as the number of water level records from D_INTERVAL_TEMPORAL_2 for each interval for each year of data.  These records must have an RD_NAME_CODE of '629' (i.e. 'Water Level - Logger (Compensated & Corrected)') and a UNIT_CODE of '6' (i.e. 'masl').

V_SYS_WATERLEVELS_YEARLY_MANUAL

This view is similar to V_SYS_WATERLEVELS_YEARLY_LOGGER (above) with the exception that the records use an RD_NAME_CODE of '628' (i.e. 'Water Level - Manual - Static').

V_SYS_YPDT_VL_GEOLOGY

This view was originally a source for V_VL_GEOLOGY that enabled inclusion of the 'YPDT Viewlog Header Well'.  This has now been disabled and this view will be removed in a future database version.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    

V_SYS_YPDT_VL_HEADER_LOG

This view was originally a source for V_VL_HEADER_LOG.  Refer to V_SYS_YPDT_VL_GEOLOGY (above) for additional details.

V_SYS_YPDT_VL_HEADER_SCREEN

This view was originally a source for V_VL_HEADER_SCREEN.  Refer to V_SYS_YPDT_VL_GEOLOGY (above) for additional details.

V_SYS_YPDT_VL_HEADER_WELL

This view returns the information in D_LOCATION related to the 'YPDT Viewlog Header Well'.



