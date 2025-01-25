/* REXX */                                                              00010000
rc=isfcalls('ON')                                                       00020000
/* Access SDSF panel */                                                 00030002
/* Address SDSF "ISFEXEC DA" */                                         00040003
Address SDSF "ISFEXEC LNK"                                              00041003
if rc<>0 then                                                           00050000
  Exit rc                                                               00060000
/* Get fixed field name from first word */                              00070002
/* of isfcols special variable          */                              00080002
fixedField = word(isfcols,1)                                            00090000
Say "Number of rows returned:" isfrows                                  00100000
/* Process all rows */                                                  00110002
do ix=1 to isfrows                                                      00120000
  Say "Now processing job:" value(fixedField"."ix)                      00130000
/* List all columns for row */                                          00140002
 do jx=1 to words(isfcols)                                              00150002
     col = word(isfcols,jx)                                             00160002
     Say "  Column" col"."ix "has the value:" value(col"."ix)           00170002
 end                                                                    00180002
end                                                                     00190000
rc=isfcalls('OFF')                                                      00200000
