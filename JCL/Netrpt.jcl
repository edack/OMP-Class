//Z80843 JOB 1,CLASS=A,MSGCLASS=H,MSGLEVEL=(1,1)
//***************************************
//* THE PROGRAM IKJEFT01 IS TSO.        *
//***************************************
//* THIS JCL IS IS EXECUTING TSO        *
//*   ENVIRONMENT IN BATCH.             *
//***************************************
//* THIS STATEMENT PASSED TO THE TSO    *
//*   PROGRAM COULD BE ALL EXECUTED IN  *
//*   THE FOREGROUND FROM TSO READY.    *
//***************************************
//TSOBATCH EXEC PGM=IKJEFT01
//SYSPRINT DD SYSOUT=*
//SYSTSPRT DD DSN=&SYSUID..OUTPUT.NETRPT,DISP=SHR
//SYSTSIN  DD *
  profile nomsgid
  netstat home
  netstat byte
  netstat config
  netstat gate
  netstat route
  netstat help
  se '*** Network report is ready ***  ' u(z80843)
  se '*** Report is located in Z80843.OUTPUT(NETRPT) ***' u(Z80843)
/*
