       01  UNEMPLOYMENT-LINES.
           05  UL-REPORT-1.
               10  FILLER PIC X(20) VALUE 'UNEMPLOYMENT DATA - '.
               10  UL1-RECORD-ID     PIC X(08).
               10  FILLER PIC X(12) VALUE '      DATE: '.
               10  UL1-DATE.
                   15  UL1-MM        PIC X(02).
                   15  FILLER PIC X(01) VALUE '/'.
                   15  UL1-DD        PIC X(02).
                   15  FILLER PIC X(01) VALUE '/'.
                   15  UL1-YY        PIC X(04).
           05  UL-REPORT-2.
               10  FILLER PIC X(79) VALUE ALL '-'.
           05  UL-REPORT-3.
               10  FILLER PIC X(35) VALUE SPACE.
               10  FILLER PIC X(05) VALUE 'A G E'.
               10  FILLER PIC X(40) VALUE SPACE.
           05  UL-REPORT-4.
               10  FILLER PIC X(14) VALUE 'N/A           '.
               10  FILLER PIC X(14) VALUE 'INA           '.
               10  FILLER PIC X(14) VALUE ' UNDER 22     '.
               10  FILLER PIC X(14) VALUE '[22 - 24]     '.
               10  FILLER PIC X(14) VALUE '[25 - 34]     '.
               10  FILLER PIC X(14) VALUE '[35 - 44]     '.
           05  UL-REPORT-5.
               10  FILLER PIC X(10) VALUE 'T/T       '.
               10  UL5-INA           PIC ZZZ,ZZ9.
               10  FILLER PIC X(13) VALUE SPACE.
               10  UL5-UNDER-22      PIC ZZZ,ZZ9.
               10  FILLER PIC X(07) VALUE SPACE.
               10  UL5-F-22-24       PIC ZZZ,ZZ9.
               10  FILLER PIC X(07) VALUE SPACE.
               10  UL5-F-25-34       PIC ZZZ,ZZ9.
               10  FILLER PIC X(07) VALUE SPACE.
               10  UL5-F-35-44       PIC ZZZ,ZZ9.
           05  UL-REPORT-6.
               10  FILLER PIC X(14) VALUE '     [45 - 55]'.
               10  FILLER PIC X(14) VALUE '     [55 - 59]'.
               10  FILLER PIC X(14) VALUE '     [60 - 64]'.
               10  FILLER PIC X(14) VALUE '       OVER 65'.
               10  FILLER PIC X(14) VALUE SPACE.
           05  UL-REPORT-7.
               10  FILLER PIC X(07) VALUE SPACE.
               10  UL7-F-45-54       PIC ZZZ,ZZ9.
               10  FILLER PIC X(07) VALUE SPACE.
               10  UL7-F-55-59       PIC ZZZ,ZZ9.
               10  FILLER PIC X(07) VALUE SPACE.
               10  UL7-F-60-64       PIC ZZZ,ZZ9.
               10  FILLER PIC X(07) VALUE SPACE.
               10  UL7-F-OVER-65     PIC ZZZ,ZZ9.
           05  UL-REPORT-8.
               10  FILLER PIC X(80) VALUE ALL '-'.
           05  UL-REPORT-9.
               10  FILLER PIC X(32) VALUE SPACE.
               10  FILLER PIC X(15) VALUE 'H I S P A N I C'.
               10  FILLER PIC X(33) VALUE SPACE.
           05  UL-REPORT-10.
               10  FILLER PIC X(14) VALUE 'EXIST         '.
               10  FILLER PIC X(14) VALUE '   INA        '.
               10  FILLER PIC X(14) VALUE 'LAT-HIS       '.
               10  FILLER PIC X(14) VALUE 'NOT-LAT-HIS   '.
               10  FILLER PIC X(28) VALUE SPACE.
           05  UL-REPORT-11.
               10  UL11-EXIST        PIC X(07) VALUE 'T/T    '.
               10  FILLER PIC X(06) VALUE SPACE.
               10  UL11-INA          PIC ZZZ,ZZ9.
               10  FILLER PIC X(08) VALUE SPACE.
               10  UL11-LAT-HIS      PIC ZZZ,ZZ9.
               10  FILLER PIC X(11) VALUE SPACE.
               10  UL11-NOT-LAT-HIS  PIC ZZZ,ZZ9.
               10  FILLER           PIC X(10) VALUE SPACE.
           05  UL-REPORT-12.
               10  FILLER PIC X(80) VALUE ALL '-'.
           05  UL-REPORT-13.
               10  FILLER PIC X(32) VALUE SPACE.
               10  FILLER PIC X(15) VALUE 'I N D U S T R Y'.
               10  FILLER PIC X(33) VALUE SPACE.
           05  UL-REPORT-14.
               10  FILLER PIC X(14) VALUE '    INA       '.
               10  FILLER PIC X(14) VALUE ' WHOLST       '.
               10  FILLER PIC X(14) VALUE 'TRANSWR       '.
               10  FILLER PIC X(14) VALUE ' CONSTR       '.
               10  FILLER PIC X(14) VALUE 'FIN-INS       '.
               10  FILLER PIC X(12) VALUE 'MANUFAC     '.
           05  UL-REPORT-15.
               10  UL15-INA                PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL15-WHOLST             PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL15-TRANSWR            PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL15-CONSTR             PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL15-FIN-INS            PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL15-MANUFAC            PIC ZZZ,ZZ9.
           05  UL-REPORT-16.
               10  FILLER PIC X(14) VALUE '    AG-FIS-HUN'.
               10  FILLER PIC X(14) VALUE '     PUBLIC-AD'.
               10  FILLER PIC X(14) VALUE '         UTILS'.
               10  FILLER PIC X(14) VALUE '     ACOM-FOOD'.
               10  FILLER PIC X(14) VALUE '        INFORM'.
               10  FILLER PIC X(12) VALUE '            '.
           05  UL-REPORT-17.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL15-AG-FIS-HUN         PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL15-PUBLIC-AD          PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL15-UTILS              PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL15-ACOM-FOOD          PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL15-INFORM             PIC ZZZ,ZZ9.
           05  UL-REPORT-18.
               10  FILLER PIC X(14) VALUE 'PR-ST-T      R'.
               10  FILLER PIC X(14) VALUE 'E-STATE       '.
               10  FILLER PIC X(14) VALUE 'OTHER-S       '.
               10  FILLER PIC X(14) VALUE 'MANAG-C       '.
               10  FILLER PIC X(14) VALUE ' EDUC-S       '.
               10  FILLER PIC X(12) VALUE ' MINING    '.
           05  UL-REPORT-19.
               10  UL19-PR-SC-T            PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL19-RE-STATE           PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL19-OTHER-S            PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL19-MANAG-C            PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL19-EDUC-S             PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL19-MINING             PIC ZZZ,ZZ9.
           05  UL-REPORT-20.
               10  FILLER PIC X(14) VALUE '       HEALTHN'.
               10  FILLER PIC X(14) VALUE '       ARTS-EN'.
               10  FILLER PIC X(14) VALUE '     WASTE-MAG'.
               10  FILLER PIC X(14) VALUE '        RETAIL'.
               10  FILLER PIC X(14) VALUE '              '.
               10  FILLER PIC X(12) VALUE '            '.
           05  UL-REPORT-21.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL21-HEALTH             PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL21-ARTS-EN            PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL21-WASTE-MAG          PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL21-RETAIL             PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(14) VALUE SPACE.
           05  UL-REPORT-22                PIC X(80) VALUE ALL '-'.
           05  UL-REPORT-23.
               10  FILLER                  PIC X(31) VALUE SPACE.
               10  FILLER  PIC X(17) VALUE 'E T H N I C I T Y'.
               10  FILLER                  PIC X(32) VALUE SPACE.
           05  UL-REPORT-24.
               10  FILLER PIC X(14) VALUE '    INA       '.
               10  FILLER PIC X(14) VALUE '  WHITE       '.
               10  FILLER PIC X(14) VALUE '  ASIAN       '.
               10  FILLER PIC X(14) VALUE '  AF-AM       '.
               10  FILLER PIC X(14) VALUE ' NAT-AL       '.
               10  FILLER PIC X(12) VALUE 'NAT-HAW-PA  '.
           05  UL-REPORT-25.
               10  UL25-INA                PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL25-WHITE              PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL25-ASIAN              PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL25-AF-AM              PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL25-NAT-AL             PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL25-NAT-HAW-P          PIC ZZZ,ZZ9.
           05  UL-REPORT-26.
               10  FILLER                  PIC X(80) VALUE ALL '-'.
           05  UL-REPORT-27.
               10  FILLER                  PIC X(37) VALUE SPACE.
               10  FILLER PIC X(05) VALUE 'S E X'.
               10  FILLER                  PIC X(38) VALUE SPACE.
           05  UL-REPORT-28.
               10  FILLER PIC X(14) VALUE 'N/A           '.
               10  FILLER PIC X(14) VALUE '    INA       '.
               10  FILLER PIC X(14) VALUE '   MALE       '.
               10  FILLER PIC X(14) VALUE ' FEMALE       '.
               10  FILLER PIC X(14) VALUE '              '.
               10  FILLER PIC X(12) VALUE '            '.
           05  UL-REPORT-29.
               10  UL29-FILLER             PIC X(07) VALUE 'T/T    '.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL29-INA                PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL29-MALE               PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
               10  UL29-FEMALE              PIC ZZZ,ZZ9.
               10  FILLER                  PIC X(07) VALUE SPACE.
           05  UL-REPORT-30.
               10  FILLER                  PIC X(80) VALUE ALL '='.
