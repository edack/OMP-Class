      *---------------------------------------------------------------*
       01  UHR-RECORD-IN.
      *---------------------------------------------------------------*
           05  UHR-DATE.
               10 UHR-YEAR                 PIC X(04).
               10 FILLER                   PIC X(01).
               10 UHR-MONTH                PIC X(02).
               10 FILLER                   PIC X(01).
               10 UHR-DAY                  PIC X(02).
               10 FILLER                   PIC X(13).
           05  UHR-STATE                   PIC X(02).
           05  UHR-CASE-TOTAL              PIC 9(09).
           05  UHR-CASE-CONF               PIC 9(09).
           05  UHR-CASE-PROPABLE           PIC 9(09).
           05  UHR-CASE-NEW                PIC X(09).
           05  UHR-CASE-NEW-PROB           PIC 9(09).
           05  UHR-DEATH-TOTAL             PIC 9(09).
           05  UHR-DEATH-CONF              PIC X(09).
           05  UHR-DEATH-PROPABLE          PIC 9(09).
           05  UHR-DEATH-NEW               PIC X(09).
           05  UHR-DEATH-NEW-PROB          PIC 9(09).
           05  UHR-CREATED-AT              PIC X(23).
           05  UHR-CONSENT-CASE            PIC X(09).
           05  UHR-CONSENT-DEATH           PIC X(09).
