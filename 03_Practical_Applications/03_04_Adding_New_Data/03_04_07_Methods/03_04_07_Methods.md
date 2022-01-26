---
title:  "Section 3.4.7"
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
                    '03_04_07_Methods.html')
                )
            }
        )
---

## Section 3.4.7 Adding New Data - Methods


### Entry of Data into Database - Manual Spreadsheet

In cases where no software is available to enable data entry or to assemble data into a format that can be easily managed by the ORMGP, the provided Microsoft Excel worksheets can be used as a base in order to structure data to facilitate importing into the database.  There are six worksheets available:

* LOCATION (A)
* BOREHOLE (B)
* GEOLOGY (C)
* SCREEN_AND_SOIL (D)
* LAB_DATA (E)
* FIELD_DATA (F)

An example Microsoft Excel worksheet, providing the required, recommended and/or optional fields necessary for incorporating different types/levels of data into the ORMGP database is available. The file also contains three reference sheets - GEOLOGY_MATERIAL, PARAMETER_NAME and UNIT_NAME - which provide lists of acceptable geologic materials, parameters and units, for use in the GEOLOGY, LAB_DATA and FIELD_DATA worksheets (see the MATERIAL_1, MATERIAL_2, MATERIAL_3, MATERIAL_4, PARAMETER and UNIT fields, below).

For these worksheets the location name (LOC_NAME) and/or interval name (INT_NAME) are being used as the key field by which data (e.g. LAB_DATA or FIELD_DATA) can be linked or related to a particular spatial location within the ORMGP study area. Refer to the following figure for the required relationships between the worksheets.  

![Figure 3.4.7.1 Spreadsheet relationships for manual data
entry](f03_04_07_01_relationships.jpg)*Figure 3.4.7.1 Spreadsheet relations
for manual data entry.*

The primary worksheet, Worksheet A - LOCATION, should be populated for all data submitted; each of the subsequent worksheets (i.e. (B) through (F)) are populated (and related to worksheet (A)) if there is the appropriate data available.  This is summarized on the attached figure.  Two numeric fields - LOC_ID and INT_ID - are for existing locations in the 'Master ORMGP Database' (ORMDB) and should only be populated if provided by the ORMGP group (e.g. if the consultant provides the "Location worksheet" in advance of the others in order to obtain a LOC_ID and or INT_ID)..  A new worksheet set should be used for each data set submittal by consultants or partners.
The data fields found in each worksheet are described, in detail, within the next section.

#### Data Fields

The individual worksheets (LOCATION, BOREHOLE, GEOLOGY, SCREEN_AND_SOIL, LAB_DATA and FIELD_DATA) comprise a number of data fields - most of these should be populated, if possible, based upon data availability and location type.  The description for each follows in alphabetical order.  

##### ANALYSIS_DATE
* Worksheet: LAB_DATA (E)
* Required: No
* Data Type: Datetime
* Description
    + The date (and, optionally, time) when the sample was analyzed at the laboratory.  The datetime format should be standardized to yyyy-mm-dd hh:mm to avoid confusion.

##### BOTTOM
* Worksheet: SCREEN_AND_SOIL (D)
* Required: Yes
* Data Type: Numeric
* Description
    + Bottom depth of screen, open hole or soil sample in metres.  BOTTOM must be greater than TOP.

##### BOTTOM_DEPTH
* Worksheet: BOREHOLE (B)
* Required: Recommended
* Data Type: Numeric
* Description
    + Bottom depth, in metres, of the borehole.  Note that this should be especially populated in those unusual cases where the maximum depth of the borehole differs from the values found in GEOLOGY (C) or SCREEN_AND_SOIL (D) for this location.

##### COMMENT
* Worksheet: All (A-F)
* Required: No
* Data Type: Text (alphanumeric; maximum length 255 characters)
* Description
    + This field is present on all worksheets and can be used to provide any additional information available on each, by location.  Note that this field cannot be used to link a location across worksheets (LOC_NAME, INT_NAME or NAME are to be used instead).

##### COORD_COMMENT
* Worksheet: LOCATION (A)
* Required: No (unless an alternate coordinate system is used)
* Data Type: Text (alphanumeric; maximum length 255 characters)
* Description
    + Any additional projection information (including the datum) should be included here if non-UTM Z17 NAD83 coordinates are used.

##### COORD_QA_COMMENT
* Worksheet: LOCATION (A)
* Required: No
* Data Type: Text (alphanumeric; maximum length 255 characters)
* Description
    + Any additional comments related to the coordinate assignment (LOC_COORD_X and LOC_COORD_Y).  This includes notes on accuracy or confidence both horizontal and vertical.

##### COORD_QA_METHOD
* Worksheet: LOCATION (A)
* Required: Recommended
* Data Type: Text (alphanumeric; maximum length 50 characters)
* Description
    + The method and/or instrument used to establish the coordinates for the location.  Note that this will commonly be either of GPS or Surveyed.  Other possibilities include: map; GIS; etc ?

##### DATA_SOURCE
* Worksheet: LOCATION (A)
* Required: Recommended
* Data Type: Text (alphanumeric; maximum length 255 characters)
* Description
    + Name of consulting firm (or other) providing the data.  This could also include, for example, the name of any report describing the information.  In addition (or alternatively), the document identifier (e.g. DOC_FOLDER_ID) could be listed here (if available).

##### DATE
* Worksheet: FIELD_DATA (F)
* Required: Yes
* Data Type: Datetime
* Description
    + Date (and, optionally, time) when the PARAMETER was originally determined.  The format used should be yyyy-mm-dd hh:mm to avoid confusion with regard to the various datetime formats.

##### DIAMETER
* Worksheet: SCREEN_AND_SOIL (D)
* Required: Recommended
* Data Type: Numeric
* Description
    + Diameter of monitoring pipe, screen or soil sample in centimetres.  (Note that this is not necessarily the same as the Borehole Diameter).

##### DIAMETER_OUOM
* Worksheet: BOREHOLE (B)
* Required: Recommended
* Data Type: Numeric
* Description
    + Borehole diameter in centimetres.  This is typically the largest of any casing diameters, if installed, or alternatively the outer diameter of the auger or drill bit that advances the borehole to depth.

##### DRILL_METHOD
* Worksheet: BOREHOLE (B)
* Required: Yes
* Data Type: Text (alphanumeric; maximum length 50 characters)
* Description
    + Drilling method description.  For example: mud rotary; hollow stem auger; PQ coring; etc?  Refer to the DRILL METHOD worksheet for currently defined methods.

##### DRILL_START_DATE
* Worksheet: BOREHOLE (B)
* Required: Recommended
* Data Type: Datetime
* Description
    + Date at which borehole drilling commenced.  The preferred format is yyyy-mm-dd to avoid confusion, especially if the worksheet is converted to a CSV file (or some other text format).

##### DRILL_STOP_DATE
* Worksheet: BOREHOLE (B)
* Required: Yes
* Data Type: Datetime
* Description
    + Date at which borehole drilling was completed.  This date is used for multiple purposes in the ORMDB and should be specified by the end-user.

##### GEOL_BOTTOM
* Worksheet: GEOLOGY (C)
* Required: Yes
* Data Type: Numeric
* Description
    + Bottom depth of layer in metres.  Note that each borehole/location may have multiple layers (i.e. rows) in this worksheet.

##### GEOL_DESCRIPTION
* Worksheet: GEOLOGY (C)
* Required: Recommended
* Data Type: Text (alphanumeric; maximum length 255 characters)
* Description
   ? Full layer description from original borehole record.  This description should be used to populate each of the MATERIAL_\* fields and can be used as a check once the location is incorporated in the ORMDB.  Sometimes the description can provide additional information that is not always captured in the database.

##### GEOL_TOP
* Worksheet: GEOLOGY (C)
* Required: Yes
* Data Type: Numeric
* Description
    + Top depth of layer in metres.  Note that each borehole/location may have multiple layers (i.e. rows) in this worksheet.

##### GROUND_ELEV
* Worksheet: BOREHOLE (B)
* Required: Recommended (if surveyed)
* Data Type: Numeric
* Description
    + The elevation for the location.  Note that this should generally be populated when the location has been surveyed; otherwise, a standard DEM is used in its stead.  If a non-surveyed elevation is provided, it will be stored as the original elevation in the ORMDB.

##### INT_ID
* Worksheet: SCREEN_AND_SOIL (D), LAB_DATA (E), FIELD_DATA (F)
* Required:   No
* Data Type: Numeric (whole numbers, integers, only)
* Description
    + The primary numeric key used to link temporal information (i.e. either laboratory or field data) between tables or datasheets.  This column should only be used if the location (i.e. the interval) has previously been entered into the ORMDB and the numeric value provided to the end-user.  In all other cases, the INT_NAME and/or LOC_NAME field should be used in its place.

##### INT_NAME
* Worksheet: SCREEN_AND_SOIL (D), LAB_DATA (E), FIELD_DATA (F) (the latter two are referenced by the NAME field)
* Required: Yes
* Data Type: Text (alphanumeric; maximum length 255 characters)
* Description
    + Interval name.  This should be distinctive between differing samples or screens (having different elevations - top and bottom) on the same datasheet.  This field is also used to link information between worksheets; its use allows data to be related to a specific interval (i.e. a screen or sample interval).  The INT_NAME field can be the same as the LOC_NAME with an optional indication of depth (e.g. s or shallow; d or deep).  This is especially the case where multiple screens are found in a single borehole.  For soil intervals, however, either the top or bottom depth (as an integer), or the sequential sample number, should be included as part of the INT_NAME to distinguish between all soil sample intervals.  The NAME field in LAB_DATA (E) and FIELD_DATA (F) worksheets can hold either the LOC_NAME or INT_NAME (although the INT_Name is preferred) where a single interval is specified for a location. For multiple intervals, the INT_NAME must be used. 

##### INT_NAME_ALT1
* Worksheet: SCREEN_AND_SOIL (D)
* Required: No
* Data Type: Text (alphanumeric; maximum length 255 characters)
* Description
    + Alternate interval name or alternate location name. 

##### INTERVAL_TYPE
* Worksheet: SCREEN_AND_SOIL (D)
* Required: Yes
* Data Type: Text (alphanumeric; maximum length 50 characters)
* Description
    + Type of interval.  This will generally consist of either 'Reported Screen', Open Hole, or 'Soil Sample'.

##### LAB_ID
* Worksheet: LAB_DATA (E)
* Required: Recommended
* Data Type: Text (alphanumeric; maximum length 255 characters)
* Description
    + The name or identifier of the laboratory in which the sample was analyzed for a particular parameter (e.g. Maxxam, R&R Laboratories, etc.).  This should be text only, not a numeric.

##### LAB_SAMPLE_ID
* Worksheet: LAB_DATA (E)
* Required: No
* Data Type: Text (alphanumeric; maximum length 50 characters)
* Description
    + Internal laboratory sample identifier.

##### LOC_ADDRESS
* Worksheet: LOCATION (A)
* Required: Recommended
* Data Type: Text (alphanumeric, maximum length 255 characters)
* Description
    + Any address information including, but not limited to: street address; town or city; region; etc?  This should be presented in a consistent format.

##### LOC_AREA
* Worksheet: LOCATION (A)
* Required: No
* Data Type: Text (alphanumeric; maximum length 50 characters)
* Description
    + Area (or descriptive name) in which the location is found.  Multiple names can be specified here using a semicolon to separate them.

##### LOC_COORD_X
* Worksheet: LOCATION (A)
* Required: Yes
* Data Type: Numeric
* Description
    + Location coordinate X.  Preference is given for the UTM Zone 17 projection, NAD83 datum.  Alternatively, this would be the Longitude column (using the NAD83 datum).  Additional projection/coordinate information should be provided in COORD_COMMENT if neither of these defaults are used.

##### LOC_COORD_Y
* Worksheet: LOCATION (A)
* Required: Yes
* Data Type: Numeric
* Description
    + Location coordinate Y (or Latitude column).  Refer to LOC_COORD_X for additional details.

##### LOC_ID
* Worksheet:  LOCATION (A), BOREHOLE (B), GEOLOGY (C), SCREEN_AND_SOIL (D)
* Required: No
* Data Type: Numeric (whole numbers, integers, only)
* Description
    + The primary numeric key used to link information between tables or datasheets within the ORMDB.  This column should only be used if the location has previously been entered into the ORMDB and the numeric value provided to the end-user.  In all other cases, the LOC_NAME field should be used in its place.

##### LOC_NAME
* Worksheet: LOCATION (A), BOREHOLE (B), GEOLOGY (C), SCREEN_AND_SOIL (D) (may also be in LAB_DATA (E) and FIELD_DATA (F), see below)
* Required: Yes
* Data Type: Text (alphanumeric; maximum length 255 characters)
* Description
    + Location name.  This should be distinctive between differing locations (having different coordinates) on the same datasheet.  This field is also used to link information between worksheets; its use allows data to be related to a specific location.  The INT_NAME field can also be used for some worksheets.  In addition, the NAME field in LAB_DATA (E) and FIELD_DATA (F) worksheets can hold either the LOC_NAME or INT_NAME value (although the INT_NAME is preferred; it is required if more than one interval is found for the particular location).

##### LOC_NAME_ALT1
* Worksheet: LOCATION (A)
* Required: No
* Data Type: Text (alphanumeric; maximum length 255 characters)
* Description
    + Alternate location name.  This is to be used where, for example, various sources (reports) use varying names for the same location.

##### LOC_ORIGINAL_NAME  
* Worksheet: LOCATION (A)
* Required: Recommended
* Data Type: Text (alphanumeric; maximum length 255 characters)
* Description
    + This is typically used to store the WWIS Well Record Number (or if that is unknown then the MOE Tag Number or Audit Number can be substituted).  Alternatively, where no MOE Well Record has been created, an additional consultant name can be stored here.

##### LOC_STATUS
* Worksheet: LOCATION (A)
* Required: Recommended
* Data Type: Text (alphabetic; maximum length 50 characters)
* Description
    + Indication of the location status as well as the long term use for which the well is intended.  Any of, for example: active; geotechnical well; backup well municipal supply well; active long term golf course monitoring well; etc?  .

##### LOC_STUDY
* Worksheet: LOCATION (A)
* Required: Recommended
* Data Type: Text (alphanumeric; maximum length 50 characters)
* Description
    + Description of the study that the location is part of, as applicable

##### MAT_COLOUR
* Worksheet: GEOLOGY (C)
* Required: Recommended
* Data Type: Text (alphabetic; maximum length 50 characters)
* Description
    + Primary colour of geologic layer.  This should be a standard format throughout.  Refer to the GEOLOGY COLOUR worksheet for the currently defined colours as found in the ORMDB.

##### MATERIAL_1
* Worksheet: GEOLOGY  (C)
* Required: Yes
* Data Type: Text (alphabetic; maximum length 50 characters)
* Description
    + First (or primary) geologic material description for layer.  For example: silt; sand; clay; till; etc?  Note that the materials for the layer are specified in decreasing order of presence (i.e. Mat 1 - most prevalent; Mat 2 - 2nd most prevalent, etc.) , from most prevalent to least.  This should be a standard format throughout.  Refer to the GEOLOGY MATERIAL worksheet for the sediment and rock descriptions that should be used.

##### MATERIAL_2
* Worksheet: GEOLOGY (C)
* Required: Yes (if applicable)
* Data Type: Text (alphabetic; maximum length 50 characters)
* Description
    + Second geologic material description for layer.  Refer to MATERIAL_1.

##### MATERIAL_3
* Worksheet: GEOLOGY (C)
* Required: Yes (if applicable)
* Data Type: Text (alphabetic; maximum length 50 characters)
* Description
    + Third geologic material description for layer.  Refer to MATERIAL_1.

##### MATERIAL_4
* Worksheet: GEOLOGY (C)
* Required: Yes (if applicable)
* Data Type: Text (alphabetic; maximum length 50 characters)
* Description
    + Fourth geologic material description for layer.  Refer to MATERIAL_1.

##### NAME
* Worksheet: LAB_DATA (E), FIELD_DATA (F)
* Required: Yes
* Data Type: Text (alphanumeric; maximum length 255 characters)
* Description
    + Location Name (LOC_NAME) or Interval Name (INT_NAME) used to link information between worksheets.  Note that if multiple intervals are present for a particular location, the INT_NAME should be used as modified for the SCREEN_AND_SOIL worksheet (refer to INT_NAME for details).

##### PARAMETER
* Worksheet: LAB_DATA (E), FIELD_DATA (F)
* Required: Yes
* Data Type: Text (alphanumeric; maximum length 50 characters)
* Description
    + Parameter name analyzed by the laboratory (e.g. sodium, chloride, etc?).  A consistent naming scheme should be adopted (e.g. Na or sodium, not both in the same worksheet).  Refer to the PARAMETER_NAMES worksheet for the appropriate (available) parameter names as currently found within the ORMDB.  Any 'new' parameters (i.e. not found in the list) should have a COMMENT as well.   

##### SAMPLE_DATE
* Worksheet: LAB_DATA (E)
* Required: Yes
* Data Type: Datetime
* Description
    + Date (and, optionally, time) when the sample was originally obtained.  The format used should be yyyy-mm-dd hh:mm to avoid confusion with regard to the various datetime formats.

##### SAMPLE_NAME
* Worksheet: LAB_DATA (E)
* Required: Yes
* Data Type: Text (alphanumeric; maximum length 255 characters)
* Description
    + Sample name.  If multiple samples are being input, this name should be distinct from other sample names.

##### SCREEN_MATERIAL
* Worksheet: SCREEN_AND_SOIL (D)
* Required: Recommended (for screens)
* Data Type: Text (alphanumeric; maximum length 50 characters)
* Description
    + For screens, the material composition type.

##### SCREEN_SLOT
* Worksheet: SCREEN_AND_SOIL (D)
* Required: Recommended (for screens)
* Data Type: Text (alphanumeric; maximum length 50 characters)
* Description
    + For screens, the slot size.  

##### SCREEN_STICKUP
* Worksheet: SCREEN_AND_SOIL (D)
* Required: Yes (for screens/open holes)
* Data Type: Numeric
* Description
    + This is required when the INTERVAL_TYPE is a screen.  The height of the monitoring pipe above the ground surface in metres; a negative value if it is found below the ground surface.  This value is assumed to be 0.75 m if not otherwise reported.  This is considered the reference point at which point manual water levels would be measured.

##### SOIL_BLOW_COUNT
* Worksheet: SCREEN_AND_SOIL (D)
* Required: Recommended (for soils)
* Data Type: Numeric
* Description
    + For soil samples, the number of blows required to drive the split spoon 6 inches.

##### SOIL_MOISTURE
* Worksheet: SCREEN_AND_SOIL (D)
* Required: Recommended (for soils)
* Data Type: Numeric
* Description
    + For soil samples, the estimated field (or otherwise) moisture content as a percentage.

##### SOIL_RECOVERY
* Worksheet: SCREEN_AND_SOIL (D)
* Required: Recommended (for soils)
* Data Type: Numeric
* Description
    + For soil samples, the percent of soil sample recovered from within, for example, a split spoon.

##### TOP
* Worksheet: SCREEN_AND_SOIL (D)
* Required: Yes
* Data Type: Numeric
* Description
    + Top depth of screen or soil sample in metres.  TOP must be less than BOTTOM.

##### UNIT
* Worksheet: LAB_DATA (E), FIELD_DATA (F)
* Required: Yes
* Data Type: Text (alphanumeric; maximum length 50 characters)
* Description
    + The units by which the PARAMETER was measured.  Note that consistent units should be chosen for the individual PARAMETER.  Available units can be seen in the UNIT_NAME worksheet.  If a required unit is not found in this table, a note should be made in the COMMENT field and the unit can be added to the bottom of the UNIT_NAME worksheet.

##### VALUE
* Worksheet: LAB_DATA (E), FIELD_DATA (F)
* Required: Yes
* Data Type: Numeric
* Description
    + The resultant value of the parameter as analyzed by the laboratory.

##### VALUE_MDL
* Worksheet: LAB_DATA (E)
* Required: No (as applicable)
* Data Type: Numeric
* Description
    + Method Detection Limit for the PARAMETER analyzed (as dictated by the laboratory equipment used for the analysis). This is used along with a '<' to indicate that a particular result is below the detection limit.

##### VALUE_QUALIFIER
* Worksheet: LAB_DATA (E)
* Required: No (as applicable)
* Data Type: Text (alphanumeric; maximum length 10 characters)
* Description
    + VALUE qualifier.  This, if applicable, should only include the '<' (less-than) symbol to indicate that the VALUE returned is below the detection limit for the specific PARAMETER.  The value itself would be found in the VALUE_MDL field.

##### VALUE_UNCERTAINTY
* Worksheet: LAB_DATA (E)
* Required: No (as applicable)
* Data Type: Numeric
* Description
    + Uncertainty in the value for the PARAMETER analyzed; that is, uncertainty associated with the measurement itself (this would be considered in the database to be a '+/-' in front of the value).
