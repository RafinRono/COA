.model SMALL                                                                                                                                               .model SMALL                ; means a small model
.STACK 100H                 

.DATA                       
msg db 0ah, 0dh, "Hello, world! $"
                            
.code
main proc
mov ax, @data
mov ds, ax
start:
    mov ah, 9;
    lea dx, msg;
    int 21h;
    jmp start       

main ENDP                 
END 
                         
