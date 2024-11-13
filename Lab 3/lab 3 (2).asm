.model SMALL                ; means a small model
.STACK 100H                 ; 100 is the stack size

.DATA                       ; data segment, stores the variable values
B DB "Input: $"   
D DB "Addition: $"         
E DB "Subtraction: $"
                            ; code section
.CODE
MAIN PROC
MOV AX, @DATA               ; moving data to AX
MOV DS, AX                  ; DS can't be sent value directly, so first it is stored in AX
          
MOV AH, 9
LEA DX, B                   ; B has the string value: 'input text'
INT 21H 

MOV AH, 1                   ; 1 is used for sinle value input
INT 21H
MOV BH, AL                  ; the input value is stored in BH register     

MOV AH, 2
MOV DL, 10                  ; takes cursor to new line 
INT 21H
MOV DL, 13                  ; moves cursor to the front of new line
INT 21H  
            
MOV AH, 9
LEA DX, B                   ; B outputs the string: 'input'
INT 21H 

MOV AH, 1                   ; 1 is used for single value input
INT 21H
MOV CH, AL                  ; input value is stored in CH

MOV AH, 2
MOV DL, 10                  ; takes cursor to new line 
INT 21H
MOV DL, 13                  ; moves cursor to the front of new line
INT 21H        

MOV AH, 9
LEA DX, D                   ; D holds the value of string: 'addition'
INT 21H

ADD BH, CH                  ; adds the digits stored in the two registers and stores them in BH
SUB BH, 30h                 ; the result is in ASCII Hexa needs to be converted to decimal

MOV AH, 2                   ; 2 is used for single output
MOV DL, BH                  ; displays the input value
INT 21H 

MOV AH, 2                   ; 2 is used for outputting a single value
MOV DL, 10                  ; takes cursor to new line 
INT 21H
MOV DL, 13                  ; moves cursor to the front of new line
INT 21H 
          
MOV AH, 9
LEA DX, B                   ; B has the string value: 'input text'
INT 21H 

MOV AH, 1                   ; 1 is used for sinle value input
INT 21H
MOV BH, AL                  ; the input value is stored in BH register     

MOV AH, 2
MOV DL, 10                  ; takes cursor to new line 
INT 21H
MOV DL, 13                  ; moves cursor to the front of new line
INT 21H  
            
MOV AH, 9
LEA DX, B                   ; B outputs the string: 'input'
INT 21H 

MOV AH, 1                   ; 1 is used for single value input
INT 21H
MOV CH, AL                  ; input value is stored in CH

MOV AH, 2
MOV DL, 10                  ; takes cursor to new line 
INT 21H
MOV DL, 13                  ; moves cursor to the front of new line
INT 21H        

MOV AH, 9
LEA DX, E                   ; E holds the value of string: 'subtraction'
INT 21H

SUB BH, CH                  ; subtracts the digits stored in the two registers and stores them in BH
ADD BH, 30h                 ; the result is in ASCII Hexa needs to be converted to decimal

MOV AH, 2                   ; 2 is used for single output
MOV DL, BH                  ; displays the input value
INT 21H 
  
  MOV AH, 4CH               ; used for closing 
  INT 21H
  MAIN ENDP                 ; ends the procedure
END                         ; end program
