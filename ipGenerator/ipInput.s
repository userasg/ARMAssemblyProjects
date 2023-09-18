     		 B main
ipA     DEFW 0 ; Store the read IP here
ipB     DEFW 0 ; Store the read IP here
ipC     DEFW 0 ; Store the read IP here
ipD     DEFW 0 ; Store the read IP here

enterIP DEFB "Please enter your IP address: ",0
newline DEFB "\n",0
errorM  DEFB "\nYou have entered an invalid IP address!\n",0
ipAddress
        DEFB "You entered the IP address: ",0
dot	DEFB ".",0

       	        ALIGN
main    
		ADR R0, enterIP
		SWI 3
		
		ADR R3, ipA
		MOV R4, #3
		MOV R5, #0

back2	        ADD R5, R5, #1
		;test
	     BL readInt
		STR R0, [R3] 	;stores read number in x in memory location 4
		CMP R0, #255
		BGT error
		CMP R0, #0
		BLT error
		ADD R3, R3, #4	
		
		CMP R1, #46
		BNE error
		
		CMP R5, R4
		BNE back2	
		
		BL readInt
		STR R0, [R3] 	;stores read number in x in memory location 4
		CMP R0, #255
		BGT error
		CMP R0, #0
		BLT error
		CMP R1, #10
		BNE error
			
end		ADR R0, ipAddress
		SWI 3
		
		ADR R3, ipA
		MOV R4, #4
		MOV R5, #0
	
back3	        ADD R5, R5, #1
		LDR R0, [R3] 
		SWI 4
		ADR R0, dot
		SWI 3
		ADD R3,R3, #4
		CMP R4, R5
		BNE back3
		
back		SWI 2

error		ADR R0, errorM
		SWI 3
		B back	



;* Read an integer from the keyboard
;* Output: R0 -> Integer read, R1 -> terminating character
;* Corrupts: R0, R1, R2
;* You should not modify the code following this point

readInt	MOV	R2,#10
		MOV R1,#0
		B riloop
ric		MUL R1,R1,R2
		ADD R1,R1,R0
riloop	SWI 1
		SWI 0
		SUB R0,R0,#48
		CMP R0,#9
		BLS	ric

		EOR	R0,R1,R0
		EOR R1,R0,R1
		EOR	R0,R1,R0
		ADD R1,R1,#48
		MOV PC,R14

