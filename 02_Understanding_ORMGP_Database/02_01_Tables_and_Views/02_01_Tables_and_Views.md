---
title:  "Section 2.1"
author: "ormgpmd"
date:   "20220131"
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

