options nocenter validvarname=upcase;
filename outbase 'RawData/outpat*.base.txt';

data outbase;
  infile outbase lrecl=1115 missover pad;
  input
     @001   patient_id                        $char15.  /*  Patient ID (for either Cancer or Non-Cancer Patients) */
     @016   CLM_ID                            $char15.  /*  Encrypted  */
     @031   NCH_NEAR_LINE_REC_IDENT_CD        $char1.
     @032   NCH_CLM_TYPE_CD                   $char2.
     @034   CLM_FROM_DT                       $char8.  /*  YYMMDD8  */
     @042   CLM_THRU_DT                       $char8.  /*  YYMMDD8  */
     @050   NCH_WKLY_PROC_DT                  $char8.  /*  YYMMDD8  */
     @058   FI_CLM_PROC_DT                    $char8.  /*  YYMMDD8  */
     @066   CLAIM_QUERY_CODE                  $char1.
     @067   PRVDR_NUM                         $char6.   /*  Encrypted  */
     @077   CLM_FAC_TYPE_CD                   $char1.
     @078   CLM_SRVC_CLSFCTN_TYPE_CD          $char1.
     @079   CLM_FREQ_CD                       $char1.
     @080   FI_NUM                            $char5.
     @085   CLM_MDCR_NON_PMT_RSN_CD           $char2.
     @087   CLM_PMT_AMT                       12.2
     @099   NCH_PRMRY_PYR_CLM_PD_AMT          12.2
     @111   NCH_PRMRY_PYR_CD                  $char1.
     @112   PRVDR_STATE_CD                    $char2.
     @114   ORG_NPI_NUM                       $char10.  /*  Encrypted  */
     @124   SRVC_LOC_NPI_NUM                  $char10.  /*  Encrypted  */
     @146   AT_PHYSN_UPIN                     $char6.   /*  Encrypted  */
     @158   AT_PHYSN_NPI                      $char10.  /*  Encrypted  */
     @170   AT_PHYSN_SPCLTY_CD                $char2.
     @172   OP_PHYSN_UPIN                     $char6.   /*  Encrypted  */
     @184   OP_PHYSN_NPI                      $char10.  /*  Encrypted  */
     @196   OP_PHYSN_SPCLTY_CD                $char2.
     @198   OT_PHYSN_UPIN                     $char6.   /*  Encrypted  */
     @210   OT_PHYSN_NPI                      $char10.  /*  Encrypted  */
     @222   OT_PHYSN_SPCLTY_CD                $char2.
     @224   RNDRNG_PHYSN_NPI                  $char10.  /*  Encrypted  */
     @236   RNDRNG_PHYSN_SPCLTY_CD            $char2.
     @238   RFR_PHYSN_NPI                     $char10.  /*  Encrypted  */
     @250   RFR_PHYSN_SPCLTY_CD               $char2.
     @252   CLM_MCO_PD_SW                     $char1.
     @253   PTNT_DSCHRG_STUS_CD               $char2.
     @255   CLM_TOT_CHRG_AMT                  12.2
     @267   NCH_BENE_BLOOD_DDCTBL_LBLTY_AM    12.2
     @279   NCH_PROFNL_CMPNT_CHRG_AMT         12.2
     @291   PRNCPAL_DGNS_CD                   $char7.
     @298   ICD_DGNS_CD1                      $char7.
     @305   ICD_DGNS_CD2                      $char7.
     @312   ICD_DGNS_CD3                      $char7.
     @319   ICD_DGNS_CD4                      $char7.
     @326   ICD_DGNS_CD5                      $char7.
     @333   ICD_DGNS_CD6                      $char7.
     @340   ICD_DGNS_CD7                      $char7.
     @347   ICD_DGNS_CD8                      $char7.
     @354   ICD_DGNS_CD9                      $char7.
     @361   ICD_DGNS_CD10                     $char7.
     @368   ICD_DGNS_CD11                     $char7.
     @375   ICD_DGNS_CD12                     $char7.
     @382   ICD_DGNS_CD13                     $char7.
     @389   ICD_DGNS_CD14                     $char7.
     @396   ICD_DGNS_CD15                     $char7.
     @403   ICD_DGNS_CD16                     $char7.
     @410   ICD_DGNS_CD17                     $char7.
     @417   ICD_DGNS_CD18                     $char7.
     @424   ICD_DGNS_CD19                     $char7.
     @431   ICD_DGNS_CD20                     $char7.
     @438   ICD_DGNS_CD21                     $char7.
     @445   ICD_DGNS_CD22                     $char7.
     @452   ICD_DGNS_CD23                     $char7.
     @459   ICD_DGNS_CD24                     $char7.
     @466   ICD_DGNS_CD25                     $char7.
     @473   FST_DGNS_E_CD                     $char7.
     @480   ICD_DGNS_E_CD1                    $char7.
     @487   ICD_DGNS_E_CD2                    $char7.
     @494   ICD_DGNS_E_CD3                    $char7.
     @501   ICD_DGNS_E_CD4                    $char7.
     @508   ICD_DGNS_E_CD5                    $char7.
     @515   ICD_DGNS_E_CD6                    $char7.
     @522   ICD_DGNS_E_CD7                    $char7.
     @529   ICD_DGNS_E_CD8                    $char7.
     @536   ICD_DGNS_E_CD9                    $char7.
     @543   ICD_DGNS_E_CD10                   $char7.
     @550   ICD_DGNS_E_CD11                   $char7.
     @557   ICD_DGNS_E_CD12                   $char7.
     @564   ICD_PRCDR_CD1                     $char7.
     @571   PRCDR_DT1                         $char8.  /*  YYMMDD8  */
     @579   ICD_PRCDR_CD2                     $char7.
     @586   PRCDR_DT2                         $char8.  /*  YYMMDD8  */
     @594   ICD_PRCDR_CD3                     $char7.
     @601   PRCDR_DT3                         $char8.  /*  YYMMDD8  */
     @609   ICD_PRCDR_CD4                     $char7.
     @616   PRCDR_DT4                         $char8.  /*  YYMMDD8  */
     @624   ICD_PRCDR_CD5                     $char7.
     @631   PRCDR_DT5                         $char8.  /*  YYMMDD8  */
     @639   ICD_PRCDR_CD6                     $char7.
     @646   PRCDR_DT6                         $char8.  /*  YYMMDD8  */
     @654   ICD_PRCDR_CD7                     $char7.
     @661   PRCDR_DT7                         $char8.  /*  YYMMDD8  */
     @669   ICD_PRCDR_CD8                     $char7.
     @676   PRCDR_DT8                         $char8.  /*  YYMMDD8  */
     @684   ICD_PRCDR_CD9                     $char7.
     @691   PRCDR_DT9                         $char8.  /*  YYMMDD8  */
     @699   ICD_PRCDR_CD10                    $char7.
     @706   PRCDR_DT10                        $char8.  /*  YYMMDD8  */
     @714   ICD_PRCDR_CD11                    $char7.
     @721   PRCDR_DT11                        $char8.  /*  YYMMDD8  */
     @729   ICD_PRCDR_CD12                    $char7.
     @736   PRCDR_DT12                        $char8.  /*  YYMMDD8  */
     @744   ICD_PRCDR_CD13                    $char7.
     @751   PRCDR_DT13                        $char8.  /*  YYMMDD8  */
     @759   ICD_PRCDR_CD14                    $char7.
     @766   PRCDR_DT14                        $char8.  /*  YYMMDD8  */
     @774   ICD_PRCDR_CD15                    $char7.
     @781   PRCDR_DT15                        $char8.  /*  YYMMDD8  */
     @789   ICD_PRCDR_CD16                    $char7.
     @796   PRCDR_DT16                        $char8.  /*  YYMMDD8  */
     @804   ICD_PRCDR_CD17                    $char7.
     @811   PRCDR_DT17                        $char8.  /*  YYMMDD8  */
     @819   ICD_PRCDR_CD18                    $char7.
     @826   PRCDR_DT18                        $char8.  /*  YYMMDD8  */
     @834   ICD_PRCDR_CD19                    $char7.
     @841   PRCDR_DT19                        $char8.  /*  YYMMDD8  */
     @849   ICD_PRCDR_CD20                    $char7.
     @856   PRCDR_DT20                        $char8.  /*  YYMMDD8  */
     @864   ICD_PRCDR_CD21                    $char7.
     @871   PRCDR_DT21                        $char8.  /*  YYMMDD8  */
     @879   ICD_PRCDR_CD22                    $char7.
     @886   PRCDR_DT22                        $char8.  /*  YYMMDD8  */
     @894   ICD_PRCDR_CD23                    $char7.
     @901   PRCDR_DT23                        $char8.  /*  YYMMDD8  */
     @909   ICD_PRCDR_CD24                    $char7.
     @916   PRCDR_DT24                        $char8.  /*  YYMMDD8  */
     @924   ICD_PRCDR_CD25                    $char7.
     @931   PRCDR_DT25                        $char8.  /*  YYMMDD8  */
     @939   RSN_VISIT_CD1                     $char7.
     @946   RSN_VISIT_CD2                     $char7.
     @953   RSN_VISIT_CD3                     $char7.
     @960   NCH_BENE_PTB_DDCTBL_AMT           12.2
     @972   NCH_BENE_PTB_COINSRNC_AMT         12.2
     @984   CLM_OP_PRVDR_PMT_AMT              12.2
     @996   CLM_OP_BENE_PMT_AMT               12.2
     @1008  DOB_YEAR                          $char4.
     @1016  GNDR_CD                           $char1.
     @1017  BENE_RACE_CD                      $char1.
     @1018  BENE_CNTY_CD                      $char3.
     @1021  BENE_STATE_CD                     $char2.
     @1023  BENE_MLG_CNTCT_ZIP_CD             $char9.   /*  Encrypted  */
     @1032  CLM_MDCL_REC                      $char17.  /*  Encrypted  */
     @1049  FI_CLM_ACTN_CD                    $char1.
     @1050  NCH_BLOOD_PNTS_FRNSHD_QTY         3.
     @1053  CLM_TRTMT_AUTHRZTN_NUM            $char18.  /*  Encrypted  */
     @1071  CLM_PRCR_RTRN_CD                  $char2.
     @1073  CLM_SRVC_FAC_ZIP_CD               $char9.   /*  Encrypted  */
     @1082  CLM_OP_TRANS_TYPE_CD              $char1.
     @1083  CLM_OP_ESRD_MTHD_CD               $char1.
     @1084  CLM_NEXT_GNRTN_ACO_IND_CD1        $char1.
     @1085  CLM_NEXT_GNRTN_ACO_IND_CD2        $char1.
     @1086  CLM_NEXT_GNRTN_ACO_IND_CD3        $char1.
     @1087  CLM_NEXT_GNRTN_ACO_IND_CD4        $char1.
     @1088  CLM_NEXT_GNRTN_ACO_IND_CD5        $char1.
     @1089  ACO_ID_NUM                        $char10.  /*  Encrypted  */
     @1099  CLM_BENE_ID_TYPE_CD               $char1.
     @1100  CLM_RSDL_PYMT_IND_CD              $char1.
     @1101  PRVDR_VLDTN_TYPE_CD               $char2.
     @1103  RR_BRD_EXCLSN_IND_SW              $char1.
     @1104  CLM_MODEL_REIMBRSMT_AMT           12.2
      ;

  label
     patient_id                      = "Patient ID"
     CLM_ID                          = "Encrypted Claim ID"
     NCH_NEAR_LINE_REC_IDENT_CD      = "NCH Near Line Record Identification Code"
     NCH_CLM_TYPE_CD                 = "NCH Claim Type Code"
     CLM_FROM_DT                     = "Claim From Date"
     CLM_THRU_DT                     = "Claim Through Date (Determines Year of Claim)"
     NCH_WKLY_PROC_DT                = "NCH Weekly Claim Processing Date"
     FI_CLM_PROC_DT                  = "FI Claim Process Date"
     CLAIM_QUERY_CODE                = "Claim Query Code"
     PRVDR_NUM                       = "Provider Number"
     CLM_FAC_TYPE_CD                 = "Claim Facility Type Code"
     CLM_SRVC_CLSFCTN_TYPE_CD        = "Claim Service classification Type Code"
     CLM_FREQ_CD                     = "Claim Frequency Code"
     FI_NUM                          = "FI Number"
     CLM_MDCR_NON_PMT_RSN_CD         = "Claim Medicare Non Payment Reason Code"
     CLM_PMT_AMT                     = "Claim Payment Amount"
     NCH_PRMRY_PYR_CLM_PD_AMT        = "NCH Primary Payer Claim Paid Amount"
     NCH_PRMRY_PYR_CD                = "NCH Primary Payer Code"
     PRVDR_STATE_CD                  = "NCH Provider State Code"
     ORG_NPI_NUM                     = "Organization NPI Number"
     SRVC_LOC_NPI_NUM                = "Claim Service Location NPI Number"
     AT_PHYSN_UPIN                   = "Claim Attending Physician UPIN Number"
     AT_PHYSN_NPI                    = "Claim Attending Physician NPI Number"
     AT_PHYSN_SPCLTY_CD              = "Claim Attending Physician Specialty Code"
     OP_PHYSN_UPIN                   = "Claim Operating Physician UPIN Number"
     OP_PHYSN_NPI                    = "Claim Operating Physician NPI Number"
     OP_PHYSN_SPCLTY_CD              = "Claim Operating Physician Specialty Code"
     OT_PHYSN_UPIN                   = "Claim Other Physician UPIN Number"
     OT_PHYSN_NPI                    = "Claim Other Physician NPI Number"
     OT_PHYSN_SPCLTY_CD              = "Claim Other Physician Specialty Code"
     RNDRNG_PHYSN_NPI                = "Claim Rendering Physician NPI"
     RNDRNG_PHYSN_SPCLTY_CD          = "Claim Rendering Physician Specialty Code"
     RFR_PHYSN_NPI                   = "Claim Referring Physician NPI"
     RFR_PHYSN_SPCLTY_CD             = "Claim Referring Physician Specialty Code"
     CLM_MCO_PD_SW                   = "Claim MCO Paid Switch"
     PTNT_DSCHRG_STUS_CD             = "Patient Discharge Status Code"
     CLM_TOT_CHRG_AMT                = "Claim Total Charge Amount"
     NCH_BENE_BLOOD_DDCTBL_LBLTY_AM  = "NCH Beneficiary Blood Deductible Liability Amount"
     NCH_PROFNL_CMPNT_CHRG_AMT       = "NCH Professional Component Charge"
     PRNCPAL_DGNS_CD                 = "Primary Claim Diagnosis Code"
     ICD_DGNS_CD1                    = "Claim Diagnosis Code I"
     ICD_DGNS_CD2                    = "Claim Diagnosis Code II"
     ICD_DGNS_CD3                    = "Claim Diagnosis Code III"
     ICD_DGNS_CD4                    = "Claim Diagnosis Code IV"
     ICD_DGNS_CD5                    = "Claim Diagnosis Code V"
     ICD_DGNS_CD6                    = "Claim Diagnosis Code VI"
     ICD_DGNS_CD7                    = "Claim Diagnosis Code VII"
     ICD_DGNS_CD8                    = "Claim Diagnosis Code VIII"
     ICD_DGNS_CD9                    = "Claim Diagnosis Code IX"
     ICD_DGNS_CD10                   = "Claim Diagnosis Code X"
     ICD_DGNS_CD11                   = "Claim Diagnosis Code XI"
     ICD_DGNS_CD12                   = "Claim Diagnosis Code XII"
     ICD_DGNS_CD13                   = "Claim Diagnosis Code XIII"
     ICD_DGNS_CD14                   = "Claim Diagnosis Code XIV"
     ICD_DGNS_CD15                   = "Claim Diagnosis Code XV"
     ICD_DGNS_CD16                   = "Claim Diagnosis Code XVI"
     ICD_DGNS_CD17                   = "Claim Diagnosis Code XVII"
     ICD_DGNS_CD18                   = "Claim Diagnosis Code XVIII"
     ICD_DGNS_CD19                   = "Claim Diagnosis Code XIX"
     ICD_DGNS_CD20                   = "Claim Diagnosis Code XX"
     ICD_DGNS_CD21                   = "Claim Diagnosis Code XXI"
     ICD_DGNS_CD22                   = "Claim Diagnosis Code XXII"
     ICD_DGNS_CD23                   = "Claim Diagnosis Code XXIII"
     ICD_DGNS_CD24                   = "Claim Diagnosis Code XXIV"
     ICD_DGNS_CD25                   = "Claim Diagnosis Code XXV"
     FST_DGNS_E_CD                   = "First Claim Diagnosis E Code"
     ICD_DGNS_E_CD1                  = "Claim Diagnosis E Code I"
     ICD_DGNS_E_CD2                  = "Claim Diagnosis E Code II"
     ICD_DGNS_E_CD3                  = "Claim Diagnosis E Code III"
     ICD_DGNS_E_CD4                  = "Claim Diagnosis E Code IV"
     ICD_DGNS_E_CD5                  = "Claim Diagnosis E Code V"
     ICD_DGNS_E_CD6                  = "Claim Diagnosis E Code VI"
     ICD_DGNS_E_CD7                  = "Claim Diagnosis E Code VII"
     ICD_DGNS_E_CD8                  = "Claim Diagnosis E Code VIII"
     ICD_DGNS_E_CD9                  = "Claim Diagnosis E Code IX"
     ICD_DGNS_E_CD10                 = "Claim Diagnosis E Code X"
     ICD_DGNS_E_CD11                 = "Claim Diagnosis E Code XI"
     ICD_DGNS_E_CD12                 = "Claim Diagnosis E Code XII"
     ICD_PRCDR_CD1                   = "Claim Procedure Code I"
     PRCDR_DT1                       = "Claim Procedure Code I Date"
     ICD_PRCDR_CD2                   = "Claim Procedure Code II"
     PRCDR_DT2                       = "Claim Procedure Code II Date"
     ICD_PRCDR_CD3                   = "Claim Procedure Code III"
     PRCDR_DT3                       = "Claim Procedure Code III Date"
     ICD_PRCDR_CD4                   = "Claim Procedure Code IV"
     PRCDR_DT4                       = "Claim Procedure Code IV Date"
     ICD_PRCDR_CD5                   = "Claim Procedure Code V"
     PRCDR_DT5                       = "Claim Procedure Code V Date"
     ICD_PRCDR_CD6                   = "Claim Procedure Code VI"
     PRCDR_DT6                       = "Claim Procedure Code VI Date"
     ICD_PRCDR_CD7                   = "Claim Procedure Code VII"
     PRCDR_DT7                       = "Claim Procedure Code VII Date"
     ICD_PRCDR_CD8                   = "Claim Procedure Code VIII"
     PRCDR_DT8                       = "Claim Procedure Code VIII Date"
     ICD_PRCDR_CD9                   = "Claim Procedure Code IX"
     PRCDR_DT9                       = "Claim Procedure Code IX Date"
     ICD_PRCDR_CD10                  = "Claim Procedure Code X"
     PRCDR_DT10                      = "Claim Procedure Code X Date"
     ICD_PRCDR_CD11                  = "Claim Procedure Code XI"
     PRCDR_DT11                      = "Claim Procedure Code XI Date"
     ICD_PRCDR_CD12                  = "Claim Procedure Code XII"
     PRCDR_DT12                      = "Claim Procedure Code XII Date"
     ICD_PRCDR_CD13                  = "Claim Procedure Code XIII"
     PRCDR_DT13                      = "Claim Procedure Code XIII Date"
     ICD_PRCDR_CD14                  = "Claim Procedure Code XIV"
     PRCDR_DT14                      = "Claim Procedure Code XIV Date"
     ICD_PRCDR_CD15                  = "Claim Procedure Code XV"
     PRCDR_DT15                      = "Claim Procedure Code XV Date"
     ICD_PRCDR_CD16                  = "Claim Procedure Code XVI"
     PRCDR_DT16                      = "Claim Procedure Code XVI Date"
     ICD_PRCDR_CD17                  = "Claim Procedure Code XVII"
     PRCDR_DT17                      = "Claim Procedure Code XVII Date"
     ICD_PRCDR_CD18                  = "Claim Procedure Code XVIII"
     PRCDR_DT18                      = "Claim Procedure Code XVIII Date"
     ICD_PRCDR_CD19                  = "Claim Procedure Code XIX"
     PRCDR_DT19                      = "Claim Procedure Code XIX Date"
     ICD_PRCDR_CD20                  = "Claim Procedure Code XX"
     PRCDR_DT20                      = "Claim Procedure Code XX Date"
     ICD_PRCDR_CD21                  = "Claim Procedure Code XXI"
     PRCDR_DT21                      = "Claim Procedure Code XXI Date"
     ICD_PRCDR_CD22                  = "Claim Procedure Code XXII"
     PRCDR_DT22                      = "Claim Procedure Code XXII Date"
     ICD_PRCDR_CD23                  = "Claim Procedure Code XXIII"
     PRCDR_DT23                      = "Claim Procedure Code XXIII Date"
     ICD_PRCDR_CD24                  = "Claim Procedure Code XXIV"
     PRCDR_DT24                      = "Claim Procedure Code XXIV Date"
     ICD_PRCDR_CD25                  = "Claim Procedure Code XXV"
     PRCDR_DT25                      = "Claim Procedure Code XXV Date"
     RSN_VISIT_CD1                   = "Reason for Visit Diagnosis Code I"
     RSN_VISIT_CD2                   = "Reason for Visit Diagnosis Code II"
     RSN_VISIT_CD3                   = "Reason for Visit Diagnosis Code III"
     NCH_BENE_PTB_DDCTBL_AMT         = "NCH Beneficiary Part B Deductible Amount"
     NCH_BENE_PTB_COINSRNC_AMT       = "NCH Beneficiary Part B Coinsurance Amount"
     CLM_OP_PRVDR_PMT_AMT            = "Claim Outpatient Provider Payment Amount"
     CLM_OP_BENE_PMT_AMT             = "Claim Outpatient Beneficiary Payment Amount"
     DOB_YEAR                        = "Year of Birth from Claim (Date)"
     GNDR_CD                         = "Gender Code from Claim"
     BENE_RACE_CD                    = "Race Code from Claim"
     BENE_CNTY_CD                    = "County Code from Claim (SSA)"
     BENE_STATE_CD                   = "State Code from Claim (SSA)"
     BENE_MLG_CNTCT_ZIP_CD           = "Zip Code of Residence from Claim"
     CLM_MDCL_REC                    = "Claim Medical Record Number"
     FI_CLM_ACTN_CD                  = "FI Claim Action Code"
     NCH_BLOOD_PNTS_FRNSHD_QTY       = "NCH Blood Pints Furnished Quantity"
     CLM_TRTMT_AUTHRZTN_NUM          = "Claim Treatment Authorization Number"
     CLM_PRCR_RTRN_CD                = "Claim Pricer Return Code"
     CLM_SRVC_FAC_ZIP_CD             = "Claim Service Facility ZIP Code"
     CLM_OP_TRANS_TYPE_CD            = "Claim Outpatient Transaction Type Code"
     CLM_OP_ESRD_MTHD_CD             = "Claim Outpatient ESRD Method Of Reimbursement Code"
     CLM_NEXT_GNRTN_ACO_IND_CD1      = "Claim Next Generation Accountable Care Organization Indicator Code 1"
     CLM_NEXT_GNRTN_ACO_IND_CD2      = "Claim Next Generation Accountable Care Organization Indicator Code 2"
     CLM_NEXT_GNRTN_ACO_IND_CD3      = "Claim Next Generation Accountable Care Organization Indicator Code 3"
     CLM_NEXT_GNRTN_ACO_IND_CD4      = "Claim Next Generation Accountable Care Organization Indicator Code 4"
     CLM_NEXT_GNRTN_ACO_IND_CD5      = "Claim Next Generation Accountable Care Organization Indicator Code 5"
     ACO_ID_NUM                      = "Claim Accountable Care Organization (ACO) Identification Number"
     CLM_BENE_ID_TYPE_CD             = "For CMS Internal Use Only"
     CLM_RSDL_PYMT_IND_CD            = "Claim Residual Payment Indicator Code"
     PRVDR_VLDTN_TYPE_CD             = "Provider Validation Type Code"
     RR_BRD_EXCLSN_IND_SW            = "Railroad Board Exclusion Indicator Switch"
     CLM_MODEL_REIMBRSMT_AMT         = "Claim Model Reimbursement Amount"
    ;

run;
filename outrev 'RawData/outpat*.revenue.txt';
options nocenter validvarname=upcase;

data outrevenue;
  infile outrev lrecl=391 missover pad;
  input
     @001  patient_id                      $char15.  /*  Patient ID (for either Cancer or Non-Cancer Patients) */
     @016  CLM_ID                          $char15.  /*  Encrypted  */
     @031  CLM_THRU_DT                     $char8.  /*  YYMMDD8  */
     @039  CLM_LINE_NUM                    $char13.
     @052  NCH_CLM_TYPE_CD                 $char2.
     @054  REV_CNTR                        $char4.
     @058  REV_CNTR_DT                     $char8.  /*  YYMMDD8  */
     @066  REV_CNTR_1ST_ANSI_CD            $char5.
     @071  REV_CNTR_2ND_ANSI_CD            $char5.
     @076  REV_CNTR_3RD_ANSI_CD            $char5.
     @081  REV_CNTR_4TH_ANSI_CD            $char5.
     @086  REV_CNTR_APC_HIPPS_CD           $char5.
     @091  HCPCS_CD                        $char5.
     @096  HCPCS_1ST_MDFR_CD               $char5.
     @101  HCPCS_2ND_MDFR_CD               $char5.
     @106  HCPCS_3RD_MDFR_CD               $char5.
     @111  HCPCS_4TH_MDFR_CD               $char5.
     @116  REV_CNTR_PMT_MTHD_IND_CD        $char2.
     @118  REV_CNTR_DSCNT_IND_CD           $char1.
     @119  REV_CNTR_PACKG_IND_CD           $char1.
     @120  REV_CNTR_OTAF_PMT_CD            $char1.
     @121  REV_CNTR_IDE_NDC_UPC_NUM        $char24.
     @145  REV_CNTR_UNIT_CNT               $char8.
     @153  REV_CNTR_RATE_AMT               12.2
     @165  REV_CNTR_BLOOD_DDCTBL_AMT       12.2
     @177  REV_CNTR_CASH_DDCTBL_AMT        12.2
     @189  REV_CNTR_COINSRNC_WGE_ADJSTD_C  12.2
     @201  REV_CNTR_RDCD_COINSRNC_AMT      12.2
     @213  REV_CNTR_1ST_MSP_PD_AMT         12.2
     @225  REV_CNTR_2ND_MSP_PD_AMT         12.2
     @237  REV_CNTR_PRVDR_PMT_AMT          12.2
     @249  REV_CNTR_BENE_PMT_AMT           12.2
     @261  REV_CNTR_PTNT_RSPNSBLTY_PMT     12.2
     @273  REV_CNTR_PMT_AMT_AMT            12.2
     @285  REV_CNTR_TOT_CHRG_AMT           12.2
     @297  REV_CNTR_NCVRD_CHRG_AMT         12.2
     @309  REV_CNTR_STUS_IND_CD            $char2.
     @311  REV_CNTR_NDC_QTY                10.3
     @321  REV_CNTR_NDC_QTY_QLFR_CD        $char2.
     @323  RNDRNG_PHYSN_UPIN               $char6.   /*  Encrypted  */
     @335  RNDRNG_PHYSN_NPI                $char10.  /*  Encrypted  */
     @347  RNDRNG_PHYSN_SPCLTY_CD          $char2.
     @349  REV_CNTR_DDCTBL_COINSRNC_CD     $char1.
     @350  REV_CNTR_PRCNG_IND_CD           $char2.
     @352  THRPY_CAP_IND_CD1               $char1.
     @353  THRPY_CAP_IND_CD2               $char1.
     @354  RC_PTNT_ADD_ON_PYMT_AMT         12.2
     @366  TRNSTNL_DRUG_ADD_ON_PYMT_AMT    12.4
     @378  REV_CNTR_RP_IND_CD              $char1.
     @379  RC_MODEL_REIMBRSMT_AMT          12.2
      ;

  label
     patient_id                       = "Patient ID"
     CLM_ID                           = "Encrypted Claim ID"
     CLM_THRU_DT                      = "Claim Through Date (Determines Year of Claim)"
     CLM_LINE_NUM                     = "Claim Line Number"
     NCH_CLM_TYPE_CD                  = "NCH Claim Type Code"
     REV_CNTR                         = "Revenue Center Code"
     REV_CNTR_DT                      = "Revenue Center Date"
     REV_CNTR_1ST_ANSI_CD             = "Revenue Center 1st ANSI Code"
     REV_CNTR_2ND_ANSI_CD             = "Revenue Center 2nd ANSI Code"
     REV_CNTR_3RD_ANSI_CD             = "Revenue Center 3rd ANSI Code"
     REV_CNTR_4TH_ANSI_CD             = "Revenue Center 4th ANSI Code"
     REV_CNTR_APC_HIPPS_CD            = "Revenue Center APC/HIPPS"
     HCPCS_CD                         = "Revenue Center Healthcare Common Procedure Coding System"
     HCPCS_1ST_MDFR_CD                = "Revenue Center HCPCS Initial Modifier Code"
     HCPCS_2ND_MDFR_CD                = "Revenue Center HCPCS Second Modifier Code"
     HCPCS_3RD_MDFR_CD                = "Revenue Center HCPCS Third Modifier Code"
     HCPCS_4TH_MDFR_CD                = "Revenue Center HCPCS Fourth Modifier Code"
     REV_CNTR_PMT_MTHD_IND_CD         = "Revenue Center Payment Method Indicator Code"
     REV_CNTR_DSCNT_IND_CD            = "Revenue Center Discount Indicator Code"
     REV_CNTR_PACKG_IND_CD            = "Revenue Center Packaging Indicator Code"
     REV_CNTR_OTAF_PMT_CD             = "Revenue Center Obligation to Accept As Full (OTAF) Payment Code"
     REV_CNTR_IDE_NDC_UPC_NUM         = "Revenue Center IDE, NDC, UPC Number"
     REV_CNTR_UNIT_CNT                = "Revenue Center Unit Count"
     REV_CNTR_RATE_AMT                = "Revenue Center Rate Amount"
     REV_CNTR_BLOOD_DDCTBL_AMT        = "Revenue Center Blood Deductible Amount"
     REV_CNTR_CASH_DDCTBL_AMT         = "Revenue Center Cash Deductible Amount"
     REV_CNTR_COINSRNC_WGE_ADJSTD_C   = "Revenue Center Coinsurance/Wage Adjusted Coinsurance Amount"
     REV_CNTR_RDCD_COINSRNC_AMT       = "Revenue Center Reduced Coinsurance Amount"
     REV_CNTR_1ST_MSP_PD_AMT          = "Revenue Center 1st Medicare Secondary Payer Paid Amount"
     REV_CNTR_2ND_MSP_PD_AMT          = "Revenue Center 2nd Medicare Secondary Payer Paid Amount"
     REV_CNTR_PRVDR_PMT_AMT           = "Revenue Center Provider Payment Amount"
     REV_CNTR_BENE_PMT_AMT            = "Revenue Center Beneficiary Payment Amount"
     REV_CNTR_PTNT_RSPNSBLTY_PMT      = "Revenue Center Patient Responsibility Payment"
     REV_CNTR_PMT_AMT_AMT             = "Revenue Center Payment Amount Amount"
     REV_CNTR_TOT_CHRG_AMT            = "Revenue Center Total Charge Amount"
     REV_CNTR_NCVRD_CHRG_AMT          = "Revenue Center Non-Covered Charge Amount"
     REV_CNTR_STUS_IND_CD             = "Revenue Center Status Indicator Code"
     REV_CNTR_NDC_QTY                 = "Revenue Center NDC Quantity"
     REV_CNTR_NDC_QTY_QLFR_CD         = "Revenue Center NDC Quantity Qualifier Code"
     RNDRNG_PHYSN_UPIN                = "Revenue Center Rendering Physician UPIN"
     RNDRNG_PHYSN_NPI                 = "Revenue Center Rendering Physician NPI"
     RNDRNG_PHYSN_SPCLTY_CD           = "Revenue Center Rendering Physician Specialty Code"
     REV_CNTR_DDCTBL_COINSRNC_CD      = "Revenue Center Deductible Coinsurance Code"
     REV_CNTR_PRCNG_IND_CD            = "Revenue Center Pricing Indicator Code"
     THRPY_CAP_IND_CD1                = "Revenue Center Therapy Cap Indicator Code 1"
     THRPY_CAP_IND_CD2                = "Revenue Center Therapy Cap Indicator Code 2"
     RC_PTNT_ADD_ON_PYMT_AMT          = "Revenue Center Patient/Initial Visit Add-On Payment Amount"
     TRNSTNL_DRUG_ADD_ON_PYMT_AMT     = "Transitional Drug Add-On Payment Amount"
     REV_CNTR_RP_IND_CD               = "Revenue Center Representative Payee (RP) Indicator Code"
     RC_MODEL_REIMBRSMT_AMT           = "Revenue Center Model Reimbursement Amount"
   ;

run;

%macro st (ds);
proc sort data = &ds;
by PATIENT_ID CLM_ID;
run;
%mend;

%st(Outbase);
%st(Outrevenue);

data SAS.outpat;
merge Outbase Outrevenue;
by PATIENT_ID CLM_ID;
keep PATIENT_ID CLM_ID CLM_FROM_DT CLM_THRU_DT PRNCPAL_DGNS_CD ICD_DGNS_CD1--ICD_DGNS_CD25 
ICD_PRCDR_CD1 ICD_PRCDR_CD2 ICD_PRCDR_CD3 ICD_PRCDR_CD4 ICD_PRCDR_CD5 ICD_PRCDR_CD6 
ICD_PRCDR_CD7 ICD_PRCDR_CD8 ICD_PRCDR_CD9 ICD_PRCDR_CD10 ICD_PRCDR_CD11 ICD_PRCDR_CD12
ICD_PRCDR_CD13 ICD_PRCDR_CD14 ICD_PRCDR_CD15 ICD_PRCDR_CD16 ICD_PRCDR_CD17 ICD_PRCDR_CD18 ICD_PRCDR_CD19
ICD_PRCDR_CD20 ICD_PRCDR_CD21 ICD_PRCDR_CD22 ICD_PRCDR_CD23 ICD_PRCDR_CD24 ICD_PRCDR_CD25 
HCPCS_CD HCPCS_1ST_MDFR_CD REV_CNTR_IDE_NDC_UPC_NUM; 
FILETYPE = "O";
run;
