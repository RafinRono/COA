.model SMALL                ; means a small model
.STACK 100H                 ; 100 is the stack size

.DATA                       ; data segment, stores the variable values
A DB "Hello there!! $"  
B DB "Input: $"
C DB "Output: $"
                            ; code section
.CODE
MAIN PROC
MOV AX, @DATA               ; moving data to AX
MOV DS, AX                  ; DS can't be sent value directly, so first it is stored in AX
    
MOV AH, 9                   ; 9 means outputting a string
LEA DX, A                   ; the value stored in A is sent for output
INT 21H                     ; shows the output terminal/display

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
LEA DX, C                   ; C holds a string value of: 'output'
INT 21H                     ; this brings the putput terminal/display
                    
MOV AH, 2                   ; 2 is used for single output
MOV DL, BH                  ; shows the output of single input
INT 21H      

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
LEA DX, C                   ; C holds the value of string: 'ouput'
INT 21H 

MOV AH, 2                   ; 2 is used for single output
MOV DL, CH                  ; displays the input value
INT 21H                     ; for displaying the screen        

MOV AH, 2
MOV DL, 10                  ; takes cursor to new line 
INT 21H
MOV DL, 13                  ; moves cursor to the front of new line
INT 21H     

ADD BH, CH
SUB BH, 30h

MOV AH, 2                   ; 2 is used for single output
MOV DL, BH                  ; displays the input value
INT 21H  

;------------------------------------------------------------------------------------------------------------

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
LEA DX, C                   ; C holds a string value of: 'output'
INT 21H                     ; this brings the putput terminal/display
                    
MOV AH, 2                   ; 2 is used for single output
MOV DL, BH                  ; shows the output of single input
INT 21H      

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
LEA DX, C                   ; C holds the value of string: 'ouput'
INT 21H 

MOV AH, 2                   ; 2 is used for single output
MOV DL, CH                  ; displays the input value
INT 21H                     ; for displaying the screen        

MOV AH, 2
MOV DL, 10                  ; takes cursor to new line 
INT 21H
MOV DL, 13                  ; moves cursor to the front of new line
INT 21H     

SUB BH, CH
ADD BH, 30h

MOV AH, 2                   ; 2 is used for single output
MOV DL, BH                  ; displays the input value
INT 21H  
  
  MOV AH, 4CH               ; used for closing 
  INT 21H
  MAIN ENDP                 ; ends the procedure
END                         ; end program
