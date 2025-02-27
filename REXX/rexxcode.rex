/* REXX */
clrscn
say '   Unsung hero of computer languages                              '
say '                                                                  '
say '   Loved by many IBM Z mainframers for decades as a result of     '
say '   all the environment application interfaces and functions.      '
say '                                                                  '
say '   A swiss army knife of programmer languages in z/OS environment.'
say '                                                                  '
say '   A great fit-for-purpose language for z/OS system programming   '
say '   and administration functions.                                  '
say '                                                                  '
say '   https://en.wikipedia.org/wiki/Rexx                             '
say ' '
say ' '
say ' '
say ' '
say '    enter to continue'
pull
newlist:
clrscn
say '   Select an option:'
say ' '
say '   1. List all REXX keywords'
say '   2. List all REXX built-in functions'
say '   3. List all REXX built-in SYSVAR functions'
say '   4. List all REXX built-in MVSVAR functions'
say '   5. List all TSO/E REXX commands'
say '   6. How to execute REXX from TSO/ISPF session'
say '   7. How to execute REXX using JCL'
say '   8. Quit'
say ' '
say '   Enter report number'
pull answer
answer = strip(answer)
Select
 When answer = 1 then call Keywords
 When answer = 2 then call Functions
 When answer = 3 then call SYSVARS
 When answer = 4 then call MVSVARS
 When answer = 5 then call TSOE
 When answer = 6 then call EXREXX
 When answer = 7 then call SUBREXX
 When answer = 8 then exit 0
 Otherwise exit 0
End
Keywords:
clrscn
say 'List of REXX keyword instructions'
say '----------------------------------'
say ' '
say 'ADDRESS  '
say 'ARG      '
say 'CALL     '
say 'DO       '
say 'DROP     '
say 'EXIT     '
say 'IF       '
say 'INTERPRET'
say 'ITERATE  '
say 'LEAVE    '
say 'NOP      '
say 'NUMERIC  '
say 'OPTIONS  '
say 'PARSE    '
say 'PROCEDURE'
say 'PULL     '
say 'PUSH     '
say 'QUEUE    '
say 'RETURN   '
say 'SAY      '
say 'SELECT   '
say 'SIGNAL   '
say 'TRACE    '
say 'UPPER    '
say '         '
say '------------------------------------------'
say 'Keyword instruction details are located at'
say '------------------------------------------'
say 'https://www.ibm.com/docs/en/zos/3.1.0?topic=reference-keyword-instructions'
say '         '
say '         '
say '         '
say '    enter to continue'
pull
call newlist
Functions:
clrscn
say 'List the REXX Built-in functions'
say '--------------------------------'
say ' '
say 'ABBREV (Abbreviation)                       '
say 'ABS (Absolute Value)                        '
say 'ADDRESS                                     '
say 'ARG (Argument)                              '
say 'BITAND (Bit by Bit AND)                     '
say 'BITOR (Bit by Bit OR)                       '
say 'BITXOR (Bit by Bit Exclusive OR)            '
say 'B2X (Binary to Hexadecimal)                 '
say 'CENTER/CENTRE                               '
say 'COMPARE                                     '
say 'CONDITION                                   '
say 'COPIES                                      '
say 'C2D (Character to Decimal)                  '
say 'C2X (Character to Hexadecimal)              '
say 'DATATYPE                                    '
say 'DATE                                        '
say 'DBCS (double-byte character set functions)  '
say 'DELSTR (Delete String)                      '
say 'DELWORD (Delete Word)                       '
say 'DIGITS                                      '
say 'D2C (Decimal to Character)                  '
say 'D2X (Decimal to Hexadecimal)                '
say 'ERRORTEXT                                   '
say 'EXTERNALS                                   '
say 'FIND                                        '
say 'FORM                                        '
say 'FORMAT                                      '
say 'FUZZ                                        '
say 'GETMSG                                      '
say 'INDEX                                       '
say 'INSERT                                      '
say 'JUSTIFY                                     '
say 'LASTPOS (Last Position)                     '
say 'LEFT                                        '
say 'LENGTH                                      '
say 'LINESIZE                                    '
say 'LISTDSI                                     '
say 'MAX (Maximum)                               '
say 'MIN (Minimum)                               '
say 'MSG                                         '
say 'MVSVAR                                      '
say 'OUTTRAP                                     '
say 'OVERLAY                                     '
say 'POS (Position)                              '
say 'PROMPT                                      '
say 'QUEUED                                      '
say 'RANDOM                                      '
say 'REVERSE                                     '
say 'RIGHT                                       '
say 'SETLANG                                     '
say 'SIGN                                        '
say 'SOURCELINE                                  '
say 'SPACE                                       '
say 'STORAGE                                     '
say 'SUBSTR (Substring)                          '
say 'SUBWORD                                     '
say 'SYMBOL                                      '
say 'SYSCPUS                                     '
say 'SYSDSN                                      '
say 'SYSVAR                                      '
say 'TIME                                        '
say 'TRACE                                       '
say 'TRANSLATE                                   '
say 'TRUNC (Truncate)                            '
say 'USERID                                      '
say 'UPPER                                       '
say 'VALUE                                       '
say 'VERIFY                                      '
say 'WORD                                        '
say 'WORDINDEX                                   '
say 'WORDLENGTH                                  '
say 'WORDPOS (Word Position)                     '
say 'WORDS                                       '
say 'XRANGE (Hexadecimal Range)                  '
say 'X2B (Hexadecimal to Binary)                 '
say 'X2C (Hexadecimal to Character)              '
say 'X2D (Hexadecimal to Decimal)                '
say ' '
say 'Built-in function DETAILS are located at'
say '------------------------------------------'
say 'https://www.ibm.com/docs/en/zos/3.1.0?topic=functions-built-in'
say ' '
say ' '
say ' '
say '  enter to continue'
pull
call newlist
say ' '
SYSVARS:
clrscn
say 'List the REXX Built-in SYSVAR values'
say '------------------------------------'
say ' '
say 'SYSPREF   '
say 'SYSPROC   '
say 'SYSUID    '
say 'SYSLTERM  '
say 'SYSWTERM  '
say 'SYSENV    '
say 'SYSICMD   '
say 'SYSISPF   '
say 'SYSNEST   '
say 'SYSPCMD   '
say 'SYSSCMD   '
say 'SYSCPU    '
say 'SYSHSM    '
say 'SYSJES    '
say 'SYSLRACF  '
say 'SYSNODE   '
say 'SYSRACF   '
say 'SYSSRV    '
say 'SYSTERMID '
say 'SYSTSOE   '
say 'SYSDTERM  '
say 'SYSKTERM  '
say 'SYSPLANG  '
say 'SYSSLANG  '
say ' '
say 'Built-in SYSVAR function DETAILS are located at'
say '-----------------------------------------------'
say 'https://www.ibm.com/docs/en/zos/3.1.0?topic=tef-sysvar'
say ' '
say ' '
say ' '
say '  enter to continue'
pull
call newlist
MVSVARS:
clrscn
say '                        '
say 'List the REXX Built-in MVSVAR values'
say '------------------------------------'
say '                        '
say 'SYSAPPCLU               '
say 'SYSDFP                  '
say 'SYSMVS                  '
say 'SYSNAME                 '
say 'SYSOPSYS                '
say 'SYSOSSEQ                '
say 'SYSSECLAB               '
say 'SYSSMFID                '
say 'SYSSMS                  '
say 'SYSCLONE                '
say 'SYSPLEX                 '
say 'SYMDEF,symbolic-name    '
say '                        '
say '-----------------------------------------------'
say 'Built-in MVSVAR function DETAILS are located at'
say '-----------------------------------------------'
say 'https://www.ibm.com/docs/en/zos/3.1.0?topic=tef-mvsvar'
say '                        '
say '                        '
say '                        '
say '    enter to continue'
pull
call newlist
TSOE:
clrscn
say 'List the REXX TSO/E commands'
say '----------------------------'
say '                        '
say 'DELSTACK                '
say 'DROPBUF                 '
say 'EXECIO                  '
say 'EXECUTIL                '
say 'HE                      '
say 'HI                      '
say 'HT                      '
say 'Immediate Commands      '
say 'MAKEBUF                 '
say 'NEWSTACK                '
say 'QBUF                    '
say 'QELEM                   '
say 'QSTACK                  '
say 'RT                      '
say 'SUBCOM                  '
say 'TE                      '
say 'TS                      '
say '                        '
say '------------------------------------------'
say 'TSO/E REXX commands are located at'
say '------------------------------------------'
say 'https://www.ibm.com/docs/en/zos/3.1.0?topic=reference-tsoe-rexx-commands'
say '                        '
say '                        '
say '                        '
say '  enter to continue     '
pull
call newlist
EXREXX:
clrscn
say 'REXX execution options:'
say '-----------------------'
say '                        '
say 'ISPF Command line'
say '------------------'
say 'TSO EX DSN(REXXMBR)     '
say '  where REXXMBR is the named REXX source code'
say '  in DSN, the named data set name'
say '                        '
say '                        '
say 'ISPF View or Edit mode of PDS name'
say '----------------------------------'
say 'EX to the left of REXX source code member name'
say '                        '
say '                        '
say 'ISPF =6 Option Menu'
say '-------------------'
say 'EX DSN(REXXMBR)     '
say '  where REXXMBR is the named REXX source code'
say '  in DSN, the named data set name'
say '                        '
say '                        '
say '  enter to continue     '
pull
call newlist
SUBREXX:
clrscn
say 'JCL Example:'
say '------------'
say '                        '
say "//RUN  EXEC PGM=IRXJCL,PARM='REXXMBR'"
say '//SYSEXEC DD DSN=data-set-name,DISP=SHR'
say '                        '
say '                        '
say '                        '
say '  enter to continue     '
pull
call newlist
