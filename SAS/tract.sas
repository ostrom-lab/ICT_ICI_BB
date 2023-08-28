filename tract 'RawData/tract.encr.census.file.dt030121.txt';                
/*reading in an un-zipped file*/
data tract;
  infile tract lrecl=458 missover pad;
  input @001 filetype      $char2.
        @003 state         $char2.
        @005 county        $char3.
        @008 tract         $char6.
        @014 ctpci         10.
        @024 ctmed         10.
        @034 ctden         10.
        @044 ctwht         6.2
        @050 ctblk         6.2
        @056 cthsp         6.2
        @062 cten5         6.2
        @068 cten6         6.2
        @074 ctnon         6.2
        @080 cthso         6.2
        @086 ctscl         6.2
        @092 ctcol         6.2
        @098 whtnon        6.2
        @104 whthso        6.2
        @110 whtscl        6.2
        @116 whtcol        6.2
        @122 blknon        6.2
        @128 blkhso        6.2
        @134 blkscl        6.2
        @140 blkcol        6.2
        @146 aminon        6.2
        @152 amihso        6.2
        @158 amiscl        6.2
        @164 amicol        6.2
        @170 asinon        6.2
        @176 asihso        6.2
        @182 asiscl        6.2
        @188 asicol        6.2
        @194 othnon        6.2
        @200 othhso        6.2
        @206 othscl        6.2
        @212 othcol        6.2
        @218 hspnon        6.2
        @224 hsphso        6.2
        @230 hspscl        6.2
        @236 hspcol        6.2
        @242 natnon        6.2
        @248 nathso        6.2
        @254 natscl        6.2
        @260 natcol        6.2
        @266 pov_tot       6.2
        @272 pov_totlt65   6.2
        @278 pov_tot6574   6.2
        @284 pov_tot75     6.2
        @290 pov_wht       6.2
        @296 pov_blk       6.2
        @302 pov_ami       6.2
        @308 pov_asi       6.2
        @314 pov_nat       6.2
        @320 pov_oth       6.2
        @326 pov_hsp       6.2
        @332 pov_whtlt65   6.2
        @338 pov_wht6574   6.2
        @344 pov_wht75     6.2
        @350 pov_blklt65   6.2
        @356 pov_blk6574   6.2
        @362 pov_blk75     6.2
        @368 pov_amilt65   6.2
        @374 pov_ami6574   6.2
        @380 pov_ami75     6.2
        @386 pov_asilt65   6.2
        @392 pov_asi6574   6.2
        @398 pov_asi75     6.2
        @404 pov_natlt65   6.2
        @410 pov_nat6574   6.2
        @416 pov_nat75     6.2
        @422 pov_othlt65   6.2
        @428 pov_oth6574   6.2
        @434 pov_oth75     6.2
        @440 pov_hsplt65   6.2
        @446 pov_hsp6574   6.2
        @452 pov_hsp75     6.2
        ;
      ;

label
  filetype = 'File Type Source'
  state    = 'State Code (FIPS coding)'
  county   = 'County Code (FIPS coding)'
  tract    = 'Census Tract'
  ctpci    = 'Census Tract PCI'
  ctmed    = 'Census Tract Median Income'
  ctden    = 'Census Tract Density'
  ctwht    = 'Census Tract Pct Whites'
  ctblk    = 'Census Tract Pct Blacks'
  cthsp    = 'Census Tract Pct Hispanics'
  cten5    = 'Census Tract Pct of HHs who do not speak English well or at all 5+'
  cten6    = 'Census Tract Pct of HHs who do not speak English well or at all 65+'
  ctnon    = 'Census Tract Pct Non High School Grads'
  cthso    = 'Census Tract Pct High School Only'
  ctscl    = 'Census Tract Pct Some College Education'
  ctcol    = 'Census Tract Pct College Education at least 4 years'
  whtnon   = 'Whites - Census Tract Pct Non High School Grads by Race'
  whthso   = 'Whites - Census Tract Pct High School Only by Race'
  whtscl   = 'Whites - Census Tract Pct Some College by Race'
  whtcol   = 'Whites - Census Tract Pct College Education at least 4 years by Race'
  blknon   = 'Blacks - Census Tract Pct Non High School Grads by Race'
  blkhso   = 'Blacks - Census Tract Pct High School Only by Race'
  blkscl   = 'Blacks - Census Tract Pct Some College by Race'
  blkcol   = 'Blacks - Census Tract Pct College Education at least 4 years by Race'
  aminon   = 'American Indian - Census Tract Pct Non High School Grads by Race'
  amihso   = 'American Indian - Census Tract Pct High School Only by Race'
  amiscl   = 'American Indian - Census Tract Pct Some College by Race'
  amicol   = 'American Indian - Census Tract Pct College Education at least 4 years by Race'
  asinon   = 'Asian - Census Tract Pct Non High School Grads by Race'
  asihso   = 'Asian - Census Tract Pct High School Only by Race'
  asiscl   = 'Asian - Census Tract Pct Some College by Race'
  asicol   = 'Asian - Census Tract Pct College Education at least 4 years by Race'
  othnon   = 'Other - Census Tract Pct Non High School Grads by Race'
  othhso   = 'Other - Census Tract Pct High School Only by Race'
  othscl   = 'Other - Census Tract Pct Some College by Race'
  othcol   = 'Other - Census Tract Pct College Education at least 4 years by Race'
  hspnon   = 'Hispanic - Census Tract Pct Non High School Grads by Race'
  hsphso   = 'Hispanic - Census Tract Pct High School Only by Race'
  hspscl   = 'Hispanic - Census Tract Pct Some College by Race'
  hspcol   = 'Hispanic - Census Tract Pct College Education at least 4 years by Race'
  natnon   = 'Native Hawaiian - Census Tract Pct Non High School Grads by Race'
  nathso   = 'Native Hawaiian - Census Tract Pct High School Only by Race'
  natscl   = 'Native Hawaiian - Census Tract Pct Some College by Race'
  natcol   = 'Native Hawaiian - Census Tract Pct College Education at least 4 years by Race'
  pov_tot      = 'Percent of residents living below poverty'
  pov_totlt65  = 'Percent of residents living below poverty less than 65'
  pov_tot6574  = 'Percent of residents living below poverty age 65-74'
  pov_tot75    = 'Percent of residents living below poverty age 75+'
  pov_wht      = 'White - Percent of residents living below poverty'
  pov_blk      = 'Black - Percent of residents living below poverty'
  pov_ami      = 'American Indian - Percent of residents living below poverty'
  pov_asi      = 'Asian - Percent of residents living below poverty'
  pov_nat      = 'Native Hawaiian - Percent of residents living below poverty'
  pov_oth      = 'Other - Percent of residents living below poverty'
  pov_hsp      = 'Hispanic - Percent of residents living below poverty'
  pov_whtlt65  = 'White - Percent of residents living below poverty less than 65'
  pov_wht6574  = 'White - Percent of residents living below poverty age 65-74'
  pov_wht75    = 'White - Percent of residents living below poverty age 75+'
  pov_blklt65  = 'Black - Percent of residents living below poverty less than 65'
  pov_blk6574  = 'Black - Percent of residents living below poverty age 65-74'
  pov_blk75    = 'Black - Percent of residents living below poverty age 75+'
  pov_amilt65  = 'American Indian - Percent of residents living below poverty less than 65'
  pov_ami6574  = 'American Indian - Percent of residents living below poverty age 65-74'
  pov_ami75    = 'American Indian - Percent of residents living below poverty age 75+'
  pov_asilt65  = 'Asian - Percent of residents living below poverty less than 65'
  pov_asi6574  = 'Asian - Percent of residents living below poverty age 65-74'
  pov_asi75    = 'Asian - Percent of residents living below poverty age 75+'
  pov_natlt65  = 'Native Hawaiian - Percent of residents living below poverty less than 65'
  pov_nat6574  = 'Native Hawaiian - Percent of residents living below poverty age 65-74'
  pov_nat75    = 'Native Hawaiian - Percent of residents living below poverty age 75+'
  pov_othlt65  = 'Other - Percent of residents living below poverty less than 65'
  pov_oth6574  = 'Other - Percent of residents living below poverty age 65-74'
  pov_oth75    = 'Other - Percent of residents living below poverty age 75+'
  pov_hsplt65  = 'Hispanic - Percent of residents living below poverty less than 65'
  pov_hsp6574  = 'Hispanic - Percent of residents living below poverty age 65-74'
  pov_hsp75    = 'Hispanic - Percent of residents living below poverty age 75+'
  ;

run;


proc export data = tract
outfile = "Data/tract.csv"
dbms = csv;
run;
