.model SMALL                                       ; means a small model                                                                                                                         .model SMALL                ; means a small model
.STACK 100H                                        ; 100 is the stack size

.DATA                       
a db "Emter a number: $";      
great db 0ah, 0dh, 0ah, 0dh, "greater than 5 $"    ; holds the string value to notify greater 
less db 0ah, 0dh, 0ah, 0dh, "less than 5 $"        ; holds the string value to notify lesser 
eq db 0ah, 0dh, 0ah, 0dh, "equal to 5 $"           ; holds the string value to notify equal 
                           
.code
main proc
    mov ax, @data;                                 ; moving data to AX
    mov ds, ax                                     ; DS can't be sent value directly, so first it is stored in AX
    
    mov cl, 5                                      ; set a var to compare value with
;input:
    mov ah, 9
    lea dx, a
    int 21h
    
    mov ah, 1                                      ; ah is set to 1 for single input
    int 21h
    mov bl, al
    sub bl, 30h                                    ; to keep the value as decimal, 30 is subtracted from hex equivalent value
    
    cmp bl, cl                                     ; compare bl and cl value
    je equal                                       ; if they are equal, jump to equal label
    jg greater                                     ; if input is greater than 5, jumpt to greater label
    jl lesser                                      ; othrwise, the unput is less than 5
    
    equal:                                         ; set to 9 for string output
        mov ah, 9                                  ; print string to signify euqlity
        lea dx, eq
        int 21h
        jmp end                                    ; jump to prog end
        
    greater:
        mov ah, 9
        lea dx, great                              ; print string to signify input is greater
        int 21h      
        jmp end 
        
    lesser:
        mov ah, 9                                  ; print string to signify input is smaller
        lea dx, less
        int 21h 
        jmp end 

end:        
mov ah, 4ch                                        ; close the program 
int 21h

main ENDP                 
END 
                         
