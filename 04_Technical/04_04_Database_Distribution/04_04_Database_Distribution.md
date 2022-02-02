---
title:  "Section 4.4"
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
                    '04_04_Database_Distribution.html')
                )
            }
        )
---

## Section 4.4 - Database Distribution

Partner databases (a subset of the master database) are made available,
usually, twice per year (at least).  These releases correspond to ORMGP
partner meetings.  MS Access files containing all information
pertinent to a partners spatial extents (usually with a 5km buffer boundary)
with the exception of temporal data (field) are generally available.  Due to size constraints, only
daily average water levels and manual water levels are included.  On request,
complete datasets for a particular partner are made availabe through an MS SQL
Server bak file.

All files are made availavle through ORMGP Dropbox account with individual
download links sent to interested partner agencies.

