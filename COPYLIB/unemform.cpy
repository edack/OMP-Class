       01  HEADER-1.
           05                    PIC X(18) VALUE 'ID'.
           05 RECORD-DATE        PIC X(20) VALUE 'DATE'.
           05                    PIC X(10) VALUE SPACES.
           05 RECORD-AGE.
              10                          PIC X(11) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(10) VALUE SPACE.
              10                          PIC X(04) VALUE SPACE.
              10                          PIC X(09) VALUE SPACE.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE SPACE.
              10                          PIC X(05) VALUE 'AGE'.
              10                          PIC X(09) VALUE SPACE.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE SPACE.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE SPACE.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE SPACE.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE SPACE.
           05                             PIC X(08) VALUE SPACES.
           05 RECORD-ETHNICITY.
              10                          PIC X(18) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'ETHNICI'.
              10                          PIC X(08) VALUE 'TY'.
              10                          PIC X(11) VALUE SPACE.
           05                             PIC X(06) VALUE SPACES.
           05 RECORD-INDUSTRY.
              10                          PIC X(11) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(10) VALUE SPACE.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE SPACE.
              10                          PIC X(06) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(09) VALUE SPACE.
              10                          PIC X(06) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'INDUSTR'.
              10                          PIC X(08) VALUE 'Y'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(09) VALUE SPACE.
              10                          PIC X(06) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
           05                             PIC X(10) VALUE SPACES.
           05 RECORD-RACE.
              10                          PIC X(11) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE 'RACE'.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(10) VALUE SPACE.
           05                             PIC X(05) VALUE SPACE.
           05 RECORD-GENDER.
              10                          PIC X(11) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE 'GENDER'.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
      *
       01  HEADER-2.
           05                    PIC X(08) VALUE 'ID'.
           05                    PIC X(10) VALUE SPACES.
           05 RECORD-DATE.
              10                          PIC X(02) VALUE 'DD'.
              10                          PIC X VALUE '/'.
              10                          PIC X(02) VALUE 'MM'.
              10                          PIC X VALUE '/'.
              10                          PIC X(04) VALUE 'YY'.
           05                             PIC X(10) VALUE SPACES.
           05 RECORD-AGE.
              10                          PIC X(03)   VALUE "N/A".
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'INA'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(10) VALUE 'UNDER 22'.
              10                          PIC X(04) VALUE SPACE.
              10                          PIC X(09) VALUE '[22 - 24]'.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE '[25 - 34]'.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE '[35 - 44]'.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE '[45 - 54]'.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE '[55 - 59]'.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE '[60 - 64]'.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE 'OVER 65'.
           05                             PIC XX(08) VALUE SPACES.
           05 RECORD-ETHNICITY.
              10                          PIC X(03) VALUE "N/A".
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'WHITE'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'LAT-HIS'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(11) VALUE 'NON-LAT-HIS'.
           05                             PIC X(06) VALUE SPACES.
           05 RECORD-INDUSTRY.
              10                          PIC X(03) VALUE 'N/A'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'INA'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'WHOLST'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'TRANSWR'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'CONSTR'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'FIN-INS'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'MANUFAC'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(10) VALUE 'AG-FIS-HUN'.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE 'PUBLIC-AD'.
              10                          PIC X(06) VALUE SPACE.
              10                          PIC X(07) VALUE 'UTILS'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(09) VALUE 'ACOM-FOOD'.
              10                          PIC X(06) VALUE SPACE.
              10                          PIC X(07) VALUE 'INFORM'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'PR-SC-T'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(08) VALUE 'RE-STATE'.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(07) VALUE 'OTHER-S'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'MANAG-C'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'EDUC-S'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'MINING'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'HEALTH'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'ARTS-EN'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(09) VALUE 'WASTE-MAG'.
              10                          PIC X(06) VALUE SPACE.
              10                          PIC X(07) VALUE 'RETAIL'.
           05                             PIC X(10) VALUE SPACES.
           05 RECORD-RACE.
              10                          PIC X(03)   VALUE "N/A".
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'INA'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'WHITE'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'ASIAN'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'AF-AM'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'NAT-AL'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(10) VALUE 'NAT-HAW-PA'.
           05                             PIC X(05) VALUE SPACES.
           05 RECORD-GENDER.
              10                          PIC X(03)   VALUE "N/A".
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'INA'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'MALE'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'FEMALE'.
      *
      *
       01  FORMAT-UNEMPLOYMENT-CLAIM REDEFINES HEADER-2.
           05 RECORD-ID                   PIC X(08).
           05                             PIC X(10).
           05 RECORD-DATE.
              10 DD                       PIC 9(02).
              10                          PIC X.
              10 MM                       PIC 9(02).
              10                          PIC X.
              10 YY                       PIC 9(04).
           05                             PIC X(10).
           05 RECORD-AGE.
              10 EXIST                    PIC X(03).
              10                          PIC X(08).
              10 INA                      PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 UNDER-22                 PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 F-22-24                  PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 F-25-34                  PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 F-35-44                  PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 F-45-54                  PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 F-55-59                  PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 F-60-64                  PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 OVER-65                  PIC ZZZ,ZZ9.
           05                             PIC XX(08).
           05 RECORD-ETHNICITY.
              10 EXIST                    PIC X(03).
              10                          PIC X(08).
              10 INA                      PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 LATINO-HISPANIC          PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 NOT-LATINO-HISPANIC      PIC ZZZ,ZZ9.
           05                             PIC X(10).
           05 RECORD-INDUSTRY.
              10 EXIST                    PIC X(03).
              10                          PIC X(08).
              10 INA                      PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 WHOLESALE-TRADE          PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 TRANSPORTATION-WAREHOUSE PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 CONSTRUCTION             PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 FINANCE-INSURANCE        PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 MANUFACTURING            PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 AGRI-FOR-FISH-HUNT       PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 PUBLIC-ADMIN             PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 UTILITIES                PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 ACCOM-FOOD-SERVICES      PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 INFORMATION              PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 PROF-SCIENTIF-TECH       PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 REAL-ESTATE              PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 OTHER-SERVICES           PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 MANAGEMENT-COMP          PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 EDUCATIONAL-SERVICES     PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 MINING                   PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 HEALTH-CARE-SOCIAL-ASSIS PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 ARTS-ENTERTAINMENT       PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 ADMIN-SUPPORT-WASTE-MGMT PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 RETAIL-TRADE             PIC ZZZ,ZZ9.
           05                             PIC X(10).
           05 RECORD-RACE.
              10 EXIST                    PIC X(03).
              10                          PIC X(08).
              10 INA                      PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 WHITE                    PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 ASIAN                    PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 AFRICAN-AMERICAN         PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 NATIVE-AMERICAN-ALASKAN  PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 NATIVE-HAWAIAN-PACIFIC   PIC ZZZ,ZZ9.
           05                             PIC X(10).
           05 RECORD-GENDER.
              10 EXIST                    PIC X(03).
              10                          PIC X(08).
              10 INA                      PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 MALE                     PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 FEMALE                   PIC ZZZ,ZZ9.
