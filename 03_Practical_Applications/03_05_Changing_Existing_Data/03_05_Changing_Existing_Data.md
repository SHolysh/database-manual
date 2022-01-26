---
title:  "Section 3.5"
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
                    '03_05_Changing_Existing_Data.html')
                )
            }
        )
---

## Section 3.5 Changes to Existing Data

Changes to existing records/rows in the database can be accomplished through
(generally) any of the tools first described in Section 3.1.  In most cases,
changes to existing records in the database, unless the minor or fairly
simple, should be made through SiteFX for most users.  This facilitates
interaction with the database and provides a number of checks/guides to avoid
data-modification (or, for that matter, data-entry) errors.  It is especially
suitable for novice users as the safeguards in place will help avoid
accidental errors.  In many cases, modification using SiteFX (of, for example,
a location) results in changes across multiple tables that would be
transparent to the user.  Note that some overview training
should be carried out by ORMGP staff to avoid or be aware of this programs
foibles.

SiteFX provides a straightforward way to change, input or view all the relevant data associated with a location in the database without having to directly navigate through a large number of tables.  When in the SiteFX 'Location Editor' window, for example, all intervals that are associated with the location being edited are displayed.  This allows users to directly add temporal data (e.g. water levels, chemistry, etc...) specific to each interval at the location.  

When adding or changing data through SiteFX, the program will perform necessary conversion calculations including coordinate conversion to NAD83 and conversion of depths (e.g. geologic formations or borehole construction details) to elevations, whether they be entered in feet or metres (or other unit, see R_UNIT_CODE; refer also to Section 3.4.6 regarding the handling of the 'original' values).

As of 2021-01-01, however, alternatives are actively being investigated by
ORMGP staff to superseed the use of SiteFX.

