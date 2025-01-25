/* REXX */
"free file(writekey)"
clrscn
say 'If same fruit in each window, you win'
say ' '
say 'Continue to enter until you are a winner'
call set_variables
call play
exit 0
/*------------------*/
set_variables:
fruit.1 = 'Apple '
fruit.2 = 'Orange'
fruit.3 = 'Cherry'
fruit.4 = 'Grape '
attempts = 0
return
/*----m-------------*/
play:
do forever
  clrscn
  attempts = attempts + 1
  f = random(1,4)
  view.1 = fruit.f
  f = random(1,4)
  view.2 = fruit.f
  f = random(1,4)
  view.3 = fruit.f
  say '                                         '
  say '   **********    **********    **********'
  say '   *        *    *        *    *        *'
  say '   *        *    *        *    *        *'
  say '   *' view.1' *    *' view.2' *    *' view.3' *'
  say '   *        *    *        *    *        *'
  say '   *        *    *        *    *        *'
  say '   **********    **********    **********'
  say '                                         '
  if view.1 = view.2 & view.1 = view.3
   then
    do
      say ' WINNER !!! - $1,000,000'
      say '            '
      say ' Your Winnings will be deposited in your safe deposit box'
      say '            '
      call create_safe_box_key
      call deposit_winnings_in_safe_box
    end
   else
    do
      say 'You did not win on try number ' attempts
      say ' '
      say 'Better luck next time'
      say ' '
      say 'Enter to try again or input any character to stop'
      parse pull ans
      if length(ans) = 0
        then nop
        else exit 0
    end
end
return
/*------------------*/
create_safe_box_key:
trace a
key = 02001
n.1 = 55555
n.2 = 44444
n.3 = 33333
n.4 = 22222
n.5 = 11111
n.6 = 00001
do i=1 to 6
 select
  when i = 1 then iterate
  when i = 4 then iterate
  otherwise key = key + n.i
 end
end
trace off
return
/*------------------*/
deposit_winnings_in_safe_box:
say key
say '    --------------------------------'
say '     Please enter correct 5 digit   '
say '    safe box key to deposit you key '
say '       to deposit your winnings     '
say '    --------------------------------'
say '         or end to stop and         '
say '     review the code to get the key '
say '    --------------------------------'
deposit = '$1,000,000'
parse pull input_key
if input_key = 'end'
  then exit 0
if input_key = key
  then call write_key
  else call deposit_winnings_in_safe_box
return
/*------------------*/
write_key:
k.1 = input_key
k.2 = deposit
k.3 = attempts
k.4 = fruit.f
/* "allocate dataset(p3.output($004)) file(writekey) old shr" */
"allocate dataset(*) file(writekey) reuse shr"
"execio 0 diskw writekey (open)"
"execio * diskw writekey (stem k. finis)"
exit 0
return
