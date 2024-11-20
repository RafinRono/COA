.model SMALL                      ; means a small model                                                                                                                           .model SMALL                ; means a small model
.STACK 100H                       ; 100 is the stack size

.DATA        
msg db 0ah, 0dh, "$"              ; )ah, 0dh keeps a new line before the string, this is just to start terminal after a new line immediately       
.code
main proc
    mov ax, @data;                ; moving data to AX
    mov ds, ax                    ; DS can't be sent value directly, so first it is stored in AX
        
    mov ah, 9                     ; set to 9 for string output
    int 21h
    lea dx, msg                   ; output the null string with the added new line before it
    
    mov ch, 0                     ; set counter to 0 initially
      
start:   
    cmp ch, 2                     ; compare if counter value is less than 2
    je exit                       ; if yes, exit the prog
    jne input                     ; otherwise go to input
    
input:   
    mov ah, 1                     ; ah is set to 1 for single input
    int 21h
    mov bl, al                    ; input value is stored in bl
         
    mov ah, 3                     ; this gets the current cursor position
    ;mov bh, 0    
    
    mov al, ch              
    int 10h
    mov ch, al
      
    inc dh 
    dec dl   
    
    mov ah, 2                
    ;mov bh, 0  
                    
    mov al, ch              
    int 10h
    mov ch, al
        
    mov ah, 2
    mov dl, bl      
    int 21h 
      
    mov ah, 3                
    ;mov bh, 0 
                     
    mov al, ch              
    int 10h
    mov ch, al
      
    dec dh  
    
    mov ah, 2                
    ;mov bh, 0                  
    
    mov al, ch              
    int 10h
    mov ch, al  
    
    inc ch
    jmp start

exit:       
mov ah, 4ch
int 21h

main endp                 
end 
                         
