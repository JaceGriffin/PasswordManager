;---------------------------------------------------------------------------------------------------------------------------------
;Functions
;---------------------------------------------------------------------------------------------------------------------------------


;output: AX = num of chars
proc ReadFileToDx
    push bp
    mov bp, sp
    push dx
        
    ;open file for reading
    mov ah, 3Dh
    mov al, 0
    mov dx, [bp+4]
    int 21h
    
    ;read from file
    mov bx, ax
    mov cx, 100
    pop dx
    mov ah, 3Fh
    int 21h
    push ax
    
    ;close file
    mov ah, 3Eh
    int 21h
    
    pop ax
    pop bp
    ret 2
endp ReadFileToDx


;output: AX = num of chars
proc WriteDxToFile
    push bp
    mov bp, sp
    push dx
        
    ;open file for writing
    mov ah, 3Dh
    mov al, 1
    mov dx, [bp+4]
    int 21h
    
    ;write to file
    mov bx, ax
    mov cx, 100
    pop dx
    mov ah, 40h
    int 21h
    push ax
    
    ;close file
    mov ah, 3Eh
    int 21h
    
    pop ax
    pop bp
    ret 2
endp WriteDxToFile



;---------------------------------------------------------------------------------------------------------------------------------
;Variables
;---------------------------------------------------------------------------------------------------------------------------------


var dw 0