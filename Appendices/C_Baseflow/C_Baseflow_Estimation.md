---
title:  "Appendix C"
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
                    'C_Baseflow_Estimation.html')
                )
            }
        )
---

## Appendix C - Baseflow Estimation

The ORMGP database no longer contains estimates of groundwater discharge from total streamflow at gauging stations.  Instead this information is generated on-the-fly, using a variety of techniques

This is available, online, through the [ORMGP website](https://www.oakridgeswater.ca).




