---
title:  "Section 2.7"
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
                    '02_07_Multi-Screen_Installations.html')
                )
            }
        )
---

## Section 2.7 Multi-Screen Installations

Multi-screen installations are a common groundwater monitoring technique used to investigate local hydrogeological conditions.  They generally include one or more boreholes with multiple screens (intervals/monitors) in each borehole.  These types of boreholes have been dealt with in a variety of ways within the database depending upon the actual borehole/screen characteristics and the source of the data.

As a prelude to this discussion, a note on the MOE well record database is warranted.  Historically the MOE well record database primarily held only those wells that were drilled for water supply purposes and that were drilled by water supply well drilling companies.  These wells typically held only one screen/interval per borehole.  In the odd circumstance where two pipes were put down one borehole (e.g. for municipal monitoring purposes) the Ministry database would only retain information one of the two screened intervals and the information on the second interval would be missing from the digital MOE database.

Starting in 2003 the Ministry started collecting information on boreholes that were drilled under consultant oversight by geotechnical borehole drillers.  At this time the Ministry adopted a methodology of 'clustering' wells that allowed the geological description of one borehole (presumably the deepest borehole) to effectively represent all other boreholes drilled on that site.  In such cases, a 'representative' geologic description from one on-site borehole reflects the conditions for the entire site.  All boreholes drilled on the site are then linked in the MOE database and only one 'master' location would include the geological description.  All other on-site boreholes would incorporate all other information typically associated with an MOE borehole (i.e. well depth, construction details, screen details, pumping test details, etc...).

When these cluster wells are incorporated into the database, each borehole is given its own unique LOC_ID in the D_LOCATION table and is linked to its related boreholes through the use of the LOC_MASTER_LOC_ID field (also in D_LOCATION).  The LOC_ID of the 'master location' is copied into the LOC_MASTER_LOC_ID field for all associated boreholes.  Excepting the D_GEOL_LAYER, all linked boreholes would have unique data (particular to that 'linked' location) in each of the other database tables.

It is important to note that these MOE clustered wells are not considered to be multi-screen installations in the typical sense.  They only share a common geological interpretation of the 'representative' well.

Multi-screen installations would include:

* typical consultant wells where the deepest borehole is drilled first and the recovered soil logged to establish the geological profile; generally, the deepest screen would be installed in this borehole; subsequent screens are then installed in unique boreholes that are drilled in the immediate vicinity (within ~10 to 20m) of the original well to the required depth based on the interpretation of the first borehole
* situations where multiple screens/intervals have been installed within one borehole with seals placed between each screen/interval  
* Waterloo system or West Bay type installations whereby unique intervals down one borehole are monitored through a set of pipes or tubes that are directed from the monitored interval to the surface; in the West-Bay system (or other similar packer systems) it could become important to record the start and the end dates of the interval owing to the transient nature of the (temporary) packer intervals;  due to their short duration, (in cases, only long enough to perform a single slug test or extract a single sample) the start/end times should be populated in the D_INTERVAL table (i.e. INT_START_DATE and INT_END_DATE) to track the many possible (and possibly overlapping) intervals that could exist in a single borehole

Depending upon the person entering the data, these types of multi-screen boreholes could be entered into the database in one of two different ways:

* The multiple borehole locations (all immediately adjacent to one another)  could be given a single set of coordinates (i.e. one record in D_LOCATION) with only a single borehole (in D_BORHOLE) and only one record of other related information tied to the location (e.g. construction, depth, geology, etc...); the location will have multiple intervals (in D_INTERVAL) to reflect the various screens found at the location; of course each screen/interval would then have its own associated set of temporal data; this is the preferred method of data entry for multi-level nested wells
* In some cases, even though the boreholes are easily within 10 metres of each other, each borehole has been given its own LOC_ID in the database; the boreholes would be given nearly the same UTM coordinates (with slight variations)but much of the information would be different for each borehole (e.g. the borehole construction, depth, elevation, the screen information, etc...); generally the boreholes would have the same geology or the shallower boreholes would have no geological record provided; these boreholes would not necessarily - although it would be a good idea - be linked through the LOC_MASTER_LOC_ID (as was the case for the MOE cluster wells); this type of entry into the database is generally discouraged

Note that in some instances (generally within the MOE Water Well database) a single well can have multiple screened intervals associated with a single casing pipe (i.e. the well screen has been designed purposefully to leave a solid blank casing - for example, opposite a silty zone in an aquifer - between two screened intervals within an aquifer).  Other cases might have a screen adjacent to a coarse aquifer unit high up in a well and a second screen at depth associated with a second deeper aquifer.  Since the extracted water samples and any recorded water levels would reflect contribution from both aquifers, only one interval, and one set of temporal data, would be recorded for such wells in the database.  However, the multiple screen tops and bottoms for such an interval are retained in the D_INTERVAL_MONITOR table.  These situations are fairly uncommon.  These wells would not be considered to be multi-screen installations in the typically understood hydrogeological sense.

Although municipal pump houses could be incorporated into the database as multi-screen equivalents, to date they have not been represented in this way.  Pump houses have been assigned a LOC_ID in the database and the wells that are linked or contribute to a municipal pump house or reservoir are currently linked through the LOC_MASTER_LOC_ID field in the D_LOCATION table.  

There has also been some discussion of having multiple intervals within the database for the climate stations and the surface water stations.  In the case of a climate station, for example, one interval could be established to represent a thermometer and house the temperature data whereas a second interval could represent a rain gauge and house the precipitation data.  To date this has not been done and each surface water and climate location contains only one interval that houses all temporal data tied to the location.

