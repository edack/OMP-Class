//DELVSAM   JOB 1,NOTIFY=&SYSUID
//S1   EXEC PGM=IDCAMS
//SYSPRINT  DD SYSOUT=*
//SYSIN     DD *,SYMBOLS=CNVTSYS
  DELETE &SYSUID..VSAM.PRESIDNT
/*
