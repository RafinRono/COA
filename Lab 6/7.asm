.model SMALL                                                                                                                                                .model SMALL                ; means a small model
.STACK 100H                                        

.DATA                                
                           
.code
main proc
    mov ax, @data;                                 
    mov ds, ax                                     
    
    mov ah, 1
    int 21h
    mov al, al
    sub al, 30h
             
    cmp al, 1h                                                                         
    je print_o
    jne check_if_3
        
    print_e:  
        mov ah, 2
        mov dl, "e"
        int 21h
        jmp end  
    
    print_o:  
        mov ah, 2
        mov dl, "o"
        int 21h
        jmp end
        
    check_if_3:  
        cmp al, 3h                                                                         
        je print_o
        jne check_if_2  
        
    check_if_2:
        cmp al, 2h
        je print_e
        jne check_if_4  
        
    check_if_4:
        cmp al, 4h
        je print_e
        jne end     
        
end:        
mov ah, 4ch                                     
int 21h

main ENDP                 
END 
                         
                                                 