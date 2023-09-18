		B main
width	DEFW 12

; Use this buffer to store your words, there's space for words up to 32 bytes long
;
; When you store characters here, it will overwrite the values that already exist.
buffer	DEFB "01234567890123456789012345678901",0 

		ALIGN
main
; Insert your code here


		SWI 2

; Insert your rubOut subroutine/function here...

