filename mbsf_ab 'RawData/mbsf.ab.summary.*.txt';                   
/* reading in an un-zipped file */


data mbsf_ab;
  infile mbsf_ab lrecl=114 missover pad;
  input
        @00001 patient_id                $char15. /* Patient ID (for either Cancer or Non-Cancer Patients) */
        @00016 BENE_ENROLLMT_REF_YR             4.
        @00020 ENRL_SRC                         $3.
        @00023 FIVE_PERCENT_FLAG                $1.
/* SUMSTAT variable is used for the Non cancer patients to indicate if patient ever had cancer*/
/* SUMSTAT = 1 (No known cancer) or 2 (has cancer)*/
/*      @00023 SUMSTAT                          $1. */ /*This variable takes the place of the five percent flag*/ 
        @00024 ENHANCED_FIVE_PERCENT_FLAG       $1.
        @00025 COVSTART                         $char8.  /*  YYMMDD8  */
        @00033 CRNT_BIC_CD                      $2.
        @00035 STATE_CODE                       $2.
        @00037 BENE_COUNTY_CD                   $3.
        @00040 BENE_ZIP_CD                      $9.      /*  Encrypted  */
        @00049 BENE_AGE_AT_END_REF_YR           3.
        @00052 BENE_BIRTH_DT                    $char8.  /*  YYMMDD8  */
        @00060 BENE_VALID_DEATH_DT_SW           $1.
        @00061 BENE_DEATH_DT                    $char8.  /*  YYMMDD8  */
        @00069 BENE_SEX_IDENT_CD                $1.
        @00070 BENE_RACE_CD                     $1.
        @00071 RTI_RACE_CD                      $1.
        @00072 BENE_ENTLMT_RSN_ORIG             $1.
        @00073 BENE_ENTLMT_RSN_CURR             $1.
        @00074 BENE_ESRD_IND                    $1.
        @00075 BENE_MDCR_STATUS_CD              $2.
        @00077 BENE_PTA_TRMNTN_CD               $1.
        @00078 BENE_PTB_TRMNTN_CD               $1.
        @00079 BENE_HI_CVRAGE_TOT_MONS          3.
        @00082 BENE_SMI_CVRAGE_TOT_MONS         3.
        @00085 BENE_STATE_BUYIN_TOT_MONS        3.
        @00088 BENE_HMO_CVRAGE_TOT_MONS         3.
        @00091 BENE_MDCR_ENTLMT_BUYIN_IND_01    $1.
        @00092 BENE_MDCR_ENTLMT_BUYIN_IND_02    $1.
        @00093 BENE_MDCR_ENTLMT_BUYIN_IND_03    $1.
        @00094 BENE_MDCR_ENTLMT_BUYIN_IND_04    $1.
        @00095 BENE_MDCR_ENTLMT_BUYIN_IND_05    $1.
        @00096 BENE_MDCR_ENTLMT_BUYIN_IND_06    $1.
        @00097 BENE_MDCR_ENTLMT_BUYIN_IND_07    $1.
        @00098 BENE_MDCR_ENTLMT_BUYIN_IND_08    $1.
        @00099 BENE_MDCR_ENTLMT_BUYIN_IND_09    $1.
        @00100 BENE_MDCR_ENTLMT_BUYIN_IND_10    $1.
        @00101 BENE_MDCR_ENTLMT_BUYIN_IND_11    $1.
        @00102 BENE_MDCR_ENTLMT_BUYIN_IND_12    $1.
        @00103 BENE_HMO_IND_01                  $1.
        @00104 BENE_HMO_IND_02                  $1.
        @00105 BENE_HMO_IND_03                  $1.
        @00106 BENE_HMO_IND_04                  $1.
        @00107 BENE_HMO_IND_05                  $1.
        @00108 BENE_HMO_IND_06                  $1.
        @00109 BENE_HMO_IND_07                  $1.
        @00110 BENE_HMO_IND_08                  $1.
        @00111 BENE_HMO_IND_09                  $1.
        @00112 BENE_HMO_IND_10                  $1.
        @00113 BENE_HMO_IND_11                  $1.
        @00114 BENE_HMO_IND_12                  $1.
    ;

  label
        PATIENT_ID                       = "Patient ID"
        BENE_ENROLLMT_REF_YR             = "Beneficiary Enrollment Reference Year"
        ENRL_SRC                         = "Enrollment Source"
        FIVE_PERCENT_FLAG                = "Strict 5% Flag"
        ENHANCED_FIVE_PERCENT_FLAG       = "Enhanced 5% Flag"
        COVSTART                         = "Medicare Coverage Start Date"
        CRNT_BIC_CD                      = "Beneficiary Identification Code"
        STATE_CODE                       = "State Code (SSA coding)"
        BENE_COUNTY_CD                   = "County Code (SSA coding)"
        BENE_ZIP_CD                      = "Zip Code of Residence"
        BENE_AGE_AT_END_REF_YR           = "Age at End of Reference Year"
        BENE_BIRTH_DT                    = "Date of Birth"
        BENE_VALID_DEATH_DT_SW           = "Valid Date of Death Switch"
        BENE_DEATH_DT                    = "Date of Death"
        BENE_SEX_IDENT_CD                = "Sex"
        BENE_RACE_CD                     = "Beneficiary Race Code"
        RTI_RACE_CD                      = "Research Triangle Institute (RTI) Race Code"
        BENE_ENTLMT_RSN_ORIG             = "Original Reason for Entitlement Code"
        BENE_ENTLMT_RSN_CURR             = "Current Reason for Entitlement Code"
        BENE_ESRD_IND                    = "ESRD Indicator"
        BENE_MDCR_STATUS_CD              = "Medicare Status Code"
        BENE_PTA_TRMNTN_CD               = "Part A Termination Code"
        BENE_PTB_TRMNTN_CD               = "Part B Termination Code"
        BENE_HI_CVRAGE_TOT_MONS          = "HI Coverage Count"
        BENE_SMI_CVRAGE_TOT_MONS         = "SMI Coverage Count"
        BENE_STATE_BUYIN_TOT_MONS        = "State Buy-In Coverage Count"
        BENE_HMO_CVRAGE_TOT_MONS         = "HMO Coverage Count"
        BENE_MDCR_ENTLMT_BUYIN_IND_01    = "Medicare Entitlement/Buy-In Indicator I"
        BENE_MDCR_ENTLMT_BUYIN_IND_02    = "Medicare Entitlement/Buy-In Indicator II"
        BENE_MDCR_ENTLMT_BUYIN_IND_03    = "Medicare Entitlement/Buy-In Indicator III"
        BENE_MDCR_ENTLMT_BUYIN_IND_04    = "Medicare Entitlement/Buy-In Indicator IV"
        BENE_MDCR_ENTLMT_BUYIN_IND_05    = "Medicare Entitlement/Buy-In Indicator V"
        BENE_MDCR_ENTLMT_BUYIN_IND_06    = "Medicare Entitlement/Buy-In Indicator VI"
        BENE_MDCR_ENTLMT_BUYIN_IND_07    = "Medicare Entitlement/Buy-In Indicator VII"
        BENE_MDCR_ENTLMT_BUYIN_IND_08    = "Medicare Entitlement/Buy-In Indicator VIII"
        BENE_MDCR_ENTLMT_BUYIN_IND_09    = "Medicare Entitlement/Buy-In Indicator IX"
        BENE_MDCR_ENTLMT_BUYIN_IND_10    = "Medicare Entitlement/Buy-In Indicator X"
        BENE_MDCR_ENTLMT_BUYIN_IND_11    = "Medicare Entitlement/Buy-In Indicator XI"
        BENE_MDCR_ENTLMT_BUYIN_IND_12    = "Medicare Entitlement/Buy-In Indicator XII"
        BENE_HMO_IND_01                  = "HMO Indicator I"
        BENE_HMO_IND_02                  = "HMO Indicator II"
        BENE_HMO_IND_03                  = "HMO Indicator III"
        BENE_HMO_IND_04                  = "HMO Indicator IV"
        BENE_HMO_IND_05                  = "HMO Indicator V"
        BENE_HMO_IND_06                  = "HMO Indicator VI"
        BENE_HMO_IND_07                  = "HMO Indicator VII"
        BENE_HMO_IND_08                  = "HMO Indicator VIII"
        BENE_HMO_IND_09                  = "HMO Indicator IX"
        BENE_HMO_IND_10                  = "HMO Indicator X"
        BENE_HMO_IND_11                  = "HMO Indicator XI"
        BENE_HMO_IND_12                  = "HMO Indicator XII"
    ;

run;

proc export data = mbsf_ab
outfile = "Data/mbsf_ab.csv"
dbms = csv;
run;
