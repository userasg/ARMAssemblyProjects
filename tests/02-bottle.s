		B main


green_bottles   DEFB " green bottles",0
hanging DEFB " hanging on the wall",0
comma   DEFB ",\n",0
line3   DEFB "And if one green bottle should accidentally fall,\n",0
line4   DEFB "There will be ",0
stop    DEFB ".\n",0

        ALIGN
main    MOV R0,#10 ;moves the integer value 10 inside register R0
        SWI 4 ;SWI 4 will print out the integer 10 which is the start of the sentance 
        ADR R0,green_bottles ;loads the thing thats at the label green_bottles into R0
        SWI 3 ;prints out the string green_bottles until the integer 0, so at the moment its 10 green bottles 
        ADR R0,hanging ;loads the thing thats at the label hanging into R0 
        SWI 3 ;prints out whats at R0 and at the hanging label and the text stored here, it is now 10 green bottles hanging on the wall 
        ADR R0,comma ;loads the comma into R0
        SWI 3 ;prints out the comma so its finally 10 green bottles hanging on the wall, 

        MOV R0,#10 ;repeats the upper function 
        SWI 4
        ADR R0,green_bottles
        SWI 3
        ADR R0,hanging
        SWI 3
        ADR R0,comma
        SWI 3

        ADR R0, line3 ;loads the whole line 3 into R0
        SWI 3 ;prints out line 3

        ADR R0, line4 ;loads there will be into R0
        SWI 3 ;prints there will be out 
        MOV R0,#9 ;moves the integer into R0
        SWI 4 ;prints out the integer 9 after there will be 
        ADR R0,green_bottles ;loads the green_bottles phrase into R0
        SWI 3 ;prints it out 
        ADR R0,hanging ;etc etc same as above 
        SWI 3
        ADR R0,stop
        SWI 3

        SWI 2  

