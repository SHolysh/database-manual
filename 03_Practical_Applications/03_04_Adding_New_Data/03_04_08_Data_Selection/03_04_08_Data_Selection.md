---
title:  "Section 3.4.8"
author: "ORMGP"
date:   "20220126"
output: html_document
knit:   (
            function(input_file, encoding) {
                out_dir <- '';
                rmarkdown::render(
                    input_file,
                    encoding=encoding,
                    output_file=file.path(dirname(input_file), out_dir,
                    '03_04_08_Data_Selection.html')
                )
            }
        )
---

## Section 3.4.8 Data Selection

When incorporating additional/new data within the database various considerations should be made.  This is especially the case when working with project reports for which numerous boreholes (for example), likely with similar geologic features, are available.  Time-constraints, in general, do not allow for inclusion of all available data - instead, one or more 'best' locations among the possibilities are chosen for incorporation.  These are assumed to be representative for the available dataset as a whole.

The following points emphasize various options which should be considered when evaluating information for possible inclusion within the database.  These options should be considered as trade-offs as no particular location likely includes all of the possible information desired.

### Boreholes

#### Area Coverage and Distribution

Reports vary from site-specific to regional in character; the distribution of boreholes, then, could be clustered (e.g. a few locations within tens-of-metres of each other) to wide ranging (e.g. geotechnical locations along a roadway).  In the case of clustered locations, one or two representational boreholes should only be chosen typically with a 'wide' spacing between them (if more than one is being incorporated).  For larger areal coverages the density of existing borehole locations should be evaluated - new locations should be used as an 'infilling' exercise.

#### Chemistry

Those locations including water chemistry (i.e. tied to specific boreholes) should be considered preferable; these should consist of mainly the parameters from the 'Major Ions' and 'Metals' groups (refer to R_RD_NAME_CODE and R_READING_GROUP_CODE for details).  Soil chemistry can also be considered but should be secondary.

#### Depth

In most cases, deeper locations (on the order of greater than five to ten metres in depth) are preferable over shallow (e.g. less than five).  The former, even if not detailed, can be used to 'push-down' other geologic layers in the area.  In this case, a shallow detailed location could also be included.

#### Geology

A detailed borehole log with notes describing sediment types and stratigraphy (based, of course, upon the existing geologic subsurface conditions which may be simple-to-complex; e.g. four or more layers or observations) is preferable to a simplistic description with few layers or detail (e.g. fewer than three layers/observations).  Particular note should be made of those locations that intersect the local bedrock surface as this can function as a reference depth (along with the ground surface, for example). 

#### Samples

Those locations with multiple water samples (e.g. a long-term observation well) tied to chemistry data (see above) should be considered as preferable.  Geotechnical samples (e.g. split-spoon samples, down-hole) are also useful as they tend to include additional information such as blow-counts, grain-size, plasticity-limits and moisture estimates.  

#### Water Levels

Any location including static water level measurements (or long-term logger data) are useful, especially in combination with the depth of borehole (see above).  Those locations with levels recorded on multiple dates are preferable.





