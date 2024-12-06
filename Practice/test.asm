.model SMALL  
.STACK 100H

.DATA
A DB "Hello there!! $"  
B DB "Input: $"
C DB "Output: $"

.CODE
MAIN PROC
MOV AX, @DATA      ;testin a commen
MOV DS, AX
    
MOV AH, 9
LEA DX, A         ; hello world
INT 21H    

MOV AH, 2
MOV DL, 10     ; new line  pt1
INT 21H

MOV DL, 13      ; new line pt2
INT 21H 
          
MOV AH, 9
LEA DX, B          ;tells for input 1
INT 21H 

MOV AH, 1        ;input 1
INT 21H
MOV BH, AL  

MOV AH, 2
MOV DL, 10     ; new line  pt1
INT 21H

MOV DL, 13      ; new line pt2
INT 21H 
          
MOV AH, 9
LEA DX, C         ;tells for output 1
INT 21H 

MOV AH, 2        ;output  1
MOV DL, BH
INT 21H      

MOV AH, 2
MOV DL, 10     ; new line  pt1
INT 21H

MOV DL, 13      ; new line pt2
INT 21H  
            
MOV AH, 9
LEA DX, B          ;tells for input 2
INT 21H 

MOV AH, 1        ;input   2
INT 21H
MOV CH, AL    

MOV AH, 2
MOV DL, 10     ; new line  pt1
INT 21H

MOV DL, 13      ; new line pt2
INT 21H     

MOV AH, 9
LEA DX, C          ;tells for output 2
INT 21H 

MOV AH, 2        ;output   2
MOV DL, CH
INT 21H
  
  MOV AH, 4CH
  INT 21H
  MAIN ENDP
END
