---
title:  "Section 3.1.2"
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
                    '03_01_02_MS_Access.html')
                )
            }
        )
---

## Section 3.1.2 - Microsoft Access

#### Microsoft Access - Version 2003

MS Access allows connection to SQL Server databases through the linking of tables (note that 'Views' are seen as tables in MS Access).  Linking is accomplished by selecting (from within an existing - or new - Access database) 'File - Get External Data - Link Tables'.

![Figure 3.1.2.1 Microsoft Access Version 2003 get external data
selection](f03_01_02_01_msa_link.jpg)*Figure 3.1.2.1 Microsoft Access Version 2003 get external data
selection*

Note that the user (or administrator) must have already setup the ODBC connection (or the DSN file setup) for the partner database as described in Section 3.1.1.  The ODBC file type is selected

![Figure 3.1.2.2 Microsft Access Version 2003 select SQL
connection](f03_01_02_02_msa_odbc.jpg)*Figure 3.1.2.2 Microsft Access Version 2003 select SQL
connection* 

followed by the selection of the appropriately named SQL Server instance (which will differ for each partner agency; here the selected name is 'MDM6500_OAK').  Select 'OK'.

![Figure 3.1.2.3 Microsoft Access Version 2003 select data
source](f03_01_02_03_msa_odbc_name.jpg)*Figure 3.1.2.3 Microsoft Access Version 2003 select data
source]*

The user will then be prompted with a 'Select Data Source' dialog box.  A file (i.e. a '.DSN' source) would be accessed through the 'File Data Source' tab while a 'User DSN' (most likely to have been setup by your system administrator) will be found under 'Machine Data Source'.   Select the appropriate link for your database and then 'OK'.

The user will be then be prompted with a 'Link Tables' dialog box.  Unfortunately, the complete list ('Select All') should not be chosen as there are a number of unnecessary (for the user) SQL Server system tables listed amongst the ORMGP database tables and views.  These must be selected one-by-one.  If the user wishes the complete standard database, select all the D_*, R_* and V_* 'tables' listed.

![Figure 3.1.2.4 Microsoft Access Version 2003 select tables to be
linked](f03_01_02_04_msa_select_names.jpg)*Figure 3.1.2.4 Microsoft Access
Version 2003 select tables to be linked*

Alternatively, select only those 'tables' required for the task at hand.  Once the user selects 'OK', those selected tables will be linked into the Access database.  During the linking process the user may be prompted to identify the 'primary key' for a particular table - in most cases, one of LOC_ID, INT_ID, 'Location ID' or similar should be selected.  Refer to 'Table Keys for Access Import', below, for specific details.

Below, only a subset of the tables has been chosen for linking.

![Figure 3.1.2.5 Microsoft Access Version 2003 linked
tables](f03_01_02_05_msa_linked_tables.jpg)*Figure 3.1.2.5 Microsoft Access Version 2003 linked
tables*

Note that each table has a 'dbo_' pre-pended to it's name - this refers to the 'database object', as it is referenced within SQL Server itself.  These can be renamed by the user, if desired (note that there is an EarthFX linker tool available which will accomplish this process and will also automatically rename the linked tables without the 'dbo_' prefix).  

At this point, the user can interact with the SQL Server database in the same way as any other Access database.  One caution, however, is that in executing long-running queries (and accessing some of the long-running views) an ODBC error can result (usually a time-out error).  The time for running processes (in Access) is generally defaulted to 60 seconds (for queries) but can be adjusted by selecting 'View - Properties' (while in the 'Design View' of the query itself; make sure nothing is currently selected; click the mouse in the table area, but not on a table, to make sure of this) and looking for the 'ODBC Timeout' value.  Change this to some higher number (for example, '300' for five minutes).  This change only affects the query that is open in 'Design View', global solutions are possible as well, however these should only be implemented by the computer administrator.

#### Microsoft Access - Version 2007 (and later)

The connection to this version of the Access software is similar with slightly different selection pathways.  The 'File - Get External Data - Link Tables' step is now 'External Data - ODBC Database'

![Figure 3.1.2.6 Microsoft Access Version 2007 get external
data](f03_01_02_06_v2010_odbc.jpg)*Figure 3.1.2.6 Microsoft Access Version 2007 get external
data*

The dialog-box selection of the SQL Server instance (or database) as well as the table-linking for both versions of Access are the same (they're actually independent Windows programs).  The resultant table listing is somewhat different.

![Figure 3.1.2.7 Microsoft Access Version 2007 linked
tables](f03_01_02_07_v2010_tables.jpg)*Figure 3.1.2.7 Microsoft Access Version 2007 linked
tables*

#### Table Keys for Access Import

Refer to Figure 4.1.1 (in Section 4.1) or Sections 4.2 and 4.3 for detailed
relationships including the primary keys in each table.

#### Microsoft Access - Pass-Through Queries

Pass-through queries are used within Microsoft Access to send commands directly to a SQL database server.  In this manner, the user is bypassing the built-in Access database engine (i.e. Microsoft Jet) and working, instead, directly with the SQL database tables.  This can have some advantages with regards to the speed-of-processing of queries - it also allows the user to modify the maximum processing time for long-running queries.

The user must have access (or be able to create) an ODBC connection to their partner agency version of the ORMGP database, as described in Section 3.1.1.  (This may require a 'System DSN' instead of a 'User DSN'; see you system administrator if you experience problems.)  This connection is the means by which Access connects to the SQL server.

For Microsoft Access 2007 (and later) select 'Create - Query Design' and close the resultant dialog box without adding any tables, as indicated.

![Figure 3.1.2.8 Microsoft Access Version 2007 pass through
queries](f03_01_02_08_ptq_01.jpg)*Figure 3.1.2.8 Microsoft Access Version 2007 pass through
queries*

Select 'Design - Pass-Through' on the 'Design' tab (and 'Query Type', respectively), then select the 'Property Sheet' to bring up the properties for the query.  Click-on the 'ODBC Connect Str' property and then select the 'Build (?)' button.

![Figure 3.1.2.9 Microsoft Access Version 2007 property sheet,
build](f03_01_02_09_ptq_02.jpg)*Figure 3.1.2.9 Microsoft Access Version 2007 property sheet,
build*

You will then be prompted with the 'ODBC Administrator' where the user can then select the 'Data Source Name' by which to access their SQL Server database (in this example, it would be the 'MDM6500_OAK' name).

![Figure 3.1.2.10 Microsoft Access Version 2007 select odbc
source](f03_01_02_10_ptq_03.jpg)*Figure 3.1.2.10 Microsoft Access Version 2007 select odbc
source*

When prompted, save the password to as part of the query (note that this is subject to the partner agency network policy).  The user can now put/type their pass-through query in the SQL query window.  Note that this uses the actual/original names of the tables as found within the ORMGP partner database.  Note also the 'ODBC Timeout' property - if the query takes an exceptional time to run, this value can be modified to allow enough time to do so (without Access returning an error).  The example provided access the first 100 records from the D_LOCATION table.

![Figure 3.1.2.11 Microsoft Access Version 2007 query and ODBC
timeout](f03_01_02_11_ptq_04.jpg)*Figure 3.1.2.11 Microsoft Access Version 2007 query and ODBC
timeout*

The table itself is not found within the Access database itself but is, instead, directly accessing (i.e. Access is allowing the command/query to 'pass-through') the SQL Server database.

![Figure 3.1.2.12 Microsoft Access Version 2007 query
results](f03_01_02_12_ptq_05.jpg)*Figure 3.1.2.12 Microsoft Access Version 2007 query
results*

Because of this, the user cannot use the 'Design View' to create the query itself but must build it from direct SQL commands.

For Microsoft Access 2003 (and 2000), the pass-through query options are found in the 'Query - Properties' drop down menu.  The remainder of the steps are equivalent to that found in the later versions of Access.

Support from Microsoft regarding pass-through queries can be found through the
link (active as of 2022-01-27):

[http://support.microsoft.com/kb/303968](http://support.microsoft.com/kb/303968)


