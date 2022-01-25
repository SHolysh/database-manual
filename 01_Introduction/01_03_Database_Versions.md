---
title:  "Section 1.3"
author: "ORMGP"
date:   "20220125"
output: html_document
knit:   (
            function(input_file, encoding) {
                out_dir <- 'docs';
                rmarkdown::render(
                    input_file,
                    encoding=encoding,
                    output_file=file.path(dirname(input_file), out_dir, 'forward.html')
                )
            }
        )
---

## Section 1.3 Database Versions and Current Status

The following is a summary of the 'official' versions of the ORMGP (previously the YPDT-CAMC) database since the inception of the program in 2001 as well as a high level overview of significant changes and additions to the database over time.  For a more detailed timeline outlining the detailed changes and additions to the database, refer to Appendix E.

### Database Release 1

* Date: 2002 - 2003
* Database Type: Microsoft Access
* Documentation: Data Management System, 2002 Report (EarthFX, 2003)
* Major Components include: 
    + MOE data (to December 2000); 
    + ORM location updates (from Hunter); 
    + City of Toronto boreholes
* Release: used by the YPDT-CAMC Group & released to Partner Agencies (2002 through 2003)

### Database Release 2

* Date: October 2004
* Database Type: Microsoft Access
* Documentation: Database Release Report Addendum (EarthFX, 2005)
* Major Additions/Changes include: 
    + MOE update (to June 2003); 
    + GSC data;
    + UGAIS geotechnical wells; 
    + Environment Canada climate and streamflow data
* Release: Database released along with geological surfaces (the Core
Model and Regional Model layers) as a combined package (2004)

### Database Release 3

* Date: April 2006
* Database Type: Microsoft Access
* Documentation: Database Manual, September 2006 (YPDT-CAMC, 2006)
* Major Additions/Changes include: 
    + Update of GSC data; 
    + Addition of oil and gas wells; 
    + Inclusion of geophyscial logs; 
    + Update of Environment Canada climate and streamflow data
* Release: May to July 2006, Database release included an updated 
geologic model (extending from the CVC, above the escarpment, to east 
of the Durham Region)

### Database Release 4

* Date: Unreleased - incorporated into Database Release 5, described below
* Database Type:  No specific documentation on this work
* Major Additions and Changes include: 
    + Corrections to individual boreholes; 
    + Addition of new boreholes tied to construction projects (e.g.  York sewer projects); 
    + Addition of temporal pumping and water level data (stored as Binary Large Objects - BLOBs);
    + York Region monitoring data (including some reconciliation of monitoring locations and addition of pumping rates and water levels to October 2006; completed in November 2006; duplicates for some York wells still in database)
    + York Region Monitoring data (some reconciliation of York monitoring locations and addition of pumping rates and water levels to Oct 2006 - completed in Nov 2006 (Duplicate locations for some York wells still in database)
    + Addition of 8,470 MOE wells and miscellaneous new consultant wells
    + Addition of Halton area MOE wells to the west; note that at this time EFX created a separate Halton/Hamilton database that covers the Source Water Protection area - the YPDT database did not include the wells added by Halton CA under a program with the Ontario Geological Survey;
    + Incorporation of 236 Durham Region high quality monitoring wells - this created some duplicates of these wells within the database
* Release: Unreleased, used internally at the YPDT-CAMC group

### Database Release 5

* Dated Version: 20120615
* Date: June 6, 2012
* Database Type: Microsoft SQL Server 2008 (or 2005; see Comments, below)
* Documentation: CAMC-YPDT December 2012 (refer to YPDT-CAMC, 2014)
* Major Additions and Changes
    + Incorporation of scanned library reports/papers (previously separate);
    + Incorporation of additional MTO boreholes
    + Addition of group capability (see Section 2.5)
    + Extraction of temporal data from BLOBs
    + Addition of formation assignment data based upon existing geologic models
    + Addition of historical chemistry data
    + Incorporation of Halton borehole data
    + Incorporation of geological picks
    + Addition of historical MOE water level monitoring data
    + Removal of most duplicate wells and water levels
* Release: June, 2012 (through 2012-2016)
* Comments: This version incorporates all modifications necessary for conversion between Microsoft Access (MS Access) and Microsoft SQL Server 2008 (MSSQL2008) and also includes structural changes to many existing tables and the addition of tables, fields, constraints, triggers, etc...  Refer to Appendix E for detailed changes.

### Database Release 6

* Dated Version: 20160831
* Date: August 31, 2016
* Database Type: Microsoft SQL Server 2016 (Updated from 2014)
* Documentation: YPDT-CAMC December 2017
* Major Additions and Changes
    + 20170524 - All climate station data has been moved to D_INTERVAL_TEMPORAL_3
    + 20170922 - All streamflow data has been moved to D_INTERVAL_TEPORAL_5; all calculated baseflow information has been removed from the database (this is replaced by a web-based on-the-fly calculation)
* Release: August, 2016

### Database Release 7

* Dated Version: 20160831 (main schema)
* Secondary Dated Version: 20210901 (updated schema)
* Date: September 01, 2021
* Database Type: Microsoft SQL Server 2016
* Documentation: ORMGP November, 2021 (this document)
* Major Additions and Changes
    + Centralized spatial tables binding coordinates and elevations together (along with associated quality assurance codes)
    + Interval formation assignment update (from earlier versions) and calculation of transmissivity and hydraulic conductivity values (by geologic model)
    + Inclusion of 'Knowledge-Based' locations
    + Many other modifications ...
* Release: September, 2021 (through to the present)

The current distribution of all locations found within the database is shown (Figure 1.3.1).

![*Figure 1.3.1 The spatial extents of the study area showing locations
(boreholes, climate stations, surface water stations, reports, etc.) currently
residing in the database.*](f01_01_03_locations.jpg)


