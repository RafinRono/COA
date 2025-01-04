.model SMALL                                                                                                                                                       .model SMALL                ; means a small model
.STACK 100H                 

.DATA                       
A DB "char: $"         
B DB "Output: $"
                            
.CODE
MAIN PROC
MOV AX, @DATA               
MOV DS, AX                  

MOV AH, 9
LEA DX, A                   
INT 21H 

MOV AH, 1                   
INT 21H
MOV BH, AL                  

MOV AH, 2
MOV DL, 10                   
INT 21H
MOV DL, 13                  
INT 21H  

CMP BH, 61h
JL toLower
JGE toUpper

toLower:
      OR BH, 20h
      JMP exit

toUpper:
      AND BH, 00DFh
      JMP exit

exit:
    MOV AH, 9
    LEA DX, B                   
    INT 21H
    
    MOV AH, 2                   
    MOV DL, BH                  
    INT 21H
    
    
    MOV AH, 4CH               
    INT 21H
    MAIN ENDP                 
END                         
