       IDENTIFICATION DIVISION.
       PROGRAM-ID.  UNEMQUE.
       AUTHOR. EDWIN ACKERMAN.
       INSTALLATION. MORONS LOSERS AND BIMBOS.
       DATE-WRITTEN. 10/05/2020.
       DATE-COMPILED.
      *===============================================================*
       ENVIRONMENT DIVISION.
      *---------------------------------------------------------------*
       CONFIGURATION SECTION.
      *---------------------------------------------------------------*
       SOURCE-COMPUTER. IBM-3081.
       OBJECT-COMPUTER. IBM-3081.
      *---------------------------------------------------------------*
       INPUT-OUTPUT SECTION.
      *---------------------------------------------------------------*
       FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN TO INDD.
           SELECT PRINT-FILE ASSIGN TO PRTLINE.
      *===============================================================*
       DATA DIVISION.
      *---------------------------------------------------------------*
       FILE SECTION.
      *---------------------------------------------------------------*
       FD  INPUT-FILE
            LABEL RECORDS ARE STANDARD
            DATA RECORD IS UNEM-CLAIM-ID
            RECORD CONTAINS 3000 CHARACTERS
            RECORDING MODE IS F
            BLOCK CONTAINS 1 RECORDS.
       01  U-STRUCT.
           05  UNEM-CLAIM-ID    PIC X(8) OCCURS 10 TIMES.
      *---------------------------------------------------------------*
       FD  PRINT-FILE
           RECORDING MODE IS F.
       01  PRINT-RECORD.
           05  PRINT-LINE                  PIC X(132).
      *---------------------------------------------------------------*
       WORKING-STORAGE SECTION.
      *---------------------------------------------------------------*
           COPY UNEMT.
      *---------------------------------------------------------------*
           COPY UNEMFORM.
      *---------------------------------------------------------------*
           COPY UNEMRPT.
      *---------------------------------------------------------------*
       01  REPORT-LINES.
      *---------------------------------------------------------------*
           05  NEXT-REPORT-LINE            PIC X(132) VALUE SPACE.
      *---------------------------------------------------------------*
      *---------------------------------------------------------------*
       01 DETAIL-LINES.
      *---------------------------------------------------------------*
           05  DETAIL-LINE-1.
               10  FILLER  PIC X(132).
      *---------------------------------------------------------------*
       01  WS-SWITCHES-SUBSCRIPTS-MISC.
      *---------------------------------------------------------------*
           05  END-OF-FILE-SW              PIC X VALUE 'N'.
               88  END-OF-FILE                   VALUE 'Y'.
           05  INDEX-1                     PIC 999 VALUE 0.
       COPY PRINTCTL.
      *===============================================================*
       PROCEDURE DIVISION.
      *---------------------------------------------------------------*
       0000-MAIN-PROCESSING.
      *---------------------------------------------------------------*
           PERFORM 1000-OPEN-FILES.
           PERFORM 8000-READ-UNEMP-FILE.
           PERFORM 2000-PROCESS-UNEMP-FILE
               UNTIL END-OF-FILE.
           PERFORM 3000-CLOSE-FILES.
           GOBACK.
      *---------------------------------------------------------------*
       1000-OPEN-FILES.
      *---------------------------------------------------------------*
           OPEN INPUT INPUT-FILE.
           OPEN OUTPUT PRINT-FILE.
           MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE-DATA.
           MOVE WS-CURRENT-YEAR  TO UL1-YY.
           MOVE WS-CURRENT-MONTH TO UL1-MM.
           MOVE WS-CURRENT-DAY   TO UL1-DD.
           MOVE 30 TO LINES-ON-PAGE.
      *---------------------------------------------------------------*
       2000-PROCESS-UNEMP-FILE.
      *---------------------------------------------------------------*
           PERFORM 2100-PROGRAM-OPTIONS.
           CALL 'UNEMREAD' USING RECORD-TABLE-SIZE,
                                 RECORD-TABLE-INDEX,
                                 PROGRAM-ACTION,
                                 RECORD-TABLE.
           IF RECORD-TABLE-SIZE > 0 THEN
               PERFORM 2200-PRINT-UNEM-REPORT VARYING RECORD-TABLE-INDEX
                  FROM 1 BY 1
                  UNTIL RECORD-TABLE-INDEX > RECORD-TABLE-SIZE
           ELSE
               DISPLAY UNEM-CLAIM-ID (1), ' NOT FOUND.'
           END-IF.
           PERFORM 8000-READ-UNEMP-FILE.
      *---------------------------------------------------------------*
       2100-PROGRAM-OPTIONS.
      *---------------------------------------------------------------*
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
      *---------------------------------------------------------------*
       2200-PRINT-UNEM-REPORT.
      *---------------------------------------------------------------*
           MOVE CORRESPONDING
               TBL-UNEMPLOYMENT-CLAIM (RECORD-TABLE-INDEX)
               TO FORMAT-UNEMPLOYMENT-CLAIM.
           PERFORM  2210-MOVE-UNEMPLOYMENT-FIELDS.
           PERFORM  2220-PRINT-UNEMPLOYMENT-RPT VARYING INDEX-1
                  FROM 2 BY 1
                  UNTIL INDEX-1 > 30.
      *---------------------------------------------------------------*
       2210-MOVE-UNEMPLOYMENT-FIELDS.
      *---------------------------------------------------------------*
           MOVE RECORD-ID  IN  FORMAT-UNEMPLOYMENT-CLAIM
                           TO UL1-RECORD-ID.
           MOVE INA      IN RECORD-AGE IN  FORMAT-UNEMPLOYMENT-CLAIM
                         TO UL5-INA.
           MOVE UNDER-22 IN RECORD-AGE IN  FORMAT-UNEMPLOYMENT-CLAIM
                         TO UL5-UNDER-22.
           MOVE F-22-24  IN RECORD-AGE IN  FORMAT-UNEMPLOYMENT-CLAIM
                         TO UL5-F-22-24.
           MOVE F-25-34  IN RECORD-AGE IN  FORMAT-UNEMPLOYMENT-CLAIM
                         TO UL5-F-25-34.
           MOVE F-35-44  IN RECORD-AGE IN  FORMAT-UNEMPLOYMENT-CLAIM
                         TO UL5-F-35-44.
           MOVE F-45-54  IN RECORD-AGE IN  FORMAT-UNEMPLOYMENT-CLAIM
                         TO UL7-F-45-54.
           MOVE F-55-59  IN RECORD-AGE IN  FORMAT-UNEMPLOYMENT-CLAIM
                         TO UL7-F-55-59.
           MOVE F-60-64  IN RECORD-AGE IN  FORMAT-UNEMPLOYMENT-CLAIM
                         TO UL7-F-60-64.
           MOVE OVER-65  IN RECORD-AGE IN  FORMAT-UNEMPLOYMENT-CLAIM
                         TO UL7-F-OVER-65.
           MOVE INA                IN  RECORD-ETHNICITY
                                   IN  FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL11-INA.
           MOVE LATINO-HISPANIC    IN  RECORD-ETHNICITY
                                   IN  FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL11-LAT-HIS.
           MOVE NOT-LATINO-HISPANIC    IN  RECORD-ETHNICITY
                                       IN  FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL11-NOT-LAT-HIS.
           MOVE INA                IN RECORD-INDUSTRY
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL15-INA.
           MOVE WHOLESALE-TRADE    IN RECORD-INDUSTRY
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL15-WHOLST.
           MOVE TRANSPORTATION-WAREHOUSE     IN RECORD-INDUSTRY
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL15-TRANSWR.
           MOVE CONSTRUCTION       IN RECORD-INDUSTRY
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL15-CONSTR.
           MOVE FINANCE-INSURANCE  IN RECORD-INDUSTRY
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL15-FIN-INS.
           MOVE MANUFACTURING      IN RECORD-INDUSTRY
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL15-MANUFAC.
           MOVE AGRI-FOR-FISH-HUNT IN RECORD-INDUSTRY
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL15-AG-FIS-HUN.
           MOVE PUBLIC-ADMIN       IN RECORD-INDUSTRY
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL15-PUBLIC-AD.
           MOVE UTILITIES          IN RECORD-INDUSTRY
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL15-UTILS.
           MOVE ACCOM-FOOD-SERVICES IN RECORD-INDUSTRY
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL15-ACOM-FOOD.
           MOVE INFORMATION        IN RECORD-INDUSTRY
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL15-INFORM.
           MOVE PROF-SCIENTIF-TECH IN RECORD-INDUSTRY
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL19-PR-SC-T.
           MOVE REAL-ESTATE        IN RECORD-INDUSTRY
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL19-RE-STATE.
           MOVE OTHER-SERVICES     IN RECORD-INDUSTRY
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL19-OTHER-S.
           MOVE MANAGEMENT-COMP    IN RECORD-INDUSTRY
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL19-MANAG-C.
           MOVE EDUCATIONAL-SERVICES IN RECORD-INDUSTRY
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL19-EDUC-S.
           MOVE MINING             IN RECORD-INDUSTRY
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL19-MINING.
           MOVE HEALTH-CARE-SOCIAL-ASSIS IN RECORD-INDUSTRY
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL21-HEALTH.
           MOVE ARTS-ENTERTAINMENT IN RECORD-INDUSTRY
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL21-ARTS-EN.
           MOVE ADMIN-SUPPORT-WASTE-MGMT IN RECORD-INDUSTRY
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL21-WASTE-MAG.
           MOVE RETAIL-TRADE       IN RECORD-INDUSTRY
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL21-RETAIL.
           MOVE INA                IN RECORD-RACE
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL25-INA.
           MOVE WHITE              IN RECORD-RACE
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL25-WHITE.
           MOVE ASIAN              IN RECORD-RACE
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL25-ASIAN.
           MOVE AFRICAN-AMERICAN   IN RECORD-RACE
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL25-AF-AM.
           MOVE NATIVE-AMERICAN-ALASKAN IN RECORD-RACE
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL25-NAT-AL.
           MOVE NATIVE-HAWAIAN-PACIFIC IN RECORD-RACE
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL25-NAT-HAW-P.
           MOVE INA                IN RECORD-GENDER
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL29-INA.
           MOVE MALE               IN RECORD-GENDER
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL29-MALE.
           MOVE FEMALE             IN RECORD-GENDER
                                   IN FORMAT-UNEMPLOYMENT-CLAIM
                                   TO UL29-FEMALE.
      *---------------------------------------------------------------*
       2220-PRINT-UNEMPLOYMENT-RPT.
      *---------------------------------------------------------------*
           MOVE TABLE-LINE(INDEX-1)        TO NEXT-REPORT-LINE.
           PERFORM 9000-PRINT-REPORT-LINE.
      *---------------------------------------------------------------*
       3000-CLOSE-FILES.
      *---------------------------------------------------------------*
           CLOSE INPUT-FILE.
           CLOSE PRINT-FILE.
      *---------------------------------------------------------------*
       8000-READ-UNEMP-FILE.
      *---------------------------------------------------------------*
           READ INPUT-FILE
               AT END MOVE 'Y' TO END-OF-FILE-SW.
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
      *     MOVE PAGE-COUNT                 TO HL1-PAGE-COUNT.
           MOVE UL-REPORT-1                TO PRINT-LINE.
           PERFORM 9110-WRITE-TOP-OF-PAGE.
           ADD  1                          TO PAGE-COUNT.
           MOVE 1                          TO LINE-SPACEING.
           MOVE 2                          TO LINE-COUNT.
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
           MOVE SPACE                      TO PRINT-LINE.
           ADD  1                          TO LINE-COUNT.
           MOVE 1                          TO LINE-SPACEING.
