.model SMALL                                                                                                                                                       .model SMALL                ; means a small model
.STACK 100H                 

.DATA                       
INPUT DB "INPUT: $"
OUTPUT DB  0AH, 0DH,"OUTPUT $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX    
    MOV AH, 9
    LEA DX, INPUT
    INT 21H
    
    XOR BX, BX
    MOV CL, 4
    MOV AH, 1
    
    FOR:
    INT 21H
    CMP AL, 0DH
    JE OUTPUT_
    CMP AL, 41H
    JGE LETTER
    AND AL, 0FH
    JMP SHIFT
    
    LETTER:
    SUB AL, 37H
    
    SHIFT:
    SHL BX, 4
    OR BL, AL
    JMP FOR
    
    OUTPUT_:
    MOV AH, 9
    LEA DX, OUTPUT
    INT 21H
    MOV CX, 4
    MOV AH, 2
    
    AGAIN:
    MOV DL, BH
    SHR DL, 4
    ROL BX, 4
    
    CMP DL, 10
    JGE LETTEROUT
    ADD DL, 30h
    INT 21H
    JMP EXIT
    
    LETTEROUT:
    ADD DL, 37h
    INT 21H
    
    EXIT:
    LOOP AGAIN
    MOV AH, 4CH 
    int 21h
    MAIN ENDP
END MAIN
