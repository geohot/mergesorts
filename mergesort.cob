       IDENTIFICATION DIVISION.
       PROGRAM-ID. MERGESORT.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-NUM-TABLE.
           05 WS-NUMS OCCURS 100 INDEXED BY IDX.
              07 WS-NUM           PIC Z(9)9.   
       01  WS-SORT-TABLE.
           05 WS-SORT OCCURS 100 INDEXED BY IDX-S.
              07 WS-SORT-NUM      PIC Z(9)9.                   
       01  WS-MAX                 PIC S9(4) COMP-3.
       01  SORT-WIDTH             PIC S9(4) COMP-3.
       01  WS-I                   PIC S9(4) COMP-3.
       01  WS-IM                  PIC S9(4) COMP-3.
       01  WS-JM                  PIC S9(4) COMP-3.
       01  WS-KM                  PIC S9(4) COMP-3.
       01  WS-LEFT                PIC S9(4) COMP-3.
       01  WS-RIGHT               PIC S9(4) COMP-3.
       01  WS-TEMP1               PIC S9(4) COMP-3.
       01  WS-TEMP2               PIC S9(4) COMP-3.
       01  WS-END                 PIC S9(4) COMP-3.
       01  WS-IC                  PIC S9(4) COMP-3.

       01  WS-INP                 PIC X(1000).
       01  WS-COMMA               PIC X(1)         VALUE ','.
       01  WS-SP                  PIC S9(3) COMP-3 VALUE 1.
       01  WS-P1                  PIC S9(3) COMP-3 VALUE 1.

       PROCEDURE DIVISION.

       MAIN-LOGIC SECTION.
       MAIN-000.
           MOVE '5,9,1,3,4,6,6,3,2' TO WS-INP.
      * LOAD INTO ARRAY 
           IF WS-INP = ""
               DISPLAY "NOTHING HERE!!! :("
               GO TO MAIN-999    
           END-IF.        
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
           IF WS-MAX = 1
             INSPECT WS-NUM(1) TALLYING WS-P1 
               FOR LEADING SPACES
             DISPLAY WS-NUM(1)(WS-P1:)
           ELSE  
             PERFORM VARYING IDX FROM 1 UNTIL IDX>WS-MAX
                MOVE ZEROS TO WS-P1
                INSPECT WS-SORT-NUM(IDX) TALLYING WS-P1 
                  FOR LEADING SPACES
                IF IDX = WS-MAX
                  DISPLAY WS-SORT-NUM(IDX)(WS-P1 + 1:) 
                ELSE  
                  DISPLAY WS-SORT-NUM(IDX)(WS-P1 + 1:) WS-COMMA 
                    NO ADVANCING
                END-IF  
             END-PERFORM
           END-IF.
      
       MAIN-999.
       STOP RUN.
       
       MERGE-SORT SECTION.
       MG-010.
           MOVE 1 TO SORT-WIDTH.
           PERFORM UNTIL SORT-WIDTH >= WS-MAX
             COMPUTE WS-TEMP1 = 2 * SORT-WIDTH
             PERFORM VARYING WS-I FROM 1 BY WS-TEMP1
                     UNTIL WS-I > WS-MAX
               PERFORM BOTTOM-MERGE
             END-PERFORM
             PERFORM COPY-TABLE        
             COMPUTE SORT-WIDTH = 2 * SORT-WIDTH
           END-PERFORM.
       MG-999.
           EXIT.

       
       BOTTOM-MERGE SECTION.
       BM-010.
           MOVE WS-I      TO WS-IM.
           MOVE WS-IM     TO  WS-LEFT.
           COMPUTE WS-TEMP2 = WS-IM + SORT-WIDTH.
           IF WS-TEMP2 < WS-MAX
             MOVE WS-TEMP2 TO WS-JM WS-RIGHT
           ELSE
             MOVE WS-MAX  TO WS-JM WS-RIGHT
           END-IF.

           COMPUTE WS-TEMP2 = WS-IM + 2*SORT-WIDTH - 1.
           IF WS-TEMP2 < WS-MAX
             MOVE WS-TEMP2 TO WS-END
           ELSE
             MOVE WS-MAX  TO WS-END    
           END-IF.

           PERFORM VARYING WS-KM FROM WS-LEFT
                   BY 1 UNTIL WS-KM > WS-END
             IF WS-IM < WS-RIGHT AND
                (WS-JM > WS-END OR
                 WS-NUM(WS-IM)<=WS-NUM(WS-JM))
               MOVE WS-NUM(WS-IM) TO WS-SORT-NUM(WS-KM)
               ADD 1              TO WS-IM
             ELSE
               MOVE WS-NUM(WS-JM) TO WS-SORT-NUM(WS-KM)
               ADD 1              TO WS-JM
             END-IF                       
           END-PERFORM.  

       BM-999.
           EXIT.
           
       COPY-TABLE SECTION.
       CT-010.
           PERFORM VARYING WS-IC FROM 1
                   BY 1 UNTIL WS-IC > WS-MAX
             MOVE WS-SORT-NUM(WS-IC) TO WS-NUM(WS-IC)      
           END-PERFORM.        
       CT-999.
           EXIT.
           