       IDENTIFICATION DIVISION.
       PROGRAM-ID.    {{process.program_name}}.
       AUTHOR.        EDWIN ACKERMAN.
       INSTALLATION.  MORONS LOSERS AND BIMBOS LP.
       DATE-WRITTEN.  11/28/2020.
       DATE-COMPILED.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.  IBM-3096.
       OBJECT-COMPUTER.  IBM-3096.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *----------------------------------------------------------*
           {{#initialization.file_control.fc_input}}
           {{.}}
           {{/initialization.file_control.fc_input}}

           {{#initialization.file_control.fc_output}}
           {{.}}
           {{/initialization.file_control.fc_output}}
      *==========================================================*
       DATA DIVISION.
      *----------------------------------------------------------*
       FILE SECTION.
      *----------------------------------------------------------*
       {{#initialization.file_section.fd_input}}
       {{.}}
       {{/initialization.file_section.fd_input}}

       {{#initialization.file_section.fd_output}}
       {{.}}
       {{/initialization.file_section.fd_output}}
      *----------------------------------------------------------*
       WORKING-STORAGE SECTION.
      *----------------------------------------------------------*
       01  PRINT-LINES.
           05  NEXT-REPORT-LINE            PIC X(132) VALUE SPACE.
      *----------------------------------------------------------*
       01  HEADING-LINES.
      *----------------------------------------------------------*
           05  HEADING-LINE-1.
               10  FILLER  PIC X(20) VALUE '                    '.
               10  FILLER  PIC X(20) VALUE '                    '.
               10  FILLER  PIC X(20) VALUE '                    '.
               10  FILLER  PIC X(20) VALUE '                    '.
               10  FILLER  PIC X(20) VALUE '                    '.
               10  FILLER  PIC X(20) VALUE '                    '.
               10  FILLER  PIC X(06) VALUE 'PAGE: '.
               10  HL1-PAGE-COUNT          PIC ZZ9.
               10  FILLER                  PIC X(03) VALUE SPACE.
      *----------------------------------------------------------*
       01 DETAIL-LINES.
      *----------------------------------------------------------*
           05  DETAIL-LINE-1.
               10  FILLER  PIC X(132).
      *----------------------------------------------------------*
       01  WS-SWITCHES-SUBSCRIPTS-MISC.
      *----------------------------------------------------------*
           05  END-OF-FILE-SW              PIC X VALUE 'N'.
               88  END-OF-FILE                   VALUE 'Y'.
           05  {{process.input_file_name}}-STATUS        PIC 99 VALUE 0.
           05  {{process.output_file_name}}-STATUS           PIC 99 VALUE 0.
           05  WS-CURRENT-DATE-DATA.
               10  WS-CURRENT-DATE.
                   15  WS-CURRENT-YY       PIC 9(04).
                   15  WS-CURRENT-MM       PIC 9(02).
                   15  WS-CURRENT-DD       PIC 9(02).
               10  WS-CURRENT-TIME.
                   15  WS-CURRENT-HH       PIC 9(02).
                   15  WS-CURRENT-MM       PIC 9(02).
                   15  WS-CURRENT-SS       PIC 9(02).
                   15  WS-CURRENT-MS       PIC 9(02).
           05 PRINTER-CONTROL-FIELDS.
               10  LINE-SPACEING           PIC 9(02) VALUE 1.
               10  LINE-COUNT              PIC 9(03) VALUE 999.
               10  LINES-ON-PAGE           PIC 9(02) VALUE 60.
               10  PAGE-COUNT              PIC 9(02) VALUE 1.
               10  TOP-OF-PAGE             PIC X(02) VALUE '1'.
               10  SINGLE-SPACE            PIC X(01) VALUE ' '.
               10  DOUBLE-SPACE            PIC X(01) VALUE '0'.
               10  TRIPLE-SPACE            PIC X(01) VALUE '-'.
               10  OVERPRINT               PIC X(01) VALUE '+'.
      *==========================================================*
       PROCEDURE DIVISION.
      *----------------------------------------------------------*
       0000-MAIN-PROCESSING.
      *----------------------------------------------------------*
           PERFORM 1000-OPEN-FILES.
           PERFORM 8000-READ-ACCT-FILE.
           PERFORM 2000-PROCESS-ACCT-FILE
               UNTIL END-OF-FILE.
           PERFORM 3000-CLOSE-FILES.
           GOBACK.
      *----------------------------------------------------------*
       1000-OPEN-FILES.
      *----------------------------------------------------------*
           OPEN    INPUT  {{process.input_file_name}}
                   OUTPUT {{process.output_file_name}}.
      *----------------------------------------------------------*
       2000-PROCESS-ACCT-FILE.
      *----------------------------------------------------------*
           MOVE DETAIL-LINE-1          TO NEXT-REPORT-LINE.
           PERFORM 9000-PRINT-REPORT-LINE.
           PERFORM 8000-READ-ACCT-FILE.
      *----------------------------------------------------------*
       3000-CLOSE-FILES.
      *----------------------------------------------------------*
           CLOSE {{process.input_file_name}}
                 {{process.output_file_name}}.
      *----------------------------------------------------------*
       8000-READ-ACCT-FILE.
      *----------------------------------------------------------*
           READ {{process.input_file_name}}
               AT END MOVE 'Y' TO END-OF-FILE-SW.
      *----------------------------------------------------------*
       9000-PRINT-REPORT-LINE.
      *----------------------------------------------------------*
           IF LINE-COUNT GREATER THAN LINES-ON-PAGE
               PERFORM 9100-PRINT-HEADING-LINES.
           MOVE NEXT-REPORT-LINE TO PRINT-LINE.
           PERFORM 9120-WRITE-PRINT-LINE.
      *----------------------------------------------------------*
       9100-PRINT-HEADING-LINES.
      *----------------------------------------------------------*
           MOVE PAGE-COUNT           TO HL1-PAGE-COUNT.
           MOVE HEADING-LINE-1       TO PRINT-LINE.
           PERFORM 9110-WRITE-TOP-OF-PAGE.
           MOVE 2                    TO LINE-SPACEING.
           PERFORM 9120-WRITE-PRINT-LINE.
           ADD  1                    TO PAGE-COUNT.
           MOVE 1                    TO LINE-SPACEING.
           MOVE 5                    TO LINE-COUNT.
      *----------------------------------------------------------*
       9110-WRITE-TOP-OF-PAGE.
      *----------------------------------------------------------*
           WRITE PRINT-RECORD
               AFTER ADVANCING PAGE.
           MOVE SPACE                TO PRINT-LINE.
      *----------------------------------------------------------*
       9120-WRITE-PRINT-LINE.
      *----------------------------------------------------------*
           WRITE PRINT-RECORD
               AFTER ADVANCING LINE-SPACEING.
           MOVE SPACE                TO PRINT-LINE.
           ADD  1                    TO LINE-COUNT.
           MOVE 1                    TO LINE-SPACEING.
