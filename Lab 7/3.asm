.model SMALL                                                                                                                                                .model SMALL                ; means a small model
.STACK 100H                                        

.DATA                                
                           
.code
main proc
    mov ax, @data;                                 
    mov ds, ax                                     
               
    mov ah, 1
    int 21h
    mov dl, al
                            
    cmp al, "Z"                                                                         
    jle lesser
    jg end
        
    lesser:  
        cmp al, "A"  
        jge greater                          
        jl end
        
    greater:  
        mov ah, 2
        int 21h
        jmp end
    
end:        
mov ah, 4ch                                     
int 21h

main ENDP                 
END 
                         
                                                 