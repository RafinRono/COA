.model SMALL                                                                                                                                                .model SMALL                ; means a small model
.STACK 100H                                        

.DATA                                
                           
.code
main proc
    mov ax, @data;                                 
    mov ds, ax                                     
               
    mov al, -1
                            
    cmp al, 0                                                                         
    jl lesser
    jge greater
        
    lesser:
        mov ah, 00FFh                                   
        jmp end
        
    greater:  
        mov ah, 0h
        jmp end
    
end:        
mov ah, 4ch                                     
int 21h

main ENDP                 
END 
                         
                                                 