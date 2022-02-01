---
title:  "Appendex F"
author: "ormgpmd"
date:   "20220201"
output: html_document
knit:   (
            function(input_file, encoding) {
                out_dir <- '';
                rmarkdown::render(
                    input_file,
                    encoding=encoding,
                    output_file=file.path(dirname(input_file), out_dir,
                    'F_Accessory_Databases.html')
                )
            }
        )
---

## Appendix F - Accessory ORMGP Databases

As of ORMGP Database version 20160831, all supplementary database tables and views have been incorporated in OAK_20160831_MASTER.  Refer to the 'YPDT-CAMC Database Manual Version 5 (Dated Version 20120615)' manual for previous accessory databases.

