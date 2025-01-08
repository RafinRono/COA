.model SMALL                                                                                                                                                       .model SMALL                ; means a small model
.STACK 100H                 

.DATA                       
INPUT DB "INPUT: $"
OUTPUT DB "OUTPUT IN REVERSE: $"

.CODE
INPUT1 PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV AH, 9
    LEA DX, INPUT
    INT 21H
    RET
ENDP

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    CALL INPUT1
    XOR BX, BX 
    MOV CX, 16
    
    WHILE_:
    MOV AH, 1
    INT 21H
    CMP AL, 0DH
    JE OUTPUT_
    AND AL, 0FH
    SHL BX, 1
    OR BL, AL
    LOOP WHILE_      
    
    OUTPUT_:     
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    
    MOV AH, 9
    LEA DX, OUTPUT
    INT 21H   
    
    MOV CX, 16
    IF:
    SHR BX, 1
    JNC THEN
    MOV AH, 2
    MOV DL, 31H
    INT 21H
    JMP DISPLAY
    
    THEN:
    MOV AH, 2
    MOV DL, 30H
    INT 21H
    JMP DISPLAY
    
    DISPLAY:
    LOOP IF
    
MOV AH, 4CH
INT 21H
MAIN ENDP
END MAIN