.model SMALL                           ; means a small model                                                                                                                                  .model SMALL                ; means a small model
.STACK 100H                            ; 100 is the stack size

.DATA                       
b db 0ah, 0dh, 0ah, 0dh, "Thank you $" ; holds the string value
                           
.code
main proc
    mov ax, @data                      ; moving data to AX
    mov ds, ax                         ; DS can't be sent value directly, so first it is stored in AX
    
    mov cx, 0                          ; counter initially set to 1
    
    mov ah, 1                          ; ah is set to 1 for single input
    int 21h
    mov bl, al                       ; store input value to bl
    
looping:
    mov ah, 2                          ; ah is set to 2 for single output
    mov dl, bl
    int 21h
    inc cx                             ; incrementing counter value
    
    cmp cx, 50                         ; checking of counter value is 50 or not
    je leaving                         ; if yes, end prog
    jne looping                        ; if no, continue looping label
    
    leaving:
        mov ah, 9                      ; set to 9 for string output
        lea dx, b                      ; load string value in b for output
        int 21h 
        
mov ah, 4ch                            ; close the program 
int 21h

main ENDP                              ; end the program
END 
                         
