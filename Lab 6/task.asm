.model SMALL                                                                                                                                            
.STACK 100H                 

.DATA                       
A DB "Input: $"         
B DB "Output: $"    
C DB "In correct order $"
                            
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
INT 21H
MOV BL, AL                   

MOV AH, 2
MOV DL, 10                   
INT 21H
MOV DL, 13                  
INT 21H  

MOV AH, 9
LEA DX, B                   
INT 21H  

MOV AH, 9
LEA DX, C                   
INT 21H
         
MOV AH, 2
MOV DL, BL                   
INT 21H

MOV AH, 2                   
MOV DL, BH                  
INT 21H

  MOV AH, 4CH               
  INT 21H
  MAIN ENDP                 
END                         
