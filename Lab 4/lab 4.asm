.model SMALL                ; means a small model                                                                                                                                        .model SMALL                ; means a small model
.STACK 100H                 ; 100 is the stack size

.DATA                       
A DB "Enter a char in lowercase: $"         
B DB "Output in uppercase: $"
                            
.CODE
MAIN PROC
MOV AX, @DATA               ; moving data to AX
MOV DS, AX                  ; DS can't be sent value directly, so first it is stored in AX

MOV AH, 9
LEA DX, A                   ; A has the string value: 'Enter char in lower'
INT 21H 

MOV AH, 1                   ; 1 is used for sinle value input
INT 21H
MOV BH, AL                  ; the input value is stored in BH register     

MOV AH, 2
MOV DL, 10                  ; takes cursor to new line 
INT 21H
MOV DL, 13                  ; moves cursor to the front of new line
INT 21H  

MOV CH, BH
SUB CH, 20h                 ; A = a - 20h

MOV AH, 9
LEA DX, B                   ; B has the string value: 'Output in upper'
INT 21H

MOV AH, 2                   ; 2 is used for single output
MOV DL, CH                  ; displays the input value
INT 21H

  MOV AH, 4CH               
  INT 21H
  MAIN ENDP                 ; ends the procedure
END                         
