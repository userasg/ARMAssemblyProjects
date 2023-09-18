		B main
width	DEFW 12
newline	DEFB "\n",0

		ALIGN
main	
; You will need to insert your code here
;dont even need width here 
		
		LDR R1, width 	;loads r1 with width
		MOV R3, #1	;moves 0 into r3 for a loop counter


back		SWI 1
		STR R0, [R4]	
		
		CMP R0, #32
		BEQ isSpace	 ;compares r0 to space and then another if to see if its on 12th position 
		
		
		CMP R0, #10 	 ;make new line dont add a char this is for the enter key 
		BEQ jNewline2    

		CMP R0, #35 	 ;ends the program for a hash symbol
		BEQ end
	
	
	
	
		;CMP R3, R1 compares the value in r3 to the width
		;BEQ jNewline

		B success	 ;prints out the character and increments the count which is R3
	
  end		SWI 2     	

;jNewline         ADR R0, newline ;prints a newline
;		 SWI 3
;		 LDR R0, [R4]
;		 SWI 0		 ;prints the character left over 
;		 MOV R3, #1	 ;resets count with 1 cause new char is there
;		 B back	
		 
jNewline2        ADR R0, newline ;resets the counter if its a newline 
		 SWI 3
		 MOV R3, #1	
		 B back	

isSpace		CMP R3, R1
		BGE jNewline2    ;if space is the 12th character it will reset on a newlin
		B success


success 	SWI 0 
		ADD R3, R3, #1
		B back
