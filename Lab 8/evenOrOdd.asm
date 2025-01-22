.model SMALL                                                                                                                                                       .model SMALL                ; means a small model
.STACK 100H                 

.DATA                       
A DB "Number: $"         
is_even DB "Number is Even$"    
is_odd DB "Number is Odd$"
                            
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

TEST BH, 01h                  
JZ even
JNZ odd

even:
      LEA DX, is_even
      MOV AH, 9
      INT 21H
      JMP exit

odd:
      LEA DX, is_odd
      MOV AH, 9
      INT 21H
      JMP exit

exit:    
    MOV AH, 4CH               
    INT 21H
    MAIN ENDP                 
END                         
