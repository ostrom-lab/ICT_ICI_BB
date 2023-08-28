options nocenter validvarname=upcase;
libname SAS '/SASData/';

/*data SAS.claims;
  merge SAS.MEDPAR(in=M) SAS.outpat(in=O) SAS.nch(in=N);
  if M then Filetype = "M";
	  else if O then Filetype = "O";
	  else if N then Filetype = "N";
  CLM_FROM_DATE = input(cat(CLM_FROM_DT),yymmdd8.);
  CLM_THRU_DATE = input(cat(CLM_THRU_DT),yymmdd8.);
  format CLM_FROM_DATE CLM_THRU_DATE mmddyy10.;
  drop CLM_FROM_DT CLM_THRU_DT;
  if missing(CLM_THRU_DATE)then CLM_THRU_DATE = CLM_FROM_DATE; 
run; */

proc import file = "Data/brain_raw.csv"
out = sas.seerbrain
dbms = csv
replace;
run;

data SAS.seerbrain;
set SAS.seerbrain;
Diagnosis_date = mdy(Month_of_diagnosis_recode,1,Year_of_diagnosis);
format Diagnosis_date  mmddyy10.;
label Diagnosis_date = "Date of diagnosis";
keep PATIENT_ID Diagnosis_date sample;
run;

proc sql;
  create table SAS.brainClaims as
  select * from SAS.seerbrain as X
  left join SAS.claims as Y
  on X.PATIENT_ID=Y.PATIENT_ID
  order by X.PATIENT_ID, Y.CLM_ID;
quit;


proc export data = SAS.brainClaims 
OUTFILE="Data/BrainClaims.csv" 
DBMS = "CSV" REPLACE;
run;
