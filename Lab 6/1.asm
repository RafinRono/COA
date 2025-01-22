.model SMALL                                                                                                                                                .model SMALL                ; means a small model
.STACK 100H                                        

.DATA                                
                           
.code
main proc
    mov ax, @data;                                 
    mov ds, ax                                     
               
    mov ax, -1
                            
    cmp ax, 0                                                                         
    jl lesser
    jge end
        
    lesser:                                
        mov bx, -1

end:        
mov ah, 4ch                                     
int 21h

main ENDP                 
END 
                         
                                                 