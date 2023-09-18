B main 	
verses 		DEFW 5
newline 	DEFB "\n",0
men  		DEFB " men",0
went_to 	DEFB " went to",0
Went_to 	DEFB "Went to",0
a_meadow 	DEFB " a meadow\n",0
mow_inline 	DEFB " mow",0
mow_newline 	DEFB " mow\n",0
man_dog 	DEFB " man and his dog",0
spot 		DEFB "Spot\n",0
comma 		DEFB ", ",0


	ALIGN 

main    LDR R2, verses		;this loads the loop number into R2 saved in the variable times
	MOV R3, #0		;this moves the number 0 into R3 and is used for the loop 
	MOV R5, #1   
	
	
back1  CMP R2, R3		;this compares the two registers R3 and R2
       BGT branch1 		;after the comparison it will branch to the part to actually be looped over and over again which is the main program it will branch if R2 is still greater than R3
    
       SWI 0
       SWI 2
       
          
branch1 MOV R0,R2 ;gets branched to everytime the R2 and R3 values are not equal this line reads x men went to mow we move the value in R2 into R0 to be printed below and due to the loop will keep dec  
        SWI 4 			; this will print the value in R0 
        ADR R0, men		
        SWI 3 
        ADR R0, went_to
        SWI 3 
        ADR R0, mow_newline
        SWI 3
        
        
        ADR R0, Went_to      	;went to mow a meadow line 
        SWI 3
        ADR R0, mow_inline
        SWI 3 
        ADR R0, a_meadow
        SWI 3 
       
       	MOV R4, R2
back2   CMP R4, R5
        BGT branch2

    
        
        MOV R0, #1		; one man and his dog 
        SWI 4
        ADR R0, man_dog
        SWI 3
        ADR R0, comma
        SWI 3
        ADR R0, spot
        SWI 3
        
      
 	ADR R0, Went_to   	;went to mow a meadow
        SWI 3
        ADR R0, mow_inline
        SWI 3 
        ADR R0, a_meadow
        SWI 3 			
        ADR R0, newline
        SWI 3			;this is the end of the original meadow program	
        
        
	SUB R2, R2, #1		;at the end of the loop part we decrement the value in R2 and store back into R2 to be compared again to 0 
	B back1 		;branches back to back label everytime its done
	
	
	ALIGN
	
branch2 MOV R0, R4		
        SWI 4		
        ADR R0, men
        SWI 3
        ADR R0, comma
        SWI 3
        SUB R4, R4, #1
        B back2

