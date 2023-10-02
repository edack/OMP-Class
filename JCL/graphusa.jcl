//GRAPHRUN  JOB ('GRAPHRUN'),'RUNJCL',MSGCLASS=X,
//          CLASS=A,NOTIFY=&SYSUID
// SET PGM='GRAPHUSA'
// SET HLQ1='Z80843'
// SET HLQ2='NCOV19'
// SET INDD='USAFILE'
// SET OUTDD='PRTFILE'
//JOBLIB   DD DSN=&HLQ1..LOAD,DISP=SHR
//* ------------------------------------------------------------------
//* STEP 1 - SORT FILES
//* ------------------------------------------------------------------
//SRTSTP    EXEC  PGM=SORT
//SYSOUT    DD SYSOUT=*
//SORTIN    DD DSN=&HLQ1..&HLQ2..&INDD,DISP=SHR
//SORTOUT   DD DSN=&&TEMPFL1,
//             DCB=(LRECL=130,RECFM=FB),
//             SPACE=(TRK,(75,10),RLSE),
//             DISP=(NEW,PASS,DELETE)
//SORTOUT   DD SYSOUT=*
//SYSIN     DD *
  SORT FORMAT=CH,
       FIELDS=(1,23,D)
/*
//* ------------------------------------------------------------------
//* STEP 2 - RUN THE REPORT
//* ------------------------------------------------------------------
//STEPLIB   DD DSN=&HLQ1..COPYLIB,DISP=SHR
//COBOL     EXEC  PGM=&PGM
//USAFILE   DD DSN=&&TEMPFL1,
//             DISP=(OLD,DELETE,DELETE)
//PRTFILE   DD SYSOUT=*
//SYSPRINT  DD SYSOUT=*
//SYSOUT    DD SYSOUT=*
//* ------------------------------------------------------------------
//* STEP 2.1 - SELECTION PARAMETER FOR THE REPORT, ALL/STATE
//* ------------------------------------------------------------------
ALL
/*
