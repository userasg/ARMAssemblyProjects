		B main
width	DEFW 12

; Use this buffer to store your words, there's space for words up to 32 bytes long
;
; When you store characters here, it will overwrite the values that already exist.
buffer	DEFB "01234567890123456789012345678901",0 
newline	DEFB "\n",0

		ALIGN
main

; You will need to insert your code here
;dont even need width here 
		
		
	;	LDR R3, width		;stores width in R3
	;	MOV R2, #0		;loop counter in R2

back2		ADR R1, buffer		;points R1 to the buffer
back		SWI 1			;reads in input 
	
		;CMP R0, #32
		;BEQ isSpace	 ;compares r0 to space and then another if to see if its on 12th position 
		
		
		CMP R0, #10 	 ;make new line dont add a char this is for the enter key 
		BEQ jNewline2    

		CMP R0, #35 	 ;ends the program for a hash symbol
		BEQ end


		STRB R0, [R1]		;stores each char into the mem address at R1
	        ;ADD R2, R2, #1		;adds one to the char loop length check
		ADD R1, R1, #1		;adds one to move the address r1 is pointing to up one for next char 
		CMP R0, #32		;compares r0 space char  
		BNE back 			
		MOV R0, #0		
		STRB R0, [R1]
		
		
		
		ADR R0, buffer	
		SWI 3
		
		
		B back2
		
		
		
			
		
end		SWI 2

jNewline2        ADR R0, newline ;resets the counter if its a newline 
		 SWI 3	
		 B back	
