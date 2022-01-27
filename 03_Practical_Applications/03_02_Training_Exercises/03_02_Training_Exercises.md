---
title:  "Section 3.2"
author: "ormgpmd"
date:   "20220127"
output: html_document
knit:   (
            function(input_file, encoding) {
                out_dir <- '';
                rmarkdown::render(
                    input_file,
                    encoding=encoding,
                    output_file=file.path(dirname(input_file), out_dir,
                    '03_02_Training_Exercises.html')
                )
            }
        )
---

## Section 3.2 Training Exercises

The training exercises are to be found in Appendix J (Training Exercises), and are broken into 'Easy', 'Moderate' and 'Difficult' sections.  Readers are also referred to Appendix A (Basic Outline and Use of Structured Query Language) for examples on the use of SQL as applied against the ORMGP database.

Software requirements for the training exercises in Appendix J include:
* Microsoft Access - all D_\*, R_\* and V_\* tables/views have to be linked into an Access database (using the procedures described in Section 3.1.1);  
* Microsoft SQL Management Studio - the user should be logged into the SQL Server hosting the partner database.  A server name of 'MAIN\PARTNER' and a database of 'OAK_20120615_CLOCA' is assumed for the latter; 
* SiteFX, Viewlog or other software (e.g. GIS applications) should have the appropriate file(s) or connection(s) available (see the appropriate section in Section 3.1).


