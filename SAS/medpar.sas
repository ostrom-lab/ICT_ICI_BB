filename medpar 'RawData/medpar*.txt';                   
/* reading in an un-zipped file */

DATA MEDPAR;
  INFILE medpar lrecl=2127 missover pad;
  INPUT
    @00001 PATIENT_ID                       $char15.  /*  Patient ID (for either Cancer or Non-Cancer Patients) */
    @00016 MEDPAR_ID                        $CHAR15.  /*  Encrypted  */
    @00031 MEDPAR_YR_NUM                    $CHAR4.
    @00035 NCH_CLM_TYPE_CD                  $CHAR2.
    @00037 BENE_IDENT_CD                    $CHAR2.
    @00039 EQTBL_BIC_CD                     $CHAR2.
    @00041 BENE_AGE_CNT                     4.
    @00045 BENE_SEX_CD                      $CHAR1.
    @00046 BENE_RACE_CD                     $CHAR1.
    @00047 BENE_MDCR_STUS_CD                $CHAR2.
    @00049 BENE_RSDNC_SSA_STATE_CD          $CHAR2.
    @00051 BENE_RSDNC_SSA_CNTY_CD           $CHAR3.
    @00054 BENE_MLG_CNTCT_ZIP_CD            $CHAR5.   /*  Encrypted  */
    @00059 BENE_DSCHRG_STUS_CD              $CHAR1.
    @00060 FICARR_IDENT_NUM                 $CHAR5.
    @00065 WRNG_IND_CD                      $CHAR18.
    @00083 GHO_PD_CD                        $CHAR1.
    @00084 PPS_IND_CD                       $CHAR1.
    @00085 ORG_NPI_NUM                      $CHAR10.  /*  Encrypted  */
    @00095 PRVDR_NUM                        $CHAR6.   /*  Encrypted  */
    @00105 PRVDR_NUM_SPCL_UNIT_CD           $CHAR1.
    @00106 SS_LS_SNF_IND_CD                 $CHAR1.
    @00107 ACTV_XREF_IND                    $CHAR1.
    @00108 SLCT_RSN_CD                      $CHAR1.
    @00109 STAY_FINL_ACTN_CLM_CNT           5.
    @00114 LTST_CLM_ACRTN_DT                $char8.  /*  YYMMDD8  */
    @00122 BENE_MDCR_BNFT_EXHST_DT          $char8.  /*  YYMMDD8  */
    @00130 SNF_QUALN_FROM_DT                $char8.  /*  YYMMDD8  */
    @00138 SNF_QUALN_THRU_DT                $char8.  /*  YYMMDD8  */
    @00146 SRC_IP_ADMSN_CD                  $CHAR1.
    @00147 IP_ADMSN_TYPE_CD                 $CHAR1.
    @00148 ADMSN_DAY_CD                     $CHAR1.
    @00149 ADMSN_DT                         $char8.  /*  YYMMDD8  */
    @00157 DSCHRG_DT                        $char8.  /*  YYMMDD8  */
    @00165 DSCHRG_DSTNTN_CD                 $CHAR2.
    @00167 CVRD_LVL_CARE_THRU_DT            $char8.  /*  YYMMDD8  */
    @00175 BENE_DEATH_DT                    $char8.  /*  YYMMDD8  */
    @00183 BENE_DEATH_DT_VRFY_CD            $CHAR1.
    @00184 ADMSN_DEATH_DAY_CNT              7.
    @00191 INTRNL_USE_SSI_IND_CD            $CHAR1.
    @00192 INTRNL_USE_SSI_DAY_CNT           7.
    @00199 INTRNL_USE_SSI_DATA              $CHAR1.
    @00200 INTRNL_USE_IPSB_CD               $CHAR3.
    @00203 INTRNL_USE_FIL_DT_CD             $CHAR1.
    @00204 INTRNL_USE_SMPL_SIZE_CD          $CHAR1.
    @00205 LOS_DAY_CNT                      7.
    @00212 OUTLIER_DAY_CNT                  5.
    @00217 UTLZTN_DAY_CNT                   7.
    @00224 TOT_COINSRNC_DAY_CNT             5.
    @00229 BENE_LRD_USE_CNT                 5.
    @00234 BENE_PTA_COINSRNC_AMT            10.
    @00244 BENE_IP_DDCTBL_AMT               10.
    @00254 BENE_BLOOD_DDCTBL_AMT            10.
    @00264 BENE_PRMRY_PYR_CD                $CHAR1.
    @00265 BENE_PRMRY_PYR_AMT               10.
    @00275 DRG_CD                           $CHAR3.
    @00278 DRG_OUTLIER_STAY_CD              $CHAR1.
    @00279 DRG_OUTLIER_PMT_AMT              10.
    @00289 DRG_PRICE_AMT                    10.
    @00299 IP_DSPRPRTNT_SHR_AMT             10.
    @00309 IME_AMT                          10.
    @00319 PASS_THRU_AMT                    10.
    @00329 TOT_PPS_CPTL_AMT                 10.
    @00339 IP_LOW_VOL_PYMT_AMT              10.
    @00349 TOT_CHRG_AMT                     10.
    @00359 TOT_CVR_CHRG_AMT                 10.
    @00369 MDCR_PMT_AMT                     10.
    @00379 ACMDTNS_TOT_CHRG_AMT             10.
    @00389 DPRTMNTL_TOT_CHRG_AMT            10.
    @00399 PRVT_ROOM_DAY_CNT                5.
    @00404 SEMIPRVT_ROOM_DAY_CNT            5.
    @00409 WARD_DAY_CNT                     5.
    @00414 INTNSV_CARE_DAY_CNT              5.
    @00419 CRNRY_CARE_DAY_CNT               5.
    @00424 PRVT_ROOM_CHRG_AMT               10.
    @00434 SEMIPRVT_ROOM_CHRG_AMT           10.
    @00444 WARD_CHRG_AMT                    10.
    @00454 INTNSV_CARE_CHRG_AMT             10.
    @00464 CRNRY_CARE_CHRG_AMT              10.
    @00474 OTHR_SRVC_CHRG_AMT               10.
    @00484 PHRMCY_CHRG_AMT                  10.
    @00494 MDCL_SUPLY_CHRG_AMT              10.
    @00504 DME_CHRG_AMT                     10.
    @00514 USED_DME_CHRG_AMT                10.
    @00524 PHYS_THRPY_CHRG_AMT              10.
    @00534 OCPTNL_THRPY_CHRG_AMT            10.
    @00544 SPCH_PTHLGY_CHRG_AMT             10.
    @00554 INHLTN_THRPY_CHRG_AMT            10.
    @00564 BLOOD_CHRG_AMT                   10.
    @00574 BLOOD_ADMIN_CHRG_AMT             10.
    @00584 BLOOD_PT_FRNSH_QTY               5.
    @00589 OPRTG_ROOM_CHRG_AMT              10.
    @00599 LTHTRPSY_CHRG_AMT                10.
    @00609 CRDLGY_CHRG_AMT                  10.
    @00619 ANSTHSA_CHRG_AMT                 10.
    @00629 LAB_CHRG_AMT                     10.
    @00639 RDLGY_CHRG_AMT                   10.
    @00649 MRI_CHRG_AMT                     10.
    @00659 OP_SRVC_CHRG_AMT                 10.
    @00669 ER_CHRG_AMT                      10.
    @00679 AMBLNC_CHRG_AMT                  10.
    @00689 PROFNL_FEES_CHRG_AMT             10.
    @00699 ORGN_ACQSTN_CHRG_AMT             10.
    @00709 ESRD_REV_SETG_CHRG_AMT           10.
    @00719 CLNC_VISIT_CHRG_AMT              10.
    @00729 ICU_IND_CD                       $CHAR1.
    @00730 CRNRY_CARE_IND_CD                $CHAR1.
    @00731 PHRMCY_IND_CD                    $CHAR1.
    @00732 TRNSPLNT_IND_CD                  $CHAR1.
    @00733 RDLGY_ONCLGY_IND_SW              $CHAR1.
    @00734 RDLGY_DGNSTC_IND_SW              $CHAR1.
    @00735 RDLGY_THRPTC_IND_SW              $CHAR1.
    @00736 RDLGY_NUCLR_MDCN_IND_SW          $CHAR1.
    @00737 RDLGY_CT_SCAN_IND_SW             $CHAR1.
    @00738 RDLGY_OTHR_IMGNG_IND_SW          $CHAR1.
    @00739 OP_SRVC_IND_CD                   $CHAR1.
    @00740 ORGN_ACQSTN_IND_CD               $CHAR2.
    @00742 ESRD_COND_CD                     $CHAR2.
    @00744 ESRD_SETG_IND_1_CD               $CHAR2.
    @00746 ESRD_SETG_IND_2_CD               $CHAR2.
    @00748 ESRD_SETG_IND_3_CD               $CHAR2.
    @00750 ESRD_SETG_IND_4_CD               $CHAR2.
    @00752 ESRD_SETG_IND_5_CD               $CHAR2.
    @00754 ADMTG_DGNS_CD                    $CHAR7.
    @00761 ADMTG_DGNS_VRSN_CD               $CHAR1.
    @00762 DGNS_CD_CNT                      3.
    @00765 DGNS_VRSN_CD                     $CHAR1.
    @00766 DGNS_VRSN_CD_1                   $CHAR1.
    @00767 DGNS_VRSN_CD_2                   $CHAR1.
    @00768 DGNS_VRSN_CD_3                   $CHAR1.
    @00769 DGNS_VRSN_CD_4                   $CHAR1.
    @00770 DGNS_VRSN_CD_5                   $CHAR1.
    @00771 DGNS_VRSN_CD_6                   $CHAR1.
    @00772 DGNS_VRSN_CD_7                   $CHAR1.
    @00773 DGNS_VRSN_CD_8                   $CHAR1.
    @00774 DGNS_VRSN_CD_9                   $CHAR1.
    @00775 DGNS_VRSN_CD_10                  $CHAR1.
    @00776 DGNS_VRSN_CD_11                  $CHAR1.
    @00777 DGNS_VRSN_CD_12                  $CHAR1.
    @00778 DGNS_VRSN_CD_13                  $CHAR1.
    @00779 DGNS_VRSN_CD_14                  $CHAR1.
    @00780 DGNS_VRSN_CD_15                  $CHAR1.
    @00781 DGNS_VRSN_CD_16                  $CHAR1.
    @00782 DGNS_VRSN_CD_17                  $CHAR1.
    @00783 DGNS_VRSN_CD_18                  $CHAR1.
    @00784 DGNS_VRSN_CD_19                  $CHAR1.
    @00785 DGNS_VRSN_CD_20                  $CHAR1.
    @00786 DGNS_VRSN_CD_21                  $CHAR1.
    @00787 DGNS_VRSN_CD_22                  $CHAR1.
    @00788 DGNS_VRSN_CD_23                  $CHAR1.
    @00789 DGNS_VRSN_CD_24                  $CHAR1.
    @00790 DGNS_VRSN_CD_25                  $CHAR1.
    @00791 DGNS_1_CD                        $CHAR7.
    @00798 DGNS_2_CD                        $CHAR7.
    @00805 DGNS_3_CD                        $CHAR7.
    @00812 DGNS_4_CD                        $CHAR7.
    @00819 DGNS_5_CD                        $CHAR7.
    @00826 DGNS_6_CD                        $CHAR7.
    @00833 DGNS_7_CD                        $CHAR7.
    @00840 DGNS_8_CD                        $CHAR7.
    @00847 DGNS_9_CD                        $CHAR7.
    @00854 DGNS_10_CD                       $CHAR7.
    @00861 DGNS_11_CD                       $CHAR7.
    @00868 DGNS_12_CD                       $CHAR7.
    @00875 DGNS_13_CD                       $CHAR7.
    @00882 DGNS_14_CD                       $CHAR7.
    @00889 DGNS_15_CD                       $CHAR7.
    @00896 DGNS_16_CD                       $CHAR7.
    @00903 DGNS_17_CD                       $CHAR7.
    @00910 DGNS_18_CD                       $CHAR7.
    @00917 DGNS_19_CD                       $CHAR7.
    @00924 DGNS_20_CD                       $CHAR7.
    @00931 DGNS_21_CD                       $CHAR7.
    @00938 DGNS_22_CD                       $CHAR7.
    @00945 DGNS_23_CD                       $CHAR7.
    @00952 DGNS_24_CD                       $CHAR7.
    @00959 DGNS_25_CD                       $CHAR7.
    @00966 DGNS_POA_CD                      $CHAR10.
    @00976 POA_DGNS_CD_CNT                  3.
    @00979 POA_DGNS_1_IND_CD                $CHAR1.
    @00980 POA_DGNS_2_IND_CD                $CHAR1.
    @00981 POA_DGNS_3_IND_CD                $CHAR1.
    @00982 POA_DGNS_4_IND_CD                $CHAR1.
    @00983 POA_DGNS_5_IND_CD                $CHAR1.
    @00984 POA_DGNS_6_IND_CD                $CHAR1.
    @00985 POA_DGNS_7_IND_CD                $CHAR1.
    @00986 POA_DGNS_8_IND_CD                $CHAR1.
    @00987 POA_DGNS_9_IND_CD                $CHAR1.
    @00988 POA_DGNS_10_IND_CD               $CHAR1.
    @00989 POA_DGNS_11_IND_CD               $CHAR1.
    @00990 POA_DGNS_12_IND_CD               $CHAR1.
    @00991 POA_DGNS_13_IND_CD               $CHAR1.
    @00992 POA_DGNS_14_IND_CD               $CHAR1.
    @00993 POA_DGNS_15_IND_CD               $CHAR1.
    @00994 POA_DGNS_16_IND_CD               $CHAR1.
    @00995 POA_DGNS_17_IND_CD               $CHAR1.
    @00996 POA_DGNS_18_IND_CD               $CHAR1.
    @00997 POA_DGNS_19_IND_CD               $CHAR1.
    @00998 POA_DGNS_20_IND_CD               $CHAR1.
    @00999 POA_DGNS_21_IND_CD               $CHAR1.
    @01000 POA_DGNS_22_IND_CD               $CHAR1.
    @01001 POA_DGNS_23_IND_CD               $CHAR1.
    @01002 POA_DGNS_24_IND_CD               $CHAR1.
    @01003 POA_DGNS_25_IND_CD               $CHAR1.
    @01004 DGNS_E_CD_CNT                    3.
    @01007 DGNS_E_VRSN_CD                   $CHAR1.
    @01008 DGNS_E_VRSN_CD_1                 $CHAR1.
    @01009 DGNS_E_VRSN_CD_2                 $CHAR1.
    @01010 DGNS_E_VRSN_CD_3                 $CHAR1.
    @01011 DGNS_E_VRSN_CD_4                 $CHAR1.
    @01012 DGNS_E_VRSN_CD_5                 $CHAR1.
    @01013 DGNS_E_VRSN_CD_6                 $CHAR1.
    @01014 DGNS_E_VRSN_CD_7                 $CHAR1.
    @01015 DGNS_E_VRSN_CD_8                 $CHAR1.
    @01016 DGNS_E_VRSN_CD_9                 $CHAR1.
    @01017 DGNS_E_VRSN_CD_10                $CHAR1.
    @01018 DGNS_E_VRSN_CD_11                $CHAR1.
    @01019 DGNS_E_VRSN_CD_12                $CHAR1.
    @01020 DGNS_E_1_CD                      $CHAR7.
    @01027 DGNS_E_2_CD                      $CHAR7.
    @01034 DGNS_E_3_CD                      $CHAR7.
    @01041 DGNS_E_4_CD                      $CHAR7.
    @01048 DGNS_E_5_CD                      $CHAR7.
    @01055 DGNS_E_6_CD                      $CHAR7.
    @01062 DGNS_E_7_CD                      $CHAR7.
    @01069 DGNS_E_8_CD                      $CHAR7.
    @01076 DGNS_E_9_CD                      $CHAR7.
    @01083 DGNS_E_10_CD                     $CHAR7.
    @01090 DGNS_E_11_CD                     $CHAR7.
    @01097 DGNS_E_12_CD                     $CHAR7.
    @01104 POA_DGNS_E_CD_CNT                3.
    @01107 POA_DGNS_E_1_IND_CD              $CHAR1.
    @01108 POA_DGNS_E_2_IND_CD              $CHAR1.
    @01109 POA_DGNS_E_3_IND_CD              $CHAR1.
    @01110 POA_DGNS_E_4_IND_CD              $CHAR1.
    @01111 POA_DGNS_E_5_IND_CD              $CHAR1.
    @01112 POA_DGNS_E_6_IND_CD              $CHAR1.
    @01113 POA_DGNS_E_7_IND_CD              $CHAR1.
    @01114 POA_DGNS_E_8_IND_CD              $CHAR1.
    @01115 POA_DGNS_E_9_IND_CD              $CHAR1.
    @01116 POA_DGNS_E_10_IND_CD             $CHAR1.
    @01117 POA_DGNS_E_11_IND_CD             $CHAR1.
    @01118 POA_DGNS_E_12_IND_CD             $CHAR1.
    @01119 SRGCL_PRCDR_IND_SW               $CHAR1.
    @01120 SRGCL_PRCDR_CD_CNT               3.
    @01123 SRGCL_PRCDR_VRSN_CD              $CHAR1.
    @01124 SRGCL_PRCDR_VRSN_CD_1            $CHAR1.
    @01125 SRGCL_PRCDR_VRSN_CD_2            $CHAR1.
    @01126 SRGCL_PRCDR_VRSN_CD_3            $CHAR1.
    @01127 SRGCL_PRCDR_VRSN_CD_4            $CHAR1.
    @01128 SRGCL_PRCDR_VRSN_CD_5            $CHAR1.
    @01129 SRGCL_PRCDR_VRSN_CD_6            $CHAR1.
    @01130 SRGCL_PRCDR_VRSN_CD_7            $CHAR1.
    @01131 SRGCL_PRCDR_VRSN_CD_8            $CHAR1.
    @01132 SRGCL_PRCDR_VRSN_CD_9            $CHAR1.
    @01133 SRGCL_PRCDR_VRSN_CD_10           $CHAR1.
    @01134 SRGCL_PRCDR_VRSN_CD_11           $CHAR1.
    @01135 SRGCL_PRCDR_VRSN_CD_12           $CHAR1.
    @01136 SRGCL_PRCDR_VRSN_CD_13           $CHAR1.
    @01137 SRGCL_PRCDR_VRSN_CD_14           $CHAR1.
    @01138 SRGCL_PRCDR_VRSN_CD_15           $CHAR1.
    @01139 SRGCL_PRCDR_VRSN_CD_16           $CHAR1.
    @01140 SRGCL_PRCDR_VRSN_CD_17           $CHAR1.
    @01141 SRGCL_PRCDR_VRSN_CD_18           $CHAR1.
    @01142 SRGCL_PRCDR_VRSN_CD_19           $CHAR1.
    @01143 SRGCL_PRCDR_VRSN_CD_20           $CHAR1.
    @01144 SRGCL_PRCDR_VRSN_CD_21           $CHAR1.
    @01145 SRGCL_PRCDR_VRSN_CD_22           $CHAR1.
    @01146 SRGCL_PRCDR_VRSN_CD_23           $CHAR1.
    @01147 SRGCL_PRCDR_VRSN_CD_24           $CHAR1.
    @01148 SRGCL_PRCDR_VRSN_CD_25           $CHAR1.
    @01149 SRGCL_PRCDR_1_CD                 $CHAR7.
    @01156 SRGCL_PRCDR_2_CD                 $CHAR7.
    @01163 SRGCL_PRCDR_3_CD                 $CHAR7.
    @01170 SRGCL_PRCDR_4_CD                 $CHAR7.
    @01177 SRGCL_PRCDR_5_CD                 $CHAR7.
    @01184 SRGCL_PRCDR_6_CD                 $CHAR7.
    @01191 SRGCL_PRCDR_7_CD                 $CHAR7.
    @01198 SRGCL_PRCDR_8_CD                 $CHAR7.
    @01205 SRGCL_PRCDR_9_CD                 $CHAR7.
    @01212 SRGCL_PRCDR_10_CD                $CHAR7.
    @01219 SRGCL_PRCDR_11_CD                $CHAR7.
    @01226 SRGCL_PRCDR_12_CD                $CHAR7.
    @01233 SRGCL_PRCDR_13_CD                $CHAR7.
    @01240 SRGCL_PRCDR_14_CD                $CHAR7.
    @01247 SRGCL_PRCDR_15_CD                $CHAR7.
    @01254 SRGCL_PRCDR_16_CD                $CHAR7.
    @01261 SRGCL_PRCDR_17_CD                $CHAR7.
    @01268 SRGCL_PRCDR_18_CD                $CHAR7.
    @01275 SRGCL_PRCDR_19_CD                $CHAR7.
    @01282 SRGCL_PRCDR_20_CD                $CHAR7.
    @01289 SRGCL_PRCDR_21_CD                $CHAR7.
    @01296 SRGCL_PRCDR_22_CD                $CHAR7.
    @01303 SRGCL_PRCDR_23_CD                $CHAR7.
    @01310 SRGCL_PRCDR_24_CD                $CHAR7.
    @01317 SRGCL_PRCDR_25_CD                $CHAR7.
    @01324 SRGCL_PRCDR_DT_CNT               3.
    @01327 SRGCL_PRCDR_PRFRM_1_DT           $char8.  /*  YYMMDD8  */
    @01335 SRGCL_PRCDR_PRFRM_2_DT           $char8.  /*  YYMMDD8  */
    @01343 SRGCL_PRCDR_PRFRM_3_DT           $char8.  /*  YYMMDD8  */
    @01351 SRGCL_PRCDR_PRFRM_4_DT           $char8.  /*  YYMMDD8  */
    @01359 SRGCL_PRCDR_PRFRM_5_DT           $char8.  /*  YYMMDD8  */
    @01367 SRGCL_PRCDR_PRFRM_6_DT           $char8.  /*  YYMMDD8  */
    @01375 SRGCL_PRCDR_PRFRM_7_DT           $char8.  /*  YYMMDD8  */
    @01383 SRGCL_PRCDR_PRFRM_8_DT           $char8.  /*  YYMMDD8  */
    @01391 SRGCL_PRCDR_PRFRM_9_DT           $char8.  /*  YYMMDD8  */
    @01399 SRGCL_PRCDR_PRFRM_10_DT          $char8.  /*  YYMMDD8  */
    @01407 SRGCL_PRCDR_PRFRM_11_DT          $char8.  /*  YYMMDD8  */
    @01415 SRGCL_PRCDR_PRFRM_12_DT          $char8.  /*  YYMMDD8  */
    @01423 SRGCL_PRCDR_PRFRM_13_DT          $char8.  /*  YYMMDD8  */
    @01431 SRGCL_PRCDR_PRFRM_14_DT          $char8.  /*  YYMMDD8  */
    @01439 SRGCL_PRCDR_PRFRM_15_DT          $char8.  /*  YYMMDD8  */
    @01447 SRGCL_PRCDR_PRFRM_16_DT          $char8.  /*  YYMMDD8  */
    @01455 SRGCL_PRCDR_PRFRM_17_DT          $char8.  /*  YYMMDD8  */
    @01463 SRGCL_PRCDR_PRFRM_18_DT          $char8.  /*  YYMMDD8  */
    @01471 SRGCL_PRCDR_PRFRM_19_DT          $char8.  /*  YYMMDD8  */
    @01479 SRGCL_PRCDR_PRFRM_20_DT          $char8.  /*  YYMMDD8  */
    @01487 SRGCL_PRCDR_PRFRM_21_DT          $char8.  /*  YYMMDD8  */
    @01495 SRGCL_PRCDR_PRFRM_22_DT          $char8.  /*  YYMMDD8  */
    @01503 SRGCL_PRCDR_PRFRM_23_DT          $char8.  /*  YYMMDD8  */
    @01511 SRGCL_PRCDR_PRFRM_24_DT          $char8.  /*  YYMMDD8  */
    @01519 SRGCL_PRCDR_PRFRM_25_DT          $char8.  /*  YYMMDD8  */
    @01527 CLM_PTNT_RLTNSHP_CD              $CHAR2.
    @01529 CARE_IMPRVMT_MODEL_1_CD          $CHAR2.
    @01531 CARE_IMPRVMT_MODEL_2_CD          $CHAR2.
    @01533 CARE_IMPRVMT_MODEL_3_CD          $CHAR2.
    @01535 CARE_IMPRVMT_MODEL_4_CD          $CHAR2.
    @01537 VBP_PRTCPNT_IND_CD               $CHAR1.
    @01538 HRR_PRTCPNT_IND_CD               $CHAR1.
    @01539 BNDLD_MODEL_DSCNT_PCT            7.4
    @01546 VBP_ADJSTMT_PCT                  15.12
    @01561 HRR_ADJSTMT_PCT                  8.5
    @01569 INFRMTL_ENCTR_IND_SW             $CHAR1.
    @01570 MA_TCHNG_IND_SW                  $CHAR1.
    @01571 PROD_RPLCMT_LIFECYC_SW           $CHAR1.
    @01572 PROD_RPLCMT_RCLL_SW              $CHAR1.
    @01573 CRED_RCVD_RPLCD_DVC_SW           $CHAR1.
    @01574 OBSRVTN_SW                       $CHAR1.
    @01575 NEW_TCHNLGY_ADD_ON_AMT           10.
    @01585 BASE_OPRTG_DRG_AMT               10.
    @01595 OPRTG_HSP_AMT                    10.
    @01605 MDCL_SRGCL_GNRL_AMT              10.
    @01615 MDCL_SRGCL_NSTRL_AMT             10.
    @01625 MDCL_SRGCL_STRL_AMT              10.
    @01635 TAKE_HOME_AMT                    10.
    @01645 PRSTHTC_ORTHTC_AMT               10.
    @01655 MDCL_SRGCL_PCMKR_AMT             10.
    @01665 INTRAOCULAR_LENS_AMT             10.
    @01675 OXYGN_TAKE_HOME_AMT              10.
    @01685 OTHR_IMPLANTS_AMT                10.
    @01695 OTHR_SUPLIES_DVC_AMT             10.
    @01705 INCDNT_RDLGY_AMT                 10.
    @01715 INCDNT_DGNSTC_SRVCS_AMT          10.
    @01725 MDCL_SRGCL_DRSNG_AMT             10.
    @01735 INVSTGTNL_DVC_AMT                10.
    @01745 MDCL_SRGCL_MISC_AMT              10.
    @01755 RDLGY_ONCOLOGY_AMT               10.
    @01765 RDLGY_DGNSTC_AMT                 10.
    @01775 RDLGY_THRPTC_AMT                 10.
    @01785 RDLGY_NUCLR_MDCN_AMT             10.
    @01795 RDLGY_CT_SCAN_AMT                10.
    @01805 RDLGY_OTHR_IMGNG_AMT             10.
    @01815 OPRTG_ROOM_AMT                   10.
    @01825 OR_LABOR_DLVRY_AMT               10.
    @01835 CRDC_CATHRZTN_AMT                10.
    @01845 SQSTRTN_RDCTN_AMT                10.
    @01855 UNCOMPD_CARE_PYMT_AMT            10.
    @01865 BNDLD_ADJSTMT_AMT                10.
    @01875 VBP_ADJSTMT_AMT                  10.
    @01885 HRR_ADJSTMT_AMT                  10.
    @01895 EHR_PYMT_ADJSTMT_AMT             10.
    @01905 PPS_STD_VAL_PYMT_AMT             10.
    @01915 FINL_STD_AMT                     10.
    @01925 HAC_RDCTN_PMT_AMT                10.
    @01935 IPPS_FLEX_PYMT_7_AMT             10.
    @01945 PTNT_ADD_ON_PYMT_AMT             10.
    @01955 HAC_PGM_RDCTN_IND_SW             $CHAR1.
    @01956 PGM_RDCTN_IND_SW                 $CHAR1.
    @01957 PA_IND_CD                        $CHAR4.
    @01961 UNIQ_TRKNG_NUM                   $CHAR14.  /*  Encrypted  */
    @01975 STAY_2_IND_SW                    $CHAR1.
    @01976 CLM_SITE_NTRL_PYMT_CST_AMT       10.
    @01986 CLM_SITE_NTRL_PYMT_IPPS_AMT      10.
    @01996 CLM_FULL_STD_PYMT_AMT            10.
    @02006 CLM_SS_OUTLIER_STD_PYMT_AMT      10.
    @02016 CLM_NGACO_IND_1_CD               $CHAR1.
    @02017 CLM_NGACO_IND_2_CD               $CHAR1.
    @02018 CLM_NGACO_IND_3_CD               $CHAR1.
    @02019 CLM_NGACO_IND_4_CD               $CHAR1.
    @02020 CLM_NGACO_IND_5_CD               $CHAR1.
    @02021 CLM_RSDL_PYMT_IND_CD             $CHAR1.
    @02022 CLM_RP_IND_CD                    $CHAR1.
    @02023 RC_RP_IND_CD                     $CHAR1.
    @02024 ACO_ID_NUM                       $CHAR10.  /*  Encrypted  */
    @02034 RC_ALLOGENEIC_STEM_CELL_AMT      10.
    @02044 ISLET_ADD_ON_PYMT_AMT            10.
    @02054 CLM_IP_INITL_MS_DRG_CD           $CHAR4.
    @02058 VAL_CD_Q1_PYMT_RDCTN_AMT         10.
    @02068 CLM_MODEL_REIMBRSMT_AMT          10.
    @02078 RC_MODEL_REIMBRSMT_AMT           10.
    @02088 VAL_CD_QB_OCM_PYMT_ADJSTMT_AMT   10.
    @02098 CELL_GENE_THRPY_PRCDRS_TOT_AMT   10.
    @02108 CELL_THRPY_DRUGS_TOT_AMT         10.
    @02118 GENE_THRPY_DRUGS_TOT_AMT         10.
  ;

  LABEL
        PATIENT_ID                       = "Patient ID"
        MEDPAR_ID                        = "Unique Key for CCW MedPAR Table"
        MEDPAR_YR_NUM                    = "Year of MedPAR Record"
        NCH_CLM_TYPE_CD                  = "NCH Claim Type Code"
        BENE_IDENT_CD                    = "BIC reported on first claim included in stay"
        EQTBL_BIC_CD                     = "Equated BIC"
        BENE_AGE_CNT                     = "Age as of Date of Admission."
        BENE_SEX_CD                      = "Sex of Beneficiary"
        BENE_RACE_CD                     = "Race of Beneficiary"
        BENE_MDCR_STUS_CD                = "Reason for entitlement to Medicare benefits as of CLM_THRU_DT"
        BENE_RSDNC_SSA_STATE_CD          = "SSA standard state code of a beneficiarys residence."
        BENE_RSDNC_SSA_CNTY_CD           = "SSA standard county code of a beneficiarys residence."
        BENE_MLG_CNTCT_ZIP_CD            = "Zip code of the mailing address where the beneficiary may be contacted."
        BENE_DSCHRG_STUS_CD              = "Code identifying status of patient as of CLM_THRU_DT"
        FICARR_IDENT_NUM                 = "Intermediary processor identification"
        WRNG_IND_CD                      = "Warn ind spcfyng dtld billing info obtnd frm clms analyzd for stay prcss"
        GHO_PD_CD                        = "Code indicating whether or not GHO has paid provider for claim(s)"
        PPS_IND_CD                       = "Code indicating whether or not facility is being paid under PPS"
        ORG_NPI_NUM                      = "Organization NPI Number"
        PRVDR_NUM                        = "MEDPAR Provider Number"
        PRVDR_NUM_SPCL_UNIT_CD           = "Special num system code for hosp units that are PPS/SNF SB dsgntn excl."
        SS_LS_SNF_IND_CD                 = "Code indicating whether stay is short stay, long stay, or SNF"
        ACTV_XREF_IND                    = "Active Cross-Refference Indicator"
        SLCT_RSN_CD                      = "Specifies whether this record is a case or control record."
        STAY_FINL_ACTN_CLM_CNT           = "Claims (final action) included in stay"
        LTST_CLM_ACRTN_DT                = "Date latest claim incl in stay accreted to bene mstr rec at the CWF host"
        BENE_MDCR_BNFT_EXHST_DT          = "Last date beneficiary had Medicare coverage"
        SNF_QUALN_FROM_DT                = "Beginning date of beneficiarys qualifying stay"
        SNF_QUALN_THRU_DT                = "Ending date of beneficiarys qualifying stay"
        SRC_IP_ADMSN_CD                  = "Admssn to an Inp facility or, for newborn admssn, type of delivery code"
        IP_ADMSN_TYPE_CD                 = "Type and priority of benes admission to facility for Inp hosp stay code"
        ADMSN_DAY_CD                     = "Code indicating day of week beneficiary was admitted to facility."
        ADMSN_DT                         = "Date beneficiary admitted for Inpatient care or date care started"
        DSCHRG_DT                        = "Date beneficiary was discharged or died"
        DSCHRG_DSTNTN_CD                 = "Destination upon discharge from facility code"
        CVRD_LVL_CARE_THRU_DT            = "Date covered level of care ended in a SNF"
        BENE_DEATH_DT                    = "Date beneficiary died"
        BENE_DEATH_DT_VRFY_CD            = "Death Date Verification Code"
        ADMSN_DEATH_DAY_CNT              = "Days from date admitted to facility to date of death"
        INTRNL_USE_SSI_IND_CD            = "MEDPAR Internal Use SSI Indicator Code"
        INTRNL_USE_SSI_DAY_CNT           = "MEDPAR Internal Use SSI Day Count"
        INTRNL_USE_SSI_DATA              = "Internal Use SSI Data"
        INTRNL_USE_IPSB_CD               = "For internal Use Only. IPSB Code"
        INTRNL_USE_FIL_DT_CD             = "For internal use only. Fiscal year/calendar year segments."
        INTRNL_USE_SMPL_SIZE_CD          = "For internal use. MEDPAR sample size."
        LOS_DAY_CNT                      = "Days of beneficiarys stay in a hospital/SNF"
        OUTLIER_DAY_CNT                  = "Days paid as outliers (either day or cost) under PPS beyond DRG threshld"
        UTLZTN_DAY_CNT                   = "Covered days of care chargeable to Medicare utilization for stay"
        TOT_COINSRNC_DAY_CNT             = "MEDPAR Beneficiary Total Coinsurance Day Count"
        BENE_LRD_USE_CNT                 = "Lifetime reserve days (LRD) used by beneficiary for stay"
        BENE_PTA_COINSRNC_AMT            = "Beneficiarys liability for part A coinsurance for stay ($)"
        BENE_IP_DDCTBL_AMT               = "Beneficiarys liability for stay ($)"
        BENE_BLOOD_DDCTBL_AMT            = "Beneficiarys liability for blood deductible for stay ($)"
        BENE_PRMRY_PYR_CD                = "Primary payer responsibility code"
        BENE_PRMRY_PYR_AMT               = "Primry payer other than Medicare for covered Medicare chrgs for stay ($)"
        DRG_CD                           = "DRG Code"
        DRG_OUTLIER_STAY_CD              = "Cost or Day Outlier code"
        DRG_OUTLIER_PMT_AMT              = "Addtnl approved due to outlier situation over DRG allowance for stay ($)"
        DRG_PRICE_AMT                    = "Wld hv bn pd if no dedctbls,coinsrnc,prmry payrs,otlrs were invlvd ($)"
        IP_DSPRPRTNT_SHR_AMT             = "Over the DRG amount for disproportionate share hospital for stay ($)"
        IME_AMT                          = "Additional payment made to teaching hospitals for IME for stay ($)"
        PASS_THRU_AMT                    = "Total of all claim pass thru for stay ($)"
        TOT_PPS_CPTL_AMT                 = "Total payable for capital PPS ($)"
        IP_LOW_VOL_PYMT_AMT              = "Inpatient Low Volume Payment Amount."
        TOT_CHRG_AMT                     = "Total all charges for all srvcs provided to beneficiary for stay ($)"
        TOT_CVR_CHRG_AMT                 = "Portion of total charges covered by Medicare for stay ($)"
        MDCR_PMT_AMT                     = "Amt of payment from Medicare trust fund for srvcs covered by claim ($)"
        ACMDTNS_TOT_CHRG_AMT             = "Total charge for all accommodations related to beneficiarys stay ($)"
        DPRTMNTL_TOT_CHRG_AMT            = "Total charge for all ancillary depts related to beneficiarys stay ($)"
        PRVT_ROOM_DAY_CNT                = "Private room days used by beneficiary for stay"
        SEMIPRVT_ROOM_DAY_CNT            = "Semi-private room days used by beneficiary for stay"
        WARD_DAY_CNT                     = "Ward days used by beneficiary for stay"
        INTNSV_CARE_DAY_CNT              = "Intensive care days used by beneficiary for stay"
        CRNRY_CARE_DAY_CNT               = "Coronary care days used by beneficiary for stay"
        PRVT_ROOM_CHRG_AMT               = "Private room accommodations related to beneficiarys stay ($)"
        SEMIPRVT_ROOM_CHRG_AMT           = "Semi-private room accommodations related to beneficiarys stay ($)"
        WARD_CHRG_AMT                    = "Ward accommodations related to beneficiarys stay ($)"
        INTNSV_CARE_CHRG_AMT             = "Intensive care accommodations related to beneficiarys stay ($)"
        CRNRY_CARE_CHRG_AMT              = "Coronary care accommodations related to beneficiarys stay ($)"
        OTHR_SRVC_CHRG_AMT               = "Other services related to beneficiarys stay ($)"
        PHRMCY_CHRG_AMT                  = "Pharmaceutical costs related to beneficiarys stay ($)"
        MDCL_SUPLY_CHRG_AMT              = "Medical/surgical supplies related to beneficiarys stay ($)"
        DME_CHRG_AMT                     = "DME related to beneficiarys stay ($)"
        USED_DME_CHRG_AMT                = "Used DME related to beneficiarys stay ($)"
        PHYS_THRPY_CHRG_AMT              = "Physical therapy services provided during beneficiarys stay ($)"
        OCPTNL_THRPY_CHRG_AMT            = "Occupational therapy services provided during beneficiarys stay ($)"
        SPCH_PTHLGY_CHRG_AMT             = "Speech pathology services provided during beneficiarys stay ($)"
        INHLTN_THRPY_CHRG_AMT            = "Inhalation therapy services provided during beneficiarys stay ($)"
        BLOOD_CHRG_AMT                   = "Blood provided during beneficiarys stay ($)"
        BLOOD_ADMIN_CHRG_AMT             = "Blood storage and processing related to beneficiarys stay ($)"
        BLOOD_PT_FRNSH_QTY               = "Quantity of blood (whole pints) furnished to beneficiary during stay"
        OPRTG_ROOM_CHRG_AMT              = "OR, recovery rm, and labor rm delivery used by bene during stay ($)"
        LTHTRPSY_CHRG_AMT                = "Lithotripsy services provided during beneficiarys stay ($)"
        CRDLGY_CHRG_AMT                  = "Cardiology services and ECG(s) provided during beneficiarys stay ($)"
        ANSTHSA_CHRG_AMT                 = "Anesthesia services provided during beneficiarys stay ($)"
        LAB_CHRG_AMT                     = "Laboratory costs related to beneficiarys stay ($)"
        RDLGY_CHRG_AMT                   = "Radiology costs (excluding MRI) related to a beneficiarys stay ($)"
        MRI_CHRG_AMT                     = "MRI services provided during beneficiarys stay ($)"
        OP_SRVC_CHRG_AMT                 = "Outpatient services provided during beneficiarys stay ($)"
        ER_CHRG_AMT                      = "Emergency room services provided during beneficiarys stay ($)"
        AMBLNC_CHRG_AMT                  = "Ambulance services related to beneficiarys stay ($)"
        PROFNL_FEES_CHRG_AMT             = "Professional fees related to beneficiarys stay ($)"
        ORGN_ACQSTN_CHRG_AMT             = "Organ acquisition or oth donor bank srvcs related to benes stay ($)"
        ESRD_REV_SETG_CHRG_AMT           = "ESRD services related to beneficiarys stay ($)"
        CLNC_VISIT_CHRG_AMT              = "Clinic visits related to beneficiarys stay ($)"
        ICU_IND_CD                       = "ICU type code"
        CRNRY_CARE_IND_CD                = "Coronary care unit type code"
        PHRMCY_IND_CD                    = "Drugs type code"
        TRNSPLNT_IND_CD                  = "Organ transplant code"
        RDLGY_ONCLGY_IND_SW              = "Radiology oncology services indicator"
        RDLGY_DGNSTC_IND_SW              = "Radiology diagnostic services indicator"
        RDLGY_THRPTC_IND_SW              = "Radiology therapeutic services indicator"
        RDLGY_NUCLR_MDCN_IND_SW          = "Radiology nuclear medicine services indicator"
        RDLGY_CT_SCAN_IND_SW             = "Radiology computed tomographic (CT) scan services indicator"
        RDLGY_OTHR_IMGNG_IND_SW          = "Radiology other imaging services indicator"
        OP_SRVC_IND_CD                   = "Outpatient services/ambulatory surgical care code"
        ORGN_ACQSTN_IND_CD               = "Organ acquisition type code"
        ESRD_COND_CD                     = "ESRD condition code"
        ESRD_SETG_IND_1_CD               = "Dialysis type code I"
        ESRD_SETG_IND_2_CD               = "Dialysis type code II"
        ESRD_SETG_IND_3_CD               = "Dialysis type code III"
        ESRD_SETG_IND_4_CD               = "Dialysis type code IV"
        ESRD_SETG_IND_5_CD               = "Dialysis type code V"
        ADMTG_DGNS_CD                    = "Initial diagnosis at time of admission"
        ADMTG_DGNS_VRSN_CD               = "MEDPAR Admitting Diagnosis Version Code"
        DGNS_CD_CNT                      = "Diagnosis codes included in stay"
        DGNS_VRSN_CD                     = "Version Code - Indicate if diagnosis code is ICD-9 or ICD-10 (Earlier Version)"
        DGNS_VRSN_CD_1                   = "Version Code 01 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_2                   = "Version Code 02 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_3                   = "Version Code 03 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_4                   = "Version Code 04 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_5                   = "Version Code 05 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_6                   = "Version Code 06 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_7                   = "Version Code 07 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_8                   = "Version Code 08 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_9                   = "Version Code 09 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_10                  = "Version Code 10 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_11                  = "Version Code 11 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_12                  = "Version Code 12 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_13                  = "Version Code 13 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_14                  = "Version Code 14 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_15                  = "Version Code 15 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_16                  = "Version Code 16 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_17                  = "Version Code 17 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_18                  = "Version Code 18 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_19                  = "Version Code 19 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_20                  = "Version Code 20 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_21                  = "Version Code 21 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_22                  = "Version Code 22 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_23                  = "Version Code 23 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_24                  = "Version Code 24 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_VRSN_CD_25                  = "Version Code 25 - Indicate if diagnosis code is ICD-9 or ICD-10."
        DGNS_1_CD                        = "Primary ICD-9-CM code"
        DGNS_2_CD                        = "ICD-9-CM Diagnosis code II"
        DGNS_3_CD                        = "ICD-9-CM Diagnosis code III"
        DGNS_4_CD                        = "ICD-9-CM Diagnosis code IV"
        DGNS_5_CD                        = "ICD-9-CM Diagnosis code V"
        DGNS_6_CD                        = "ICD-9-CM Diagnosis code VI"
        DGNS_7_CD                        = "ICD-9-CM Diagnosis code VII"
        DGNS_8_CD                        = "ICD-9-CM Diagnosis code VIII"
        DGNS_9_CD                        = "ICD-9-CM Diagnosis code IX"
        DGNS_10_CD                       = "ICD-9-CM Diagnosis code X"
        DGNS_11_CD                       = "ICD-9-CM Diagnosis code XI"
        DGNS_12_CD                       = "ICD-9-CM Diagnosis code XII"
        DGNS_13_CD                       = "ICD-9-CM Diagnosis code XIII"
        DGNS_14_CD                       = "ICD-9-CM Diagnosis code XIV"
        DGNS_15_CD                       = "ICD-9-CM Diagnosis code XV"
        DGNS_16_CD                       = "ICD-9-CM Diagnosis code XVI"
        DGNS_17_CD                       = "ICD-9-CM Diagnosis code XVII"
        DGNS_18_CD                       = "ICD-9-CM Diagnosis code XVIII"
        DGNS_19_CD                       = "ICD-9-CM Diagnosis code XIX"
        DGNS_20_CD                       = "ICD-9-CM Diagnosis code XX"
        DGNS_21_CD                       = "ICD-9-CM Diagnosis code XXI"
        DGNS_22_CD                       = "ICD-9-CM Diagnosis code XXII"
        DGNS_23_CD                       = "ICD-9-CM Diagnosis code XXIII"
        DGNS_24_CD                       = "ICD-9-CM Diagnosis code XXIV"
        DGNS_25_CD                       = "ICD-9-CM Diagnosis code XXV"
        DGNS_POA_CD                      = "Diagnosis Code POA Array"
        POA_DGNS_CD_CNT                  = "MEDPAR Claim Present on Admission Diagnosis Code Count"
        POA_DGNS_1_IND_CD                = "Diagnosis Present on Admission Indicator 1"
        POA_DGNS_2_IND_CD                = "Diagnosis Present on Admission Indicator 2"
        POA_DGNS_3_IND_CD                = "Diagnosis Present on Admission Indicator 3"
        POA_DGNS_4_IND_CD                = "Diagnosis Present on Admission Indicator 4"
        POA_DGNS_5_IND_CD                = "Diagnosis Present on Admission Indicator 5"
        POA_DGNS_6_IND_CD                = "Diagnosis Present on Admission Indicator 6"
        POA_DGNS_7_IND_CD                = "Diagnosis Present on Admission Indicator 7"
        POA_DGNS_8_IND_CD                = "Diagnosis Present on Admission Indicator 8"
        POA_DGNS_9_IND_CD                = "Diagnosis Present on Admission Indicator 9"
        POA_DGNS_10_IND_CD               = "Diagnosis Present on Admission Indicator 10"
        POA_DGNS_11_IND_CD               = "Diagnosis Present on Admission Indicator 11"
        POA_DGNS_12_IND_CD               = "Diagnosis Present on Admission Indicator 12"
        POA_DGNS_13_IND_CD               = "Diagnosis Present on Admission Indicator 13"
        POA_DGNS_14_IND_CD               = "Diagnosis Present on Admission Indicator 14"
        POA_DGNS_15_IND_CD               = "Diagnosis Present on Admission Indicator 15"
        POA_DGNS_16_IND_CD               = "Diagnosis Present on Admission Indicator 16"
        POA_DGNS_17_IND_CD               = "Diagnosis Present on Admission Indicator 17"
        POA_DGNS_18_IND_CD               = "Diagnosis Present on Admission Indicator 18"
        POA_DGNS_19_IND_CD               = "Diagnosis Present on Admission Indicator 19"
        POA_DGNS_20_IND_CD               = "Diagnosis Present on Admission Indicator 20"
        POA_DGNS_21_IND_CD               = "Diagnosis Present on Admission Indicator 21"
        POA_DGNS_22_IND_CD               = "Diagnosis Present on Admission Indicator 22"
        POA_DGNS_23_IND_CD               = "Diagnosis Present on Admission Indicator 23"
        POA_DGNS_24_IND_CD               = "Diagnosis Present on Admission Indicator 24"
        POA_DGNS_25_IND_CD               = "Diagnosis Present on Admission Indicator 25"
        DGNS_E_CD_CNT                    = "MEDPAR Diagnosis E Code Count"
        DGNS_E_VRSN_CD                   = "MEDPAR Diagnosis E Version Code (Earlier Version)"
        DGNS_E_VRSN_CD_1                 = "MEDPAR Diagnosis E Version Code 01"
        DGNS_E_VRSN_CD_2                 = "MEDPAR Diagnosis E Version Code 02"
        DGNS_E_VRSN_CD_3                 = "MEDPAR Diagnosis E Version Code 03"
        DGNS_E_VRSN_CD_4                 = "MEDPAR Diagnosis E Version Code 04"
        DGNS_E_VRSN_CD_5                 = "MEDPAR Diagnosis E Version Code 05"
        DGNS_E_VRSN_CD_6                 = "MEDPAR Diagnosis E Version Code 06"
        DGNS_E_VRSN_CD_7                 = "MEDPAR Diagnosis E Version Code 07"
        DGNS_E_VRSN_CD_8                 = "MEDPAR Diagnosis E Version Code 08"
        DGNS_E_VRSN_CD_9                 = "MEDPAR Diagnosis E Version Code 09"
        DGNS_E_VRSN_CD_10                = "MEDPAR Diagnosis E Version Code 10"
        DGNS_E_VRSN_CD_11                = "MEDPAR Diagnosis E Version Code 11"
        DGNS_E_VRSN_CD_12                = "MEDPAR Diagnosis E Version Code 12"
        DGNS_E_1_CD                      = "E Diagnosis Code 1 - Extrnl cause of injury, poisoning, or oth adverse effect"
        DGNS_E_2_CD                      = "E Diagnosis Code 2 - Extrnl cause of injury, poisoning, or oth adverse effect"
        DGNS_E_3_CD                      = "E Diagnosis Code 3 - Extrnl cause of injury, poisoning, or oth adverse effect"
        DGNS_E_4_CD                      = "E Diagnosis Code 4 - Extrnl cause of injury, poisoning, or oth adverse effect"
        DGNS_E_5_CD                      = "E Diagnosis Code 5 - Extrnl cause of injury, poisoning, or oth adverse effect"
        DGNS_E_6_CD                      = "E Diagnosis Code 6 - Extrnl cause of injury, poisoning, or oth adverse effect"
        DGNS_E_7_CD                      = "E Diagnosis Code 7 - Extrnl cause of injury, poisoning, or oth adverse effect"
        DGNS_E_8_CD                      = "E Diagnosis Code 8 - Extrnl cause of injury, poisoning, or oth adverse effect"
        DGNS_E_9_CD                      = "E Diagnosis Code 9 - Extrnl cause of injury, poisoning, or oth adverse effect"
        DGNS_E_10_CD                     = "E Diagnosis Code 10 - Extrnl cause of injury, poisoning, or oth adverse effect"
        DGNS_E_11_CD                     = "E Diagnosis Code 11 - Extrnl cause of injury, poisoning, or oth adverse effect"
        DGNS_E_12_CD                     = "E Diagnosis Code 12 - Extrnl cause of injury, poisoning, or oth adverse effect"
        POA_DGNS_E_CD_CNT                = "MEDPAR Claim Present on Admission Diagnosis E Code Count"
        POA_DGNS_E_1_IND_CD              = "Diagnosis E Code Present on Admission Indicator 1"
        POA_DGNS_E_2_IND_CD              = "Diagnosis E Code Present on Admission Indicator 2"
        POA_DGNS_E_3_IND_CD              = "Diagnosis E Code Present on Admission Indicator 3"
        POA_DGNS_E_4_IND_CD              = "Diagnosis E Code Present on Admission Indicator 4"
        POA_DGNS_E_5_IND_CD              = "Diagnosis E Code Present on Admission Indicator 5"
        POA_DGNS_E_6_IND_CD              = "Diagnosis E Code Present on Admission Indicator 6"
        POA_DGNS_E_7_IND_CD              = "Diagnosis E Code Present on Admission Indicator 7"
        POA_DGNS_E_8_IND_CD              = "Diagnosis E Code Present on Admission Indicator 8"
        POA_DGNS_E_9_IND_CD              = "Diagnosis E Code Present on Admission Indicator 9"
        POA_DGNS_E_10_IND_CD             = "Diagnosis E Code Present on Admission Indicator 10"
        POA_DGNS_E_11_IND_CD             = "Diagnosis E Code Present on Admission Indicator 11"
        POA_DGNS_E_12_IND_CD             = "Diagnosis E Code Present on Admission Indicator 12"
        SRGCL_PRCDR_IND_SW               = "Surgical procedures indicator"
        SRGCL_PRCDR_CD_CNT               = "Surgical procedure codes included in stay"
        SRGCL_PRCDR_VRSN_CD              = "MEDPAR Surgical Procedure Version Code (Earlier Version)"
        SRGCL_PRCDR_VRSN_CD_1            = "MEDPAR Surgical Procedure Version Code 01"
        SRGCL_PRCDR_VRSN_CD_2            = "MEDPAR Surgical Procedure Version Code 02"
        SRGCL_PRCDR_VRSN_CD_3            = "MEDPAR Surgical Procedure Version Code 03"
        SRGCL_PRCDR_VRSN_CD_4            = "MEDPAR Surgical Procedure Version Code 04"
        SRGCL_PRCDR_VRSN_CD_5            = "MEDPAR Surgical Procedure Version Code 05"
        SRGCL_PRCDR_VRSN_CD_6            = "MEDPAR Surgical Procedure Version Code 06"
        SRGCL_PRCDR_VRSN_CD_7            = "MEDPAR Surgical Procedure Version Code 07"
        SRGCL_PRCDR_VRSN_CD_8            = "MEDPAR Surgical Procedure Version Code 08"
        SRGCL_PRCDR_VRSN_CD_9            = "MEDPAR Surgical Procedure Version Code 09"
        SRGCL_PRCDR_VRSN_CD_10           = "MEDPAR Surgical Procedure Version Code 10"
        SRGCL_PRCDR_VRSN_CD_11           = "MEDPAR Surgical Procedure Version Code 11"
        SRGCL_PRCDR_VRSN_CD_12           = "MEDPAR Surgical Procedure Version Code 12"
        SRGCL_PRCDR_VRSN_CD_13           = "MEDPAR Surgical Procedure Version Code 13"
        SRGCL_PRCDR_VRSN_CD_14           = "MEDPAR Surgical Procedure Version Code 14"
        SRGCL_PRCDR_VRSN_CD_15           = "MEDPAR Surgical Procedure Version Code 15"
        SRGCL_PRCDR_VRSN_CD_16           = "MEDPAR Surgical Procedure Version Code 16"
        SRGCL_PRCDR_VRSN_CD_17           = "MEDPAR Surgical Procedure Version Code 17"
        SRGCL_PRCDR_VRSN_CD_18           = "MEDPAR Surgical Procedure Version Code 18"
        SRGCL_PRCDR_VRSN_CD_19           = "MEDPAR Surgical Procedure Version Code 19"
        SRGCL_PRCDR_VRSN_CD_20           = "MEDPAR Surgical Procedure Version Code 20"
        SRGCL_PRCDR_VRSN_CD_21           = "MEDPAR Surgical Procedure Version Code 21"
        SRGCL_PRCDR_VRSN_CD_22           = "MEDPAR Surgical Procedure Version Code 22"
        SRGCL_PRCDR_VRSN_CD_23           = "MEDPAR Surgical Procedure Version Code 23"
        SRGCL_PRCDR_VRSN_CD_24           = "MEDPAR Surgical Procedure Version Code 24"
        SRGCL_PRCDR_VRSN_CD_25           = "MEDPAR Surgical Procedure Version Code 25"
        SRGCL_PRCDR_1_CD                 = "Principal Procedure code"
        SRGCL_PRCDR_2_CD                 = "Procedure Code II"
        SRGCL_PRCDR_3_CD                 = "Procedure Code III"
        SRGCL_PRCDR_4_CD                 = "Procedure Code IV"
        SRGCL_PRCDR_5_CD                 = "Procedure Code V"
        SRGCL_PRCDR_6_CD                 = "Procedure Code VI"
        SRGCL_PRCDR_7_CD                 = "Procedure Code VII"
        SRGCL_PRCDR_8_CD                 = "Procedure Code VIII"
        SRGCL_PRCDR_9_CD                 = "Procedure Code IX"
        SRGCL_PRCDR_10_CD                = "Procedure Code X"
        SRGCL_PRCDR_11_CD                = "Procedure Code XI"
        SRGCL_PRCDR_12_CD                = "Procedure Code XII"
        SRGCL_PRCDR_13_CD                = "Procedure Code XIII"
        SRGCL_PRCDR_14_CD                = "Procedure Code XIV"
        SRGCL_PRCDR_15_CD                = "Procedure Code XV"
        SRGCL_PRCDR_16_CD                = "Procedure Code XVI"
        SRGCL_PRCDR_17_CD                = "Procedure Code XVII"
        SRGCL_PRCDR_18_CD                = "Procedure Code XVIII"
        SRGCL_PRCDR_19_CD                = "Procedure Code XIX"
        SRGCL_PRCDR_20_CD                = "Procedure Code XX"
        SRGCL_PRCDR_21_CD                = "Procedure Code XXI"
        SRGCL_PRCDR_22_CD                = "Procedure Code XXII"
        SRGCL_PRCDR_23_CD                = "Procedure Code XXIII"
        SRGCL_PRCDR_24_CD                = "Procedure Code XXIV"
        SRGCL_PRCDR_25_CD                = "Procedure Code XXV"
        SRGCL_PRCDR_DT_CNT               = "Dates associated with surgical procedures included in stay"
        SRGCL_PRCDR_PRFRM_1_DT           = "Principal Procedure Date"
        SRGCL_PRCDR_PRFRM_2_DT           = "Procedure Date II"
        SRGCL_PRCDR_PRFRM_3_DT           = "Procedure Date III"
        SRGCL_PRCDR_PRFRM_4_DT           = "Procedure Date IV"
        SRGCL_PRCDR_PRFRM_5_DT           = "Procedure Date V"
        SRGCL_PRCDR_PRFRM_6_DT           = "Procedure Date VI"
        SRGCL_PRCDR_PRFRM_7_DT           = "Procedure Date VII"
        SRGCL_PRCDR_PRFRM_8_DT           = "Procedure Date VIII"
        SRGCL_PRCDR_PRFRM_9_DT           = "Procedure Date IX"
        SRGCL_PRCDR_PRFRM_10_DT          = "Procedure Date X"
        SRGCL_PRCDR_PRFRM_11_DT          = "Procedure Date XI"
        SRGCL_PRCDR_PRFRM_12_DT          = "Procedure Date XII"
        SRGCL_PRCDR_PRFRM_13_DT          = "Procedure Date XIII"
        SRGCL_PRCDR_PRFRM_14_DT          = "Procedure Date XIV"
        SRGCL_PRCDR_PRFRM_15_DT          = "Procedure Date XV"
        SRGCL_PRCDR_PRFRM_16_DT          = "Procedure Date XVI"
        SRGCL_PRCDR_PRFRM_17_DT          = "Procedure Date XVII"
        SRGCL_PRCDR_PRFRM_18_DT          = "Procedure Date XVIII"
        SRGCL_PRCDR_PRFRM_19_DT          = "Procedure Date XIX"
        SRGCL_PRCDR_PRFRM_20_DT          = "Procedure Date XX"
        SRGCL_PRCDR_PRFRM_21_DT          = "Procedure Date XXI"
        SRGCL_PRCDR_PRFRM_22_DT          = "Procedure Date XXII"
        SRGCL_PRCDR_PRFRM_23_DT          = "Procedure Date XXIII"
        SRGCL_PRCDR_PRFRM_24_DT          = "Procedure Date XXIV"
        SRGCL_PRCDR_PRFRM_25_DT          = "Procedure Date XXV"
        CLM_PTNT_RLTNSHP_CD              = "Claim Patient Relationship Code"
        CARE_IMPRVMT_MODEL_1_CD          = "Care Improvement Model 1 Code"
        CARE_IMPRVMT_MODEL_2_CD          = "Care Improvement Model 2 Code"
        CARE_IMPRVMT_MODEL_3_CD          = "Care Improvement Model 3 Code"
        CARE_IMPRVMT_MODEL_4_CD          = "Care Improvement Model 4 Code"
        VBP_PRTCPNT_IND_CD               = "VBP Participant Indicator Code"
        HRR_PRTCPNT_IND_CD               = "HRR Participant Indicator Code"
        BNDLD_MODEL_DSCNT_PCT            = "Bundled Model Discount Percent"
        VBP_ADJSTMT_PCT                  = "VBP Adjustment Percent"
        HRR_ADJSTMT_PCT                  = "HRR Adjustment Percent"
        INFRMTL_ENCTR_IND_SW             = "Informational Encounter Indicator Switch"
        MA_TCHNG_IND_SW                  = "MA Teaching Indicator Switch"
        PROD_RPLCMT_LIFECYC_SW           = "Prod Replacement Lifecycle Switch"
        PROD_RPLCMT_RCLL_SW              = "Prod Replacement Recall Switch"
        CRED_RCVD_RPLCD_DVC_SW           = "Credit Received Replaced Device Switch"
        OBSRVTN_SW                       = "Observation Switch"
        NEW_TCHNLGY_ADD_ON_AMT           = "New Technology Add-On Amount"
        BASE_OPRTG_DRG_AMT               = "Base Operating DRG Amount"
        OPRTG_HSP_AMT                    = "Operating Hospital Amount"
        MDCL_SRGCL_GNRL_AMT              = "Medical/Surgical General Amount"
        MDCL_SRGCL_NSTRL_AMT             = "Medical/Surgical Non-Sterile Amount"
        MDCL_SRGCL_STRL_AMT              = "Medical/Surgical Sterile Amount"
        TAKE_HOME_AMT                    = "Take Home Amount"
        PRSTHTC_ORTHTC_AMT               = "Prosthetic Orthotic Amount"
        MDCL_SRGCL_PCMKR_AMT             = "Medical/Surgical Pacemaker Amount"
        INTRAOCULAR_LENS_AMT             = "Intraocular Lens Amount"
        OXYGN_TAKE_HOME_AMT              = "Oxygen Take Home Amount"
        OTHR_IMPLANTS_AMT                = "Other Implants Amount"
        OTHR_SUPLIES_DVC_AMT             = "Other Supplies Device Amount"
        INCDNT_RDLGY_AMT                 = "Incident Radiology Amount"
        INCDNT_DGNSTC_SRVCS_AMT          = "Incident Diagnostic Services Amount"
        MDCL_SRGCL_DRSNG_AMT             = "Medical/Surgical Dressing Amount"
        INVSTGTNL_DVC_AMT                = "Investigational Device Amount"
        MDCL_SRGCL_MISC_AMT              = "Medical/Surgical Miscellaneous Amount"
        RDLGY_ONCOLOGY_AMT               = "Radiology/Oncology Amount"
        RDLGY_DGNSTC_AMT                 = "Radiology Diagnostic Amount"
        RDLGY_THRPTC_AMT                 = "Radiology Therapeutic Amount"
        RDLGY_NUCLR_MDCN_AMT             = "Radiology Nuclear Medicine Amount"
        RDLGY_CT_SCAN_AMT                = "Radiology CT Scan Amount"
        RDLGY_OTHR_IMGNG_AMT             = "Radiology Other Imaging Amount"
        OPRTG_ROOM_AMT                   = "Operating Room Amount"
        OR_LABOR_DLVRY_AMT               = "O/R Labor Delivery Amount"
        CRDC_CATHRZTN_AMT                = "Cardiac Catheterization Amount"
        SQSTRTN_RDCTN_AMT                = "Sequestration Reduction Amount"
        UNCOMPD_CARE_PYMT_AMT            = "Uncompensated Care Payment Amount"
        BNDLD_ADJSTMT_AMT                = "Bundled Adjustment Amount"
        VBP_ADJSTMT_AMT                  = "Hospital Value Based Purchasing (VBP) Amount"
        HRR_ADJSTMT_AMT                  = "Hospital Readmission Reduction (HRR) Adjustment Amount"
        EHR_PYMT_ADJSTMT_AMT             = "Electronic Health Record (EHR) Payment Adjustment Amount"
        PPS_STD_VAL_PYMT_AMT             = "Claim PPS Standard Value Payment Amount"
        FINL_STD_AMT                     = "Claim Final Standard Amount"
        HAC_RDCTN_PMT_AMT                = "Hospital Acquired Conditions Reduction Payment Amount (IPPS_FLEX_PYMT_6_AMT)"
        IPPS_FLEX_PYMT_7_AMT             = "IPPS Flexible Payment Amount II"
        PTNT_ADD_ON_PYMT_AMT             = "Revenue Center Patient/Initial Visit Add-On Amount"
        HAC_PGM_RDCTN_IND_SW             = "Hospital Acquired Conditions (HAC) Program Reduction Indicator Switch"
        PGM_RDCTN_IND_SW                 = "Electronic Health Records (EHR) Program Reduction Indicator Switch"
        PA_IND_CD                        = "Claim Prior Authorization Indicator Code"
        UNIQ_TRKNG_NUM                   = "Claim Unique Tracking Number"
        STAY_2_IND_SW                    = "Stay 2 Indicator Switch"
        CLM_SITE_NTRL_PYMT_CST_AMT       = "Claim Site Neutral Payment Based on Cost Amount"
        CLM_SITE_NTRL_PYMT_IPPS_AMT      = "Claim Site Neutral Payment Based on IPPS Amount"
        CLM_FULL_STD_PYMT_AMT            = "Claim Full Standard Payment Amount"
        CLM_SS_OUTLIER_STD_PYMT_AMT      = "Claim Short Stay Outlier (SSO) Standard Payment Amount"
        CLM_NGACO_IND_1_CD               = "Claim Next Generation (NG) Accountable Care Organization (ACO) Indicator Code 1"
        CLM_NGACO_IND_2_CD               = "Claim Next Generation (NG) Accountable Care Organization (ACO) Indicator Code 2"
        CLM_NGACO_IND_3_CD               = "Claim Next Generation (NG) Accountable Care Organization (ACO) Indicator Code 3"
        CLM_NGACO_IND_4_CD               = "Claim Next Generation (NG) Accountable Care Organization (ACO) Indicator Code 4"
        CLM_NGACO_IND_5_CD               = "Claim Next Generation (NG) Accountable Care Organization (ACO) Indicator Code 5"
        CLM_RSDL_PYMT_IND_CD             = "Claim Residual Payment Indicator Code"
        CLM_RP_IND_CD                    = "Claim Representative Payee (RP) Indicator Code"
        RC_RP_IND_CD                     = "Revenue Center Representative Payee (RP) Indicator Code"
        ACO_ID_NUM                       = "Accountable Care Organization (ACO) Identification Number"
        RC_ALLOGENEIC_STEM_CELL_AMT      = "Revenue Center Allogeneic Stem Cell Acquisition/Donor Services Amount"
        ISLET_ADD_ON_PYMT_AMT            = "Islet Add-On Payment Amount"
        CLM_IP_INITL_MS_DRG_CD           = "Claim Inpatient Initial MS-DRG Code"
        VAL_CD_Q1_PYMT_RDCTN_AMT         = "Value Code Q1 Payment Reduction Amount"
        CLM_MODEL_REIMBRSMT_AMT          = "Claim Model Reimbursement Amount"
        RC_MODEL_REIMBRSMT_AMT           = "Revenue Center Model Reimbursement Amount"
        VAL_CD_QB_OCM_PYMT_ADJSTMT_AMT   = "Value Code QB OCM + Payment Adjustment Amount"
        CELL_GENE_THRPY_PRCDRS_TOT_AMT   = "Cell/Gene Therapy Procedures Total Charge Amount"
        CELL_THRPY_DRUGS_TOT_AMT         = "Cell Therapy Drugs Total Charge Amount"
        GENE_THRPY_DRUGS_TOT_AMT         = "Gene Therapy Drugs Total Charge Amount"
    ;
run;

libname SAS 'SasData/SAS';

data SAS.Medpar;
set medpar;
	rename    ADMSN_DT=CLM_FROM_DT DSCHRG_DT=CLM_THRU_DT MEDPAR_ID=CLM_ID ADMTG_DGNS_CD=PRNCPAL_DGNS_CD
              DGNS_1_CD=ICD_DGNS_CD1   DGNS_2_CD=ICD_DGNS_CD2   DGNS_3_CD=ICD_DGNS_CD3   DGNS_4_CD=ICD_DGNS_CD4 
              DGNS_5_CD=ICD_DGNS_CD5   DGNS_6_CD=ICD_DGNS_CD6   DGNS_7_CD=ICD_DGNS_CD7   DGNS_8_CD=ICD_DGNS_CD8 
              DGNS_9_CD=ICD_DGNS_CD9   DGNS_10_CD=ICD_DGNS_CD10 DGNS_11_CD=ICD_DGNS_CD11 DGNS_12_CD=ICD_DGNS_CD12
              DGNS_13_CD=ICD_DGNS_CD13 DGNS_14_CD=ICD_DGNS_CD14 DGNS_15_CD=ICD_DGNS_CD15 DGNS_16_CD=ICD_DGNS_CD16
              DGNS_17_CD=ICD_DGNS_CD17 DGNS_18_CD=ICD_DGNS_CD18 DGNS_19_CD=ICD_DGNS_CD19 DGNS_20_CD=ICD_DGNS_CD20
              DGNS_21_CD=ICD_DGNS_CD21 DGNS_22_CD=ICD_DGNS_CD22 DGNS_23_CD=ICD_DGNS_CD23 DGNS_24_CD=ICD_DGNS_CD24
              DGNS_25_CD=ICD_DGNS_CD25 
			  SRGCL_PRCDR_1_CD=ICD_PRCDR_CD1   SRGCL_PRCDR_2_CD=ICD_PRCDR_CD2   SRGCL_PRCDR_3_CD=ICD_PRCDR_CD3   SRGCL_PRCDR_4_CD=ICD_PRCDR_CD4
              SRGCL_PRCDR_5_CD=ICD_PRCDR_CD5   SRGCL_PRCDR_6_CD=ICD_PRCDR_CD6   SRGCL_PRCDR_7_CD=ICD_PRCDR_CD7   SRGCL_PRCDR_8_CD=ICD_PRCDR_CD8 
              SRGCL_PRCDR_9_CD=ICD_PRCDR_CD9   SRGCL_PRCDR_10_CD=ICD_PRCDR_CD10 SRGCL_PRCDR_11_CD=ICD_PRCDR_CD11 SRGCL_PRCDR_12_CD=ICD_PRCDR_CD12
              SRGCL_PRCDR_13_CD=ICD_PRCDR_CD13 SRGCL_PRCDR_14_CD=ICD_PRCDR_CD14 SRGCL_PRCDR_15_CD=ICD_PRCDR_CD15 SRGCL_PRCDR_16_CD=ICD_PRCDR_CD16
              SRGCL_PRCDR_17_CD=ICD_PRCDR_CD17 SRGCL_PRCDR_18_CD=ICD_PRCDR_CD18 SRGCL_PRCDR_19_CD=ICD_PRCDR_CD19 SRGCL_PRCDR_20_CD=ICD_PRCDR_CD20
              SRGCL_PRCDR_21_CD=ICD_PRCDR_CD21 SRGCL_PRCDR_22_CD=ICD_PRCDR_CD22 SRGCL_PRCDR_23_CD=ICD_PRCDR_CD23 SRGCL_PRCDR_24_CD=ICD_PRCDR_CD24
              SRGCL_PRCDR_25_CD=ICD_PRCDR_CD25;
   FILETYPE="M";
   attrib FILETYPE format=$1.;

data SAS.medpar;
set SAS.medpar;
keep PATIENT_ID FILETYPE CLM_ID CLM_FROM_DT CLM_THRU_DT PRNCPAL_DGNS_CD ICD_DGNS_CD1--ICD_DGNS_CD25 ICD_PRCDR_CD1--ICD_PRCDR_CD25;
run;
