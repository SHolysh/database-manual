---
title:  "Appendix A"
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
                    'A_SQL_Outline.html')
                )
            }
        )
---

## Appendix A - Basic Outline and Use of Structured Query Language (SQL)

This is an introduction to the syntax and applied use of SQL with specific reference to the ORMGP database.  SQL allows users to access (and manipulate) data from relational databases (or more formally known as a 'Relational Database Management System' - RDBMS) in a fairly straightforward manner using a language-natural syntax without (with the exception of advanced queries) having to know computer programming.  Almost all cases can be considered to use 'standard' SQL (also referred to as 'ANSI' SQL) that should be 'mostly' applicable across a number of relational database software (e.g. Microsoft SQL Server, Microsoft Access, Oracle, MySQL, SQLITE, etc ...).  Note that there are slight differences in the supported syntax between these packages.  In addition, syntax described below may also be applicable across multiple SQL statement types (instead of just within the example given).

Note that all SQL syntax will be shown in capitals.  Comments and placeholders will be shown in lowercase. Single quotes (i.e. 'example') are used where text is being examined - note that in some software, double quotes (i.e. "example") would be used instead.

### A.1 Select Statement

#### Select Statement - Overview

SELECT is the most common statement used within a relational database, allowing the user to 'select' specific information from an existing table (or tables).  The general syntax is of the form

    SELECT <comma-delimited list of fields> FROM <a single table name>

Examining the contents of the D_LOCATION table would require 

    SELECT * FROM D_LOCATION

which would return all the fields and all the rows within the D_LOCATION table.  Note the use of the '*' wildcard, this allows the user to allow selection of all existing fields without having to list the fields individually, as

    SELECT 
    LOC_ID,
    LOC_NAME,
    LOC_NAME_ALT1,
    LOC_TYPE_CODE,
    OWN_ID,
    ...
    FROM
    D_LOCATION

where the '...' indicates the remainder of the fields (this is not valid SQL syntax, just a placeholder for descriptive purposes).  Note that the fields are comma-delimited and are listed across multiple lines - line spacing (and additional blank space on lines themselves) does not affect the query and can be used as a formatting tool (enabling ease of viewing).

You likely would not want to examine all rows from a particular table at once.  If you were assembling a query (i.e. putting a complicated query together based upon succeeding steps) you could choose to examine only the first few records returned using the TOP keyword.

    SELECT TOP 1000 LOC_ID,LOC_NAME FROM D_LOCATION

This extracts the location identifier and associated location name from the D_LOCATION table but limits the number of rows returned to the first 1000.  The order the rows are returned should not be relied upon - the means for specifying a particular order will be outlined in a subsequent section.

In many cases, the user is looking for particular information.  For example, if you wanted to see the names associated with a particular location in the database, given a LOC_ID of '-828830263', then the query

    SELECT * FROM D_LOCATION WHERE LOC_ID = -828830263

would return all fields but only a single row from the D_LOCATION table - the row matching the provided location identifier.  Other operators, instead of  using '=' (equal to) as the test operator, can also be used including

* Not equal (!=)
* Less than (\<)
* Greater than (\>)
* Less than or equal to (\<=)
* Greater than or equal to (\>=)

So a user could determine all those boreholes (from the D_BOREHOLE table) with a BH_BOTTOM_DEPTH of 20m by

    SELECT * FROM D_BOREHOLE WHERE BH_BOTTOM_DEPTH > 20

The name fields (e.g. LOC_NAME, LOC_NAME_ALT1, etc ...) can also be used to extract information about a particular location (stored in D_LOCATION).  If only a name was known

    SELECT * FROM D_LOCATION WHERE LOC_NAME='Port Perry OW 05/3'

would pull the same information as using the LOC_ID (above) of '-828830263'.  However, searching through text fields is different from numeric in that rarely do the text fields match the exact text the user enters.  Instead of an exact match, the user - when looking for location names containing certain text - can use the LIKE keyword

    SELECT * FROM D_LOCATION WHERE LOC_NAME LIKE '%UGAIS%'

This extracts all rows (and fields) of information where the location name contains, anywhere within its name, the 'UGAIS' key.  Note the use of the '%' signs (in Microsoft Access and other packages, a '*' can be used instead) as part of the quoted text - these are text wildcards specifying that any number of characters can be in front of the 'UGAIS' text and that any number of characters can take place after it.  This includes the case of no characters before and/or after.

Multiple checks can be made (after WHERE) against the table.  This is accomplished through additional boolean (or logical) operators.

    SELECT 
    *
    FROM D_LOCATION
    WHERE
    LOC_NAME LIKE '%UGAIS%' AND LOC_ORIGINAL_NAME LIKE 'TR%'

In this case, we're specifying two checks - one against the LOC_NAME field, another against the LOC_ORIGINAL_NAME field.  For the latter, notice that the '%' character only appears after the 'TR', indicating this text must be placed at the beginning of the name.  The boolean operator used is AND - both checks must be true, i.e. 'UGAIS' must appear in LOC_NAME and 'TR' must be at the beginning of the LOC_ORIGINAL_NAME.  Another boolean operation is OR, as in

    SELECT
    * 
    FROM D_LOCATION
    WHERE 
    LOC_NAME LIKE '%UGAIS%' OR LOC_NAME LIKE '%OGS'

where the rows returned from D_LOCATION depend on whether the 'UGAIS' or the 'OGS' text appear as part of LOC_NAME.  To return to numeric comparisons, if we wanted to find all boreholes from D_BOREHOLE with BH_BOTTOM_DEPTH of greater than 20m but less than or equal to 40m the following could be used

    SELECT
    *
    FROM D_BOREHOLE
    WHERE
    BH_BOTTOM_DEPTH > 20 AND BH_BOTTOM_DEPTH <= 40

More complicated queries can be built by combining multiple checks on values within a table, for example the following

    SELECT 
    *
    FROM 
    D_LOCATION
    WHERE
    (LOC_COORD_EASTING >= 620000 AND 
     LOC_COORD_EASTING <=640000)
    AND
    (LOC_COORD_NORTHING >= 4831000 AND 
     LOC_COORD_NORTHING <= 4841000)
    AND 
    (LOC_NAME LIKE '%UGAIS%' OR LOC_NAME LIKE '%OGS%')

where we are searching for all locations within a designated spatial area (using coordinates; i.e. LOC_COORD_EASTING and LOC_COORD_NORTHING) as well as extracting only those locations which include 'UGAIS' or 'OGS' in their names.

#### Select Statement - IN condition

Multiple OR statements can be used to find all locations given a particular characteristic, like any location that could have geological information

    SELECT LOC_ID,LOC_NAME,LOC_NAME_ALT1,LOC_TYPE_CODE
    FROM D_LOCATION
    WHERE
    LOC_TYPE_CODE=1
    OR LOC_TYPE_CODE=7
    OR LOC_TYPE_CODE=11
    OR LOC_TYPE_CODE=17
    OR LOC_TYPE_CODE=18
    OR LOC_TYPE_CODE=19

where the LOC_TYPE_CODES (refer to R_LOC_TYPE_CODE) are

* Well or Borehole (1)
* Testpit (7)
* Outcrop (11)
* Geological Section (17)
* Oil and Gas Well (18)
* Bedrock Outcrop (19)

However, this statement can be simplified by using the IN statement which allows the possible values the user is checking against to be listed, as in

    SELECT LOC_ID,LOC_NAME,LOC_NAME_ALT1,LOC_TYPE_CODE
    FROM D_LOCATION
    WHERE
    LOC_TYPE_CODE IN (1,7,11,17,18,19)

which is shorter and much easier to understand.

The IN condition also allows us to combine SELECT queries (instead of using, for example, JOINS - as described below).  The first SELECT query (actually occurring at the end of the 'full' query) would come up with a list of single values

    SELECT LOC_ID FROM D_BOREHOLE

Here we're getting a list of all LOC_ID (i.e. locations) that are found in the D_BOREHOLE table.  This is approximately equivalent to using the LOC_TYPE_CODE in the previous example.  Now that we have a list of LOC_ID's, we can pull their names and type codes from D_LOCATION except, this time, we're using the IN keyword to include the first SELECT statement

    SELECT LOC_ID,LOC_NAME,LOC_NAME_ALT1,LOC_TYPE_CODE
    FROM D_LOCATION
    WHERE 
    LOC_ID IN
    (
        SELECT LOC_ID FROM D_BOREHOLE
    )

This should return equivalent results to that of using the LOC_TYPE_CODE earlier.  Again note that, for this type of use, the first SELECT statement (i.e. the one in brackets) should only return a list of a single value (otherwise an SQL error will be returned).

#### Select Statement - BETWEEN condition

The BETWEEN condition can be used for comparisons for a range of values.  Thus, to simplify a previous example

    SELECT 
    *
    FROM 
    D_LOCATION
    WHERE
    LOC_COORD_EASTING BETWEEN 620000 AND 640000
    AND
    LOC_COORD_NORTHING BETWEEN 4831000 AND 4841000
    AND 
    (LOC_NAME LIKE '%UGAIS%' OR LOC_NAME LIKE '%OGS%')

with similar results.

#### Select Statement - Joins

In a relational database, only certain information on a particular object/entity would be contained in a single table (e.g. D_LOCATION containing basic locational information including name, coordinates, location type, etc ...).  Additional information would then be stored in additional tables (dependent upon the particular location).  For example, borehole locations would have information stored in D_BOREHOLE, including depths and elevations of the top and bottom of the hole, the start and ending dates of drilling, etc ...  A borehole location might also have a screen - that information would be stored in other tables including D_INTERVAL (the interval name and type), D_INTERVAL_MONITOR (the top and bottom of the screen), etc ...  The information in the tables would be linked (i.e. related) by keys (i.e. primary keys where each row in the table can be distinguished between based upon the key, each being unique).  Examples of primary keys in the database include LOC_ID (found in D_LOCATION, D_BOREHOLE, etc ...) and INT_ID (found in D_INTERVAL, D_INTERVAL_MONITOR, etc ...).  Means of combining information from multiple tables, based upon these primary keys, are called Joins.  We'll examine two types - inner joins and outer joins

***Select Statement - Inner Joins***

All joins use the primary key to relate tables.  Inner joins require that this key exists in both tables being referenced.  For example, if we wanted the location information (found in D_LOCATION) and borehole elevation and depth for any borehole (in D_BOREHOLE) with depths greater than 20m, our query would look like

    SELECT
    dloc.LOC_ID,
    LOC_NAME,
    LOC_NAME_ALT1,
    LOC_NAME_ORIGINAL,
    BH_GND_ELEV,
    BH_BOTTOM_DEPTH
    FROM
    D_BOREHOLE AS dbore
    INNER JOIN
    D_LOCATION AS dloc
    ON
    dbore.LOC_ID = dloc.LOC_ID

where we're 'joining' our two tables (using the INNER JOIN keywords) based upon the presence of LOC_ID (which is our primary key) in each table (note that in the table we're relating, it's referred to as the foreign key).  We've also introduced another concept here, the AS keyword.  As some of the fields we're using occur in both tables (namely, in this case, LOC_ID) we should specify which one we're actually referencing/using in the query - the AS keyword allows us to use an alias to reference the table (and also fields, but this is not shown here) using a different name.  Here, D_BOREHOLE is aliased as 'dbore' and D_LOCATION is aliased as 'dloc'.  This allows us to be clear regarding the source of the fields as well as shortening the names required in the query itself (using 'Dot Notation', i.e. having a 'period' between the name of the table and the name of the field).

Multiple tables can be joined at the same time.  If we wanted to include interval data as part of our, above, query then we could use

    SELECT
    dloc.LOC_ID,
    dloc.LOC_NAME,
    dloc.LOC_NAME_ALT1,
    dloc.LOC_ORIGINAL_NAME,
    dbore.BH_GND_ELEV,
    dbore.BH_BOTTOM_DEPTH,
    dint.INT_ID,
    dint.INT_NAME
    FROM
    D_BOREHOLE AS dbore
    INNER JOIN
    D_LOCATION AS dloc ON dbore.LOC_ID = dloc.LOC_ID
    INNER JOIN
    D_INTERVAL AS dint ON dloc.LOC_ID = dint.LOC_ID

Note that we've now specified exactly (using the <table>.<field> syntax) which field is coming from which table.

***Select Statement - Outer Joins***

Outer joins are used when we're unsure whether the key will appear in one of the tables.  Outer joins are different in that they're specified using a LEFT or RIGHT keyword - this stresses which of the two tables (i.e. the left or right table in the query) is the one we're using as the base (i.e. which has the key).  Using our previous example, if we wanted to include the bedrock elevation for each borehole, knowing that some (most?) boreholes will not actually have bedrock values we would

    SELECT
    dloc.LOC_ID,
    dloc.LOC_NAME,
    dloc.LOC_NAME_ALT1,
    dloc.LOC_ORIGINAL_NAME,
    dbore.BH_GND_ELEV,
    dbore.BH_BOTTOM_DEPTH,
    dint.INT_ID,
    dint.INT_NAME,
    vbed.BEDROCK_ELEV
    FROM
    D_BOREHOLE AS dbore
    INNER JOIN
    D_LOCATION AS dloc ON dbore.LOC_ID = dloc.LOC_ID
    INNER JOIN
    D_INTERVAL AS dint ON dloc.LOC_ID = dint.LOC_ID
    LEFT OUTER JOIN
    V_GEN_BOREHOLES_BEDROCK as vbed ON vbed.LOC_ID = dbore.LOC_ID

#### Select Statement - Calculations (Arithmetic Operations) and Mathematical Functions

In many cases, a user would wish to combine values in some sort of calculation and return the result of that calculation as part of the query.  In the previous query, for example, instead of returning just the borehole bottom depth (i.e. BH_BOTTOM_DEPTH) we may wish to calculate the elevation at the bottom of the borehole as well as the depth at which the bedrock surface is encountered.  In which case we would change the above to 

    SELECT
    dloc.LOC_ID,
    dloc.LOC_NAME,
    dloc.LOC_NAME_ALT1,
    dloc.LOC_ORIGINAL_NAME,
    dbore.BH_GND_ELEV,
    dbore.BH_BOTTOM_DEPTH,
    (dbore.BH_GND_ELEV - dbore.BH_BOTTOM_DEPTH) as BH_BOT_ELEV,
    (dbore.BH_GND_ELEV - vbed.BH_BEDROCK_ELEV) as BED_DEPTH_M,
    dint.INT_ID,
    dint.INT_NAME
    FROM
    D_BOREHOLE AS dbore
    INNER JOIN
    D_LOCATION AS dloc ON dbore.LOC_ID = dloc.LOC_ID
    INNER JOIN
    D_INTERVAL AS dint ON dloc.LOC_ID = dint.LOC_ID
    LEFT OUTER JOIN
    V_GEN_BOREHOLES_BEDROCK as vbed ON vbed.LOC_ID = dbore.LOC_ID

Notice the use of the AS keyword here to assign the name BED_DEPTH_M and BH_BOT_ELEV to the result of the calculations; if not specified, an automatically generated column name would be assigned instead.

Standard arithmetic operations include

* Addition (+)
* Subtraction (-)
* Multiplication (\*)
* Division (/)
* Modulo (%)

The results of 'Modulo' (for those unfamiliar with the operation) would be the (integer) remainder after a division operation.  (For example: '3 % 2' would return a value of 1; '2 % 2' would return a value of 0.)

In addition there are a number of non-standard (i.e. not necessarily available in all relational database software) mathematical functions that can be useful.

* ABS(x) - Returns the absolute value of (x)
* SIGN(x) -  Returns the sign of (x) (i.e. one of -1, 0 or 1)
* MOD(x,y) - Modulo; returns the (integer) remainder of x divided by y (same as 'x % y')
* FLOOR(x) - Returns the largest value less than or equal to (x)
* CEILING(x) - Returns the smallest integer greater than or equal to (x); also CEIL(x)
* POWER(x,y) - Returns the value of x raised to the power of y
* ROUND(x) - Returns the value of x rounded to the nearest integer; users must be careful when using this function as various ROUND(x) implementations (across software platforms) may calculate this value differently
* SQRT(x) - Returns the square-root value of (x)

Other functions, including trigonometric, are also available in the various relational database software (but are not described here).

#### Select Statement - CASE condition

The CASE conditional statement can be used when multiple values are present and the user wants to modify the result based upon the particular value.  For example, if we were performing a check on the calculation of depth (in metres) for boreholes based upon their OUOM values there is an issue - the units of the OUOM values can vary; we'll need to account for this, as follows

    SELECT
    dbore.LOC_ID
    ,dbore.BH_BOTTOM_DEPTH
    ,CASE
    WHEN dbore.BH_BOTTOM_UNIT_OUOM LIKE 'mbgs' THEN dbore.BH_BOTTOM_OUOM
    WHEN dbore.BH_BOTTOM_UNIT_OUOM  LIKE 'masl' THEN 
    (dbore.BH_GND_ELEV - dbore.BH_BOTTOM_OUOM)
    WHEN dbore.BH_BOTTOM_UNIT_OUOM LIKE 'fbgs' THEN
    (dbore.BH_BOTTOM_OUOM * 0.3048)
    ELSE -9999
    END AS CHK_BH_BOTTOM_DEPTH
    FROM 
    D_BOREHOLE as dbore

This returns a single value, calculated in certain instances, in 'mbgs' (i.e. metres below ground surface) to compare against BH_BOTTOM_DEPTH; the returned value is assigned the column name CHK_BOTTOM_DEPTH. Note that the default, if none of the conditions are met, is a particular value (i.e. '-9999') that can be used to check for conditions the user has not specified.

#### Select Statement - ORDER BY

Information returned from a query can, at times, be more useful when it is ordered in some way.  This can be the case in particular when working with time-stamped data (i.e. data with an associated date-time).  If we, for example, wanted to examine all manual water levels from the borehole 'Port Perry OW 05/3' (LOC_ID -828830263) we would first need to determine the interval associated with the location (remember, water level - temporal - information is linked against a particular screen/interval) 

    SELECT INT_ID,INT_NAME,INT_NAME_ALT1
    FROM D_INTERVAL WHERE D_LOCATION=-828830263

This would return the interval identifier (a numeric) and the names associated with the particular location we're examining.  However, we can skip this step by including the determination of the INT_ID as part of the water level query

    SELECT
    *
    FROM
    D_INTERVAL_TEMPORAL_2 AS dit2
    INNER JOIN
    D_INTERVAL AS dint
    ON
    dit2.INT_ID=dint.INT_ID
    WHERE
    dint.LOC_ID=-828830263

where we've only specified the location identifier.  Alternately, the name of the location could be used to extract the particular borehole (and compared against, for example, LOC_NAME).  This query, though, extracts all information linked against this location (and interval).  We need to limit what is returned to only that in which we are interested

    SELECT
     dit2.INT_ID
    ,dit2.RD_DATE 
    ,dit2.RD_VALUE 
    ,ruc.UNIT_DESCRIPTION
    FROM
    D_INTERVAL_TEMPORAL_2 AS dit2
    INNER JOIN
    D_INTERVAL AS dint
    ON
    dit2.INT_ID=dint.INT_ID
    INNER JOIN
    R_UNIT_CODE as ruc
    on
    dit2.UNIT_CODE=ruc.UNIT_CODE
    WHERE
    dint.LOC_ID=-828830263
    and dit2.RD_NAME_CODE=628

We have not specified that we're only interested in water level manual readings (RD_NAME_CODE 628; refer to R_RD_NAME_CODE).  Note also that the UNIT_DESCRIPTION from R_UNIT_CODE has been included as a check that all values returned (RD_VALUE) are in consistent units (in this case, all values should be in 'masl').  The information returned would be in some random order making it difficult to look for trends - we'll now (finally) order the information by date (RD_DATE)

    SELECT
     dit2.INT_ID
    ,dit2.RD_DATE 
    ,dit2.RD_VALUE 
    ,ruc.UNIT_DESCRIPTION
    FROM
    D_INTERVAL_TEMPORAL_2 AS dit2
    INNER JOIN
    D_INTERVAL AS dint
    ON
    dit2.INT_ID=dint.INT_ID
    INNER JOIN
    R_UNIT_CODE as ruc
    on
    dit2.UNIT_CODE=ruc.UNIT_CODE
    WHERE
    dint.LOC_ID=-828830263
    and dit2.RD_NAME_CODE=628
    ORDER BY
    dit2.RD_DATE

By default, the returned information would be in ascending order (i.e. from the earliest date to the latest).  If we wished to reverse the order, we would append  DESC after the final 'dit2.RD_DATE' reference (i.e. at the end of the query).

#### Select Statement - Aggregate Functions and GROUP BY

If we needed to examine the average, the minimum/maximum or the total number of recorded values of the previous water level manuals we would make use of an aggregate function.  This requires, in addition, a GROUP BY statement as part of the query.  The GROUP BY allows a list of values to be created based upon a particular field.  These functions include

* AVG (the average of the specified field)
* COUNT (the number of rows satisfying the GROUP BY condition)
* MAX (the largest value found in the specified field)
* MIN (the smallest value found in the specified field)
* SUM (the total of all values found in the specified field)

These are used as following

    SELECT
     dit2.INT_ID 
    ,AVG(dit2.RD_VALUE) as AVG_WL
    FROM
    D_INTERVAL_TEMPORAL_2 AS dit2
    INNER JOIN
    D_INTERVAL AS dint
    ON
    dit2.INT_ID=dint.INT_ID
    INNER JOIN
    R_UNIT_CODE as ruc
    on
    dit2.UNIT_CODE=ruc.UNIT_CODE
    WHERE
    dint.LOC_ID=-828830263
    and dit2.RD_NAME_CODE=628
    GROUP BY
    dit2.INT_ID

Here we're grouping the returned information by the INT_ID - this means that any values related to a particular INT_ID will become part of a (virtual) list.  From this list, we then calculate the average value using the AVG keyword.  The result would be one value/row returned for each INT_ID.  We can perform multiple aggregate functions at once 

    SELECT
     dit2.INT_ID 
    ,AVG(dit2.RD_VALUE) AS AVG_WL
    ,MIN(dit2.RD_VALUE) AS MIN_WL
    ,MAX(dit2.RD_VALUE) AS MAX_WL
    ,COUNT(dit2.RD_VALUE) AS NUM_WL
    FROM
    D_INTERVAL_TEMPORAL_2 AS dit2
    INNER JOIN
    D_INTERVAL AS dint
    ON
    dit2.INT_ID=dint.INT_ID
    INNER JOIN
    R_UNIT_CODE AS ruc
    ON
    dit2.UNIT_CODE=ruc.UNIT_CODE
    WHERE
    dint.LOC_ID=-828830263
    AND dit2.RD_NAME_CODE=628
    GROUP BY
    dit2.INT_ID

This query returns the average, minimum, maximum and number of manual water levels associated with this particular location (and interval).  

### A.2 UNION and UNION ALL

Allows combinations of SELECT statements to be 'appended' together resulting in a single output set.  The number of fields, the order and the field types must match between the statements.  Generally, the names of the fields should match as well.  Note that UNION will remove duplicate records between (and possibly within) the statements while UNION ALL will retain all records.  Thus, a statement like the following

    SELECT
    dit1a.SAM_ID
    ,dit1a.SAM_SAMPLE_NAME
    ,dit1a.SAM_SAMPLE_DATE
    ,dit2.RD_NAME_CODE
    ,dit2.RD_VALUE 
    ,dit2.UNIT_CODE
    ,NULL AS RD_MDL
    ,NULL AS RD_VALUE_QUALIFIER
    ,NULL AS RD_UNCERTAINTY
    FROM
    D_INTERVAL_TEMPORAL_2 AS dit2
    INNER JOIN
    D_INTERVAL_TEMPORAL_1A AS dit1a
    ON
    dit2.INT_ID=dit1a.INT_ID AND dit2.RD_DATE=dit1a.SAM_SAMPLE_DATE
    WHERE
    dit2.RD_TYPE_CODE=77
    
    UNION ALL
    
    SELECT
    dit1a.SAM_ID
    ,dit1a.SAM_SAMPLE_NAME
    ,dit1a.SAM_SAMPLE_DATE
    ,dit1b.RD_NAME_CODE
    ,dit1b.RD_VALUE 
    ,dit1b.UNIT_CODE
    ,dit1b.RD_MDL
    ,dit1b.RD_VALUE_QUALIFIER
    ,dit1b.RD_UNCERTAINTY
    FROM
    D_INTERVAL_TEMPORAL_1B AS dit1b
    INNER JOIN
    D_INTERVAL_TEMPORAL_1A AS dit1a
    ON
    dit1b.SAM_ID=dit1a.SAM_ID

would combine the parameter results from both D_INTERVAL_TEMPORAL_1A/1B and D_INTERVAL_TEMPORAL_2 that were taken at the same date-time for the same interval.  Note that, as D_INTERVAL_TEMPORAL_2 does not have uncertainty and mean-detection limit fields, NULL values are used as placeholders.  Also, the RD_TYPE_CODE of '77' indicates that the parameter was taken in the field even though it is otherwise generally assumed to be a 'laboratory' parameter.


