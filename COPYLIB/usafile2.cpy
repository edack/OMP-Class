      *---------------------------------------------------------------*
       01  UHR-RECORD-IN.
      *---------------------------------------------------------------*
           05  UHR-UPDATE-DATE.
               10 UHR-YEAR                 PIC X(04).
               10 FILLER                   PIC X(01).
               10 UHR-MONTH                PIC X(02).
               10 FILLER                   PIC X(01).
               10 UHR-DAY                  PIC X(02).
               10 FILLER                   PIC X(13).
           05  UHR-STATE                   PIC X(03).
           05  UHR-START-DATE.
               10 UHR-YEAR                 PIC X(04).
               10 FILLER                   PIC X(01).
               10 UHR-MONTH                PIC X(02).
               10 FILLER                   PIC X(01).
               10 UHR-DAY                  PIC X(02).
               10 FILLER                   PIC X(13).
           05  UHR-END-DATE.
               10 UHR-YEAR                 PIC X(04).
               10 FILLER                   PIC X(01).
               10 UHR-MONTH                PIC X(02).
               10 FILLER                   PIC X(01).
               10 UHR-DAY                  PIC X(02).
               10 FILLER                   PIC X(13).
           05  UHR-TOTAL-CASES             PIC 9(09).
           05  UHR-NEW-CASES               PIC X(09).
           05  UHR-TOTAL-DEATHS            PIC 9(09).
           05  UHR-NEW-DEATHS              PIC X(09).
