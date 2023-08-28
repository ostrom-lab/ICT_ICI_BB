filename pdein ('RawData/pdesaf2013.txt','RawData/pdesaf2012.txt');                      
/*reading in an un-zipped file*/

data pdesaf;
  infile pdein lrecl=361 missover pad;
  input @00001 PDE_ID                           $char15.  /*  Encrypted  */
        @00016 patient_id                       $CHAR15.  /*  Patient ID (for either Cancer or Non-Cancer Patients) */
        @00031 SRVC_DT                          $char8.  /*  YYMMDD8  */
        @00039 PD_DT                            $char8.  /*  YYMMDD8  */
        @00047 PROD_SRVC_ID                     $char19.
        @00066 PLAN_CNTRCT_REC_ID               $char5.
        @00071 PLAN_PBP_REC_NUM                 $char3.
        @00074 CMPND_CD                         2.
        @00076 DAW_PROD_SLCTN_CD                $char1.
        @00077 QTY_DSPNSD_NUM                   12.3
        @00089 DAYS_SUPLY_NUM                   3.
        @00092 FILL_NUM                         3.
        @00095 DSPNSNG_STUS_CD                  $char1.
        @00096 DRUG_CVRG_STUS_CD                $char1.
        @00097 PRCNG_EXCPTN_CD                  $char1.
        @00098 CTSTRPHC_CVRG_CD                 $char1.
        @00099 GDC_BLW_OOPT_AMT                 10.2
        @00109 GDC_ABV_OOPT_AMT                 10.2
        @00119 PTNT_PAY_AMT                     10.2
        @00129 OTHR_TROOP_AMT                   10.2
        @00139 LICS_AMT                         10.2
        @00149 PLRO_AMT                         10.2
        @00159 CVRD_D_PLAN_PD_AMT               10.2
        @00169 NCVRD_PLAN_PD_AMT                10.2
        @00179 TOT_RX_CST_AMT                   10.2
        @00189 BN                               $char30.
        @00219 GCDF                             $char2.
        @00221 GCDF_DESC                        $char40.
        @00261 STR                              $char10.
        @00271 GNN                              $char30.
        @00301 BENEFIT_PHASE                    $char2.
        @00303 CCW_PHARMACY_ID                  12.
        @00315 CCW_PRSCRBR_ID                   12.
        @00327 PDE_PRSCRBR_ID_FRMT_CD           $char1.
        @00328 FORMULARY_ID                     $char8.
        @00336 FRMLRY_RX_ID                     $char8.
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
        CCW_PHARMACY_ID                  = "CCW Pharmacy ID from Pharmacy Characteristics File"
        CCW_PRSCRBR_ID                   = "CCW Prescriber ID from Prescriber Characteristics File"
        PDE_PRSCRBR_ID_FRMT_CD           = "PDE Prescriber ID Format Code"
        FORMULARY_ID                     = "Formulary ID. First Column of Composite Foreign Key to Formulary File"
        FRMLRY_RX_ID                     = "Formulary Rx ID. Second Column of Composite Foreign Key to Formulary File"
        RX_ORGN_CD                       = "Prescription Origin Code"
        RPTD_GAP_DSCNT_NUM               = "Gap Discount Amount reported by the Submitting Plan"
        BRND_GNRC_CD                     = "The Brand-Generic Code reported by the submitting plan"
        PHRMCY_SRVC_TYPE_CD              = "Pharmacy Service Type Code"
        PTNT_RSDNC_CD                    = "Patient Residence Code"
        SUBMSN_CLR_CD                    = "Submission Clarification Code"
        ;
run;

proc export data = pdesaf
outfile = "Data\pdesaf1213.csv"
dbms = csv;
run;
