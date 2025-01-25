/* REXX */
/************************************************/
r = 0
rc=isfcalls('ON')
do until isfnextlinetoken=''
   Address SDSF "ISFLOG READ TYPE(SYSLOG)"
   do ix=1 to isfline.0
     call LogRecFields
     if MessageID8 = '$HASP373' then
       if substr(JobIdentifier,1,3) = 'TSU'
         then call write_record
   end
isfstartlinetoken = isfnextlinetoken
end
rc=isfcalls("off")
say 'number of tso logons are ' r
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
MessageID8    = substr(isfline.ix,57,8)
MessageID9    = substr(isfline.ix,57,9)
MessageLine   = substr(isfline.ix,65,56)
return
write_record:
logon_id = substr(MessageLine,2,7)
r = r + 1
say JulianDate TimeStamp logon_id
return
