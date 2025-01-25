/* REXX */
/**************************************/
/* free any previous file allocations */
/**************************************/
"FREE FI(indd)"
/**************************************/
/* allocate input and output files    */
/**************************************/
"ALLOC FI(indd)  DA('ZOS.CONTEST.PART3.INPUT(NUMBERS)') SHR REUSE"
/**************************************/
/* open input and output files        */
/**************************************/
"EXECIO 0 DISKR indd  (open "
/**************************************/
/* read 1 record from input file      */
/**************************************/
"EXECIO * DISKR indd  (STEM record. FINIS"
say
say
say
say
say
say
say
say
say
say
say
say record.0 'records read from input data set'
say
say '         'record.1
say '         'record.2
say '         'record.3
/****************************************/
/* assign fields to row of input record */
/****************************************/
Do i=1 to record.0
 parse var record.i v1 v2 v3
 array.i.c1 = substr(v1,1,1)
 array.i.c2 = substr(v2,1,1)
 array.i.c3 = substr(v3,1,1)
End
col1 = 0
col2 = 0
col3 = 0
Do i=1 to 3
   col1 = col1 + array.i.c1
   col2 = col2 + array.i.c2
   col3 = col3 + array.i.c3
End
 say col1' is sum of column 1'
 say col2' is sum of column 2'
 say col3' is sum of column 3'
 say 'can you add all the numbers in the array?'
EXIT 0
