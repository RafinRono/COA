.model SMALL                                                                                                                                                       .model SMALL                ; means a small model
.STACK 100H                 

.DATA                       

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 2
    MOV DL, "?"
    INT 21H                                
    
    MOV DL, 10
    INT 21H   
    MOV DL, 13
    INT 21H
         
    MOV CX, 0
    
    INPUT:
    MOV AH, 1
    INT 21H
    
    CMP AL, 0DH
    JE PRINT
    
    PUSH AX
    INC CX
    
    JMP INPUT        

PRINT:      
    MOV AH, 2
    INT 21H 
    
    MOV DX, 10
    INT 21H   
    MOV DX, 13
    INT 21H
    
OUTPUT:

    POP BX
    MOV DX, BX
    INT 21H
    
    LOOP OUTPUT
        
MOV AH, 4CH
INT 21H
MAIN ENDP
END MAIN