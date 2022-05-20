---
title:  "Appendix M"
author: "ormgpmd"
date:   "20220520"
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

## Appendix M - ORMGP Analyses, Metadata and Other Links


#### Analysis or Procedure

External Data Sources (Summary): [https://owrc.github.io/interpolants/sources/sources.html](https://owrc.github.io/interpolants/sources/sources.html)

Hydrograph Explorer: [https://owrc.github.io/HydrographExplorerHelp/](https://owrc.github.io/HydrographExplorerHelp/)

Snowmelt Computation: [https://owrc.github.io/snowmelt/](https://owrc.github.io/snowmelt/)

Watershed Analysis of the ORMGP region: [https://owrc.github.io/subwatershed/](https://owrc.github.io/subwatershed/)

Watercourse Topology of the ORMGP Region: [https://owrc.github.io/interpolants/interpolation/watercourses.html](https://owrc.github.io/interpolants/interpolation/watercourses.html)

#### Fact Sheets

Fact Sheet - Water Table Mapping: [https://owrc.github.io/watertable/](https://owrc.github.io/watertable/)

#### Metadata

The metadata master list can be accessed at: [https://owrc.github.io/metadata/content/toc.html](https://owrc.github.io/metadata/content/toc.html)

Potential Discharge Areas (Surface): [https://owrc.github.io/metadata/surfaces/potential_discharge.html](https://owrc.github.io/metadata/surfaces/potential_discharge.html)

Potentiometric Surface: [https://owrc.github.io/metadata/surfaces/potentiometric_surface.html](https://owrc.github.io/metadata/surfaces/potentiometric_surface.html)

Water Table (Surface): [https://owrc.github.io/metadata/surfaces/water_table.html](https://owrc.github.io/metadata/surfaces/water_table.html)

*Last Modified: 2022-05-20*
