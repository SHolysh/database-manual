---
title:  "Section 2.8"
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
                    '02_08_Multi-Borehole_Records.html')
                )
            }
        )
---

## Section 2.8 Multi-Borehole Wells

Since 2003 the MOE has allowed consultants to provide only one well record for a site upon which many boreholes may be drilled.  This option was provided so that the geology, which may be similar at different boreholes drilled on the same site, need only be submitted and entered into the WWIS once.  For these cases, within the WWIS each borehole is given a BORE_HOLE_ID (in the MOE's 'tblBore_Hole' table) and they are all linked under one WELL_ID.  The 'tblBore_Hole' table provides limited information on each borehole including the UTM coordinates, the completion date and whether the borehole is a bedrock or overburden well.

When transferred to the ORMGP database, each of these boreholes is given a unique LOC_ID and are linked to the original MOE borehole through the LOC_ORIGINAL_NAME (MOE Well_ID) as well as through the LOC_MASTER_LOC_ID - both fields being found in the D_LOCATION table.  Each borehole would also have a record in the D_BOREHOLE table although only a few selected fields within the table would contain data.

In order to preserve a link between the two databases, the MOE's BORE_HOLE_ID field (which becomes the MOE unique identifier for these multi-borehole wells) must somehow be transferred into the ORMGP database.  In the 2010 MOE data import the BORE_HOLE_ID was transferred to the LOC_NAME_ALIAS table - unfortunately, previous MOE boreholes (i.e. those already in the database) were not similarly populated.  It is proposed that for future MOE imports, that BORE_HOLE_ID field be stored in the LOC_NAME_ALT2, one of the last columns found in the D_LOCATION table.  Alternatively, the LOC_NAME_ALIAS table can continue to be used but with a complete incorporation of all MOE boreholes.

Updated as of 2014-11-18: Note that the inclusion of the MOE's BORE_HOLE_ID field has been applied in the latest incorporation of the MOE WWDB and is found in the LOC_NAME_ALIAS table.  An attempt to populate the previous MOE WWDB imports BORE_HOLE_ID values was also undertaken.
