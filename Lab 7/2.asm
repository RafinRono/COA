.model SMALL                                                                                                                                                .model SMALL                ; means a small model
.STACK 100H                                        

.DATA                                
                        
.code
main proc
    mov ax, @data;                                 
    mov ds, ax                                     
               
    mov cx, 256
    
    mov ah, 2      
    mov bx, 0
    
top:  
    mov dx, bx
    int 21h   
    inc bx
    loop top

mov ah, 4ch                                     
int 21h

main ENDP                 
END 
                         
                                                 