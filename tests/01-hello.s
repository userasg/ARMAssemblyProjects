		B main

hello	DEFB	"Hello World\n",0
goodbye	DEFB	"Goodbye Universe\n",0
name 	DEFB 	"My name is Amar Gahir\n",0 ;label for my name

		ALIGN
main	ADR	R0, hello 	; put address of hello string in R0
		SWI	3         	; print it out
		
	ADR 	R0, name       ;puts the address of wherever my name is stored inside R0
		SWI 3
	
		ADR	R0, goodbye	; put address of goodbye string in R0
		SWI	3
	
		SWI	2         	; stop
