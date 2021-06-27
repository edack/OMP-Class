      *===============================================================*
      * PROGRAM NAME:    UNEM
      * ORIGINAL AUTHOR: DAVID QUINTERO
      *
      * MAINTENENCE LOG
      * DATE      AUTHOR        MAINTENANCE REQUIREMENT
      * --------- ------------  ---------------------------------------
      * 05/05/20 DAVID QUINTERO  CREATED FOR COBOL CLASS
      * 06/24/21 ED ACKERMAN     RESTRUCTURE, INDENTATION
      *                          REMOVAL OF FALL THRU AND GO TO'S.
      *
      *===============================================================*
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  UNEM.
      * AUTHOR. DAVID QUINTERO.
      * INSTALLATION. COBOL DEVELOPMENT CENTER.
      * DATE-WRITTEN. 05/05/20.
      * DATE-COMPILED. 05/05/20.
      * SECURITY. NON-CONFIDENTIAL.
      *===============================================================*
       ENVIRONMENT DIVISION.
      *---------------------------------------------------------------*
       CONFIGURATION SECTION.
      *---------------------------------------------------------------*
       SOURCE-COMPUTER. IBM-3081.
      *---------------------------------------------------------------*
       OBJECT-COMPUTER. IBM-3081.
      *---------------------------------------------------------------*
       INPUT-OUTPUT SECTION.
      *---------------------------------------------------------------*
       FILE-CONTROL.
           SELECT CSV-AGE ASSIGN TO CSVAGE
             ORGANIZATION IS SEQUENTIAL
             FILE STATUS CSV-AGE-STATUS.
      *
           SELECT CSV-ETHNICITY ASSIGN TO CSVETH
             ORGANIZATION IS SEQUENTIAL
             FILE STATUS CSV-ETHNICITY-STATUS.
      *
           SELECT CSV-INDUSTRY ASSIGN TO CSVIND
             ORGANIZATION IS SEQUENTIAL
             FILE STATUS CSV-INDUSTRY-STATUS.
      *
           SELECT CSV-RACE ASSIGN TO CSVRAC
             ORGANIZATION IS SEQUENTIAL
             FILE STATUS CSV-RACE-STATUS.
      *
           SELECT CSV-GENDER ASSIGN TO CSVSEX
             ORGANIZATION IS SEQUENTIAL
             FILE STATUS CSV-GENDER-STATUS.
      *
           SELECT UNEMPLOYMENT-CLAIMS-FILE ASSIGN TO UNDD
             ORGANIZATION IS INDEXED
             ACCESS MODE  IS DYNAMIC
             RECORD KEY   IS RECORD-ID
             FILE STATUS  IS UNEMPLOYMENT-FILE-STATUS.
      *===============================================================*
       DATA DIVISION.
       FILE SECTION.
      *---------------------------------------------------------------*
       FD  CSV-AGE.
      *     RECORDING MODE IS F
      *     LABEL RECORDS ARE STANDARD
      *     DATA RECORD IS CSV-AGE-LINE
      *     RECORD CONTAINS 3000 CHARACTERS
      *     BLOCK CONTAINS 0 RECORDS.
       01  CSV-AGE-LINE    PIC X(3000).
      *---------------------------------------------------------------*
       FD  CSV-ETHNICITY.
      *     RECORDING MODE IS F
      *     LABEL RECORDS ARE STANDARD
      *     DATA RECORD IS CSV-ETHNICITY-LINE
      *     RECORD CONTAINS 3000 CHARACTERS
      *     BLOCK CONTAINS 0 RECORDS.
       01  CSV-ETHNICITY-LINE    PIC X(3000).
      *---------------------------------------------------------------*
       FD  CSV-INDUSTRY.
      *     RECORDING MODE IS F
      *     LABEL RECORDS ARE STANDARD
      *     DATA RECORD IS CSV-INDUSTRY-LINE.
      *     RECORD CONTAINS 3000 CHARACTERS
      *     BLOCK CONTAINS 0 RECORDS.
       01  CSV-INDUSTRY-LINE    PIC X(3000).
      *---------------------------------------------------------------*
       FD  CSV-RACE.
      *     RECORDING MODE IS F
      *     LABEL RECORDS ARE STANDARD
      *     DATA RECORD IS CSV-RACE-LINE.
      *     RECORD CONTAINS 3000 CHARACTERS
      *     BLOCK CONTAINS 0 RECORDS.
       01  CSV-RACE-LINE    PIC X(3000).
      *---------------------------------------------------------------*
       FD  CSV-GENDER.
      *     RECORDING MODE IS F
      *     LABEL RECORDS ARE STANDARD
      *     DATA RECORD IS CSV-GENDER-LINE.
      *     RECORD CONTAINS 3000 CHARACTERS
      *     BLOCK CONTAINS 0 RECORDS.
       01  CSV-GENDER-LINE    PIC X(3000).
      *---------------------------------------------------------------*
       FD  UNEMPLOYMENT-CLAIMS-FILE.
       COPY UNEMC.
      *---------------------------------------------------------------*
       WORKING-STORAGE SECTION.
      *---------------------------------------------------------------*
       01  WS-SWITCHES-MISC-FIELDS.
           05  CSV-AGE-STATUS              PIC X(02).
               88  CSV-AGE-OK                        VALUE '00'.
               88  CSV-AGE-EOF                       VALUE '10'.
           05  CSV-ETHNICITY-STATUS        PIC X(02).
               88  CSV-ETHNICITY-OK                  VALUE '00'.
               88  CSV-ETHNICITY-EOF                 VALUE '10'.
           05  CSV-INDUSTRY-STATUS         PIC X(02).
               88  CSV-INDUSTRY-OK                   VALUE '00'.
               88  CSV-INDUSTRY-EOF                  VALUE '10'.
           05  CSV-RACE-STATUS             PIC X(02).
               88  CSV-RACE-OK                       VALUE '00'.
               88  CSV-RACE-EOF                      VALUE '10'.
           05  CSV-GENDER-STATUS           PIC X(02).
               88  CSV-GENDER-OK                     VALUE '00'.
               88  CSV-GENDER-EOF                    VALUE '10'.
           05  UNEMPLOYMENT-FILE-STATUS    PIC X(02).
               88 UNEMPLOYMENT-FILE-OK               VALUE '00'.
               88 UNEMPLOYMENT-FILE-MAY-EXIST        VALUE '35'.
           05  WS-FILE-OPEN-ERROR-SW       PIC X(01) VALUE 'N'.
               88  WS-FILE-OPEN-ERROR                VALUE 'Y'.
               88  WS-FILE-OPEN-OK                   VALUE 'N'.
           05  WS-RECORD-COUNT             PIC 9(07) VALUE 0.
      *===============================================================*
       PROCEDURE DIVISION.
      *---------------------------------------------------------------*
       0000-MAIN-PARAGRAPH.
      *---------------------------------------------------------------*
           PERFORM 1000-OPEN-FILES.
           PERFORM 8000-READ-HEADERS.
           PERFORM 2000-WRITING-VSAM
               UNTIL CSV-AGE-EOF.
           PERFORM 3000-CLOSE-DATA-FILES.
           DISPLAY 'RECORD COUNT :', WS-RECORD-COUNT.
           GOBACK.
      *---------------------------------------------------------------*
       1000-OPEN-FILES.
      *---------------------------------------------------------------*
           OPEN INPUT CSV-AGE, CSV-ETHNICITY, CSV-GENDER, CSV-INDUSTRY,
               CSV-RACE.
      *
           IF NOT CSV-AGE-OK
               MOVE 'Y'                TO WS-FILE-OPEN-ERROR-SW
               DISPLAY 'CSV AGE FILE: ', CSV-AGE-STATUS.
           IF NOT CSV-ETHNICITY-OK
               MOVE 'Y'                TO WS-FILE-OPEN-ERROR-SW
               DISPLAY 'CSV ETHNICITY FILE: ', CSV-ETHNICITY-STATUS.
           IF NOT CSV-INDUSTRY-OK
               MOVE 'Y'                TO WS-FILE-OPEN-ERROR-SW
               DISPLAY 'CSV INDUSTRY FILE: ', CSV-INDUSTRY-STATUS.
           IF NOT CSV-RACE-OK
               MOVE 'Y'                TO WS-FILE-OPEN-ERROR-SW
               DISPLAY 'CSV RACE FILE: ', CSV-RACE-STATUS.
           IF NOT CSV-GENDER-OK
               MOVE 'Y'                TO WS-FILE-OPEN-ERROR-SW
               DISPLAY 'CSV GENDER: ', CSV-GENDER-STATUS.
           PERFORM 1100-OPEN-UNEMP-VSAM-FILE.
      *---------------------------------------------------------------*
       1100-OPEN-UNEMP-VSAM-FILE.
      *---------------------------------------------------------------*
           OPEN OUTPUT UNEMPLOYMENT-CLAIMS-FILE.
           CLOSE       UNEMPLOYMENT-CLAIMS-FILE.
           OPEN I-O    UNEMPLOYMENT-CLAIMS-FILE.
           EVALUATE UNEMPLOYMENT-FILE-STATUS
               WHEN 00
                   DISPLAY 'FILE OK'
               WHEN 35
                   CLOSE UNEMPLOYMENT-CLAIMS-FILE
                   OPEN OUTPUT UNEMPLOYMENT-CLAIMS-FILE
                   IF NOT UNEMPLOYMENT-FILE-OK THEN
                       MOVE 'Y'            TO WS-FILE-OPEN-ERROR-SW
                       DISPLAY 'UNEMPLOYMENT FILE STATUS CODE: ',
                           UNEMPLOYMENT-FILE-STATUS
                   ELSE
                       CLOSE UNEMPLOYMENT-CLAIMS-FILE
                       OPEN I-O UNEMPLOYMENT-CLAIMS-FILE
                   END-IF
                   WHEN OTHER
                       MOVE 'Y'            TO WS-FILE-OPEN-ERROR-SW
                       DISPLAY 'UNEMPLOYMENT FILE STATUS CODE: ',
                           UNEMPLOYMENT-FILE-STATUS
           END-EVALUATE.
      *---------------------------------------------------------------*
       2000-WRITING-VSAM.
      *---------------------------------------------------------------*
           PERFORM 2100-CLEAN-RECORD.
           PERFORM 2200-WRITE-AGE-RECORD.
           PERFORM 2300-WRITE-ETHNIC-RECORD.
           PERFORM 2400-WRITE-INDUSTRY-RECORD.
           PERFORM 2500-WRITE-RACE-RECORD.
           PERFORM 2600-WRITE-GENDER-RECORD.
           ADD 1                       TO  WS-RECORD-COUNT.
      *---------------------------------------------------------------*
       2100-CLEAN-RECORD.
      *---------------------------------------------------------------*
      *     DISPLAY 'CLEAN RECORD'.
           MOVE ZEROES TO UNEMPLOYMENT-CLAIM
           MOVE "N/A" TO   EXIST OF RECORD-AGE,
                           EXIST OF RECORD-ETHNICITY
                           EXIST OF RECORD-GENDER,
                           EXIST OF RECORD-RACE,
                           EXIST OF RECORD-INDUSTRY.
      *---------------------------------------------------------------*
       2200-WRITE-AGE-RECORD.
      *---------------------------------------------------------------*
           READ CSV-AGE
               AT END
                   MOVE '10' TO CSV-AGE-STATUS
               NOT AT END
                   UNSTRING CSV-AGE-LINE
                       DELIMITED BY "," INTO RECORD-ID
                   READ UNEMPLOYMENT-CLAIMS-FILE.
                   IF  UNEMPLOYMENT-FILE-OK
                       PERFORM 2210-PARSE-CSV-AGE
                       REWRITE UNEMPLOYMENT-CLAIM

                   ELSE
                       PERFORM 2210-PARSE-CSV-AGE
                       WRITE UNEMPLOYMENT-CLAIM.
      *---------------------------------------------------------------*
       2210-PARSE-CSV-AGE.
      *---------------------------------------------------------------*
           MOVE 'AGE'   TO EXIST OF RECORD-AGE.
           UNSTRING CSV-AGE-LINE
               DELIMITED BY "," OR "/" OR SPACE INTO
                   RECORD-ID, DD, MM, YY, INA OF RECORD-AGE,
                   UNDER-22,
                   F-22-24,
                   F-25-34,
                   F-35-44,
                   F-45-54,
                   F-55-59,
                   F-60-64,
                   OVER-65 .
      *---------------------------------------------------------------*
       2300-WRITE-ETHNIC-RECORD.
      *---------------------------------------------------------------*
           READ CSV-ETHNICITY
               AT END
                   SET CSV-ETHNICITY-EOF TO TRUE
               NOT AT END
                   UNSTRING CSV-ETHNICITY-LINE
                       DELIMITED BY "," INTO RECORD-ID
                   READ UNEMPLOYMENT-CLAIMS-FILE.
                   IF UNEMPLOYMENT-FILE-STATUS = '00'
                       PERFORM 2310-PARSE-CSV-ETHNICITY
                       REWRITE UNEMPLOYMENT-CLAIM
                   ELSE
                       PERFORM 2310-PARSE-CSV-ETHNICITY
                       WRITE UNEMPLOYMENT-CLAIM.
      *---------------------------------------------------------------*
       2310-PARSE-CSV-ETHNICITY.
      *---------------------------------------------------------------*
           MOVE 'ETH'   TO EXIST OF RECORD-ETHNICITY.
           UNSTRING CSV-ETHNICITY-LINE
               DELIMITED BY "," OR "/" OR SPACE INTO
                   RECORD-ID, DD, MM, YY, INA OF RECORD-ETHNICITY,
                   LATINO-HISPANIC,
                   NOT-LATINO-HISPANIC .
      *---------------------------------------------------------------*
       2400-WRITE-INDUSTRY-RECORD.
      *---------------------------------------------------------------*
           READ CSV-INDUSTRY
               AT END
                   SET CSV-INDUSTRY-EOF TO TRUE
               NOT AT END
                   UNSTRING CSV-INDUSTRY-LINE
                       DELIMITED BY "," INTO RECORD-ID
                   READ UNEMPLOYMENT-CLAIMS-FILE.
           IF  UNEMPLOYMENT-FILE-STATUS = '00'
                   PERFORM 2410-PARSE-CSV-INDUSTRY
                   REWRITE UNEMPLOYMENT-CLAIM
           ELSE
               PERFORM 2410-PARSE-CSV-INDUSTRY
                   WRITE UNEMPLOYMENT-CLAIM.
      *---------------------------------------------------------------*
       2410-PARSE-CSV-INDUSTRY.
      *---------------------------------------------------------------*
           MOVE 'IND' TO EXIST OF RECORD-INDUSTRY.
           UNSTRING CSV-INDUSTRY-LINE
               DELIMITED BY "," OR "/" OR SPACE INTO
                   RECORD-ID, DD, MM, YY, INA OF RECORD-INDUSTRY,
                   WHOLESALE-TRADE,
                   TRANSPORTATION-WAREHOUSE,
                   CONSTRUCTION,
                   FINANCE-INSURANCE,
                   MANUFACTURING,
                   AGRI-FOR-FISH-HUNT,
                   PUBLIC-ADMIN,
                   UTILITIES,
                   ACCOM-FOOD-SERVICES,
                   INFORMATION,
                   PROF-SCIENTIF-TECH,
                   REAL-ESTATE,
                   OTHER-SERVICES,
                   MANAGEMENT-COMP,
                   EDUCATIONAL-SERVICES,
                   MINING,
                   HEALTH-CARE-SOCIAL-ASSIS,
                   ARTS-ENTERTAINMENT,
                   ADMIN-SUPPORT-WASTE-MGMT,
                   RETAIL-TRADE .
      *---------------------------------------------------------------*
       2500-WRITE-RACE-RECORD.
      *---------------------------------------------------------------*
           READ CSV-RACE
               AT END
                   SET CSV-RACE-EOF TO TRUE
               NOT AT END
                   UNSTRING CSV-RACE-LINE
                       DELIMITED BY "," INTO RECORD-ID
                   READ UNEMPLOYMENT-CLAIMS-FILE.
                   IF UNEMPLOYMENT-FILE-STATUS = '00'
                       PERFORM 2510-PARSE-CSV-RACE
                       REWRITE UNEMPLOYMENT-CLAIM
                   ELSE
                       PERFORM 2510-PARSE-CSV-RACE
                       WRITE UNEMPLOYMENT-CLAIM.
      *---------------------------------------------------------------*
       2510-PARSE-CSV-RACE.
      *---------------------------------------------------------------*
           MOVE 'RCE'   TO EXIST OF RECORD-RACE.
           UNSTRING CSV-RACE-LINE
               DELIMITED BY "," OR "/" OR SPACE INTO
                   RECORD-ID, DD, MM, YY, INA OF RECORD-RACE,
                   WHITE,
                   ASIAN,
                   AFRICAN-AMERICAN,
                   NATIVE-AMERICAN-ALASKAN,
                   NATIVE-HAWAIAN-PACIFIC .
      *---------------------------------------------------------------*
       2600-WRITE-GENDER-RECORD.
      *---------------------------------------------------------------*
           READ CSV-GENDER
               AT END
                   SET CSV-GENDER-EOF TO TRUE
               NOT AT END
                   UNSTRING CSV-GENDER-LINE
                       DELIMITED BY "," INTO RECORD-ID
                   READ UNEMPLOYMENT-CLAIMS-FILE.
                   IF UNEMPLOYMENT-FILE-STATUS = '00'
                       PERFORM 2610-PARSE-CSV-GENDER
                       REWRITE UNEMPLOYMENT-CLAIM
                   ELSE
                       PERFORM 2610-PARSE-CSV-GENDER
                       WRITE UNEMPLOYMENT-CLAIM.
      *---------------------------------------------------------------*
       2610-PARSE-CSV-GENDER.
      *---------------------------------------------------------------*
           MOVE 'GND'   TO EXIST OF RECORD-GENDER.
           UNSTRING CSV-GENDER-LINE
               DELIMITED BY "," OR "/" OR SPACE INTO
                   RECORD-ID, DD, MM, YY, INA OF RECORD-GENDER,
                   MALE,
                   FEMALE .
      *---------------------------------------------------------------*
       3000-CLOSE-DATA-FILES.
      *---------------------------------------------------------------*
           CLOSE   CSV-AGE,
                   CSV-ETHNICITY,
                   CSV-GENDER,
                   CSV-INDUSTRY,
                   CSV-RACE,
                   UNEMPLOYMENT-CLAIMS-FILE .
      *---------------------------------------------------------------*
       8000-READ-HEADERS.
      *---------------------------------------------------------------*
           READ CSV-AGE
           END-READ
           READ CSV-ETHNICITY
           END-READ
           READ CSV-INDUSTRY
           END-READ
           READ CSV-GENDER
           END-READ
           READ CSV-RACE
           END-READ.

