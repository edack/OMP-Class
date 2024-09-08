      *---------------------------------------------------------------*
       01  GLOBAL-RECORD-IN.
      *---------------------------------------------------------------*
           05  GR-ID-CHUNK                 PIC X(36).
           05  GR-COUNTRY                  PIC X(44).
           05  GR-CODE                     PIC X(02).
           05  GR-SLUG                     PIC X(44).
           05  GR-CASE-NEW                 PIC 9(08).
           05  GR-CASE-TOT                 PIC 9(08).
           05  GR-DEATH-NEW                PIC 9(07).
           05  GR-DEATH-TOT                PIC 9(07).
           05  GR-RECVD-NEW                PIC 9(07).
           05  GR-RECVD-TOT                PIC 9(07).
           05  GR-TIMESTAMP.
               10  GR-AOD-YEAR             PIC X(04).
               10  FILLER                  PIC X(01).
               10  GR-AOD-MONTH            PIC X(02).
               10  FILLER                  PIC X(01).
               10  GR-AOD-DAY              PIC X(02).
               10  FILLER                  PIC X(11).
           05  GR-PERCENT                  PIC 99V999999.