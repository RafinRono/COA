.model small
.stack 100h
.data
.code
 
main proc
    mov ax, @data
    mov ds, ax
    xor bx, bx; mov bx, 0 and bx, 0
    mov cl, 4
    mov ah, 1
    input:
    int 21h
    cmp al, 0Dh                                                  

 
    je output                                                    
    cmp al, 41h
    jge letter
    and al, 0Fh; sub al, 30h
    jmp shift
    letter:                                                       
    sub al, 37h; 41h-37h = 10 (A)
    shift:
    shl bx, cl
    or bl, al
    jmp input
              ;input

    output: 
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    mov cx, 4
    mov ah, 2

    again:
    mov dl,bh
    shr dl,4
    rol bx,4
    cmp dl,10
    jge letterout
    add dl,30h
    int 21h
    jmp exit
    letterout:
    add dl,37h     ; 37h/55
    int 21h
    jmp exit
    exit:
    loop again

    mov ah, 4ch
    int 21h
    main endp
end main