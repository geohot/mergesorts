       IDENTIFICATION DIVISION.
       PROGRAM-ID. MERGESORT.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-NUM-TABLE.
           05 WS-NUMS OCCURS 100 INDEXED BY IDX.
              07 WS-NUM           PIC 9(9).
       01  WS-MAX                 PIC S9(4) COMP-3.
       01  WS-INP                 PIC X(1000).
       01  WS-COMMA               PIC X(1)         VALUE ','.
       01  WS-SP                  PIC S9(3) COMP-3 VALUE 1.
       01  WS-P1                  PIC S9(3) COMP-3 VALUE 1.

       PROCEDURE DIVISION.

       MAIN-LOGIC SECTION.
       MAIN-000.
           MOVE '5,9,1,3,4,6,6,3,2' TO WS-INP.

      * LOAD INTO ARRAY 
           INSPECT WS-INP TALLYING WS-MAX FOR ALL      
            WS-COMMA.
           ADD 1                    TO WS-MAX.
           SET IDX                  TO 1.
           PERFORM WS-MAX TIMES 
             UNSTRING WS-INP DELIMITED BY WS-COMMA
                   INTO WS-NUM(IDX)
                   WITH POINTER WS-SP
             END-UNSTRING      
             SET IDX UP BY 1
           END-PERFORM.
    
           PERFORM MERGE-SORT. 
    
      * DISPLAY FROM ARRAY
           PERFORM VARYING IDX FROM 1 UNTIL IDX>WS-MAX
              MOVE ZEROS TO WS-P1
              INSPECT WS-NUM(IDX) TALLYING WS-P1 FOR LEADING ZEROS
              IF IDX = WS-MAX
                DISPLAY WS-NUM(IDX)(WS-P1 + 1:) 
              ELSE  
                DISPLAY WS-NUM(IDX)(WS-P1 + 1:) WS-COMMA NO ADVANCING
              END-IF  
           END-PERFORM.

       MAIN-999.
       STOP RUN.
       
       MERGE-SORT SECTION.
       MG-010.

       MG-999.
           EXIT.
           