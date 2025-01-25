/* REXX */
call isfcall_initialization
call allocate_output
/*----------------------------------------------*/
clrscn
say '   Utility to extract system information from current SYSLOG'
say ' '
say '   Information requested:'
say '   1. Report all occurrences of a sting'
say '   2. Report TSO logon'
say '   3. Report all occurrences of a message identifier'
say '   4. Report all occurrences of a display command '
say '   5. Report ............................'
say ' '
say '   Enter report number'
pull answer
answer = strip(answer)
Select
 When answer = 1 then call Report_1
 When answer = 2 then call Report_2
 When answer = 3 then call no_report_exists
 When answer = 4 then call no_report_exists
 When answer = 5 then call no_report_exists
 Otherwise say 'Invalid report selection'
End
no_report_exists:
say 'no report code exists for the requested utility function'
exit 0
return
/*------------------*/
/*- Begin Report 1 -*/
/*------------------*/
Report_1:
clrscn
say 'Enter the string to be found in SYSLOG'
say ' '
parse pull strng
strng = strip(strng)
if length(strng) = 0 then exit
isffind = strng
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
/*   say isfline.ix */
     datetime = substr(isfline.ix,20,17)
     msgtext = substr(isfline.ix,57,63)
     msg.1 = datetime msgtext
     "execio 1 diskw msgout (stem msg.      "
   end

/*********************************************/
/* Continue reading SYSLOG where we left off */
/*********************************************/
isfstartlinetoken = isfnextlinetoken
end
rc=isfcalls("off")
"free file(msgout)"
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
/*------------------*/
/*- End   Report 1 -*/
/*------------------*/
return
/*------------------*/
/*- Begin Report 2 -*/
/*------------------*/
Report_2:
clrscn
say ' '
say '   Information requested:'
say '   1. Report all occurrences of TSO LOGON'
say '   2. Report all occurrences of a TSO LOGON by specific ID'
say ' '
say '   Enter report number'
parse pull ltype
ltype = strip(ltype)
if length(ltype) = 0 then exit
say 'calling syslog record layout'
call syslog_record_layout
say 'returned from record layout'
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
      if substr(JobIdentifier,1,3) = 'TSU' then say JobIdentifier
/*       (substr(MessageArea,1,8) = '$HASP373')                  */
/*                                                               */
/*      then do                                                  */
/*            tsoLogonID = substr(MessageArea(10,6))             */
/*            msg.1 = JulianDate Timestamp tsoLogonID            */
/*            "execio 1 diskw msgout (stem msg. "                */
/*           end                                                 */
   end
/*********************************************/
/* Continue reading SYSLOG where we left off */
/*********************************************/
isfstartlinetoken = isfnextlinetoken
end
rc=isfcalls("off")
"free file(msgout)"
exit
/*------------------*/
/*- End   Report 2 -*/
/*------------------*/
return
/*------------------*/
/*- Begin Report 3 -*/
/*------------------*/
Report_3:
clrscn
say 'Enter the message identifier'
say ' '
parse pull msgid
if length(msgid) = 0 then exit
/*------------------*/
/*- End   Report 3 -*/
/*------------------*/
return
/*-------------*/
syslog_record_layout:
/*-------------*/
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
/*-------------*/
record_type_processing:
/*-------------*/
Select
 When RecordType = D then call MidDataMsg
 When RecordType = E then call EndMsg
 When RecordType = L then call MidLabelMsg
 When RecordType = M then call BeginMsg
 When RecordType = N then call SingleMsg
 When RecordType = O then call OperLogCmd
 When RecordType = S then call RecordContinuation
 When RecordType = W then call ReplyRequired
 When RecordType = X then call LogEntry
 Otherwise nop
return
/*-------------*/
MidDataMsg:
/*-------------*/
say 'no middle data message code here'
return
/*-------------*/
EndMsg:
/*-------------*/
say 'no end message code here'
return
/*-------------*/
MidLabelMsg:
/*-------------*/
say 'no middle of label message code here'
return
/*-------------*/
BeginMsg:
/*-------------*/
say 'no begin message code here'
return
/*-------------*/
SingleMsg:
/*-------------*/
say 'no single message code here'
return
/*-------------*/
OperLogCmd:
/*-------------*/
say 'no oper log command code here'
return
/*-------------*/
RecordContinuation:
/*-------------*/
say 'no record continuation code here'
return
/*-------------*/
ReplyRequired:
/*-------------*/
say 'no reply required code here'
return
/*-------------*/
LogEntry:
/*-------------*/
say 'no log entry code here'
return
/*-------------*/
isfcall_initialization:
/*-------------*/
rc=isfcalls('ON')
isfsysid="s0w1"
isfdate="mmddyyyy /"        /* Date format for special variables */
currday=date("C")
currday=currday-2           /* yesterday */
isflogstartdate=date("U",currday,"C")   /* yesterday in mm/dd/yy */
isflogstarttime=time("N")   /* current time */
isflogstopdate=date("U")    /* current date in mm/dd/yy */
isflogstoptime=time("N")    /* current time */
return
allocate_output:
/************************************************/
/* Allocate and open data set for report output */
/************************************************/
"allocate dataset(p3.output(#15)) file(msgout) shr reuse"
"execio 0 diskw msgout (stem msg. open"
/************************************************/
return
