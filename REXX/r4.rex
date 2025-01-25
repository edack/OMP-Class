/*  REXX   */
user = userid()
say 'Your userid =..................' user
say 'The system date =..............' date()
say 'The system time = .............' time()
say 'Value of SYSUID =..............' SYSVAR('SYSUID')
say 'System OS   = .................' MVSVAR('SYSOPSYS')
say 'System MVS level = ............' MVSVAR('SYSMVS')
say 'System name = .................' MVSVAR('SYSNAME')
say 'System sysplex name = .........' MVSVAR('SYSPLEX')
Exit
