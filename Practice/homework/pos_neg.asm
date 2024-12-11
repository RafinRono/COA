.model SMALL                                       ; means a small model                                                                                                                         .model SMALL                ; means a small model
.STACK 100H                                        ; 100 is the stack size

.DATA                       
a db "Emter a number: ", 0Ah,0Dh,"$"    
positive db 0Ah,0Dh, "Positive $"    
negative db 0Ah,0Dh, "Negative $"        
                           
.code
main proc
    mov ax, @data;                                 ; moving data to AX
    mov ds, ax                                     ; DS can't be sent value directly, so first it is stored in AX
    
    mov ah, 1
    int 21h
    mov bh, al       
    int 21h
    mov bl, al
    
    cmp bh, "-"
    je negation
    jne compare
    
negation:
    neg bx
    jmp compare                               ; to keep the value as decimal, 30 is subtracted from hex equivalent value
    
compare:
    cmp bx, 0                                     ; compare bl and cl value                                     ; if they are equal, jump to equal label
    jge greater                                     ; if input is greater than 5, jumpt to greater label
    jl lesser                                      ; othrwise, the unput is less than 5
        
    greater:
        mov ah, 9
        lea dx, positive                           ; print string to signify input is greater
        int 21h      
        jmp end 
        
    lesser:
        mov ah, 9   
        lea dx, negative                               ; print string to signify input is smaller
        int 21h 
        jmp end 

end:        
mov ah, 4ch                                        ; close the program 
int 21h

main ENDP                 
END 
                         
