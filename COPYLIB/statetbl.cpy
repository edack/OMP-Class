      *---------------------------------------------------------------*
       01  STATE-LOOKUP-TABLE.
      *---------------------------------------------------------------*
           05  STATE-DATA.
               10  FILLER PIC X(25) VALUE 'ALABAMA                AL'.
               10  FILLER PIC X(25) VALUE 'ALASKA                 AK'.
               10  FILLER PIC X(25) VALUE 'AMERICAN SAMOA         AS'.
               10  FILLER PIC X(25) VALUE 'ARIZONA                AZ'.
               10  FILLER PIC X(25) VALUE 'ARKANSAS               AR'.
               10  FILLER PIC X(25) VALUE 'CALIFORNIA             CA'.
               10  FILLER PIC X(25) VALUE 'COLORADO               CO'.
               10  FILLER PIC X(25) VALUE 'CONNECTICUT            CT'.
               10  FILLER PIC X(25) VALUE 'DELAWARE               DE'.
               10  FILLER PIC X(25) VALUE 'DISTRICT OF COLUMBIA   DC'.
               10  FILLER PIC X(25) VALUE 'FLORIDA                FL'.
               10  FILLER PIC X(25) VALUE 'GEORGIA                GA'.
               10  FILLER PIC X(25) VALUE 'GUAM                   GU'.
               10  FILLER PIC X(25) VALUE 'HAWAII                 HI'.
               10  FILLER PIC X(25) VALUE 'IDAHO                  ID'.
               10  FILLER PIC X(25) VALUE 'ILLINOIS               IL'.
               10  FILLER PIC X(25) VALUE 'INDIANA                IN'.
               10  FILLER PIC X(25) VALUE 'IOWA                   IA'.
               10  FILLER PIC X(25) VALUE 'KANSAS                 KS'.
               10  FILLER PIC X(25) VALUE 'KENTUCKY               KY'.
               10  FILLER PIC X(25) VALUE 'LOUISIANA              LA'.
               10  FILLER PIC X(25) VALUE 'MAINE                  ME'.
               10  FILLER PIC X(25) VALUE 'MARYLAND               MD'.
               10  FILLER PIC X(25) VALUE 'MASSACHUSETTS          MA'.
               10  FILLER PIC X(25) VALUE 'MICHIGAN               MI'.
               10  FILLER PIC X(25) VALUE 'MINNESOTA              MN'.
               10  FILLER PIC X(25) VALUE 'MISSISSIPPI            MS'.
               10  FILLER PIC X(25) VALUE 'MISSOURI               MO'.
               10  FILLER PIC X(25) VALUE 'MONTANA                MT'.
               10  FILLER PIC X(25) VALUE 'NEBRASKA               NE'.
               10  FILLER PIC X(25) VALUE 'NEVADA                 NV'.
               10  FILLER PIC X(25) VALUE 'NEW HAMPSHIRE          NH'.
               10  FILLER PIC X(25) VALUE 'NEW JERSEY             NJ'.
               10  FILLER PIC X(25) VALUE 'NEW MEXICO             NM'.
               10  FILLER PIC X(25) VALUE 'NEW YORK               NY'.
               10  FILLER PIC X(25) VALUE 'NORTH CAROLINA         NC'.
               10  FILLER PIC X(25) VALUE 'NORTH DAKOTA           ND'.
               10  FILLER PIC X(25) VALUE 'NORTHERN MARIANA IS    MP'.
               10  FILLER PIC X(25) VALUE 'OHIO                   OH'.
               10  FILLER PIC X(25) VALUE 'OKLAHOMA               OK'.
               10  FILLER PIC X(25) VALUE 'OREGON                 OR'.
               10  FILLER PIC X(25) VALUE 'PENNSYLVANIA           PA'.
               10  FILLER PIC X(25) VALUE 'PUERTO RICO            PR'.
               10  FILLER PIC X(25) VALUE 'RHODE ISLAND           RI'.
               10  FILLER PIC X(25) VALUE 'SOUTH CAROLINA         SC'.
               10  FILLER PIC X(25) VALUE 'SOUTH DAKOTA           SD'.
               10  FILLER PIC X(25) VALUE 'TENNESSEE              TN'.
               10  FILLER PIC X(25) VALUE 'TEXAS                  TX'.
               10  FILLER PIC X(25) VALUE 'UTAH                   UT'.
               10  FILLER PIC X(25) VALUE 'VERMONT                VT'.
               10  FILLER PIC X(25) VALUE 'VIRGINIA               VA'.
               10  FILLER PIC X(25) VALUE 'VIRGIN ISLANDS         VI'.
               10  FILLER PIC X(25) VALUE 'WASHINGTON             WA'.
               10  FILLER PIC X(25) VALUE 'WEST VIRGINIA          WV'.
               10  FILLER PIC X(25) VALUE 'WISCONSIN              WI'.
               10  FILLER PIC X(25) VALUE 'WYOMING                WY'.
      *---------------------------------------------------------------*
           05  STATE-NAME-TABLE  REDEFINES STATE-DATA
                                   OCCURS 56 TIMES.
               10  STATE-NAME              PIC X(23).
               10  STATE-CODE              PIC X(02).
