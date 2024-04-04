      *---------------------------------------------------------------*
       01  UHR-RECORD-IN.
      *---------------------------------------------------------------*
           05  UHR-UPDATE-DATE.
               10 UHR-UPDATE-YEAR          PIC X(04).
               10 FILLER                   PIC X(01).
               10 UHR-UPDATE-MONTH         PIC X(02).
               10 FILLER                   PIC X(01).
               10 UHR-UPDATE-DAY           PIC X(02).
               10 FILLER                   PIC X(13).
           05  UHR-STATE                   PIC X(03).
           05  UHR-START-DATE.
               10 UHR-START-YEAR           PIC X(04).
               10 FILLER                   PIC X(01).
               10 UHR-START-MONTH          PIC X(02).
               10 FILLER                   PIC X(01).
               10 UHR-START-DAY            PIC X(02).
               10 FILLER                   PIC X(13).
           05  UHR-END-DATE.
               10 UHR-END-YEAR             PIC X(04).
               10 FILLER                   PIC X(01).
               10 UHR-END-MONTH            PIC X(02).
               10 FILLER                   PIC X(01).
               10 UHR-END-DAY              PIC X(02).
               10 FILLER                   PIC X(13).
           05  UHR-TOTAL-CASES             PIC X(11).
           05  UHR-NEW-CASES               PIC X(11).
           05  UHR-TOTAL-DEATHS            PIC X(11).
           05  UHR-NEW-DEATHS              PIC X(11).
      *     05  UHR-NEW-HISTORIC-CASE       PIC X(11).
      *     05  UHR-NEW-HISTORIC-DEATH      PIC X(23).
