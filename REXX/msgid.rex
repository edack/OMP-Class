/* REXX */
/************************************************/
say 'enter message id'
parse pull msgid
msgid = translate(strip(msgid))
msglen = length(msgid)
rc=isfcalls('ON')
/*******************************************************************/
/*** Default log search is current day only                      ***/
/*** Code below enables log search for multiple days             ***/
/*******************************************************************/
/*                                                                 */
isfdate="mmddyyyy /"  /*Date format for special variables*/
currday=date("C")
currday=currday-2     /*yesterday */
isflogstartdate=date("U",currday,"C") /*yesterday in mm/dd/yy*/
isflogstarttime=time("N") /*current time*/
isflogstopdate=date("U")  /*current date in mm/dd/yy*/
isflogstoptime=time("N")  /*current time*/
/*                                                                 */
/*******************************************************************/
get_next_part = 'no'
do until isfnextlinetoken=''
   Address SDSF "ISFLOG READ TYPE(SYSLOG)"
   do ix=1 to isfline.0
     call LogRecFields
     if substr(MessageArea,1,msglen) = msgid then
       do
         say '==================='
         say ' '
         say '==================='
         say JulianDate TimeStamp
         say MessageLine
         ix = ix + 1
          do until substr(isfline.ix,1,1) /= 'D'
            say substr(isfline.ix,59,60)
            ix = ix + 1
          end
       end
   end
isfstartlinetoken = isfnextlinetoken
end
rc=isfcalls("off")
exit
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
MessageLine   = substr(isfline.ix,65,56)
return
