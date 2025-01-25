/* rexx */
/* In R3     we are going to do some file I/O. Instead of writing   */
/* 'hello world' to the screen we are going to use TSO commands to  */
/* write our message to a data set for later processing.            */
/*                                                                  */
/* TSO/E Rexx Reference:                                            */
/*        http://publibz.boulder.ibm.com/epubs/pdf/ikj4a370.pdf     */
/*                                                                  */

message = 'hello world - my rexx routine wrote this line'
call write_hello_world
exit

write_hello_world: procedure expose message

"FREE FI(OUTDD)"
 outdsn = SYSVAR(SYSUID)'.PART3.OUTPUT(HELLO)'
"ALLOC FI(OUTDD) DS('"outdsn"') SHR REUSE"
 push message
"EXECIO 1 DISKW OUTDD"
"EXECIO 0 DISKR OUTDD (FINIS"

return
