---
title:  "Section 4.5"
author: "ormgpmd"
date:   "20220407"
output: html_document
knit:   (
            function(input_file, encoding) {
                out_dir <- '';
                rmarkdown::render(
                    input_file,
                    encoding=encoding,
                    output_file=file.path(dirname(input_file), out_dir,
                    '04_05_Background_Processing_Updates.html')
                )
            }
        )
---

## Section 4.5 - Background Processing and Updates

A variety of tasks are automatically performed on a weekly basis.  These
concern the population of the W_\* tables for web access, the database backup system and a number of table-field updates.  These are implemented as SQL Server Management tasks (for backup and re-indexing) as well as a series of scripts (in the form of batch files) that are scheduled to run through the Windows Task Scheduler.

#### Microsoft SQL Server Management

Two Maintenance Plans have been implemented withing the SQL Server itself:

* Backup_OAK_20160831_MASTER
    + This backs up the MASTER database on a weekly basis; from this a 'weekly' database is created for general user access
* Reindex_OAK_20160831_MASTER
    + The following tasks are applied against the MASTER database on a weekly basis: Shrink database (leaving 10% free space); Rebuild indexes in all tables; Clean up history; Maintenance cleanup (e.g. remove old .bak files).

The details for these procedures (and the order in which they are called) can be found in Appendix G (Section G.32).

#### Batch Processing (Scripts)

All scripts (as found in the '\bat' directory on the root drive of the SQL server; a copy of these scripts are included in the digital files of the database manual) are implemented as command-line batch files (i.e. .bat files) with any SQL code (as required) found within the same file and called using the Microsoft SQL Server command 'osql' (which allows SQL code to be run from the command-line).

These are called at a specific time either through the built-in Windows Task
Scheduler (i.e. scheduled) or called in specific order (using an overarching
batch file).  Note that most of the batch scripts write the status or result
of their operation(s) to a 'log' file - these can be reviewed if an issue arises during the automated processing/updates.

The details for these procedures and the order in which they are called can be found in Appendix G (Section G.32).


*Last Modified: 2022-04-07*
