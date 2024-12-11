.model SMALL                                                                                                                                                .model SMALL                ; means a small model
.STACK 100H                                        

.DATA                                
                           
.code
main proc
    mov ax, @data;                                 
    mov ds, ax                                     
    
    mov ah, 1
    int 21h 
    sub ax, 30h
     
    int 21h
    mov bx, ax
    int 21h    
    mov cx, ax  
    
    sub bx, 30h
    sub cx, 30h
                            
    cmp ax, bx                                                                         
    jl move_0_to_dx
    jg move_1_to_dx  
    je check_bx
        
    check_bx:  
        cmp bx, cx   
        je end
        jg move_1_to_dx
        jl move_0_to_dx    
        
    move_0_to_dx:
        mov ah, 2  
        mov dx, 0h     
        int 21h
        jmp end   
            
    move_1_to_dx:
        mov ah, 2  
        mov dx, 1h
        int 21h
        jmp end    

    
end:        
mov ah, 4ch                                     
int 21h

main ENDP                 
END 
                         
                                                 