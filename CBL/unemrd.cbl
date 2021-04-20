      *---------------------------------------------------------------*
      * PROGRAM NAME:    UNEMREAD
      * ORIGINAL AUTHOR: DAVID QUINTERO
      *
      * MAINTENENCE LOG
      * DATE      AUTHOR        MAINTENANCE REQUIREMENT
      * --------- ------------  ---------------------------------------
      * 05/05/20 DAVID QUINTERO  CREATED FOR COBOL CLASS
      *
      *===============================================================*
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  UNEMREAD.
       AUTHOR. DAVID QUINTERO.
       INSTALLATION. COBOL DEVELOPMENT CENTER.
       DATE-WRITTEN. 05/05/20.
       DATE-COMPILED. 05/05/20.
       SECURITY. NON-CONFIDENTIAL.
      *===============================================================*
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-3081.
       OBJECT-COMPUTER. IBM-3081.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT UNEMPLOYMENT-CLAIMS-FILE ASSIGN TO UNDD
             ORGANIZATION IS INDEXED
             ACCESS MODE  IS DYNAMIC
             RECORD KEY   IS RECORD-ID OF UNEMPLOYMENT-CLAIM
             FILE STATUS  IS UNEMPLOYMENT-FILE-STATUS.
      *---------------------------------------------------------------*
       DATA DIVISION.
       FILE SECTION.
       FD  UNEMPLOYMENT-CLAIMS-FILE
            DATA RECORD IS UNEMPLOYMENT-CLAIM.
            COPY UNEMC.
      **
      **
       WORKING-STORAGE SECTION.
       01  UNEMPLOYMENT-FILE-STATUS              PIC 99.
           88 UNEMPLOYMENT-FILE-OK               VALUE 00.
           88 MAY-EXIST                          VALUE 35.
       01  EOF-SWITCH                PIC X.
           88 EOF                    VALUE 'Y'.
      *---------------------------------------------------------------*
       LINKAGE SECTION.
       COPY UNEMT.
      *---------------------------------------------------------------*
      *===============================================================*
       PROCEDURE DIVISION USING RECORD-TABLE-SIZE, RECORD-TABLE-INDEX,
           PROGRAM-ACTION, RECORD-TABLE.
           OPEN I-O UNEMPLOYMENT-CLAIMS-FILE
           IF UNEMPLOYMENT-FILE-OK
              EVALUATE PROGRAM-ACTION
                  WHEN 'ALL'
                      PERFORM WRITE-ALL-RECORD UNTIL EOF
                  WHEN OTHER
                      MOVE RECORD-ID OF
                            TBL-UNEMPLOYMENT-CLAIM (RECORD-TABLE-SIZE)
                            TO RECORD-ID OF UNEMPLOYMENT-CLAIM
                      PERFORM WRITE-RECORD
              END-EVALUATE
           ELSE
              MOVE 0 TO RECORD-TABLE-SIZE
              DISPLAY 'FILE ERROR: ', UNEMPLOYMENT-FILE-STATUS
           END-IF
           CLOSE UNEMPLOYMENT-CLAIMS-FILE
           GOBACK.
      *---------------------------------------------------------------*
       WRITE-ALL-RECORD.
      *---------------------------------------------------------------*
           READ UNEMPLOYMENT-CLAIMS-FILE NEXT RECORD
               AT END
                  SET EOF TO TRUE
               NOT AT END
                   ADD 1 TO RECORD-TABLE-SIZE
                   MOVE UNEMPLOYMENT-CLAIM TO
                       TBL-UNEMPLOYMENT-CLAIM (RECORD-TABLE-SIZE)
           END-READ.
      *---------------------------------------------------------------*
       WRITE-RECORD.
      *---------------------------------------------------------------*
           READ UNEMPLOYMENT-CLAIMS-FILE
                INVALID KEY
                   DISPLAY 'KEY INPUT WAS INVALID'
                   MOVE 0 TO RECORD-TABLE-SIZE
                NOT INVALID KEY
                   MOVE UNEMPLOYMENT-CLAIM TO
                       TBL-UNEMPLOYMENT-CLAIM (RECORD-TABLE-SIZE)
           END-READ.
