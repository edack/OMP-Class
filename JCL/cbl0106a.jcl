//CBL0106A JOB 1,NOTIFY=&SYSUID
//***************************************************/
// SET CBLPGM=CBL0106A
//COBRUN  EXEC IGYWCL
//COBOL.SYSLIB DD DSN=&SYSUID..COPYLIB,DISP=SHR
//COBOL.SYSIN  DD DSN=&SYSUID..CBL(&CBLPGM),DISP=SHR
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(&CBLPGM),DISP=SHR
//***************************************************/
// IF RC = 0 THEN
//***************************************************/
//RUN     EXEC PGM=&CBLPGM
//STEPLIB   DD DSN=&SYSUID..LOAD,DISP=SHR
//ACCTFILE   DD DSN=&SYSUID..DATA.ACCTFILE,DISP=SHR
//PRTFILE   DD SYSOUT=*,OUTLIM=15000
//SYSOUT    DD SYSOUT=*,OUTLIM=15000
//CEEDUMP   DD DUMMY
//SYSUDUMP  DD DUMMY
//***************************************************/
// ELSE
// ENDIF
