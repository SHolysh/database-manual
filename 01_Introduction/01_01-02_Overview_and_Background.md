---
title:  "Section 1.0 to 1.2"
author: "ORMGP"
date:   "20220131"
output: html_document
knit:   (
            function(input_file, encoding) {
                out_dir <- '';
                rmarkdown::render(
                    input_file,
                    encoding=encoding,
                    output_file=file.path(dirname(input_file), out_dir, 
                    '01_01-02_Overview_and_Background.html')
                )
            }
        )
---

## Section 1.0 Overview

This document has been created to provide information pertaining to the  Oak Ridges Moraine Groundwater Program (ORMGP) database and the underlying data model.  Specifically the document provides:

* Information on what is contained within the database
* Technical details describing how information is organized within the database
* Direction on where to find the varying types of information and the methodologies to do so
* Guidelines regarding consistent procedures and standards that should be followed when editing existing or adding new data into the database

This document should provide users with sufficient background in relational databases, and the ORMGP data model in particular, to allow navigation and extraction of information.  Given the comprehensive nature of the database, from a broader perspective, the ORMGP data model, and the management of the database, can serve as an example to other organizations on municipal, provincial and national scales.  A central theme in the overall database design and management is the balance between relational theory and the capacity and needs of users.

The database currently has a number of different users from the various partner municipalities, conservation authorities and consulting firms.  With the database now hosting such a wide variety of data and with the incorporation of data from so many sources, the database has grown into an impressive collection of tables.  The comprehensive nature of the database makes navigation tricky for new users.  Seasoned users of the database (especially with regard to previous Access versions) may be unaware of some of the new information that has been recently added.

More general background information regarding databases and data models (not specific to the ORMGP database) is included in two preceding database reports - EarthFX (2003) and YPDT-CAMC (2006) - and is not repeated here.  It is the intent of ORMGP staff to periodically refine and update this document over time to reflect either feedback from the partner agencies or incremental changes in the underlying structure (and content) of the database.  This document specifically applies to Database Version 7 (Dated Version 20160831.20210901) and is an update of the YPDT-CAMC (2014) database manual (which applies to Database Version 4 and 5; Dated Version 20120615) and the subsequent YPDT-CAMC (2017) draft manual.

The ultimate goal of the ORMGP's data management is to maintain a water management database system that is reliable, up to date and relatively easy to use.  The guiding philosophy for the ORMGP database can be summarized as

One piece of absolutely reliable data is far better than many pieces of unreliable data.

### Database Contents

The database contains information that can be grouped into three broad
headings:

1. Geology and Groundwater Related Locations
    + Borehole Records (location, depth, drill date, etc...) including: MOE
      well records (geology, water levels, well construction, etc...);
      geotechnical boreholes (geology, water levels, soil properties); oil and
      gas wells (geology); consultant drilled wells from previous studies
      (geology, water levels, well construction, etc...)
    + Picks - the geological layer picks for each well (used to construct surfaces); 
    + Outcrops (sedimentological sections and bedrock outcrops) - only geology;
    + Geophysical logs from key wells;
    + Screened formation assignment (screened interval has been assigned to one of the geological units); 
    + Temporal data (water levels, pumping rates, water quality, etc...)
    + MOE PTTW records (from groundwater sources) - not yet linked to boreholes.

2. Surface Water Related Locations
    + MOE PTTW records (from surface water sources)
    + MOE PWQMN records (from surface water sources)
    + Flowing Water Information Stations (FWIS)
    + Temporal Data (including daily discharge from continuous gauges - HYDAT
      stations or other - or instantaneous discharge from various low
      streamflow - baseflow - surveys)

3. Climate Related Locations
    + Temporal Data (daily temperature, rain, snow and total precipitation
      from Environment Canada stations or other locations)

4. Library of Scanned Reports/Papers
    + Technical reports (consultant, government, etc.) as well as scientific articles/papers have been scanned;
    + PDF files are too large to store in the database, however details of reports/articles/papers are in several "Document" tables;
    + PDF files are available through the program website (https://www.oakridgeswater.ca)

A few key points should be highlighted:

* the data coverage is not necessarily uniform over the entire area of study (e.g. the City of Toronto has many more geotechnical well records as a result of the City having captured these in a database many years ago);
* throughout the document the terms borehole and well are used interchangeably - the database does not distinguish between the two;
* responsibility for maintaining and updating the database in a reliable manner - and to check data prior to incorporation into the database - is a shared responsibility between all users.

## Section 1.1 Background

In 1999, the Regional Municipalities of York, Peel, Durham, the City of Toronto (YPDT), and their associated six Conservation Authorities (Credit Valley; Toronto and Region; Lake Simcoe and Region; Central Lake Ontario; Kawartha; and Ganaraska) formed a cooperative alliance for addressing groundwater issues within the collective geographical area of all partnered agencies.  In addition to these partners, three additional conservation authorities (Otonabee, Lower Trent, and Nottawasaga) also having jurisdiction on portions of the Oak Ridges Moraine, through the Conservation Authorities Moraine Coalition (CAMC) have also supported the development of the technical tools that have been developed for groundwater management.  Starting in 2021, the Regional Municipality of Halton and Conservation Halton have also joined the program. The study area is shown in Figure 1.1.  At the request of the Source Water Protection project managers, the area was expanded slightly in recent years to incorporate more northerly areas to assist with Source Water Protection Planning.

![*Figure 1.1.1 Oak Ridges Moraine Groundwater Management Program study area
displayed with a 25km boundary buffer; the Oak Ridges Moraine is also
shown.*](f01_01_01_study_area.jpg)*Figure 1.1.1 Oak Ridges Moraine
Groundwater Managment Program study area displayed with a 25km boundary
buffer; the Oak Ridges Moraine is also shown.*

Since its inception in 1999 the project has transitioned through what can be identified as four stages:

* Stage 1 - 1999 to 2001 - this stage of work was undertaken by a consultant team and was focused on identifying issues related to groundwater management and protection.  The work culminated in a report (AMEC Earth and Environmental et al, 2001) that documented some of the groundwater work taking place in other jurisdictions across Canada and the U.S.  The report also inventoried and prioritized areas and issues to be considered for additional work.
* Stage 2 - 2001 to 2008 -  this stage of work has been characterized by developing and building an analysis system that includes several well defined tools required for understanding and managing the groundwater flow system across the area (e.g. database, digital geology, groundwater flow model).
* Stage 3 - 2008 - onward - This stage of work to date has focused on implementing the tools to assist in various groundwater studies that have arisen, as well as on infilling geological and hydrogeological data gaps and on maintaining and updating the available tools and database.
* Stage 4 - 2016 - onward - This stage has focused on ease-of-access to the database and other products, concentrating on web/internet access and dissemination of data.  This is to be applied to both public and Partner access.

### Program Mandate

The project was initially established in 2000 recognizing that effective protection and management of groundwater resources required an adequate information base and coordinated practices and policies.  The intent of the groundwater management strategy at the time was to ensure co-ordination and consistency in approaches, policies, and practices across the regions and conservation authorities such that common goals and objectives could be met.  At the time a series of objectives were laid out that spoke to the need to protect and/or restore various groundwater based functions (e.g. sustainable use of groundwater, habitat, stream form, assimilative capacity, etc.).  It was also recognized early on, that protection, restoration and management of the groundwater flow system first required that an adequate level of understanding be acquired.  In 2001, the project was steered in this direction.

In 2004 the project developed a Governance Document entitled "Towards a Sustained Long Term Program" that set out a structure and future direction for the project, recognizing that coordination of the work of the partnership and the work of individual agencies was critical for success.  In 2007 a second document entitled "Overview of Operations and Future Planning." was prepared and outlined six areas where the partnership could coordinate efforts: database management; data collection; technical analyses (geology and groundwater flow modeling); planning and policy initiatives; provincial/federal funding; and education.  

The report set out the following agreed to mandate:

The mandate of the YPDT-CAMC Groundwater Management Program partnership can be summarized as to provide a multi-agency, collaborative approach to collecting, analyzing and disseminating water resource data as a basis for effective stewardship of water resources.  The YPDT-CAMC Groundwater Management Program is to build, maintain and provide to partnered agencies the regional geological and hydrogeological context for ongoing groundwater studies and management initiatives within the partnership area.

As such the program will: 

1. Build and maintain a master database of water related information that is accessible to all partner agencies;
2. Build and maintain a digital geological construction of the subsurface layers that is accessible to all partner agencies;
3. Build and maintain a numerical groundwater flow model that can be used to address any number of issues that arise at any of the partner agencies.
4. Coordinate and lead investigations that will acquire new field data that will strategically infill key data gaps.
5. Provide technical support to Source Water Protection Teams to ensure that interpretations used in source water are consistent with the regional understanding.
6. Provide technical support to planning authorities to ensure that Official Plan policies are developed in a manner which makes them consistent with up to date groundwater science as derived from the project. 
7. Provide technical support to all partnered agencies for addressing other Provincial legislation.

The desired outcome from the partnership project is significantly improved water management decisions.






