      *------------------------------------------------------------*
       01  UNEMPLOYMENT-CLAIM.
           05 RECORD-ID                           PIC X(08).
           05 RECORD-DATE.
              10 DD                               PIC 9(02).
              10 MM                               PIC 9(02).
              10 YY                               PIC 9(04).
           05 RECORD-AGE.
              10 EXIST                            PIC X(03).
              10 INA                              PIC 9(06) VALUE 0.
              10 UNDER-22                         PIC 9(06) VALUE 0.
              10 F-22-24                          PIC 9(06) VALUE 0.
              10 F-25-34                          PIC 9(06) VALUE 0.
              10 F-35-44                          PIC 9(06) VALUE 0.
              10 F-45-54                          PIC 9(06) VALUE 0.
              10 F-55-59                          PIC 9(06) VALUE 0.
              10 F-60-64                          PIC 9(06) VALUE 0.
              10 OVER-65                          PIC 9(06) VALUE 0.
           05 RECORD-ETHNICITY.
              10 EXIST                            PIC X(03).
              10 INA                              PIC 9(06) VALUE 0.
              10 LATINO-HISPANIC                  PIC 9(06) VALUE 0.
              10 NOT-LATINO-HISPANIC              PIC 9(06) VALUE 0.
           05 RECORD-INDUSTRY.
              10 EXIST                            PIC X(03).
              10 INA                              PIC 9(06) VALUE 0.
              10 WHOLESALE-TRADE                  PIC 9(06) VALUE 0.
              10 TRANSPORTATION-WAREHOUSE         PIC 9(06) VALUE 0.
              10 CONSTRUCTION                     PIC 9(06) VALUE 0.
              10 FINANCE-INSURANCE                PIC 9(06) VALUE 0.
              10 MANUFACTURING                    PIC 9(06) VALUE 0.
              10 AGRI-FOR-FISH-HUNT               PIC 9(06) VALUE 0.
              10 PUBLIC-ADMIN                     PIC 9(06) VALUE 0.
              10 UTILITIES                        PIC 9(06) VALUE 0.
              10 ACCOM-FOOD-SERVICES              PIC 9(06) VALUE 0.
              10 INFORMATION                      PIC 9(06) VALUE 0.
              10 PROF-SCIENTIF-TECH               PIC 9(06) VALUE 0.
              10 REAL-ESTATE                      PIC 9(06) VALUE 0.
              10 OTHER-SERVICES                   PIC 9(06) VALUE 0.
              10 MANAGEMENT-COMP                  PIC 9(06) VALUE 0.
              10 EDUCATIONAL-SERVICES             PIC 9(06) VALUE 0.
              10 MINING                           PIC 9(06) VALUE 0.
              10 HEALTH-CARE-SOCIAL-ASSIS         PIC 9(06) VALUE 0.
              10 ARTS-ENTERTAINMENT               PIC 9(06) VALUE 0.
              10 ADMIN-SUPPORT-WASTE-MGMT         PIC 9(06) VALUE 0.
              10 RETAIL-TRADE                     PIC 9(06) VALUE 0.
           05 RECORD-RACE.
              10 EXIST                            PIC X(03).
              10 INA                              PIC 9(06) VALUE 0.
              10 WHITE                            PIC 9(06) VALUE 0.
              10 ASIAN                            PIC 9(06) VALUE 0.
              10 AFRICAN-AMERICAN                 PIC 9(06) VALUE 0.
              10 NATIVE-AMERICAN-ALASKAN          PIC 9(06) VALUE 0.
              10 NATIVE-HAWAIAN-PACIFIC           PIC 9(06) VALUE 0.
           05 RECORD-GENDER.
              10 EXIST                            PIC X(03).
              10 INA                              PIC 9(06) VALUE 0.
              10 MALE                             PIC 9(06) VALUE 0.
              10 FEMALE                           PIC 9(06) VALUE 0.
