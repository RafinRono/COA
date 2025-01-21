.MODEL SMALL 
.STACK 100H

.DATA
ZEROS DB 0
ONES DB 0  
TESTING DB 0AH, 0DH, "OUTPUT:$"  
NEW_LINE DB 0AH, 0DH, "NEWLINE", 0AH, 0DH, 24H

.CODE
BIN PROC               
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
    MOV CX, 16    
     
    PRINT:  
    ROL BX, 1
    JNC PRINT_0
    MOV DL, 31H
    INT 21H
    JMP LOOPING
    
    PRINT_0:
    MOV DL, 30H
    INT 21H
    
    LOOPING:
    LOOP PRINT
    
    RET
    BIN ENDP      

HEX PROC               
    XOR BX, BX      
    MOV CX, 4
    
    INPUT_HEX:   
    MOV AH, 1 
    INT 21H
    CMP AL, 0DH
    JE OUTPUT_HEX 
    
    CMP AL, 40H
    JGE LETTER
    SUB AL, 30H
    JMP LOOPING_HEX 
    
    LETTER:  
    SUB AL, 37H   
    
    LOOPING_HEX:  
    SHL BX, 4
    OR BL, AL
    LOOP INPUT_HEX 
    
    OUTPUT_HEX:   
    MOV AH, 9  
    LEA DX, TESTING
    INT 21H
    
    MOV AH, 2  
    MOV CX, 4    
     
    PRINT_HEX: 
    MOV DL, BH
    SHR DL, 4 
    ROL BX, 4 
    
    CMP DL, 10
    JGE PRINT_NUMBER
    ADD DL, 30H
    INT 21H
    JMP LOOPING_HEX_OUTPUT
    
    PRINT_NUMBER:
    ADD DL, 37H
    INT 21H
    
    LOOPING_HEX_OUTPUT:
    LOOP PRINT_HEX
    
    RET
    HEX ENDP 

COUNT PROC   
    MOV CX, 16
    
    COUNTING:
    ROL BX, 1
    JNC COUNT_0
    INC ONES
    JMP LOOP_COUNT
    
    COUNT_0:
    INC ZEROS
    
    LOOP_COUNT:
    LOOP COUNTING    
    
    MOV AH, 9
    LEA DX, NEW_LINE
    INT 21H
    
    MOV AH, 2
    MOV BL, ONES  
    ADD BL, 30H
    MOV DL, BL
    INT 21H
    
    MOV AH, 9
    LEA DX, NEW_LINE
    INT 21H
    
    MOV AH, 2
    MOV BL, ZEROS 
    ADD BL, 30H
    MOV DL, BL
    INT 21H  
    
    RET
    COUNT ENDP

MAIN PROC    
    MOV AX, @DATA
    MOV DS, AX
    CALL BIN    
    CALL COUNT  
    CALL HEX
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN