       IDENTIFICATION DIVISION.
       PROGRAM-ID.    GRPHUSA.
       AUTHOR.        ED ACKERMAN.
       INSTALLATION.  MORONS, LOSERS AND BIMBOES.
       DATE-WRITTEN.  11/28/2020.
       DATE-COMPILED.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.  IBM-3096.
       OBJECT-COMPUTER.  IBM-3096.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT USA-HIST-FILE ASSIGN TO '../../data/USAFILE'
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT PRINT-FILE    ASSIGN TO GRAPHFL.
      *===============================================================*
       DATA DIVISION.
      *---------------------------------------------------------------*
       FILE SECTION.
       FD  USA-HIST-FILE
               RECORDING MODE IS F.
       01  UHF-RECORD.
           05 USA-HIST-RECORD              PIC X(150).
      *---------------------------------------------------------------*
       FD  PRINT-FILE
               RECORDING MODE IS F.
       01  PRINT-RECORD.
      *     05  CC                          PIC X(01).
           05  PRINT-LINE                  PIC X(132).
      *---------------------------------------------------------------*
       WORKING-STORAGE SECTION.
      *---------------------------------------------------------------*
       01   REPORT-LINES.
      *---------------------------------------------------------------*
           05  UHR-PRINT-RECORD.
      *---------------------------------------------------------------*
               10  UHR-TIMESTAMP.
                   15  PR-MONTH            PIC X(02).
                   15  FILLER              PIC X(01)  VALUE '/'.
                   15  PR-DAY              PIC X(02).
                   15  FILLER              PIC X(01)  VALUE '/'.
                   15  PR-YEAR             PIC X(04).
               10  FILLER                  PIC X(02)  VALUE SPACE.
               10  FILLER                  PIC X(02)  VALUE ' |'.
               10  UHR-GRAPH.
                   15  UHR-GRAPH-DATA      PIC X(01) OCCURS 160 TIMES.
               10  FILLER                  PIC X(05)  VALUE SPACE.
      *---------------------------------------------------------------*
           05  NEXT-REPORT-LINE            PIC X(132)  VALUE SPACE.
      *---------------------------------------------------------------*
       01  HEADING-LINES.
      *---------------------------------------------------------------*
           05  HEADING-LINE-1.
      *---------------------------------------------------------------*
               10 HL1-DATE.
                   15  FILLER              PIC X(01) VALUE SPACE.
                   15  FILLER  PIC X(12) VALUE 'TODAYS DATE:'.
                   15  HL1-MONTH-OUT       PIC XX.
                   15  FILLER              PIC X     VALUE '/'.
                   15  HL1-DAY-OUT         PIC XX.
                   15  FILLER              PIC X     VALUE '/'.
                   15  HL1-YEAR-OUT        PIC XXXX.
               10  FILLER      PIC X(20) VALUE '   REPORTING STATE: '.
               10  HL1-REPORTING-STATE     PIC X(03) VALUE SPACE.
               10  FILLER                  PIC X(05) VALUE SPACE.
               10  FILLER      PIC X(20) VALUE '* = NEW, + = MORTALI'.
               10  FILLER      PIC X(20) VALUE 'TY                  '.
               10  FILLER                  PIC X(10) VALUE SPACE.
               10  HL1-PAGE-COUNT-AREA.
                   15  FILLER              PIC X(04) VALUE SPACE.
                   15  FILLER              PIC X(05) VALUE 'PAGE:'.
                   15  HL1-PAGE-NUM        PIC ZZZZ9.
      *---------------------------------------------------------------*
           05  HEADING-LINE-2.
      *---------------------------------------------------------------*
               10  FILLER      PIC X(51) VALUE SPACE.
               10  FILLER      PIC X(20) VALUE '  CASE %     % /100K'.
               10  FILLER      PIC X(47) VALUE SPACE.
      *---------------------------------------------------------------*
           05  HEADING-LINE-3.
      *---------------------------------------------------------------*
               10  FILLER      PIC X(20) VALUE '             |  %  0'.
               10  FILLER      PIC X(20) VALUE '----+----1----+----2'.
               10  FILLER      PIC X(20) VALUE '----+----3----+----4'.
               10  FILLER      PIC X(20) VALUE '----+----5----+----6'.
               10  FILLER      PIC X(20) VALUE '----+----7----+----8'.
               10  FILLER      PIC X(20) VALUE '----+----9----+----0'.
               10  FILLER      PIC X(10) VALUE '----+----1'.
      *---------------------------------------------------------------*
           05  ERROR-LINE-1.
      *---------------------------------------------------------------*
               10  EL-TIMESTAMP.
                   15  EL-MONTH            PIC X(02).
                   15  FILLER              PIC X(01)  VALUE '/'.
                   15  EL-DAY              PIC X(02).
                   15  FILLER              PIC X(01)  VALUE '/'.
                   15  EL-YEAR             PIC X(04).
               10  FILLER                  PIC X(06) VALUE '   |  '.
               10  EL-PERCENT.
                   15  EL-GRAPH-POINT      PIC ZZ9.999.
                   15  FILLER              PIC X(04) VALUE '%   '.
               10  FILLER      PIC X(11) VALUE '      ***  '.
               10  EL-CAUSE                PIC X(05).
               10  FILLER      PIC X(10) VALUE ' VALUE IS '.
               10  FILLER      PIC X(20) VALUE 'TO LARGE TO GRAPH MU'.
               10  FILLER      PIC X(20) VALUE 'ST BE LESS THAN 11% '.
               10  FILLER      PIC X(20) VALUE ' ***                '.
               10  FILLER      PIC X(13) VALUE '             '.
       COPY USAFILE2.
      *---------------------------------------------------------------*
       01  SWITCHES-INDEX-COUNTER-FIELDS.
      *---------------------------------------------------------------*
           05  END-OF-FILE-SW              PIC X(01)  VALUE 'N'.
               88  END-OF-FILE                        VALUE 'Y'.
           05  VALID-RECORD-SW             PIC X(01)  VALUE 'Y'.
               88  VALID-RECORD                       VALUE 'Y'.
           05  REPORT-STATE-SW             PIC X(03)  VALUE 'ALL'.
               88  ALL-STATE-REPORT                   VALUE 'ALL'.
           05  USA-POPULATION              PIC 9(09)  VALUE 340000000.
           05  WS-REPORT-STATE             PIC X(03)  VALUE 'ALL'.
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
           05  WS-PERCENT                  PIC 999V9(10)  VALUE ZERO.
           05  WS-C-GRAPH-PNT              PIC 999V9(10)  VALUE ZERO.
           05  WS-D-GRAPH-PNT              PIC 999V9(10)  VALUE ZERO.
           05  WS-GRAPH-PNT-X              PIC ZZ9.99999  VALUE ZERO.
           05  WS-GRAPH-INDEX              PIC 999     VALUE ZERO.
           05  WS-PNT1                     PIC 99      VALUE ZERO.
           05  WS-PNT2                     PIC 99      VALUE ZERO.
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
           05  STATE-TABLE OCCURS 60 TIMES
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
           MOVE  UHR-END-DATE              TO  WS-PREV-DATE.
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
                      UHR-RECORD-IN
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
               MOVE  UHR-END-DATE          TO  WS-PREV-DATE
           END-IF.
           PERFORM 2100-ACCUMULATE-DATE-TOTALS.
           PERFORM 8000-READ-USA-HIST-FILE.
      *---------------------------------------------------------------*
       2100-ACCUMULATE-DATE-TOTALS.
      *---------------------------------------------------------------*
           IF  UHR-TOTAL-CASES GREATER THAN SPACE
               COMPUTE WS-TOTAL-CASES-2
                  = FUNCTION NUMVAL-C(UHR-TOTAL-CASES)
               ADD WS-TOTAL-CASES-2 TO WS-TOTAL-CASES
           END-IF.
           IF  UHR-NEW-CASES GREATER THAN SPACE
               COMPUTE WS-NEW-CASES-2
                  = FUNCTION NUMVAL-C(UHR-NEW-CASES)
               ADD WS-NEW-CASES-2 TO WS-NEW-CASES
           END-IF.
           IF  UHR-TOTAL-DEATHS GREATER THAN SPACE
               COMPUTE WS-TOTAL-DEATHS-2
                  = FUNCTION NUMVAL-C(UHR-TOTAL-DEATHS)
               ADD WS-TOTAL-DEATHS-2 TO WS-TOTAL-DEATHS
           END-IF.
           IF  UHR-NEW-DEATHS GREATER THAN SPACE
               COMPUTE WS-NEW-DEATHS-2
                  = FUNCTION NUMVAL-C(UHR-NEW-DEATHS)
               ADD WS-NEW-DEATHS-2 TO WS-NEW-DEATHS
           END-IF.
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
                   ADD WS-NEW-DEATHS     TO ST-NEW-DEATHS(STATE-INDEX).
      *---------------------------------------------------------------*
       2200-PRINT-DATE-TOTALS.
      *---------------------------------------------------------------*
           MOVE WS-DAY                     TO PR-DAY.
           MOVE WS-MONTH                   TO PR-MONTH.
           MOVE WS-YEAR                    TO PR-YEAR.
           MOVE ALL SPACES                 TO UHR-GRAPH.
           IF  NOT ALL-STATE-REPORT
               PERFORM 2210-SETUP-STATE.
           IF  WS-NEW-CASES > ZERO
               DIVIDE WS-NEW-CASES     BY USA-POPULATION
                   GIVING WS-PERCENT
               MULTIPLY WS-PERCENT     BY 1000
                   GIVING WS-C-GRAPH-PNT
               DIVIDE WS-NEW-DEATHS  BY USA-POPULATION
                   GIVING WS-PERCENT
               MULTIPLY WS-PERCENT     BY 100000
                   GIVING WS-D-GRAPH-PNT
      *         DISPLAY "C PNT= ", WS-C-GRAPH-PNT, ',  ',
      *                 "D PNT= ", WS-D-GRAPH-PNT
           ELSE
               MOVE ZERO                   TO WS-C-GRAPH-PNT
                                              WS-D-GRAPH-PNT
           END-IF.
           IF  WS-C-GRAPH-PNT GREATER THAN 10 OR
               WS-D-GRAPH-PNT GREATER THAN 10
               MOVE UHR-END-DAY            TO EL-DAY
               MOVE UHR-END-MONTH          TO EL-MONTH
               MOVE UHR-END-YEAR           TO EL-YEAR
               IF  WS-D-GRAPH-PNT GREATER THAN 10
                   MOVE WS-D-GRAPH-PNT     TO EL-GRAPH-POINT
                   MOVE 'DEATH'            TO EL-CAUSE
               ELSE
                   MOVE WS-C-GRAPH-PNT     TO EL-GRAPH-POINT
                   MOVE 'CASES'            TO EL-CAUSE
               END-IF
               MOVE ERROR-LINE-1           TO NEXT-REPORT-LINE
           ELSE
               COMPUTE WS-GRAPH-INDEX = (WS-D-GRAPH-PNT * 10) + 6
               MOVE ' '              TO UHR-GRAPH-DATA(WS-GRAPH-INDEX)
               COMPUTE WS-GRAPH-INDEX = (WS-C-GRAPH-PNT * 10) + 6
               MOVE '*'              TO UHR-GRAPH-DATA(WS-GRAPH-INDEX)
               MOVE 1                TO WS-PNT1
               PERFORM  2220-FORMAT-PERCENT
                   VARYING WS-PNT2 FROM 3 BY 1
                       UNTIL WS-PNT2 GREATER THAN 7
                   MOVE UHR-PRINT-RECORD   TO NEXT-REPORT-LINE
           END-IF.
           PERFORM 9000-PRINT-REPORT-LINE.
           MOVE ALL SPACES                 TO  UHR-GRAPH.
      *---------------------------------------------------------------*
       2210-SETUP-STATE.
      *---------------------------------------------------------------*
      *     DISPLAY REPORT-STATE-SW.
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
       2220-FORMAT-PERCENT.
      *---------------------------------------------------------------*
           MOVE WS-C-GRAPH-PNT             TO WS-GRAPH-PNT-X.
           MOVE WS-GRAPH-PNT-X(WS-PNT2:1)  TO UHR-GRAPH-DATA(WS-PNT1).
           ADD  1                          TO WS-PNT1.
           MOVE ' '                        TO UHR-GRAPH-DATA(WS-PNT1).
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
           END-IF.
      *     DISPLAY UHR-UPDATE-DATE, UHR-TOTAL-CASES.
      *---------------------------------------------------------------*
       9000-PRINT-REPORT-LINE.
      *---------------------------------------------------------------*
           IF LINE-COUNT GREATER THAN LINES-ON-PAGE
              PERFORM 9100-PRINT-HEADING-LINES
           END-IF.
           MOVE NEXT-REPORT-LINE           TO PRINT-LINE.
           PERFORM 9120-WRITE-PRINT-LINE.
           MOVE SPACE                      TO NEXT-REPORT-LINE.
      *---------------------------------------------------------------*
       9100-PRINT-HEADING-LINES.
      *---------------------------------------------------------------*
           MOVE PAGE-COUNT                 TO HL1-PAGE-NUM.
           MOVE REPORT-STATE-SW            TO HL1-REPORTING-STATE.
           MOVE HEADING-LINE-1             TO PRINT-LINE.
           PERFORM 9110-WRITE-TOP-OF-PAGE.
           MOVE 1                          TO LINE-SPACEING.
           MOVE HEADING-LINE-2             TO PRINT-LINE.
           PERFORM 9120-WRITE-PRINT-LINE.
           MOVE 2                          TO LINE-SPACEING.
           MOVE HEADING-LINE-3             TO PRINT-LINE.
           PERFORM 9120-WRITE-PRINT-LINE.
           MOVE 1                          TO LINE-SPACEING.
           ADD  1                          TO PAGE-COUNT.
           MOVE 6                          TO LINE-COUNT.
      *---------------------------------------------------------------*
       9110-WRITE-TOP-OF-PAGE.
      *---------------------------------------------------------------*
           WRITE PRINT-RECORD
               AFTER ADVANCING PAGE.
           MOVE SPACE                      TO PRINT-RECORD.
      *---------------------------------------------------------------*
       9120-WRITE-PRINT-LINE.
      *---------------------------------------------------------------*
           WRITE PRINT-RECORD
               AFTER ADVANCING LINE-SPACEING.
           ADD LINE-SPACEING               TO LINE-COUNT.
           MOVE 1                          TO LINE-SPACEING.
           MOVE SPACE                      TO PRINT-RECORD.
      *---------------------------------------------------------------*
      * 9900-TABLE-ERROR.
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
