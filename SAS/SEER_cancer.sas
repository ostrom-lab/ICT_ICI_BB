filename SEER_in 'RawData/SEER.*.cancer.txt';                   
/* reading in an un-zipped file */

data SEER_in;
  infile SEER_in lrecl=535 missover pad;
  input
      @001 patient_id                      $char15. /* Patient ID (for either Cancer or Non-Cancer Patients) */
      @016 SEER_registry                     2. /*Registry*/
      @018 SEERregistrywithCAandGAaswholes   2. /*Registry with CA and GA as whole states*/
      @020 Louisiana20051stvs2ndhalfofyear   1. /*Louisiana 2005 1st vs 2nd half of the year*/
      @021 Marital_status_at_diagnosis       1. /*Marital Status*/                                           /*Not available for NY, MA or ID*/
      @022 Race_ethnicity                    2. /*Race ethnicity*/
      @024 sex                               1. /*Sex*/
      @025 Agerecodewithsingleages_and_100   3. /*Age recode with single ages and 100+*/
      @028 agerecodewithsingle_ages_and_85   3. /*Age recode with single ages and 85+*/
      @031 Sequence_number                   2. /*Sequence Number*/
      @033 Month_of_diagnosis                2. /*Month of Diagnosis, Not month diagnosis recode*/
      @035 Year_of_diagnosis                 4. /*Year of Diagnosis*/
      @039 Month_of_diagnosis_recode         2. /*Month of Diagnosis Recode*/
      @041 Primary_Site                    $char4. /*Primary Site*/
      @045 Laterality                        1. /*Laterality*/
      @046 Histology_ICD_O_2                 4. /*Histology ICD-0-2*/                                        /*Not available for NY, MA or ID*/
      @050 Behavior_code_ICD_O_2             1. /*Behavior ICD-0-2*/                                         /*Not available for NY, MA or ID*/
      @051 Histologic_Type_ICD_O_3           4. /*Histologic type ICD-0-3*/
      @055 Behavior_code_ICD_O_3             1. /*Behavior code ICD-0-3*/
      @056 Grade                             1. /*Grade*/
      @057 Diagnostic_Confirmation           1. /*Diagnostic Confirmation*/
      @058 Type_of_Reporting_Source          1. /*Type of Reporting Source*/
      @059 EOD_10_size_1988_2003             3. /*EOD 10 - SIZE (1998-2003)*/                                /*Not available for NY, MA or ID*/
      @062 EOD_10_extent_1988_2003           2. /*EOD 10 - EXTENT (1998-2003)*/                              /*Not available for NY, MA or ID*/
      @064 EOD10Prostatepath_ext_1995_2003   2. /*EOD 10 - Prostate path ext (1995-2003)*/                   /*Not available for NY, MA or ID*/
      @066 EOD_10_nodes_1988_2003            1. /*EOD 10 - Nodes (1995-2003)*/                               /*Not available for NY, MA or ID*/
      @067 Regional_nodes_positive_1988      2. /*EOD 10 - Regional Nodes positive (1988+)*/                 /*limited to diagnosis years 2000-2003 for NY, MA or ID*/
      @069 Regional_nodes_examined_1988      2. /*EOD 10 - Regional Nodes examined (1988+)*/                 /*Not available for NY, MA or ID*/
      @071 Expanded_EOD_1_CP53_1973_1982   $char1. /*EOD - expanded 1-13*/                                   /*Not available for NY, MA or ID*/
      @072 Expanded_EOD_2_CP54_1973_1982   $char1.                                                           /*Not available for NY, MA or ID*/
      @073 Expanded_EOD_3_CP55_1973_1982   $char1.                                                           /*Not available for NY, MA or ID*/
      @074 Expanded_EOD_4_CP56_1973_1982   $char1.                                                           /*Not available for NY, MA or ID*/
      @075 Expanded_EOD_5_CP57_1973_1982   $char1.                                                           /*Not available for NY, MA or ID*/
      @076 Expanded_EOD_6_CP58_1973_1982   $char1.                                                           /*Not available for NY, MA or ID*/
      @077 Expanded_EOD_7_CP59_1973_1982   $char1.                                                           /*Not available for NY, MA or ID*/
      @078 Expanded_EOD_8_CP60_1973_1982   $char1.                                                           /*Not available for NY, MA or ID*/
      @079 Expanded_EOD_9_CP61_1973_1982   $char1.                                                           /*Not available for NY, MA or ID*/
      @080 Expanded_EOD_10_CP62_1973_1982  $char1.                                                           /*Not available for NY, MA or ID*/
      @081 Expanded_EOD_11_CP63_1973_1982  $char1.                                                           /*Not available for NY, MA or ID*/
      @082 Expanded_EOD_12_CP64_1973_1982  $char1.                                                           /*Not available for NY, MA or ID*/
      @083 Expanded_EOD_13_CP65_1973_1982  $char1.                                                           /*Not available for NY, MA or ID*/
      @084 V2Digit_NS_EOD_part_1_1973_1982 $char1. /*NS EOD part 1 */                                        /*Not available for NY, MA or ID*/
      @086 V2Digit_NS_EOD_part_2_1973_1982 $char1. /*NS EOD part 2 */                                        /*Not available for NY, MA or ID*/
      @088 V2Digit_SS_EOD_part_1_1973_1982 $char1. /*SS EOD part 1 */                                        /*Not available for NY, MA or ID*/
      @090 V2Digit_SS_EOD_part_2_1973_1982 $char1. /*SS EOD part 2 */                                        /*Not available for NY, MA or ID*/
      @092 EOD_4_size_1983_1987              2. /*EOD 4 - Size (1983-1987)         */                        /*Not available for NY, MA or ID*/
      @094 EOD_4_extent_1983_1987            1. /*EOD 4 - Extent (1983-1987)       */                        /*Not available for NY, MA or ID*/
      @095 EOD_4_nodes_1983_1987             1. /*EOD 4 - Nodes (1983-1987)        */                        /*Not available for NY, MA or ID*/
      @096 Coding_system_EOD_1973_2003       1. /*EOD Coding System (1973-2003)    */                        /*Not available for NY, MA or ID*/
      @097 Tumor_marker_1_1990_2003          1. /*Tumor marker 1 (1990-2003)       */                        /*Not available for NY, MA or ID*/
      @098 Tumor_marker_2_1990_2003          1. /*Tumor marker 2 (1990-2003)       */                        /*Not available for NY, MA or ID*/
      @099 Tumor_marker_3_1998_2003          1. /*Tumor marker 3 (1990-2003        */                        /*Not available for NY, MA or ID*/
      @100 CS_tumor_size_2004_2015           3. /*CS Tumor size (2004-2015)        */                        /*Not available for NY, MA or ID*/
      @103 CS_extension_2004_2015            3. /*CS extension (2004-2015)         */                        /*Not available for NY, MA or ID*/
      @106 CS_lymph_nodes_2004_2015          3. /*CS Lymph nodes (2004-2015)       */                        /*Not available for NY, MA or ID*/
      @109 CS_mets_at_dx_2004_2015           2. /*CS Mets at dx                    */                        /*Not available for NY, MA or ID*/
      @111 CSsitespecificfactor12004varyin   3. /*CS Site-specific factor 1(2004+) */                        /*Not available for NY, MA or ID*/
      @114 CSsitespecificfactor22004varyin   3. /*CS Site-specific factor 2(2004+) */                        /*Not available for NY, MA or ID*/
      @117 CSsitespecificfactor32004varyin   3. /*CS Site-specific factor 3(2004+) */                        /*Not available for NY, MA or ID*/
      @120 CSsitespecificfactor42004varyin   3. /*CS Site-specific factor 4(2004+) */                        /*Not available for NY, MA or ID*/
      @123 CSsitespecificfactor52004varyin   3. /*CS Site-specific factor 5(2004+) */                        /*Not available for NY, MA or ID*/
      @126 CSsitespecificfactor62004varyin   3. /*CS Site-specific factor 6(2004+) */                        /*Not available for NY, MA or ID*/
      @129 CSsitespecificfactor72004varyin   3. /*CS Site-specific factor 7(2004+) */                        /*Not available for NY, MA or ID*/
      @132 CSsitespecificfactor82004varyin   3. /*CS Site-specific factor 8(2004+) */                        /*Not available for NY, MA or ID*/
      @135 CSsitespecificfactor92004varyin   3. /*CS Site-specific factor 9(2004+) */                        /*Not available for NY, MA or ID*/
      @138 CSsitespecificfactor102004varyi   3. /*CS Site-specific factor 10(2004+)*/                        /*Not available for NY, MA or ID*/
      @141 CSsitespecificfactor112004varyi   3. /*CS Site-specific factor 11(2004+)*/                        /*Not available for NY, MA or ID*/
      @144 CSsitespecificfactor122004varyi   3. /*CS Site-specific factor 12(2004+)*/                        /*Not available for NY, MA or ID*/
      @147 CSsitespecificfactor132004varyi   3. /*CS Site-specific factor 13(2004+)*/                        /*Not available for NY, MA or ID*/
      @150 CSsitespecificfactor152004varyi   3. /*CS Site-specific factor 15(2004+)*/                        /*Not available for NY, MA or ID*/
      @153 CSsitespecificfactor162004varyi   3. /*CS Site-specific factor 16(2004+)*/                        /*Not available for NY, MA or ID*/
      @156 CSsitespecificfactor252004varyi   3. /*CS Site-specific factor 25(2004+)*/                        /*Not available for NY, MA or ID*/
      @159 Derived_AJCC_T_6th_ed_2004_2015   2. /*Derived AJCC T 6th ed (2004-2015)*/                        /*Not available for NY, MA or ID*/
      @161 Derived_AJCC_N_6th_ed_2004_2015   2. /*Derived AJCC N 6th ed (2004-2015)*/                        /*Not available for NY, MA or ID*/
      @163 Derived_AJCC_M_6th_ed_2004_2015   2. /*Derived AJCC M 6th ed (2004-2015)*/                        /*Not available for NY, MA or ID*/
      @165 DerivedAJCCStageGroup6thed20042   2. /*Derived AJCC STAGE Group 6th ed (2004-2015)*/              /*Not available for NY, MA or ID*/
      @167 SEERCombinedSummaryStage2000200   1. /*SEER Combined Summary Stage 2000 (2004+)*/                 
      @168 CSversioninputoriginal2004_2015   6. /*CS Version Input (2004-2015)	 */                          /*Not available for NY, MA or ID*/
      @174 CS_version_derived_2004_2015      6. /*CS Version Derived (2004-2015)   */                        /*Not available for NY, MA or ID*/
      @180 CSversioninputcurrent_2004_2015   6. /*CS Version Current (2004-2015)   */                        /*Not available for NY, MA or ID*/
      @186 RX_Summ_Surg_Prim_Site_1998       2. /*RX Summ-Surg Prim site 1998+     */                        /*Not available for NY, MA or ID*/
      @188 RX_Summ_Scope_Reg_LN_Sur_2003     1. /*RX Summ-Scope Reg LN Sur (2003+) */                        /*Not available for NY, MA or ID*/
      @189 RX_Summ_Surg_Oth_Reg_Dis_2003     1. /*RX Summ-Surg Oth reg/dis (2003+) */                        /*Not available for NY, MA or ID*/
      @190 RXSummReg_LN_Examined_1998_2002   2. /*RX Summ-Reg LN examined (1998-2002)*/                      /*Not available for NY, MA or ID*/

      @192 RX_Summ_Systemic_Surg_Seq         1. /*RX Summ--Systemic Surg Seq*/                               /*Not available for NY, MA or ID*/
      @193 RX_Summ_Surg_Rad_Seq              1. /*Radiation Sequence with Surgery*/                          /*Not available for NY, MA or ID*/
      @194 Reasonnocancer_directed_surgery   1. /*Reason No Cancer-Directed Surgery*/                        /*Not available for NY, MA or ID*/
      @195 Radiation_recode                  1. /*Radiation Recode (0 and 9 combined) - created*/            /*Not available for NY, MA or ID*/
      @196 Chemotherapy_recode_yes_no_unk    1. /*CHEMOTHERAPY Recode, yes(1)/no/unknown(0) - created*/      /*Not available for NY, MA or ID*/
      @197 Sitespecificsurgery19731997vary   2. /*Site Specific Surgery (1973-1997)*/                        /*Not available for NY, MA or ID*/
      @199 Scopeofreglymphndsurg_1998_2002   1. /*Scope of Reg Lymph ND Surg (1998-2002)*/                   /*Not available for NY, MA or ID*/
      @200 Surgeryofothregdissites19982002   1. /*Surgery of Oth Reg/Dis sites (1998-2002)*/                 /*Not available for NY, MA or ID*/
      @201 Record_number_recode              2. /*Record Number Recode             */
      @203 Age_recode_with_1_year_olds       2. /*Age Recode with <1 Year Olds     */
      @205 Site_recode_ICD_O_3_WHO_2008    $char5. /*Site Recode ICD-O-3/WHO 2008)    */
      @210 ICCCsiterecode_ICD_O_3_WHO_2008   3. /*ICCC Site Recode ICD-O-3/WHO 2008*/
      @213 ICCCsiterecextendedICDO3WHO2008   3. /*ICCC Site rec extended ICD-O-3/WHO 2008*/
      @216 Behavior_recode_for_analysis      1. /*Behavior Recode for Analysis*/
      @217 Histologyrecode_broad_groupings   2. /*Histology Recode - Broad Groupings*/
      @219 Histologyrecode_Brain_groupings   2. /*Histology Recode - Brain Groupings*/
      @221 ICCCsiterecodeextended3rdeditio   3. /*ICCC Site Recode Extended 3rd Edition/IARC 2017*/
      @224 TNM_7_CS_v0204_Schema             3. /*TNM 7/CS v0204+ Schema*/                                   /*Not available for NY, MA or ID*/
      @227 Race_recode_White_Black_Other     1. /*Race Recode (White, Black, Other)*/
      @228 Race_recode_W_B_AI_API            1. /*Race Recode (W, B, AI, API)*/
      @229 OriginrecodeNHIAHispanicNonHisp   1. /*Origin Recode NHIA (Hispanic, Non-Hispanic)*/
      @230 SEER_historic_stage_A_1973_2015   1. /*SEER Historic Stage A (1973-2015)*/                        /*Not available for NY, MA or ID*/
      @231 AJCCstage_3rd_edition_1988_2003   2. /*AJCC Stage 3rd Edition (1988-2003)*/                       /*Not available for NY, MA or ID*/
      @233 SEERmodifiedAJCCstage3rd1988200   2. /*SEER Modified AJCC Stage 3rd Edition (1988-2003)*/         /*Not available for NY, MA or ID*/
      @235 Firstmalignantprimary_indicator   1. /*First Malignant Primary Indicator*/
      @236 state                             2. /*FIPS State*/
      @238 county                            3. /*FIPS County*/
      @241 PRCDA_2017	                     1. /*PRCDA - 2017*/
      @242 PRCDA_Region	                     1. /*PRCDA - Region*/

      @243 COD_to_site_recode                5. /*COD to Site Recode*/                                       /*Not available for NY, MA or ID*/
      @248 COD_to_site_rec_KM                5. /*COD to Site Recode KM*/                                    /*Not available for NY, MA or ID*/
      @253 Vitalstatusrecodestudycutoffuse   1. /*Vital Status Recode (Study Cutoff Used)*/                  /*Not available for NY, MA or ID*/
      @254 IHS_Link                          1. /*IHS LINK*/
      @255 Summary_stage_2000_1998           1. /*Summary Stage 2000 (1998+)*/                               /*Not available for NY, MA or ID*/
      @256 AYA_site_recode_WHO_2008          2. /*AYA Site Recode/WHO 2008*/
      @258 Lymphomasubtype_recode_WHO_2008   2. /*Lymphoma Subtype Recode/WHO 2008*/
      @260 ICCCsiterecode3rdeditionIARC201   3. /*ICCC Site Recode 3rd Edition/IARC 2017*/
      @263 SEERcausespecificdeathclassific   1. /*SEER Cause-Specific Death Classification*/                 /*Not available for NY, MA or ID*/
      @264 SEERothercauseofdeathclassifica   1. /*SEER Other Cause of Death Classification*/                 /*Not available for NY, MA or ID*/
      @265 CSTumor_Size_Ext_Eval_2004_2015   1. /*CS Tumor Size/Ext Eval (2004-2015) */                      /*Not available for NY, MA or ID*/
      @266 CS_Reg_Node_Eval_2004_2015        1. /*CS Reg Node Eval (2004-2015)*/                             /*Not available for NY, MA or ID*/
      @267 CS_Mets_Eval_2004_2015            1. /*CS Mets Eval (2004-2015)*/                                 /*Not available for NY, MA or ID*/
      @268 Primary_by_international_rules    1. /*Primary by International Rules*/
      @269 ERStatusRecodeBreastCancer_1990   1. /*ER Status Recode Breast Cancer (1990+)*/                   /*Not available for NY, MA or ID*/
      @270 PRStatusRecodeBreastCancer_1990   1. /*PR Status Recode Breast Cancer (1990+)*/                   /*Not available for NY, MA or ID*/
      @271 CS_Schema_AJCC_6th_Edition        2. /*CS Schema--AJCC 6th Edition*/                              /*Not available for NY, MA or ID*/
      @273 LymphvascularInvasion2004varyin   1. /*Lymph Vascular Invasion (2004+ Varying by Schema)*/        /*Not available for NY, MA or ID*/
      @274 Survival_months                   4. /*Survival Months*/                                          /*Not available for NY, MA or ID*/
      @278 Survival_months_flag              1. /*Survival Months Flag*/                                     /*Not available for NY, MA or ID*/
      @279 Derived_AJCC_T_7th_ed_2010        3. /*Derived AJCC T, 7th Ed 2010-2015)*/                        /*Not available for NY, MA or ID*/
      @282 Derived_AJCC_N_7th_ed_2010        3. /*Derived AJCC N, 7th Ed 2010-2015)*/                        /*Not available for NY, MA or ID*/
      @285 Derived_AJCC_M_7th_ed_2010        3. /*Derived AJCC M, 7th Ed 2010-2015)*/                        /*Not available for NY, MA or ID*/
      @288 DerivedAJCCStageGroup7thed_2010   3. /*Derived AJCC Stage Group, 7th Ed 2010-2015)*/              /*Not available for NY, MA or ID*/
      @291 BreastAdjustedAJCC6thT1988_2015   2. /*Breast--Adjusted AJCC 6th T (1988-2015)*/                  /*Not available for NY, MA or ID*/
      @293 BreastAdjustedAJCC6thN1988_2015   2. /*Breast--Adjusted AJCC 6th N (1988-2015)*/                  /*Not available for NY, MA or ID*/
      @295 BreastAdjustedAJCC6thM1988_2015   2. /*Breast--Adjusted AJCC 6th M (1988-2015)*/                  /*Not available for NY, MA or ID*/
      @297 BreastAdjustedAJCC6thStage19882   2. /*Breast--Adjusted AJCC 6th Stage (1988-2015)*/              /*Not available for NY, MA or ID*/
      @299 Derived_HER2_Recode_2010          1. /*Derived HER2 Recode (2010+)*/                              /*Not available for NY, MA or ID*/
      @300 Breast_Subtype_2010               1. /*Breast Subtype (2010+)*/
      @301 LymphomaAnnArborStage_1983_2015   1. /*Lymphomas: Ann Arbor Staging (1983-2015)*/                 /*Not available for NY, MA or ID*/
      @302 SEERCombinedMetsat_DX_bone_2010   1. /*SEER Combined Mets at Dx-Bone (2010+)*/                    /*Not available for NY, MA or ID*/
      @303 SEERCombinedMetsatDX_brain_2010   1. /*SEER Combined Mets at Dx-Brain (2010+)*/                   /*Not available for NY, MA or ID*/
      @304 SEERCombinedMetsatDX_liver_2010   1. /*SEER Combined Mets at Dx-Liver (2010+)*/                   /*Not available for NY, MA or ID*/
      @305 SEERCombinedMetsat_DX_lung_2010   1. /*SEER Combined Mets at Dx-Lung (2010+)*/                    /*Not available for NY, MA or ID*/
      @306 TvaluebasedonAJCC_3rd_1988_2003   2. /*T Value - Based on AJCC 3rd (1988-2003)*/                  /*Not available for NY, MA or ID*/
      @308 NvaluebasedonAJCC_3rd_1988_2003   2. /*N Value - Based on AJCC 3rd (1988-2003)*/                  /*Not available for NY, MA or ID*/
      @310 MvaluebasedonAJCC_3rd_1988_2003   2. /*M Value - Based on AJCC 3rd (1988-2003)*/                  /*Not available for NY, MA or ID*/
      @312 Totalnumberofinsitumalignanttum   2. /*Total Number of In Situ/Malignant Tumors for Patient*/     /*Not available for NY, MA or ID*/
      @314 Totalnumberofbenignborderlinetu   2. /*Total Number of Benign/Borderline Tumors for Patient*/     /*Not available for NY, MA or ID*/
      @316 RadiationtoBrainorCNSRecode1988   1. /*Radiation to Brain or CNS Recode (1988-1997)*/             /*Not available for NY, MA or ID*/
      @317 Tumor_Size_Summary_2016	     3. /*Tumor Size Summary (2016+)*/                               /*Not available for NY, MA or ID*/
      @320 Derived_SEER_Cmb_Stg_Grp_2016   $char5. /*Derived SEER Combined STG GRP (2016+)*/                 /*Not available for NY, MA or ID*/
      @325 Derived_SEER_Combined_T_2016	   $char5. /*Derived SEER Combined T (2016+)*/                       /*Not available for NY, MA or ID*/
      @330 Derived_SEER_Combined_N_2016	   $char5. /*Derived SEER Combined N (2016+)*/                       /*Not available for NY, MA or ID*/
      @335 Derived_SEER_Combined_M_2016	   $char5. /*Derived SEER Combined M (2016+)*/                       /*Not available for NY, MA or ID*/
      @340 DerivedSEER_Combined_T_Src_2016   1. /*Derived SEER Combined T SRC (2016+)*/                      /*Not available for NY, MA or ID*/
      @341 DerivedSEER_Combined_N_Src_2016   1. /*Derived SEER Combined N SRC (2016+)*/                      /*Not available for NY, MA or ID*/
      @342 DerivedSEER_Combined_M_Src_2016   1. /*Derived SEER Combined M SRC (2016+)*/                      /*Not available for NY, MA or ID*/
      @343 TNM_Edition_Number_2016	   $char2. /*TNM Edition Number (2016+)*/                            /*Not available for NY, MA or ID*/
      @345 Mets_at_DX_Distant_LN_2016	     1. /*Mets at Dx-Distant LN (2016+)*/                            /*Not available for NY, MA or ID*/
      @346 Mets_at_DX_Other_2016	     1. /*Mets at DX--Other (2016+)*/                                /*Not available for NY, MA or ID*/

   /*Not Public but released*/                                                                                                                                                                                          /*Not available for NY, MA or ID*/
      @347 Census_Tract_1990               $char6. /*Census Track 1990, encrypted*/
      @353 Census_Tract_2000               $char6. /*Census Track 2000, encrypted*/
      @359 Census_Tract_2010               $char6. /*Census Track 2010, encrypted*/
      @365 Census_Coding_System	           $char1. /*Coding System for Census Track 1970/80/90*/
      @366 Census_Tract_Certainty_1990	   $char1. /*Census Tract Certainty 1970/1980/1990*/
      @367 Census_Tract_Certainty_2000	   $char1. /*Census Tract Certainty 2000*/
      @368 Census_Tract_Certainty_2010	   $char1. /*Census Tract Certainty 2010*/
      @369 Census_Tract_Poverty_Indicator  $char1. /*Census Tract Poverty Indicator*/
      @370 RuralUrbanCommutingAreaCodes200   2. /*Rural Urban Commuting Area Codes 2000 (RUCA 00) (US Only)*//*Not available for NY, MA or ID*/
      @372 RuralUrbanCommutingAreaCodes201   2. /*Rural Urban Commuting Area Codes 2010 (RUCA 10) (US Only)*//*Not available for NY, MA or ID*/
      @374 UrbanRuralIndicatorCodes2000URI   2. /*Urban Rural Indicator Codes 2000 (URIC 00) (US Only)*/     /*Not available for NY, MA or ID*/
      @376 UrbanRuralIndicatorCodes2010URI   2. /*Urban Rural Indicator Codes 2010 (URIC 10) (US Only)*/     /*Not available for NY, MA or ID*/
      @378 Rural_Urban_Continuum_Code_1993   2. /*Rural-Urban Continuum Code 1993 - From SEER*Stat*/
      @380 Rural_Urban_Continuum_Code_2003   2. /*Rural-Urban Continuum Code 2003 - From SEER*Stat*/
      @382 Rural_Urban_Continuum_Code_2013   2. /*Rural-Urban Continuum Code 2013 - From SEER*Stat*/
      @384 Health_Service_Area               4. /*Health Service Area - From SEER*Stat*/
      @388 HealthService_Area_NCI_Modified   4. /*Health Service Area NCI Modified - From SEER*Stat*/

      @392 County_at_DX_Geocode_1990       $char3. /*County at DX Geocode 1990*/
      @395 County_at_DX_Geocode_2000	   $char3. /*County at DX Geocode 2000*/
      @398 County_at_DX_Geocode_2010       $char3. /*County at DX Geocode 2010*/
      @401 Derived_SS1977_flag             $char1. /*Derived SS1977 - Flag (2004+)*/                         /*Not available for NY, MA or ID*/
      @402 Derived_SS2000_flag             $char1. /*Derived SS2000 - Flag (2004+)*/                         /*Not available for NY, MA or ID*/
      @403 Firstcourseofreconstruct1998200 $char1. /*First course of reconstruct (1998-2002)*/               /*Not available for NY, MA or ID*/
      @404 Radiation                       $char1. /*Radiation*/                                             /*Not available for NY, MA or ID*/
      @405 RadiationtoBrainorCNS_1988_1997 $char1. /*Radiation to Brain or CNS (1988-1997)*/                 /*Not available for NY, MA or ID*/

      @406 SEER_DateofDeath_Month          $char2. /*Death Month based on Stat_rec*/
      @408 SEER_DateofDeath_Year           $char4. /*Death Year based on Stat_rec*/
      @412 Month_of_last_follow_up_recode  $char2. /*Month of Follow-up Recode, study cutoff used*/
      @414 Year_of_last_follow_up_recode   $char4. /*Year of Follow-up Recode, study cutoff used*/

      @419 Year_of_birth                   $char4. /*Year of Birth*/
      @423 Date_of_diagnosis_flag          $char2. /*Date of Diagnosis Flag*/
      @425 Date_therapy_started_flag       $char2. /*Date of Therapy Started Flag*/
      @427 Date_of_birth_flag              $char2. /*Date of Birth flag*/
      @429 Date_of_last_follow_up_flag     $char2. /*Date of Last Follow-up Flag*/
      @431 Month_therapy_started           $char2. /*Month Therapy Started*/
      @433 Year_therapy_started            $char4. /*Year Therapy Started*/
      @437 Other_cancer_directed_therapy   $char1. /*Other Cancer-Directed Therapy*/
      @438 Derived_AJCC_flag               $char1. /*Derived AJCC - Flag (2004+)*/                           /*Not available for NY, MA or ID*/
      @439 Derived_SS1977                  $char1. /*Derived SS1977 (2004-2015)*/                            /*Not available for NY, MA or ID*/
      @440 Derived_SS2000                  $char1. /*Derived SS2000 (2004+)*/                                /*Not available for NY, MA or ID*/
      @441 SEER_Summary_stage_1977_9500	   $char1. /*SEER summary stage 1977(1995-2000)*/                    /*Not available for NY, MA or ID*/
      @442 SEER_Summary_stage_2000_0103	   $char1. /*SEER summary stage 2000(2001-2003)*/                    /*Not available for NY, MA or ID*/
      @443 NAPIIA_Derived_API_Race	   $char2. /*NAPIIA Derived API Race*/                               /*Not available for NY, MA or ID*/
      @445 Primary_Payer_at_DX             $char2. /*Primary Payer at DX*/                                   /*Not available for NY, MA or ID*/
      @447 COD_ICD_code                    $char1. /*COD ICD code*/                                          /*Not available for NY, MA or ID*/
      @448 Cause_of_Death_ICD_8_or_9       $char4. /*Cause of Death (ICD-8 or 9)*/                           /*Not available for NY, MA or ID*/
      @452 Cause_of_Death_ICD_10           $char4. /*Cause of Death (ICD 10)*/                               /*Not available for NY, MA or ID*/
      @456 Recode_ICD_0_2_to_9             $char4. /*Recode ICD-O-2 to 9*/                                   /*Not available for NY, MA or ID*/
      @460 Recode_ICD_0_2_to_10            $char4. /*Recode ICD-O-2 to 10*/                                  /*Not available for NY, MA or ID*/
      @464 NHIA_Derived_Hisp_Origin        $char1. /*NHIA Dervied Hispanic Origin*/                          /*Not available for NY, MA or ID*/
      @465 Age_site_edit_override          $char1. /*Age-site edit override*/                                /*Not available for NY, MA or ID*/
      @466 Sequencenumber_dx_conf_override $char1. /*Sequence number-dx conf override*/                      /*Not available for NY, MA or ID*/
      @467 Site_type_lat_seq_override      $char1. /*Site-type-lat-seq override*/                            /*Not available for NY, MA or ID*/
      @468 Surgerydiagnostic_conf_override $char1. /*Surgery-diagnostic conf override*/                      /*Not available for NY, MA or ID*/
      @469 Site_type_edit_override         $char1. /*Site-type edit override*/                               /*Not available for NY, MA or ID*/
      @470 Histology_edit_override         $char1. /*Histology edit override*/                               /*Not available for NY, MA or ID*/
      @471 Report_source_sequence_override $char1. /*Report source sequence override*/                       /*Not available for NY, MA or ID*/
      @472 Seq_ill_defined_site_override   $char1. /*Seq-ill-defined site override*/                         /*Not available for NY, MA or ID*/
      @473 LeukLymphdxconfirmationoverride $char1. /*Leuk-Lymph dx confirmation override*/                   /*Not available for NY, MA or ID*/
      @474 Site_behavior_override          $char1. /*Site-behavior override*/                                /*Not available for NY, MA or ID*/
      @475 Site_EOD_dx_date_override       $char1. /*Site-EOD-dx date override*/                             /*Not available for NY, MA or ID*/
      @476 Site_laterality_EOD_override    $char1. /*Site-laterality-EOD override*/                          /*Not available for NY, MA or ID*/
      @477 Site_laterality_morph_override  $char1. /*Site-laterality-morph override*/                        /*Not available for NY, MA or ID*/

      @478 SEER_Summary_Stage_2000newonly  $char1. /*Summary Stage 2000 (NAACCR Item-759)*/	             /*Only to be available for new registries for diagnosis years 2000-2003*/

      @479 Insurance_Recode_2007             1. /*Insurance Recode (2007+)*/                                 /*Not available for NY, MA or ID*/
      @480 Yost_ACS_2006_2010                5. /*Yost Index (ACS 2006-2010)*/
      @485 Yost_ACS_2010_2014                5. /*Yost Index (ACS 2010-2014)*/
      @490 Yost_ACS_2013_2017                5. /*Yost Index (ACS 2013-2017)*/
      @495 Yost_ACS_2006_2010_State_based    5. /*Yost Index (ACS 2006-2010) - State based*/
      @500 Yost_ACS_2010_2014_State_based    5. /*Yost Index (ACS 2010-2014) - State based*/
      @505 Yost_ACS_2013_2017_State_based    5. /*Yost Index (ACS 2013-2017) - State based*/
      @510 Yost_ACS_2006_2010_quintile     $char1. /*Yost Index Quintile (ACS 2006-2010)*/
      @511 Yost_ACS_2010_2014_quintile     $char1. /*Yost Index Quintile (ACS 2010-2014)*/
      @512 Yost_ACS_2013_2017_quintile     $char1. /*Yost Index Quintile (ACS 2013-2017)*/
      @513 YostACS20062010quintileStatebas $char1. /*Yost Index Quintile (ACS 2006-2010) - State based*/
      @514 YostACS20102014quintileStatebas $char1. /*Yost Index Quintile (ACS 2010-2014) - State based*/
      @515 YostACS20132017quintileStatebas $char1. /*Yost Index Quintile (ACS 2013-2017) - State based*/

      @516 ENHANCED_FIVE_PERCENT_FLAG      $char1. /*Five Percent Flag from MBSF*/
      @517 Date_of_Death_Flag_created      $char1. /*Date of Death Flag (SEER vs Medicare)*/
      @518 Date_of_Birth_Flag_created      $char1. /*Date of Birth Flag (SEER vs Medicare)*/
      @519 HPV_recode_2010	                1. /*HPV Recode (2010+)  -- Needs special permission*/                                /*Not available for NY, MA or ID*/

      @521 OncotypeDXBreastRecurrenceScore   3. /*Oncotype DX Breast Recurrence Score  -- Needs special permission*/                  /*Not available for NY, MA or ID*/
      @524 OncotypeDXRSgroupRS18RS1830RS30   1. /*Oncotype DX RS group (RS < 18, RS 18-30, RS > 30) -- Needs special permission*/     /*Not available for NY, MA or ID*/
      @525 OncotypeDXreasonno_score_linked   1. /*Oncotype DX reason no score linked -- Needs special permission*/                    /*Not available for NY, MA or ID*/
      @526 Oncotype_DX_year_of_test_report   4. /*Oncotype DX year of test report -- Needs special permission*/                       /*Not available for NY, MA or ID*/
      @530 OncotypeDX_month_of_test_report   2. /*Oncotype DX month of test report -- Needs special permission*/                      /*Not available for NY, MA or ID*/
      @532 OncotypeDXmonthssince_diagnosis   3. /*Oncotype DX months since diagnosis -- Needs special permission*/                    /*Not available for NY, MA or ID*/
      ;


  label
     PATIENT_ID                        = "Patient ID"
     SEER_registry                     = "Registry"
     SEERregistrywithCAandGAaswholes   = "Registry with CA and GA as whole states"
     Louisiana20051stvs2ndhalfofyear   = "Louisiana 2005 1st vs 2nd half of the year"
     Marital_status_at_diagnosis       = "Marital Status"
     Race_ethnicity                    = "Race ethnicity"
     sex                               = "Sex"
     Agerecodewithsingleages_and_100   = "Age recode with single ages and 100+"
     agerecodewithsingle_ages_and_85   = "Age recode with single ages and 85+"
     Sequence_number                   = "Sequence Number"
     Month_of_diagnosis                = "Month of Diagnosis, Not month diagnosis recode"
     Year_of_diagnosis                 = "Year of Diagnosis"
     Month_of_diagnosis_recode         = "Month of Diagnosis Recode"
     Primary_Site                      = "Primary Site"
     Laterality                        = "Laterality"
     Histology_ICD_O_2                 = "Histology ICD-0-2"
     Behavior_code_ICD_O_2             = "Behavior ICD-0-2"
     Histologic_Type_ICD_O_3           = "Histologic type ICD-0-3"
     Behavior_code_ICD_O_3             = "Behavior code ICD-0-3"
     Grade                             = "Grade"
     Diagnostic_Confirmation           = "Diagnostic Confirmation"
     Type_of_Reporting_Source          = "Type of Reporting Source"
     EOD_10_size_1988_2003             = "EOD 10 - SIZE (1998-2003)"
     EOD_10_extent_1988_2003           = "EOD 10 - EXTENT (1998-2003)"
     EOD10Prostatepath_ext_1995_2003   = "EOD 10 - Prostate path ext (1995-2003)"
     EOD_10_nodes_1988_2003            = "EOD 10 - Nodes (1995-2003)"
     Regional_nodes_positive_1988      = "EOD 10 - Regional Nodes positive (1988+)"
     Regional_nodes_examined_1988      = "EOD 10 - Regional Nodes examined (1988+)"
     Expanded_EOD_1_CP53_1973_1982     = "EOD - expanded 1st digit"
     Expanded_EOD_2_CP54_1973_1982     = "EOD - expanded 2nd digit"
     Expanded_EOD_3_CP55_1973_1982     = "EOD - expanded 3rd digit"
     Expanded_EOD_4_CP56_1973_1982     = "EOD - expanded 4th digit"
     Expanded_EOD_5_CP57_1973_1982     = "EOD - expanded 5th digit"
     Expanded_EOD_6_CP58_1973_1982     = "EOD - expanded 6th digit"
     Expanded_EOD_7_CP59_1973_1982     = "EOD - expanded 7th digit"
     Expanded_EOD_8_CP60_1973_1982     = "EOD - expanded 8th digit"
     Expanded_EOD_9_CP61_1973_1982     = "EOD - expanded 9th digit"
     Expanded_EOD_10_CP62_1973_1982    = "EOD - expanded 10th digit"
     Expanded_EOD_11_CP63_1973_1982    = "EOD - expanded 11th digit"
     Expanded_EOD_12_CP64_1973_1982    = "EOD - expanded 12th digit"
     Expanded_EOD_13_CP65_1973_1982    = "EOD - expanded 13th digit"
     V2Digit_NS_EOD_part_1_1973_1982   = "NS EOD 1st digit"
     V2Digit_NS_EOD_part_2_1973_1982   = "NS EOD 2nd digit"
     V2Digit_SS_EOD_part_1_1973_1982   = "SS EOD 1st digit"
     V2Digit_SS_EOD_part_2_1973_1982   = "SS EOD 2nd digit"
     EOD_4_size_1983_1987              = "EOD 4 - Size (1983-1987)         "
     EOD_4_extent_1983_1987            = "EOD 4 - Extent (1983-1987)       "
     EOD_4_nodes_1983_1987             = "EOD 4 - Nodes (1983-1987)        "
     Coding_system_EOD_1973_2003       = "EOD Coding System (1973-2003)    "
     Tumor_marker_1_1990_2003          = "Tumor marker 1 (1990-2003)       "
     Tumor_marker_2_1990_2003          = "Tumor marker 2 (1990-2003)       "
     Tumor_marker_3_1998_2003          = "Tumor marker 3 (1990-2003        "
     CS_tumor_size_2004_2015           = "CS Tumor size (2004-2015)        "
     CS_extension_2004_2015            = "CS extension (2004-2015)         "
     CS_lymph_nodes_2004_2015          = "CS Lymph nodes (2004-2015)       "
     CS_mets_at_dx_2004_2015           = "CS Mets at dx                    "
     CSsitespecificfactor12004varyin   = "CS Site-specific factor 1(2004+) "
     CSsitespecificfactor22004varyin   = "CS Site-specific factor 2(2004+) "
     CSsitespecificfactor32004varyin   = "CS Site-specific factor 3(2004+) "
     CSsitespecificfactor42004varyin   = "CS Site-specific factor 4(2004+) "
     CSsitespecificfactor52004varyin   = "CS Site-specific factor 5(2004+) "
     CSsitespecificfactor62004varyin   = "CS Site-specific factor 6(2004+) "
     CSsitespecificfactor72004varyin   = "CS Site-specific factor 7(2004+) "
     CSsitespecificfactor82004varyin   = "CS Site-specific factor 8(2004+) "
     CSsitespecificfactor92004varyin   = "CS Site-specific factor 9(2004+) "
     CSsitespecificfactor102004varyi   = "CS Site-specific factor 10(2004+)"
     CSsitespecificfactor112004varyi   = "CS Site-specific factor 11(2004+)"
     CSsitespecificfactor122004varyi   = "CS Site-specific factor 12(2004+)"
     CSsitespecificfactor132004varyi   = "CS Site-specific factor 13(2004+)"
     CSsitespecificfactor152004varyi   = "CS Site-specific factor 15(2004+)"
     CSsitespecificfactor162004varyi   = "CS Site-specific factor 16(2004+)"
     CSsitespecificfactor252004varyi   = "CS Site-specific factor 25(2004+)"
     Derived_AJCC_T_6th_ed_2004_2015   = "Derived AJCC T 6th ed (2004-2015)"
     Derived_AJCC_N_6th_ed_2004_2015   = "Derived AJCC N 6th ed (2004-2015)"
     Derived_AJCC_M_6th_ed_2004_2015   = "Derived AJCC M 6th ed (2004-2015)"
     DerivedAJCCStageGroup6thed20042   = "Derived AJCC STAGE Group 6th ed (2004-2015)"
     SEERCombinedSummaryStage2000200   = "SEER Combined Summary Stage 2000 (2004+)"
     CSversioninputoriginal2004_2015   = "CS Version Input (2004-2015)	  "
     CS_version_derived_2004_2015      = "CS Version Derived (2004-2015)   "
     CSversioninputcurrent_2004_2015   = "CS Version Current (2004-2015)   "
     RX_Summ_Surg_Prim_Site_1998       = "RX Summ-Surg Prim site 1998+     "
     RX_Summ_Scope_Reg_LN_Sur_2003     = "RX Summ-Scope Reg LN Sur (2003+) "
     RX_Summ_Surg_Oth_Reg_Dis_2003     = "RX Summ-Surg Oth reg/dis (2003+) "
     RXSummReg_LN_Examined_1998_2002   = "RX Summ-Reg LN examined (1998-2002)"
     RX_Summ_Systemic_Surg_Seq         = "RX Summ--Systemic Surg Seq"
     RX_Summ_Surg_Rad_Seq              = "Radiation Sequence with Surgery"
     Reasonnocancer_directed_surgery   = "Reason No Cancer-Directed Surgery"
     Radiation_recode                  = "Radiation Recode (0 and 9 combined) - created"
     Chemotherapy_recode_yes_no_unk    = "CHEMOTHERAPY Recode, yes(1)/no/unknown(0) - created"
     Sitespecificsurgery19731997vary   = "Site Specific Surgery (1973-1997)"
     Scopeofreglymphndsurg_1998_2002   = "Scope of Reg Lymph ND Surg (1998-2002)"
     Surgeryofothregdissites19982002   = "Surgery of Oth Reg/Dis sites (1998-2002)"
     Record_number_recode              = "Record Number Recode             "
     Age_recode_with_1_year_olds       = "Age Recode with <1 Year Olds     "
     Site_recode_ICD_O_3_WHO_2008      = "Site Recode ICD-O-3/WHO 2008)    "
     ICCCsiterecode_ICD_O_3_WHO_2008   = "ICCC Site Recode ICD-O-3/WHO 2008"
     ICCCsiterecextendedICDO3WHO2008   = "ICCC Site rec extended ICD-O-3/WHO 2008"
     Behavior_recode_for_analysis      = "Behavior Recode for Analysis"
     Histologyrecode_broad_groupings   = "Histology Recode - Broad Groupings"
     Histologyrecode_Brain_groupings   = "Histology Recode - Brain Groupings"
     ICCCsiterecodeextended3rdeditio   = "ICCC Site Recode Extended 3rd Edition/IARC 2017"
     TNM_7_CS_v0204_Schema             = "TNM 7/CS v0204+ Schema"
     Race_recode_White_Black_Other     = "Race Recode (White, Black, Other)"
     Race_recode_W_B_AI_API            = "Race Recode (W, B, AI, API)"
     OriginrecodeNHIAHispanicNonHisp   = "Origin Recode NHIA (Hispanic, Non-Hispanic)"
     SEER_historic_stage_A_1973_2015   = "SEER Historic Stage A (1973-2015)"
     AJCCstage_3rd_edition_1988_2003   = "AJCC Stage 3rd Edition (1988-2003)"
     SEERmodifiedAJCCstage3rd1988200   = "SEER Modified AJCC Stage 3rd Edition (1988-2003)"
     Firstmalignantprimary_indicator   = "First Malignant Primary Indicator"
     state                             = "FIPS State"
     county                            = "FIPS County"
     PRCDA_2017	                       = "PRCDA - 2017"
     PRCDA_Region	               = "PRCDA - Region"
     COD_to_site_recode                = "COD to Site Recode"
     COD_to_site_rec_KM                = "COD to Site Recode KM"
     Vitalstatusrecodestudycutoffuse   = "Vital Status Recode (Study Cutoff Used)"
     IHS_Link                          = "IHS LINK"
     Summary_stage_2000_1998           = "Summary Stage 2000 (1998+)"
     AYA_site_recode_WHO_2008          = "AYA Site Recode/WHO 2008"
     Lymphomasubtype_recode_WHO_2008   = "Lymphoma Subtype Recode/WHO 2008"
     ICCCsiterecode3rdeditionIARC201   = "ICCC Site Recode 3rd Edition/IARC 2017"
     SEERcausespecificdeathclassific   = "SEER Cause-Specific Death Classification"
     SEERothercauseofdeathclassifica   = "SEER Other Cause of Death Classification"
     CSTumor_Size_Ext_Eval_2004_2015   = "CS Tumor Size/Ext Eval (2004-2015) "
     CS_Reg_Node_Eval_2004_2015        = "CS Reg Node Eval (2004-2015)"
     CS_Mets_Eval_2004_2015            = "CS Mets Eval (2004-2015)"
     Primary_by_international_rules    = "Primary by International Rules"
     ERStatusRecodeBreastCancer_1990   = "ER Status Recode Breast Cancer (1990+)"
     PRStatusRecodeBreastCancer_1990   = "PR Status Recode Breast Cancer (1990+)"
     CS_Schema_AJCC_6th_Edition        = "CS Schema--AJCC 6th Edition"
     LymphvascularInvasion2004varyin   = "Lymph Vascular Invasion (2004+ Varying by Schema)"
     Survival_months                   = "Survival Months"
     Survival_months_flag              = "Survival Months Flag"
     Derived_AJCC_T_7th_ed_2010        = "Derived AJCC T, 7th Ed 2010-2015)"
     Derived_AJCC_N_7th_ed_2010        = "Derived AJCC N, 7th Ed 2010-2015)"
     Derived_AJCC_M_7th_ed_2010        = "Derived AJCC M, 7th Ed 2010-2015)"
     DerivedAJCCStageGroup7thed_2010   = "Derived AJCC Stage Group, 7th Ed 2010-2015)"
     BreastAdjustedAJCC6thT1988_2015   = "Breast--Adjusted AJCC 6th T (1988-2015)"
     BreastAdjustedAJCC6thN1988_2015   = "Breast--Adjusted AJCC 6th N (1988-2015)"
     BreastAdjustedAJCC6thM1988_2015   = "Breast--Adjusted AJCC 6th M (1988-2015)"
     BreastAdjustedAJCC6thStage19882   = "Breast--Adjusted AJCC 6th Stage (1988-2015)"
     Derived_HER2_Recode_2010          = "Derived HER2 Recode (2010+)"
     Breast_Subtype_2010               = "Breast Subtype (2010+)"
     LymphomaAnnArborStage_1983_2015   = "Lymphomas: Ann Arbor Staging (1983-2015)"
     SEERCombinedMetsat_DX_bone_2010   = "SEER Combined Mets at Dx-Bone (2010+)"
     SEERCombinedMetsatDX_brain_2010   = "SEER Combined Mets at Dx-Brain (2010+)"
     SEERCombinedMetsatDX_liver_2010   = "SEER Combined Mets at Dx-Liver (2010+)"
     SEERCombinedMetsat_DX_lung_2010   = "SEER Combined Mets at Dx-Lung (2010+)"
     TvaluebasedonAJCC_3rd_1988_2003   = "T Value - Based on AJCC 3rd (1988-2003)"
     NvaluebasedonAJCC_3rd_1988_2003   = "N Value - Based on AJCC 3rd (1988-2003)"
     MvaluebasedonAJCC_3rd_1988_2003   = "M Value - Based on AJCC 3rd (1988-2003)"
     Totalnumberofinsitumalignanttum   = "Total Number of In Situ/Malignant Tumors for Patient"
     Totalnumberofbenignborderlinetu   = "Total Number of Benign/Borderline Tumors for Patient"
     RadiationtoBrainorCNSRecode1988   = "Radiation to Brain or CNS Recode (1988-1997)"
     Tumor_Size_Summary_2016	       = "Tumor Size Summary (2016+)"
     Derived_SEER_Cmb_Stg_Grp_2016     = "Derived SEER Combined STG GRP (2016+)"
     Derived_SEER_Combined_T_2016      = "Derived SEER Combined T (2016+)"
     Derived_SEER_Combined_N_2016      = "Derived SEER Combined N (2016+)"
     Derived_SEER_Combined_M_2016      = "Derived SEER Combined M (2016+)"
     DerivedSEER_Combined_T_Src_2016   = "Derived SEER Combined T SRC (2016+)"
     DerivedSEER_Combined_N_Src_2016   = "Derived SEER Combined N SRC (2016+)"
     DerivedSEER_Combined_M_Src_2016   = "Derived SEER Combined M SRC (2016+)"
     TNM_Edition_Number_2016	       = "TNM Edition Number (2016+)"
     Mets_at_DX_Distant_LN_2016	       = "Mets at Dx-Distant LN (2016+)"
     Mets_at_DX_Other_2016	       = "Mets at DX--Other (2016+)"
     Census_Tract_1990                 = "Census Track 1990"
     Census_Tract_2000                 = "Census Track 2000"
     Census_Tract_2010                 = "Census Track 2010"
     Census_Coding_System	       = "Coding System for Census Track 1970/80/90"
     Census_Tract_Certainty_1990       = "Census Tract Certainty 1970/1980/1990"
     Census_Tract_Certainty_2000       = "Census Tract Certainty 2000"
     Census_Tract_Certainty_2010       = "Census Tract Certainty 2010"
     Census_Tract_Poverty_Indicator    = "Census Tract Poverty Indicator"
     RuralUrbanCommutingAreaCodes200   = "Rural Urban Commuting Area Codes 2000 (RUCA 00) (US Only)"
     RuralUrbanCommutingAreaCodes201   = "Rural Urban Commuting Area Codes 2010 (RUCA 10) (US Only)"
     UrbanRuralIndicatorCodes2000URI   = "Urban Rural Indicator Codes 2000 (URIC 00) (US Only)"
     UrbanRuralIndicatorCodes2010URI   = "Urban Rural Indicator Codes 2010 (URIC 10) (US Only)"
     Rural_Urban_Continuum_Code_1993   = "Rural-Urban Continuum Code 1993 - From SEER*Stat"
     Rural_Urban_Continuum_Code_2003   = "Rural-Urban Continuum Code 2003 - From SEER*Stat"
     Rural_Urban_Continuum_Code_2013   = "Rural-Urban Continuum Code 2013 - From SEER*Stat"
     Health_Service_Area               = "Health Service Area - From SEER*Stat"
     HealthService_Area_NCI_Modified   = "Health Service Area NCI Modified - From SEER*Stat"
     County_at_DX_Geocode_1990         = "County at DX Geocode 1990"
     County_at_DX_Geocode_2000	       = "County at DX Geocode 2000"
     County_at_DX_Geocode_2010         = "County at DX Geocode 2010"
     Derived_SS1977_flag               = "Derived SS1977 - Flag (2004+)"
     Derived_SS2000_flag               = "Derived SS2000 - Flag (2004+)"
     Firstcourseofreconstruct1998200   = "First course of reconstruct (1998-2002)"
     Radiation                         = "Radiation"
     RadiationtoBrainorCNS_1988_1997   = "Radiation to Brain or CNS (1988-1997)"
     SEER_DateofDeath_Month            = "Death Month based on Stat_rec"
     SEER_DateofDeath_Year             = "Death Year based on Stat_rec"
     Month_of_last_follow_up_recode    = "Month of Follow-up recode, study cutoff used"
     Year_of_last_follow_up_recode     = "Year of Follow-up recode, study cutoff used"
     Year_of_birth                     = "Year of Birth"
     Date_of_diagnosis_flag            = "Date of Diagnosis Flag"
     Date_therapy_started_flag         = "Date of Therapy Started Flag"
     Date_of_birth_flag                = "Date of Birth flag"
     Date_of_last_follow_up_flag       = "Date of Last Follow-up Flag"
     Month_therapy_started             = "Month Therapy Started"
     Year_therapy_started              = "Year Therapy Started"
     Other_cancer_directed_therapy     = "Other Cancer-Directed Therapy"
     Derived_AJCC_flag                 = "Derived AJCC - Flag (2004+)"
     Derived_SS1977                    = "Derived SS1977 (2004-2015)"
     Derived_SS2000                    = "Derived SS2000 (2004+)"
     SEER_Summary_stage_1977_9500      = "SEER summary stage 1977(1995-2000)"
     SEER_Summary_stage_2000_0103      = "SEER summary stage 2000(2001-2003)"
     NAPIIA_Derived_API_Race	       = "NAPIIA Derived API Race"
     Primary_Payer_at_DX               = "Primary Payer at DX"
     COD_ICD_code                      = "COD ICD code"
     Cause_of_Death_ICD_8_or_9         = "Cause of Death (ICD-8 or 9)"
     Cause_of_Death_ICD_10             = "Cause of Death (ICD 10)"
     Recode_ICD_0_2_to_9               = "Recode ICD-O-2 to 9"
     Recode_ICD_0_2_to_10              = "Recode ICD-O-2 to 10"
     NHIA_Derived_Hisp_Origin          = "NHIA Dervied Hispanic Origin"
     Age_site_edit_override            = "Age-site edit override"
     Sequencenumber_dx_conf_override   = "Sequence number-dx conf override"
     Site_type_lat_seq_override        = "Site-type-lat-seq override"
     Surgerydiagnostic_conf_override   = "Surgery-diagnostic conf override"
     Site_type_edit_override           = "Site-type edit override"
     Histology_edit_override           = "Histology edit override"
     Report_source_sequence_override   = "Report source sequence override"
     Seq_ill_defined_site_override     = "Seq-ill-defined site override"
     LeukLymphdxconfirmationoverride   = "Leuk-Lymph dx confirmation override"
     Site_behavior_override            = "Site-behavior override"
     Site_EOD_dx_date_override         = "Site-EOD-dx date override"
     Site_laterality_EOD_override      = "Site-laterality-EOD override"
     Site_laterality_morph_override    = "Site-laterality-morph override"
     SEER_Summary_Stage_2000newonly    = "Summary Stage 2000 (NAACCR Item-759) (Only to be available for new registries for diagnosis years 2000-2003)"
     Insurance_Recode_2007             = "Insurance Recode (2007+)"
     Yost_ACS_2006_2010                = "Yost Index (ACS 2006-2010)"
     Yost_ACS_2010_2014                = "Yost Index (ACS 2010-2014)"
     Yost_ACS_2013_2017                = "Yost Index (ACS 2013-2017)"
     Yost_ACS_2006_2010_State_based    = "Yost Index (ACS 2006-2010) - State Based"
     Yost_ACS_2010_2014_State_based    = "Yost Index (ACS 2010-2014) - State Based"
     Yost_ACS_2013_2017_State_based    = "Yost Index (ACS 2013-2017) - State Based"
     Yost_ACS_2006_2010_quintile       = "Yost Index Quintile (ACS 2006-2010)"
     Yost_ACS_2010_2014_quintile       = "Yost Index Quintile (ACS 2010-2014)"
     Yost_ACS_2013_2017_quintile       = "Yost Index Quintile (ACS 2013-2017)"
     YostACS20062010quintileStatebas   = "Yost Index Quintile (ACS 2006-2010) - State Based"
     YostACS20102014quintileStatebas   = "Yost Index Quintile (ACS 2010-2014) - State Based"
     YostACS20132017quintileStatebas   = "Yost Index Quintile (ACS 2013-2017) - State Based"
     ENHANCED_FIVE_PERCENT_FLAG        = "Five Percent Flag from MBSF"
     Date_of_Death_Flag_created        = "Date of Death Flag (SEER vs Medicare)"
     Date_of_Birth_Flag_created        = "Date of Birth Flag (SEER vs Medicare)"
     HPV_recode_2010	               = "HPV Recode (2010+)  -- Needs special permission"
     OncotypeDXBreastRecurrenceScore   = "Oncotype DX Breast Recurrence Score  -- Needs special permission"
     OncotypeDXRSgroupRS18RS1830RS30   = "Oncotype DX RS group (RS < 18, RS 18-30, RS > 30) -- Needs special permission"
     OncotypeDXreasonno_score_linked   = "Oncotype DX reason no score linked -- Needs special permission"
     Oncotype_DX_year_of_test_report   = "Oncotype DX year of test report -- Needs special permission"
     OncotypeDX_month_of_test_report   = "Oncotype DX month of test report -- Needs special permission"
     OncotypeDXmonthssince_diagnosis   = "Oncotype DX months since diagnosis -- Needs special permission"
      ;

run;


proc export data = SEER_in
outfile = "Data/SEER_cancer.csv"
dbms = csv;
run;
