---
title:  "Appendix D"
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
                    'D_External_Data_Sources.html')
                )
            }
        )
---

## Appendix D - External Database Sources

The following sources have been used for adding of information into the database.  This is not to be taken as an exhaustive list.  Approximate dates are indicated (multiple dates are possible).

### Environment Canada

* Date: February 2004
* Name: Climate Data
* Source: Sandy Radecki - Burlington

* Description: Climate data up to the end of 2003 has been added to the database.  Included is the following data, provided on a daily average basis.

1.	Precipitation
2.	Rain
3.	Snow on ground
4.	Maximum, minimum and average temperature
5.	Solar radiation where available

Details	Approximately 560 climate stations are listed in the database, 517 operated by Environment Canada, and the remaining 43 operated by CA and other agencies.  Locations are shown in the following figure.  Climate stations are identified in the database using a LOC_TYPE_CODE of 9 in the D_LOCATION table.  A standard ORMGP query is provided in the database to display climate stations- this query is called ORMGP - Climate Stations ALL

Future Data	Stream flow data from Environment Canada extends to December 2000, and requires updating.  Past requests have been referred to their web site, which currently does not accommodate the bulk downloads required by the database.  Improvements to the web site are expected, but unfortunately it has been difficult to access the required data.

Geological Survey of Canada Data

Date	August 2004
Name	Outcrops
Source	Dave Sharpe's ORM database, August 2004 version from Charles Logan

Description	Outcrops mapped by the GSC and the OGS where compiled into a database by the Terrain Science Group to complement their well log data for the ORM.  Outcrop data basically looks like well log data, with an X, Y and Z positions and a geological sequence.  The geological sequence can range from several centimeters to many meters in the case of large exposed faces.  Geological descriptions have, for the most part, been mapped into the MAT1,2,3 and 4 descriptions used in the database.

Details	Approximately 30,000 outcrops have been added to the database, covering an area from xx to yy.  Locations are shown in the following figure.  Outcrops are identified in the database using a LOC_TYPE_CODE of 11 in the D_LOCATION table.  A standard ORMGP query is provided in the database to display outcrops - this query is called ORMGP - Outcrops ALL


Future Data	The GSC located a number of non MOE wells for the database.  Some will already exist in the ORMGP database (MTO geotechnical wells for bridge abutments); however, the remaining wells must be identified and transferred into ORMGP.

MNR Surface Water Station Coordinates

Date	June 2004
Name	Updated UTM coordinates for MNR and EC stations
Source	MNR

Description	The original Environment Canada coordinates were initially provided in digital lat long format with limited accuracy, resulting in stations not plotting on their assigned water course.  This has been updated using MNR GPS data.

????? SHOULD THIS BE REMOVED ?????

MOE PTTW Database

Publically available format.  As of 2014-08-01 (approximately).

MOE South Simcoe Groundwater Study data files

Date	June 2004
Name	Dixon Hydrogeology database for MOE GW study
Source	Dixon Hydrogeology

Description	DHL released their updated project database for use in the ORMGP database.  Of value were several hundred new wells installed as monitoring wells by DHL during previous projects, and updated UTM coordinates for about 6000 MOE wells across Simcoe County

MOE WWDB (Water Well Database)

Multiple import periods, including (approximately):

    - 2002
    - 2006
    - 2010
    - 2013-08-01

Scarborough Report

120 Wells in digital form from a competing/preceding project with the city of Scarborough (see Eyles and Doughty, 1996).

UGAIS Wells

Date	June 2004
Name	Geotechnical borehole data for urban areas
Source	GSC - MNR

Description	UGAIS (Urban Geology Automated Information System) is a compilation of largely urban boreholes for major municipalities across Canada prepared by the GSC in the mid seventies.   Wells from Hamilton to Oshawa were added to the ORMGP database.  These wells are largely geotechnical investigation test holes, offering descriptive and accurate soil descriptions and blow counts.  Soil descriptions have be mapped into the standard look up fields of the D_GEOLOGY_LAYER table in the database.  The geological descriptions provided are based on the soils recovered in split spoon samples, and the depths provided were the depths of the split spoon sample.  

Details	Approximately 33,200 geotechnical boreholes, with depths ranging from 0.1 m (soil sample) to in excess of 100 m were converted from ASCII format and appended to the database  These boreholes are identified in the database using a LOC_TYPE_CODE of 1 and DATA_SOURCE = 'ugais' in the D_LOCATION table.  A standard ORMGP query is provided in the database called ORMGP - Wells UGAIS.  The wells have been assigned as position certainly code of 3 (10 to 30 m), although as geotechnical borings, it is expected the accuracy may be greater, but this cannot be confirmed.  Only about 7,040 of the 33,200 include water level information.

Future Data	

In several cases, the geological description for the wells included water level information.  Many of these water levels remain in the geological description field, although often hidden by carriage return characters.  Further work is necessary to parse the water level data into the water level table.   It is noted that the original ASCII files included Liquid Limit and Plastic Limit values; this data could not be confidently converted owing to missing depth readings.


