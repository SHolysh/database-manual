---
title:  "Section 2.5"
author: "ORMGP"
date:   "20220125"
output: html_document
knit:   (
            function(input_file, encoding) {
                out_dir <- '';
                rmarkdown::render(
                    input_file,
                    encoding=encoding,
                    output_file=file.path(dirname(input_file), out_dir,
                    '02_05_Location_Groups_and_Study_Areas.html')
                )
            }
        )
---

## Section 2.5 Locations, Groups and Study Areas

## Section 2.5.1 Locations

Refer to Section 3.5.1 for location naming guidelines.  

## Section 2.5.2 Groups

Groups allow locations or intervals to be tagged as being associated - whether this be related to a particular project or study, spatial area, monitoring personnel, etc...  Any individual location/interval can be associated with multiple groups (different from 'Study Areas' where only a single 'Study Area' can be defined).

Three data tables 

* D_GROUP_INTERVAL
* D_GROUP_LOCATION
* D_GROUP_READING (currently unused)

and six look-up tables

* R_GROUP_INT_CODE
* R_GROUP_INT_TYPE_CODE
* R_GROUP_LOC_CODE
* R_GROUP_LOC_TYPE_CODE
* R_GROUP_READING_CODE (currently unused)
* R_GROUP_READING_TYPE_CODE (currently unused)

are used.  The data tables associate a LOC_ID, INT_ID or RD_NAME_CODE with a
particular GROUP_INT_CODE, GROUP_LOC_CODE or GROUP_READING_CODE.  The look-up
(R_\*) tables associate the individual \*_CODE's with a particular user-defined group name.  Examine the view 'V_Groups_Wells_BHs' for examples of existing location-based (i.e. grouped by LOC_ID) groups.

Refer to Section 3.2.2 for adding new groups to the database.

## Section 2.5.3 Study Areas

The free-format (i.e. text) columns LOC_AREA and LOC_STUDY, found in D_LOCATION, allows a single study area (LOC_AREA) and single project (LOC_STUDY) to be specified for each location.  LOC_AREA, when populated, indicates the general spatial area in which the location lies.  LOC_STUDY generally indicates the initial (or, if known, regional) study from which the location information was gleaned.  If present in multiple studies either of the 'Group' (Section 2.5.2) or - for reports/documents - 'Document Association' (Section 2.6.1) should be used.
