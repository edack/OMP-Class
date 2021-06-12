      *===============================================================*
       IDENTIFICATION DIVISION.
       PROGRAM-ID.    HACKNEWS.
      * AUTHOR.        EDWIN ACKERMAN.
      * INSTALLATION.  IBM CLASS.
      *REMARKS. THERE ARE THREE INSPECT STMTS TO HANDLE IMBEDED
      *         COMMAS IN THE TITLE. THE TIME IS RIGHT JUSTIFIED
      *         TO ALLOW FOR THE MINUTES CONVERSION TO DECIMAL.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT PRINT-FILE
               ASSIGN TO PRTFILE.
           SELECT HACKER-NEWS-FILE
               ASSIGN TO HACKNWS
               FILE STATUS IS HNR-STATUS.
           SELECT SORT-FILE
               ASSIGN TO SORTFL.
      *===============================================================*
       DATA DIVISION.
      *---------------------------------------------------------------*
       FILE SECTION.
      *---------------------------------------------------------------*
       FD  PRINT-FILE RECORDING MODE F.
       01  PRINT-RECORD.
      *    05 CC                           PIC X(01).
           05 PRINT-LINE                   PIC X(132).
      *
       FD  HACKER-NEWS-FILE RECORDING MODE F.
       01  HACKER-NEWS-RECORD-IN.
           05 FILLER                       PIC X(143).
       SD  SORT-FILE.
      *     DATA RECORD IS SORT-RECORD.
       01  SORT-RECORD.
           05  SR-KEY                      PIC X(08).
           05  SR-TITLE                    PIC X(86).
           05  SR-VOTES                    PIC X(04).
           05  SR-COMMENT-CNT              PIC 9(04).
           05  SR-AUTHOR                   PIC X(15).
           05  SR-CREATED-TIME.
               10  SR-CREATED-HH           PIC 9(02).
               10  SR-CREATED-MM           PIC 9(02).
           05  SR-FILLER                   PIC X VALUE SPACE.
           05  SR-RANKING                  PIC 999.999999.
      *---------------------------------------------------------------*
       WORKING-STORAGE SECTION.
      *---------------------------------------------------------------*
       01  PRINT-LINES.
           05  NEXT-REPORT-LINE            PIC X(132) VALUE SPACE.
      *---------------------------------------------------------------*
       01  DETAIL-LINE.
      *---------------------------------------------------------------*
           05  DL-KEY                      PIC X(08).
           05  FILLER                      PIC X(02) VALUE SPACE.
           05  DL-TITLE                    PIC X(80).
           05  FILLER                      PIC X(02) VALUE SPACE.
           05  DL-VOTES                    PIC X(03).
           05  FILLER                      PIC X(02) VALUE SPACE.
           05  DL-COMMENT-CNT              PIC X(03).
           05  FILLER                      PIC X(02).
           05  DL-AUTHOR                   PIC X(13).
           05  FILLER                      PIC X(02) VALUE SPACE.
           05  DL-CREATED-HH               PIC X(02).
           05  FILLER                      PIC X(01) VALUE ':'.
           05  DL-CREATED-MM               PIC X(02).
           05  FILLER                      PIC X(01) VALUE SPACE.
           05  DL-RANKING                  PIC Z9.999999.
      *---------------------------------------------------------------*
       01  HEADING-LINES.
      *---------------------------------------------------------------*
           05  HEADING-LINE-1.
               10  FILLER      PIC X(07) VALUE ' DATE: '.
               10  HL1-MONTH   PIC X(02).
               10  FILLER      PIC X(01) VALUE '/'.
               10  HL1-DAY     PIC X(02).
               10  FILLER      PIC X(01) VALUE '/'.
               10  HL1-YEAR    PIC X(04).
               10  FILLER      PIC X(03) VALUE SPACE.
               10  FILLER      PIC X(20) VALUE '         LISTING OF '.
               10  FILLER      PIC X(20) VALUE 'RECORDS WITH COBOL O'.
               10  FILLER      PIC X(20) VALUE 'R MAINFRAME IN THE T'.
               10  FILLER      PIC X(20) VALUE 'ITLE                '.
               10  FILLER      PIC X(20) VALUE '              PAGE: '.
               10  HL1-PAGE-COUNT          PIC ZZ9.
           05  HEADING-LINE-2.
               10  FILLER      PIC X(20) VALUE '                    '.
               10  FILLER      PIC X(20) VALUE '         -----------'.
               10  FILLER      PIC X(20) VALUE '--------------------'.
               10  FILLER      PIC X(20) VALUE '--------------------'.
               10  FILLER      PIC X(20) VALUE '----                '.
               10  FILLER      PIC X(20) VALUE '                    '.
       COPY HACKNEWS.
      *---------------------------------------------------------------*
       01  WS-SWITCHES-SUBSCRIPTS-MISC.
      *---------------------------------------------------------------*
           05  END-OF-FILE-SW              PIC X(01) VALUE 'N'.
               88  END-OF-FILE                       VALUE 'Y'.
           05  SORT-EOF-SW                 PIC X(01) VALUE 'N'.
               88  SORT-END-OF-FILE                  VALUE 'Y'.
           05  VALID-RECORD-SW             PIC X(01) VALUE 'Y'.
               88  VALID-RECORD                      VALUE 'Y'.
           05  COUNTER-1                   PIC 9(02) VALUE 0.
           05  COUNTER-2                   PIC 9(02) VALUE 0.
           05  SR-STATUS                   PIC X(02) VALUE '00'.
           05  HNR-STATUS                  PIC X(02) VALUE '00'.
           05  WS-HNR-TIME                 PIC 99V9999.
       COPY PRINTCTL.
      *===============================================================*
       PROCEDURE DIVISION.
      *---------------------------------------------------------------*
       0000-MAIN-PROCESSING.
      *---------------------------------------------------------------*
           PERFORM 1000-OPEN-FILES-INITIALIZE.
           SORT SORT-FILE
                ON DESCENDING KEY SR-RANKING
                INPUT PROCEDURE IS 2000-PROCESS-HACKER-NEWS-FILE
                OUTPUT PROCEDURE IS 3000-PRINT-SORT-FILE.
           PERFORM 4000-CLOSE-FILES.
           GOBACK.
      *---------------------------------------------------------------*
       1000-OPEN-FILES-INITIALIZE.
      *---------------------------------------------------------------*
           OPEN INPUT  HACKER-NEWS-FILE.
           OPEN OUTPUT PRINT-FILE.
           MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE-DATA.
           MOVE WS-CURRENT-YEAR  TO HL1-YEAR.
           MOVE WS-CURRENT-MONTH TO HL1-MONTH.
           MOVE WS-CURRENT-DAY   TO HL1-DAY.
      *---------------------------------------------------------------*
       2000-PROCESS-HACKER-NEWS-FILE SECTION.
      *---------------------------------------------------------------*
           PERFORM 8000-READ-HACKER-NEWS-FILE.
           PERFORM 2100-PROCESS-HACKER-RECORD
               UNTIL END-OF-FILE.
       2000-DUMMY     SECTION.
      *---------------------------------------------------------------*
       2100-PROCESS-HACKER-RECORD.
      *---------------------------------------------------------------*
           MOVE 0 TO COUNTER-1, COUNTER-2.
           INSPECT FUNCTION UPPER-CASE(HNR-TITLE)
               TALLYING COUNTER-1 FOR ALL 'COBOL'.
           INSPECT FUNCTION UPPER-CASE(HNR-TITLE)
               TALLYING COUNTER-2 FOR ALL 'MAINFRAME'.
           IF  COUNTER-1  > ZERO OR
               COUNTER-2  > ZERO
               UNSTRING HNR-CREATED-DATE DELIMITED BY SPACE
                   INTO HNR-DATE
                        HNR-TIME
               INSPECT  HNR-TIME REPLACING ALL ' ' BY '0'
               UNSTRING HNR-TIME         DELIMITED BY ':'
                   INTO HNR-TIME-HH
                        HNR-TIME-MM
               PERFORM 2110-CALCULATE-RANKING
               MOVE HNR-KEY                TO SR-KEY
               MOVE HNR-TITLE              TO SR-TITLE
               MOVE HNR-AUTHOR             TO SR-AUTHOR
               MOVE HNR-VOTES              TO SR-VOTES
               MOVE HNR-COMMENT-CNT        TO SR-COMMENT-CNT
               MOVE WS-HNR-TIME            TO SR-CREATED-TIME
               MOVE DL-RANKING             TO SR-RANKING
               MOVE SPACE                  TO SR-FILLER
               PERFORM 9200-WRITE-SORT-RECORD.
           PERFORM 8000-READ-HACKER-NEWS-FILE.
      *---------------------------------------------------------------*
       2110-CALCULATE-RANKING.
      *---------------------------------------------------------------*
           COMPUTE WS-HNR-TIME = HNR-TIME-HH + (HNR-TIME-MM / 60)
           COMPUTE DL-RANKING = (HNR-VOTES - 1) ** .8
                              / (WS-HNR-TIME + 2) ** 1.8.
      *---------------------------------------------------------------*
       3000-PRINT-SORT-FILE    SECTION.
      *---------------------------------------------------------------*
           PERFORM 8200-RETURN-SORT-RECORD.
           PERFORM 3100-PRINT-SORT-REPORT
               UNTIL SORT-END-OF-FILE.
       3000-DUMMY     SECTION.
      *---------------------------------------------------------------*
       3100-PRINT-SORT-REPORT.
      *---------------------------------------------------------------*
           MOVE SR-KEY                     TO DL-KEY.
           MOVE SR-TITLE                   TO DL-TITLE.
           MOVE SR-VOTES                   TO DL-VOTES.
           MOVE SR-COMMENT-CNT             TO DL-COMMENT-CNT.
           MOVE SR-AUTHOR                  TO DL-AUTHOR.
           MOVE SR-CREATED-HH              TO DL-CREATED-HH.
           MOVE SR-CREATED-MM              TO DL-CREATED-MM.
           MOVE SR-RANKING                 TO DL-RANKING.
           MOVE DETAIL-LINE                TO NEXT-REPORT-LINE.
           PERFORM 9000-PRINT-REPORT-LINE.
           PERFORM 8200-RETURN-SORT-RECORD.
      *---------------------------------------------------------------*
       4000-CLOSE-FILES.
      *---------------------------------------------------------------*
           CLOSE HACKER-NEWS-FILE
           CLOSE PRINT-FILE.
      *---------------------------------------------------------------*
       8000-READ-HACKER-NEWS-FILE.
      *---------------------------------------------------------------*
           READ HACKER-NEWS-FILE
               AT END MOVE 'Y' TO END-OF-FILE-SW
                      MOVE 'N' TO VALID-RECORD-SW.
           IF  VALID-RECORD
               PERFORM 8100-BREAKOUT-HACKER-RECORD.
      *---------------------------------------------------------------*
       8100-BREAKOUT-HACKER-RECORD.
      *---------------------------------------------------------------*
           INSPECT HACKER-NEWS-RECORD-IN
               REPLACING ALL '"' BY '#'
               AFTER INITIAL '"'.
           INSPECT HACKER-NEWS-RECORD-IN
               REPLACING ALL ',' BY ' '
               AFTER QUOTE BEFORE '#'.
           INSPECT HACKER-NEWS-RECORD-IN
               REPLACING ALL '#' BY '"'
               AFTER INITIAL '"'.
           UNSTRING HACKER-NEWS-RECORD-IN  DELIMITED BY ','
                INTO HNR-KEY
                     HNR-TITLE
                     HNR-VOTES
                     HNR-COMMENT-CNT
                     HNR-AUTHOR
                     HNR-CREATED-DATE .
      *---------------------------------------------------------------*
       8200-RETURN-SORT-RECORD.
      *---------------------------------------------------------------*
           RETURN SORT-FILE
               AT END MOVE 'Y' TO SORT-EOF-SW.
      *---------------------------------------------------------------*
       9000-PRINT-REPORT-LINE.
      *---------------------------------------------------------------*
           IF LINE-COUNT GREATER THAN LINES-ON-PAGE
               PERFORM 9100-PRINT-HEADING-LINES.
           MOVE NEXT-REPORT-LINE TO PRINT-LINE.
           PERFORM 9120-WRITE-PRINT-LINE.
      *---------------------------------------------------------------*
       9100-PRINT-HEADING-LINES.
      *---------------------------------------------------------------*
           MOVE PAGE-COUNT           TO HL1-PAGE-COUNT.
           MOVE HEADING-LINE-1       TO PRINT-LINE.
           PERFORM 9110-WRITE-TOP-OF-PAGE.
           MOVE 2                    TO LINE-SPACEING.
           MOVE HEADING-LINE-2       TO PRINT-LINE.
           PERFORM 9120-WRITE-PRINT-LINE.
           ADD  1                    TO PAGE-COUNT.
           MOVE 1                    TO LINE-SPACEING.
           MOVE 5                    TO LINE-COUNT.
      *---------------------------------------------------------------*
       9110-WRITE-TOP-OF-PAGE.
      *---------------------------------------------------------------*
           WRITE PRINT-RECORD
               AFTER ADVANCING PAGE.
           MOVE SPACE                TO PRINT-LINE.
      *---------------------------------------------------------------*
       9120-WRITE-PRINT-LINE.
      *---------------------------------------------------------------*
           WRITE PRINT-RECORD
               AFTER ADVANCING LINE-SPACEING.
           MOVE SPACE                TO PRINT-LINE.
           ADD  1                    TO LINE-COUNT.
           MOVE 1                    TO LINE-SPACEING.
      *---------------------------------------------------------------*
       9200-WRITE-SORT-RECORD.
      *---------------------------------------------------------------*
           RELEASE SORT-RECORD.
           MOVE SPACE                TO SORT-RECORD.
