filename mbsfabcd 'RawData/mbsf.abcd.summary.*.txt';                  
/* reading in an un-zipped file */


data mbsfabcd;
  infile mbsfabcd lrecl=526 missover pad;
  input
        @00001 patient_id                $char15. /* Patient ID (for either Cancer or Non-Cancer Patients) */
        @00016 BENE_ENROLLMT_REF_YR             4.
        @00020 ENRL_SRC                         $3.
        @00023 SAMPLE_GROUP                     $2.
/* SUMSTAT variable is used for the Non cancer patients to indicate if patient ever had cancer*/
/* SUMSTAT = 01 (No known cancer) or 02 (has cancer)*/
/*      @00023 SUMSTAT                          $2. */ /*This variable takes the place of the sample group*/ 
        @00025 ENHANCED_FIVE_PERCENT_FLAG       $1.
        @00026 CRNT_BIC_CD                      $2.
        @00028 STATE_CODE                       $2.
        @00030 COUNTY_CD                        $3.
        @00033 ZIP_CD                           $5.      /*  Encrypted  */
        @00038 STATE_CNTY_FIPS_CD_01            $5.
        @00043 STATE_CNTY_FIPS_CD_02            $5.
        @00048 STATE_CNTY_FIPS_CD_03            $5.
        @00053 STATE_CNTY_FIPS_CD_04            $5.
        @00058 STATE_CNTY_FIPS_CD_05            $5.
        @00063 STATE_CNTY_FIPS_CD_06            $5.
        @00068 STATE_CNTY_FIPS_CD_07            $5.
        @00073 STATE_CNTY_FIPS_CD_08            $5.
        @00078 STATE_CNTY_FIPS_CD_09            $5.
        @00083 STATE_CNTY_FIPS_CD_10            $5.
        @00088 STATE_CNTY_FIPS_CD_11            $5.
        @00093 STATE_CNTY_FIPS_CD_12            $5.
        @00098 AGE_AT_END_REF_YR                3.
        @00101 BENE_BIRTH_DT                    $char8.  /*  YYMMDD8  */
        @00109 VALID_DEATH_DT_SW                $1.
        @00110 BENE_DEATH_DT                    $char8.  /*  YYMMDD8  */
        @00118 SEX_IDENT_CD                     $1.
        @00119 BENE_RACE_CD                     $1.
        @00120 RTI_RACE_CD                      $1.
        @00121 COVSTART                         $char8.  /*  YYMMDD8  */
        @00129 ENTLMT_RSN_ORIG                  $1.
        @00130 ENTLMT_RSN_CURR                  $1.
        @00131 ESRD_IND                         $1.
        @00132 MDCR_STATUS_CODE_01              $2.
        @00134 MDCR_STATUS_CODE_02              $2.
        @00136 MDCR_STATUS_CODE_03              $2.
        @00138 MDCR_STATUS_CODE_04              $2.
        @00140 MDCR_STATUS_CODE_05              $2.
        @00142 MDCR_STATUS_CODE_06              $2.
        @00144 MDCR_STATUS_CODE_07              $2.
        @00146 MDCR_STATUS_CODE_08              $2.
        @00148 MDCR_STATUS_CODE_09              $2.
        @00150 MDCR_STATUS_CODE_10              $2.
        @00152 MDCR_STATUS_CODE_11              $2.
        @00154 MDCR_STATUS_CODE_12              $2.
        @00156 BENE_PTA_TRMNTN_CD               $1.
        @00157 BENE_PTB_TRMNTN_CD               $1.
        @00158 BENE_HI_CVRAGE_TOT_MONS          3.
        @00161 BENE_SMI_CVRAGE_TOT_MONS         3.
        @00164 BENE_STATE_BUYIN_TOT_MONS        3.
        @00167 BENE_HMO_CVRAGE_TOT_MONS         3.
        @00170 PTD_PLAN_CVRG_MONS               3.
        @00173 RDS_CVRG_MONS                    3.
        @00176 DUAL_ELGBL_MONS                  3.
        @00179 MDCR_ENTLMT_BUYIN_IND_01         $1.
        @00180 MDCR_ENTLMT_BUYIN_IND_02         $1.
        @00181 MDCR_ENTLMT_BUYIN_IND_03         $1.
        @00182 MDCR_ENTLMT_BUYIN_IND_04         $1.
        @00183 MDCR_ENTLMT_BUYIN_IND_05         $1.
        @00184 MDCR_ENTLMT_BUYIN_IND_06         $1.
        @00185 MDCR_ENTLMT_BUYIN_IND_07         $1.
        @00186 MDCR_ENTLMT_BUYIN_IND_08         $1.
        @00187 MDCR_ENTLMT_BUYIN_IND_09         $1.
        @00188 MDCR_ENTLMT_BUYIN_IND_10         $1.
        @00189 MDCR_ENTLMT_BUYIN_IND_11         $1.
        @00190 MDCR_ENTLMT_BUYIN_IND_12         $1.
        @00191 HMO_IND_01                       $1.
        @00192 HMO_IND_02                       $1.
        @00193 HMO_IND_03                       $1.
        @00194 HMO_IND_04                       $1.
        @00195 HMO_IND_05                       $1.
        @00196 HMO_IND_06                       $1.
        @00197 HMO_IND_07                       $1.
        @00198 HMO_IND_08                       $1.
        @00199 HMO_IND_09                       $1.
        @00200 HMO_IND_10                       $1.
        @00201 HMO_IND_11                       $1.
        @00202 HMO_IND_12                       $1.
        @00203 PTC_CNTRCT_ID_01                 $5.
        @00208 PTC_CNTRCT_ID_02                 $5.
        @00213 PTC_CNTRCT_ID_03                 $5.
        @00218 PTC_CNTRCT_ID_04                 $5.
        @00223 PTC_CNTRCT_ID_05                 $5.
        @00228 PTC_CNTRCT_ID_06                 $5.
        @00233 PTC_CNTRCT_ID_07                 $5.
        @00238 PTC_CNTRCT_ID_08                 $5.
        @00243 PTC_CNTRCT_ID_09                 $5.
        @00248 PTC_CNTRCT_ID_10                 $5.
        @00253 PTC_CNTRCT_ID_11                 $5.
        @00258 PTC_CNTRCT_ID_12                 $5.
        @00263 PTC_PBP_ID_01                    $3.
        @00266 PTC_PBP_ID_02                    $3.
        @00269 PTC_PBP_ID_03                    $3.
        @00272 PTC_PBP_ID_04                    $3.
        @00275 PTC_PBP_ID_05                    $3.
        @00278 PTC_PBP_ID_06                    $3.
        @00281 PTC_PBP_ID_07                    $3.
        @00284 PTC_PBP_ID_08                    $3.
        @00287 PTC_PBP_ID_09                    $3.
        @00290 PTC_PBP_ID_10                    $3.
        @00293 PTC_PBP_ID_11                    $3.
        @00296 PTC_PBP_ID_12                    $3.
        @00299 PTC_PLAN_TYPE_CD_01              $3.
        @00302 PTC_PLAN_TYPE_CD_02              $3.
        @00305 PTC_PLAN_TYPE_CD_03              $3.
        @00308 PTC_PLAN_TYPE_CD_04              $3.
        @00311 PTC_PLAN_TYPE_CD_05              $3.
        @00314 PTC_PLAN_TYPE_CD_06              $3.
        @00317 PTC_PLAN_TYPE_CD_07              $3.
        @00320 PTC_PLAN_TYPE_CD_08              $3.
        @00323 PTC_PLAN_TYPE_CD_09              $3.
        @00326 PTC_PLAN_TYPE_CD_10              $3.
        @00329 PTC_PLAN_TYPE_CD_11              $3.
        @00332 PTC_PLAN_TYPE_CD_12              $3.
        @00335 PTD_CNTRCT_ID_01                 $5.
        @00340 PTD_CNTRCT_ID_02                 $5.
        @00345 PTD_CNTRCT_ID_03                 $5.
        @00350 PTD_CNTRCT_ID_04                 $5.
        @00355 PTD_CNTRCT_ID_05                 $5.
        @00360 PTD_CNTRCT_ID_06                 $5.
        @00365 PTD_CNTRCT_ID_07                 $5.
        @00370 PTD_CNTRCT_ID_08                 $5.
        @00375 PTD_CNTRCT_ID_09                 $5.
        @00380 PTD_CNTRCT_ID_10                 $5.
        @00385 PTD_CNTRCT_ID_11                 $5.
        @00390 PTD_CNTRCT_ID_12                 $5.
        @00395 PTD_PBP_ID_01                    $3.
        @00398 PTD_PBP_ID_02                    $3.
        @00401 PTD_PBP_ID_03                    $3.
        @00404 PTD_PBP_ID_04                    $3.
        @00407 PTD_PBP_ID_05                    $3.
        @00410 PTD_PBP_ID_06                    $3.
        @00413 PTD_PBP_ID_07                    $3.
        @00416 PTD_PBP_ID_08                    $3.
        @00419 PTD_PBP_ID_09                    $3.
        @00422 PTD_PBP_ID_10                    $3.
        @00425 PTD_PBP_ID_11                    $3.
        @00428 PTD_PBP_ID_12                    $3.
        @00431 PTD_SGMT_ID_01                   $3.
        @00434 PTD_SGMT_ID_02                   $3.
        @00437 PTD_SGMT_ID_03                   $3.
        @00440 PTD_SGMT_ID_04                   $3.
        @00443 PTD_SGMT_ID_05                   $3.
        @00446 PTD_SGMT_ID_06                   $3.
        @00449 PTD_SGMT_ID_07                   $3.
        @00452 PTD_SGMT_ID_08                   $3.
        @00455 PTD_SGMT_ID_09                   $3.
        @00458 PTD_SGMT_ID_10                   $3.
        @00461 PTD_SGMT_ID_11                   $3.
        @00464 PTD_SGMT_ID_12                   $3.
        @00467 RDS_IND_01                       $1.
        @00468 RDS_IND_02                       $1.
        @00469 RDS_IND_03                       $1.
        @00470 RDS_IND_04                       $1.
        @00471 RDS_IND_05                       $1.
        @00472 RDS_IND_06                       $1.
        @00473 RDS_IND_07                       $1.
        @00474 RDS_IND_08                       $1.
        @00475 RDS_IND_09                       $1.
        @00476 RDS_IND_10                       $1.
        @00477 RDS_IND_11                       $1.
        @00478 RDS_IND_12                       $1.
        @00479 DUAL_STUS_CD_01                  $2.
        @00481 DUAL_STUS_CD_02                  $2.
        @00483 DUAL_STUS_CD_03                  $2.
        @00485 DUAL_STUS_CD_04                  $2.
        @00487 DUAL_STUS_CD_05                  $2.
        @00489 DUAL_STUS_CD_06                  $2.
        @00491 DUAL_STUS_CD_07                  $2.
        @00493 DUAL_STUS_CD_08                  $2.
        @00495 DUAL_STUS_CD_09                  $2.
        @00497 DUAL_STUS_CD_10                  $2.
        @00499 DUAL_STUS_CD_11                  $2.
        @00501 DUAL_STUS_CD_12                  $2.
        @00503 CST_SHR_GRP_CD_01                $2.
        @00505 CST_SHR_GRP_CD_02                $2.
        @00507 CST_SHR_GRP_CD_03                $2.
        @00509 CST_SHR_GRP_CD_04                $2.
        @00511 CST_SHR_GRP_CD_05                $2.
        @00513 CST_SHR_GRP_CD_06                $2.
        @00515 CST_SHR_GRP_CD_07                $2.
        @00517 CST_SHR_GRP_CD_08                $2.
        @00519 CST_SHR_GRP_CD_09                $2.
        @00521 CST_SHR_GRP_CD_10                $2.
        @00523 CST_SHR_GRP_CD_11                $2.
        @00525 CST_SHR_GRP_CD_12                $2.
    ;

  label
        PATIENT_ID                       = "Patient ID"
        BENE_ENROLLMT_REF_YR             = "Beneficiary Enrollment Reference Year"
        ENRL_SRC                         = "Enrollment Source"
        SAMPLE_GROUP                     = "Medicare 1, 5, or 20% Strict Sample Group Indicator"
        ENHANCED_FIVE_PERCENT_FLAG       = "Medicare Enhanced 5% Sample Indicator"
        CRNT_BIC_CD                      = "Current Beneficiary Identification Code"
        STATE_CODE                       = "SSA State Code"
        COUNTY_CD                        = "SSA County Code"
        ZIP_CD                           = "5-digit ZIP Code"
        STATE_CNTY_FIPS_CD_01            = "FIPS State-County Code: January"
        STATE_CNTY_FIPS_CD_02            = "FIPS State-County Code: February"
        STATE_CNTY_FIPS_CD_03            = "FIPS State-County Code: March"
        STATE_CNTY_FIPS_CD_04            = "FIPS State-County Code: April"
        STATE_CNTY_FIPS_CD_05            = "FIPS State-County Code: May"
        STATE_CNTY_FIPS_CD_06            = "FIPS State-County Code: June"
        STATE_CNTY_FIPS_CD_07            = "FIPS State-County Code: July"
        STATE_CNTY_FIPS_CD_08            = "FIPS State-County Code: August"
        STATE_CNTY_FIPS_CD_09            = "FIPS State-County Code: September"
        STATE_CNTY_FIPS_CD_10            = "FIPS State-County Code: October"
        STATE_CNTY_FIPS_CD_11            = "FIPS State-County Code: November"
        STATE_CNTY_FIPS_CD_12            = "FIPS State-County Code: December"
        AGE_AT_END_REF_YR                = "Age at the End of the Reference Year"
        BENE_BIRTH_DT                    = "Beneficiary Date of Birth"
        VALID_DEATH_DT_SW                = "Valid Date of Death Switch"
        BENE_DEATH_DT                    = "Beneficiary Date of Death"
        SEX_IDENT_CD                     = "Sex"
        BENE_RACE_CD                     = "Beneficiary Race Code"
        RTI_RACE_CD                      = "Research Triangle Institute (RTI) Race Code"
        COVSTART                         = "Medicare Coverage Start Date"
        ENTLMT_RSN_ORIG                  = "Original Reason for Entitlement Code"
        ENTLMT_RSN_CURR                  = "Current Reason for Entitlement Code"
        ESRD_IND                         = "End-Stage Renal Disease (ESRD) Indicator"
        MDCR_STATUS_CODE_01              = "Medicare Status Code: January"
        MDCR_STATUS_CODE_02              = "Medicare Status Code: February"
        MDCR_STATUS_CODE_03              = "Medicare Status Code: March"
        MDCR_STATUS_CODE_04              = "Medicare Status Code: April"
        MDCR_STATUS_CODE_05              = "Medicare Status Code: May"
        MDCR_STATUS_CODE_06              = "Medicare Status Code: June"
        MDCR_STATUS_CODE_07              = "Medicare Status Code: July"
        MDCR_STATUS_CODE_08              = "Medicare Status Code: August"
        MDCR_STATUS_CODE_09              = "Medicare Status Code: September"
        MDCR_STATUS_CODE_10              = "Medicare Status Code: October"
        MDCR_STATUS_CODE_11              = "Medicare Status Code: November"
        MDCR_STATUS_CODE_12              = "Medicare Status Code: December"
        BENE_PTA_TRMNTN_CD               = "Part A Termination Code"
        BENE_PTB_TRMNTN_CD               = "Part B Termination Code"
        BENE_HI_CVRAGE_TOT_MONS          = "Hospital Insurance (HI) Coverage Months Count"
        BENE_SMI_CVRAGE_TOT_MONS         = "Supplemental Medical Insurance (SMI) Coverage Months Count"
        BENE_STATE_BUYIN_TOT_MONS        = "State Buy-In (SBI) Coverage Months"
        BENE_HMO_CVRAGE_TOT_MONS         = "Health Maintenance Organization (HMO) Coverage Months"
        PTD_PLAN_CVRG_MONS               = "Part D Contract Plan Coverage Months"
        RDS_CVRG_MONS                    = "Retiree Drug Subsidy (RDS) Coverage Months"
        DUAL_ELGBL_MONS                  = "Medicaid Dual Eligible Months"
        MDCR_ENTLMT_BUYIN_IND_01         = "Medicare Entitlement/ Buy-In Indicator: January"
        MDCR_ENTLMT_BUYIN_IND_02         = "Medicare Entitlement/ Buy-In Indicator: February"
        MDCR_ENTLMT_BUYIN_IND_03         = "Medicare Entitlement/ Buy-In Indicator: March"
        MDCR_ENTLMT_BUYIN_IND_04         = "Medicare Entitlement/ Buy-In Indicator: April"
        MDCR_ENTLMT_BUYIN_IND_05         = "Medicare Entitlement/ Buy-In Indicator: May"
        MDCR_ENTLMT_BUYIN_IND_06         = "Medicare Entitlement/ Buy-In Indicator: June"
        MDCR_ENTLMT_BUYIN_IND_07         = "Medicare Entitlement/ Buy-In Indicator: July"
        MDCR_ENTLMT_BUYIN_IND_08         = "Medicare Entitlement/ Buy-In Indicator: August"
        MDCR_ENTLMT_BUYIN_IND_09         = "Medicare Entitlement/ Buy-In Indicator: September"
        MDCR_ENTLMT_BUYIN_IND_10         = "Medicare Entitlement/ Buy-In Indicator: October"
        MDCR_ENTLMT_BUYIN_IND_11         = "Medicare Entitlement/ Buy-In Indicator: November"
        MDCR_ENTLMT_BUYIN_IND_12         = "Medicare Entitlement/ Buy-In Indicator: December"
        HMO_IND_01                       = "HMO Indicator: January"
        HMO_IND_02                       = "HMO Indicator: February"
        HMO_IND_03                       = "HMO Indicator: March"
        HMO_IND_04                       = "HMO Indicator: April"
        HMO_IND_05                       = "HMO Indicator: May"
        HMO_IND_06                       = "HMO Indicator: June"
        HMO_IND_07                       = "HMO Indicator: July"
        HMO_IND_08                       = "HMO Indicator: August"
        HMO_IND_09                       = "HMO Indicator: September"
        HMO_IND_10                       = "HMO Indicator: October"
        HMO_IND_11                       = "HMO Indicator: November"
        HMO_IND_12                       = "HMO Indicator: December"
        PTC_CNTRCT_ID_01                 = "Part C Contract ID: January"
        PTC_CNTRCT_ID_02                 = "Part C Contract ID: February"
        PTC_CNTRCT_ID_03                 = "Part C Contract ID: March"
        PTC_CNTRCT_ID_04                 = "Part C Contract ID: April"
        PTC_CNTRCT_ID_05                 = "Part C Contract ID: May"
        PTC_CNTRCT_ID_06                 = "Part C Contract ID: June"
        PTC_CNTRCT_ID_07                 = "Part C Contract ID: July"
        PTC_CNTRCT_ID_08                 = "Part C Contract ID: August"
        PTC_CNTRCT_ID_09                 = "Part C Contract ID: September"
        PTC_CNTRCT_ID_10                 = "Part C Contract ID: October"
        PTC_CNTRCT_ID_11                 = "Part C Contract ID: November"
        PTC_CNTRCT_ID_12                 = "Part C Contract ID: December"
        PTC_PBP_ID_01                    = "Part C Plan Benefit Package ID: January"
        PTC_PBP_ID_02                    = "Part C Plan Benefit Package ID: February"
        PTC_PBP_ID_03                    = "Part C Plan Benefit Package ID: March"
        PTC_PBP_ID_04                    = "Part C Plan Benefit Package ID: April"
        PTC_PBP_ID_05                    = "Part C Plan Benefit Package ID: May"
        PTC_PBP_ID_06                    = "Part C Plan Benefit Package ID: June"
        PTC_PBP_ID_07                    = "Part C Plan Benefit Package ID: July"
        PTC_PBP_ID_08                    = "Part C Plan Benefit Package ID: August"
        PTC_PBP_ID_09                    = "Part C Plan Benefit Package ID: September"
        PTC_PBP_ID_10                    = "Part C Plan Benefit Package ID: October"
        PTC_PBP_ID_11                    = "Part C Plan Benefit Package ID: November"
        PTC_PBP_ID_12                    = "Part C Plan Benefit Package ID: December"
        PTC_PLAN_TYPE_CD_01              = "Part C Plan Type Code: January"
        PTC_PLAN_TYPE_CD_02              = "Part C Plan Type Code: February"
        PTC_PLAN_TYPE_CD_03              = "Part C Plan Type Code: March"
        PTC_PLAN_TYPE_CD_04              = "Part C Plan Type Code: April"
        PTC_PLAN_TYPE_CD_05              = "Part C Plan Type Code: May"
        PTC_PLAN_TYPE_CD_06              = "Part C Plan Type Code: June"
        PTC_PLAN_TYPE_CD_07              = "Part C Plan Type Code: July"
        PTC_PLAN_TYPE_CD_08              = "Part C Plan Type Code: August"
        PTC_PLAN_TYPE_CD_09              = "Part C Plan Type Code: September"
        PTC_PLAN_TYPE_CD_10              = "Part C Plan Type Code: October"
        PTC_PLAN_TYPE_CD_11              = "Part C Plan Type Code: November"
        PTC_PLAN_TYPE_CD_12              = "Part C Plan Type Code: December"
        PTD_CNTRCT_ID_01                 = "Part D Contract ID: January"
        PTD_CNTRCT_ID_02                 = "Part D Contract ID: February"
        PTD_CNTRCT_ID_03                 = "Part D Contract ID: March"
        PTD_CNTRCT_ID_04                 = "Part D Contract ID: April"
        PTD_CNTRCT_ID_05                 = "Part D Contract ID: May"
        PTD_CNTRCT_ID_06                 = "Part D Contract ID: June"
        PTD_CNTRCT_ID_07                 = "Part D Contract ID: July"
        PTD_CNTRCT_ID_08                 = "Part D Contract ID: August"
        PTD_CNTRCT_ID_09                 = "Part D Contract ID: September"
        PTD_CNTRCT_ID_10                 = "Part D Contract ID: October"
        PTD_CNTRCT_ID_11                 = "Part D Contract ID: November"
        PTD_CNTRCT_ID_12                 = "Part D Contract ID: December"
        PTD_PBP_ID_01                    = "Part D Plan Benefit Package ID: January"
        PTD_PBP_ID_02                    = "Part D Plan Benefit Package ID: February"
        PTD_PBP_ID_03                    = "Part D Plan Benefit Package ID: March"
        PTD_PBP_ID_04                    = "Part D Plan Benefit Package ID: April"
        PTD_PBP_ID_05                    = "Part D Plan Benefit Package ID: May"
        PTD_PBP_ID_06                    = "Part D Plan Benefit Package ID: June"
        PTD_PBP_ID_07                    = "Part D Plan Benefit Package ID: July"
        PTD_PBP_ID_08                    = "Part D Plan Benefit Package ID: August"
        PTD_PBP_ID_09                    = "Part D Plan Benefit Package ID: September"
        PTD_PBP_ID_10                    = "Part D Plan Benefit Package ID: October"
        PTD_PBP_ID_11                    = "Part D Plan Benefit Package ID: November"
        PTD_PBP_ID_12                    = "Part D Plan Benefit Package ID: December"
        PTD_SGMT_ID_01                   = "Part D Segment ID: January"
        PTD_SGMT_ID_02                   = "Part D Segment ID: February"
        PTD_SGMT_ID_03                   = "Part D Segment ID: March"
        PTD_SGMT_ID_04                   = "Part D Segment ID: April"
        PTD_SGMT_ID_05                   = "Part D Segment ID: May"
        PTD_SGMT_ID_06                   = "Part D Segment ID: June"
        PTD_SGMT_ID_07                   = "Part D Segment ID: July"
        PTD_SGMT_ID_08                   = "Part D Segment ID: August"
        PTD_SGMT_ID_09                   = "Part D Segment ID: September"
        PTD_SGMT_ID_10                   = "Part D Segment ID: October"
        PTD_SGMT_ID_11                   = "Part D Segment ID: November"
        PTD_SGMT_ID_12                   = "Part D Segment ID: December"
        RDS_IND_01                       = "Retiree Drug Subsidy Indicators: January"
        RDS_IND_02                       = "Retiree Drug Subsidy Indicators: February"
        RDS_IND_03                       = "Retiree Drug Subsidy Indicators: March"
        RDS_IND_04                       = "Retiree Drug Subsidy Indicators: April"
        RDS_IND_05                       = "Retiree Drug Subsidy Indicators: May"
        RDS_IND_06                       = "Retiree Drug Subsidy Indicators: June"
        RDS_IND_07                       = "Retiree Drug Subsidy Indicators: July"
        RDS_IND_08                       = "Retiree Drug Subsidy Indicators: August"
        RDS_IND_09                       = "Retiree Drug Subsidy Indicators: September"
        RDS_IND_10                       = "Retiree Drug Subsidy Indicators: October"
        RDS_IND_11                       = "Retiree Drug Subsidy Indicators: November"
        RDS_IND_12                       = "Retiree Drug Subsidy Indicators: December"
        DUAL_STUS_CD_01                  = "State Reported Dual Eligible Status Code: January"
        DUAL_STUS_CD_02                  = "State Reported Dual Eligible Status Code: February"
        DUAL_STUS_CD_03                  = "State Reported Dual Eligible Status Code: March"
        DUAL_STUS_CD_04                  = "State Reported Dual Eligible Status Code: April"
        DUAL_STUS_CD_05                  = "State Reported Dual Eligible Status Code: May"
        DUAL_STUS_CD_06                  = "State Reported Dual Eligible Status Code: June"
        DUAL_STUS_CD_07                  = "State Reported Dual Eligible Status Code: July"
        DUAL_STUS_CD_08                  = "State Reported Dual Eligible Status Code: August"
        DUAL_STUS_CD_09                  = "State Reported Dual Eligible Status Code: September"
        DUAL_STUS_CD_10                  = "State Reported Dual Eligible Status Code: October"
        DUAL_STUS_CD_11                  = "State Reported Dual Eligible Status Code: November"
        DUAL_STUS_CD_12                  = "State Reported Dual Eligible Status Code: December"
        CST_SHR_GRP_CD_01                = "Cost Share Group Code: January"
        CST_SHR_GRP_CD_02                = "Cost Share Group Code: February"
        CST_SHR_GRP_CD_03                = "Cost Share Group Code: March"
        CST_SHR_GRP_CD_04                = "Cost Share Group Code: April"
        CST_SHR_GRP_CD_05                = "Cost Share Group Code: May"
        CST_SHR_GRP_CD_06                = "Cost Share Group Code: June"
        CST_SHR_GRP_CD_07                = "Cost Share Group Code: July"
        CST_SHR_GRP_CD_08                = "Cost Share Group Code: August"
        CST_SHR_GRP_CD_09                = "Cost Share Group Code: September"
        CST_SHR_GRP_CD_10                = "Cost Share Group Code: October"
        CST_SHR_GRP_CD_11                = "Cost Share Group Code: November"
        CST_SHR_GRP_CD_12                = "Cost Share Group Code: December"
    ;

run;

proc export data = mbsfabcd
outfile = "Data/mbsfabcd.csv"
dbms = csv;
run;
