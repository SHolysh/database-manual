---
title:  "Section 3.3.3"
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
                    '03_03_03_Data_Source_Tracking.html')
                )
            }
        )
---

## Section 3.3.3 Data Source Tracking

Many tables within the database carry a DATA_ID field which, in most cases, should be populated.  This DATA_ID value (a randomly generated integer), as found in any table, is associated with a particular record within the D_DATA_SOURCE table indicating the hardcopy or electronic report, external database (including, for example: spreadsheets; Access '.mdb' files; text files; etc?) or project (to name a few options) from which the information for that particular record/row was extracted.  

Within the D_DATA_SOURCE table several fields track key information regarding the data source

* DATA_FILENAME - contains the path  and filename from which the data was uploaded into the database
* DATA_ADDED_METHOD - specifies the method by which the information was originally incorporated (e.g 'SiteFX Data Loader')
* DATA_ADDED_USER - specifies the user who loaded the original information
* DATA_ADDED_DATE - contains the date on which the information was added to the database
* DATA_RECORD_COUNT - contains the number of records added (dependent upon the method; any information entered manually will likely not have this field populated) 

In cases of possible discrepancies, the collection of the above information within the D_DATA_SOURCE table allows a user to retrace the steps necessary to check the information stored in the database against that of the original. Note that digital data sources submitted to the ORMGP are also kept on-hand for original source comparison.

To date the DATA_ID has been primarily applied at two levels.  Within the
D_LOCATION table, each location (i.e. separate row) is tagged with a DATA_ID
indicating the source from which the information was obtained (e.g. 2010 MOE
well record update, Environment Canada, Lake Simcoe Region CA, etc.).  This
information would then be found in the DATA_DESCRIPTION field within the
D_DATA_SOURCE table.  The second area where the DATA_ID has been employed is
within the D_INTERVAL_TEMPORAL_\* tables (i.e. 1A, 1B, and 2) to indicate (for example) the source of water level, pumping and chemistry data.  

Within the database, the data found in most of the other data tables (e.g.
D_GEOLOGY_LAYER, D_INTERVAL, D_BOREHOLE, etc.) is nearly always derived from
the same source as is reflected by the DATA_ID in the D_LOCATION table.  As
such, the DATA_ID values found in most of these tables would indicate
(multiple times) the same data source. However, there are cases where a
differing DATA_ID may be assigned; an example would be an update from a MOE
WWIS.  Here, records may be added to a variety of tables for a location that
already existed in the database.  In this case, these records would be tagged
to the new DATA_ID.

In addition, a second tracking mechanism is enabled within the database with regard to linking locations to document/report sources.  Where the information associated with a particular location (e.g. well) is tied to a report this linkage can be referenced by using the D_DOCUMENT_ASSOCIATION table (note that this is only for documents existing within the database; i.e. in the ORMGP Report Library).  Within the D_DOCUMENT_ASSOCIATION table, a document identifier (DOC_ID) can be linked with a location identifier (LOC_ID) indicating that information contained within the document/report is applicable to that location.  Multiple documents can be linked against the same location.  The DOC_ID links back to the D_DOCUMENT table containing information regarding the data contents (and possible inclusion of said data in the database) of any particular document/report (as indicated in the matching fields: DOC_YN_BH_LOG and DOC_YN_ENTERED_BH_LOG; DOC_YN_PUMP_TEST and DOC_TN_ENTERED_PUMP_TEST; etc ...).

Finally, to retain information found within the MOE WWIS database, the D_LOCATION table carries a LOC_DATA_SOURCE_CODE field.  This indicates from where the well record was derived (e.g. 'MOE staff', 'MNR staff', 'driller', etc. - see R_LOC_DATA_SOURCE for details).  The field is typically not populated for locations other than MOE wells. 

Refer also to the Section 4.2.1 (Data Tables) for additional details on the D_DATA_SOURCE, D_DOCUMENT and D_DOCUMENT_ASSOCIATION tables.

