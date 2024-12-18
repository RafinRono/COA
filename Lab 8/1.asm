.model SMALL                                                                                                                                                .model SMALL                ; means a small model
.STACK 100H                                        

.DATA                                
a db "Enter a character: $" 
b db 0ah, 0dh, 0ah, 0dh, "Thank you $"                        
.code
main proc
    mov ax, @data;                                 
    mov ds, ax                                     
               
    mov cx, 50
        
    mov ah, 9
    lea dx, a
    int 21h
    
    mov ah, 1
    int 21h
    mov bx, ax 
    
    mov ah, 2
    mov dx, 10
    int 21h
    mov dx, 13
    int 21h
    
    mov ah, 2
    mov dx, bx
    
top:
    int 21h
    loop top
    
mov ah, 9
lea dx, b
int 21h
mov ah, 4ch                                     
int 21h

main ENDP                 
END 
                         
                                                 