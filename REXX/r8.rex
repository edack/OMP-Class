/* REXX */
/**************************************/
/* free any previous file allocations */
/**************************************/
"FREE FI(indd)"
/**************************************/
/* allocate input and output files    */
/**************************************/
"ALLOC FI(indd)  DA('ZOS.CONTEST.PART3.INPUT(DATA)') SHR REUSE"
/**************************************/
/* open input and output files        */
/**************************************/
"EXECIO 0 DISKR indd  (open "
/**************************************/
/* read records from input file       */
/**************************************/
"EXECIO * DISKR indd  (STEM record. FINIS"
say 'Number of input records is' record.0
LastRec = record.0
/***************************************/
/* name columns of input record        */
/***************************************/
Do i=1 to LastRec
 num = i
 FirstYr    = substr(record.i,1,4)
 LastYr     = substr(record.i,6,4)
 LastName   = substr(record.i,15,15)
 FirstName  = substr(record.i,30,15)
 BirthCity  = substr(record.i,45,20)
 BirthState = substr(record.i,65,15)
 If LastName = 'Adams' | LastName = 'Harrison' ,
  | LastName = 'Bush'  | LastName = 'Roosevelt' then call report
End
EXIT 0
report:
 say '====================================='
 say '==== US President #'num '==============='
 say '====================================='
 say ' 'FirstName LastName
 say '   Years in office:'
 say '  ' FirstYr LastYr
 say '   Birth City and State:'
 say '  ' BirthCity BirthState
 say
return
