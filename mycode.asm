.model small

.stack 100

.data
    display db  10d,13d, '*************************** $'
    display1 db 10d,13d, '*    Simple Mathematics   * $'
    display2 db 10d,13d, '*  [1] Addition           * $'   
    display3 db 10d,13d, '*  [2] Subtraction        * $'  
    display4 db 10d,13d, '*                         * $' 
    display5 db 10d,13d, '*************************** $'
    message1 db 10d,13d, 'What is your choice: $'
    message2 db 10d,13d, 'Enter first integer : $'
    message3 db 10d,13d, 'Enter second integer : $'
    message4 db 10d,13d, 'Result : $'
    message6 db 10d,13d, 'Thank you for running my program $'
    message7 db 10d,13d, 'Start Again [Y/N]? $'  
    message8 db 10d,13d, 'Error! your choice is not an option [Y/N] only $'
      
.code
    .startup 
    mov dx, offset display
    mov ah, 09h
    int 21h
    
    mov dx, offset display1
    mov ah, 09h
    int 21h
    
    mov dx, offset display2
    mov ah, 09h
    int 21h
    
    mov dx, offset display3
    mov ah, 09h
    int 21h
    
    mov dx, offset display4
    mov ah, 09h
    int 21h
    
    mov dx, offset display5
    mov ah, 09h
    int 21h 
    
    ;Choosing operations
    mov dx, offset message1
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h 
    sub al, 48
    
    ;1 and 2 comparison
    cmp al, 1
    je addition
        
    cmp al, 2
    je subtraction    
    
    mov ah, 09h
    int 21h
    jmp .startup    
        
    
    
   ;addtion
    addition:
    ;1st integer
    mov dx, offset message2
    mov ah, 09h
    int 21h
    
    ;input
    mov ah, 01h
    int 21h
    mov bl,al
                
    ;2nd integer            
    mov dx, offset message3
    mov ah, 09h
    int 21h
    
    ;input
    mov ah, 01h
    int 21h
    mov bh,al
    
    ;sum
    mov ah, 09h
    mov dx, offset message4
    int 21h
    
    add bl,bh
    sub bl,48
    mov ah,02h
    mov dl,bl
    int 21h
    
    mov dx, offset message6
    mov ah, 09h
    int 21h
    
        
    ;start again?
    start_again:
    mov dx, offset message7
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
   
    
    ;compare Y/N
    cmp al, 'Y'
    cmp al, 'y'
    je restart
    
    cmp al, 'N'
    cmp al, 'n'
    je exit  

    mov dx, offset message8
    mov ah, 09h
    int 21h
    jmp start_again
     
   
    restart:
    jmp .startup
   
    exit:
    .exit   
    
    
    ;subtraction
    subtraction:
    ;1st integer
    mov dx, offset message2
    mov ah, 09h
    int 21h
    
    ;input
    mov ah, 01h
    int 21h
    mov bl,al
                
    ;2nd integer            
    mov dx, offset message3
    mov ah, 09h
    int 21h 
    
    ;input
    mov ah, 01h
    int 21h
    mov bh,al
    
    ;difference
    mov dx, offset message4
    mov ah, 09h
    int 21h
    
    sub bl,bh
    add bl,48
    mov ah,02h
    mov dl,bl
    int 21h
    
    mov dx, offset message6
    mov ah, 09h
    int 21h
    
    ;start again?
    start_again1:
    mov dx, offset message7
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
   
    
    ;compare Y/N
    cmp al, 'Y'
    cmp al, 'y'
    je restart
    
    cmp al, 'N'
    cmp al, 'n'
    je exit  

    mov dx, offset message8
    mov ah, 09h
    int 21h
    jmp start_again1
     
   
    restart1:
    jmp .startup
   
    exit1:
    .exit  
    
end



