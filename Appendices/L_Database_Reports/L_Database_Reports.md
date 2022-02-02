---
title:  "Appendix L"
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
                    'L_Database_Reports.html')
                )
            }
        )
---

## Appendix L - Database Reports


