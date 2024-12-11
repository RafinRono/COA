.model SMALL                                                                                                                                               .model SMALL                ; means a small model
.STACK 100H                 

.DATA                       
msg db 0ah, 0dh, "Hello, world! $"    
b db 0ah, 0dh, 0ah, 0dh, "Bye, world! $";
                            
.code
main proc
    mov ax, @data;
    mov ds, ax
    
    mov cx, 1
    
hello:
    mov ah, 9
    lea dx, msg
    int 21h
    inc cx      
    
    cmp cx, 6
    je bye
    jne hello
    
    bye:
        mov ah, 9
        lea dx, b
        int 21h 
        
mov ah, 4ch
int 21h

main ENDP                 
END 
                         
