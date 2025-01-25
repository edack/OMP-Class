/* REXX */
"FREE FI(outdd)"
 outdsn = SYSVAR(SYSUID)'.PART3.OUTPUT(STAMP)'
"ALLOC FI(OUTDD) DS('"outdsn"') SHR REUSE"
"EXECIO 0 DISKW outdd (OPEN "
/****************************************************/
d.1 = '  '   date() time() '     ' userid() '    '
d.2 = 'This was written by R5 REXX routine'
"EXECIO * DISKW outdd (stem d.      "
EXIT 0
