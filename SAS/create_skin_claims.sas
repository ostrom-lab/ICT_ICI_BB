options nocenter validvarname=upcase;
libname SAS '/SASData/';

data SAS.claims;
  set SAS.medpar(in=M) SAS.outpat(in=O) SAS.nch(in=N);
  if M then Filetype = "M";
	  else if O then Filetype = "O";
	  else if N then Filetype = "N";
  CLM_FROM_DATE = input(cat(CLM_FROM_DT),yymmdd8.);
  CLM_THRU_DATE = input(cat(CLM_THRU_DT),yymmdd8.);
  format CLM_FROM_DATE CLM_THRU_DATE mmddyy10.;
  drop CLM_FROM_DT CLM_THRU_DT;
  if missing(CLM_THRU_DATE) then CLM_THRU_DATE = CLM_FROM_DATE; 
run; 

proc import file = "Data/skin_raw.csv"
out = sas.seerskin
dbms = csv
replace;
run;

data SAS.seerskin;
set SAS.seerskin;
format date_of_dx  mmddyy10.;
label date_of_dx = "Date of diagnosis";
run;

proc sql;
  create table SAS.skinClaims as
  select * from SAS.seerskin as X
  left join sas.claims as Y
  on X.PATIENT_ID=Y.PATIENT_ID
  order by X.PATIENT_ID, Y.CLM_ID;
quit;

proc export data = SAS.skinclaims
OUTFILE="data/skinclaims.csv" 
DBMS = "CSV" REPLACE;
run;

proc sql;
  create table SAS.skinpde as
  select * from SAS.seerskin as X
  left join SAS.pde as Y
  on X.PATIENT_ID=Y.PATIENT_ID
  order by X.PATIENT_ID, Y.SVC_FROM_DT;
quit;

proc export data = SAS.skinpde 
outfile='data/skinpde.csv'
dbms = "CSV" replace;
run;

proc sql;
  create table SAS.skindme as
  select * from SAS.seerskin as X
  left join SAS.dme as Y
  on X.PATIENT_ID=Y.PATIENT_ID
  order by X.PATIENT_ID, Y.CLM_THRU_DATE;
quit;

proc export data = SAS.skindme 
outfile='data/skindme.csv'
dbms = "CSV" REPLACE;
run;

data SAS.seerskin;
set SAS.seerskin;
start_date = intnx('month',date_of_dx,-12,'S');
end_date = date_of_dx-1;
format start_date end_date mmddyy10.;
run;
/*
data SAS.comorb_claims;
  set 
    SAS.MEDPAR(in=M keep=PATIENT_ID CLM_FROM_DT CLM_THRU_DT ICD_DGNS_CD1-ICD_DGNS_CD25)
    SAS.OUTPAT(in=O keep=PATIENT_ID CLM_FROM_DT CLM_THRU_DT ICD_DGNS_CD1-ICD_DGNS_CD25)
    SAS.NCH(in=N keep=PATIENT_ID CLM_FROM_DT CLM_THRU_DT ICD_DGNS_CD1-ICD_DGNS_CD12)
    ;
  if M then Filetype = "M";
	  else if O then Filetype = "O";
	  else if N then Filetype = "N";
  CLM_FROM_DATE = input(cat(CLM_FROM_DT),yymmdd8.);
  CLM_THRU_DATE = input(cat(CLM_THRU_DT),yymmdd8.);
  format CLM_FROM_DATE CLM_THRU_DATE mmddyy10.;
  drop CLM_FROM_DT CLM_THRU_DT;
  if missing(CLM_THRU_DATE) then CLM_THRU_DATE = CLM_FROM_DATE; 
run;
*/
proc sql;
  create table SelectedClaims as
  select C.*, 
		 S.date_of_dx, S.start_date, S.end_date
  from
    SAS.claims as C,
    SAS.seerskin as S
  where (C.PATIENT_ID=S.PATIENT_ID) and ((S.Start_date-60)<=C.CLM_FROM_DATE<=(S.End_date+60) )
  order by C.PATIENT_ID, C.CLM_FROM_DATE;
quit;

%include 'SAS/SAS_comorbidity_macro.sas';
%COMORB(SelectedClaims,PATIENT_ID,start_date,end_date,CLM_FROM_DATE,CLM_THRU_DATE,Filetype,
        ICD_DGNS_CD1-ICD_DGNS_CD25,R,sas.skin_comorbidities);

proc export data = sas.skin_comorbidities
outfile = 'Data/skin_comorbidities.csv'
dbms = "CSV"
REPLACE;
run;
