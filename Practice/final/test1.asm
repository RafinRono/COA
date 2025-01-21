.MODEL SMALL 
.STACK 100H

.DATA
ZEROS DB 0
ONES DB 0  
TESTING DB 0AH, 0DH, "INPUT:$"

.CODE
MAIN PROC         
    MOV AX, @DATA
    MOV DS, AX
          
    XOR BX, BX      
    MOV CX, 16 
    
    INPUT: 
    MOV AH, 1
    INT 21H
    CMP AL, 0DH
    JE OUTPUT
    SUB AL, 30H
    SHL BX, 1
    OR BL, AL
    LOOP INPUT     
    
    OUTPUT:   
    MOV AH, 9    
    LEA DX, TESTING
    INT 21H
    
    MOV AH, 2 
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH 
    INT 21H
    
    MOV CX, 16    
     
    PRINT:  
    SHL BX, 1
    JNC PRINT_0
    MOV DL, 31H
    INT 21H
    JMP LOOPING
    
    PRINT_0:
    MOV DL, 30H
    INT 21H
    
    LOOPING:
    LOOP PRINT

    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN