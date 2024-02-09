
      *****************************************************
      * SQL INCLUDE FOR SQLCA (COMMUNICATIONS AREA)       *
      *****************************************************
           EXEC SQL INCLUDE SQLCA  END-EXEC.
      *****************************************************
      * SQL DECLARATION FOR TABLE                         *
      *****************************************************
           EXEC SQL DECLARE ZBANK.ZIP TABLE
                   (ZIP            CHAR(5)    NOT NULL,
                    STATE          CHAR(2)    NOT NULL,
                    ZIPNAME        CHAR(20)   NOT NULL,
                    LONGITUDE      CHAR(10)           ,
                    LATITUDE       CHAR(10)           ,
                    POPULATION     DECIMAL(7)         )
                    END-EXEC.
      *****************************************************
      * SQL CURSORS                                       *
      *****************************************************
           EXEC SQL DECLARE CUR1  CURSOR FOR
                    SELECT * FROM ZBANK.ZIP
                END-EXEC.
      *****************************************************
      * STRUCTURE FOR CUSTOMER RECORD                     *
      *****************************************************
       01  ZIP-RECORD.
           05  ZIP-I              PIC X(5).
           05  STATE-I            PIC X(2).
           05  ZIPNAME-I          PIC X(20).
           05  LONGITUDE-I        PIC X(10).
           05  LATITUDE-I         PIC X(10).
           05  POPULATION-I       PIC 9(7).
