       IDENTIFICATION DIVISION.
       PROGRAM-ID. COV19USA.
       AUTHOR.        ED ACKERMAN.
       INSTALLATION.  MORONS, LOSERS AND BIMBOES.
       DATE-WRITTEN.  11/28/2020.
       DATE-COMPILED.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.  IBM-3906.
       OBJECT-COMPUTER.  IBM-3906.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT USA-HIST-FILE ASSIGN TO '../../data/USAFILE'
           ORGANIZATION IS LINE SEQUENTIAL.
           SELECT PRINT-FILE    ASSIGN TO PRTFILE
           ORGANIZATION IS LINE SEQUENTIAL.
      *===============================================================*
       DATA DIVISION.
      *---------------------------------------------------------------*
       FILE SECTION.
       FD  USA-HIST-FILE
               RECORDING MODE F.
       01  UHR-RECORD.
           05  USA-HIST-RECORD        PIC X(130).
      *---------------------------------------------------------------*
       FD  PRINT-FILE
               RECORDING MODE IS F.
       01  PRINT-RECORD.
      *    05  CC                     PIC X(01).
           05  PRINT-LINE             PIC X(132).
      *---------------------------------------------------------------*
       WORKING-STORAGE SECTION.
      *---------------------------------------------------------------*
       01   REPORT-LINES.
      *---------------------------------------------------------------*
           05  NEXT-REPORT-LINE       PIC X(132).
      *---------------------------------------------------------------*
           05  DETAIL-LINE-1.
               10  DL1-TIMESTAMP.
                   15  DL1-MONTH      PIC X(02).
                   15  FILLER         PIC X(01)  VALUE '/'.
                   15  DL1-DAY        PIC X(02).
                   15  FILLER         PIC X(01)  VALUE '/'.
                   15   DL1-YEAR      PIC X(04).
               10  FILLER             PIC X(03)  VALUE SPACE.
               10  DL1-CASE-POSITIVE  PIC ZZZ,ZZZ,ZZ9.
               10  FILLER             PIC X(02)  VALUE SPACE.
               10  DL1-CASE-NEW       PIC ZZZ,ZZ9.
               10  FILLER             PIC X(02)  VALUE SPACE.
               10  DL1-CASE-PENDING   PIC ZZ,ZZ9.
               10  FILLER             PIC X(01)  VALUE SPACE.
               10  DL1-DEATH          PIC Z,ZZZ,ZZ9.
               10  FILLER             PIC X(01)  VALUE SPACE.
               10  DL1-DEATH-NEW      PIC ZZZ,ZZ9.
               10  FILLER             PIC X(01)  VALUE SPACE.
               10  DL1-DEATH-PERCENT  PIC Z9.9999.
               10  FILLER             PIC X(03)  VALUE '%  '.
               10  DL1-CASE-PERCENT   PIC Z9.9999.
               10  FILLER             PIC X(01)  VALUE '%'.
      *---------------------------------------------------------------*
           05  HEADING-LINE-1.
               10 HL1-DATE.
                   15  FILLER         PIC X(01) VALUE SPACE.
                   15  FILLER         PIC X(12) VALUE 'TODAYS DATE:'.
                   15  HL1-MONTH-OUT  PIC XX.
                   15  FILLER         PIC X     VALUE '/'.
                   15  HL1-DAY-OUT    PIC XX.
                   15  FILLER         PIC X     VALUE '/'.
                   15  HL1-YEAR-OUT   PIC XX.
               10  FILLER             PIC X(15) VALUE SPACE.
               10  FILLER             PIC X(11) VALUE 'FOR STATE: '.
               10  HL1-STATE          PIC X(03).
               10  FILLER             PIC X(13) VALUE SPACE.
               10  HL1-PAGE-COUNT-AREA.
                   15  FILLER         PIC X(04) VALUE SPACE.
                   15  FILLER         PIC X(05) VALUE 'PAGE:'.
                   15  HL1-PAGE-NUM   PIC ZZZZ9.
                   15  FILLER         PIC X(05) VALUE SPACE.
               10  FILLER             PIC X(40) VALUE SPACE.
      *---------------------------------------------------------------*
           05  HEADING-LINE-2.
               10  FILLER    PIC X(12) VALUE '  AS OF     '.
               10  FILLER    PIC X(20) VALUE '     TOTAL       NEW'.
               10  FILLER    PIC X(20) VALUE '     PEND    DEATH  '.
               10  FILLER    PIC X(20) VALUE '   NEW    DEATH    N'.
               10  FILLER    PIC X(20) VALUE ' CASE               '.
               10  FILLER    PIC X(20) VALUE '                    '.
               10  FILLER    PIC X(20) VALUE '                    '.
      *---------------------------------------------------------------*
           05  HEADING-LINE-3.
               10  FILLER    PIC X(12) VALUE '  DATE      '.
               10  FILLER    PIC X(20) VALUE '     CASES      CASE'.
               10  FILLER    PIC X(20) VALUE 'S   CASES    TOTAL  '.
               10  FILLER    PIC X(20) VALUE ' DEATHS    % AGE    '.
               10  FILLER    PIC X(20) VALUE '% AGE               '.
               10  FILLER    PIC X(20) VALUE '                    '.
               10  FILLER    PIC X(20) VALUE '                    '.
      *---------------------------------------------------------------*
           05  HEADING-LINE-4.
               10  FILLER    PIC X(12) VALUE '  ----      '.
               10  FILLER    PIC X(20) VALUE '     -----      ----'.
               10  FILLER    PIC X(20) VALUE '-   -----    -----  '.
               10  FILLER    PIC X(20) VALUE ' ------   ------    '.
               10  FILLER    PIC X(20) VALUE '-----               '.
               10  FILLER    PIC X(20) VALUE '                    '.
               10  FILLER    PIC X(20) VALUE '                    '.
       COPY USAFILE2.
      *---------------------------------------------------------------*
       01  SWITCHES-MISC-FIELDS.
      *---------------------------------------------------------------*
           05  FILE-STATUS                 PIC X(02).
           05  END-OF-FILE-SW              PIC X(01)   VALUE 'N'.
               88  END-OF-FILE                         VALUE 'Y'.
           05  VALID-RECORD-SW             PIC X(01)   VALUE 'Y'.
               88  VALID-RECORD                        VALUE 'Y'.
           05  REPORT-STATE-SW             PIC X(03)   VALUE 'ALL'.
               88  ALL-STATE-REPORT                    VALUE 'ALL'.
           05  TOTAL-ACCUMULATORS.
               10  TA-CASE-TOT             PIC 9(08)  VALUE ZERO.
               10  TA-DEATH-TOT            PIC 9(08)  VALUE ZERO.
           05  WS-COUNTER                  PIC 9(02)  VALUE ZERO.
           05  WS-TOTAL-CASES              PIC 9(09)  VALUE ZERO.
           05  WS-TOTAL-CASES-2            PIC 9(09)  VALUE ZERO.
           05  WS-NEW-CASES                PIC 9(09)  VALUE ZERO.
           05  WS-NEW-CASES-2              PIC 9(09)  VALUE ZERO.
           05  WS-CASE-PEND                PIC 9(09)  VALUE ZERO.
           05  WS-TOTAL-DEATHS             PIC 9(09)  VALUE ZERO.
           05  WS-TOTAL-DEATHS-2           PIC 9(09)  VALUE ZERO.
           05  WS-NEW-DEATHS               PIC 9(09)  VALUE ZERO.
           05  WS-NEW-DEATHS-2             PIC 9(09)  VALUE ZERO.
           05  WS-DEATH-PEND               PIC 9(09)  VALUE ZERO.
           05  WS-PERCENT                  PIC 99V999999.
           05  WS-REPORT-STATE             PIC X(03).
           05  WS-PREV-DATE.
               10 WS-YEAR                  PIC X(04).
               10 FILLER                   PIC X(01).
               10 WS-MONTH                 PIC X(02).
               10 FILLER                   PIC X(01).
               10 WS-DAY                   PIC X(02).
               10 FILLER                   PIC X(13).
      *---------------------------------------------------------------*
       01  STATE-ACCUMULATION-FIELDS.
      *---------------------------------------------------------------*
           05  STATE-TABLE OCCURS 70 TIMES
                           INDEXED BY STATE-INDEX.
               10  ST-STATE                PIC X(03).
               10  ST-TOTAL-CASES          PIC 9(09).
               10  ST-NEW-CASES            PIC 9(09).
               10  ST-CASE-PEND            PIC 9(09).
               10  ST-TOTAL-DEATHS         PIC 9(09).
               10  ST-NEW-DEATHS           PIC 9(09).
               10  ST-DEATH-PEND           PIC 9(09).
       COPY PRINTCTL.
      *===============================================================*
       PROCEDURE DIVISION.
      *---------------------------------------------------------------*
       0000-MAIN-PROCESSING.
      *---------------------------------------------------------------*
           PERFORM 1000-OPEN-FILES.
           PERFORM 8000-READ-USA-HIST-FILE.
           MOVE UHR-END-DATE               TO  WS-PREV-DATE.
           PERFORM 2000-PROCESS-USA-HIST-FILE
               UNTIL END-OF-FILE.
           PERFORM 2200-PRINT-DATE-TOTALS.
           PERFORM 3000-CLOSE-FILES.
           GOBACK.
      *---------------------------------------------------------------*
       1000-OPEN-FILES.
      *---------------------------------------------------------------*
           OPEN INPUT  USA-HIST-FILE
                OUTPUT PRINT-FILE.
           MOVE FUNCTION CURRENT-DATE      TO WS-CURRENT-DATE-DATA.
           MOVE WS-CURRENT-YEAR            TO HL1-YEAR-OUT.
           MOVE WS-CURRENT-MONTH           TO HL1-MONTH-OUT.
           MOVE WS-CURRENT-DAY             TO HL1-DAY-OUT.
           MOVE SPACE                      TO WS-PREV-DATE.
           INITIALIZE STATE-ACCUMULATION-FIELDS
               REPLACING   NUMERIC DATA BY 0
                           ALPHANUMERIC DATA BY SPACE.
           ACCEPT WS-REPORT-STATE.
           MOVE FUNCTION UPPER-CASE(WS-REPORT-STATE) TO REPORT-STATE-SW.
           DISPLAY  REPORT-STATE-SW.
      *---------------------------------------------------------------*
       2000-PROCESS-USA-HIST-FILE.
      *---------------------------------------------------------------*
           IF  UHR-END-DATE NOT = WS-PREV-DATE
               PERFORM 2200-PRINT-DATE-TOTALS
               MOVE  ZERO                  TO  WS-TOTAL-CASES
               MOVE  ZERO                  TO  WS-NEW-CASES
               MOVE  ZERO                  TO  WS-CASE-PEND
               MOVE  ZERO                  TO  WS-TOTAL-DEATHS
               MOVE  ZERO                  TO  WS-NEW-DEATHS
               MOVE  ZERO                  TO  WS-DEATH-PEND
               INITIALIZE STATE-ACCUMULATION-FIELDS
                   REPLACING NUMERIC DATA BY 0
                             ALPHANUMERIC DATA BY SPACE
               MOVE  UHR-END-DATE          TO  WS-PREV-DATE.
           PERFORM 2100-ACCUMULATE-DATE-TOTALS.
           PERFORM 8000-READ-USA-HIST-FILE.
      *---------------------------------------------------------------*
       2100-ACCUMULATE-DATE-TOTALS.
      *---------------------------------------------------------------*
           IF  UHR-TOTAL-CASES  GREATER THAN SPACE
               COMPUTE WS-TOTAL-CASES-2
                   = FUNCTION NUMVAL-C(UHR-TOTAL-CASES)
               ADD  WS-TOTAL-CASES-2         TO  WS-TOTAL-CASES.
           IF  UHR-NEW-CASES  GREATER THAN SPACE
               COMPUTE WS-NEW-CASES-2
                   = FUNCTION NUMVAL-C(UHR-NEW-CASES)
               ADD  WS-NEW-CASES-2           TO  WS-NEW-CASES.
           IF  UHR-TOTAL-DEATHS  GREATER THAN SPACE
               COMPUTE WS-TOTAL-DEATHS-2
                   = FUNCTION NUMVAL-C(UHR-TOTAL-DEATHS)
               ADD  WS-TOTAL-DEATHS-2        TO  WS-TOTAL-DEATHS.
           IF  UHR-NEW-DEATHS  GREATER THAN SPACE
               COMPUTE WS-NEW-DEATHS-2
                   = FUNCTION NUMVAL-C(UHR-NEW-DEATHS)
               ADD  WS-NEW-DEATHS-2          TO  WS-NEW-DEATHS.
           PERFORM  2110-ACCUMULATE-STATE-TOTALS.
      *---------------------------------------------------------------*
       2110-ACCUMULATE-STATE-TOTALS.
      *---------------------------------------------------------------*
           SET STATE-INDEX TO 1.
           SEARCH STATE-TABLE
               AT END
                   PERFORM 9901-LOAD-TABLE-ERROR
               WHEN ST-STATE(STATE-INDEX) = UHR-STATE
                   ADD WS-TOTAL-CASES    TO ST-TOTAL-CASES(STATE-INDEX)
                   ADD WS-NEW-CASES      TO ST-NEW-CASES(STATE-INDEX)
                   ADD WS-TOTAL-DEATHS   TO ST-TOTAL-DEATHS(STATE-INDEX)
                   ADD WS-NEW-DEATHS     TO ST-NEW-DEATHS(STATE-INDEX)
               WHEN ST-STATE(STATE-INDEX) = SPACE
                   MOVE UHR-STATE        TO ST-STATE(STATE-INDEX)
                   ADD WS-TOTAL-CASES    TO ST-TOTAL-CASES(STATE-INDEX)
                   ADD WS-NEW-CASES      TO ST-NEW-CASES(STATE-INDEX)
                   ADD WS-TOTAL-DEATHS   TO ST-TOTAL-DEATHS(STATE-INDEX)
                   ADD WS-NEW-DEATHS     TO ST-NEW-DEATHS(STATE-INDEX)
           .
      *---------------------------------------------------------------*
       2200-PRINT-DATE-TOTALS.
      *---------------------------------------------------------------*
           MOVE WS-DAY                     TO DL1-DAY.
           MOVE WS-MONTH                   TO DL1-MONTH.
           MOVE WS-YEAR                    TO DL1-YEAR.
           IF  NOT ALL-STATE-REPORT
               PERFORM 2210-SETUP-STATE.
           MOVE WS-TOTAL-CASES             TO DL1-CASE-POSITIVE.
           MOVE WS-NEW-CASES               TO DL1-CASE-NEW.
           MOVE ZERO                       TO DL1-CASE-PENDING.
           MOVE WS-TOTAL-DEATHS            TO DL1-DEATH.
           MOVE WS-NEW-DEATHS              TO DL1-DEATH-NEW.
           IF  WS-NEW-CASES > ZERO
               DIVIDE WS-NEW-DEATHS  BY WS-NEW-CASES
                   GIVING WS-PERCENT
               MULTIPLY WS-PERCENT BY 100 GIVING DL1-DEATH-PERCENT
               DIVIDE WS-NEW-CASES   BY WS-TOTAL-CASES
                   GIVING WS-PERCENT
               MULTIPLY WS-PERCENT BY 100 GIVING DL1-CASE-PERCENT
           ELSE
               MOVE ZERO                   TO DL1-DEATH-PERCENT
                                              DL1-CASE-PERCENT.
           MOVE DETAIL-LINE-1              TO NEXT-REPORT-LINE.
           PERFORM 9000-PRINT-REPORT-LINE.
      *---------------------------------------------------------------*
       2210-SETUP-STATE.
      *---------------------------------------------------------------*
           SET STATE-INDEX  TO 1.
           SEARCH STATE-TABLE
               AT END
                   PERFORM 9902-SEARCH-TABLE-ERROR
               WHEN ST-STATE(STATE-INDEX) = REPORT-STATE-SW
                   MOVE ST-TOTAL-CASES(STATE-INDEX)  TO WS-TOTAL-CASES
                   MOVE ST-NEW-CASES(STATE-INDEX)    TO WS-NEW-CASES
                   MOVE ST-TOTAL-DEATHS(STATE-INDEX) TO WS-TOTAL-DEATHS
                   MOVE ST-NEW-DEATHS(STATE-INDEX)   TO WS-NEW-DEATHS.
      *---------------------------------------------------------------*
       3000-CLOSE-FILES.
      *---------------------------------------------------------------*
           CLOSE USA-HIST-FILE
                 PRINT-FILE.
      *---------------------------------------------------------------*
       8000-READ-USA-HIST-FILE.
      *---------------------------------------------------------------*
           READ USA-HIST-FILE
               AT END MOVE 'Y'             TO END-OF-FILE-SW
                      MOVE 'N'             TO VALID-RECORD-SW.
           IF VALID-RECORD
              UNSTRING USA-HIST-RECORD DELIMITED BY ','
              INTO UHR-UPDATE-DATE
                  UHR-STATE
                  UHR-START-DATE
                  UHR-END-DATE
                  UHR-TOTAL-CASES
                  UHR-NEW-CASES
                  UHR-TOTAL-DEATHS
                  UHR-NEW-DEATHS
           .
      *---------------------------------------------------------------*
       9000-PRINT-REPORT-LINE.
      *---------------------------------------------------------------*
           IF LINE-COUNT GREATER THAN LINES-ON-PAGE
              PERFORM 9100-PRINT-HEADING-LINES.
           MOVE NEXT-REPORT-LINE           TO PRINT-LINE.
           PERFORM 9120-WRITE-PRINT-LINE.
      *---------------------------------------------------------------*
       9100-PRINT-HEADING-LINES.
      *---------------------------------------------------------------*
           MOVE PAGE-COUNT                 TO HL1-PAGE-NUM.
           MOVE REPORT-STATE-SW            TO HL1-STATE.
           MOVE HEADING-LINE-1             TO PRINT-LINE.
           PERFORM 9110-WRITE-TOP-OF-PAGE.
           MOVE 2                          TO LINE-SPACEING.
           MOVE HEADING-LINE-2             TO PRINT-LINE.
           PERFORM 9120-WRITE-PRINT-LINE.
           MOVE 1                          TO LINE-SPACEING.
           MOVE HEADING-LINE-3             TO PRINT-LINE.
           PERFORM 9120-WRITE-PRINT-LINE.
           MOVE HEADING-LINE-4             TO PRINT-LINE.
           PERFORM 9120-WRITE-PRINT-LINE.
           MOVE 1                          TO LINE-SPACEING.
           ADD 1                           TO PAGE-COUNT.
           MOVE 6                          TO LINE-COUNT.
      *---------------------------------------------------------------*
       9110-WRITE-TOP-OF-PAGE.
      *---------------------------------------------------------------*
           WRITE PRINT-RECORD
               AFTER ADVANCING PAGE.
           MOVE SPACE                      TO PRINT-LINE.
      *---------------------------------------------------------------*
       9120-WRITE-PRINT-LINE.
      *---------------------------------------------------------------*
           WRITE PRINT-RECORD
               AFTER ADVANCING LINE-SPACEING.
           ADD LINE-SPACEING               TO LINE-COUNT.
           MOVE 1                          TO LINE-SPACEING.
           MOVE SPACE                      TO PRINT-LINE.
      *---------------------------------------------------------------*
       9901-LOAD-TABLE-ERROR.
      *---------------------------------------------------------------*
           DISPLAY "*** LOAD STATE TABLE ERROR ***".
           DISPLAY REPORT-STATE-SW.
           DISPLAY UHR-STATE.
      *---------------------------------------------------------------*
       9902-SEARCH-TABLE-ERROR.
      *---------------------------------------------------------------*
           DISPLAY "*** SEARCH STATE TABLE ERROR ***".
           DISPLAY REPORT-STATE-SW.
           DISPLAY UHR-STATE.
