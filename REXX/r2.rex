/* rexx */
/* Now we are going to wrap the previous exec in a function and pass */
/* our 'hello world' message to the say_hello_world procedure.       */
/*                                                                   */
/* TSO/E Rexx Reference:                                             */
/*        http://publibz.boulder.ibm.com/epubs/pdf/ikj4a370.pdf      */
/*                                                                   */

message = 'hello world'
call say_hello_world
exit

/* either of the following functions will produce the desired result */

say_hello_world: procedure expose message /* <--- more correct */
say message
return

say_hello_world: procedure /* <--- also valid */
arg message
say message
return

say_hello_world: /* <--- also valid */
say message
return
