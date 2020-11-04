       E0001-PROC-FILES.
       
           PERFORM F0001-WRITE-HEADER THRU F0001-EXIT.
           MOVE OUTPUT-SUB-HEADER-LAYOUT-1 TO WS-PRINT-REPORT.
           PERFORM P0001-PRINT-REC THRU P0001-EXIT.
           MOVE OUTPUT-SUB-HEADER-LAYOUT-2 TO WS-PRINT-REPORT.
           PERFORM P0001-PRINT-REC THRU P0001-EXIT.
       
           PERFORM E0002-PROC-REC THRU E0002-EXIT
               UNTIL WS-EOF-YES.
       
       E0001-EXIT. EXIT.
       
       E0002-PROC-REC.
       
           MOVE IR-DATE TO ORL-DATE.
           MOVE IR-TS-TIME TO ORL-TIME.
           MOVE IR-CHAR TO ORL-NAME.
           MOVE IR-VARCHAR TO ORL-ADDRESS.
           MOVE IR-NUMERIC TO ORL-SALARY.
       
           MOVE OUTPUT-RECORD-LAYOUT TO WS-PRINT-REPORT.
           PERFORM P0001-PRINT-REC THRU P0001-EXIT.
       
           PERFORM D0001-READ-FILES THRU D0001-EXIT.
       
       E0002-EXIT. EXIT.
       
       F0001-WRITE-HEADER.
       
           SET OHL-COMPANY TO TRUE.
           MOVE OUTPUT-HEADER-LAYOUT TO WS-PRINT-REPORT.
           PERFORM P0001-PRINT-REC THRU P0001-EXIT.
       
           SET OHL-REPORT-TITLE TO TRUE.
           MOVE OUTPUT-HEADER-LAYOUT TO WS-PRINT-REPORT.
           PERFORM P0001-PRINT-REC THRU P0001-EXIT.
       
       F0001-EXIT. EXIT.
       
       F0002-WRITE-EMPTY.
       
           MOVE WS-ASTERISK TO WS-PRINT-REPORT.
           PERFORM P0001-PRINT-REC THRU P0001-EXIT.
       
           MOVE WS-NO-DISPLAY TO WS-PRINT-REPORT.
           PERFORM P0001-PRINT-REC THRU P0001-EXIT.
       
           MOVE WS-ASTERISK TO WS-PRINT-REPORT.
           PERFORM P0001-PRINT-REC THRU P0001-EXIT.
       
       F0002-EXIT. EXIT.
       
       P0001-PRINT-REC.
       
           WRITE OUTPUT-REC FROM WS-PRINT-REPORT.
       
           IF WS-OUT-STAT NOT EQUAL ZEROES
               SET WS-MSG-WR-OU TO TRUE
               MOVE WS-OUT-STAT TO WS-ERR-CDE
               SET WS-PROC-PRNT TO TRUE
               PERFORM Y0001-ERR-HANDLING THRU Y0001-EXIT
           END-IF.
       
       P0001-EXIT. EXIT.
       