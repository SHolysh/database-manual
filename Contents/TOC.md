---
title:  "Cover and Table of Contents"
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
                    'TOC.html')
                )
            }
        )
---

![Cover Page](/database-manual/Cover/cover.jpg)

## Table of Contents

### [Forward](/database-manual/Forward/Forward.html)

### Section 1 - Introduction

* **[1.1 Overview](/database-manual/01_Introduction/01_01-02_Overview_and_Background.html)**
* **[1.2 Background](/database-manual/01_Introduction/01_01-02_Overview_and_Background.html)**
* **[1.3 Database Versions](/database-manual/01_Introduction/01_03_Database_Versions.html)**

### Section 2 - Understanding the OMGP Database

* **[2.1 Tables and Views](/database-manual/02_Understanding_ORMGP_Database/02_01_Tables_and_Views/02_01_Tables_and_Views.html)**

    + **[2.1.1 Data Tables (D_\*)](/database-manual/02_Understanding_ORMGP_Database/02_01_Tables_and_Views/02_01_01_Data_Tables.html)**
    + **[2.1.2 Reference Tables (R_\*)](/database-manual/02_Understanding_ORMGP_Database/02_01_Tables_and_Views/02_01_02_Reference_Tables.html)**
    + **[2.1.3 Other Tables](/database-manual/02_Understanding_ORMGP_Database/02_01_Tables_and_Views/02_01_03_Other_Tables.html)**
    + **[2.1.4 Views Outline](/database-manual/02_Understanding_ORMGP_Database/02_01_Tables_and_Views/02_01_04_Views.html)**
    + **[2.1.5 Main Views (V_\*)](/database-manual/02_Understanding_ORMGP_Database/02_01_Tables_and_Views/02_01_05_Main_Views.html)**
    + **[2.1.6 System Views (V_SYS_\*)](/database-manual/02_Understanding_ORMGP_Database/02_01_Tables_and_Views/02_01_06_System_Views.html)**

* **[2.2 General Overview of Relationships](/database-manual/02_Understanding_ORMGP_Database/02_02_General_Overview_of_Relationships/02_02_General_Overview_of_Relationships.html)**

* 2.3 Primary Data Relationships

    + **[2.3.1 MOE Records](/database-manual/02_Understanding_ORMGP_Database/02_03_Primary_Data_Relationships/02_03_01_MOE_Records.html)**
    + **[2.3.2 Consultant Report Data](/database-manual/02_Understanding_ORMGP_Database/02_03_Primary_Data_Relationships/02_03_02_Consultant_Report.html)**
    + **[2.3.3 Grain Size Data](/database-manual/02_Understanding_ORMGP_Database/02_03_Primary_Data_Relationships/02_03_03_Grain_Size.html)**
    + **[2.3.4 Chemistry Data](/database-manual/02_Understanding_ORMGP_Database/02_03_Primary_Data_Relationships/02_03_04_Chemistry.html)**
    + **[2.3.5 Water Level Data](/database-manual/02_Understanding_ORMGP_Database/02_03_Primary_Data_Relationships/02_03_05_Water_Level.html)**
    + **[2.3.6 Climate Station Data](/database-manual/02_Understanding_ORMGP_Database/02_03_Primary_Data_Relationships/02_03_06_Climate_Station.html)**
    + **[2.3.7 Report Library Information](/database-manual/02_Understanding_ORMGP_Database/02_03_Primary_Data_Relationships/02_03_07_Report_Library.html)**
    + **[2.3.8 Permit To Take Water (PTTW)](/database-manual/02_Understanding_ORMGP_Database/02_03_Primary_Data_Relationships/02_03_08_PTTW.html)**
    + **[2.3.9 HYDAT and Spotflow Data](/database-manual/02_Understanding_ORMGP_Database/02_03_Primary_Data_Relationships/02_03_09_HYDAT.html)**

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

### [References](/database-manual/References/References.html)

### Appendices

* [A - Basic Outline and Use of Structured Query Language (SQL)](/database-manual/Appendices/A_SQL_Outline/A_SQL_Outline.html)

* B - Soil Classification Systems and Translation of Geologic Layers

* [C - Baseflow Estimation](/database-manual/Appendices/C_Baseflow/C_Baseflow_Estimation.html)

* [D - External Data Sources](/database-manual/Appendices/D_External_Data/D_External_Data_Sources.html)

    + D.1 Datasets Summary Page - Locations
    + D.2 Specific Sources of Datasets - Locations
    + D.3 Datasets Summary Page - Chemistry Records
    + D.4 Datasets Summary Page - Climate Records
    + D.5 Datasets Summary Page - Field Records
    + D.6 Datasets Summary Page - Surface Water Records

* E - YPDT-CAMC/ORMGP Database Timeline

* [F - Accessory ORMGP Databases](/database-manual/Appendices/F_Accessory_Databases/F_Accessory_Databases.html)

* G - Procedures

* H - Current Problems (to be Corrected)

* [I - Training Setup and Access](/database-manual/Appendices/I_Training_Setup/I_Training_Setup.html)

    + I.1 Citrix XenDesktop
    + I.2 Geocortex

* J - Training Exercises

* [K - Alternate Software Instructions](/database-manual/Appendices/K_Alternate_Software.html)

* L - Database Reports


