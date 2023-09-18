		B main

men  DEFB " men",0
went_to DEFB " went to",0
Went_to DEFB "Went to",0
a_meadow DEFB " a meadow\n",0
mow_inline DEFB " mow",0
mow_newline DEFB " mow\n",0
man_dog DEFB " man and his dog",0
spot DEFB "Spot\n",0
comma DEFB ", ",0


        ALIGN
main    MOV R0,#4 ;first line 4 men went to mow
        SWI 4 
        ADR R0, men
        SWI 3 
        ADR R0, went_to
        SWI 3 
        ADR R0, mow_newline
        SWI 3
        
        ADR R0, Went_to ;second line Went to mow a meadow
        SWI 3
        ADR R0, mow_inline
        SWI 3 
        ADR R0, a_meadow
        SWI 3 
        
        MOV R0, #4 ;4 man 3 man lines 
        SWI 4
        ADR R0, men
        SWI 3
        ADR R0, comma
        SWI 3
	MOV R0, #3
        SWI 4
        ADR R0, men
        SWI 3
        ADR R0, comma
        SWI 3
        MOV R0, #2
        SWI 4
        ADR R0, men
        SWI 3
        ADR R0, comma
        SWI 3
        MOV R0, #1
        SWI 4
        ADR R0, man_dog
        SWI 3
        ADR R0, comma
        SWI 3
        ADR R0, spot
        SWI 3

 	ADR R0, Went_to ;final line Went to mow a meadow
        SWI 3
        ADR R0, mow_inline
        SWI 3 
        ADR R0, a_meadow
        SWI 3 


        SWI 2  

