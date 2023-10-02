       01  FORMAT-UNEMPLOYMENT-CLAIM.
           05 RECORD-ID                   PIC X(08).
           05 RECORD-DATE.
              10 DD                       PIC 9(02).
              10 MM                       PIC 9(02).
              10 YY                       PIC 9(04).
           05 RECORD-AGE.
              10 EXIST                    PIC X(03).
              10 INA                      PIC ZZZ,ZZ9.
              10 UNDER-22                 PIC ZZZ,ZZ9.
              10 F-22-24                  PIC ZZZ,ZZ9.
              10 F-25-34                  PIC ZZZ,ZZ9.
              10 F-35-44                  PIC ZZZ,ZZ9.
              10 F-45-54                  PIC ZZZ,ZZ9.
              10 F-55-59                  PIC ZZZ,ZZ9.
              10 F-60-64                  PIC ZZZ,ZZ9.
              10 OVER-65                  PIC ZZZ,ZZ9.
           05 RECORD-ETHNICITY.
              10 EXIST                    PIC X(03).
              10 INA                      PIC ZZZ,ZZ9.
              10 LATINO-HISPANIC          PIC ZZZ,ZZ9.
              10 NOT-LATINO-HISPANIC      PIC ZZZ,ZZ9.
           05 RECORD-INDUSTRY.
              10 EXIST                    PIC X(03).
              10 INA                      PIC ZZZ,ZZ9.
              10 WHOLESALE-TRADE          PIC ZZZ,ZZ9.
              10 TRANSPORTATION-WAREHOUSE PIC ZZZ,ZZ9.
              10 CONSTRUCTION             PIC ZZZ,ZZ9.
              10 FINANCE-INSURANCE        PIC ZZZ,ZZ9.
              10 MANUFACTURING            PIC ZZZ,ZZ9.
              10 AGRI-FOR-FISH-HUNT       PIC ZZZ,ZZ9.
              10 PUBLIC-ADMIN             PIC ZZZ,ZZ9.
              10 UTILITIES                PIC ZZZ,ZZ9.
              10 ACCOM-FOOD-SERVICES      PIC ZZZ,ZZ9.
              10 INFORMATION              PIC ZZZ,ZZ9.
              10 PROF-SCIENTIF-TECH       PIC ZZZ,ZZ9.
              10 REAL-ESTATE              PIC ZZZ,ZZ9.
              10 OTHER-SERVICES           PIC ZZZ,ZZ9.
              10 MANAGEMENT-COMP          PIC ZZZ,ZZ9.
              10 EDUCATIONAL-SERVICES     PIC ZZZ,ZZ9.
              10 MINING                   PIC ZZZ,ZZ9.
              10 HEALTH-CARE-SOCIAL-ASSIS PIC ZZZ,ZZ9.
              10 ARTS-ENTERTAINMENT       PIC ZZZ,ZZ9.
              10 ADMIN-SUPPORT-WASTE-MGMT PIC ZZZ,ZZ9.
              10 RETAIL-TRADE             PIC ZZZ,ZZ9.
           05 RECORD-RACE.
              10 EXIST                    PIC X(03).
              10 INA                      PIC ZZZ,ZZ9.
              10 WHITE                    PIC ZZZ,ZZ9.
              10 ASIAN                    PIC ZZZ,ZZ9.
              10 AFRICAN-AMERICAN         PIC ZZZ,ZZ9.
              10 NATIVE-AMERICAN-ALASKAN  PIC ZZZ,ZZ9.
              10 NATIVE-HAWAIAN-PACIFIC   PIC ZZZ,ZZ9.
           05 RECORD-GENDER.
              10 EXIST                    PIC X(03).
              10 INA                      PIC ZZZ,ZZ9.
              10 MALE                     PIC ZZZ,ZZ9.
              10 FEMALE                   PIC ZZZ,ZZ9.
