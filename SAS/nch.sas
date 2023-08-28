filename nchbase  'RawData\\nch*.base.txt';                   
/*reading in an un-zipped file*/

data nchbase;
  infile nchbase lrecl=395 missover pad;
  INPUT
     @001  PATIENT_ID                       $char15. /* Patient ID (for either Cancer or Non-Cancer Patients) */
     @016  CLM_ID                           $char15.  /*  Encrypted  */
     @031  NCH_NEAR_LINE_REC_IDENT_CD       $char1.
     @032  NCH_CLM_TYPE_CD                  $char2.
     @034  CLM_FROM_DT                      $char8.  /*  YYMMDD8  */
     @042  CLM_THRU_DT                      $char8.  /*  YYMMDD8  */
     @050  NCH_WKLY_PROC_DT                 $char8.  /*  YYMMDD8  */
     @058  CARR_CLM_ENTRY_CD                $char1.
     @059  CLM_DISP_CD                      $char2.
     @061  CARR_NUM                         $char5.
     @066  CARR_CLM_PMT_DNL_CD              $char2.
     @068  CLM_PMT_AMT                      12.2
     @080  CARR_CLM_PRMRY_PYR_PD_AMT        12.2
     @092  RFR_PHYSN_UPIN                   $char6.   /*  Encrypted  */
     @104  RFR_PHYSN_NPI                    $char10.  /*  Encrypted  */
     @116  CARR_CLM_PRVDR_ASGNMT_IND_SW     $char1.
     @117  NCH_CLM_PRVDR_PMT_AMT            12.2
     @129  NCH_CLM_BENE_PMT_AMT             12.2
     @141  NCH_CARR_CLM_SBMTD_CHRG_AMT      12.2
     @153  NCH_CARR_CLM_ALOWD_AMT           12.2
     @165  CARR_CLM_CASH_DDCTBL_APLD_AMT    12.2
     @177  CARR_CLM_HCPCS_YR_CD             $char1.
     @178  CARR_CLM_RFRNG_PIN_NUM           $char10.  /*  Encrypted  */
     @192  PRNCPAL_DGNS_CD                  $char7.
     @199  PRNCPAL_DGNS_VRSN_CD             $char1.
     @200  ICD_DGNS_CD1                     $char7.
     @207  ICD_DGNS_VRSN_CD1                $char1.
     @208  ICD_DGNS_CD2                     $char7.
     @215  ICD_DGNS_VRSN_CD2                $char1.
     @216  ICD_DGNS_CD3                     $char7.
     @223  ICD_DGNS_VRSN_CD3                $char1.
     @224  ICD_DGNS_CD4                     $char7.
     @231  ICD_DGNS_VRSN_CD4                $char1.
     @232  ICD_DGNS_CD5                     $char7.
     @239  ICD_DGNS_VRSN_CD5                $char1.
     @240  ICD_DGNS_CD6                     $char7.
     @247  ICD_DGNS_VRSN_CD6                $char1.
     @248  ICD_DGNS_CD7                     $char7.
     @255  ICD_DGNS_VRSN_CD7                $char1.
     @256  ICD_DGNS_CD8                     $char7.
     @263  ICD_DGNS_VRSN_CD8                $char1.
     @264  ICD_DGNS_CD9                     $char7.
     @271  ICD_DGNS_VRSN_CD9                $char1.
     @272  ICD_DGNS_CD10                    $char7.
     @279  ICD_DGNS_VRSN_CD10               $char1.
     @280  ICD_DGNS_CD11                    $char7.
     @287  ICD_DGNS_VRSN_CD11               $char1.
     @288  ICD_DGNS_CD12                    $char7.
     @295  ICD_DGNS_VRSN_CD12               $char1.
     @296  CLM_CLNCL_TRIL_NUM               $char8.
     @304  DOB_YEAR                         $char4.
     @312  GNDR_CD                          $char1.
     @313  BENE_RACE_CD                     $char1.
     @314  BENE_CNTY_CD                     $char3.
     @317  BENE_STATE_CD                    $char2.
     @319  BENE_MLG_CNTCT_ZIP_CD            $char9.   /*  Encrypted  */
     @328  CLM_BENE_PD_AMT                  12.2
     @340  CPO_PRVDR_NUM                    $CHAR12.
     @352  CPO_ORG_NPI_NUM                  $CHAR10.  /*  Encrypted  */
     @362  CARR_CLM_BLG_NPI_NUM             $CHAR10.  /*  Encrypted  */
     @372  ACO_ID_NUM                       $CHAR10.  /*  Encrypted  */
     @382  CARR_CLM_SOS_NPI_NUM             $CHAR10.  /*  Encrypted  */
     @392  CLM_BENE_ID_TYPE_CD              $CHAR1.
     @393  CLM_RSDL_PYMT_IND_CD             $CHAR1.
     @394  PRVDR_VLDTN_TYPE_CD              $CHAR2.
    ;

  label
     PATIENT_ID = "Patient ID"
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
     RFR_PHYSN_UPIN                   = "Carrier Claim Refering Physician UPIN Number"
     RFR_PHYSN_NPI                    = "Carrier Claim Refering Physician NPI Number"
     CARR_CLM_PRVDR_ASGNMT_IND_SW     = "Carrier Claim Provider Assignment Indicator Switch"
     NCH_CLM_PRVDR_PMT_AMT            = "NCH Claim Provider Payment Amount"
     NCH_CLM_BENE_PMT_AMT             = "NCH Claim Beneficiary Payment Amount"
     NCH_CARR_CLM_SBMTD_CHRG_AMT      = "NCH Carrier Claim Submitted Charge Amount"
     NCH_CARR_CLM_ALOWD_AMT           = "NCH Carrier Claim Allowed Charge Amount"
     CARR_CLM_CASH_DDCTBL_APLD_AMT    = "Carrier Claim Cash Deductible Applied Amount"
     CARR_CLM_HCPCS_YR_CD             = "Carrier Claim HCPCS Year Code"
     CARR_CLM_RFRNG_PIN_NUM           = "Carrier Claim Referring PIN Number"
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
     CLM_CLNCL_TRIL_NUM               = "Clinical Trial Number"
     DOB_YEAR                         = "Year of Birth from Claim (Date)"
     GNDR_CD                          = "Gender Code from Claim"
     BENE_RACE_CD                     = "Race Code from Claim"
     BENE_CNTY_CD                     = "County Code from Claim (SSA)"
     BENE_STATE_CD                    = "State Code from Claim (SSA)"
     BENE_MLG_CNTCT_ZIP_CD            = "Zip Code of Residence from Claim"
     CLM_BENE_PD_AMT                  = "Carrier Claim Beneficiary Paid Amount"
     CPO_PRVDR_NUM                    = "Care Plan Oversight (CPO) Provider Number"
     CPO_ORG_NPI_NUM                  = "CPO Organization NPI Number"
     CARR_CLM_BLG_NPI_NUM             = "Carrier Claim Billing NPI Number"
     ACO_ID_NUM                       = "Claim Accountable Care Organization (ACO) Identification Number"
     CARR_CLM_SOS_NPI_NUM             = "Carrier Claim Site of Service NPI Number"
     CLM_BENE_ID_TYPE_CD              = "For CMS Internal Use Only"
     CLM_RSDL_PYMT_IND_CD             = "Claim Residual Payment Indicator Code"
     PRVDR_VLDTN_TYPE_CD              = "Provider Validation Type Code"
    ;
run;


filename nchline  'RawData\\nch*.line.txt';                   
/*reading in an un-zipped file*/

data nchline;
  infile nchline lrecl=511 missover pad;
  INPUT
     @001  PATIENT_ID                       $char15. /* Patient ID (for either Cancer or Non-Cancer Patients) */
     @016  CLM_ID                           $char15.  /*  Encrypted  */
     @031  LINE_NUM                         $char13.
     @044  NCH_CLM_TYPE_CD                  $char2.
     @046  CLM_THRU_DT                      $char8.  /*  YYMMDD8  */
     @054  CARR_PRFRNG_PIN_NUM              $char10.  /*  Encrypted  */
     @069  PRF_PHYSN_UPIN                   $char6.   /*  Encrypted  */
     @081  PRF_PHYSN_NPI                    $char10.  /*  Encrypted  */
     @093  ORG_NPI_NUM                      $char10.  /*  Encrypted  */
     @103  CARR_LINE_PRVDR_TYPE_CD          $char1.
     @104  TAX_NUM                          $char10.  /*  Encrypted  */
     @114  PRVDR_STATE_CD                   $char2.
     @116  PRVDR_ZIP                        $char9.   /*  Encrypted  */
     @125  PRVDR_SPCLTY                     $char3.
     @128  PRTCPTNG_IND_CD                  $char1.
     @129  CARR_LINE_RDCD_PMT_PHYS_ASTN_C   $char1.
     @130  LINE_SRVC_CNT                    11.3
     @141  LINE_CMS_TYPE_SRVC_CD            $char1.
     @142  LINE_PLACE_OF_SRVC_CD            $char2.
     @144  CARR_LINE_PRCNG_LCLTY_CD         $char2.
     @146  LINE_1ST_EXPNS_DT                $char8.  /*  YYMMDD8  */
     @154  LINE_LAST_EXPNS_DT               $char8.  /*  YYMMDD8  */
     @162  HCPCS_CD                         $char5.
     @167  HCPCS_1ST_MDFR_CD                $char5.
     @172  HCPCS_2ND_MDFR_CD                $char5.
     @177  BETOS_CD                         $char3.
     @180  LINE_NCH_PMT_AMT                 12.2
     @192  LINE_BENE_PMT_AMT                12.2
     @204  LINE_PRVDR_PMT_AMT               12.2
     @216  LINE_BENE_PTB_DDCTBL_AMT         12.2
     @228  LINE_BENE_PRMRY_PYR_CD           $char1.
     @229  LINE_BENE_PRMRY_PYR_PD_AMT       12.2
     @241  LINE_COINSRNC_AMT                12.2
     @253  LINE_SBMTD_CHRG_AMT              12.2
     @265  LINE_ALOWD_CHRG_AMT              12.2
     @277  LINE_PRCSG_IND_CD                $char2.
     @279  LINE_PMT_80_100_CD               $char1.
     @280  LINE_SERVICE_DEDUCTIBLE          $char1.
     @281  CARR_LINE_MTUS_CNT               11.3
     @292  CARR_LINE_MTUS_CD                $char1.
     @293  LINE_ICD_DGNS_CD                 $char7.
     @300  LINE_ICD_DGNS_VRSN_CD            $char1.
     @301  HPSA_SCRCTY_IND_CD               $char1.
     @302  CARR_LINE_RX_NUM                 $char30.  /*  Encrypted  */
     @332  LINE_HCT_HGB_RSLT_NUM            4.1
     @336  LINE_HCT_HGB_TYPE_CD             $char2.
     @338  LINE_NDC_CD                      $char11.
     @349  CARR_LINE_CLIA_LAB_NUM           $char10.
     @359  CARR_LINE_ANSTHSA_UNIT_CNT       11.3
     @370  CARR_LINE_CL_CHRG_AMT            12.2
     @382  PHYSN_ZIP_CD                     $CHAR15.  /*  Encrypted  */
     @397  LINE_OTHR_APLD_IND_CD1           $CHAR1.
     @398  LINE_OTHR_APLD_IND_CD2           $CHAR1.
     @399  LINE_OTHR_APLD_IND_CD3           $CHAR1.
     @400  LINE_OTHR_APLD_IND_CD4           $CHAR1.
     @401  LINE_OTHR_APLD_IND_CD5           $CHAR1.
     @402  LINE_OTHR_APLD_IND_CD6           $CHAR1.
     @403  LINE_OTHR_APLD_IND_CD7           $CHAR1.
     @404  LINE_OTHR_APLD_AMT1              12.2
     @416  LINE_OTHR_APLD_AMT2              12.2
     @428  LINE_OTHR_APLD_AMT3              12.2
     @440  LINE_OTHR_APLD_AMT4              12.2
     @452  LINE_OTHR_APLD_AMT5              12.2
     @464  LINE_OTHR_APLD_AMT6              12.2
     @476  LINE_OTHR_APLD_AMT7              12.2
     @488  THRPY_CAP_IND_CD1                $CHAR1.
     @489  THRPY_CAP_IND_CD2                $CHAR1.
     @490  THRPY_CAP_IND_CD3                $CHAR1.
     @491  THRPY_CAP_IND_CD4                $CHAR1.
     @492  THRPY_CAP_IND_CD5                $CHAR1.
     @493  CLM_NEXT_GNRTN_ACO_IND_CD1       $CHAR1.
     @494  CLM_NEXT_GNRTN_ACO_IND_CD2       $CHAR1.
     @495  CLM_NEXT_GNRTN_ACO_IND_CD3       $CHAR1.
     @496  CLM_NEXT_GNRTN_ACO_IND_CD4       $CHAR1.
     @497  CLM_NEXT_GNRTN_ACO_IND_CD5       $CHAR1.
     @498  CARR_LINE_MDPP_NPI_NUM           $CHAR10.  /*  Encrypted  */
     @508  LINE_RSDL_PYMT_IND_CD            $CHAR1.
     @509  LINE_RP_IND_CD                   $CHAR1.
     @510  LINE_PRVDR_VLDTN_TYPE_CD         $CHAR2.
    ;

  label
      PATIENT_ID                       = "Patient ID"
      CLM_ID                           = "Encrypted Claim ID"
      LINE_NUM                         = "Claim Line Number"
      NCH_CLM_TYPE_CD                  = "NCH Claim Type Code"
      CLM_THRU_DT                      = "Claim Through Date (Determines Year of Claim)"
      CARR_PRFRNG_PIN_NUM              = "Carrier Line Claim Performing PIN Number"
      PRF_PHYSN_UPIN                   = "Carrier Line Performing UPIN Number"
      PRF_PHYSN_NPI                    = "Carrier Line Performing NPI Number"
      ORG_NPI_NUM                      = "Carrier Line Performing Group NPI Number"
      CARR_LINE_PRVDR_TYPE_CD          = "Carrier Line Provider Type Code"
      TAX_NUM                          = "Line Provider Tax Number"
      PRVDR_STATE_CD                   = "Line NCH Provider State Code"
      PRVDR_ZIP                        = "Carrier Line Performing Provider ZIP Code"
      PRVDR_SPCLTY                     = "Line HCFA Provider Specialty Code"
      PRTCPTNG_IND_CD                  = "Line Provider Participating Indicator Code"
      CARR_LINE_RDCD_PMT_PHYS_ASTN_C   = "Carrier Line Reduced Payment Physician Assistant Code"
      LINE_SRVC_CNT                    = "Line Service Count"
      LINE_CMS_TYPE_SRVC_CD            = "Line HCFA Type Service Code"
      LINE_PLACE_OF_SRVC_CD            = "Line Place Of Service Code"
      CARR_LINE_PRCNG_LCLTY_CD         = "Carrier Line Pricing Locality Code"
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
      LINE_SBMTD_CHRG_AMT              = "Line Submitted Charge Amount"
      LINE_ALOWD_CHRG_AMT              = "Line Allowed Charge Amount"
      LINE_PRCSG_IND_CD                = "Line Processing Indicator Code"
      LINE_PMT_80_100_CD               = "Line Payment 80%/100% Code"
      LINE_SERVICE_DEDUCTIBLE          = "Line Service Deductible Indicator Switch"
      CARR_LINE_MTUS_CNT               = "Carrier Line Miles/Time/Units/Services Count"
      CARR_LINE_MTUS_CD                = "Carrier Line Miles/Time/Units/Services Indicator Code"
      LINE_ICD_DGNS_CD                 = "Line Diagnosis Code Code"
      LINE_ICD_DGNS_VRSN_CD            = "Line Diagnosis Code Diagnosis Version Code (ICD-9 or ICD-10)"
      HPSA_SCRCTY_IND_CD               = "Carrier Line HPSA/Scarcity Indicator Code"
      CARR_LINE_RX_NUM                 = "Carrier Line RX Number"
      LINE_HCT_HGB_RSLT_NUM            = "Hematocrit/Hemoglobin Test Results"
      LINE_HCT_HGB_TYPE_CD             = "Hematocrit/Hemoglobin Test Type code"
      LINE_NDC_CD                      = "Line National Drug Code"
      CARR_LINE_CLIA_LAB_NUM           = "Clinical Laboratory Improvement Amendments monitored laboratory number"
      CARR_LINE_ANSTHSA_UNIT_CNT       = "Carrier Line Anesthesia Unit Count"
      CARR_LINE_CL_CHRG_AMT            = "Carrier Line Clinical Lab Charge Amount"
      PHYSN_ZIP_CD                     = "Line Place Of Service (POS) Physician Zip Code"
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
      THRPY_CAP_IND_CD1                = "Line Therapy Cap Indicator Code 1"
      THRPY_CAP_IND_CD2                = "Line Therapy Cap Indicator Code 2"
      THRPY_CAP_IND_CD3                = "Line Therapy Cap Indicator Code 3"
      THRPY_CAP_IND_CD4                = "Line Therapy Cap Indicator Code 4"
      THRPY_CAP_IND_CD5                = "Line Therapy Cap Indicator Code 5"
      CLM_NEXT_GNRTN_ACO_IND_CD1       = "Claim Next Generation Accountable Care Organization Indicator Code 1"
      CLM_NEXT_GNRTN_ACO_IND_CD2       = "Claim Next Generation Accountable Care Organization Indicator Code 2"
      CLM_NEXT_GNRTN_ACO_IND_CD3       = "Claim Next Generation Accountable Care Organization Indicator Code 3"
      CLM_NEXT_GNRTN_ACO_IND_CD4       = "Claim Next Generation Accountable Care Organization Indicator Code 4"
      CLM_NEXT_GNRTN_ACO_IND_CD5       = "Claim Next Generation Accountable Care Organization Indicator Code 5"
      CARR_LINE_MDPP_NPI_NUM           = "Carrier Line Medicare Diabetes Prevention Program (MDPP) NPI Number"
      LINE_RSDL_PYMT_IND_CD            = "Line Residual Payment Indicator Code"
      LINE_RP_IND_CD                   = "Line Representative Payee (RP) Indicator Code"
      LINE_PRVDR_VLDTN_TYPE_CD         = "Line Provider Validation Type Code"
    ;
run;

proc sort data = nchbase;
by PATIENT_ID CLM_ID;
run;
proc sort data = nchline;
by PATIENT_ID CLM_ID;
run;

data SAS.nch;
merge nchbase nchline;
by PATIENT_ID CLM_ID;
keep PATIENT_ID CLM_ID CLM_FROM_DT CLM_THRU_DT PRNCPAL_DGNS_CD ICD_DGNS_CD1 ICD_DGNS_CD2 ICD_DGNS_CD3
	 ICD_DGNS_CD4 ICD_DGNS_CD5 ICD_DGNS_CD6 ICD_DGNS_CD7 ICD_DGNS_CD8 ICD_DGNS_CD9 
	 ICD_DGNS_CD10 ICD_DGNS_CD11 ICD_DGNS_CD12 HCPCS_CD HCPCS_1ST_MDFR_CD LINE_NDC_CD;
run;

/*
data output.nch_org;
set output.nch;
run;


proc export data = work2.nch
outfile = "P:\Pro00109659 - SEER-Medicare BT Epi\SEER_Medicare\Output\nch.csv"
dbms = csv;
run;*/
