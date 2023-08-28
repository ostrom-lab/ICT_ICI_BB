filename dmebase  '/SASData/dme*.base.txt';                  
 /*reading in an un-zipped file*/

data dmebase;
  infile dmebase lrecl=337 missover pad;
  input
     @001 PATIENT_ID                    $char15.  /* Patient ID (for either Cancer or Non-Cancer Patients) */
     @016 CLM_ID                        $char15.  /*  Encrypted  */
     @031 NCH_NEAR_LINE_REC_IDENT_CD    $char1.
     @032 NCH_CLM_TYPE_CD               $char2.
     @034 CLM_FROM_DT                   $char8.  /*  YYMMDD8  */
     @042 CLM_THRU_DT                   $char8.  /*  YYMMDD8  */
     @050 NCH_WKLY_PROC_DT              $char8.  /*  YYMMDD8  */
     @058 CARR_CLM_ENTRY_CD             $char1.
     @059 CLM_DISP_CD                   $char2.
     @061 CARR_NUM                      $char5.
     @066 CARR_CLM_PMT_DNL_CD           $char2.
     @068 CLM_PMT_AMT                   12.2
     @080 CARR_CLM_PRMRY_PYR_PD_AMT     12.2
     @092 CARR_CLM_PRVDR_ASGNMT_IND_SW  $char1.
     @093 NCH_CLM_PRVDR_PMT_AMT         12.2
     @105 NCH_CLM_BENE_PMT_AMT          12.2
     @117 NCH_CARR_CLM_SBMTD_CHRG_AMT   12.2
     @129 NCH_CARR_CLM_ALOWD_AMT        12.2
     @141 CARR_CLM_CASH_DDCTBL_APLD_AMT 12.2
     @153 CARR_CLM_HCPCS_YR_CD          $char1.
     @154 PRNCPAL_DGNS_CD               $char7.
     @161 PRNCPAL_DGNS_VRSN_CD          $char1.
     @162 ICD_DGNS_CD1                  $char7.
     @169 ICD_DGNS_VRSN_CD1             $char1.
     @170 ICD_DGNS_CD2                  $char7.
     @177 ICD_DGNS_VRSN_CD2             $char1.
     @178 ICD_DGNS_CD3                  $char7.
     @185 ICD_DGNS_VRSN_CD3             $char1.
     @186 ICD_DGNS_CD4                  $char7.
     @193 ICD_DGNS_VRSN_CD4             $char1.
     @194 ICD_DGNS_CD5                  $char7.
     @201 ICD_DGNS_VRSN_CD5             $char1.
     @202 ICD_DGNS_CD6                  $char7.
     @209 ICD_DGNS_VRSN_CD6             $char1.
     @210 ICD_DGNS_CD7                  $char7.
     @217 ICD_DGNS_VRSN_CD7             $char1.
     @218 ICD_DGNS_CD8                  $char7.
     @225 ICD_DGNS_VRSN_CD8             $char1.
     @226 ICD_DGNS_CD9                  $char7.
     @233 ICD_DGNS_VRSN_CD9             $char1.
     @234 ICD_DGNS_CD10                 $char7.
     @241 ICD_DGNS_VRSN_CD10            $char1.
     @242 ICD_DGNS_CD11                 $char7.
     @249 ICD_DGNS_VRSN_CD11            $char1.
     @250 ICD_DGNS_CD12                 $char7.
     @257 ICD_DGNS_VRSN_CD12            $char1.
     @258 RFR_PHYSN_UPIN                $char6.   /*  Encrypted  */
     @270 RFR_PHYSN_NPI                 $char10.  /*  Encrypted  */
     @282 CLM_CLNCL_TRIL_NUM            $char8.
     @290 DOB_YEAR                      $char4.
     @298 GNDR_CD                       $char1.
     @299 BENE_RACE_CD                  $char1.
     @300 BENE_CNTY_CD                  $char3.
     @303 BENE_STATE_CD                 $char2.
     @305 BENE_MLG_CNTCT_ZIP_CD         $char9.   /*  Encrypted  */
     @314 CLM_BENE_PD_AMT               12.2
     @326 ACO_ID_NUM                    $char10.  /*  Encrypted  */
     @336 CLM_BENE_ID_TYPE_CD           $char1.
     @337 CLM_RSDL_PYMT_IND_CD          $char1.
    ;

  label
    PATIENT_ID                       = "Patient ID"
    CLM_ID                           = "Encrypted Claim ID"
    NCH_NEAR_LINE_REC_IDENT_CD       = "NCH Near Line Record Identification Code"
    NCH_CLM_TYPE_CD                  = "NCH Claim Type Code"
    CLM_FROM_DT                      = "Claim From Date"
    CLM_THRU_DT                      = "Claim Through Date (Determines Year of Claim)"
    NCH_WKLY_PROC_DT                 = "NCH Weekly Claim Processing Date"
    CARR_CLM_ENTRY_CD                = "Carrier Claim Entry Code"
    CLM_DISP_CD                      = "Claim Disposition Code"
    CARR_NUM                         = "Carrier Number"
    CARR_CLM_PMT_DNL_CD              = "Carrier Claim Payment Denial Code"
    CLM_PMT_AMT                      = "Claim Payment Amount"
    CARR_CLM_PRMRY_PYR_PD_AMT        = "Carrier Claim Primary Payer Paid Amount"
    CARR_CLM_PRVDR_ASGNMT_IND_SW     = "Claim Provider Assignment Indicator Switch"
    NCH_CLM_PRVDR_PMT_AMT            = "NCH Claim Provider Payment Amount"
    NCH_CLM_BENE_PMT_AMT             = "NCH Claim Beneficiary Payment Amount"
    NCH_CARR_CLM_SBMTD_CHRG_AMT      = "NCH Carrier Claim Submitted Charge Amount"
    NCH_CARR_CLM_ALOWD_AMT           = "NCH Carrier Claim Allowed Charge Amount"
    CARR_CLM_CASH_DDCTBL_APLD_AMT    = "Carrier Claim Cash Deductible Applied Amount"
    CARR_CLM_HCPCS_YR_CD             = "Carrier Claim HCPCS Year Code"
    PRNCPAL_DGNS_CD                  = "Primary Claim Diagnosis Code"
    PRNCPAL_DGNS_VRSN_CD             = "Primary Claim Diagnosis Code Diagnosis Version Code (ICD-9 or ICD-10)"
    ICD_DGNS_CD1                     = "Claim Diagnosis Code I"
    ICD_DGNS_VRSN_CD1                = "Claim Diagnosis Code I Diagnosis Version Code (ICD-9 or ICD-10)"
    ICD_DGNS_CD2                     = "Claim Diagnosis Code II"
    ICD_DGNS_VRSN_CD2                = "Claim Diagnosis Code II Diagnosis Version Code (ICD-9 or ICD-10)"
    ICD_DGNS_CD3                     = "Claim Diagnosis Code III"
    ICD_DGNS_VRSN_CD3                = "Claim Diagnosis Code III Diagnosis Version Code (ICD-9 or ICD-10)"
    ICD_DGNS_CD4                     = "Claim Diagnosis Code IV"
    ICD_DGNS_VRSN_CD4                = "Claim Diagnosis Code IV Diagnosis Version Code (ICD-9 or ICD-10)"
    ICD_DGNS_CD5                     = "Claim Diagnosis Code V"
    ICD_DGNS_VRSN_CD5                = "Claim Diagnosis Code V Diagnosis Version Code (ICD-9 or ICD-10)"
    ICD_DGNS_CD6                     = "Claim Diagnosis Code VI"
    ICD_DGNS_VRSN_CD6                = "Claim Diagnosis Code VI Diagnosis Version Code (ICD-9 or ICD-10)"
    ICD_DGNS_CD7                     = "Claim Diagnosis Code VII"
    ICD_DGNS_VRSN_CD7                = "Claim Diagnosis Code VII Diagnosis Version Code (ICD-9 or ICD-10)"
    ICD_DGNS_CD8                     = "Claim Diagnosis Code VIII"
    ICD_DGNS_VRSN_CD8                = "Claim Diagnosis Code VIII Diagnosis Version Code (ICD-9 or ICD-10)"
    ICD_DGNS_CD9                     = "Claim Diagnosis Code IX"
    ICD_DGNS_VRSN_CD9                = "Claim Diagnosis Code IX Diagnosis Version Code (ICD-9 or ICD-10)"
    ICD_DGNS_CD10                    = "Claim Diagnosis Code X"
    ICD_DGNS_VRSN_CD10               = "Claim Diagnosis Code X Diagnosis Version Code (ICD-9 or ICD-10)"
    ICD_DGNS_CD11                    = "Claim Diagnosis Code XI"
    ICD_DGNS_VRSN_CD11               = "Claim Diagnosis Code XI Diagnosis Version Code (ICD-9 or ICD-10)"
    ICD_DGNS_CD12                    = "Claim Diagnosis Code XII"
    ICD_DGNS_VRSN_CD12               = "Claim Diagnosis Code XII Diagnosis Version Code (ICD-9 or ICD-10)"
    RFR_PHYSN_UPIN                   = "DMERC Claim Ordering Physician UPIN Number"
    RFR_PHYSN_NPI                    = "DMERC Claim Refering Physician NPI Number"
    CLM_CLNCL_TRIL_NUM               = "Clinical Trial Number"
    DOB_YEAR                         = "Year of Birth from Claim (Date)"
    GNDR_CD                          = "Gender Code from Claim"
    BENE_RACE_CD                     = "Race Code from Claim"
    BENE_CNTY_CD                     = "County Code from Claim (SSA)"
    BENE_STATE_CD                    = "State Code from Claim (SSA)"
    BENE_MLG_CNTCT_ZIP_CD            = "Zip Code of Residence from Claim"
    CLM_BENE_PD_AMT                  = "Carrier Claim Beneficiary Paid Amount"
    ACO_ID_NUM                       = "Claim Accountable Care Organization (ACO) Identification Number"
    CLM_BENE_ID_TYPE_CD              = "For CMS Internal Use Only"
    CLM_RSDL_PYMT_IND_CD             = "Claim Residual Payment Indicator Code"
  ;
run;





filename dmeline  'P:\Pro00109659 - SEER-Medicare BT Epi\SEER_Medicare\Data/dme*.line.txt';                   /*reading in an un-zipped file*/


data dmeline;
  infile dmeline lrecl=422 missover pad;
  input
     @001 PATIENT_ID                       $char15.  /*  Patient ID (for either Cancer or Non-Cancer Patients) */
     @016 CLM_ID                           $char15.  /*  Encrypted  */
     @031 LINE_NUM                         $char13.
     @044 NCH_CLM_TYPE_CD                  $char2.
     @046 CLM_THRU_DT                      $char8.  /*  YYMMDD8  */
     @054 TAX_NUM                          $char10.  /*  Encrypted  */
     @064 PRVDR_SPCLTY                     $char3.
     @067 PRTCPTNG_IND_CD                  $char1.
     @068 LINE_SRVC_CNT                    11.3
     @079 LINE_CMS_TYPE_SRVC_CD            $char1.
     @080 LINE_PLACE_OF_SRVC_CD            $char2.
     @082 LINE_1ST_EXPNS_DT                $char8.  /*  YYMMDD8  */
     @090 LINE_LAST_EXPNS_DT               $char8.  /*  YYMMDD8  */
     @098 HCPCS_CD                         $char5.
     @103 HCPCS_1ST_MDFR_CD                $char5.
     @108 HCPCS_2ND_MDFR_CD                $char5.
     @113 BETOS_CD                         $char3.
     @116 LINE_NCH_PMT_AMT                 12.2
     @128 LINE_BENE_PMT_AMT                12.2
     @140 LINE_PRVDR_PMT_AMT               12.2
     @152 LINE_BENE_PTB_DDCTBL_AMT         12.2
     @164 LINE_BENE_PRMRY_PYR_CD           $char1.
     @165 LINE_BENE_PRMRY_PYR_PD_AMT       12.2
     @177 LINE_COINSRNC_AMT                12.2
     @189 LINE_PRMRY_ALOWD_CHRG_AMT        12.2
     @201 LINE_SBMTD_CHRG_AMT              12.2
     @213 LINE_ALOWD_CHRG_AMT              12.2
     @225 LINE_PRCSG_IND_CD                $char2.
     @227 LINE_PMT_80_100_CD               $char1.
     @228 LINE_SERVICE_DEDUCTIBLE          $char1.
     @229 LINE_ICD_DGNS_CD                 $char7.
     @236 LINE_ICD_DGNS_VRSN_CD            $char1.
     @237 LINE_DME_PRCHS_PRICE_AMT         12.2
     @249 PRVDR_NUM                        $char10.  /*  Encrypted  */
     @259 PRVDR_NPI                        $char10.  /*  Encrypted  */
     @271 DMERC_LINE_PRCNG_STATE_CD        $char2.
     @273 PRVDR_STATE_CD                   $char2.
     @275 DMERC_LINE_SUPPLR_TYPE_CD        $char1.
     @276 HCPCS_3RD_MDFR_CD                $char5.
     @281 HCPCS_4TH_MDFR_CD                $char5.
     @286 DMERC_LINE_SCRN_SVGS_AMT         12.2
     @298 DMERC_LINE_MTUS_CNT              11.3
     @309 DMERC_LINE_MTUS_CD               $char1.
     @310 LINE_HCT_HGB_RSLT_NUM            4.1
     @314 LINE_HCT_HGB_TYPE_CD             $char2.
     @316 LINE_NDC_CD                      $char11.
     @327 LINE_OTHR_APLD_IND_CD1           $char1.
     @328 LINE_OTHR_APLD_IND_CD2           $char1.
     @329 LINE_OTHR_APLD_IND_CD3           $char1.
     @330 LINE_OTHR_APLD_IND_CD4           $char1.
     @331 LINE_OTHR_APLD_IND_CD5           $char1.
     @332 LINE_OTHR_APLD_IND_CD6           $char1.
     @333 LINE_OTHR_APLD_IND_CD7           $char1.
     @334 LINE_OTHR_APLD_AMT1              12.2
     @346 LINE_OTHR_APLD_AMT2              12.2
     @358 LINE_OTHR_APLD_AMT3              12.2
     @370 LINE_OTHR_APLD_AMT4              12.2
     @382 LINE_OTHR_APLD_AMT5              12.2
     @394 LINE_OTHR_APLD_AMT6              12.2
     @406 LINE_OTHR_APLD_AMT7              12.2
     @418 LINE_RSDL_PYMT_IND_CD            $char1.
     @419 LINE_RP_IND_CD                   $char1.
     @420 DMERC_LINE_FRGN_ADR_IND          $char2.
     @422 LINE_RR_BRD_EXCLSN_IND_SW        $char1.
   ;

  label
    PATIENT_ID                       = "Patient ID"
    CLM_ID                           = "Encrypted Claim ID"
    LINE_NUM                         = "Claim Line Number"
    NCH_CLM_TYPE_CD                  = "NCH Claim Type Code"
    CLM_THRU_DT                      = "Claim Through Date (Determines Year of Claim)"
    TAX_NUM                          = "Line Provider Tax Number"
    PRVDR_SPCLTY                     = "Line HCFA Provider Specialty Code"
    PRTCPTNG_IND_CD                  = "Line Provider Participating Indicator Code"
    LINE_SRVC_CNT                    = "Line Service Count"
    LINE_CMS_TYPE_SRVC_CD            = "Line HCFA Type Service Code"
    LINE_PLACE_OF_SRVC_CD            = "Line Place Of Service Code"
    LINE_1ST_EXPNS_DT                = "Line First Expense Date"
    LINE_LAST_EXPNS_DT               = "Line Last Expense Date"
    HCPCS_CD                         = "Line Healthcare Common Procedure Coding System"
    HCPCS_1ST_MDFR_CD                = "Line HCPCS Initial Modifier Code"
    HCPCS_2ND_MDFR_CD                = "Line HCPCS Second Modifier Code"
    BETOS_CD                         = "Line NCH BETOS Code"
    LINE_NCH_PMT_AMT                 = "Line NCH Payment Amount"
    LINE_BENE_PMT_AMT                = "Line Beneficiary Payment Amount"
    LINE_PRVDR_PMT_AMT               = "Line Provider Payment Amount"
    LINE_BENE_PTB_DDCTBL_AMT         = "Line Beneficiary Part B Deductible Amount"
    LINE_BENE_PRMRY_PYR_CD           = "Line Beneficiary Primary Payer Code"
    LINE_BENE_PRMRY_PYR_PD_AMT       = "Line Beneficiary Primary Payer Paid Amount"
    LINE_COINSRNC_AMT                = "Line Coinsurance Amount"
    LINE_PRMRY_ALOWD_CHRG_AMT        = "Line Primary Payer Allowed Charge Amount"
    LINE_SBMTD_CHRG_AMT              = "Line Submitted Charge Amount"
    LINE_ALOWD_CHRG_AMT              = "Line Allowed Charge Amount"
    LINE_PRCSG_IND_CD                = "Line Processing Indicator Code"
    LINE_PMT_80_100_CD               = "Line Payment 80%/100% Code"
    LINE_SERVICE_DEDUCTIBLE          = "Line Service Deductible Indicator Switch"
    LINE_ICD_DGNS_CD                 = "Line Diagnosis Code Code"
    LINE_ICD_DGNS_VRSN_CD            = "Line Diagnosis Code Diagnosis Version Code (ICD-9 or ICD-10)"
    LINE_DME_PRCHS_PRICE_AMT         = "Line DME Purchase Price Amount"
    PRVDR_NUM                        = "DMERC Line Supplier Provider Number"
    PRVDR_NPI                        = "DMERC Line Item Supplier NPI Number"
    DMERC_LINE_PRCNG_STATE_CD        = "DMERC Line Pricing State Code"
    PRVDR_STATE_CD                   = "DMERC Line Provider State Code"
    DMERC_LINE_SUPPLR_TYPE_CD        = "DMERC Line Supplier Type Code"
    HCPCS_3RD_MDFR_CD                = "DMERC Line HCPCS Third Modifier Code"
    HCPCS_4TH_MDFR_CD                = "DMERC Line HCPCS Fourth Modifier Code"
    DMERC_LINE_SCRN_SVGS_AMT         = "DMERC Line Screen Savings Amount"
    DMERC_LINE_MTUS_CNT              = "DMERC Line Miles/Time/Units/Services Count"
    DMERC_LINE_MTUS_CD               = "DMERC Line Miles/Time/ Units/Services Indicator Code"
    LINE_HCT_HGB_RSLT_NUM            = "Hematocrit/Hemoglobin Test Results"
    LINE_HCT_HGB_TYPE_CD             = "Hematocrit/Hemoglobin Test Type code"
    LINE_NDC_CD                      = "Line National Drug Code"
    LINE_OTHR_APLD_IND_CD1           = "Line Other Applied Indicator Code 1"
    LINE_OTHR_APLD_IND_CD2           = "Line Other Applied Indicator Code 2"
    LINE_OTHR_APLD_IND_CD3           = "Line Other Applied Indicator Code 3"
    LINE_OTHR_APLD_IND_CD4           = "Line Other Applied Indicator Code 4"
    LINE_OTHR_APLD_IND_CD5           = "Line Other Applied Indicator Code 5"
    LINE_OTHR_APLD_IND_CD6           = "Line Other Applied Indicator Code 6"
    LINE_OTHR_APLD_IND_CD7           = "Line Other Applied Indicator Code 7"
    LINE_OTHR_APLD_AMT1              = "Line Other Applied Amount 1"
    LINE_OTHR_APLD_AMT2              = "Line Other Applied Amount 2"
    LINE_OTHR_APLD_AMT3              = "Line Other Applied Amount 3"
    LINE_OTHR_APLD_AMT4              = "Line Other Applied Amount 4"
    LINE_OTHR_APLD_AMT5              = "Line Other Applied Amount 5"
    LINE_OTHR_APLD_AMT6              = "Line Other Applied Amount 6"
    LINE_OTHR_APLD_AMT7              = "Line Other Applied Amount 7"
    LINE_RSDL_PYMT_IND_CD            = "Line Residual Payment Indicator Code"
    LINE_RP_IND_CD                   = "Line Representative Payee (RP) Indicator Code"
    DMERC_LINE_FRGN_ADR_IND          = "Line Foreign Address Indicator"
    LINE_RR_BRD_EXCLSN_IND_SW        = "Line Railroad Board Exclusion Indicator Switch"
  ;
run;

proc sort data = Dmebase;
by PATIENT_ID CLM_ID;
run;

proc sort data = Dmeline;
by PATIENT_ID CLM_ID;
run;
data DME;
merge Dmebase Dmeline;
by PATIENT_ID CLM_ID;
run;




proc export data = DME
outfile = "SASData/Dme.csv"
    dbms=csv
    replace;
run;
