//UNEMJ JOB 1,NOTIFY=&SYSUID
//***************************************************/
//*
//* Description: deletes and create a KSDS File
//*              called UNKVSAM, compiles and
//*              runs a COBOL program that processes
//*              CSV records containing data on
//*              unemployment claims of the state
//*              of Missouri and writes them into
//*              the VSAM file.
//*
//***************************************************/
//S1   EXEC PGM=IDCAMS
//SYSPRINT  DD SYSOUT=*
//* SYSIN     DD *,SYMBOLS=CNVTSYS
//SYSIN     DD *
  DELETE Z80843.UNKVSAM
  SET MAXCC=0
  DEFINE CLUSTER ( NAME ( Z80843.UNKVSAM ) -
            VOLUME(VPWRKB) TRACKS(15) RECORDSIZE(283,283) -
            INDEXED KEYS(8 0) -
            REUSE SHAREOPTIONS(2) SPANNED SPEED -
            CONTROLINTERVALSIZE(4096) )
//***************************************************/
//COBRUN  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=&SYSUID..CBL(UNEM),DISP=SHR
//SYSLIB       DD DSN=&SYSUID..CPY(UNEMC),DISP=SHR
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(UNEM),DISP=SHR
//***************************************************/
// IF RC = 0 THEN
//***************************************************/
//RUN     EXEC PGM=UNEM
//STEPLIB   DD DSN=&SYSUID..LOAD,DISP=SHR
//***************************************************/
//*                   CSV Files
//***************************************************/
//CSVGEN    DD DSN=&SYSUID..UNEM.DATA(SEX),DISP=SHR
//CSVAGE    DD DSN=&SYSUID..UNEM.DATA(AGE),DISP=SHR
//CSVETH    DD DSN=&SYSUID..UNEM.DATA(ETHNIC),DISP=SHR
//CSVIND    DD DSN=&SYSUID..UNEM.DATA(INDUS),DISP=SHR
//CSVRAC    DD DSN=&SYSUID..UNEM.DATA(RACE),DISP=SHR
//UNDD      DD DSN=&SYSUID..UNKVSAM,DISP=SHR
//SYSOUT    DD SYSOUT=*,OUTLIM=30000
//CEEDUMP   DD DUMMY
//SYSUDUMP  DD DUMMY
//***************************************************/
// ELSE
// ENDIF
