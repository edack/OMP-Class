//CBL0106R JOB 1,NOTIFY=&SYSUID,REGION=0M
//********************************************************************
//*        RUN                                                       *
//********************************************************************
//RUN       EXEC PGM=IKJEFT01
//STEPLIB   DD DSN=DSNC10.SDSNLOAD,DISP=SHR
//REPORT    DD SYSOUT=*
//CARDIN    DD *
*
//SYSTSIN   DD *,SYMBOLS=CNVTSYS
 DSN SYSTEM(DBCG)
 RUN PROGRAM(CBL0106C) PLAN(&SYSUID) LIB('&SYSUID..LOAD')
 END
//SYSIN     DD DUMMY
//SYSUDUMP  DD DUMMY
//CEEDUMP   DD DUMMY
//PRTLINE   DD SYSOUT=*
//SYSTSPRT  DD SYSOUT=*
//SYSPRINT  DD SYSOUT=*
/*
