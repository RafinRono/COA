.model SMALL                ; means a small model
.STACK 100H                 ; 100 is the stack size

.DATA                       ; data segment, stores the variable values
C DB ?
D DB ?        

                            ; code section
.CODE
MAIN PROC
MOV AX, @DATA               ; moving data to AX
MOV DS, AX                  ; DS can't be sent value directly, so first it is stored in AX

;---------------------------------------------------------------------------------------------INPUT 1--------------------------------------------------------------------          
MOV AH, 1                   ; 1 is used for sinle value input
INT 21H
MOV C, AL                   ; the input value is stored in BH register     
 
MOV AH, 1                   ; 1 is used for single value input
INT 21H
MOV D, AL                   ; input value is stored in CH

MOV BH, C
XCHG BH, D                  ; exchanges values of BH & D
MOV C, BH

MOV AH, 2
MOV DL, 10                  ; takes cursor to new line 
INT 21H
MOV DL, 13                  ; moves cursor to the front of new line
INT 21H        

MOV AH, 2
MOV DL, C                   ; outputs the value in C
INT 21H
MOV DL, D                   ; outputs the value in D
INT 21H
  
  MOV AH, 4CH               ; used for closing 
  INT 21H
  MAIN ENDP                 ; ends the procedure
END                         ; end program
