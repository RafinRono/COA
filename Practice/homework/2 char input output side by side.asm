.model SMALL                      ; means a small model                                                                                                                           .model SMALL                ; means a small model
.STACK 100H                       ; 100 is the stack size

.DATA        
msg db 0ah, 0dh, "$"              ; )ah, 0dh keeps a new line before the string, this is just to start terminal after a new line immediately       
.code
main proc
    mov ax, @data;                ; moving data to AX
    mov ds, ax                    ; DS can't be sent value directly, so first it is stored in AX                  ; output the null string with the added new line before it
    
    mov ch, 0                     ; set counter to 0 initially
      
start:   
    cmp ch, 2                     ; compare if counter value is less than 2
    je exit                       ; if yes, exit the prog
    jne input                     ; otherwise go to input
    
input:   
    mov ah, 1                     ; ah is set to 1 for single input
    int 21h
    mov bl, al                    ; input value is stored in bl
         
    mov ah, 3                     ; this GETS the current cursor position  
    
    mov al, ch                    ; int 10h line resets the counter ch value, so to keep it we transfer the value to al
    int 10h                       ; this sets the cursor's currentrow and height in dh & dl respectively
    mov ch, al                    ; we retain the ch value by returning the value to it from al
      
    inc dh                        ; increase the row number, basically putting the cursor in the line below current
    dec dl                        ; decrease horizontal curson position, basically move it 1 char to the left
    
    mov ah, 2                     ; SETs the current cursor position
                    
    mov al, ch              
    int 10h
    mov ch, al
        
    mov dl, bl                    ; output the input value stored in bl
    int 21h 
      
    mov ah, 3                     ; get the current cursor position  
                     
    mov al, ch              
    int 10h
    mov ch, al
      
    dec dh                        ; put the curson to the line above
    
    mov ah, 2                                 
    
    mov al, ch              
    int 10h
    mov ch, al  
    
    inc ch                        ; increase the counter
    jmp start                     ; loop back to compare the counter with the value 2

exit:       
mov ah, 4ch                       ; ends the process
int 21h

main endp                 
end 
                         
