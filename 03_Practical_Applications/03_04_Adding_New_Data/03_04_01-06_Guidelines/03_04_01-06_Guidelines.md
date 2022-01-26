---
title:  "Section 3.4.1 through 3.4.6"
author: "ORMGP"
date:   "20220126"
output: html_document
knit:   (
            function(input_file, encoding) {
                out_dir <- '';
                rmarkdown::render(
                    input_file,
                    encoding=encoding,
                    output_file=file.path(dirname(input_file), out_dir,
                    '03_04_01-06_Guidelines.html')
                )
            }
        )
---

## Section 3.4 Adding New Data - Guidelines

As much as possible, partner agencies are encouraged to enter as much of their own data into the database.  Data can also be submitted to ORMGP staff for data entry but partner agencies should consider the following when deciding between an in-house or submittal solution:

* Urgency of data need - if the new data is required urgently it is best handled by the partner agency.  Upon replication, information entered by the partner will be incorporated back in the master database (after QA-QC checking); submitting information to ORMGP staff may result in varying wait-times
* Individual comfort level in using the database - if there is some reluctance in using the database and software products, users are encouraged to contact the ORMGP staff for assistance; note that there are multiple methods of data entry possible, some that are (or can be) open to more errors than others
* Agency staffing capacity - if the capacity to enter the data in-house is limited, ORMGP staff may be able to assist
* Familiarity with the data - in general it is best if those most familiar with the data enter it (especially true with data logger data files)

Note that there may be some combination of data entry, for example, whereby partner agency staff adds some of the data to their database with ORMGP staff assisting with the entry of the remainder of the associated data.  With regard to deciding on data/information to be entered into the database, users should prioritize data entry according to overall quality (e.g. deeper wells are typically more valuable than shallow wells; wells drilled by known reliable drillers are more valuable than those drilled by others, etc?). 

The entry of reports into the database should be undertaken by the ORMGP staff as each report must be assigned a folder number that provides a link between the programs database and website.  This should not discourage users from assembling requisite information on each report for forwarding to ORMGP staff (refer to Section 2.3.7). When submitting documents to the ORMGP staff for entry into the database, a PDF copy of the main report is encouraged as the preferred format.  Any related documentation (e.g. appendices, large scanned maps, large cross-sectional diagrams, etc?) should also be in PDF format or, secondly, in a common graphic format (e.g. JPG or PNG).  These files can be transferred to the ORMGP office directly by FTP (users should contact ORMGP staff for instructions) or through submitted CDROM, DVD, etc...  Hard copy reports should remain at the partner agency (unless they are temporarily transferred for scanning purposes).

Users are referred to the 'SiteFX Users Manual', the latest version of which is generally found on the Earthfx website (www.earthfx.com).  The manual has many helpful hints and directions when adding data to the database (including boreholes, temporal data, etc?).  

## Section 3.4.1 Locations - Mandatory Fields

In order to maintain data integrity, there are a number of fields (found in certain tables) that must be included when adding new locations to the database.  Below are listed fields (from the source data) that should be checked for (acceptable) values before records are input (i.e. before inclusion in the database).  The fields marked with an asterisk are not necessarily mandatory but users are strongly encouraged to populate them in order to assist with long term database maintenance.

* D_DATA_SOURCE
    + DATA_DESCRIPTION\*

* D_LOCATION
    + LOC_NAME
    + LOC_NAME_ALT1
    + LOC_TYPE_CODE
    + LOC_ORIGINAL_NAME\*
    + LOC_STUDY
    + LOC_COORD_EASTING_OUOM
    + LOC_COORD_NORTHING_OUOM
    + LOC_COORD_OUOM_CODE
    + LOC_STATUS_CODE\*
    + DATA_ID\*
    + LOC_NAME_MAP\*

* D_LOCATION_PURPOSE
    + PURPOSE_PRIMARY_CODE\*
    + PURPOSE_SECONDARY_CODE\*

* D_LOCATION_QA
    + QA_COORD_CONFIDENCE_CODE
    + QA_COORD_CONFIDENCE_CODE_ORIG (value same as previous)

For boreholes (and similar), the following fields/tables should also be populated:

* D_BOREHOLE
    + BH_BOTTOM_DEPTH\*
    + BH_BOTTOM_UNIT_OUOM\*
    + BH_DRILL_END_DATE\*

* D_GEOL_LAYER (for each layer in a borehole)
    + GEOL_TOP_OUOM
    + GEOL_BOT_OUOM
    + GEOL_UNIT_OUOM
    + GEOL_MAT1_CODE
    + GEOL_MAT2_CODE
    + GEOL_MAT3_CODE
    + GEOL_MAT4_CODE

For intervals (e.g. screens or soil/rock), the following fields/tables should be also populated:

* D_INTERVAL
    + INT_NAME
    + INT_NAME_ALT1
    + INT_TYPE_CODE
    + INT_START_DATE\*

* D_INTERVAL_MONITOR (i.e. screens)
    + MON_TOP_OUOM
    + MON_BOT_OUOM
    + MON_UNIT_OUOM

* D_INTERVAL_REF_ELEV
    + REF_POINT\*
    + REF_ELEV_OUOM
    + REF_ELEV_UNIT_OUOM
    + REF_ELEV_START_DATE\*

* D_INTERVAL_SOIL (i.e. soil/rock samples)
    + SOIL_TOP_OUOM
    + SOIL_BOT_OUOM
    + SOIL_UNIT_OUOM
    + SOIL_BLOW_COUNT\*
    + SOIL_RECOVERY\*

## Section 3.4.2 Geologic Information

The geological tables within the database are one of the most important components, directly impacting both the interpreted and assigned geological formations and, ultimately, the groundwater flow patterns that are used to calibrate the groundwater flow models.  When adding borehole information to the database, the interpretation of consultant stratigraphic descriptions from borehole logs will be required.  Consultants typically describe soils based on a variation of an engineering soil classification system as opposed to a pedological system (i.e. pedology or 'soil science'; usually limited to the upper 2 metres of a soil column).

The D_GEOLOGY_LAYER table contains the descriptions of each geological layer intersected by a borehole in the database (linked to a location through the LOC_ID field).  Typically, new borehole locations are entered using SiteFX and this is considered to be the most appropriate tool for entering geology information into the database.  SiteFX ensures that all data, including geological descriptions, get distributed to the correct tables using valid codes (refer to Section 2.1 for a more complete description of the fields and reference tables used).  Note, however, that entry of geology through SiteFX is restricted to a well-by-well and layer-by-layer basis.  Bulk loading of data (not limited to geology information) is described in Section 3.5.

The MOE material coding system is used within the database.  Originally developed by the MOE for the water well drilling industry, it involves describing the stratigraphic unit (or soil horizon) in terms of a Material 1 (Primary), Material 2 (With), Material 3 (Trace) and Material 4 (Occasional) where Material 1 is the most common constituent and Material 4 is the least common constituent.  This use of the Material 1 through 4 system in transcribing a consultant's well information will often necessitate a simplification of the original description.  The use of only four descriptors cannot always adequately represent all of the soil constituents and/or structural descriptors that typically constitute a comprehensive consultant borehole log.  For example, it is very difficult to adequately portray a 'clay silt till with trace sand and trace gravel; dense; becoming wet at 5.3 m' as Material 1, Material 2 and Material 3.  To address this issue, the D_GEOLOGY_LAYER table includes the GEOL_DESCRIPTION field allowing the full, original consultant description to be stored (and not lost upon data entry; SiteFX does populate this field, if specified).  In addition, although not directly accessed by SiteFX, there are four fields within the D_GEOLOGY_LAYER table that can be used to store additional geotechnical information on any layer in the database:  GEOL_CONSISTENCY_CODE, GEOL_MOISTURE_CODE, GEOL_TEXTURE_CODE and GEOL_ORGANIC_CODE.  Values can be entered manually into these fields once a layer and its geological description have been entered into the database (or included when 'bulk-loading' data).  When entering geological data into the database, the goal is to most accurately represent the actual material described on the log, or in the case of a soil containing more than 3 constituents, describe the predominant constituents or other key descriptions (e.g. till).  

In reviewing the data entry for many existing boreholes within the database it has been noted that D_GEOLOGY_LAYER data has been slanted such that the GEOL_MAT? _CODE fields tend to favour 'raw' (i.e. component) terminology over interpreted descriptions.  This has resulted in the preferential removal of two geological terms considered to be critical: 'till' and 'fill' (GEOL_MAT1_CODE's '34' and '1').  These identifiers, if correctly applied to a geological unit, are important in terms of characterizing the subsurface stratigraphy, especially as it relates to the assignment of layers to a hydrostratigraphic unit.  It is recommended that these two terms be entered into the GEOL_MAT1_CODE field and any descriptors applied to 'fill' or 'till' be entered into the subsequent fields.  For example, a layer description of 'silty sand, trace gravel, occasional clay layers, some stones, dense (till)' would be entered (all within SiteFX, with the exception noted) as:

* GEOL_MAT1_CODE a value of '34' ('Till')
* GEOL_MAT2_CODE a value of '28' ('Sand') 
* GEOL_MAT3_CODE a value of '6' ('Silt') 
* GEOL_MAT4_CODE a value of '11' ('Gravel')
* GEOL_DESCRIPTION would contain the original, complete description of 'silty sand, trace gravel, occasional clay layers, some stones, dense (till)'
* GEOL_CONSISTENCY a value of '3' ('Dense'); note that this value would necessitate a manual entry

For additional detail, the D_GEOLOGY_FEATURE table can be used to add any number of characteristics to a particular borehole (note that SiteFX does not provide direct access to this table).  The initial role of this table was to house particular geological descriptions (such as fractures, zones of weathering, styolites, or fossils, etc...) that may not necessarily have a top or bottom depth/elevation (though this can be specified as well).  The table currently houses the driller's note of the elevation where water was found in any borehole (from the MOE) as well as detailed information from a limited number of boreholes (see Eyles and Doughty, 1996).

## Section 3.4.3 Hydraulic Properties

The key hydrogeologic properties that should be captured in the database include hydraulic conductivity (K), specific capacity, storativity or specific yield (S or S') and transmissivity (T).  These values are calculated or estimated from the results of pumping or slug tests undertaken at a well.  Both water level measurements and these hydraulic property estimates are stored in the database within D_INTERVAL_TEMPORAL_2.  Note that the results, similar to the water levels themselves, are associated with or tied to a specific INT_ID (as found in D_INTERVAL) which represents the well screen (or soil/rock sample).  Although water levels at several wells could be used to derive estimates of some of the hydraulic properties (e.g. distance/drawdown plots) the estimated hydraulic parameters are to be associated with the interval at the main pumping well and not with the associated monitoring wells.  Although, the database does include have the flexibility to link monitored locations to specific pumping tests through the D_GROUP_LOCATION or D_GROUP_INTERVAL tables.

The hydraulic descriptions and equivalent codes can be found in R_RD_NAME_CODE.  The codes of interest, listed here, include:

* 'Specific Capacity' has a value of '748'
* 'T - Transmissivity' has a value of '757'
* 'K - Conductivity' has a value of '758'
* 'S - Storativity' has a value of '760'

The table D_INTERVAL_PROPERTY is currently unused and should not house any hydraulic information.  It will be removed in a future database version.

## Section 3.4.4 Geophysical Logging

The results of geophysical logging of boreholes can also be stored in the ORMGP database.  The data and associated information are found in a series of four tables prefixed with D_GEOPHYSICAL_LOG_*.  Available logging tool types are listed in R_GEOPHYSICAL_LOG_NAMELIST.  Actual data is stored in the table D_GEOPHYSICAL_LOG_DATABIN - this information had been originally compressed for the previous Microsoft Access versions of the database and has not been modified in the current database (version 20120615).  This is being re-evaluated and will likely change in subsequent versions.  As such, information should only be added to the database by ORMGP staff.

The data is currently stored in 'Binary Large Objects' (BLOBs) that contain the geophysical logging results in 4 byte IEEE single precision values.  The data can be visualized using the Viewlog software in either cross-section mode (to facilitate correlation between boreholes) or through the 'Source Browser' window.  

## Section 3.4.5 Temporal Data

In addition to adding new wells into the database, users will most frequently be adding temporal data, usually: water level data; logger data; pumping data; or water quality data.  These information can be added through the use of SiteFX either through the 'Import Data' function (in bulk) or through the 'Location Editor' mode (individually).  It is important to ensure that upon entry to the database that the data is in the correct format. That the RD_NAME_CODE in particular is correct; that the data is being assigned to the correct interval (the INT_ID) and that it is not already present in the database.  Upon bulk import of data logger files in particular, it is quite common for parts of the file to already be in the database.  In these instances it is best to remove those duplicate records prior to import by checking the date of the first and last records in the database versus those in the data logger file to be imported.

## Section 3.4.6 Data Validation and Conversion

In all tables a general rule of thumb is to enter raw input values into a particular table's _OUOM fields along with the codes (e.g. valid RD_NAME_CODEs) necessary to describe the particular parameter.  The parameter units (as applicable) are to be entered into the _UNIT_OUOM field.  Note that all parameter names must match those found in R_RD_NAME_CODE or R_READING_NAME_ALIAS.  All unit names must match those found in R_UNIT_CODE.

Currently, SiteFX handles the conversion of the _OUOM fields and population of the _VALUE fields.  For example, in D_INTERVAL_TEMPORAL_2 the original data field (i.e. the source data) is RD_VALUE_OUOM and the original units would be found in RD_UNIT_OUOM.  The SiteFX converted 'value' (from the original source data and unit; refer to R_UNIT_CONV) would be stored in RD_VALUE.  In addition to the temporal data, depths and elevations (in applicable tables; e.g. D_BOREHOLE) are also checked by SiteFX and converted (generally to metres-above-sea-level; masl).

Note that if an unknown name description or unit description is specified in the applicable _OUOM field, SiteFX does not perform a conversion and only copies these _OUOM values in the RD_VALUE and UNIT_CODE fields.  In addition, these 'new' name and unit codes will be appended to the appropriate tables (i.e. R_RD_NAME_CODE and R_UNIT_CODE), possibly introducing duplicate (though slightly different-named) parameters.  Users should be careful to only use existing name and unit descriptions as found in the database.  Those wishing to add new name or unit codes to the reference tables should contact ORMGP staff for appropriate instructions.


