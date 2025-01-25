/* REXX */
arg total_moves
if total_moves = '' then Do
                          say 'number of moves not provided'
                          say 'enter number of moves'
                          pull total_moves
                         End
parse var total_moves
if total_moves > 21 then total_moves = 20
/**************************************/
/* free any previous file allocations */
/**************************************/
"FREE FI(indd)"
/**************************************/
/* allocate input and output files    */
/**************************************/
"ALLOC FI(indd)  DA('ZOS.CONTEST.PART3.INPUT(SLIDE)') SHR REUSE"
/**************************************/
/* open input and output files        */
/**************************************/
"EXECIO 0 DISKR indd  (open "
/**************************************/
/* read 1 record from input file      */
/**************************************/
"EXECIO 1 DISKR indd  (STEM irec. FINIS"
/**************************************/
/* assign variable names to each -    */
/*  field of the input record         */
/**************************************/
parse var irec.1 f11 f12 f13 f21 f22 f23 f31 f32 f33
/**************************************/
/* Load puzzle                        */
/**************************************/
f11=substr(f11,1,1)
f12=substr(f12,1,1)
f13=substr(f13,1,1)
f21=substr(f21,1,1)
f22=substr(f22,1,1)
f23=substr(f23,1,1)
f31=substr(f31,1,1)
f32=substr(f32,1,1)
f33=substr(f33,1,1)
/******************************************/
/*  Used to keep track of each move       */
/******************************************/
move.0=0
/******************************************/
/*  Store starting page/frame location    */
/******************************************/
f11.0=f11
f12.0=f12
f13.0=f13
f21.0=f21
f22.0=f22
f23.0=f23
f31.0=f31
f32.0=f32
f33.0=f33
/******************************************/
/* Index counter used to keep track of    */
/* which numbers previously occupied      */
/* a frame                                */
/******************************************/
i11 = 0
i12 = 0
i13 = 0
i21 = 0
i22 = 0
i23 = 0
i31 = 0
i32 = 0
i33 = 0
/******************************************/
/* Clear page/frame location memory array */
/******************************************/
Do i=1 to total_moves
   f11.i = 0
   f12.i = 0
   f13.i = 0
   f21.i = 0
   f22.i = 0
   f23.i = 0
   f31.i = 0
   f32.i = 0
   f33.i = 0
End
/******************************************/
/* Store current page/frame configuration */
/******************************************/
Do i=1 while i=1
   f11.i = f11.0
   f12.i = f12.0
   f13.i = f13.0
   f21.i = f21.0
   f22.i = f22.0
   f23.i = f23.0
   f31.i = f31.0
   f32.i = f32.0
   f33.i = f33.0
End
/******************************************/
/* s used to store number of moves/slides */
/******************************************/
s = 0
/******************************************/
call draw_array
/****************************************/
/* Which frame is open?                 */
/****************************************/
Select;
 when f11 = '*' then call f11_is_open
 when f12 = '*' then call f12_is_open
 when f13 = '*' then call f13_is_open
 when f21 = '*' then call f21_is_open
 when f22 = '*' then call f22_is_open
 when f23 = '*' then call f23_is_open
 when f31 = '*' then call f31_is_open
 when f32 = '*' then call f32_is_open
 when f33 = '*' then call f33_is_open
 otherwise call err_msg1
End
/****************************************/
f11_is_open:
  slide = random(1,2)
  Select;
   When slide = 1 then call f11_f12
   When slide = 2 then call f11_f21
   Otherwise err_msg3
  End
/****************************************/
f12_is_open:
  slide = random(1,3)
  Select;
   When slide = 1 then call f12_f11
   When slide = 2 then call f12_f13
   When slide = 3 then call f12_f22
   Otherwise err_msg3
  End
/************************************************************/
f13_is_open:
  slide = random(1,2)
  Select;
   When slide = 1 then call f13_f12
   When slide = 2 then call f13_f23
   Otherwise err_msg3
  End
/************************************************************/
f21_is_open:
  slide = random(1,3)
  Select;
   When slide = 1 then call f21_f11
   When slide = 2 then call f21_f22
   When slide = 3 then call f21_f31
   Otherwise err_msg3
  End
/************************************************************/
f22_is_open:
  slide = random(1,4)
  Select;
   When slide = 1 then call f22_f12
   When slide = 2 then call f22_f21
   When slide = 3 then call f22_f23
   When slide = 4 then call f22_f32
   Otherwise err_msg3
  End
/************************************************************/
f23_is_open:
  slide = random(1,3)
  Select;
   When slide = 1 then call f23_f13
   When slide = 2 then call f23_f22
   When slide = 3 then call f23_f33
   Otherwise err_msg3
  End
/************************************************************/
f31_is_open:
  slide = random(1,2)
  Select;
   When slide = 1 then call f31_f21
   When slide = 2 then call f31_f32
   Otherwise err_msg3
  End
/************************************************************/
f32_is_open:
  slide = random(1,3)
  Select;
   When slide = 1 then call f32_f22
   When slide = 2 then call f32_f31
   When slide = 3 then call f32_f33
   Otherwise err_msg3
  End
/************************************************************/
f33_is_open:
  slide = random(1,2)
  Select;
   When slide = 1 then call f33_f23
   When slide = 2 then call f33_f32
   Otherwise err_msg3
  End
/************************************************************/
f11_f12:
  move.s = f12
  i11 = i11 + 1
  f11.i11 = f12
  f11 = f12
  f12 = '*'
  call draw_array
  slide = random(1,2)
  Select;
   When slide = 1 then call f12_f13
   When slide = 2 then call f12_f22
   Otherwise err_msg3
  End
/**************************************/
f11_f21:
  move.s = f21
  i11 = i11 + 1
  f11.i11 = f21
  f11 = f21
  f21 = '*'
  call draw_array
  slide = random(1,2)
  Select;
   When slide = 1 then call f21_f22
   When slide = 2 then call f21_f31
   Otherwise err_msg3
  End
/**************************************/
f12_f11:
  move.s = f11
  i12 = i12 + 1
  f12.i12 = f11
  f12 = f11
  f11 = '*'
  call draw_array
  call f11_f21
/**************************************/
f12_f13:
  move.s = f13
  i12 = i12 + 1
  f12.i12 = f13
  f12 = f13
  f13 = '*'
  call draw_array
  call f13_f23
/**************************************/
f12_f22:
  move.s = f22
  i12 = i12 + 1
  f12.i12 = f22
  f12 = f22
  f22 = '*'
  call draw_array
  slide = random(1,3)
  Select;
   When slide = 1 then call f22_f21
   When slide = 2 then call f22_f23
   When slide = 3 then call f22_f32
   Otherwise err_msg3
  End
/**************************************/
f13_f12:
  move.s = f12
  i13 = i13 + 1
  f13.i13 = f12
  f13 = f12
  f12 = '*'
  call draw_array
  slide = random(1,2)
  Select;
   When slide = 1 then call f12_f11
   When slide = 2 then call f12_f22
   Otherwise err_msg3
  End
/**************************************/
f13_f23:
  move.s = f23
  i13 = i13 + 1
  f13.i13 = f23
  f13 = f23
  f23 = '*'
  call draw_array
  slide = random(1,2)
  Select;
   When slide = 1 then call f23_f22
   When slide = 2 then call f23_f33
   Otherwise err_msg3
  End
/**************************************/
f21_f22:
  move.s = f22
  i21 = i21 + 1
  f21.i21 = f22
  f21 = f22
  f22 = '*'
  call draw_array
  slide = random(1,3)
  Select;
   When slide = 1 then call f22_f12
   When slide = 2 then call f22_f23
   When slide = 3 then call f22_f32
   Otherwise err_msg3
  End
/**************************************/
f21_f31:
  move.s = f31
  i21 = i21 + 1
  f21.i21 = f31
  f21 = f31
  f31 = '*'
  call draw_array
  call f31_f32
/**************************************/
f21_f11:
  move.s = f11
  i21 = i21 + 1
  f21.i21 = f11
  f21 = f11
  f11 = '*'
  call draw_array
  call f11_f12
/**************************************/
f22_f21:
  move.s = f21
  i22 = i22 + 1
  f22.i22 = f21
  f22 = f21
  f21 = '*'
  call draw_array
  slide = random(1,2)
  Select;
   When slide = 1 then call f21_f11
   When slide = 2 then call f21_f31
   Otherwise err_msg3
  End
/**************************************/
f22_f23:
  move.s = f23
  i22 = i22 + 1
  f22.i22 = f23
  f22 = f23
  f23 = '*'
  call draw_array
  slide = random(1,2)
  Select;
   When slide = 1 then call f23_f13
   When slide = 2 then call f23_f33
   Otherwise err_msg3
  End
/**************************************/
f22_f32:
  move.s = f32
  i22 = i22 + 1
  f22.i22 = f32
  f22 = f32
  f32 = '*'
  call draw_array
  slide = random(1,2)
  Select;
   When slide = 1 then call f32_f31
   When slide = 2 then call f32_f33
   Otherwise err_msg3
  End
/**************************************/
f22_f12:
  move.s = f12
  i22 = i22 + 1
  f22.i22 = f12
  f22 = f12
  f12 = '*'
  call draw_array
  slide = random(1,2)
  Select;
   When slide = 1 then call f12_f11
   When slide = 2 then call f12_f13
   Otherwise err_msg3
  End
/**************************************/
f23_f22:
  move.s = f22
  i23 = i23 + 1
  f23.i23 = f22
  f23 = f22
  f22 = '*'
  call draw_array
  slide = random(1,3)
  Select;
   When slide = 1 then call f22_f12
   When slide = 2 then call f22_f21
   When slide = 3 then call f22_f32
   Otherwise err_msg3
  End
/**************************************/
f23_f33:
  move.s = f33
  i23 = i23 + 1
  f23.i23 = f33
  f23 = f33
  f33 = '*'
  call draw_array
  /*  call solved? */
  call f33_f32
  End
/**************************************/
f23_f13:
  move.s = f13
  i23 = i23 + 1
  f23.i23 = f13
  f23 = f13
  f13 = '*'
  call draw_array
  call f13_f12
/**************************************/
f31_f32:
  move.s = f32
  i31 = i31 + 1
  f31.i31 = f32
  f31 = f32
  f32 = '*'
  call draw_array
  slide = random(1,2)
  Select;
   When slide = 1 then call f32_f33
   When slide = 2 then call f32_f22
   Otherwise err_msg3
  End
/**************************************/
f31_f21:
  move.s = f21
  i31 = i31 + 1
  f31.i31 = f21
  f31 = f21
  f21 = '*'
  call draw_array
  slide = random(1,2)
  Select;
   When slide = 1 then call f21_f11
   When slide = 2 then call f21_f22
   Otherwise err_msg3
  End
/**************************************/
f32_f31:
  move.s = f31
  i32 = i32 + 1
  f32.i32 = f31
  f32 = f31
  f31 = '*'
  call draw_array
  call f31_f21
/**************************************/
f32_f22:
  move.s = f22
  i32 = i32 + 1
  f32.i32 = f22
  f32 = f22
  f22 = '*'
  call draw_array
  slide = random(1,3)
  Select;
   When slide = 1 then call f22_f21
   When slide = 2 then call f22_f12
   When slide = 3 then call f22_f23
   Otherwise err_msg3
  End
/**************************************/
f32_f33:
  move.s = f33
  i32 = i32 + 1
  f32.i32 = f33
  f32 = f33
  f33 = '*'
  call draw_array
  /* call solved? */
  call f33_f23
/**************************************/
f33_f32:
  move.s = f32
  i33 = i33 + 1
  f33.i33 = f32
  f33 = f32
  f32 = '*'
  call draw_array
  slide = random(1,2)
  Select;
   When slide = 1 then call f32_f31
   When slide = 2 then call f32_f22
   Otherwise err_msg3
  End
/**************************************/
f33_f23:
  move.s = f23
  i33 = i33 + 1
  f33.i33 = f23
  f33 = f23
  f23 = '*'
  call draw_array
  slide = random(1,2)
  Select;
   When slide = 1 then call f23_f22
   When slide = 2 then call f23_f13
   Otherwise err_msg3
  End
/**************************************/
draw_array:
 say 'slide number' s
 say 'number' move.s 'was moved'
 say '-------------'
 say '| 'f11' | 'f12' | 'f13' |'
 say '-------------'
 say '| 'f21' | 'f22' | 'f23' |'
 say '-------------'
 say '| 'f31' | 'f32' | 'f33' |'
 say '-------------'
 say
 s = s + 1
/**************************************/
 if s = total_moves then call report_moves
 if s = total_moves then call done
return
/**************************************/
report_moves:
Do i=1 to total_moves
 if 'MOVE' /= substr(move.i,1,4) then
     say 'move' i 'was' move.i
End
Do i=1 to total_moves
 if f11.i /= 0 then
 say 'value of f11.'i' is ' f11.i
End
Do i=1 to total_moves
 if f11.i /= 0 then
 say 'value of f12.'i' is ' f12.i
End
Do i=1 to total_moves
 if f11.i /= 0 then
 say 'value of f13.'i' is ' f13.i
End
Do i=1 to total_moves
 if f11.i /= 0 then
 say 'value of f21.'i' is ' f21.i
End
Do i=1 to total_moves
 if f11.i /= 0 then
 say 'value of f22.'i' is ' f22.i
End
Do i=1 to total_moves
 if f11.i /= 0 then
 say 'value of f23.'i' is ' f23.i
End
Do i=1 to total_moves
 if f11.i /= 0 then
 say 'value of f31.'i' is ' f31.i
End
Do i=1 to total_moves
 if f11.i /= 0 then
 say 'value of f32.'i' is ' f32.i
End
Do i=1 to total_moves
 if f11.i /= 0 then
 say 'value of f33.'i' is ' f33.i
End
return
/**************************************/
err_msg1:
  Say 'no open square available'
/**************************************/
err_msg2:
  Say 'msg2'
/**************************************/
err_msg3:
  Say 'msg3'
/**************************************/
done:
 say '*********************'
 say '* That''s All Folks  *'
 say '*********************'
EXIT 0
