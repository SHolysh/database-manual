---
title:  "Cover and Table of Contents"
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
                    'TOC.html')
                )
            }
        )
---

![Cover Page](../Cover/cover.jpg)

## Table of Contents

### [Forward](https://owrc.github.io/database-manual/Forward/Forward.html)

### Section 1 - Introduction

* **[1.1 Overview](https://owrc.github.io/database-manual/01_Introduction/01_01-02_Overview_and_Background.html)**
* **[1.2 Background](https://owrc.github.io/database-manual/01_Introduction/01_01-02_Overview_and_Background.html)**
* **[1.3 Database Versions](https://owrc.github.io/database-manual/01_Introduction/01_03_Database_Versions.html)**

### Section 2 - Understanding the OMGP Database

* **[2.1 Tables and Views](https://owrc.github.io/database-manual/02_Understanding_ORMGP_Database/02_01_Tables_and_Views/02_01_Tables_and_Views.html)**

    + **[2.1.1 Data Tables (D_\*)](https://owrc.github.io/database-manual/02_Understanding_ORMGP_Database/02_01_Tables_and_Views/02_01_01_Data_Tables.html)**
    + **[2.1.2 Reference Tables (R_\*)](https://owrc.github.io/database-manual/02_Understanding_ORMGP_Database/02_01_Tables_and_Views/02_01_02_Reference_Tables.html)**
    + **[2.1.3 Other Tables](https://owrc.github.io/database-manual/02_Understanding_ORMGP_Database/02_01_Tables_and_Views/02_01_03_Other_Tables.html)**
    + **[2.1.4 Views Outline](https://owrc.github.io/database-manual/02_Understanding_ORMGP_Database/02_01_Tables_and_Views/02_01_04_Views.html)**
    + **[2.1.5 Main Views (V_\*)](https://owrc.github.io/database-manual/02_Understanding_ORMGP_Database/02_01_Tables_and_Views/02_01_05_Main_Views.html)**
    + **[2.1.6 System Views (V_SYS_\*)](https://owrc.github.io/database-manual/02_Understanding_ORMGP_Database/02_01_Tables_and_Views/02_01_06_System_Views.html)**

* 2.2 General Overview of Relationships

* 2.3 Primary Data Relationships

* 2.4 Secondary (or Derived) Data Relationships)

* 2.5 Locations, Groups and Study Areas

* 2.6 Report Library

* 2.7 Multi-Screen Installations

* 2.8 Multi-Borehole Records

### Section 3 - Practical Applications

* 3.1 Working with the Database

* 3.2 Training Exercises

* 3.3, Guidelines and FAQ

* 3.4 Adding New Data

* 3.5 Changes to Existing Data

### Section 4 - Technical

* 4.1 Detailed Overview of Relationships

* 4.2 Table Details (D_\*, R_\* and Other)

* 4.3 View Details (V_\*)

* 4.4 Database Distribution

* 4.5 Background Processing and Updates

### [References](./References/References.html)

### Appendices

* A - Basic Outline and Use of Structured Query Language (SQL)

* B - Soil Classification Systems and Translation of Geologic Layers

* C - Baseflow Estimation

* D - External Data Sources

* E - YPDT-CAMC/ORMGP Database Timeline

* F - Accessory ORMGP Databases

* G - Procedures

* H - Current Problems (to be Corrected)

* I - Training Setup

* J - Training Exercises

* K - Alternate Software Instructions

* L - Database Reports

