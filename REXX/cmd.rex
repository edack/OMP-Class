/* REXX */                                                              00010000
rc=isfcalls('ON')                                                       00020000
cmd1 = 'D TS,'||userid()                                                00041001
  mycmd.0=2                                                             00050001
  mycmd.1="D T"                                                         00060001
  mycmd.2=cmd1                                                          00070001
Address SDSF ISFSLASH "("mycmd.") (WAIT)"                               00110001
rc=isfcalls('OFF')                                                      00150001
