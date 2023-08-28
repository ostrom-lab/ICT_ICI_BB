filename pdein ('RawData/pdesaf2014.txt','RawData/pdesaf2015.txt','RawData/pdesaf2016.txt','RawData/pdesaf2017.txt','RawData/pdesaf2018.txt','RawData/pdesaf2019.txt');                      
/*reading in an un-zipped file*/

data pdesaf;
  infile pdein lrecl=361 missover pad;
  input @00001 PDE_ID                           $char15.    /*  Encrypted  */
        @00016 patient_id                       $CHAR15.  /*  Patient ID (for either Cancer or Non-Cancer Patients) */
        @00031 SRVC_DT                          $char8.  /*  YYMMDD8  */
        @00039 PD_DT                            $char8.  /*  YYMMDD8  */
        @00047 PRSCRBR_ID_QLFYR_CD              $char2.
        @00049 PRSCRBR_ID                       $char15.
        @00064 PROD_SRVC_ID                     $char19.
        @00083 PLAN_CNTRCT_REC_ID               $char5.
        @00088 PLAN_PBP_REC_NUM                 $char3.
        @00091 CMPND_CD                         2.
        @00093 DAW_PROD_SLCTN_CD                $char1.
        @00094 QTY_DSPNSD_NUM                   12.3
        @00106 DAYS_SUPLY_NUM                   3.
        @00109 FILL_NUM                         3.
        @00112 DSPNSNG_STUS_CD                  $char1.
        @00113 DRUG_CVRG_STUS_CD                $char1.
        @00114 PRCNG_EXCPTN_CD                  $char1.
        @00115 CTSTRPHC_CVRG_CD                 $char1.
        @00116 GDC_BLW_OOPT_AMT                 10.2
        @00126 GDC_ABV_OOPT_AMT                 10.2
        @00136 PTNT_PAY_AMT                     10.2
        @00146 OTHR_TROOP_AMT                   10.2
        @00156 LICS_AMT                         10.2
        @00166 PLRO_AMT                         10.2
        @00176 CVRD_D_PLAN_PD_AMT               10.2
        @00186 NCVRD_PLAN_PD_AMT                10.2
        @00196 TOT_RX_CST_AMT                   10.2
        @00206 BN                               $char30.
        @00236 GCDF                             $char2.
        @00238 GCDF_DESC                        $char40.
        @00278 STR                              $char10.
        @00288 GNN                              $char30.
        @00318 BENEFIT_PHASE                    $char2.
        @00320 PDE_PRSCRBR_ID_FRMT_CD           $char1.
        @00321 FORMULARY_ID                     $char8.
        @00329 FRMLRY_RX_ID                     $char8.
        @00337 NCPDP_ID                         $char7.
        @00344 RX_ORGN_CD                       $char1.
        @00345 RPTD_GAP_DSCNT_NUM               10.2
        @00355 BRND_GNRC_CD                     $char1.
        @00356 PHRMCY_SRVC_TYPE_CD              $char2.
        @00358 PTNT_RSDNC_CD                    $char2.
        @00360 SUBMSN_CLR_CD                    $char2.
    ;

  label PDE_ID                           = "Encrypted 723 PDE ID"
        patient_id                       = "Patient ID"
        SRVC_DT                          = "RX Service Date (DOS)"
        PD_DT                            = "Paid Date"
        PRSCRBR_ID_QLFYR_CD              = "Prescriber ID Qualifier Code"
        PRSCRBR_ID                       = "Prescriber ID"
        PROD_SRVC_ID                     = "Product Service ID"
        PLAN_CNTRCT_REC_ID               = "Plan Contract Record ID"
        PLAN_PBP_REC_NUM                 = "Plan PBP Record Number"
        CMPND_CD                         = "Compound Code"
        DAW_PROD_SLCTN_CD                = "Dispense as Written (DAW) Product Selection Code"
        QTY_DSPNSD_NUM                   = "Quantity Dispensed"
        DAYS_SUPLY_NUM                   = "Days Supply"
        FILL_NUM                         = "Fill Number"
        DSPNSNG_STUS_CD                  = "Dispensing Status Code"
        DRUG_CVRG_STUS_CD                = "Drug Coverage Status Code"
        PRCNG_EXCPTN_CD                  = "Pricing Exception Code"
        CTSTRPHC_CVRG_CD                 = "Catastrophic Coverage Code"
        GDC_BLW_OOPT_AMT                 = "Gross Drug Cost Below Out-of-Pocket Threshold (GDCB)"
        GDC_ABV_OOPT_AMT                 = "Gross Drug Cost Above Out-of-Pocket Threshold (GDCA)"
        PTNT_PAY_AMT                     = "Patient Pay Amount"
        OTHR_TROOP_AMT                   = "Other TrOOP Amount"
        LICS_AMT                         = "Low Income Cost Sharing Subsidy Amount (LICS)"
        PLRO_AMT                         = "Patient Liability Reduction Due to Other Payer Amount (PLRO)"
        CVRD_D_PLAN_PD_AMT               = "Covered D Plan Paid Amount (CPP)"
        NCVRD_PLAN_PD_AMT                = "Non-Covered Plan Paid Amount (NPP)"
        TOT_RX_CST_AMT                   = "Gross Drug Cost"
        BN                               = "Brand Name"
        GCDF                             = "Dosage Form Code"
        GCDF_DESC                        = "Dosage Form Code Description"
        STR                              = "Drug Strength Description"
        GNN                              = "Generic Name - Short Version"
        BENEFIT_PHASE                    = "The benefit phase of the Part D Event"
        PDE_PRSCRBR_ID_FRMT_CD           = "PDE Prescriber ID Format Code"
        FORMULARY_ID                     = "Formulary ID. First Column of Composite Foreign Key to Formulary File"
        FRMLRY_RX_ID                     = "Formulary Rx ID. Second Column of Composite Foreign Key to Formulary File"
        NCPDP_ID                         = "NCPDP Proprietary Pharmacy Identifier"
        RX_ORGN_CD                       = "Prescription Origin Code"
        RPTD_GAP_DSCNT_NUM               = "Gap Discount Amount reported by the Submitting Plan"
        BRND_GNRC_CD                     = "The Brand-Generic Code reported by the submitting plan"
        PHRMCY_SRVC_TYPE_CD              = "Pharmacy Service Type Code"
        PTNT_RSDNC_CD                    = "Patient Residence Code"
        SUBMSN_CLR_CD                    = "Submission Clarification Code"
        ;

run;


proc export data = pdesaf
outfile = "Data\pdesaf1419.csv"
dbms = csv;
run;
