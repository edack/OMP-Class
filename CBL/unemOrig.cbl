      *****************************************************************
      * PROGRAM NAME:    UNEM
      * ORIGINAL AUTHOR: DAVID QUINTERO
      *
      * MAINTENENCE LOG
      * DATE      AUTHOR        MAINTENANCE REQUIREMENT
      * --------- ------------  ---------------------------------------
      * 05/05/20 DAVID QUINTERO  CREATED FOR COBOL CLASS
      *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  UNEM.
       AUTHOR. DAVID QUINTERO.
       INSTALLATION. COBOL DEVELOPMENT CENTER.
       DATE-WRITTEN. 05/05/20.
       DATE-COMPILED. 05/05/20.
       SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
      *****************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-3081.
       OBJECT-COMPUTER. IBM-3081.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CSV-AGE ASSIGN TO CSVAGE
             ORGANIZATION IS SEQUENTIAL
             ACCESS MODE  IS SEQUENTIAL
             FILE STATUS  IS CSV-AGE-STATUS.
      *
           SELECT CSV-ETHNICITY ASSIGN TO CSVETH
             ORGANIZATION IS SEQUENTIAL
             ACCESS MODE  IS SEQUENTIAL
             FILE STATUS  IS CSV-ETHNICITY-STATUS.
      *
           SELECT CSV-INDUSTRY ASSIGN TO CSVIND
             ORGANIZATION IS SEQUENTIAL
             ACCESS MODE  IS SEQUENTIAL
             FILE STATUS  IS CSV-INDUSTRY-STATUS.
      *
           SELECT CSV-RACE ASSIGN TO CSVRAC
             ORGANIZATION IS SEQUENTIAL
             ACCESS MODE  IS SEQUENTIAL
             FILE STATUS  IS CSV-RACE-STATUS.
      *
           SELECT CSV-GENDER ASSIGN TO CSVGEN
             ORGANIZATION IS SEQUENTIAL
             ACCESS MODE  IS SEQUENTIAL
             FILE STATUS  IS CSV-GENDER-STATUS.
      *
           SELECT UNEMPLOYMENT-CLAIMS-FILE ASSIGN TO UNDD
             ORGANIZATION IS INDEXED
             ACCESS MODE  IS DYNAMIC
             RECORD KEY   IS RECORD-ID
             FILE STATUS  IS UNEMPLOYMENT-FILE-STATUS.
      *****************************************************************
      *****************************************************************
       DATA DIVISION.
       FILE SECTION.
       FD  CSV-AGE
           RECORDING MODE IS F
           LABEL RECORDS ARE STANDARD
           DATA RECORD IS CSV-AGE-LINE
           RECORD CONTAINS 3000 CHARACTERS
           BLOCK CONTAINS 0 RECORDS.
       01  CSV-AGE-LINE    PIC X(3000).
      *
       FD  CSV-ETHNICITY
           RECORDING MODE IS F
           LABEL RECORDS ARE STANDARD
           DATA RECORD IS CSV-ETHNICITY-LINE
           RECORD CONTAINS 3000 CHARACTERS
           BLOCK CONTAINS 0 RECORDS.
       01  CSV-ETHNICITY-LINE    PIC X(3000).
      *
       FD  CSV-INDUSTRY
           RECORDING MODE IS F
           LABEL RECORDS ARE STANDARD
           DATA RECORD IS CSV-INDUSTRY-LINE
           RECORD CONTAINS 3000 CHARACTERS
           BLOCK CONTAINS 0 RECORDS.
       01  CSV-INDUSTRY-LINE    PIC X(3000).
      *
       FD  CSV-RACE
           RECORDING MODE IS F
           LABEL RECORDS ARE STANDARD
           DATA RECORD IS CSV-RACE-LINE
           RECORD CONTAINS 3000 CHARACTERS
           BLOCK CONTAINS 0 RECORDS.
       01  CSV-RACE-LINE    PIC X(3000).
      *
       FD  CSV-GENDER
           RECORDING MODE IS F
           LABEL RECORDS ARE STANDARD
           DATA RECORD IS CSV-GENDER-LINE
           RECORD CONTAINS 3000 CHARACTERS
           BLOCK CONTAINS 0 RECORDS.
       01  CSV-GENDER-LINE    PIC X(3000).
      *
       FD  UNEMPLOYMENT-CLAIMS-FILE
            DATA RECORD IS UNEMPLOYMENT-CLAIM.
      *****************************************************************
      *          EACH UNEMPLOYMENT CLAIM IS 268 CHARACTERS LONG
      *****************************************************************
           COPY UNEMC.
      **
      **
       WORKING-STORAGE SECTION.
      *
       01  CSV-AGE-STATUS           PIC 99.
           88  CSV-AGE-OK           VALUE 00.
           88  CSV-AGE-EOF          VALUE 01.
       01  CSV-ETHNICITY-STATUS     PIC 99.
           88  CSV-ETHNICITY-OK     VALUE 00.
           88  CSV-ETHNICITY-EOF    VALUE 01.
       01  CSV-INDUSTRY-STATUS      PIC 99.
           88  CSV-INDUSTRY-OK      VALUE 00.
           88  CSV-INDUSTRY-EOF     VALUE 01.
       01  CSV-RACE-STATUS          PIC 99.
           88  CSV-RACE-OK          VALUE 00.
           88  CSV-RACE-EOF         VALUE 01.
       01  CSV-GENDER-STATUS        PIC 99.
           88  CSV-GENDER-OK        VALUE 00.
           88  CSV-GENDER-EOF       VALUE 01.
      *
       01  UNEMPLOYMENT-FILE-STATUS PIC 99.
           88 UNEMPLOYMENT-FILE-OK               VALUE 00.
           88 UNEMPLOYMENT-FILE-MAY-EXIST        VALUE 35.
      *****************************************************************
      *****************************************************************
       PROCEDURE DIVISION.
      *****************************************************************
      *                          MAIN SECTION
      *****************************************************************
       MAIN SECTION.
      **
      **
       MAIN-PARAGRAPH.
           PERFORM FILE-MANAGEMENT
           PERFORM WRITING-VSAM UNTIL CSV-GENDER-EOF.
      *
      *
       PROGRAM-END.
           CLOSE CSV-AGE, CSV-ETHNICITY, CSV-GENDER, CSV-INDUSTRY,
               CSV-RACE
           CLOSE UNEMPLOYMENT-CLAIMS-FILE
           GOBACK.
      **
      **
      *****************************************************************
      *                    FILE MANAGEMENT SECTION
      *****************************************************************
       FILE-MANAGEMENT SECTION.
      **
      **
       OPEN-CSV-FILES.
           OPEN INPUT CSV-AGE, CSV-ETHNICITY, CSV-GENDER, CSV-INDUSTRY,
               CSV-RACE
      *
           IF NOT CSV-AGE-OK
               DISPLAY 'CSV AGE FILE: ', CSV-AGE-STATUS
               GO TO PROGRAM-END
           END-IF
      *
           IF NOT CSV-ETHNICITY-OK
               DISPLAY 'CSV ETHNICITY FILE: ', CSV-ETHNICITY-STATUS
               GO TO PROGRAM-END
           END-IF
      *
           IF NOT CSV-INDUSTRY-OK
               DISPLAY 'CSV INDUSTRY FILE: ', CSV-INDUSTRY-STATUS
               GO TO PROGRAM-END
           END-IF
      *
           IF NOT CSV-RACE-OK
               DISPLAY 'CSV RACE FILE: ', CSV-RACE-STATUS
               GO TO PROGRAM-END
           END-IF
      *
           IF NOT CSV-GENDER-OK
               DISPLAY 'CSV AGE FILE ERROR: ', CSV-GENDER-STATUS
               GO TO PROGRAM-END
           END-IF.
      *
      *
       OPEN-UNEMPLOYMENT-CLAIMS-FILE.
           OPEN I-O UNEMPLOYMENT-CLAIMS-FILE
      *
           EVALUATE UNEMPLOYMENT-FILE-STATUS
             WHEN 00
               DISPLAY 'FILE OK'
      *
             WHEN 35
               CLOSE UNEMPLOYMENT-CLAIMS-FILE
      *
               OPEN OUTPUT UNEMPLOYMENT-CLAIMS-FILE
      *
               IF NOT UNEMPLOYMENT-FILE-OK THEN
                  DISPLAY 'UNEMPLOYMENT FILE STATUS CODE: ',
                    UNEMPLOYMENT-FILE-STATUS
      *
                  GO TO PROGRAM-END
      *
               ELSE
                  CLOSE UNEMPLOYMENT-CLAIMS-FILE
                  OPEN I-O UNEMPLOYMENT-CLAIMS-FILE
               END-IF
      *
             WHEN OTHER
                DISPLAY 'UNEMPLOYMENT FILE STATUS CODE: ',
                    UNEMPLOYMENT-FILE-STATUS
      *
                GO TO PROGRAM-END
           END-EVALUATE.
      *
      *
       READ-HEADERS.
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
      **
      **
      *****************************************************************
      *                    WRITING-VSAM SECTION
      *****************************************************************
       WRITING-VSAM SECTION.
      **
      **
       CLEAN-RECORD.
           MOVE ZEROES TO UNEMPLOYMENT-CLAIM
           MOVE "N/A" TO EXIST OF RECORD-AGE, EXIST OF RECORD-ETHNICITY
               EXIST OF RECORD-GENDER, EXIST OF RECORD-RACE,
               EXIST OF RECORD-RACE.
      *
      *
       WRITE-AGE-RECORD.
           READ CSV-AGE
               AT END
                 SET CSV-AGE-EOF TO TRUE
      *
               NOT AT END
      *
                 UNSTRING CSV-AGE-LINE DELIMITED BY "," INTO RECORD-ID
                 END-UNSTRING
                 READ UNEMPLOYMENT-CLAIMS-FILE
                   INVALID KEY
      *
                    PERFORM PARSE-CSV-AGE
                    WRITE UNEMPLOYMENT-CLAIM END-WRITE
      *
                   NOT INVALID KEY
      *
                    PERFORM PARSE-CSV-AGE
                    REWRITE UNEMPLOYMENT-CLAIM END-REWRITE
      *
                 END-READ
      *
           END-READ.
      *
      *
       WRITE-ETHNIC-RECORD.
           PERFORM CLEAN-RECORD
      *
           READ CSV-ETHNICITY
               AT END
                 SET CSV-ETHNICITY-EOF TO TRUE
      *
               NOT AT END
      *
                 UNSTRING CSV-ETHNICITY-LINE
                   DELIMITED BY "," INTO RECORD-ID
                 END-UNSTRING
      *
                READ UNEMPLOYMENT-CLAIMS-FILE
                   INVALID KEY
      *
                    PERFORM PARSE-CSV-ETHNICITY
                    WRITE UNEMPLOYMENT-CLAIM END-WRITE
      *
                   NOT INVALID KEY
      *
                    PERFORM PARSE-CSV-ETHNICITY
                    REWRITE UNEMPLOYMENT-CLAIM END-REWRITE
      *
                 END-READ
      *
           END-READ.
      **
      **
       WRITE-INDUSTRY-RECORD.
           PERFORM CLEAN-RECORD
      *
           READ CSV-INDUSTRY
              AT END
                 SET CSV-INDUSTRY-EOF TO TRUE
      *
               NOT AT END
      *
                 UNSTRING CSV-INDUSTRY-LINE
                       DELIMITED BY "," INTO RECORD-ID
                 END-UNSTRING
      *
                 READ UNEMPLOYMENT-CLAIMS-FILE
                   INVALID KEY
      *
                     PERFORM PARSE-CSV-INDUSTRY
                     WRITE UNEMPLOYMENT-CLAIM END-WRITE
      *
                   NOT INVALID KEY
      *
                     PERFORM PARSE-CSV-INDUSTRY
                     REWRITE UNEMPLOYMENT-CLAIM END-REWRITE
                 END-READ
      *
           END-READ.
      *
      *
       WRITE-RACE-RECORD.
           PERFORM CLEAN-RECORD
           READ CSV-RACE
               AT END
      *
                 SET CSV-RACE-EOF TO TRUE
               NOT AT END
      *
                 UNSTRING CSV-RACE-LINE
                       DELIMITED BY "," INTO RECORD-ID
                 END-UNSTRING
                 READ UNEMPLOYMENT-CLAIMS-FILE
                   INVALID KEY
      *
                     PERFORM PARSE-CSV-RACE
                     WRITE UNEMPLOYMENT-CLAIM END-WRITE
      *
                   NOT INVALID KEY
      *
                     PERFORM PARSE-CSV-RACE
                     REWRITE UNEMPLOYMENT-CLAIM END-REWRITE
                 END-READ
      *
           END-READ.
      *
      *
       WRITE-GENDER-RECORD.
           PERFORM CLEAN-RECORD
           READ CSV-GENDER
               AT END
      *
                 SET CSV-GENDER-EOF TO TRUE
               NOT AT END
                 UNSTRING CSV-GENDER-LINE
                       DELIMITED BY "," INTO RECORD-ID
                 END-UNSTRING
      *
                 READ UNEMPLOYMENT-CLAIMS-FILE
                   INVALID KEY
      *
                     PERFORM PARSE-CSV-GENDER
                     WRITE UNEMPLOYMENT-CLAIM END-WRITE
      *
                   NOT INVALID KEY
      *
                     PERFORM PARSE-CSV-GENDER
                     REWRITE UNEMPLOYMENT-CLAIM END-REWRITE
                 END-READ
      *
           END-READ.
      **
      **
      *****************************************************************
      *                    UNSTRINGS SECTION
      *****************************************************************
       UNSTRINGS SECTION.
      *
      *
       PARSE-CSV-AGE.
           MOVE 'T/T'   TO EXIST OF RECORD-AGE
      *
           UNSTRING CSV-AGE-LINE
             DELIMITED BY "," OR "/" OR SPACE INTO
               RECORD-ID, DD, MM, YY, INA OF RECORD-AGE,
               UNDER-22, F-22-24, F-25-34, F-35-44, F-45-54,
               F-55-59, F-60-64, OVER-65
           END-UNSTRING.
      *
      *
       PARSE-CSV-ETHNICITY.
           MOVE 'T/T'   TO EXIST OF RECORD-ETHNICITY
      *
           UNSTRING CSV-ETHNICITY-LINE
             DELIMITED BY "," OR "/" OR SPACE INTO
                RECORD-ID, DD, MM, YY, INA OF RECORD-ETHNICITY,
                LATINO-HISPANIC, NOT-LATINO-HISPANIC
           END-UNSTRING.
      *
      *
       PARSE-CSV-INDUSTRY.
           MOVE 'T/T' TO EXIST OF RECORD-INDUSTRY
      *
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
              RETAIL-TRADE
           END-UNSTRING.
      *
      *
       PARSE-CSV-RACE.
           MOVE 'T/T'   TO EXIST OF RECORD-RACE
      *
           UNSTRING CSV-RACE-LINE
             DELIMITED BY "," OR "/" OR SPACE INTO
               RECORD-ID, DD, MM, YY, INA OF RECORD-RACE,
               WHITE, ASIAN, AFRICAN-AMERICAN
               NATIVE-AMERICAN-ALASKAN,
               NATIVE-HAWAIAN-PACIFIC
           END-UNSTRING.
      *
      *
      *
       PARSE-CSV-GENDER.
           MOVE 'T/T'   TO EXIST OF RECORD-GENDER
      *
           UNSTRING CSV-GENDER-LINE
             DELIMITED BY "," OR "/" OR SPACE INTO
              RECORD-ID, DD, MM, YY, INA OF RECORD-GENDER,
              MALE, FEMALE
           END-UNSTRING.
      *
