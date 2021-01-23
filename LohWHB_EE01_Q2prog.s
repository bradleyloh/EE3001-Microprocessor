	AREA Question2, CODE, READONLY
option EQU 2					;rmb to change to the one you want 1/2
memory EQU 0x40000000
	ENTRY
start
	ldr r0, = memory			   ;memory address
	mov r1, #option				   ;option 1 or 2
	cmp r1,#1						;if option =1
	beq opt1                       ;goto opt1
	cmp r1,#2                      ;else if option
	beq opt2                       ;then goto lable opt2
opt1
     mov r2,#20                    ;counter for 20 numbers
	 mov r3,#1                     ;initial value
loop1
     str r3,[r0]                   ;table[i]=r3
	 add r3,r3,#3                  ;r3=r3+3
	 add r0,r0,#4                  ;i++
	 sub r2,r2,#1                  ;couter=counter-1
	 cmp r2,#0                     ;while r2>0 
	 bgt loop1
	 cmp r2,#0                     ;if r2=0, return to ending
	 beq ending                    
	
opt2
     mov r2,#20                    ;counter for 20 numbers
	 mov r3,#1                     ;initial value
loop2 
     str r3,[r0]                   ;table[i]=r3
	 mov r4, #3                    ;r4 = 3
	 mul r3,r4,r3                  ;r3=r4*r3
	 add r0,r0,#4                  ;i++
	 sub r2,r2,#1                  ;couter=counter-1
	 cmp r2,#0                     ;while r2>0 
	 bgt loop2
	 cmp r2,#0					   
	 beq ending					   ;if r2=0,return to ending
	 
ending
	
stop b stop
	 END