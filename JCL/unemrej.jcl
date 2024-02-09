//UNEMREAD JOB 1,NOTIFY=&SYSUID
//***************************************************/
//*
//* Description: compiles and runs two COBOL programs:
//*              a main program that processes queries,
//*              and a subprogram that retrieves data
//*              contained in a KSDS VSAM file called
//*              'UNKVSAM'.
//*
//***************************************************/
//COBRUN  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=&SYSUID..CBL(UNEMREAD),DISP=SHR
//SYSLIB       DD DSN=&SYSUID..COPYLIB(UNEMT),DISP=SHR
//LKED.SYSLMOD  DD DSN=&SYSUID..LOAD(UNEMREAD),DISP=SHR
//***************************************************/
//COBRUN  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=&SYSUID..CBL(UNEMQUE),DISP=SHR
//COBOL.SYSLIB DD DSN=&SYSUID..COPYLIB,DISP=SHR
//*SYSLIB       DD DSN=&SYSUID..COPYLIB(UNEMC),DISP=SHR
//*             DD DSN=&SYSUID..COPYLIB(UNEMT),DISP=SHR
//*             DD DSN=&SYSUID..COPYLIB(UNEMFORM),DISP=SHR
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(UNEMQUE),DISP=SHR
//LKED.SYSLIB  DD DSNAME=CEE.SCEELKED,DISP=SHR
//             DD DSNAME=CEE.SCEELKEX,DISP=SHR
//             DD DSNAME=&SYSUID..LOAD,DISP=SHR
//LKED.SYSIN DD *
  INCLUDE SYSLIB(UNEMREAD)
/*
//***************************************************/
// IF RC = 0 THEN
//***************************************************/
//RUN     EXEC PGM=UNEMQUE
//STEPLIB   DD DSN=&SYSUID..LOAD,DISP=SHR
//INDD      DD DSN=&SYSUID..UNEM.DATA(INUNQ),DISP=SHR
//UNDD      DD DSN=&SYSUID..UNKVSAM,DISP=SHR
//OUTDD     DD SYSOUT=*,OUTLIM=15000
//PRTLINE   DD SYSOUT=*,OUTLIM=300000
//SYSOUT    DD SYSOUT=*,OUTLIM=15000
//CEEDUMP   DD DUMMY
//SYSUDUMP  DD DUMMY
//***************************************************/
// ELSE
// ENDIF
