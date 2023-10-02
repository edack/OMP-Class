//CBLDB22R JOB 1,NOTIFY=&SYSUID,REGION=0M
//********************************************************************
//*        RUN                                                       *
//********************************************************************
//RUN     EXEC PGM=IKJEFT01
//STEPLIB  DD DSN=DSNC10.SDSNLOAD,DISP=SHR
//RECIN    DD *
*
//SYSTSIN  DD *,SYMBOLS=CNVTSYS
 DSN SYSTEM(DBCG)
 RUN PROGRAM(CBLDB22) PLAN(&SYSUID) LIB('&SYSUID..LOAD')
 END
//REPORT   DD SYSOUT=*,OUTLIM=15000
//SYSIN    DD DUMMY
//SYSUDUMP DD DUMMY
//CEEDUMP  DD DUMMY
//SYSTSPRT DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
/*
