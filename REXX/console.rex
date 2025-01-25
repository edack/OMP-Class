/* REXX */
CALL outtrap out.
"console activate"
    ADDRESS CONSOLE "$DSPL"
do i=1 to out.0
    say out.i
end
"console deactivate"
