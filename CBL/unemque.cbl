       IDENTIFICATION DIVISION.
       PROGRAM-ID.  UNEMQUE.
       AUTHOR. EDWIN ACKERMAN.
       INSTALLATION. MORONS LOSERS AND BIMBOS.
       DATE-WRITTEN. 10/05/2020.
       DATE-COMPILED.
      *==========================================================*
       ENVIRONMENT DIVISION.
      *----------------------------------------------------------*
       CONFIGURATION SECTION.
      *----------------------------------------------------------*
       SOURCE-COMPUTER. IBM-3081.
       OBJECT-COMPUTER. IBM-3081.
      *----------------------------------------------------------*
       INPUT-OUTPUT SECTION.
      *----------------------------------------------------------*
       FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN  TO INDD.
           SELECT OUTFILE ASSIGN TO OUTDD.
      *==========================================================*
       DATA DIVISION.
      *----------------------------------------------------------*
       FILE SECTION.
      *----------------------------------------------------------*
       FD  INPUT-FILE
            LABEL RECORDS ARE STANDARD
            DATA RECORD IS UNEM-CLAIM-ID
            RECORD CONTAINS 3000 CHARACTERS
            RECORDING MODE IS F
            BLOCK CONTAINS 1 RECORDS.
       01  U-STRUCT.
           05  UNEM-CLAIM-ID    PIC X(8) OCCURS 10 TIMES.
      *----------------------------------------------------------*
       FD  OUTFILE
           RECORDING MODE IS F.
       01  OUT-LINE.
           05  OUT-CHAR         PIC X    OCCURS 2000 TIMES.
      *----------------------------------------------------------*
       WORKING-STORAGE SECTION.
      *----------------------------------------------------------*
           COPY UNEMT.
      *----------------------------------------------------------*
           COPY UNEMFORM.
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
           PERFORM 8000-READ-UNEMP-FILE.
           PERFORM 2000-PROCESS-UNEMP-FILE
               UNTIL END-OF-FILE.
           PERFORM 3000-CLOSE-FILES.
           GOBACK.
      *----------------------------------------------------------*
       1000-OPEN-FILES.
      *----------------------------------------------------------*
           OPEN INPUT INPUT-FILE.
           OPEN OUTPUT OUTFILE.
      *----------------------------------------------------------*
       2000-PROCESS-UNEMP-FILE.
      *----------------------------------------------------------*
           PERFORM 2100-PROGRAM-OPTIONS.
           CALL 'UNEMREAD' USING RECORD-TABLE-SIZE,
                                 RECORD-TABLE-INDEX,
                                 PROGRAM-ACTION,
                                 RECORD-TABLE.
           IF RECORD-TABLE-SIZE > 0 THEN
               PERFORM WRITE-HEADERS
               PERFORM WRITE-RECORD VARYING RECORD-TABLE-INDEX
                  FROM 1 BY 1
                  UNTIL RECORD-TABLE-INDEX > RECORD-TABLE-SIZE
           ELSE
               DISPLAY UNEM-CLAIM-ID (1), ' NOT FOUND.'
           END-IF.
           PERFORM 8000-READ-UNEMP-FILE.
      *----------------------------------------------------------*
       2100-PROGRAM-OPTIONS.
      *----------------------------------------------------------*
           IF UNEM-CLAIM-ID (1) = 'ALL' THEN
               MOVE UNEM-CLAIM-ID (1) TO PROGRAM-ACTION
           ELSE
               IF UNEM-CLAIM-ID (1) IS NUMERIC THEN
                   MOVE 1 TO RECORD-TABLE-SIZE
                   MOVE UNEM-CLAIM-ID (1)
                       TO RECORD-ID OF TBL-UNEMPLOYMENT-CLAIM (1)
               ELSE
                   DISPLAY 'Invalid command: enter an 8-digit ',
                       'id for a single record, or ALL for all records'
               END-IF
           END-IF.
      *----------------------------------------------------------*
       3000-CLOSE-FILES.
      *----------------------------------------------------------*
           CLOSE INPUT-FILE.
           CLOSE OUTFILE.
      *----------------------------------------------------------*
       8000-READ-UNEMP-FILE.
      *----------------------------------------------------------*
           READ INPUT-FILE
               AT END MOVE 'Y' TO END-OF-FILE-SW.
      *---------------------------------------------------------------*
       WRITE-HEADERS.
      *----------------------------------------------------------*
           MOVE HEADER-1 TO OUT-LINE
           WRITE OUT-LINE
           MOVE HEADER-2 TO OUT-LINE
           WRITE OUT-LINE
           MOVE SPACES TO HEADER-2.
      *----------------------------------------------------------*
       WRITE-RECORD.
      *----------------------------------------------------------*
           MOVE SPACES TO OUT-LINE, HEADER-2
           MOVE CORRESPONDING
               TBL-UNEMPLOYMENT-CLAIM (RECORD-TABLE-INDEX)
               TO FORMAT-UNEMPLOYMENT-CLAIM
           MOVE FORMAT-UNEMPLOYMENT-CLAIM TO OUT-LINE
           WRITE OUT-LINE.
