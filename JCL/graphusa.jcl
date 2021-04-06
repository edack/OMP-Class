//RUNJOBTM  JOB ('RUNJOBTM'),'RUNJCL',MSGCLASS=X,
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
//SRTSTP  EXEC PGM=SORT
//SYSOUT    DD SYSOUT=*
//SORTIN    DD DSN=&HLQ1..&HLQ2..&INDD,DISP=SHR
//SORTOUT   DD DSN=&&TEMPFL1,
//             DISP=(NEW,PASS,DELETE),
//             DCB=(LRECL=130,BLKSIZE=27950,RECFM=FB)
//SORTOUT   DD SYSOUT=*
//SYSIN     DD *
  SORT FORMAT=CH,
       FIELDS=(1,23,D)
/*
//* ------------------------------------------------------------------
//* STEP 2 - RUN THE REPORT
//* ------------------------------------------------------------------
//STEPLIB DD DSN=&HLQ1..COPYLIB,DISP=SHR
//COBOL   EXEC  PGM=&PGM
//USAFILE    DD DSN=&&TEMPFL1,
//             DISP=(OLD,DELETE,DELETE),
//             DCB=(LRECL=130,BLKSIZE=27950,RECFM=FB)
//*PRTFILE  DD DSN=&HLQ1..&HLQ2..&OUTDD,DISP=SHR
//*RPTTYPE   DD *
//*ALL
//*/*
//PRTFILE  DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//* ------------------------------------------------------------------
//* STEP 2.1 - SELECTION PARAMETER FOR THE ALL REPORT
//* ------------------------------------------------------------------
ALL
/*

