//NEWCAT JOB 1,NOTIFY=&SYSUID,CLASS=A,MSGCLASS=H,MSGLEVEL=(1,1)
//      EXEC PGM=IEFBR14
//NEWDS DD DSN=&SYSUID..JCL(TESTMBR),DISP=(NEW,CATLG),
//      SPACE=(TRK,(1,10))
//