/* REXX */
rc=isfcalls('ON')
isfsysid="s0w1"             /* Member to process */
isfdate="mmddyyyy /"        /* Date format for special variables */
currday=date("C")
currday=currday-2           /* yesterday */
isflogstartdate=date("U",currday,"C")   /* yesterday in mm/dd/yy */
isflogstarttime=time("N")   /* current time */
isflogstopdate=date("U")    /* current date in mm/dd/yy */
isflogstoptime=time("N")    /* current time */

/* isffind = 'Z#####' */
isffindlim = 9999999
isfscrolltype = 'FINDNEXT'
isflinelim = 1

do until isfnextlinetoken=''
   Address SDSF "ISFLOG READ TYPE(SYSLOG)"

   lrc=rc
   if lrc>4 then
     do
       call msgrtn
       exit 20
     end
   do ix=1 to isfline.0        /* Process the returned variables */
     call LogRecFields
     Select
      When CommandType = C then call CommandInput
      When CommandType = R then call CommandResponse
      When CommandType = I then call CommandInternal
      Otherwise nop
     End
/*   say isfline.ix */
/*   say MessageID */
   end

   /*********************************************/
   /* Continue reading SYSLOG where we left off */
   /*********************************************/
   isfstartlinetoken = isfnextlinetoken
end
rc=isfcalls("off")

exit

     /*************************************/
     /* Subroutine to list error messages */
     /*************************************/
msgrtn: procedure expose isfmsg isfmsg2.

     /************************************************/
     /* The isfmsg variable contains a short message */
     /************************************************/
if isfmsg <> "" then
  Say "isfmsg is:" isfmsg

     /****************************************************/
     /* The isfmsg2 stem contains additional descriptive */
     /* error messages                                   */
     /****************************************************/
do ix=1 to isfmsg2.0
  Say "isfmsg2."ix "is:" isfmsg2.ix
end

return

     /*************************/
     /* SYSLOG Record Layout  */
     /*************************/
LogRecFields:
RecordType    = substr(isfline.ix,1,1)
CommandType   = substr(isfline.ix,2,1)
RouteCode     = substr(isfline.ix,3,8)
SysName       = substr(isfline.ix,11,4)
JulianDate    = substr(isfline.ix,20,5)
TimeStamp     = substr(isfline.ix,26,11)
JobIdentifier = substr(isfline.ix,38,8)
MessageFlags  = substr(isfline.ix,47,8)
MessageArea   = substr(isfline.ix,57,64)
MessageID     = substr(isfline.ix,57,9)
MessageLine   = substr(isfline.ix,65,56)
return
CommandInput:
 say MessageArea
return
CommandResponse:
/* say MessageArea */
return
CommandInternal:
/* say MessageArea */
return
/*                                                    */
/Select                                               */
/*When RecordType = D then call MidDataMsg            */
/*When RecordType = E then call EndMsg                */
/*When RecordType = L then call MidLabelMsg           */
/*When RecordType = M then call BeginMsg              */
/*When RecordType = N then call SingleMsg             */
/*When RecordType = O then call OperLogCmd            */
/*When RecordType = S then call RecordContinuation    */
/*When RecordType = W then call ReplyRequired         */
/*When RecordType = X then call LogEntry              */
/*Otherwise nop                                       */
/End                                                  */
