/* rexx */
say 'Hello ' userid()
say 'System Date is ' date()
say 'System Time is ' time()
/* ---------------- */
"allocate dataset(p3.output(#01)) file(msgout) shr reuse"
"execio 0 diskw msgout (stem msg. open"
/* ---------------- */
msg.1 = userid()
msg.2 = date()
msg.3 = time()
/* ---------------- */
/* u = userid()     */
/* d = date()       */
/* t = time()       */
/* msg.1 = u d t    */
/* ---------------- */
"execio * diskw msgout (stem msg. finis"
"free file(msgout)"
exit 0
