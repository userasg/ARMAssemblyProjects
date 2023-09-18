		B main 	
fibbEnd 	DEFW 15
newline 	DEFB "\n",0
fibnumis	DEFB "Fibonacci number ",0
is		DEFB " is ",0
fullstop 	DEFB ".",0

	ALIGN 

main    LDR R2, fibbEnd		
	MOV R3, #2	
	
	MOV R6, #0
	MOV R7, #1
	ADR R0, fibnumis
	SWI 3
	MOV R0, #1
	SWI 4
	ADR R0, is
	SWI 3
	MOV R0, #1
	SWI 4
	ADR R0, fullstop
	SWI 3
	ADR R0, newline
	SWI 3
	
back1  CMP R3, R2		
       BLE branch1 		
       
       SWI 0
       SWI 2
       
          
branch1 ADR R0, fibnumis
	SWI 3 
	MOV R0, R3
	SWI 4
	ADR R0, is
	SWI 3
	
	;fib cal goes here 

	ADD R8, R6, R7
	MOV R0, R8
	SWI 4
	MOV R6, R7
	MOV R7, R8
	
	
	ADR R0, fullstop
	SWI 3
	ADR R0, newline
        SWI 3			
        ADD R3, R3, #1		
	B back1 		
  
