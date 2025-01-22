.model SMALL                                                                                                                                                .model SMALL                ; means a small model
.STACK 100H                                        

.DATA                                
                           
.code
main proc
    mov ax, @data;                                 
    mov ds, ax                                     
           
    mov ah, 1
    int 21h        
    mov ax, ax  
    sub ax, 30h 
    
    int 21h
    mov bx, ax
    int 21h    
    mov cx, ax   
    
    sub bx, 30h
    sub cx 30h
                            
    cmp ax, bx                                                                         
    jl lesser
    jg bigger
        
    bigger:  
        cmp bx, cx  
        jg bx_is_big
        jl bx_is_small
        
    bx_is_big: 
        mov ah, 2 
        mov cx, 0 
        mov dx, cx
        int 21h
        jmp end      
        
    bx_is_small:  
        mov ah, 2
        mov bx, 0
        mov dx, bx
        int 21h    
        jmp end      
        
    lesser:
        mov ax, 0h
    
end:   
mov ah, 4ch                                     
int 21h

main ENDP                 
END 
                         
                                                 