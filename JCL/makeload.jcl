//CBL0106A JOB 1,NOTIFY=&SYSUID
//STEP01 EXEC PGM=IEBCOPY
//SYSPRINT DD SYSOUT=*
//SYSOUT DD SYSOUT=*
//SYSUT1 DD *
//SYSUT2 DD DSN=&SYSUID..LOAD2,DISP=(NEW,CATLG,CATLG),
//  LIKE=ZOS.PUBLIC.LOAD