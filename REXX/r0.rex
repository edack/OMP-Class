/* REXX */
Numeric digits 10
Parse Upper Arg specific_names .
initiators=0
names.=""
names.0=0
Call get_list_of_names
Call sort
Call show_results
Exit
/*-------------------------------------------------------------------*/
get_list_of_names:
Procedure Expose names. initiators specific_names
cvt=ptr(16)                            /* Get CVT                    */
asvt=ptr(cvt+556)+512                  /* Get asvt                   */
asvtmaxu=ptr(asvt+4)                   /* Get max asvt entries       */
Do a = 0 to asvtmaxu - 1
  ascb=stg(asvt+16+a*4,4)              /* Get ptr to ascb (Skip
                                          master)                    */
  If bitand(ascb,'80000000'x) = '00000000'x Then /* If in use        */
    Do
      ascb=c2d(ascb)                   /* Get ascb address           */
      cscb=ptr(ascb+56)                /* Get CSCB address           */
      chtrkid=stg(cscb+28,1)           /* Check addr space type      */
      ascbjbns=ptr(ascb+176)           /* Get ascbjbns               */
      ascbjbni=ptr(ascb+172)           /* Get ascbjbni               */
      If chtrkid='01'x Then            /* If tso user                */
        If stg(ascbjbns,1)>='4a'x & stg(ascbjbns,1)<='Z' Then
          Call add 'TSO',stg(ascbjbns,8) /* Print tso user           */
      If chtrkid='02'x Then            /* If tso user                */
        Call add 'STC',stg(ascbjbns,8) /* Print started task         */
      If chtrkid='03'x Then            /* If tso user                */
        Do
          If stg(ascbjbns,8) ='INIT    ' Then
            initiators=initiators+1    /* Bump initiator count       */
          If ascbjbni<>0 Then
            Call add 'Job',stg(ascbjbni,8)
        End
      If chtrkid='04'x Then            /* If tso user                */
        Call add 'System',stg(ascbjbns,8)/* Print system address
                                          space                      */
    End
End
Return
/*-------------------------------------------------------------------*/
ptr:
Return c2d(storage(d2x(Arg(1)),4))     /* Return a pointer           */
/*-------------------------------------------------------------------*/
stg:
Return storage(d2x(Arg(1)),Arg(2))     /* Return storage             */
/*-------------------------------------------------------------------*/
add:
Procedure Expose names. specific_names
If specific_names="",
  | 0<pos(specific_names,translate(Arg(1) Arg(2))) Then
  Do
    names.0=names.0+1
    n=names.0
    names.n=left(Arg(1),8)||Arg(2)
  End
Return
/*-------------------------------------------------------------------*/
sort:
Procedure Expose names.                /* Just a bubble sort. Dumb but
                                          adequate                   */
n=names.0
Do i= 1 to n-1
  Do j=i+1 to n
    If names.i>names.j Then
      Do
        t=names.i
        names.i=names.j
        names.j=t
      End
  End
End
Return
/*-------------------------------------------------------------------*/
show_results:
Procedure Expose names. initiators
Do n = 1 to names.0
  Say names.n
End
Say 'Initiators: 'initiators
Return
