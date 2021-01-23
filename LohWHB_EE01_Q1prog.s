	INCLUDE assign2.ini
	AREA Question1 , CODE, READONLY
memory EQU 0x40000000
	ENTRY
start
     ldr r0,=memory	  ;memory address
     ldr r1,=dat      ;starting address of data stored in memory block
     mov r2,#4        ;address increamental
	 mov r3,#50       ;counter of words
	 mul r2,r3,r2     ;compute address of last word in dat
	 add r1,r1,r2      
	 sub r1,r1,#4     
	 
	 ldr r4,[r1]     ;min value in r4 after loop
	 mov r5,#0       ;max value in r5 after loop   
loop
     ldr r2,[r1]     ;r2=dat[i]
	 str r2,[r0]     ;block[j]=r2
	 cmp r4,r2       ;if r2<min
	 ble skip
	 mov r4,r2       ;then min=r2
skip	 
	 cmp r5,r2       ;if r2>max
     bge skip1
     mov r5,r2       ;then max=r2
skip1	 
	 add r0,r0,#4    ;j++
	 sub r1,r1,#4    ;i--
	 sub r3,r3,#1    ;counter=counter-1
	 cmp r3,#0       ;while counter>0
	 bgt loop
	 
stop b stop
	END
