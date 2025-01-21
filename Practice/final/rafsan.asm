.DATA
INPUT    DB 'ENTER BINARY INPUT (16 bits): $'
REVERSE  DB 0AH,0DH, 'IN REVERSED ORDER: $'
COUNT0   DB 0AH,0DH, 'NUMBER OF 0s: $'
COUNT1   DB 0AH,0DH, 'NUMBER OF 1s: $'
PARITY   DB 0AH,0DH, 'NUMBER IS: $'
EVEN     DB 'EVEN$'
ODD      DB 'ODD$'
ZEROS    DB 0
ONES     DB 0
 
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    ; Input part
    MOV AH,9
    LEA DX, INPUT
    INT 21H
    XOR BX,BX
    MOV CX,16     
    
INPUT_LOOP:
    MOV AH,1
    INT 21H
    CMP AL,0DH
    JE INPUT_DONE
    AND AL,0FH
    SHL BX,1
    OR BL,AL
    LOOP INPUT_LOOP  
    
INPUT_DONE:
    ; Reset counters
    MOV ZEROS, 0
    MOV ONES, 0
    ; Reverse the number
    MOV CX,16
    XOR DX,DX
REVERSE_LOOP:
    SHL BX,1
    RCR DX,1
    LOOP REVERSE_LOOP
    MOV BX,DX
    ; Display reversed number and count bits
    MOV AH,9
    LEA DX, REVERSE
    INT 21H
    MOV CX,16
DISPLAY_LOOP:
    ROL BX,1
    JNC ZERO_BIT
    ; Count and display 1
    INC ONES
    MOV AH,2
    MOV DL,31H
    INT 21H
    JMP CONTINUE_DISPLAY
ZERO_BIT:
    ; Count and display 0
    INC ZEROS
    MOV AH,2
    MOV DL,30H
    INT 21H
CONTINUE_DISPLAY:
    LOOP DISPLAY_LOOP
    ; Display count of 0s
    MOV AH,9
    LEA DX, COUNT0
    INT 21H
    MOV AL, ZEROS
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21H
    ; Display count of 1s
    MOV AH,9
    LEA DX, COUNT1
    INT 21H
    MOV AL, ONES
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21H
    ; Check LSB for odd/even
    MOV AH,9
    LEA DX, PARITY
    INT 21H
    TEST BH, 1000000b
    JNZ NUMBER_ODD
    LEA DX, EVEN
    JMP PRINT_PARITY
NUMBER_ODD:
    LEA DX, ODD
PRINT_PARITY:
    MOV AH,9
    INT 21H
    ; Exit program
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN