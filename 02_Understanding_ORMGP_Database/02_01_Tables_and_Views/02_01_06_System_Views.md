---
title:  "Section 2.1.6"
author: "ormgpmd"
date:   "20220131"
output: html_document
knit:   (
            function(input_file, encoding) {
                out_dir <- '';
                rmarkdown::render(
                    input_file,
                    encoding=encoding,
                    output_file=file.path(dirname(input_file), out_dir,
                    '02_01_06_System_Views.html')
                )
            }
        )
---

## Section 2.1.6 System Views

These views are not meant for the general user.  Instead, many of the views
found in Section 2.1.5 use these as sources for accessing the data (D_\*) and
reference (R_\*) information within the database.  In addition, most of these will not remove the complexities of the table and field information and will rely upon the user having a certain familiarity with the database and the ability to write SQL code to manipulate it.

These include:

* V_SYS_AGENCY_BARRIE
* V_SYS_AGENCY_BARRIE_ALL
* V_SYS_AGENCY_CLOCA
* V_SYS_AGENCY_CLOCA_ALL
* V_SYS_AGENCY_CLOCA_DLS
* V_SYS_AGENCY_CLOCA_NOBUF
* V_SYS_AGENCY_CVC
* V_SYS_AGENCY_CVC_ALL
* V_SYS_AGENCY_CVC_DLS
* V_SYS_AGENCY_CVC_NOBUF
* V_SYS_AGENCY_DURHAM
* V_SYS_AGENCY_DURHAM_ALL
* V_SYS_AGENCY_DURHAM_DLS
* V_SYS_AGENCY_DURHAM_NOBUF
* V_SYS_AGENCY_GRCA
* V_SYS_AGENCY_GRCA_ALL
* V_SYS_AGENCY_GRCA_DLS
* V_SYS_AGENCY_GRCA_NOBUF
* V_SYS_AGENCY_HALTON
* V_SYS_AGENCY_HALTON_ALL
* V_SYS_AGENCY_HALTON_DLS
* V_SYS_AGENCY_HALTON_NOBUF
* V_SYS_AGENCY_KCA
* V_SYS_AGENCY_KCA_ALL
* V_SYS_AGENCY_KCA_DLS
* V_SYS_AGENCY_KCA_NOBUF
* V_SYS_AGENCY_LSRCA
* V_SYS_AGENCY_LSRCA_ALL
* V_SYS_AGENCY_LSRCA_DLS
* V_SYS_AGENCY_LSRCA_NOBUF
* V_SYS_AGENCY_LTRCA
* V_SYS_AGENCY_LTRCA_ALL
* V_SYS_AGENCY_LTRCA_DLS
* V_SYS_AGENCY_LTRCA_NOBUF
* V_SYS_AGENCY_NVCA
* V_SYS_AGENCY_NVCA_ALL
* V_SYS_AGENCY_NVCA_DLS
* V_SYS_AGENCY_NVCA_NOBUF
* V_SYS_AGENCY_ORCA
* V_SYS_AGENCY_ORCA_ALL
* V_SYS_AGENCY_ORCA_DLS
* V_SYS_AGENCY_ORCA_NOBUF
* V_SYS_AGENCY_ORMGP
* V_SYS_AGENCY_ORMGP_ALL
* V_SYS_AGENCY_ORMGP_LARGE
* V_SYS_AGENCY_PEEL
* V_SYS_AGENCY_PEEL_ALL
* V_SYS_AGENCY_PEEL_DLS
* V_SYS_AGENCY_PEEL_NOBUF
* V_SYS_AGENCY_SWP_CTC_DLS
* V_SYS_AGENCY_SWP_CTC_NOBUF
* V_SYS_AGENCY_SWP_LS_DLS
* V_SYS_AGENCY_SWP_LS_NOBUF
* V_SYS_AGENCY_SWP_TRENT_DLS
* V_SYS_AGENCY_SWP_TRENT_NOBUF
* V_SYS_AGENCY_TORONTO
* V_SYS_AGENCY_TORONTO_ALL
* V_SYS_AGENCY_TORONTO_DLS
* V_SYS_AGENCY_TORONTO_NOBUF
* V_SYS_AGENCY_TRCA
* V_SYS_AGENCY_TRCA_ALL
* V_SYS_AGENCY_TRCA_DLS
* V_SYS_AGENCY_TRCA_NOBUF
* V_SYS_AGENCY_YORK
* V_SYS_AGENCY_YORK_ALL
* V_SYS_AGENCY_YORK_DLS
* V_SYS_AGENCY_YORK_NOBUF
* V_SYS_AGENCY_YPDT
* V_SYS_AGENCY_YPDT_ALL
* V_SYS_AREA_CA
* V_SYS_AREA_GEOMETRY_WKB
* V_SYS_AREA_REGION
* V_SYS_AREA_SWP
* V_SYS_BH_BEDROCK_ELEV
* V_SYS_BH_CASING_SUMMARY
* V_SYS_BH_DIAMETER_ALL
* V_SYS_CHK_ALIAS_NAME
* V_SYS_CHK_ALIAS_NAME_MOE_TAG
* V_SYS_CHK_BH_BEDROCK_ASSIGNED
* V_SYS_CHK_BH_BEDROCK_ASSIGNED_ANY
* V_SYS_CHK_BH_BEDROCK_ASSIGNED_GRANITE
* V_SYS_CHK_BH_BEDROCK_ASSIGNED_OTHER
* V_SYS_CHK_BH_BEDROCK_ASSIGNED_SANDSTONE
* V_SYS_CHK_BH_BEDROCK_ASSIGNED_SHALE
* V_SYS_CHK_BH_BEDROCK_ELEV_RANGE
* V_SYS_CHK_BH_CASING_BOTTOM_MAX
* V_SYS_CHK_BH_CONS_BOTTOM_MAX
* V_SYS_CHK_BH_CONS_TOP_MAX
* V_SYS_CHK_BH_DEPTH
* V_SYS_CHK_BH_DEPTH_BASE
* V_SYS_CHK_BH_ELEV
* V_SYS_CHK_BH_ELEV_BASE
* V_SYS_CHK_BH_ELEV_BASE_UPDATE
* V_SYS_CHK_BH_ELEV_BOT_ELEV
* V_SYS_CHK_BH_ELEV_BOT_ELEV_DEPTH_EMPTY
* V_SYS_CHK_BH_ELEV_MISSING
* V_SYS_CHK_CORR_DEPTH_DBC_FBGS
* V_SYS_CHK_CORR_DEPTH_DBORE_FBGS
* V_SYS_CHK_CORR_DEPTH_DGF_FBGS
* V_SYS_CHK_CORR_DEPTH_DGL_FBGS
* V_SYS_CHK_CORR_DEPTH_DIM_FBGS
* V_SYS_CHK_CORR_DEPTH_DIT2_FBGS
* V_SYS_CHK_CORR_DEPTH_DPICK_FBGS
* V_SYS_CHK_CORR_ELEV_CMP
* V_SYS_CHK_CORR_ELEV_CMP_UNQ
* V_SYS_CHK_CORR_ELEV_D2
* V_SYS_CHK_CORR_ELEV_DBC
* V_SYS_CHK_CORR_ELEV_DBORE
* V_SYS_CHK_CORR_ELEV_DGF
* V_SYS_CHK_CORR_ELEV_DGL
* V_SYS_CHK_CORR_ELEV_DIM
* V_SYS_CHK_CORR_ELEV_DIRE
* V_SYS_CHK_CORR_ELEV_DIS
* V_SYS_CHK_CORR_ELEV_DPICK
* V_SYS_CHK_CORR_ELEV_TAG
* V_SYS_CHK_CORR_WLS_BARO
* V_SYS_CHK_DGEOM_ELEV
* V_SYS_CHK_DGL_COUNTS
* V_SYS_CHK_DGL_DEPTHS_MOE
* V_SYS_CHK_DGL_ELEV_OUOM
* V_SYS_CHK_DGL_ELEVS
* V_SYS_CHK_DGL_MAT1_DCR
* V_SYS_CHK_DGL_MAT1_NULL_DCR
* V_SYS_CHK_DGL_MULT_UNIT_OUOM
* V_SYS_CHK_DGL_SINGLE_LIME
* V_SYS_CHK_DGL_SINGLE_UNKN
* V_SYS_CHK_DGL_SINGLE_UNKN_SFC
* V_SYS_CHK_DGL_SINGLE_UNKN_SFC_NOPUMP
* V_SYS_CHK_DGL_SINGLE_UNKN_SFC_NOPUMP_ABD
* V_SYS_CHK_DGL_UNITS
* V_SYS_CHK_DGL_UNITS_UPDATE
* V_SYS_CHK_DIFA_CM2004_ADD
* V_SYS_CHK_DIFA_CM2004_REMOVE
* V_SYS_CHK_DIFA_DM2007_ADD
* V_SYS_CHK_DIFA_DM2007_REMOVE
* V_SYS_CHK_DIFA_ECM2006_ADD
* V_SYS_CHK_DIFA_ECM2006_REMOVE
* V_SYS_CHK_DIFA_EM2010_ADD
* V_SYS_CHK_DIFA_EM2010_REMOVE
* V_SYS_CHK_DIFA_GL_CHANSAND_CM2004_THICK
* V_SYS_CHK_DIFA_GL_CHANSAND_YT32011_THICK
* V_SYS_CHK_DIFA_GL_OAKRIDGES_CM2004_THICK
* V_SYS_CHK_DIFA_GL_OAKRIDGES_WB2018_THICK
* V_SYS_CHK_DIFA_GL_OAKRIDGES_YT32011_THICK
* V_SYS_CHK_DIFA_GL_SCARBOROUGH_CM2004_THICK
* V_SYS_CHK_DIFA_GL_SCARBOROUGH_WB2018_THICK
* V_SYS_CHK_DIFA_GL_SCARBOROUGH_YT32011_THICK
* V_SYS_CHK_DIFA_GL_THORNCLIFFE_CM2004_THICK
* V_SYS_CHK_DIFA_GL_THORNCLIFFE_WB2018_THICK
* V_SYS_CHK_DIFA_GL_THORNCLIFFE_YT32011_THICK
* V_SYS_CHK_DIFA_RM2004_ADD
* V_SYS_CHK_DIFA_RM2004_REMOVE
* V_SYS_CHK_DIFA_WB2018_ADD
* V_SYS_CHK_DIFA_WB2018_REMOVE
* V_SYS_CHK_DIFA_YT32011_ADD
* V_SYS_CHK_DIFA_YT32011_REMOVE
* V_SYS_CHK_DIRE
* V_SYS_CHK_DLCH_ALL_ELEV_ID
* V_SYS_CHK_DLCH_BH_ELEV_ID
* V_SYS_CHK_DLSH_ELEV_UPD
* V_SYS_CHK_DOC_AUTHOR_AGENCY
* V_SYS_CHK_DOC_YN_FIELDS
* V_SYS_CHK_DUP_DGEOLLAY
* V_SYS_CHK_DUP_DGEOLLAY_DEL
* V_SYS_CHK_DUP_DINT
* V_SYS_CHK_DUP_DINT_ALT1
* V_SYS_CHK_DUP_DINT_ALT1_DEL
* V_SYS_CHK_DUP_DINT_DEL
* V_SYS_CHK_DUP_DINT_DEL_MAX
* V_SYS_CHK_DUP_DINTMON
* V_SYS_CHK_DUP_DINTMON_DEL
* V_SYS_CHK_DUP_DINTSOIL
* V_SYS_CHK_DUP_DINTSOIL_DEL
* V_SYS_CHK_DUP_DINTSOIL_DEL_MAX
* V_SYS_CHK_DUP_DIRE
* V_SYS_CHK_DUP_DIRE_DEL
* V_SYS_CHK_DUP_DIT1AB
* V_SYS_CHK_DUP_DIT1B_DEL
* V_SYS_CHK_ELEV_DBORE
* V_SYS_CHK_ELEV_DBORE_UPD
* V_SYS_CHK_ELEV_DPICK
* V_SYS_CHK_GEOL_LAY_BOT_ELEV_DEPTH
* V_SYS_CHK_GEOL_LAY_ELEV
* V_SYS_CHK_INT_ELEVS_DEPTHS
* V_SYS_CHK_INT_ELEVS_DEPTHS_BH_MON_BOT_DIFF
* V_SYS_CHK_INT_ELEVS_DEPTHS_BH_VS_MAX
* V_SYS_CHK_INT_ELEVS_DEPTHS_BH_VS_MON_BOT
* V_SYS_CHK_INT_ELEVS_DEPTHS_BH_VS_WL
* V_SYS_CHK_INT_ELEVS_DEPTHS_MON_BOT_LT_0
* V_SYS_CHK_INT_ELEVS_DEPTHS_MON_BOT_TOP
* V_SYS_CHK_INT_ELEVS_DEPTHS_MON_M_LT_0
* V_SYS_CHK_INT_MON_DEPTHS_M
* V_SYS_CHK_INT_MON_ELEV_DEPTH
* V_SYS_CHK_INT_REF_ELEV
* V_SYS_CHK_INT_REF_ELEV2
* V_SYS_CHK_INT_REF_ELEV2_DIT2
* V_SYS_CHK_INT_REF_ELEV2_DIT2_DEPTHS
* V_SYS_CHK_INT_REF_ELEV2_ERR
* V_SYS_CHK_INT_REF_ELEV_CURRENT
* V_SYS_CHK_INT_REF_ELEV_DIT2
* V_SYS_CHK_INT_REF_ELEV_DIT2_DEPTHS
* V_SYS_CHK_INT_REF_OFFSET
* V_SYS_CHK_INT_SOIL_DEPTHS_M
* V_SYS_CHK_INT_SUM_ADD
* V_SYS_CHK_INT_SUM_REMOVE
* V_SYS_CHK_INT_TMP1_DUPLICATES
* V_SYS_CHK_INT_TMP1_DUPLICATES_DEL_SRI
* V_SYS_CHK_INT_TMP1_DUPLICATES_NUM
* V_SYS_CHK_INT_TMP1_DUPLICATES_NUM_DEL
* V_SYS_CHK_INT_TMP1_UNITS
* V_SYS_CHK_INT_TMP1A_SAID
* V_SYS_CHK_INT_TMP1A_SAMID
* V_SYS_CHK_INT_TMP1B_MOVE
* V_SYS_CHK_INT_TMP1B_SAMID
* V_SYS_CHK_INT_TMP2_DUPLICATES
* V_SYS_CHK_INT_TMP2_DUPLICATES_DEL_SRI
* V_SYS_CHK_INT_TMP2_DUPLICATES_NUM
* V_SYS_CHK_INT_TMP2_DUPLICATES_NUM_DEL
* V_SYS_CHK_INT_TMP2_SOIL
* V_SYS_CHK_INT_TMP5_DUPLICATES
* V_SYS_CHK_INT_TMP5_DUPLICATES_DEL_SRI
* V_SYS_CHK_LOC_ADDRESS
* V_SYS_CHK_LOC_COORDS
* V_SYS_CHK_LOC_COORDS_CHECK
* V_SYS_CHK_LOC_COORDS_CHECK_UPDATE
* V_SYS_CHK_LOC_COORDS_CURR
* V_SYS_CHK_LOC_ELEV
* V_SYS_CHK_LOC_ELEV_ASSIGNED_ALL
* V_SYS_CHK_LOC_ELEV_BH_ELEV
* V_SYS_CHK_LOC_ELEV_BH_ELEV_MOD
* V_SYS_CHK_LOC_ELEV_MISSING
* V_SYS_CHK_LOC_ELEV_MISSING_DEM_GEOM
* V_SYS_CHK_LOC_ELEV_MISSING_GEOM
* V_SYS_CHK_LOC_ELEV_MISSING_LIST
* V_SYS_CHK_LOC_ELEV_MISSING_LIST_QA
* V_SYS_CHK_LOC_ELEV_SURV_NULL
* V_SYS_CHK_LOC_GEOM_ADD
* V_SYS_CHK_LOC_GEOM_CHANGE
* V_SYS_CHK_LOC_GEOM_COORD_CHECK
* V_SYS_CHK_LOC_GEOM_COORD_CHECK_REVIEW
* V_SYS_CHK_LOC_GEOM_REMOVE
* V_SYS_CHK_LOC_GEOM_WKB_UPDATE
* V_SYS_CHK_LOC_SUM_ADD
* V_SYS_CHK_LOC_SUM_REMOVE
* V_SYS_CHK_MOE_WELL_ID_ATAG
* V_SYS_CHK_MOE_WELL_ID_DUP
* V_SYS_CHK_MOE_WELL_ID_DUP_UPD
* V_SYS_CHK_MOE_WELL_ID_DUP_UPD2
* V_SYS_CHK_MOE_WELL_ID_DUP_UPD3
* V_SYS_CHK_MOE_WELL_ID_DUP_UPD4
* V_SYS_CHK_MOE_WELL_ID_DUP_UPD5
* V_SYS_CHK_MOE_WELL_ID_DUP_UPD6
* V_SYS_CHK_MOE_WELL_ID_DUP_UPD7
* V_SYS_CHK_MOE_WELL_ID_LON
* V_SYS_CHK_MON_BOT_GT_BOT_ELEV
* V_SYS_CHK_PARAM_UNITS_DIT1B
* V_SYS_CHK_PARAM_UNITS_DIT1B_MGL
* V_SYS_CHK_PARAM_UNITS_DIT1B_UGL
* V_SYS_CHK_PICK_ABOVE_GND_BELOW_BOT
* V_SYS_CHK_PICK_ELEV
* V_SYS_CHK_PICK_ELEV_CMP
* V_SYS_CHK_PICK_ELEV_CMP_BEDROCK
* V_SYS_CHK_PICK_ELEV_CMP_CHANAQUIFER
* V_SYS_CHK_PICK_ELEV_CMP_CHANAQUITARD
* V_SYS_CHK_PICK_ELEV_CMP_HALTON
* V_SYS_CHK_PICK_ELEV_CMP_LATESTAG
* V_SYS_CHK_PICK_ELEV_CMP_MISORAC
* V_SYS_CHK_PICK_ELEV_CMP_NEWMARKINT
* V_SYS_CHK_PICK_ELEV_CMP_NEWMARKLOW
* V_SYS_CHK_PICK_ELEV_CMP_NEWMARKUPP
* V_SYS_CHK_PICK_ELEV_CMP_SCARBOROUGH
* V_SYS_CHK_PICK_ELEV_CMP_SUNNYBROOK
* V_SYS_CHK_PICK_ELEV_CMP_THORNCLIFFE
* V_SYS_CHK_PICK_ORIG_GND_ELEV
* V_SYS_CHK_PICK_ORIG_GND_ELEV_DIFF
* V_SYS_CHK_SCREEN_ASSUMED
* V_SYS_CHK_SEARCH
* V_SYS_CHK_SEARCH_XYR
* V_SYS_CHK_SPEC_CAP_CALC
* V_SYS_CHK_WL_LOGGER
* V_SYS_CHK_WL_MIN_GT_BOT_ELEV
* V_SYS_CHK_WL_OUOM_CORR
* V_SYS_CHK_WL_RUO_REF_ELEV
* V_SYS_CHK_WL_STATIC
* V_SYS_CHK_WL_STATIC_CMP
* V_SYS_CHK_WLS_GEOL_UNIT_RD_UNIT
* V_SYS_CLIMATE_MARK_ACTIVE
* V_SYS_CONST_ELEV_RANGE
* V_SYS_DATETIME_STR
* V_SYS_DBLIST_FIELDS
* V_SYS_DBLIST_FIELDS_INFO
* V_SYS_DBLIST_FIELDS_MISSING
* V_SYS_DBLIST_TABLES
* V_SYS_DBLIST_TABLES_MISSING
* V_SYS_DBLIST_TABLES_REMOVED
* V_SYS_DBLIST_VIEWS
* V_SYS_DBLIST_VIEWS_MISSING
* V_SYS_DBLIST_VIEWS_REMOVED
* V_SYS_DGF_TOP_FEATURE
* V_SYS_DGL_TOTAL_GEOL_MAT1
* V_SYS_DGL_TOTAL_GEOL_MAT1_MAX
* V_SYS_DGL_TOTAL_GRAVEL
* V_SYS_DGL_TOTAL_SAND_GRAVEL
* V_SYS_DIFA_ASSIGNED_FINAL
* V_SYS_DIFA_GL
* V_SYS_DIFA_GL_ASSIGN
* V_SYS_DIFA_GL_CHANSAND
* V_SYS_DIFA_GL_CHANSAND_CM2004
* V_SYS_DIFA_GL_CHANSAND_YT32011
* V_SYS_DIFA_GL_MOD_CM2004
* V_SYS_DIFA_GL_MOD_WB2018
* V_SYS_DIFA_GL_MOD_YT32011
* V_SYS_DIFA_GL_OAKRIDGES
* V_SYS_DIFA_GL_OAKRIDGES_CM2004
* V_SYS_DIFA_GL_OAKRIDGES_WB2018
* V_SYS_DIFA_GL_OAKRIDGES_YT32011
* V_SYS_DIFA_GL_SCARBOROUGH
* V_SYS_DIFA_GL_SCARBOROUGH_CM2004
* V_SYS_DIFA_GL_SCARBOROUGH_WB2018
* V_SYS_DIFA_GL_SCARBOROUGH_YT32011
* V_SYS_DIFA_GL_THORNCLIFFE
* V_SYS_DIFA_GL_THORNCLIFFE_CM2004
* V_SYS_DIFA_GL_THORNCLIFFE_WB2018
* V_SYS_DIFA_GL_THORNCLIFFE_YT32011
* V_SYS_DIFAF_ASSIGN
* V_SYS_DIT1_INT_PAR_DAY
* V_SYS_DIT_COUNTS
* V_SYS_DOC_BH_NONMOE_LOCNS
* V_SYS_DOC_REPLIB_ENTRY
* V_SYS_ELEV_ASSIGNED
* V_SYS_ELEV_ASSIGNED_ALL
* V_SYS_ELEV_ASSIGNED_UPDATE
* V_SYS_ELEV_DEM_MNR_V2
* V_SYS_ELEV_DEM_SRTM_V41
* V_SYS_ELEV_ORIGINAL
* V_SYS_ELEV_SURVEYED
* V_SYS_ELEV_SURVEYED_DURHAM
* V_SYS_EXAMPLE_SHEET_A_LOCATION
* V_SYS_EXAMPLE_SHEET_B_BOREHOLE
* V_SYS_EXAMPLE_SHEET_C_GEOLOGY
* V_SYS_EXAMPLE_SHEET_D_SCREEN
* V_SYS_EXAMPLE_SHEET_D_SCREEN_AND_SOIL
* V_SYS_EXAMPLE_SHEET_D_SOIL
* V_SYS_EXAMPLE_SHEET_E_LAB_DATA
* V_SYS_EXAMPLE_SHEET_F_FIELD_DATA
* V_SYS_FIELD_WATERLEVELS_DAILY
* V_SYS_FIELD_WATERLEVELS_YEARLY
* V_SYS_GEN_BH_INT_MUNIC_WELL
* V_SYS_GEN_BH_INT_MUNIC_WELL_CHANNEL
* V_SYS_GEN_BH_INT_MUNIC_WELL_DEEP
* V_SYS_GEN_BH_INT_MUNIC_WELL_SHALLOW
* V_SYS_GEN_LAB_SAMPLES_ISOTOPES
* V_SYS_GEN_LAB_STANDARD
* V_SYS_GEN_LOC_INFO
* V_SYS_GEN_WL_AVERAGE
* V_SYS_GEN_WL_AVERAGE_DEEP
* V_SYS_GEN_WL_AVERAGE_DEEP_BR
* V_SYS_GEN_WL_AVERAGE_DEEP_NBR
* V_SYS_GEN_WL_AVERAGE_MID
* V_SYS_GEN_WL_AVERAGE_SHALLOW
* V_SYS_GEN_WL_AVERAGE_SHALLOW_MOD
* V_SYS_GEN_WL_AVERAGE_UNIT_SCAR
* V_SYS_GEN_WL_AVERAGE_UNIT_SHAL
* V_SYS_GEN_WL_AVERAGE_UNIT_THORN
* V_SYS_GENERAL
* V_SYS_GENERAL_INTERVAL
* V_SYS_GENERAL_INTERVAL_MON
* V_SYS_GEOL_LAY_ELEVS
* V_SYS_GEOL_LAY_ELEVS_BH
* V_SYS_GEOL_LAY_TOP_BOT_M
* V_SYS_GEOL_LAY_UNIT_OUOM
* V_SYS_GEOL_LAYER_COUNT
* V_SYS_GEOL_LOCATION
* V_SYS_GEOL_UNIT_CHANNEL
* V_SYS_GEOL_UNIT_DEEP
* V_SYS_GEOL_UNIT_LNT
* V_SYS_GEOL_UNIT_SHALLOW
* V_SYS_GEOM_BOREHOLE
* V_SYS_GW_KNOWLEDGE
* V_SYS_INT_MON_COORDS
* V_SYS_INT_MON_COORDS_FLOWING
* V_SYS_INT_MON_DEPTHS_M
* V_SYS_INT_MON_ELEVS
* V_SYS_INT_MON_GEOL
* V_SYS_INT_MON_MAX_MIN
* V_SYS_INT_REF_ELEV_COUNT
* V_SYS_INT_REF_ELEV_CURRENT
* V_SYS_INT_REF_ELEV_RANGE
* V_SYS_INT_SOIL_COORDS
* V_SYS_INT_TYPE_CODE_DIFA
* V_SYS_INT_TYPE_CODE_SCREEN
* V_SYS_INT_WLS_MIN_LIST
* V_SYS_INTERVAL_ELEV
* V_SYS_LAB_CB_BASE
* V_SYS_LAB_CB_BASE_SAID
* V_SYS_LAB_CB_PERC
* V_SYS_LAB_CB_PERC_FINAL
* V_SYS_LAB_PARAM_COUNT
* V_SYS_LAB_PARAM_MGL_COUNT
* V_SYS_LAB_PARAM_WQ_AO
* V_SYS_LAB_PARAM_WQ_AO_SUM
* V_SYS_LAB_PARAM_WQ_MAC
* V_SYS_LAB_PARAM_WQ_MAC_SUM
* V_SYS_LAB_SAMPLES_ISOTOPES
* V_SYS_LAB_WATER_TYPE_MHM
* V_SYS_LAB_WATER_TYPE_MHM_AVG
* V_SYS_LOC_COORD_HIST_ADD
* V_SYS_LOC_COORDS
* V_SYS_LOC_DATA_SOURCE
* V_SYS_LOC_GEOMETRY
* V_SYS_LOC_GEOMETRY_WKB
* V_SYS_LOC_MET
* V_SYS_LOC_MODEL_CM2004
* V_SYS_LOC_MODEL_CM2004BUF
* V_SYS_LOC_MODEL_DM2007
* V_SYS_LOC_MODEL_DM2007BUF
* V_SYS_LOC_MODEL_ECM2006
* V_SYS_LOC_MODEL_ECM2006BUF
* V_SYS_LOC_MODEL_EM2010
* V_SYS_LOC_MODEL_EM2010BUF
* V_SYS_LOC_MODEL_RM2004
* V_SYS_LOC_MODEL_RM2004BUF
* V_SYS_LOC_MODEL_WB2018
* V_SYS_LOC_MODEL_YT32011
* V_SYS_LOC_MON_MAX_MIN
* V_SYS_LOC_SPAT_ADD
* V_SYS_LOC_SPAT_ALL
* V_SYS_LOC_SPAT_CURRENT
* V_SYS_LOC_SPAT_HIST_ADD
* V_SYS_LOC_SW
* V_SYS_LOC_TYPE_FIND_ELEV
* V_SYS_LOC_UPD_CHANGES
* V_SYS_LOC_UPD_CHANGES_XY
* V_SYS_LOC_UPD_COORDS_XY
* V_SYS_LOC_UPD_DIT
* V_SYS_LOC_UPD_DIT_XY
* V_SYS_LOC_UPD_NEW
* V_SYS_LOC_UPD_NEW_XY
* V_SYS_MJF_DEEPEST_NON-ROCK_UNIT
* V_SYS_MJF_DEEPEST_NON-ROCK_UNIT_WITHOUT_BR_PICKS
* V_SYS_MJF_GEO_LOC_NO-BR-PICK
* V_SYS_MJF_GEO_LOC_RESTRICTED
* V_SYS_MJF_GEO_PICKS_BEDROCK_TOP
* V_SYS_MJF_GEOL_ROCK_LAYER_COUNT
* V_SYS_MJF_LOC_QA>5
* V_SYS_MJF_PRECAMBRIAN_TOP
* V_SYS_MOE_ALL
* V_SYS_MOE_BORE_HOLE_ID
* V_SYS_MOE_CLUSTER_ALL
* V_SYS_MOE_CLUSTER_MASTER
* V_SYS_MOE_DATA_ID
* V_SYS_MOE_DATA_ID_COUNT
* V_SYS_MOE_LOCATIONS
* V_SYS_MOE_LOCATIONS_FIRST
* V_SYS_MOE_WELL
* V_SYS_MOE_WELL_ID
* V_SYS_MOE_WELL_ID_DLA
* V_SYS_MOE_WELL_ID_DLA_DUP
* V_SYS_MOE_WELL_ID_DLA_FIRST
* V_SYS_NAME
* V_SYS_NAME_ALL
* V_SYS_NAME_INTERVAL
* V_SYS_NAME_LOCATION
* V_SYS_NAME_MAIN
* V_SYS_NAME_STUDY_AREA
* V_SYS_NAME_STUDY_AREA_ALL
* V_SYS_ORMGP_DATA_SOURCE
* V_SYS_ORMGP_MANUALS_DATA_SOURCE
* V_SYS_ORMGP_MON_INTERVAL
* V_SYS_ORMGP_MON_INTERVAL_NEW
* V_SYS_ORMGP_MON_LOCATION
* V_SYS_ORMGP_MON_LOCATION_NEW
* V_SYS_PICK_ALL
* V_SYS_PICK_BEDROCK_TOP
* V_SYS_PICK_CHANNEL_AQUIFER_TOP
* V_SYS_PICK_CHANNEL_AQUITARD_TOP
* V_SYS_PICK_HALTON_TOP
* V_SYS_PICK_LATE_STAGE_TOP
* V_SYS_PICK_MIS_TOP
* V_SYS_PICK_NEWMARKET_INTER_TOP
* V_SYS_PICK_NEWMARKET_LOWER_TOP
* V_SYS_PICK_NEWMARKET_UPPER_TOP
* V_SYS_PICK_NORTHERN_NEWMARKET_TOP
* V_SYS_PICK_ORAC_BOTTOM
* V_SYS_PICK_ORAC_TOP
* V_SYS_PICK_SCARBOROUGH_TOP
* V_SYS_PICK_SUNNYBROOK_TOP
* V_SYS_PICK_THORNCLIFFE_TOP
* V_SYS_PICK_TOTAL_NUM
* V_SYS_PICK_UNCONFORMITY_TOP
* V_SYS_PICK_YORK_TOP
* V_SYS_PTTW_EXPIRY_DATE_MAX
* V_SYS_PTTW_FIND_PRESENT
* V_SYS_PTTW_FIND_RELATED_ALL
* V_SYS_PTTW_FIND_RELATED_NEW
* V_SYS_PTTW_MARK_ACTIVE
* V_SYS_PTTW_RELATED_ALL
* V_SYS_PTTW_RELATED_PRIMARY
* V_SYS_PTTW_SOURCE
* V_SYS_PTTW_SOURCE_PERMIT_NUMS
* V_SYS_PTTW_SOURCE_VOLUME
* V_SYS_PTTW_VOLUME
* V_SYS_PUMP_LATEST
* V_SYS_PUMP_MOE_DRAWDOWN
* V_SYS_PUMP_MOE_TEST
* V_SYS_PUMP_MOE_TEST_DATES
* V_SYS_PUMP_MOE_TEST_PWLS
* V_SYS_PUMP_MOE_TEST_STWL
* V_SYS_PUMP_MOE_TRANS
* V_SYS_PUMP_MOE_TRANS_BR1985
* V_SYS_PUMP_MOE_TRANS_CMP
* V_SYS_PUMP_MOE_TRANS_SOURCE
* V_SYS_PUMP_MOE_TRANS_SOURCE2
* V_SYS_PUMP_MOE_TRANS_SOURCE2_BR1985
* V_SYS_PUMP_MOE_TRANS_SOURCE_BR1985
* V_SYS_PUMP_OFF_WATERLEVEL
* V_SYS_PUMP_ON_WATERLEVEL
* V_SYS_PUMP_TEST_RATE
* V_SYS_PUMP_VOLUME_MONTHLY
* V_SYS_PUMP_VOLUME_YEARLY
* V_SYS_RANDOM_ID_001
* V_SYS_RANDOM_ID_002
* V_SYS_RANDOM_ID_003
* V_SYS_RANDOM_ID_004
* V_SYS_RANDOM_ID_005
* V_SYS_RANDOM_ID_BULK_001
* V_SYS_RANDOM_ID_BULK_002
* V_SYS_RANDOM_ID_CLOCA
* V_SYS_RANDOM_ID_CVC
* V_SYS_RANDOM_ID_DURHAM
* V_SYS_RANDOM_ID_GRCA
* V_SYS_RANDOM_ID_KCA
* V_SYS_RANDOM_ID_LSRCA
* V_SYS_RANDOM_ID_LTRCA
* V_SYS_RANDOM_ID_NVCA
* V_SYS_RANDOM_ID_ORCA
* V_SYS_RANDOM_ID_PEEL
* V_SYS_RANDOM_ID_TORONTO
* V_SYS_RANDOM_ID_TRCA
* V_SYS_RANDOM_ID_YORK
* V_SYS_RD_NAME_DESCRIPTION_ALL
* V_SYS_RD_NAME_DESCRIPTION_ALL_LC
* V_SYS_S_USER_ID_RANGES
* V_SYS_SFLOW_YEARLY
* V_SYS_SHYDROLOGY
* V_SYS_SPEC_CAP_MOE_CALC
* V_SYS_STAT_WLS_LOGGER
* V_SYS_STAT_WLS_LOGGER_MED
* V_SYS_STAT_WLS_LOGGER_MODE
* V_SYS_STAT_WLS_LOGGER_MODE_RANGE
* V_SYS_STAT_WLS_LOGGER_MODEC
* V_SYS_STAT_WLS_MANUAL
* V_SYS_STAT_WLS_MANUAL_MED
* V_SYS_STAT_WLS_MANUAL_MODE
* V_SYS_STAT_WLS_MANUAL_MODE_RANGE
* V_SYS_STAT_WLS_MANUAL_MODEC
* V_SYS_STATCOUNT_BOREHOLE
* V_SYS_STATCOUNT_BOREHOLE_MOE
* V_SYS_STATCOUNT_CHEM_ANALYSIS_PARA
* V_SYS_STATCOUNT_CLIMATE_MEASURE
* V_SYS_STATCOUNT_CLIMATE_STN
* V_SYS_STATCOUNT_DOCUMENT
* V_SYS_STATCOUNT_GEOLOGY_LAYER
* V_SYS_STATCOUNT_OUTCROP
* V_SYS_STATCOUNT_PUMP_RATE_MUNIC
* V_SYS_STATCOUNT_SFC_WATER_MEASURE
* V_SYS_STATCOUNT_SFC_WATER_STN
* V_SYS_STATCOUNT_WATER_LEVEL
* V_SYS_STATUS_INT_TYPE_CODE
* V_SYS_STATUS_LOC_TYPE_CODE
* V_SYS_STATUS_READING_GROUP_CODE
* V_SYS_SUM_INT_TYPE_COUNTS
* V_SYS_SUM_LOC_TYPE_COUNTS
* V_SYS_SUM_READING_GROUP_COUNTS
* V_SYS_SUMMARY_DEEPEST_SCREEN_TOP
* V_SYS_SUMMARY_GEOL_LAYER_NUM
* V_SYS_SUMMARY_MON_FLOWING
* V_SYS_SUMMARY_MON_NUM
* V_SYS_SUMMARY_PRECIP
* V_SYS_SUMMARY_PUMP
* V_SYS_SUMMARY_PUMP_DAILY_VOL
* V_SYS_SUMMARY_PUMP_RATE
* V_SYS_SUMMARY_SFLOW
* V_SYS_SUMMARY_SOIL
* V_SYS_SUMMARY_SOIL_GEOTECH
* V_SYS_SUMMARY_SPEC_CAP
* V_SYS_SUMMARY_TEMP_AIR
* V_SYS_SUMMARY_WL
* V_SYS_SUMMARY_WL_ALL
* V_SYS_SUMMARY_WL_AVG
* V_SYS_SUMMARY_WL_LOGGER
* V_SYS_SUMMARY_WL_MANUAL
* V_SYS_SUMMARY_WQ
* V_SYS_SUMMARY_WQ_SAMPLES
* V_SYS_SW_AGGREGATE
* V_SYS_SW_GAUGE_MARK_ACTIVE
* V_SYS_SW_LOCATION_FWIS
* V_SYS_SW_SPOTFLOW_MARK_ACTIVE
* V_SYS_UGAIS_ALL
* V_SYS_UGAIS_LOCATION
* V_SYS_UGAIS_SCREEN
* V_SYS_UGAIS_SOIL
* V_SYS_VERSION_CURRENT
* V_SYS_W_GENERAL
* V_SYS_W_GENERAL_DOCUMENT
* V_SYS_W_GENERAL_GW_LEVEL_LOG
* V_SYS_W_GENERAL_GW_LEVEL_MAN
* V_SYS_W_GENERAL_LOC_MET
* V_SYS_W_GENERAL_LOC_SW
* V_SYS_W_GENERAL_OTHER
* V_SYS_W_GENERAL_OTHER_AGG
* V_SYS_W_GENERAL_OTHER_PTTW_ACTIVE
* V_SYS_W_GENERAL_PICK
* V_SYS_W_GENERAL_SCREEN
* V_SYS_W_GENERAL_SCREEN_NEST
* V_SYS_W_GEOLOGY_LAYER
* V_SYS_WATERLEVELS_BARO_DAILY
* V_SYS_WATERLEVELS_BARO_OUOM_YEARLY
* V_SYS_WATERLEVELS_BARO_YEARLY
* V_SYS_WATERLEVELS_MANUAL_FIRST
* V_SYS_WATERLEVELS_RANGE
* V_SYS_WATERLEVELS_YEARLY_AVG
* V_SYS_WATERLEVELS_YEARLY_BOTH
* V_SYS_WATERLEVELS_YEARLY_LOGGER
* V_SYS_WATERLEVELS_YEARLY_MANUAL

#### V_SYS_AGENCY_\*

Each partner agency and region (as well as the ORMGP study area and the 'Source Water Protection' - SWP - areas) have three views associated with them:

* V_SYS_AGENCY_\<partner agency\>
    + This view extracts all locations (i.e. the LOC_ID) that lie within the areal extent of the agency (plus a defined buffer); these locations must have valid coordinates (as defined by QA_COORD_CONFIDENCE_CODE) and are present in D_LOCATION_GEOM.   The ORMGP 'Viewlog Header Well' is included by default in this list.

* V_SYS_AGENCY_\<partner agency\>_ALL
    + This view includes all locations from V_SYS_AGENCY_<name> and adds all locations from D_DOCUMENT regardless of valid coordinates.

* V_SYS_AGENCY_\<partner agency\>_NOBUF
    + This view is similar to V_SYS_AGENCY_<name> but no buffer is added to the areal extent.

All of these views use the built-in spatial support of Microsoft SQL Server
when checking the geometric location against the geometric area (refer to
D_AREA_GEOM and D_LOCATION_GEOM).  Note that the 'SWP_\*' areas only have a single view while the ORMGP area have two.

The names of the areal extents used for each partner agency are listed as follows (the AREA_ID, from D_AREA_GEOM, is enclosed in quotes).

* CLOCA
    + CLOCA Boundary 5km Buffer ('2')
    + CLOCA Boundary ('30')
* CVC
    + CVC Boundary 5km Buffer ('3')
    + CVC Boundary ('32')
* DURHAM
    + Durham Boundary 5km Buffer ('13')
    + Durham Boundary ('40')
* GRCA
    + GRCA Boundary 5km Buffer ('4')
    + GRCA Boundary ('33')
* HALTON
    + Halton Boundary ('66')
    + Halton Boundary 5km Buffer ('67')
* HALTON_CA
    + Halton CA Boundary ('74')
    + Halton CA Boundary 5km Buffer ('75')
* KCA
    + KCA Boundary 5km Buffer ('5')
    + KCA Boundary ('34')
* LSRCA
    + LSRCA Boundary 5km Buffer ('6')
    + LSRCA Boundary ('35')
* LTRCA
    + LTRCA Boundary 5km Buffer ('7')
    + LTRCA Boundary ('36')
* NVCA
    + NVCA Boundary 5km Buffer ('8')
    + NVCA Boundary ('37')
* ORCA
    + ORCA Boundary 5km Buffer ('9')
    + ORCA Boundary ('38')
* ORMGP
    + ORMGP Boundary 20210205 (73)
    + ORMGP Boundary 20210205 25km Buffer (70)
    + ORMGP Boundary 20210205 5km Buffer (76)
* PEEL
    + Peel Boundary 5km Buffer ('14')
    + Peel Boundary ('41')
* SWP_CTC
    + SWP-CTC Boundary ('44')
* SWP_LS
    + SWP-Lake Simcoe Boundary ('60')
* SWP_TRENT
    + SWP-Trent Boundary ('51')
* TORONTO
    + Toronto Boundary 5km Buffer ('15')
    + Toronto Boundary ('42')
* TRCA
    + TRCA Boundary 20km Buffer ('61')
    + TRCA Boundary ('39')
* YORK
    + York Boundary 5km Buffer ('16')
    + York Boundary ('43')
* YPDT
    + YPDT-CAMC SWP Area - 20km Buffer ('62')

#### V_SYS_AREA_CA

This view returns the LOC_ID and AREA_ID for each location (as found in D_LOCATION_GEOM) when compared (using intersection) against the area polygons in D_AREA_GEOM.  This is only for the conservation authority partner agencies.  Note that this can be a slow process.

#### V_SYS_AREA_GEOMETRY_WKB

This view converts the AREA_GEOM in D_AREA_GEOM from a geometry type to a binary type.  The latter will be in 'Well Known Binary' (WKB) format -  this is supported by a number of external software packages.

#### V_SYS_AREA_REGION

This view returns the LOC_ID and AREA_ID for each location (as found in D_LOCATION_GEOM) when compared (using intersection) against the area polygons in D_AREA_GEOM.  This is only for the region partner agencies.  Note that this can be a slow process.

#### V_SYS_AREA_SWP

This view returns the LOC_ID and AREA_ID for each location (as found in D_LOCATION_GEOM) when compared (using intersection) against the area polygons in D_AREA_GEOM.  This is only for the 'Source Water Protection' (SWP) areas.  Note that this can be a slow process.

#### V_SYS_BH_BEDROCK_ELEV

This view returns the current bedrock elevation (if present) from D_BOREHOLE as well as calculating a new bedrock elevation from the geologic descriptions in D_GEOLOGY_LAYER.  Note that any material type assigned a '1' value for GEOL_MAT1_ROCK is considered bedrock for the purposes of this calculation.  In addition, a second value is calculated for the new bedrock elevation - this is limited to two decimal places (and is the value used for populated BH_BEDROCK_ELEV in D_BOREHOLE).

#### V_SYS_BH_CASING_SUMMARY

This view determines the minimum and maximum casing elevations and diameters (as well as the number of records) for each location in D_BOREHOLE.  Any diameters are also shown in inches.  This is limited to a CON_TYPE_CODE of '3' (i.e. 'Casing') in D_BOREHOLE_CONSTRUCTION.

#### V_SYS_CHK_ALIAS_NAME

This view checks for duplicate LOC_NAME_ALIAS text across multiple LOC_ID's (these cannot occur for the same LOC_ID - a built-in constraint prevents this).  This can be used to determine where multiple LOC_ID's actually refer to the same borehole/well (in particular, this can be easily applied against multiple MOE WWDB imports).  However, multiple aliases can occur for MOE nested wells; it could also occur by happenstance so an immediate problem should not be assumed.

#### V_SYS_CHK_ALIAS_NAME_MOE_TAG

This view uses V_SYS_CHK_ALIAS_NAME as a source, only extracting those rows that have a LOC_ALIAS_TYPE_CODE of '1' (i.e. 'MOE Tag Number').

#### V_SYS_CHK_BH_BEDROCK_ASSIGNED

This view uses each of V_SYS_BH_BEDROCK_ELEV, V_SYS_SUMMARY_GEOL_LAYER_NUM and D_GEOLOGY_LAYER as sources.  It returns the calculated bedrock elevation (where GEOL_MAT1_ROCK is '1' from R_GEOL_MAT1_CODE), the elevation of the next layer below this, the total number of geologic layers and the number of geologic layers below the calculated bedrock elevation (ERR_GEOL_LAYER_NUM) for a particular location.  Note that the subsequent layers cannot have a GEOL_MAT1_ROCK of '1' nor have a GEOL_MAT1_CODE of '0' (i.e. 'Unknown') or '105' (i.e. 'Refusal') and are not included if so.

#### V_SYS_CHK_BH_BEDROCK_ASSIGNED_ANY

This view, using V_SYS_CHK_BH_BEDROCK_ASSIGNED (above) as a base, returns information on the geologic layers below the calculated bedrock elevation.

#### V_SYS_CHK_BH_BEDROCK_ASSIGNED_GRANITE

This view, using V_SYS_CHK_BH_BEDROCK_ASSIGNED_ANY (above) as a base, returns rows that correspond to GEOL_MAT1_CODE of '21' (i.e. 'Granite').  Where non-rock subsequent layers exist, this is likely an error.  Additional fields are available to update D_GEOLOGY_LAYER (and remove the bedrock tag) if this is the case.

#### V_SYS_CHK_BH_BEDROCK_ASSIGNED_OTHER

This view, using V_SYS_CHK_BH_BEDROCK_ASSIGNED_ANY (above) as a base, returns rows that correspond to various GEOL_MAT1_DESCRIPTION's, including:

* Greenstone ('22')
* Basalt ('36')
* Chert ('37')
* Conglomerate ('38')
* Feldspar ('39')
* Flint ('40')
* Gneiss ('41')
* Greywacke ('42')
* Marble ('45')
* Quartz ('46')
* Soapstone ('48')

Refer to V_SYS_CHK_BH_BEDROCK_ASSIGNED_GRANITE (above) for additional details.

#### V_SYS_CHK_BH_BEDROCK_ASSIGNED_SANDSTONE

This view, using V_SYS_CHK_BH_BEDROCK_ASSIGNED_ANY (above) as a base, returns rows that correspond to GEOL_MAT1_CODE of '18' (i.e. 'Sandstone').  Refer to V_SYS_CHK_BH_BEDROCK_ASSIGNED_GRANITE (above) for additional details.

#### V_SYS_CHK_BH_BEDROCK_ASSIGNED_SHALE

This view, using V_SYS_CHK_BH_BEDROCK_ASSIGNED_ANY (above) as a base, returns rows that correspond to GEOL_MAT1_CODE of '17' (i.e. 'Shale').  Refer to V_SYS_CHK_BH_BEDROCK_ASSIGNED_GRANITE (above) for additional details.

#### V_SYS_CHK_BH_BEDROCK_ELEV_RANGE

This view uses V_SYS_BH_BEDROCK_ELEV as a base.  It returns rows where the BH_BEDROCK_ELEV (from D_BOREHOLE) is not within +/- 0.001m of the 'new' calculated bedrock elevation or is NULL.

#### V_SYS_CHK_BH_CASING_BOTTOM_MAX

This view returns the deepest bottom-of-casing depth from D_BOREHOLE_CONSTRUCTION (where CON_TYPE_CODE is '3', i.e. 'CASING', from R_CON_TYPE_CODE).  The original 'units of measure' are returned but the depth is converted to 'metres' (from 'fbgs' as necessary).  Note that if the original units are not one of 'm', 'mbgs' or 'fbgs' then a '-9999' value is returned.

#### V_SYS_CHK_BH_CONS_BOTTOM_MAX

This view returns the deepest construction detail (bottom) depth from D_BOREHOLE_CONSTRUCTION.  Refer to V_SYS_CHK_BH_CASING_BOTTOM_MAX for additional details.

#### V_SYS_CHK_BH_CONS_TOP_MAX

This view returns the deepest construction detail (top) depth from D_BOREHOLE_CONSTRUCTION.  Refer to V_SYS_CHK_BH_CASING_BOTTOM_MAX for additional details.  This is used in the case when only a top depth is present to indicated maximum depth of a borehole.

#### V_SYS_CHK_BH_ELEV

This view returns a number of elevations associated with a borehole location where: BH_GND_ELEV is NULL; BH_DEM_GND_ELEV is NULL; or BH_GND_ELEV_OUOM is NULL.  These elevations can be used to populate the associated fields.  Note that all three fields in D_BOREHOLE should contain the same value; if BH_GND_ELEV is kept blank, SiteFX considers this row as 'new' data when re-calculating elevations.  The QA_COORD_CONFIDENCE_CODE must not be '117' (i.e. 'YPDT - Coordinate Invalid ?').

#### V_SYS_CHK_BH_ELEV_MISSING

This view returns borehole and location information where the BH_GND_ELEV and BH_GND_ELEV_OUOM is NULL and LOC_COORD_EASTING and LOC_COORD_NORTHING are not.

#### V_SYS_CHK_DGL_COUNTS

This view returns the number of geologic layers in D_GEOLOGY_LAYER as well as the number of these layers that consist only of whole numbers.  Likely, multiple rows of whole numbers for a particular location indicate that the row(s) should likely have the units 'fbgs' (or similar).

#### V_SYS_CHK_DGL_DEPTHS_MOE

This view returns information from D_GEOLOGY_LAYER where: the location is identified as from the MOE WWDB; the units for the row is identified as 'mbgs'; the values for the row are whole numbers; the GEOL_SUBCLASS_CODE is not '5' (i.e. 'Original (or Corrected)').  The MOE_PDF_LINK is incorporated from W_GENERAL.  A total number of geologic layers as well as the number of geologic layers whose depths are whole numbers is calculated.

#### V_SYS_CHK_DGL_MAT1_DCR

This view checks D_GEOLOGY_LAYER where the particular location has an INT_TYPE_CODE of '27' ('Decommissioned'; i.e. DCR) and returns the number of geologic layers whose materials match common 'fill' (i.e. well decommissioning) materials.  These include:

* Clay ('5')
* Fill ('1')
* Gravel ('11')
* Limestone ('28')
* Stones ('12') 

The count of these layers as well as the count of the total number of geologic layers (from V_SYS_SUMMARY_GEOL_LAYER_NUM) is returned.  If these values match (or are close) then it's possible that the well is decommissioned (otherwise, it may be a valid well/borehole).  

#### V_SYS_CHK_DGL_MAT1_NULL_DCR

This view checks D_GEOLOGY_LAYER where the particular location has an INT_TYPE_CODE of '27' ('Decommissioned'; i.e. DCR) and returns the number of geologic layers where the GEOL_MAT1_CODE is NULL.  The total number of geologic layers (from V_SYS_SUMMARY_GEOL_LAYER_NUM) is returned as well.  If these values match, it's likely that the well is decommissioned.

#### V_SYS_CHK_DGL_MULT_UNIT_OUOM

This view examines the D_GEOLOGY_LAYER looking for rows, from a single location, where differing 'original units of measure' (OUOM) for depth have been used (i.e. the field GEOL_UNIT_OUOM).  These rows should subsequently be updated to a single measurement unit consistent for that location.  Note that this should be done before a number of the other V_SYS_CHK_DGL_* views are examined.

#### V_SYS_CHK_DGL_SINGLE_LIME

This view returns those locations where only a single geologic layer has been specified (using V_SYS_GEOL_LAY_UNIT_OUOM) and that layer material type has been specified as GEOL_MAT1_CODE '15' (i.e. 'Limestone').  Note that the GEOL_SUBCLASS_CODE (which is used to 'tag' those locations that have been checked and/or corrected) must have a NULL value.  This is used to determine those possible locations (generally from the MOE) where the original record is for decommissioning a well (and the limestone reference here is for 'limestone screenings' or gravel).  However, in many cases, a single record of limestone will be correct; this should be handled on a case-by-case basis.

#### V_SYS_CHK_DGL_SINGLE_UNKN

This view is similar to V_SYS_CHK_DGL_SINGLE_LIME (above) with the exception that GEOL_MAT1_CODE is '0' (i.e. 'Unknown').

#### V_SYS_CHK_DGL_SINGLE_UNKN_SFC

This view is similar to V_SYS_CHECK_DGL_SINGLE_UNKN; here, though, an additional check is made as to whether the layer is occurring at surface (i.e. GEOL_TOP_OUOM is '0').

#### V_SYS_CHK_DGL_SINGLE_UNKN_SFC_NOPUMP

This view is similar to V_SYS_CHK_DGL_SINGLE_UNKNOWN_SFC; here, though, an additional check is made as to whether there is any pumping information associated with this location.

#### V_SYS_CHK_DGL_SINGLE_UNKN_SFC_NOPUMP_ABD

This view is similar to V_SYS_CHK_DGL_SINGLE_UNKN_SFC_NOPUMP; here, though, an additional check is made as to whether the locations LOC_STATUS_CODE has a value of '3' (i.e. 'Abandoned').

#### V_SYS_CHK_DGL_UNITS

This view returns information from D_GEOLOGY_LAYER using locations (i.e. the LOC_ID) that appear in V_SYS_CHK_DGL_COUNTS.  This allows a check of the depth units for the complete geology at a particular location.

#### V_SYS_CHK_DOC_AUTHOR_AGENCY

This view assembles information from D_DOCUMENT where the DOC_AUTHOR_AGENCY_CODE is NULL (or the DOC_AUTHOR_AGENCY_DESCRIPTION is NULL).

#### V_SYS_CHK_DOC_YN_FIELDS

This view examines the D_DOCUMENT table, specifically the '*_YN' fields.  It reassigns all '0' values to NULL and all '-1' values to '1' (for consistency).  These values need to be reassigned back to the source table.

#### V_SYS_CHK_GEOL_LAY_BOT_ELEV_DEPTH

This view returns the deepest geologic layer elevation and calculated depth (for the latter, subtracting the smallest elevation value from the largest elevation value).

#### V_SYS_CHK_GEOL_LAY_ELEV

This view returns a subset of D_GEOLOGY_LAYER information as well as associated elevation (from D_LOCATION_ELEV) for all locations.

#### V_SYS_CHK_INT_ELEVS_DEPTHS

This view returns all associated elevations and depths for all intervals.  This includes all elevations from D_BOREHOLE, D_INTERVAL_REF_ELEV (including REF_STICK_UP and REF_OFFSET) and D_LOCATION_ELEV_HIST.  In addition, each of the following is included: the deepest geologic formation from D_GEOLOGY_LAYER; the top and bottom elevation and depths from D_INTERVAL_MONITOR; the deepest construction bottom from D_BOREHOLE_CONSTRUCTION; and the average water level elevation (and calculated depth) from D_INTERVAL_SUMMARY.  Only those locations with valid coordinates are examined.

This was originally used for correcting borehole depths (and screen depths).

#### V_SYS_CHK_INT_ELEVS_DEPTHS_\*

These series of views use V_SYS_CHK_INT_ELEVS_DEPTHS as a base with comparisons between fields specifically defined to detect particular errors (in borehole depth, screen elevations, etc?).  All of these views do not consider any location whose QA_COORD_CONFIDENCE_CODE is '118' (i.e. 'YPDT - Assigned Township Centroid').  These include

* V_SYS_CHK_INT_ELEVS_DEPTHS_BH_MON_BOT_DIFF
    + This view returns those rows whose BH_BOTTOM_ELEV and MON_BOTTOM_ELEV have a difference greater than '10m'.
* V_SYS_CHK_INT_ELEVS_DEPTHS_BH_VS_MAX
    + This view returns those rows whose BH_BOTTOM_DEPTH (plus '0.1m') is less than the MAX_DEPTH_M (i.e. the borehole bottom depth from D_BOREHOLE is above the maximum calculated depth available).
* V_SYS_CHK_INT_ELEVS_DEPTHS_BH_VS_MON_BOT
    + This view returns those rows whose BH_BOTTOM_ELEV is greater than the MON_BOT_ELEV (plus '0.1m'; i.e. the borehole bottom elevation from D_BOREHOLE is above the bottom of the screen elevation).  
* V_SYS_CHK_INT_ELEVS_DEPTHS_BH_VS_WL
    + This view returns those rows whose BH_BOTTOM_ELEV is greater than the WL_AVG_MASL (i.e. the average water level is below the bottom of the borehole).
* V_SYS_CHK_INT_ELEVS_DEPTHS_MON_BOT_LT_0
    + This view returns those rows whose MON_BOT_ELEV has a value less than zero.
* V_SYS_CHK_INT_ELEVS_DEPTHS_MON_BOT_TOP
    + This view returns those rows whose MON_BOT_ELEV is above that of the MON_TOP_ELEV (i.e. the top and bottom screen elevations are likely reversed).
* V_SYS_CHK_INT_ELEVS_DEPTHS_MON_M_LT_0
    + This view returns those rows whose MON_TOP_DEPTH_M or MON_BOT_DEPTH_M are less than zero.

#### V_SYS_CHK_INT_MON_DEPTHS_M

This view returns the calculated screen depths from D_INTERVAL_MONITOR where MON_TOP_DEPTH_M and MON_BOT_DEPTH_M is NULL and MON_TOP_OUOM and MON_BOT_OUOM is not NULL.  Using the OUOM fields, the depths are calculated for the original units of 'mbgs', 'fbgs' and 'masl' (which is subtracted from ASSIGNED_ELEV); a '-9999' tag is returned for other units.  Only those with valid coordinates are examined.

#### V_SYS_CHK_INT_MON_ELEV_DEPTH

This view returns the current depths and elevations from D_INTERVAL_MONITOR as well as BH_GND_ELEV, BH_GND_BOTTOM_ELEV and BH_BOTTOM_DEPTH from D_BOREHOLE.   The ASSIGNED_ELEV is extracted from D_LOCATION_ELEV and LOC_ELEV_MASL_ORIG is from V_SYS_ELEV_ORIGINAL. This should be used as a check between the borehole depth and screened interval depth.

#### V_SYS_CHK_INT_REF_ELEV

This view returns those locations where the ASSIGNED_ELEV (from D_LOCATION_ELEV) does not lie within the REF_ELEV minus the REF_STICK_UP (from D_INTERVAL_REF_ELEV).  Only those locations where ASSIGNED_ELEV matches BH_GND_ELEV (from D_BOREHOLE) and only a single record (for the particular interval) is present in D_INTERVAL_REF_ELEV (using V_SYS_INT_REF_ELEV_COUNT) are considered.  The reference ground elevation, the new reference elevation (using ASSIGNED_ELEV and REF_STICK_UP) and the absolute difference between ASSIGNED_ELEV and the reference ground elevation is calculated.

#### V_SYS_CHK_INT_REF_ELEV2

This view returns locations similarly to V_SYS_CHK_INT_REF_ELEV for those locations with multiple records (i.e. time intervals) in D_INTERVAL_REF_ELEV.  The REF_ELEV_START_DATE and REF_ELEV_END_DATE are included; the latter is assigned the current date if, at present, it is NULL (i.e. it is the current reference elevation record).

#### V_SYS_CHK_INT_REF_ELEV2_DIT2

This view is equivalent to V_SYS_CHK_INT_REF_ELEV_DIT2 (below) for those intervals with multiple records in D_INTERVAL_REF_ELEV.  The start and end dates are used to determine the applicable 'new' reference elevation.

#### V_SYS_CHK_INT_REF_ELEV2_DIT2_DEPTHS

This view is equivalent to V_SYS_CHK_INT_REF_ELEV_DIT2_DEPTHS (below) for those intervals with multiple records in D_INTERVAL_REF_ELEV (using V_SYS_CHK_INT_REF_ELEV2_DIT2 as a source).

#### V_SYS_CHK_INT_REF_ELEV_DIT2

This view returns all records from D_INTERVAL_TEMPORAL_2 for intervals present in V_SYS_CHK_REF_ELEV and with READING_GROUP_CODE of '23' (i.e. 'Water Level').  This can be used to determine those records that could be affected by updating (i.e. correcting) the reference elevation (the new, calculated reference elevation is included).

#### V_SYS_CHK_INT_REF_ELEV_DIT2_DEPTHS

This view returns all records from V_SYS_CHK_INT_REF_ELEV_DIT2 where the original units of measure are depths (e.g. 'mbgs', 'fbgs', etc?) - these are the only records that should be modified by a change in REF_ELEV.  Units such as 'masl' should remain unchanged.  The corrected RD_VALUE is present in RD_VALUE_NEW.  The SYS_RECORD_ID from D_INTERVAL_TEMPORAL_2 is included.

#### V_SYS_CHK_INT_REF_ELEV2_ERR

This view returns all records from D_INTERVAL_REF_ELEV where multiple reference elevations have been specified but their date ranges are invalid.  This should be used to correct those date ranges.

#### V_SYS_CHK_INT_SOIL_DEPTHS_M

This view returns the calculated SOIL_TOP_M and SOIL_BOT_M from D_INTERVAL_SOIL.  Both depths ('fbgs' and 'mbgs') and elevations ('masl'; the latter in conjunction with ASSIGNED_ELEV) in the original units of measure are used; a value of '-9999' is otherwise returned.  The original values must be present and the SOIL_TOP_M and SOIL_BOT_M must be NULL.

#### V_SYS_CHK_INT_SUM_ADD

This view returns a list of INT_ID's not present in D_INTERVAL_SUMMARY.  This is used to automatically update the table with new intervals.

#### V_SYS_CHK_INT_SUM_REMOVE

This view turns a list of INT_ID's that exist in D_INTERVAL_SUMMARY but are no longer found in D_INTERVAL.  This is used to automatically remove rows from the summary table.  Note that CASCADE rules are present as part of the database schema to automatically remove intervals from this table once they have been removed from D_INTERVAL.

#### V_SYS_CHK_INT_TMP1_DUPLICATES

This view returns duplicate records from D_INTERVAL_TEMPORAL_1B/1A using comparisons between INT_ID, RD_NAME_CODE, SAM_SAMPLE_DATE, RD_VALUE and UNIT_CODE.  The number of records and the minimum SYS_RECORD_ID (from D_INTERVAL_TEMPORAL_1B) is also returned - the latter is chosen, by default, to remain in the database.  Refer to V_SYS_CHK_INT_TMP1_DUPLICATES_DEL_SRI, below.  Information from D_DATA_SOURCE (tagged by DATA_ID) is included.

#### V_SYS_CHK_INT_TMP1_DUPLICATES_DEL_SRI

This view returns the duplicate row SYS_RECORD_ID values - these can be used to remove the records from D_INTERVAL_TEMPORAL_1B.

#### V_SYS_CHK_INT_TMP1_DUPLICATES_NUM

This view, using V_SYS_CHK_INT_TMP1_DUPLICATES as a source, returns the number of duplicate records in D_INTERVAL_TEMPORAL_1B.  This includes all rows.

#### V_SYS_CHK_INT_TMP1_DUPLICATES_NUM_DEL

This view, using V_SYS_CHK_INT_TMP1_DUPLICATES as a source, returns the number of records to be deleted from D_INTERVAL_TEMPORAL_1B.  This value should be less than that returned from V_SYS_CHK_INT_TMP1_DUPLICATES_NUM.

#### V_SYS_CHK_INT_TMP1_UNITS

This view returns those records from D_INTERVAL_TEMPORAL_1A and D_INTERVAL_TEMPORAL_1B where units in the latter table are inappropriate for lab-based analysis (e.g.'masl' and 'mbgs'; any rows tagged with these units should likely be in D_INTERVAL_TEMPORAL_2).

#### V_SYS_CHK_INT_TMP1A_SAMID

This view returns a list of SAM_ID's from D_INTERVAL_TEMPORAL_1A that have no related records in D_INTERVAL_TEMPORAL_1B.  This should be used to remove these records.

#### V_SYS_CHK_INT_TMP1B_SAMID

This view returns a list of SAM_ID's from D_INTERVAL_TEMPORAL_1B that have no related records in D_INTERVAL_TEMPORAL_1A.  This should be used to remove these records.

#### V_SYS_CHK_INT_TMP2_DUPLICATES

This view returns duplicate records from D_INTERVAL_TEMPORAL_2 using comparisons between INT_ID, RD_NAME_CODE, RD_DATE, RD_VALUE and UNIT_CODE.  The number of records and the minimum as well as the maximum SYS_RECORD_ID (from D_INTERVAL_TEMPORAL_2) is also returned - the minimum is usually chosen, by default, to remain in the database.  Refer to V_SYS_CHK_INT_TMP2_DUPLICATES_DEL_SRI, below.  Information from D_DATA_SOURCE (tagged by DATA_ID) is included.

#### V_SYS_CHK_INT_TMP2_DUPLICATES_DEL_SRI

This view returns the duplicate row SYS_RECORD_ID values - these can be used to remove the records from D_INTERVAL_TEMPORAL_2.  The minimum SYS_RECORD_ID (i.e. MIN_SYS_RECORD_ID) is used in this case.

#### V_SYS_CHK_INT_TMP2_DUPLICATES_NUM

This view, using V_SYS_CHK_INT_TMP2_DUPLICATES as a source, returns the number of duplicate records in D_INTERVAL_TEMPORAL_2.  This includes all rows.

#### V_SYS_CHK_INT_TMP2_DUPLICATES_NUM_DEL

This view, using V_SYS_CHK_INT_TMP2_DUPLICATES as a source, returns the number of records to be deleted from D_INTERVAL_TEMPORAL_2.  This value should be less than that returned from V_SYS_CHK_INT_TMP2_DUPLICATES_NUM.

#### V_SYS_CHK_INT_TMP2_SOIL

This view returns all records from D_INTERVAL_TEMPORAL_2 that are associated with soil intervals (i.e. INT_TYPE_CODE '29').

#### V_SYS_CHK_LOC_COORDS

This view returns the coordinate and coordinate-quality information (from D_LOCATION and D_LOCATION_QA) where LOC_COORD_EASTING or LOC_COORD_NORTHING is NULL.  Only QA_COORD_CONFIDENCE_CODE's that do not have a value of '117' (i.e. 'YPDT - Invalid ?') are considered.

#### V_SYS_CHK_LOC_COORDS_CHECK

This view returns those locations whose spatial coordinates in D_LOCATION_GEOM (i.e. in GEOM) do not match the (x,y) coordinates in D_LOCATION (i.e. LOC_COORD_EASTING and LOC_COORD_NORTHING).  This is signified by COORD_CHECK (in D_LOCATION_GEOM) having a non-null value (this column is increment using a weekly check process).  The CURRENT_COORD coordinates from D_LOCATION_COORD_HIST, if available, are also returned.  This should be used to monitor and correct invalid changes in coordinates.

#### V_SYS_CHK_LOC_COORDS_CHECK_UPDATE

This view returns the calculated GEOM and GEOM_WKB for a location where COORD_CHECK (from D_LOCATION_GEOM) is not null; the latter signifies that a change has been made in the coordinates that do match the spatial geometry (i.e. GEOM).  Note that the current coordinates in D_LOCATION_COORD_HIST must match the coordinate values in D_LOCATION.  The two spatial geometry fields, here, should be used to update the fields in D_LOCATION_GEOM.

#### V_SYS_CHK_LOC_COORDS_CURR

This view returns the coordinates from D_LOCATION where the location currently has no recorded values in D_LOCATION_COORD_HIST.  This is used to update the latter table - a CURRENT_COORD field is present set to a '1' value (indicating that this is the current coordinates).  Note that there must be a valid coordinate in either (or both) of LOC_COORD_EASTING or LOC_COORD_NORTHING.

#### V_SYS_CHK_LOC_ELEV

This view extracts all elevations from D_LOCATION_ELEV_HIST and D_BORHOLE where the ASSIGNED_ELEV in D_LOCATION_ELEV is NULL.  This can be used to populate the latter table (with an ASSIGNED_ELEV value).  Note that this is an older view and should be updated to incorporate changes in the two location-elevation tables or discarded.

#### V_SYS_CHK_LOC_ELEV_ASSIGNED_ALL

This view returns all elevations from the D_LOCATION_ELEV and D_LOCATION_ELEV_HIST (the latter through a series of views) associated with a particular location.

V_SYS_CHK_LOC_ELEV_BH_ELEV

This view returns all elevations similar to V_SYS_CHK_LOC_ELEV_ASSIGNED_ALL but only for those locations whose ASSIGNED_ELEV does not match BH_GND_ELEV (from D_BOREHOLE) within a range of '+/- 0.0001m'.  The QA_COORD_CONFIDENCE_CODE cannot have a value of '117' (i.e. 'YPDT - Coordinate Invalid ?').  This allows comparisons between the elevation tables and D_BOREHOLE as the latter can be modified readily in SiteFX.

#### V_SYS_CHK_LOC_ELEV_MISSING

This view returns all locations (by LOC_ID) that are currently not found in D_LOCATION_ELEV (i.e. there is no ASSIGNED_ELEV).  Note that LOC_TYPE_CODE's '22' (i.e. 'Permit to Take Water') and '25' (i.e. 'Documents') are excluded.  The QA_COORD_CONFIDENCE_CODE for the location cannot be '117' (i.e. 'YPDT - Coordinate Invalid ?').

#### V_SYS_CHK_LOC_ELEV_MISSING_DEM_GEOM

This view returns the LOC_ID and GEOM from D_LOCATION_GEOM; this is mainly used to determine various DEM elevations for these locations.  Note that LOC_TYPE_CODE's '22' (i.e. 'Permit to Take Water') and '25' (i.e. 'Documents') are excluded as well as those locations with a QA_COORD_CONFIDENCE_CODE of '117' (i.e. 'YPDT - Coordinate Invalid ?') or '118' (i.e. 'YPDT - Assigned Township Centroid ?').  The location is excluded, in addition, if it already has the elevations from the 'DEM - MNR 10m v2' or 'DEM - SRTM 90m v41' surfaces (i.e. LOC_ELEV_CODE's '3' and '5' as found in D_LOCATION_ELEV_HIST). 

#### V_SYS_CHK_LOC_ELEV_MISSING_GEOM

Using V_SYS_CHK_LOC_ELEV_MISSING as a source this view returns the LOC_ID and GEOM for each location.

#### V_SYS_CHK_LOC_ELEV_MISSING_LIST

This view returns all elevations associated with a particular location using V_SYS_CHK_LOC_ELEV_MISSING and V_SYS_CHK_LOC_ELEV_ASSIGNED_ALL as sources.  This can be used to determine the ASSIGNED_ELEV to be used for a location.

#### V_SYS_CHK_LOC_ELEV_MISSING_LIST_QA

This view returns all elevations associated with a particular location (using V_SYS_CHK_LOC_ELEV_MISSING_LIST) with the addition of the particular QA/QC codes and various other information allowing for direct addition into D_LOCATION_ELEV_HIST.

#### V_SYS_CHK_LOC_ELEV_SURV_NULL

This view returns all elevations associated with a particular location (similarly to V_SYS_CHK_LOC_ELEV_MISSING_LIST) where the QA_ELEV_CONFIDENCE_CODE is '1' (i.e. it has been surveyed) but no surveyed elevation is present in D_LOCATION_ELEV_HIST (i.e. having a LOC_ELEV_CODE of '1').  This should be used to determine the input surveyed elevation.

#### V_SYS_CHK_LOC_GEOM_ADD

This view returns any LOC_ID not currently present in D_LOCATION_GEOM (that has a valid location).  This is used to automatically add missing locations into the latter table.

#### V_SYS_CHK_LOC_GEOM_CHANGE

This view returns any LOC_ID where the calculated spatial geometry (from V_SYS_LOC_GEOMETRY) does not match the stored spatial geometry in D_LOCATION_GEOM.  This is used to automatically tag locations whose coordinates should be checked.  Note that this view uses the built-in function 'STEquals' for spatial geometry comparisons (the function returns a '1' if they match, a '0' otherwise).

#### V_SYS_CHK_LOC_GEOM_COORD_CHECK

This returns all locations as well as their spatial geometry from D_LOCATION_GEOM where COORD_CHECK is not NULL.  The latter indicates where the spatial geometry differs from the current LOC_COORD_EASTING and LOC_COORD_NORTHING in D_LOCATION.

#### V_SYS_CHK_LOC_GEOM_COORD_CHECK_REVIEW

This view returns the original spatial geometries (both GEOM and GEOM_WKB) as well as the new calculated spatial geometries (new_GEOM and new_GEOM_WKB) for a location where the COORD_CHECK value is not NULL.  This can be used to update D_LOCATION_GEOM after checking.

#### V_SYS_CHK_LOC_GEOM_REMOVE

This view returns all locations (by LOC_ID) from D_LOCATION_GEOM that no longer exist in D_LOCATION.  Note that the database schema has been updated with CASCADE statements to automate this removal process - this view may be removed in the future.

#### V_SYS_CHK_LOC_GEOM_WKB_UPDATE

This view returns all locations (by LOC_ID) where GEOM_WKB in D_LOCATION_GEOM is currently a NULL value.  This is used to tag locations where this field should be populated.

#### V_SYS_CHK_LOC_SUM_ADD

This view returns all locations (by LOC_ID) from D_LOCATION that are currently not found in D_LOCATION_SUMMARY.  This is used to automatically add locations to the latter table.

#### V_SYS_CHK_LOC_SUM_REMOVE

This view returns all locations (by LOC_ID) from D_LOCATION_SUMMARY that are no longer found in D_LOCATION.  This is used to automatically remove locations from the former table.  Note that changes to the database schema using CASCADE statements  may have made the use of this view surplus - it may be removed in the future.

#### V_SYS_CHK_MON_BOT_GT_BOT_ELEV

This view checks if the elevation of the bottom of any screen (from D_INTERVAL_MONITOR) is below the elevation of the bottom of the borehole (from D_BOREHOLE).  Note that a value of '0.001' is added to the former to account for slight rounding errors introduced during data entry.

#### V_SYS_CHK_PICK_ELEV

This view compares the GND_ELEV (from D_PICK) with that of BH_GND_ELEV (from D_BOREHOLE) and ASSIGNED_ELEV (from D_LOCATION_ELEV), calculating their differences.  If either of these differences (which should contain the same value) are greater than an absolute value of '0.1m' the resultant row(s) are returned.  The difference can be added to TOP_ELEV (and GND_ELEV) as a correction factor.

#### V_SYS_CHK_PICK_ORIG_GND_ELEV

This view compares the original ground elevation (from D_LOCATION_ELEV_HIST using a LOC_ELEV_CODE of '2', i.e. 'Original') with the GND_ELEV from D_PICK.  If the difference is larger than +/- 1, a record is returned.  Note that SYS_RECORD_ID is from D_PICK.

#### V_SYS_CHK_PICK_ORIG_GND_ELEV_DIFF

This view returns a variety of information using V_SYS_CHK_PICK_ORIG_GND_ELEV as a base.  It is to be used to evaluate pick errors from D_PICK.

#### V_SYS_CHK_SPEC_CAP_CALC

This view returns calculated values of specific capacity, using V_SYS_SPEC_CAP_CALC as a source, that do not already appear in D_INTERVAL_TEMPORAL_2 (by interval and date).  Note that the RD_NAME_CODE '748' (i.e. 'Specific Capacity') is returned and used as a check.  The calculated specific capacity cannot be a NULL value. 

#### V_SYS_CHK_WL_MIN_GT_BOT_ELEV

This view checks if the elevation of the lowest water level (from D_INTERVAL_TEMPORAL_2) is below the elevation of the bottom of the borehole (from D_BOREHOLE).  Note that a value of '0.001' is added to the former to account for slight rounding errors introduced during data entry.  The minimum water level is determined using V_SYS_WATERLEVELS_RANGE.

#### V_SYS_CHK_WLS_GEOL_UNIT_RD_UNIT

This view compares water level elevation values and geology layer elevation values based upon their OUOM units.  Where the average water level elevation is below that of the bottom of the borehole, the GEOL_UNIT_OUOM and RD_UNIT_OUOM values are returned along with the count of number of records.  Note that UGAIS wells are specifically ignored (using V_SYS_UGAIS_ALL).

#### V_SYS_DIFAF_ASSIGN

This view examines the contents of D_INTERVAL_FORM_ASSIGN then returns the
'final' geologic unit to be assigned to an interval based upon the preferred geologic
model for the particular location (refer to Section 2.4.1 for a description of
the assignment details).  This can be used to populate
D_INTERVAL_FORM_ASSIGN_FINAL.

#### V_SYS_DIFA_ASSIGNED_FINAL

This view returns the assigned 'final' geologic unit to the particular
interval.  The units descriptive text is included.

#### V_SYS_DOC_REPLIB_ENTRY

This view returns the fields and values from D_DOCUMENT and D_LOCATION that mimics the format of the table in the Microsoft Access Report Library template.  It is used as a source to represent all documents currently stored in the database.

#### V_SYS_ELEV_ASSIGNED

This view returns the 'assigned' elevation (as found in D_LOCATION_ELEV) with the supporting information from D_LOCATION_ELEV_HIST (linked on LOC_ELEV_ID).

#### V_SYS_ELEV_ASSIGNED_ALL

This view returns all elevations associated with a particular location (by LOC_ID).  Note that these include:

* Assigned Elevation (from D_LOCATION_ELEV)
* Surveyed (LOC_ELEV_CODE '1' - 'Surveyed') as LOC_ELEV_MASL_SURV
* Original Elevation (LOC_ELEV_CODE '2' - 'Original') as LOC_ELEV_MASL_ORIG
* Ministry of Natural Resources (MNR) Digital Elevation Model (DEM), version 2 (10m resolution; LOC_ELEV_CODE '3' - 'DEM - MNR 10m v2') as LOC_ELEV_MASL_MNRV2
* Shuttle Radar Topography Mission (SRTM) DEM, version 4.1 (90m resolution; LOC_ELEV_CODE '5' - 'DEM - SRTM 90m v41') as LOC_ELEV_MASL_SRTMV41

Additional elevations, not listed here, may be available in D_LOCATION_ELEV_HIST (refer to R_LOC_ELEV_CODE).  This uses V_SYS_ELEV_ASSIGNED (which must have a value for a particular location), V_SYS_ELEV_DEM_MNR_V2, V_SYS_ELEV_DEM_SRTM_V41, V_SYS_ELEV_ORIGINAL and V_SYS_ELEV_SURVEYED as sources.

#### V_SYS_ELEV_DEM_MNR_V2

This view returns the elevations for all locations that have a LOC_ELEV_CODE of '3' (i.e. 'DEM - MNR 10m v2').

#### V_SYS_ELEV_DEM_SRTM_V41

This view returns the elevations for all locations that have a LOC_ELEV_CODE of '5' (i.e. 'DEM - SRTM 90m v41')

#### V_SYS_ELEV_ORIGINAL

This view returns the elevations for all locations that have a LOC_ELEV_CODE of '2' (i.e. 'Original').

#### V_SYS_ELEV_SURVEYED

This view returns the elevations for all locations that have a LOC_ELEV_CODE of '1' (i.e. 'Surveyed').

#### V_SYS_ELEV_SURVEYED_DURHAM

This view returns the elevations for all locations that have a LOC_ELEV_CODE of '10' (i.e. 'Surveyed - Durham Update').  These were all assumed to be surveyed at the time of entry/update.

#### V_SYS_EXAMPLE_SHEET_\*

These views return location and interval data, from the database, in the format required for manual data entry using the spreadsheet(s) as described in Section 3.4.  These are to be used to provide familiar example information to requisite partner agencies whom are undergoing entry of data into a database-friendly format outside of the SiteFX environment.  The resultant rows should be included in the file sent to the partner agency as example worksheets (in addition to the blank, data entry sheets).  Note that fields with NULL values are converted to empty strings for incorporating into spreadsheets.

The example data extracted include each of the following:

* V_SYS_EXAMPLE_SHEET_A_LOCATION
    + This view incorporates data from D_LOCATION, D_LOCATION_QA and D_DATA_SOURCE.
* V_SYS_EXAMPLE_SHEET_B_BOREHOLE
    + This view incorporates data from D_BOREHOLE and D_LOCATION.
* V_SYS_EXAMPLE_SHEET_C_GEOLOGY
    + This view incorporates data from V_GEN_GEOLOGY and D_GEOLOGY_LAYER.
* V_SYS_EXAMPLE_SHEET_D_SCREEN
    + This view incorporates data from V_GEN_HYDROGEOLOGY, D_INTERVAL, D_INTERVAL_REF_ELEV and D_INTERVAL_MONITOR.  This is used as a source in '*_SCREEN_AND_SOIL', below.
* V_SYS_EXAMPLE_SHEET_D_SOIL
    + This view incorporates data from D_INTERVAL_SOIL, D_INTERVAL and V_GEN_BOREHOLE.  This is used as a source in '\*_SCREEN_AND_SOIL', below.
* V_SYS_EXAMPLE_SHEET_D_SCREEN_AND_SOIL
    + This view combines the results from V_SYS_EXAMPLE_SHEET_D_SCREEN and V_SYS_EXAMPLE_SHEET_D_SOIL, above, into a single view.
* V_SYS_EXAMPLE_SHEET_E_LAB_DATA
    + This view incorporates data from V_GEN_LAB and D_INTERVAL_TEMPORAL_1A.
* V_SYS_EXAMPLE_SHEET_F_FIELD_DATA
    + This view incorporates data from V_GEN_FIELD.

#### V_SYS_FIELD_WATERLEVELS_DAILY

This view returns the calculated daily average water level for both logger (RD_NAME_CODE '629') and manual (RD_NAME_CODE '628') data for each interval, if available.  Only those rows in D_INTERVAL_TEMPORAL_2 with UNIT_CODE '6' (i.e. 'masl') are included.  Note that the maximum SYS_RECORD_ID is included for referencing (i.e. in order to distinguish between rows in the resultant dataset).  The datetime field (RD_DATE) is modified, dropping the hour and minute data.

#### V_SYS_FIELD_WATERLEVELS_YEARLY

This view returns the water level minimum, maximum, difference and total number of records for each interval for each year of data.  Note that data from RD_NAME_CODEs '628' (i.e. 'Water Level - Manual - Static') and '629' (i.e. 'Water Level - Logger (Compensated & Corrected)') are combined for these calculations.  Only those records with UNIT_CODE '6' (i.e. 'masl') are included.

#### V_SYS_GEN_BH_INT_MUNIC_WELL

This view returns various associated information for municipal wells.  The latter is defined as having the following attributes:

* PURPOSE_PRIMARY_CODE of '10' (i.e. 'Water Supply')
* PURPOSE_SECONDARY_CODE of '22' (i.e. 'Municipal Supply')
* LOC_TYPE_CODE of '1' (i.e. 'Well or Borehole')

#### V_SYS_GEN_BH_INT_MUNIC_WELL_CHANNEL

This view returns all municipal wells, using V_SYS_GEN_BH_INT_MUNIC_WELL as a source, that are determined to be screened within a 'channel' geologic unit (as defined by V_SYS_GEOL_UNIT_CHANNEL).

#### V_SYS_GEN_BH_INT_MUNIC_WELL_DEEP

This view returns all municipal wells, using V_SYS_GEN_BH_INT_MUNIC_WELL as a source, that are determined to be screened within 'deep' geologic units (as defined by V_SYS_GEOL_UNIT_DEEP).

#### V_SYS_GEN_BH_INT_MUNIC_WELL_SHALLOW

This view returns all municipal wells, using V_SYS_GEN_BH_INT_MUNIC_WELL as a source, that are determined to be screened within 'shallow' geologic units (as defined by V_SYS_GEOL_UNIT_SHALLOW).

#### V_SYS_GEN_LAB_STANDARD

This view returns all records from D_INTERVAL_TEMPORAL_1B/1A where the specific parameter (as defined by RD_NAME_CODE) is considered to be a 'standard' parameter.  In addition, the REC_STATUS_CODE must have a value less than '10'(values '10' or higher are considered to be unreliable).  Standard parameters include (the parameter RD_NAME_CODE is in brackets):

* Alkalinity (86)
* Alkalinity (as CaCO3) (653)
* Alkalinity (Total Fixed Endpoint) (10813)
* Aluminum (92)
* Ammonia (93)
* Ammonia (as Nitrogen) (94)
* Antimony (96)
* Arsenic (97)
* Barium (100)
* Benzene (102)
* Beryllium (109)
* Bicarbonate (as HCO3) (111)
* Bismuth (119)
* Boron (121)
* Bromide (124)
* Cadmium (132)
* Calcium (133)
* Chloride (143)
* Chromium (152)
* Cobalt (160)
* Conductivity (163)
* Conductivity (Calculated) (680)
* Copper (164)
* Cyanide (Free) (169)
* Cyanide (Total) (168)
* Dissolved Inorganic Carbon (10759)
* Dissolved Organic Carbon (200)
* Ethylbenzene (215)
* Fluoride (226)
* Fluorine (227)
* Hardness (as CaCO3) (235)
* Ionic Balance (504)
* Iron (252)
* Langelier Index (506)
* Lead (258)
* Magnesium (268)
* Manganese (270)
* Mercury (273)
* Molybdenum (290)
* Nickel (297)
* Nitrate (298)
* Nitrate (as Nitrogen) (718)
* Nitrate \+ Nitrite (as Nitrogen) (716)
* Nitrite (300)
* Nitrite (as Nitrogen) (723)
* Orthophosphate (314)
* pH (326)
* pH at Saturation (327)
* pH at Saturation (Estimated) (10784)
* Potassium (339)
* Selenium (353)
* Silica (354)
* Silver (356)
* SiO2 (70772)
* Sodium (358)
* Strontium (362)
* Sulphate (364)
* Thallium (374)
* Thorium (375)
* Titanium (377)
* Toluene (379)
* Total Dissolved Solids (384)
* Total Kjeldahl Nitrogen (388)
* Total Phosphorus (334)
* Trichloroethylene (407)
* Turbidity (412)
* Uranium (413)
* Vanadium (414)
* Vinyl Chloride (417)
* Xylene (395)
* Zinc (424)

#### V_SYS_GEN_WL_AVERAGE

This view, using V_SYS_CHK_INT_ELEVS_DEPTHS as a source, returns those records where WL_MASL_AVG is not null and the QA_COORD_CONFIDENCE_CODE is less than '6' (i.e. 'Margin of Error: 300m - 1km'; the uncertainty, then, would be less than 300m horizontal).  Both the spatial geometry (from D_LOCATION_GEOM) and the coordinates (from D_LOCATION) are included.  This can then be used for creating regional water level surfaces.

#### V_SYS_GENERAL

This view extracts locations from D_LOCATION with valid coordinates (i.e. not having a QA_COORD_CONFIDENCE_CODE of '117').  Note that documents (LOC_TYPE_CODE '25') and the 'Viewlog Well Header' location (i.e. LOC_ID '-2147483443') are not included.  This is used as a base for many V_GEN_* views.

#### V_SYS_GENERAL_INTERVAL

This view extracts all intervals from D_INTERVAL that are present in V_SYS_GENERAL; refer to V_SYS_GENERAL, above.  This is used as a base for many V_GEN_* views that include interval information.

#### V_SYS_GEOL_LAYER_COUNT

This view is not official and should be removed.

#### V_SYS_GEOL_LAY_ELEVS

This view returns the current elevations found in D_GEOLOGY_LAYER as well as newly calculated elevations based upon the *_OUOM fields (based upon the specified units) and the current ASSIGNED_ELEV.  This can be used as a check against the current geologic layer elevations and the BH_GND_ELEV (from D_BOREHOLE).

#### V_SYS_GEOL_LAY_TOP_BOT_M

This view returns calculated depths for all geologic records in D_GEOLOGY_LAYER (referenced by GEOL_ID) for locations with valid coordinates (i.e. not having a QA_COORD_CONFIDENCE_CODE of '117').  In addition, a number of checks are made:

* ASSIGNED_ELEV cannot be null
* GEOL_TOP_ELEV and GEOL_BOT_ELEV cannot be null and must not exceed the ASSIGNED_ELEV value
* All calculated depths must be greater than zero
* GEOL_TOP_ELEV must have a larger value than GEOL_BOT_ELEV

#### V_SYS_GEOL_LAY_UNIT_OUOM

This view returns the number of geologic layers for a location (from V_SYS_SUMMARY_GEOL_LAYER_NUM, below) as well as the number of geologic layers that have OUOM values (of depth or elevation) that are whole numbers (i.e. having no fractional value).  The original 'units of measure' area also returned.  This can be used as a base of comparison to determine whether the original 'units of measure' (also listed) are correct; the assumption, here, being that units of 'ft' or 'fasl' (and others) will have whole numbers while metric units will have fractional/decimal numbers.

#### V_SYS_GEOL_UNIT_CHANNEL

This view extracts all records from R_GEOL_UNIT_CODE whose geologic units are considered 'channel' related.  Note that these will almost exclusively consist of 'YPDT ?' units.

#### V_SYS_GEOL_UNIT_DEEP

This view extracts all records from R_GEOL_UNIT_CODE whose geologic units are considered to be 'deep'.  Note that these will almost exclusively consist of 'YPDT ?' units.

#### V_SYS_GEOL_UNIT_LNT

This view extracts all records from R_GEOL_UNIT_CODE whose geologic units are considered to be related to the 'Lower Northern Till'.

#### V_SYS_GEOL_UNIT_SHALLOW

This view extracts all records from R_GEOL_UNIT_CODE whose geologic units are considered to be 'shallow'.  Note that these will almost exclusively consist of 'YPDT ?' units.

#### V_SYS_GEOM_BOREHOLE

This view extracts all records from D_LOCATION_GEOM where the location's LOC_TYPE_CODE is '1' (i.e. 'Well or Borehole').  Both the native spatial geometry and the 'well known binary' (WKB) geometry for the location is returned.

#### V_SYS_INT_MON_COORDS

This view returns the coordinates and top- and bottom-depths for all valid screened intervals.  Note that MON_TOP_DEPTH_M and MON_BOT_DEPTH_M cannot be NULL and the former must be smaller than the latter.  The views V_SYS_INT_MON_MAX_MIN and V_SYS_GENERAL_INTERVAL are used as sources.

#### V_SYS_INT_MON_COORDS_FLOWING

This view is similar to V_SYS_INT_MON_COORDS; only intervals where MON_FLOWING (from D_INTERVAL_MONITOR) is true are returned.

#### V_SYS_INT_MON_DEPTHS_M

This view returns the top and bottom elevations of intervals in D_INTERVAL_MONITOR.  In addition, both MON_TOP_DEPTH_M and MON_BOT_DEPTH_M are calculated.  Note that BH_GND_ELEV, MON_TOP_ELEV and MON_BOT_ELEV cannot be NULL.

#### V_SYS_INT_MON_ELEVS

This view returns the elevations currently found in D_INTERVAL_MONITOR as well as the calculated elevations based upon the *_OUOM fields and the current ASSIGNED_ELEV.  This can be used to compare the elevation fields and BH_GND_ELEV (from D_BOREHOLE).

#### V_SYS_INT_MON_MAX_MIN

This view returns the maximum and minimum elevations and depths as well as a count of the number of records associated with a screened interval in D_INTERVAL_MONITOR.  This view should be used as a source for these values instead of accessing the data from the source table directly.

#### V_SYS_INT_REF_ELEV_COUNT

This view returns the number of records associated with a particular interval from D_INTERVAL_REF_ELEV.  Multiple records can exist in this table (for each interval) when tracking changes in reference elevation over time.

#### V_SYS_INT_REF_ELEV_CURRENT

This view returns the information for the 'current' interval reference elevation.  Current is defined as the latest, and still applicable (i.e. it has no ending date), reference elevation.

#### V_SYS_INT_SOIL_COORDS

This view returns the coordinates as well as the top and bottom elevations and depths of soil intervals (i.e. samples) from D_INTERVAL_SOIL.  Note that SOIL_TOP_M and SOIL_BOT_M cannot be null and the latter must be larger value than the former.

#### V_SYS_INT_TYPE_CODE_SCREEN

This view returns all INT_TYPE_CODE's whose INT_TYPE_ALT_CODE (in R_INT_TYPE_CODE) matches 'Screen'.  All of these are considered 'screened' intervals that will (likely) appear in D_INTERVAL_MONITOR.

#### V_SYS_INTERVAL_ELEV

This view returns the top- and bottom-elevation of screened intervals in D_INTERVAL_MONITOR.  Note that MON_TOP_ELEV and MON_BOT_ELEV cannot be NULL.

#### V_SYS_LOC_COORD_HIST_ADD

This view assembles the pertinent information from D_LOCATION and D_LOCATION_QA into a format needed for inserting data into D_LOCATION_COORD_HIST.  Only those locations that do not already exist in the latter table will be returned.  These will be tagged as a CURRENT_COORD (which will be set to '1').  Both LOC_COORD_EASTING and LOC_COORD_NORTHING cannot be NULL.

#### V_SYS_LOC_DATA_SOURCE

This view returns, for each location in D_LOCATION: location names; location study; data source information (based on DATA_ID); and, if the location was an MOE well, each of the MOE ATAG, MOETAG and BORE_HOLE_ID.  In addition, W_GENERAL is used as a source for MOE_PDF_LINK.

#### V_SYS_LOC_GEOMETRY

This view returns the calculated spatial geometry for each valid location (i.e. not having a QA_COORD_CONFIDENCE_CODE of '117') in D_LOCATION.  This is accomplished through the built-in function 'STGeomFromText'; the EPSG projection code used is '26917'.

#### V_SYS_LOC_GEOMETRY_WKB

This view returns the calculated 'well known binary' (WKB) spatial geometry (return as a varbinary type) for all locations in D_LOCATION_GEOM.  This is accomplished through the built-in function 'STAsBinary'.

#### V_SYS_LOC_MODEL_<model>BUF

Each of these views returns the location (as LOC_ID) whose spatial geometry (from D_LOCATION_GEOM) intersects the spatial geometry of the specified model (with buffer) polygon (from D_AREA_GEOM).  The models and area objects include:

* CM2004 - AREA_ID '20' (YPDT-CAMC CORE Model 2004 5km Buffer)
* DM2007 - AREA_ID '23' (YPDT-CAMC DURHAM Model 2007 5km Buffer)
* ECM2006 - AREA_ID '29' (YPDT-CAMC EXTENDED CORE Model 2006 5km Buffer)
* EM2010 - AREA_ID '25' (YPDT-CAMC EAST Model 2010 5km Buffer)
* RM2004 - AREA_ID '27' (YPDT-CAMC REGIONAL Model 2004 5km Buffer)
* WB2018 - AREA_ID '65' (ORMGP Model 2018)
* WB2021 - AREA_ID  '73' (ORMGP Model 2021)
* YT32011 - AREA_ID '63' (York Tier 3 Model 2011)

These views use the built-in function 'STIntersects'.

#### V_SYS_LOC_MODEL_YT32011

This view returns the location (as LOC_ID) whose spatial geometry (from D_LOCATION_GEOM) intersects the spatial geometry of this model (with no buffer applied; from D_AREA_GEOM).  This spatial area defined the 'York Tier 3 Model - 2011' (whose AREA_ID is '63').

#### V_SYS_MOE_BORE_HOLE_ID

This view returns all locations from D_LOCATION_ALIAS where LOC_ALIAS_TYPE_CODE is '3' (i.e. 'MOE bore_hold_id field').  Note that LOC_NAME_ALIAS must convert to a numeric (integer) form.  If it cannot convert correctly, a '-9999' value is returned instead.

#### V_SYS_MOE_DATA_ID

This view returns all DATA_ID's (and associated information) that are manually specified as MOE WWDB imports.

#### V_SYS_MOE_DATA_ID_COUNT

This view returns the calculated number of records from D_LOCATION associated with the MOE import DATA_ID's from V_SYS_MOE_DATA_ID.

#### V_SYS_MOE_LOCATIONS

This view returns the UNION of V_SYS_MOE_WELL_ID and V_SYS_MOE_WELL_ID_DLA where the MOE_WELL_ID code is not '-9999'.  In addition, the MOD_PDF_LINK is calculated.  The view V_SYS_MOE_BORE_HOLE_ID is used as the source for MOE_BORE_HOLE_ID.

#### V_SYS_MOE_WELL

This view returns all locations from D_LOCATION that have a DATA_ID associated with an MOE WWDB import using V_SYS_MOE_DATA_ID.  Only those locations with a LOC_TYPE_CODE of '1' (i.e. 'Well or Borehole') are included.

#### V_SYS_MOE_WELL_ID

Using V_SYS_MOE_WELL as a source, the LOC_ORIGINAL_NAME from D_LOCATION is used to calculate the MOE_WELL_ID field.  This value must be convertible to a numeric (integer), a '-9999' value is returned otherwise.  

#### V_SYS_MOE_WELL_ID_DLA

This view returns all locations from D_LOCATION_ALIAS where LOC_ALIAS_TYPE_CODE is '4' (i.e. 'MOE well_id field').  Note that LOC_NAME_ALIAS must be converted to a numeric (integer) form.  If it cannot convert correctly, a '-9999' value is returned instead.

#### V_SYS_MOE_WELL_ID_DLA_DUP

This view returns all locations from D_LOCATION_ALIAS where LOC_ALIAS_TYPE_CODE is '5' ('MOE WELL_ID field - Duplicate').  Note that LOC_NAME_ALIAS must be converted to a numeric (integer) form.  If it cannot convert correctly, a '-9999' value is returned instead.

#### V_SYS_NAME

This view returns all names for a given location and interval as found in D_LOCATION, D_LOCATION_ALIAS, D_INTERVAL and D_INTERVAL_ALIAS - each is found on a separate row tagged with a LOC_ID.  The INT_ID is included if the name is sourced from an interval table.  All names will be non-NULL.  Note that only LOC_ALIAS_TYPE_CODE's '1' (i.e. 'MOE Tag Number', '2' (i.e. 'MOE Audit Number') or NULL will be extracted from D_LOCATION_ALIAS.  This returns the minimum number of rows (some INT_IDs may be missed in this first-pass view).

#### V_SYS_NAME_ALL

This view is similar to V_SYS_NAME, above.  In this case, a maximum number of rows are returned - all relations will be specified; in some cases there will be duplicates.  V_SYS_NAME is used as a base for this view.

#### V_SYS_NAME_INTERVAL

This view returns all names tied to intervals (i.e. INT_IDs).

#### V_SYS_NAME_LOCATION

This view returns all names tied to locations (i.e. LOC_IDs).

#### V_SYS_NAME_STUDY_AREA

This view uses V_SYS_NAME as a base and includes LOC_STUDY and LOC_AREA from D_LOCATION.  This returns the minimum number of rows (see V_SYS_NAME, above).

#### V_SYS_NAME_STUDY_AREA_ALL

This view uses V_SYS_NAME_STUDY_AREA as a base.  This returns a maximum number of rows (see V_SYS_NAME_ALL, above).

#### V_SYS_ORMGP_MON_INTERVAL

This view returns those intervals (and associated information) that are directly related or monitored by the ORMGP.  In particular, an interval group (i.e. GROUP_INT_CODE '22', 'YPDT-CAMC Groundwater Monitoring') is used to access these INT_ID's.  Note that these are the 'old' intervals; refer to V_SYS_GW_MON_INTERVAL_NEW, below.

#### V_SYS_ORMGP_MON_INTERVAL_NEW

This view is similar to V_SYS_ORMGP_MON_INTERVAL but uses, instead, the GROUP_INT_CODE '18504083' (i.e. 'YPDT-CAMC Groundwater Monitoring - Update').

#### V_SYS_ORMGP_MON_LOCATION

This view returns those locations (and associated information) that are directly related or monitored by the ORMGP program.  Refer to V_SYS_GW_MON_INTERVAL (above) for details.

#### V_SYS_ORMGP_MON_LOCATION_NEW

#### V_SYS_PICK_\*

These series of views extract records from V_GEN_PICK based upon the text description of each geologic unit.

#### V_SYS_PTTW_EXPIRY_DATE_MAX

This view returns the maximum (i.e. latest) expiry date for a permit or related permit using V_SYS_PTTW_RELATED_ALL.

#### V_SYS_PTTW_FIND_\*

These series of views are used when importing 'new' PTTW locations into the master database.  They are not for the general user.

#### V_SYS_PTTW_FIND_PRESENT

This view returns all LOC_IDs indicating a PTTW location as well as any related PTTW locations.

#### V_SYS_PTTW_FIND_RELATED_ALL

This view returns all permutations of PTTW_PERMIT_NUMBER (with LOC_ID) along with their PTTW_EXPIRED_BY and PTTW_AMENDED_BY permit numbers.

#### V_SYS_PTTW_FIND_RELATED_NEW

Using V_SYS_PTTW_FIND_PRESENT and V_SYS_PTTW_FIND_RELATED_ALL as a base, this view returns all 'new' related permits LOC_IDs.

#### V_SYS_PTTW_RELATED_ALL

This view returns the list of all locations (from D_PTTW) related to their primary location from V_SYS_PTTW_RELATED_PRIMARY (below).  Note that the primary location is listed, here, as being related to itself (i.e. the same LOC_ID and PERMIT_NUMBER will appear, also, as LOC_ID_RELATED and PERMIT_NUMBER_RELATED).

#### V_SYS_PTTW_RELATED_PRIMARY

This view returns a distinct list of locations (by LOC_ID) and their associated PTTW_PERMIT_NUMBER from D_PTTW_RELATED.

#### V_SYS_PTTW_SOURCE

This view returns the source location (by LOC_ID, renamed SOURCE_LOC_ID) linked to a 'permit to take water' (PTTW) location (i.e. the LOC_TYPE_CODE is '22').  A record is returned if the LOC_ID does not have the same LOC_MASTER_LOC_ID value (i.e. the latter is the source).

#### V_SYS_PTTW_SOURCE_VOLUME

This view combines the results of V_SYS_PTTW_SOURCE (above) and V_SYS_PTTW_VOLUME (below).

#### V_SYS_PTTW_VOLUME

This view returns the calculated yearly volume (based upon the PTTW_MAX_L_DAY and PTTW_MAX_DAYS_YEAR) between the years specified by PTTW_ISSUEDDATE and PTTW_PERMIT_END.  Note that the former must be an earlier date than the latter.

#### V_SYS_PUMP_LATEST

This returns the latest pump test information for each interval (using PUMPTEST_DATE from D_PUMPTEST).

#### V_SYS_PUMP_MOE_DRAWDOWN

This view returns the minimum elevation and calculated depth of drawdown from D_INTERVAL_TEMPORAL_2 where RD_NAME_CODE is '70899' (i.e. 'Water Level - Manual - Other') and RD_TYPE_CODE is '65' (i.e. 'WL - MOE Well Record - Pumping') or '64' (i.e. 'WL - MOE Well Record - Recovery').  The information is linked to any records in D_PUMPTEST (based on INT_ID, RD_DATE and PUMPTEST_DATE).  The ASSIGNED_ELEV is used to calculate the depths.

#### V_SYS_PUMP_OFF_WATERLEVEL

This view returns the pump off water levels by interval where RD_TYPE_CODE is '67' (i.e. 'WL - Pump Off').

#### V_SYS_PUMP_ON_WATERLEVEL

This view returns the pump on water levels by interval where RD_TYPE_CODE is '66' (i.e. 'WL - Pump On').

#### V_SYS_PUMP_VOLUME_MONTHLY

This view calculates the monthly pumping volume minimum, maximum, average, sum and number of records by interval from D_INTERVAL_TEMPORAL_2 where RD_NAME_CODE is '447' (i.e. 'Production - Pumped Volume (Daily Total)') and UNIT_CODE is '74' (i.e. 'm3/d').

#### V_SYS_PUMP_VOLUME_YEARLY

This view is similar to V_SYS_PUMP_VOLUME_MONTHLY (above).  The field AVG_VOLUME_M3_D_YEAR is the AVG_VOLUME_M3_D divided by '365'.

#### V_SYS_RANDOM_ID_<numeric>

Each of these views returns a series of numeric, non-repeating numbers within the specified range of values assigned to various ORMGP personnel (make sure to specify 'TOP <number>' as part of your query code - up to ~1000000 rows can be returned).  The following figure specifies the ranges.

#### V_SYS_RANDOM_ID_BULK_<numeric>

These views are similar to V_SYS_RANDOM_ID_<numeric> (above); they are used when a large number of records are to be input into the database. 

#### V_SYS_RANDOM_ID_<partner agency>

These views are similar to V_SYS_RANDOM_ID_<numeric> (above); they are used to assign ranges based upon a particular partner agency.

#### V_SYS_S_USER_ID_RANGES

This view returns the user specified numeric ranges (see V_SYS_RANDOM_ID_*, above) as assigned within SiteFX.  These values are stored in S_USER where 'Name' matches 'uniqueIDranges'.

#### V_SYS_SFLOW_YEARLY

This view returns yearly stream flow minimum, maximum, average and number of records by interval from D_INTERVAL_TEMPORAL_2 where RD_NAME_CODE is '1001' (i.e. 'Stream Flow - Daily Discharge (Average)') or '70870' (i.e. 'Stream Flow (Spot Flow)').

#### V_SYS_SHYDROLOGY

This view returns information specifically formatted for the ORMGP website (through the 'S-Hydrology' web-application) under 'Surface Water Hydrograph Tools'.

#### V_SYS_SPEC_CAP_CALC

This view calculates the specific capacity for intervals from D_INTERVAL_TEMPORAL_2 where: 

* Water levels are calculated from manual readings where RD_NAME_CODE is '628' (i.e. 'Water Level - Manual - Static') and RD_TYPE_CODE is '0' (i.e. 'WL - MOE Well Record - Static')
* Pumping water levels area available where RD_NAME_CODE is '70899' (i.e. 'Water Level - Manual - Other') and RD_TYPE_CODE is '65' (i.e. 'WL - MOE Well Record - Pumping')
* Pumping test data is available in D_PUMPTEST and D_PUMPTEST_STEP; all pumping rates are converted to 'litres per minute' (i.e. 'lpm').

Note that the static water level must be shallower than the pumping water level; a NULL is returned otherwise.

#### V_SYS_STAT_WLS_LOGGER/_MANUAL

This view assembles various statistical measures of the water level logger and manual record distributions (by INT_ID).  This includes

* Minimum value (WLS_MIN)
* Maximum value (WLS_MAX)
* Average (mean) value (WLS_MEAN)
* The range of values (WLS_RANGE)
* Median value (WLS_MED); note that this value is being determined using the SQL Server function 'percentile_cont' which is only available in versions after (and including) v2016
* Mode value; note that a minimum (WLS_MODE_MIN) and maximum (WLS_MODE_MAX) is determined - if these values differ, it indicates that more than a single value has the highest number of occurrences for a particular INT_ID
* The number of records with the particular mode value (WLS_MODE_NUM)
* The total number of records with the highest occurrences of the mode values (MODE_NUM)
* The standard deviation (WLS_STDEV)
* The variance (WLS_VAR) 
* The start (WLS_START_DATE) and end (WLS_END_DATE) dates for the records

In general, the data can be described as right-skewed (i.e. positive skewed) if 

    WLS_MODE < WLS_MED < WLS_MEAN

and left-skewed  (i.e. negative skewed) if

    WLS_MEAN < WLS_MED < WLS_MOD.

#### V_SYS_STAT_WLS_LOGGER_MED/_MANUAL_MED

Calculate the median water level value for logger and manual records.

#### V_SYS_STAT_WLS_LOGGER_MODE/_MANUAL_MODE

Calculate the water level mode value (i.e. the most common occurrence of a particular values within the dataset) for the logger and manual records.  Note that the minimum and maximum value is calculated in the case that more than one particular value as the largest number of records.

#### V_SYS_STAT_WLS_LOGGER_MODEC/_MANUAL_MODEC

Rounds the values of the water level records (for manual and logger data) to five significant digits to allow calculation of the mode value(s).

#### V_SYS_STAT_WLS_LOGGER_MODE_RANGE/_MANUAL_MODE_RANGE

Returns the highest and lowest mode values calculated when more than a single mode value is present for a particular logger and manual water level dataset.

#### V_SYS_STATCOUNT_BOREHOLE

This view calculates the number of boreholes present in the database.  This uses D_BOREHOLE and LOC_TYPE_CODE of '1' (i.e. 'Well or Borehole').

#### V_SYS_STATCOUNT_BOREHOLE_MOE

This view is similar to V_SYS_STATCOUNT_BOREHOLE.  In addition, the borehole must be originally from the MOE WWDB (this is determined by V_SYS_MOE_WELL).

#### V_SYS_STATCOUNT_CHEM_ANALYSIS_PARA

This view calculates the number of readings present in D_INTERVAL_TEMPORAL_1B.  This should be equivalent to the number of rows.

#### V_SYS_STATCOUNT_CLIMATE_MEASURE

This view calculates the number of climate readings present in D_INTERVAL_TEMPORAL_3.  This should be equivalent to the number of rows.

#### V_SYS_STATCOUNT_CLIMATE_STN

This view determines the number of climate stations in the database.  These are LOC_TYPE_CODE's of '9' (i.e. 'Climate Station').

#### V_SYS_STATCOUNT_DOCUMENT

This view determines the number of documents in the database.  This is calculated by the number of records in D_DOCUMENT. 

#### V_SYS_STATCOUNT_GEOLOGY_LAYER

This view determines the number of geology layers in the database.  This is calculated by the number of records in D_GEOLOGY_LAYER.

#### V_SYS_STATCOUNT_OUTCROP

This view determines the number of outcrops present in D_BOREHOLE.  These are LOC_TYPE_CODE's of '11' (i.e. 'Outcrop').

#### V_SYS_STATCOUNT_PUMP_RATE_MUNIC

This view determines the number of pumping municipal records in D_INTERVAL_TEMPORAL_2 where RD_NAME_CODE is '447' (i.e. 'Production - Pumped Volume (Total Daily)' and LOC_STATUS_CODE is '11' (i.e. 'Active Municipal Pumping Well').

#### V_SYS_STATCOUNT_SFC_WATER_MEASURE

This view determines the number of surface water readings in D_INTERVAL_TEMPORAL_2 where LOC_TYPE_CODE is '6' (i.e. 'Surface Water').

#### V_SYS_STATCOUNT_SFC_WATER_STN

This view determines the number of surface water stations in the database.  These are LOC_TYPE_CODE's of '6' (i.e. 'Surface Water').

#### V_SYS_STATCOUNT_WATER_LEVEL

This view determines the number of water levels in D_INTERVAL_TEMPORAL_2.  These correspond to any with a READING_GROUP_CODE of '23' (i.e. 'Water Level').

#### V_SYS_STATUS_INT_TYPE_CODE

This view extracts the number of interval types present in the database over time.  D_VERSION_STATUS is used as the source.

#### V_SYS_STATUS_LOC_TYPE_CODE

This view extracts the number of location types present in the database over time.  D_VERSION_STATUS is used as the source.

#### V_SYS_STATUS_READING_GROUP_CODE

This view extracts the number of values associated with particular reading groups (from R_READING_GROUP_CODE) in the database over time.  D_VERSION_STATUS is used as the source.  Note that 'DIT1' or 'DIT2' is appended to indicate the original temporal source table.

#### V_SYS_SUM_INT_TYPE_COUNTS

This view, using D_VERSION_CURRENT and V_SUM_INT_TYPE_COUNTS as sources, formats interval type count data into a format for insertion into D_VERSION_STATUS.  Note that CURRENT_VERSION corresponds to the current 'yyymmdd' format.

#### V_SYS_SUM_LOC_TYPE_COUNTS

This view, using D_VERSION_CURRENT and V_SUM_LOC_TYPE_COUNTS as sources, formats location type count data into a format for insertion into D_VERSION_STATUS.  Note that CURRENT_VERSION corresponds to the current 'yyyymmdd' format.

#### V_SYS_SUM_READING_GROUP_COUNTS

This view, using D_VERSION_CURRENT and V_SUM_READING_GROUP_COUNTS as sources, formats reading group count data into a format for insertion into D_VERSION_STATUS.  Note that CURRENT_VERSION corresponds to the current 'yyyymmdd' format.

#### V_SYS_SUMMARY_DEEPEST_SCREEN_TOP

This view returns the top elevation of the deepest screened interval (from D_INTERVAL_MONITOR) and its associated assigned geologic unit code (from V_SYS_DIFA_ASSIGNED_FINAL).  

#### V_SYS_SUMMARY_GEOL_LAYER_NUM

This view returns the number of geologic layers associated with a particular location from D_GEOLOGY_LAYER.

#### V_SYS_SUMMARY_MON_FLOWING

This view returns the locations that are tagged as flowing in D_INTERVAL_MONITOR (i.e. MON_FLOWING is true).

#### V_SYS_SUMMARY_MON_NUM

This view returns the number of intervals associated with a location in D_INTERVAL.

#### V_SYS_SUMMARY_PRECIP

This view returns the minimum and maximum dates as well as the number of precipitation records by interval in D_INTERVAL_TEMPORAL_3.  The RD_NAME_CODE used is '551' (i.e. 'Precipitation (Daily Total)').

#### V_SYS_SUMMARY_PUMP

This view returns the minimum and maximum dates as well as the number of pumping records by interval in D_INTERVAL_TEMPORAL_2.  The RD_TYPE_CODE's must be '64' (i.e. 'WL - MOE Well Record - Recovery') or '65' (i.e. 'WL - MOE Well Record - Pumping') or the READING_GROUP_CODE must be '35' (i.e. 'Discharge/Production - From Wells ?').

#### V_SYS_SUMMARY_PUMP_DAILY_VOL

This view returns the minimum and maximum dates as well as the number of pumping volume records by interval in D_INTERVAL_TEMPORAL_2.  The RD_NAME_CODE used is '447' (i.e. 'Production - Pumped Volume (Total Daily)').

#### V_SYS_SUMMARY_PUMP_RATE

This view returns the maximum REC_PUMP_RATE_IGPM by location from D_PUMPTEST.  Note that REC_PUMP_RATE_IGPM must be greater than '50'.

#### V_SYS_SUMMARY_SFLOW

This view returns the minimum and maximum dates as well as the number of streamflow records by interval in D_INTERVAL_TEMPORAL_2.  In addition, minimum, maximum and average streamflow is calculated.  The RD_NAME_CODE's are '1001' (i.e. 'Stream Flow - Daily Discharge (Average)') or '70870' (i.e. 'Stream Flow (Spot Flow)').

#### V_SYS_SUMMARY_SOIL

This view calculates the number of soil samples (from D_INTERVAL) and the number of soil sample readings (from D_INTERVAL_TEMPORAL_1A/1B) for a particular location.  Note that INT_TYPE_CODE is '29' (i.e. 'Soil or Rock').

#### V_SYS_SUMMARY_SOIL_GEOTECH

This view returns counts of interval geotechnical information for each location (i.e. where it is available).  Both the temporal tables (1A/1B) and D_INTERVAL_SOIL are examined.

#### V_SYS_SUMMARY_SPEC_CAP

This view determines the minimum, maximum and number of specific capacity values by interval from D_INTERVAL_TEMPORAL_2.  The RD_NAME_CODE is '748' (i.e. 'Specific Capacity').

#### V_SYS_SUMMARY_TEMP_AIR

This view returns the minimum and maximum dates as well as the number of air temperature readings in D_INTERVAL_TEMPORAL_3.  The RD_NAME_CODE's used include '369' (i.e. 'Temperature (Air)'), '546' (i.e. 'Temperature (Air) - Daily Max'), '547' (i.e. 'Temperature (Air) - Daily Min') and '548' (i.e. 'Temperature (Air) - Daily Mean').

#### V_SYS_SUMMARY_WL

This view returns the minimum and maximum dates as well as the number of water level readings in D_INTERVAL_TEMPORAL_2.  The READING_GROUP_CODE used is '23' (i.e. 'Water Level').

#### V_SYS_SUMMARY_WL_ALL

This view returns all water level readings in D_INTERVAL_TEMPORAL_2 where the READING_GROUP_CODE is '23' (i.e. 'Water Level').

#### V_SYS_SUMMARY_WL_AVG

This view returns the average as well as the number of water level records by interval in D_INTERVAL_TEMPORAL_2 where the RD_NAME_CODE's are '628' (i.e. 'Water Level - Manual - Static') or '629' (i.e. 'Water Level - Logger (Compensated & Corrected)').  Note that UNIT_CODE must be '6' (i.e. 'masl') and the value must not be NULL.  In addition, the REC_STATUS_CODE for a record must be null or have a value of less than '100'.

#### V_SYS_SUMMARY_WL_LOGGER

This view returns the first and last date and logger water level value as well as the total number of records by interval from D_INTERVAL_TEMPORAL_2 where the RD_NAME_CODE is '629' (i.e. 'Water Level - Logger (Compensated & Corrected)').

#### V_SYS_SUMMARY_WL_MANUAL

This view is similar to V_SYS_SUMMARY_WL_MANUAL with the exception that the RD_NAME_CODE is '628' (i.e. 'Water Level - Manual - Static').

#### V_SYS_SUMMARY_WQ

This view returns the minimum and maximum dates as well as the number of water quality readings by interval in D_INTERVAL_TEMPORAL_1B.  Note that those intervals of INT_TYPE_CODE '29' (i.e. 'Soil or Rock') are excluded.

#### V_SYS_SUMMARY_WQ_SAMPLES

This view returns the number of samples by interval in D_INTERVAL_TEMPORAL_1A.  Note that the interval samples are grouped by sample date (dropping the hour and minute information, if present) to avoid possible duplication.

#### V_SYS_UGAIS_ALL

This view returns all LOC_ID's and associated INT_ID's identified as a UGAIS source (i.e. from the Ontario Borehole Database 'Urban Geology Analysis Information System').  The latter value may be a NULL (if no intervals are assigned).  The UGAIS field is populated with a '1' value; this can be used as a check in table joins.  These locations are determined by testing the text string '%ugais%' against LOC_NAME in D_LOCATION.

#### V_SYS_UGAIS_LOCATION

#### V_SYS_UGAIS_SCREEN

Similar to V_SYS_GEN_UGAIS_ALL, this view returns all LOC_ID's and INT_ID's with an identified screen type (using V_SYS_INT_TYPE_CODE_SCREEN).  No INT_ID values will be NULL.

#### V_SYS_UGAIS_SOIL

Similar to V_SYS_GEN_UGAIS_SCREEN, this view returns all LOC_ID's and INT_ID's with an INT_TYPE_CODE of '29' (i.e. 'Soil or Rock').

#### V_SYS_S_USER_ID_RANGES

This view returns the user identifier ranges (as specified through SiteFX; this is based on names assigned to licensed accounts) as found in the S_USER table tagged with 'uniqueIDranges'.  These range-of-values should conform to those specified in the various V_SYS_RANDOM_ID_* views, above.

#### V_SYS_VERSION_CURRENT

This view returns the database version from D_VERSION_CURRENT and assigns the current date to CUT_DATE.  This is used to record the current database version and date-stamp exported datasets. 

#### V_SYS_W_GENERAL

This view is used to populate the W_GENERAL table (generally weekly) and consisting of those locations present in D_BOREHOLE.  Various substitutions, in general, are made (for viewing purposes): NULL values are converted to '0'; NULL date fields are converted to NA; the bedrock elevation has a text field (in addition to the numeric) where a NULL is converted to NA; the flowing field has a text field (in addition to the numeric) where a 'Y' or 'N' is added, appropriately.  Note that only those locations present in V_SYS_AGENCY_YPDT are included here.  Those locations with LOC_TYPE_CODE of '20' (i.e. 'Archive') are also not present.

A number of data tables and views are accessed to extract information, these include:

* V_CON_GENERAL
* D_LOCATION_GEOM
* D_LOCATION_SUMMARY
* V_SYS_MOE_WELL_ID
* D_LOCATION_PURPOSE
* D_BOREHOLE
* V_SYS_SUMMARY_MON_FLOWING
* V_SYS_SUMMARY_FLOW_RATE
* D_LOCATION

#### V_SYS_W_GENERAL_DOCUMENT

This view is used to populate the W_GENERAL_DOCUMENT table (generally weekly).  This includes the bibliographic information for each document (using V_GEN_DOCUMENT_BIBLIOGRAPHY) and their coordinates along with their sptail geometry (if available).

#### V_SYS_W_GENERAL_GW_LEVEL_LOG

This view is used to populate the W_GENERAL_GW_LEVEL table (generally weekly) with logger water levels.  Here, the daily water level average and number of records are extracted from V_GEN_WATER_LEVEL_AVG_DAILY_LOGGER while the date is converted to 'mm/dd/yyyy' format and the RD_NAME_CODE changed to '645' (i.e. 'Water Level - Logger - Calc - Daily Average').  Note that only intervals where the WL_LOGGER_TOTAL_NUM is greater than '25' (or the WL_LOGGER_TOTAL_NUM plus the WL_MANUAL_TOTAL_NUM is greater than '25') are included.  The latter two fields are found in D_INTERVAL_SUMMARY.

#### V_SYS_W_GENERAL_GW_LEVEL_MAN

This view is used to populate the W_GENERAL_GW_LEVEL table (generally weekly) with manual water levels.  Here, the manual water levels are extracted from D_INTERVAL_TEMPORAL_2 where the RD_NAME_CODE is '628' (i.e. 'Water Level - Manual - Static').  Note that only intervals where the WL_LOGGER_TOTAL_NUM or WL_MANUAL_TOTAL_NUM (or the combination) is greater than '25' are included here.  These two fields are found in D_INTERVAL_SUMMARY.  In addition, note that the field name used WL_AVG_MASL does not apply to manuals (i.e. they are not an average).  No NULL RD_DATE's are included.

#### V_SYS_W_GENERAL_OTHER

This view is used to populate the W_GENERAL_OTHER table (generally weekly).  Only the following location types are included (LOC_TYPE_CODE in brackets):

* Surface Water ('6')
* Climate Station ('9')
* Pumping Station ('10')
* Seismic Station ('15')
* Permit to Take Water ('22')

Refer to V_SYS_W_GENERAL (above) for additional details and changes.  A number of data tables and views are accessed to extract information, these include:

* V_GEN
* V_SYS_GENERAL_INTERVAL
* D_LOCATION_GEOM
* D_LOCATION_SUMMARY
* D_INTERVAL_SUMMARY
* D_LOCATION_PURPOSE
* V_GEN_PTTW

#### V_SYS_W_GENERAL_OTHER_PTTW_ACTIVE

This view is used to change the status of 'permit to take water' (PTTW) locations in W_GENERAL_OTHER (using the STATUS field).  If the PTTW_EXPIRYDATE is in the future or within 6 months of the present the LOC_STATUS_DESCRIPTION 'PTTW Active' (i.e. LOC_STATUS_CODE '19') is returned.

#### V_SYS_W_GENERAL_SCREEN

This view is used to populate the W_GENERAL_SCREEN table (generally weekly).  Refer to V_SYS_W_GENERAL (above) for additional details and changes.  A number of data tables and views are access to extract information, these include:

* V_CON_HYDROGEOLOGY
* D_LOCATION_GEOM
* D_LOCATION_SUMMARY
* D_LOCATION_PURPOSE
* W_GENERAL
* V_SYS_DIFA_ASSIGNED_FINAL
* D_BOREHOLE
* V_SYS_W_GENERAL_SCREEN_NEST

#### V_SYS_W_GENERAL_SCREEN_NEST

This view returns those locations that have been tagged as belonging to a 'nest' of wells (i.e. a grouping of wells usually from the same general area); the GROUP_LOC_CODE (from D_GROUP_LOCATION) is included.  Note that these groupings will correspond to GROUP_LOC_TYPE_CODE '6' (i.e. 'Well Nest').

#### V_SYS_WATERLEVELS_BARO_DAILY

This view returns the number of barologger readings on a particular day for a particular interval.  Only those intervals classified as 'Barometric Logger Interval' ('122') are examined.  The RD_NAME_CODE must be '629' ('Water Level - Logger (Compensated & Corrected)' with a UNIT_CODE of '128' ('cmap baro') for a record (from D_INTERVAL_TEMPORAL_2) to be included.  Note that each of year, month and day are returned as separate integer fields.

#### V_SYS_WATERLEVELS_BARO_YEARLY

This view returns the minimum and maximum barologger readings as well as starting and ending dates (for the data) on a yearly basis, by interval.  The number of days with barologger data is also indicated (using V_SYS_WATERLEVELS_BARO_DAILY).

#### V_SYS_WATERLEVELS_MANUAL_FIRST

This view returns the first manual water level from D_INTERVAL_TEMPORAL_2 for each interval.  These will have a RD_NAME_CODE of '628' (i.e. 'Water Level - Manual - Static'); the date is converted to 'mm/dd/yyyy'.

#### V_SYS_WATERLEVELS_RANGE

This view returns the minimum, maximum and average value as well as number of water level records from D_INTERVAL_TEMPORAL_2 for each interval.  These will have an RD_NAME_CODE of '628' (i.e. 'Water Level - Manual - Static') or '629' (i.e. 'Water Level - Logger (Compensated & Corrected)') as well as a UNIT_CODE of '6' (i.e. 'masl').

#### V_SYS_WATERLEVELS_YEARLY_AVG

This view returns the minimum, maximum and average value as well as the number of water level records from V_CON_HYDROGEOLOGY for each interval for each year of data.  The same reading name codes and unit codes as V_SYS_WATERLEVELS_RANGE (above) are used.  In addition, only those intervals that have greater than 25 water level records are included.  

#### V_SYS_WATERLEVELS_YEARLY_BOTH

This view returns the calculated minimum, maximum and average value as well as the number of water level records from D_INTERVAL_TEMPORAL_2 for each interval for each year of data.  This is similar to V_SYS_WATERLEVELS_YEARLY_LOGGER and V_SYS_WATERLEVELS_YEARLY_MANUAL (below) with the exception that the logger and manual data is combined to determine the values.

#### V_SYS_WATERLEVELS_YEARLY_LOGGER

This view returns the calculated minimum, maximum and average value as well as the number of water level records from D_INTERVAL_TEMPORAL_2 for each interval for each year of data.  These records must have an RD_NAME_CODE of '629' (i.e. 'Water Level - Logger (Compensated & Corrected)') and a UNIT_CODE of '6' (i.e. 'masl').

#### V_SYS_WATERLEVELS_YEARLY_MANUAL

This view is similar to V_SYS_WATERLEVELS_YEARLY_LOGGER (above) with the exception that the records use an RD_NAME_CODE of '628' (i.e. 'Water Level - Manual - Static').

#### V_SYS_YPDT_VL_GEOLOGY

This view was originally a source for V_VL_GEOLOGY that enabled inclusion of the 'YPDT Viewlog Header Well'.  This has now been disabled and this view will be removed in a future database version.

#### V_SYS_YPDT_VL_HEADER_LOG

This view was originally a source for V_VL_HEADER_LOG.  Refer to V_SYS_YPDT_VL_GEOLOGY (above) for additional details.

#### V_SYS_YPDT_VL_HEADER_SCREEN

This view was originally a source for V_VL_HEADER_SCREEN.  Refer to V_SYS_YPDT_VL_GEOLOGY (above) for additional details.

#### V_SYS_YPDT_VL_HEADER_WELL

This view returns the information in D_LOCATION related to the 'YPDT Viewlog Header Well'.



