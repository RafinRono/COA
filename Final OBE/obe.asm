.DATA

.CODE
MOV AX, @DATA
MOV DS, AX

MAIN PROC
    MOV CX, 16
    XOR BX, BX
    
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
    MOV CX, 16
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    
    LOOPING:
    ROR BX, 1
    JNC PRINT_0
    MOV DL, 31H
    INT 21H
    JMP ENDING
    
    PRINT_0:
    MOV DL, 30H
    INT 21H
    
    ENDING:
    LOOP LOOPING  
    
    MOV CX, 4
    
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H  
    
    OUTPUT_HEX:
    MOV DL, BL
    AND DL, 00001111b
    ROR BX, 4  
    
    CMP DL, 10
    JGE LETTER
    ADD DL, 30H
    INT 21H
    JMP LOOPING_OUTPUT
    
    LETTER:
    ADD DL, 37H
    INT 21H
    
    LOOPING_OUTPUT:
    LOOP OUTPUT_HEX
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    