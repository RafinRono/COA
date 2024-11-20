.model SMALL                                                                                                                                                       .model SMALL                ; means a small model
.STACK 100H                

.DATA                       
A DB "Enter: $"         
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

MOV CH, BH
SUB CH, 20h                 

MOV AH, 9
LEA DX, B                   
INT 21H

MOV AH, 2                   
MOV DL, CH                  
INT 21H

  MOV AH, 4CH               
  INT 21H
  MAIN ENDP                 
END                         
