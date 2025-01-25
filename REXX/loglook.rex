/* REXX */
/************************************************/
/* Allocate and open data set for report output */
/************************************************/
"allocate dataset(p3.output(#14)) file(msgout) shr reuse"
"execio 0 diskw msgout (stem msg. open"
/************************************************/
rc=isfcalls('ON')
isfsysid="sys1"
isfdate="mmddyyyy /"        /* Date format for special variables */
currday=date("C")
currday=currday-2           /* yesterday */
isflogstartdate=date("U",currday,"C")   /* yesterday in mm/dd/yy */
isflogstarttime=time("N")   /* current time */
isflogstopdate=date("U")    /* current date in mm/dd/yy */
isflogstoptime=time("N")    /* current time */

isffind = 'string'
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

return
