/* REXX */
"ALLOC DA(*) f(outdd) SHR REUSE"
"EXECIO 0 DISKW outdd (OPEN "
/*
"FREE FI(outdd)"
 outdsn = SYSVAR(SYSUID)'.PART3.OUTPUT(RXVARS)'
"ALLOC FI(OUTDD) DS('"outdsn"') SHR REUSE"
*/
/****************************************************/
user = userid()
d.1 ='  '   date() time() '     ' userid() '    '
d.2 ='Your userid =..................' user
d.3 ='The system date =..............' date()
d.4 ='The system time = .............' time()
d.5 ='System OS   = .................' MVSVAR('SYSOPSYS')
d.6 ='System MVS level = ............' MVSVAR('SYSMVS')
d.7 ='System name = .................' MVSVAR('SYSNAME')
d.8 ='System sysplex name = .........' MVSVAR('SYSPLEX')
d.9 ='System Data Facility level =...' MVSVAR('SYSDFP')
d.10 ='Value of SYSJES =..............' SYSVAR('SYSJES')
d.11 ='Value of SYSPREF =.............' SYSVAR('SYSPREF')
d.12 ='Value of SYSPROC =.............' SYSVAR('SYSPROC')
d.13 ='Value of SYSUID =..............' SYSVAR('SYSUID')
d.14 ='Value of SYSLTERM =............' SYSVAR('SYSLTERM')
d.15 ='Value of SYSWTERM =............' SYSVAR('SYSWTERM')
d.16 ='Value of SYSTERMID =...........' SYSVAR('SYSTERMID')
d.17 ='Value of SYSENV =..............' SYSVAR('SYSENV')
d.18 ='Value of SYSICMD =.............' SYSVAR('SYSICMD')
d.19 ='Value of SYSISPF =.............' SYSVAR('SYSISPF')
d.20 ='Value of SYSNEST =.............' SYSVAR('SYSNEST')
d.21 ='Value of SYSPCMD =.............' SYSVAR('SYSPCMD')
d.22 ='Value of SYSSCMD =.............' SYSVAR('SYSSCMD')
d.23 ='Value of SYSCPU =..............' SYSVAR('SYSCPU')
d.24 ='Value of SYSHSM =..............' SYSVAR('SYSHSM')
d.25 ='Value of SYSNODE =.............' SYSVAR('SYSNODE')
d.26 ='Value of SYSLRACF =............' SYSVAR('SYSLRACF')
d.27 ='Value of SYSRACF =.............' SYSVAR('SYSRACF')
d.28 ='Value of SYSSRV =..............' SYSVAR('SYSSRV')
d.29 ='Value of SYSTSOE =.............' SYSVAR('SYSTSOE')
d.30 ='Value of SOLDISP =.............' SYSVAR('SOLDISP')
d.31 ='Value of UNSDISP =.............' SYSVAR('UNSDISP')
d.32 ='Value of SOLNUM  =.............' SYSVAR('SOLNUM')
d.33 ='Value of UNSNUM  =.............' SYSVAR('UNSNUM')
d.34 ='Value of MFTIME =..............' SYSVAR('MFTIME')
d.35 ='Value of MFJOB =...............' SYSVAR('MFJOB')
d.36 ='Value of MFOSNM =..............' SYSVAR('MFOSNM')
d.37 ='Value of MFSNMJBX =............' SYSVAR('MFSNMJBX')
"EXECIO * DISKW outdd (stem d.      "
Exit 0
