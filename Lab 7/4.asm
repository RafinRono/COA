.model SMALL                                                                                                                                                .model SMALL                ; means a small model
.STACK 100H                                        

.DATA                                
                           
.code
main proc
    mov ax, @data;                                 
    mov ds, ax                                     
               
    mov ax, 4
    mov bx, -4    
    mov cx, 6
                            
    cmp ax, bx                                                                         
    jl lesser
    jg end
        
    lesser:  
        cmp bx, cx  
        jg bx_is_big
        jl bx_is_small
        
    bx_is_big:  
        mov ax, 0
        jmp end      
        
    bx_is_small:
        mov bx, 0
        jmp end
    
end:        
mov ah, 4ch                                     
int 21h

main ENDP                 
END 
                         
                                                 