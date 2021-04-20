       IDENTIFICATION DIVISION.
       PROGRAM-ID.  UNEMREAD.
       AUTHOR.        EDWIN ACKERMAN.
       INSTALLATION.  MORONS LOSERS AND BIMBOS.
       DATE-WRITTEN.  05/05/20.
       DATE-COMPILED. 
      *===============================================================*
       ENVIRONMENT DIVISION.
      *---------------------------------------------------------------*
       CONFIGURATION SECTION.
      *---------------------------------------------------------------*
       SOURCE-COMPUTER. IBM-3096.
       OBJECT-COMPUTER. IBM-3096.
      *---------------------------------------------------------------*
       INPUT-OUTPUT SECTION.
      *---------------------------------------------------------------*
       FILE-CONTROL.
           SELECT UNEMPLOYMENT-CLAIMS-FILE ASSIGN TO UNDD
             ORGANIZATION IS INDEXED
             ACCESS MODE  IS DYNAMIC
             RECORD KEY   IS RECORD-ID OF UNEMPLOYMENT-CLAIM
             FILE STATUS  IS UNEMPLOYMENT-FILE-STATUS.
      *===============================================================*
       DATA DIVISION.
      *---------------------------------------------------------------*
       FILE SECTION.
      *---------------------------------------------------------------*
       FD  UNEMPLOYMENT-CLAIMS-FILE
            DATA RECORD IS UNEMPLOYMENT-CLAIM.
            COPY UNEMC.
      *---------------------------------------------------------------*
       WORKING-STORAGE SECTION.
      *---------------------------------------------------------------*
       01  WS-SWITCHES-SUBSCRIPTS-MISC.
           05  UNEMPLOYMENT-FILE-STATUS    PIC 99.
               88 UNEMPLOYMENT-FILE-OK           VALUE 00.
               88 MAY-EXIST                      VALUE 35.
           05  EOF-SWITCH                  PIC X.
               88 EOF                            VALUE 'Y'.
      *---------------------------------------------------------------*
       01  ERROR-DISPLAY-LINE.
           05  FILLER  PIC X(23) VALUE ' *** ERROR DURING FILE '.
           05  DL-ERROR-REASON             PIC X(07) VALUE SPACE.
           05  FILLER  PIC X(18) VALUE ' FILE STATUS IS : '.
           05  DL-FILE-STATUS              PIC 99.
           05  FILLER  PIC X(05) VALUE ' *** '.
      *---------------------------------------------------------------*
       LINKAGE SECTION.
       COPY UNEMT.
      *===============================================================*
       PROCEDURE DIVISION USING RECORD-TABLE-SIZE, RECORD-TABLE-INDEX,
           PROGRAM-ACTION, RECORD-TABLE.
      *---------------------------------------------------------------*
       0000-MAIN-ROUTINE.
      *---------------------------------------------------------------*
           PERFORM 1000-INITIALIZATION.
           IF UNEMPLOYMENT-FILE-OK
               PERFORM 2000-PROCESS-VSAM-REQUEST.
           PERFORM 3000-CLOSE-FILES.
           GOBACK.
      *---------------------------------------------------------------*
       1000-INITIALIZATION.
      *---------------------------------------------------------------*
           OPEN I-O UNEMPLOYMENT-CLAIMS-FILE.
           IF UNEMPLOYMENT-FILE-STATUS NOT = 00
               MOVE 'OPEN'                 TO DL-ERROR-REASON
               PERFORM 9900-INVALID-VSAM-STATUS.
      *---------------------------------------------------------------*
       2000-PROCESS-VSAM-REQUEST.
      *---------------------------------------------------------------.
           IF  PROGRAM-ACTION EQUAL 'ALL'
               PERFORM 2100-PROCESS-NEXT-VSAM-RECORD
                    UNTIL EOF
           ELSE
               MOVE RECORD-ID OF
                    TBL-UNEMPLOYMENT-CLAIM (RECORD-TABLE-SIZE)
                    TO RECORD-ID OF UNEMPLOYMENT-CLAIM
               PERFORM 2200-PROCESS-VSAM-RECORD.
      *---------------------------------------------------------------*
       2100-PROCESS-NEXT-VSAM-RECORD.
      *---------------------------------------------------------------*
           READ UNEMPLOYMENT-CLAIMS-FILE NEXT RECORD
               AT END
                  SET EOF TO TRUE
               NOT AT END
                   ADD 1 TO RECORD-TABLE-SIZE
                   MOVE UNEMPLOYMENT-CLAIM TO
                       TBL-UNEMPLOYMENT-CLAIM (RECORD-TABLE-SIZE).
      *---------------------------------------------------------------*
       2200-PROCESS-VSAM-RECORD.
      *---------------------------------------------------------------*
           READ UNEMPLOYMENT-CLAIMS-FILE
               INVALID KEY
                   MOVE 'READ'             TO DL-ERROR-REASON
                   PERFORM 9900-INVALID-VSAM-STATUS 
                   MOVE 0                  TO RECORD-TABLE-SIZE
               NOT INVALID KEY
                   MOVE UNEMPLOYMENT-CLAIM TO
                       TBL-UNEMPLOYMENT-CLAIM (RECORD-TABLE-SIZE).
      *---------------------------------------------------------------*
       3000-CLOSE-FILES.
      *---------------------------------------------------------------*
           CLOSE UNEMPLOYMENT-CLAIMS-FILE.
      *---------------------------------------------------------------*
       9900-INVALID-VSAM-STATUS.
      *---------------------------------------------------------------*
           MOVE UNEMPLOYMENT-FILE-STATUS   TO DL-FILE-STATUS.
           DISPLAY ERROR-DISPLAY-LINE.

