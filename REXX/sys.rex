/* REXX */                                                              00010000
rc=isfcalls('ON')                                                       00020000
     /* Access the ST panel */                                          00030000
Address SDSF "ISFEXEC SYS"                                              00040000
if rc<>0 then                                                           00050000
  Exit rc                                                               00060000
     /* Get fixed field name from first word */                         00070000
     /* of isfcols special variable          */                         00080000
fixedField = word(isfcols,1)                                            00090000
Say "Number of rows returned:" isfrows                                  00100000
       /* Process all rows */                                           00110000
do ix=1 to isfrows                                                      00120000
  Say "Now processing job:" value(fixedField"."ix)                      00130000
          /* List all columns for row */                                00140000
  do jx=1 to words(isfcols)                                             00150000
    col = word(isfcols,jx)                                              00160000
    Say "  Column" col"."ix "has the value:" value(col"."ix)            00170000
  end                                                                   00180000
end                                                                     00190000
rc=isfcalls('OFF')                                                      00200000
