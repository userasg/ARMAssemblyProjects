      B main
      

enterI  DEFB "Please enter your integer: ",0
newline DEFB "\n",0
errorM  DEFB "\nYou have entered a character instead of an integer!\n",0
value   DEFW 0 ; Store the read number here

        ALIGN
main	ADR R0, enterI
	SWI 3	
	MOV R5, #10
	MOV R4, #0
		
back	SWI 1	     ;comparisons in loop
	CMP R0, #48
	BEQ branch
	CMP R0, #49
	BEQ branch
	CMP R0, #50
	BEQ branch
	CMP R0, #51
	BEQ branch
	CMP R0, #52
	BEQ branch
	CMP R0, #53
	BEQ branch
	CMP R0, #54
	BEQ branch
	CMP R0, #55
	BEQ branch
	CMP R0, #56
	BEQ branch
	CMP R0, #57
	BEQ branch
	CMP R0, #10
	BEQ branch2
	
	ADR R0, errorM
	SWI 3
	B main
	SWI 2
	
branch	SUB R0, R0, #48 	;getting number
	MOV R0, R0	        		
	SWI 4			;just printing number
	MUL R4, R4, R5		;[R4XR5]
	ADD R4, R4, R0		;[R4XR5]+R0 and R4=CURRENT NUMBER
	B back
	
branch2	STR R4, value
	ADR R0, newline
	SWI 3
	LDR R0, value
	SWI 4

