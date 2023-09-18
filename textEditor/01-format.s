		B main
width	DEFW 12
newline	DEFB "\n",0

		ALIGN
main	
; You will need to insert your code here
		
		LDR R1, width
		MOV R3, #0


back	SWI 1
		STR R0, [R4]
		CMP R0, #10 ;make new line dont add a char
		BEQ jNewline2

		CMP R0, #35 ;ends 
		BEQ end


		CMP R3, R1  
		
		BEQ jNewline

		B success
		
  end	SWI 2

jNewline         ADR R0, newline
		 SWI 3
		 LDR R0, [R4]
		 SWI 0
		 MOV R3, #1
		 B back	
		 
jNewline2        ADR R0, newline
		 SWI 3
		 MOV R3, #0
		 B back	


success SWI 0
		ADD R3, R3, #1
		B back
