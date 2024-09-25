      *---------------------------------------------------------------*
       01  STATE-LOOKUP-TABLE.
      *---------------------------------------------------------------*
           05  STATE-DATA.
               10  FILLER PIC X(26) VALUE 'ALABAMA                AL '.
               10  FILLER PIC X(26) VALUE 'ALASKA                 AK '.
               10  FILLER PIC X(26) VALUE 'AMERICAN SAMOA         AS '.
               10  FILLER PIC X(26) VALUE 'ARIZONA                AZ '.
               10  FILLER PIC X(26) VALUE 'ARKANSAS               AR '.
               10  FILLER PIC X(26) VALUE 'CALIFORNIA             CA '.
               10  FILLER PIC X(26) VALUE 'COLORADO               CO '.
               10  FILLER PIC X(26) VALUE 'CONNECTICUT            CT '.
               10  FILLER PIC X(26) VALUE 'DELAWARE               DE '.
               10  FILLER PIC X(26) VALUE 'DISTRICT OF COLUMBIA   DC '.
               10  FILLER PIC X(26) VALUE 'FLORIDA                FL '.
               10  FILLER PIC X(26) VALUE 'FLORIDA                FL '.
               10  FILLER PIC X(26) VALUE 'GEORGIA                GA '.
               10  FILLER PIC X(26) VALUE 'GUAM                   GU '.
               10  FILLER PIC X(26) VALUE 'HAWAII                 HI '.
               10  FILLER PIC X(26) VALUE 'IDAHO                  ID '.
               10  FILLER PIC X(26) VALUE 'ILLINOIS               IL '.
               10  FILLER PIC X(26) VALUE 'INDIANA                IN '.
               10  FILLER PIC X(26) VALUE 'IOWA                   IA '.
               10  FILLER PIC X(26) VALUE 'KANSAS                 KS '.
               10  FILLER PIC X(26) VALUE 'KENTUCKY               KY '.
               10  FILLER PIC X(26) VALUE 'LOUISIANA              LA '.
               10  FILLER PIC X(26) VALUE 'MAINE                  ME '.
               10  FILLER PIC X(26) VALUE 'MARSHAL ISLANDS        RMI'.
               10  FILLER PIC X(26) VALUE 'MARYLAND               MD '.
               10  FILLER PIC X(26) VALUE 'MASSACHUSETTS          MA '.
               10  FILLER PIC X(26) VALUE 'MICHIGAN               MI '.
               10  FILLER PIC X(26) VALUE 'MINNESOTA              MN '.
               10  FILLER PIC X(26) VALUE 'MISSISSIPPI            MS '.
               10  FILLER PIC X(26) VALUE 'MISSOURI               MO '.
               10  FILLER PIC X(26) VALUE 'MONTANA                MT '.
               10  FILLER PIC X(26) VALUE 'NEBRASKA               NE '.
               10  FILLER PIC X(26) VALUE 'NEVADA                 NV '.
               10  FILLER PIC X(26) VALUE 'NEW HAMPSHIRE          NH '.
               10  FILLER PIC X(26) VALUE 'NEW JERSEY             NJ '.
               10  FILLER PIC X(26) VALUE 'NEW MEXICO             NM '.
               10  FILLER PIC X(26) VALUE 'NEW YORK               NY '.
               10  FILLER PIC X(26) VALUE 'NORTH CAROLINA         NC '.
               10  FILLER PIC X(26) VALUE 'NORTH DAKOTA           ND '.
               10  FILLER PIC X(26) VALUE 'NORTHERN MARIANA IS    MP '.
               10  FILLER PIC X(26) VALUE 'OHIO                   OH '.
               10  FILLER PIC X(26) VALUE 'OKLAHOMA               OK '.
               10  FILLER PIC X(26) VALUE 'OREGON                 OR '.
               10  FILLER PIC X(26) VALUE 'PENNSYLVANIA           PA '.
               10  FILLER PIC X(26) VALUE 'PUERTO RICO            PR '.
               10  FILLER PIC X(26) VALUE 'RHODE ISLAND           RI '.
               10  FILLER PIC X(26) VALUE 'SOUTH CAROLINA         SC '.
               10  FILLER PIC X(26) VALUE 'SOUTH DAKOTA           SD '.
               10  FILLER PIC X(26) VALUE 'TENNESSEE              TN '.
               10  FILLER PIC X(26) VALUE 'TEXAS                  TX '.
               10  FILLER PIC X(26) VALUE 'UTAH                   UT '.
               10  FILLER PIC X(26) VALUE 'VERMONT                VT '.
               10  FILLER PIC X(26) VALUE 'VIRGINIA               VA '.
               10  FILLER PIC X(26) VALUE 'VIRGIN ISLANDS         VI '.
               10  FILLER PIC X(26) VALUE 'WASHINGTON             WA '.
               10  FILLER PIC X(26) VALUE 'WEST VIRGINIA          WV '.
               10  FILLER PIC X(26) VALUE 'WISCONSIN              WI '.
               10  FILLER PIC X(26) VALUE 'WYOMING                WY '.
      *---------------------------------------------------------------*
           05  STATE-NAME-TABLE  REDEFINES STATE-DATA
                                 OCCURS 58 TIMES
                                 INDEXED BY NAME-INDEX.
               10  STATE-NAME              PIC X(23).
               10  STATE-CODE              PIC X(03).
