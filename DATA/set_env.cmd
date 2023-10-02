@echo off

echo.
echo Setting environment for GnuCOBOL 3.1.2 (23Dec2020) with MinGW binaries
echo (GCC 6.3.0, PDcursesMod 4.2.0, GMP 6.2.0, VBISAM 2.0.1)
:: CD "C:\Program Files (x86)\OpenCobolIDE\GnuCOBOL312"

:: Check if called already
:: if yes, check if called from here - exit, in any other case 
:: raise warning and reset env vars
if not "%COB_MAIN_DIR%" == "" (
	echo.
	if "%COB_MAIN_DIR%" == "%~dp0" (
	   echo Information: batch was called already from "%COB_MAIN_DIR%"
	   echo              skipping environment setting...
	   goto :cobcver
	) else (
	   echo Warning: batch was called before from "%COB_MAIN_DIR%"
	   echo          resetting COB_CFLAGS, COB_LDFLAGS 
	   set COB_CFLAGS=
	   set COB_LDFLAGS=
	)
)

:: Get the main dir from the batch's position 
:: (only works in Windows NT environments or higher)
:: set COB_MAIN_DIR=%~dp0
set COB_MAIN_DIR=C:\Program Files (x86)\OpenCobolIDE\GnuCOBOL312\

:: settings for cobc
set COB_CONFIG_DIR=%COB_MAIN_DIR%config
set COB_COPY_DIR=%COB_MAIN_DIR%copy
set COB_CFLAGS=-I"%COB_MAIN_DIR%include" %COB_CFLAGS%
set COB_LDFLAGS=-L"%COB_MAIN_DIR%lib" %COB_LDFLAGS%
:: Setting for esqlOC ODBC logging,
:: default is 999 log everything
::   0   No logging
::   1   Log connections
::   9   Log connections with details
:: 190   Log ODBC return values
:: 901   Log all ODBC calls
set OCSQL_LOGLEVEL=9

:: settings for libcob
rem the following won't work in GnuCOBOL 3.x if there are spaces in COB_MAIN_DIR
set COB_LIBRARY_PATH=%COB_MAIN_DIR%extras

:: Add the bin path of GnuCOBOL (including GCC) to PATH for further references
set PATH=%COB_MAIN_DIR%bin;%PATH%

:: Compiler version output
:cobcver
echo.
:: new cmd to stay open if not started directly from cmd.exe window 
echo %cmdcmdline% | find /i "%~0" >nul
if %errorlevel% equ 0 (
  cmd /k "cobc --version"
) else (
  cobc --version
)

