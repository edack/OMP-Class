//RUNJOBTM JOB ('RUNJOBTM'),'RUNJCL',MSGCLASS=X,
//             CLASS=A,NOTIFY=&SYSUID
// SET HLQ1='Z80843'
// SET HLQ2='NCOV19'
// SET PGM='CBLGRPH'
// SET INDD='USAHIST'
// SET OUTDD='PRTLINE'
//JOBLIB   DD DISP=SHR,DSN=&HLQ1..LOAD
//* ------------------------------------------------
//* STEP 1 - DELETE FILES
//* ------------------------------------------------
//DEL1    EXEC PGM=IEFBR14
//DDOUT   DD DSN=&HLQ1..&HLQ2..&OUTDD,DISP=(MOD,DELETE),
//        SPACE=(TRK,0)
//* ------------------------------------------------
//* STEP 2 - DEFINE FILES
//* ------------------------------------------------
//DEF1    EXEC PGM=IEFBR14
//DDOUT   DD DSN=&HLQ1..&HLQ2..&OUTDD,
//        UNIT=SYSDA,DISP=(NEW,CATLG,DELETE),
//        SPACE=(TRK,(10,5),RLSE),
//        DCB=(RECFM=FB,LRECL=131,BLKSIZE=0)
//*====================================================================
//*   RUN THE REPORT
//*====================================================================
//STEPLIB DD DSN=&HLQ1..COPYLIB,DISP=SHR
//COBOL   EXEC  PGM=&PGM.
//USAHIST  DD DSN=&HLQ1..&HLQ2..&INDD,DISP=SHR
//*PRTLINE  DD DSN=&HLQ1..&HLQ2..&OUTDD,DISP=SHR
//PRTLINE  DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//SYSOUT  DD SYSOUT=*
