.model SMALL                                                                                                                                                .model SMALL                ; means a small model
.STACK 100H                                        

.DATA                                
                        
.code
main proc
    mov ax, @data;                                 
    mov ds, ax                                     
               
    mov cx, 5
    
    mov ah, 2      
    mov bl, 1    
    mov bh, 0

    
top:  
    mov dl, bl  
    add dl, 30h
    int 21h   
    add bh, bl
    inc bl
    loop top
             
mov dl, bh   
int 21h
mov ah, 4ch                                     
int 21h

main ENDP                 
END 
                         
                                                 