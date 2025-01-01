org 100h


call view
 

end_of_prog:

mov ah, 0
int 16h
ret
                                                                                                                                  
                                                                                                                                  
                                                                                                                                  
;---------------------------------------------------------------------------------------------------------------------------------
;Functions
;---------------------------------------------------------------------------------------------------------------------------------


proc view
    ;open file for reading
    mov ah, 3Dh
    mov al, 0
    mov dx, offset data_filename
    int 21h
    
    ;read from file
    mov bx, ax
    mov cx, 100
    mov dx, offset data_buffer
    mov ah, 3Fh
    int 21h
    
    ;print file content
    mov ah, 9
    int 21h    
    ret
    
    ;close file
    mov ah, 3Eh
    int 21h
endp view


proc error
    mov ah, 9
    mov dx, offset error_msg
    int 21h
    jmp end_of_prog
endp error



;---------------------------------------------------------------------------------------------------------------------------------
;Variables
;---------------------------------------------------------------------------------------------------------------------------------


data_buffer db 100 dup('$')
data_filename db "..\..\Users\Cyber_User\Desktop\Documents\My_Docs\gitHubRepos\PasswordManager\ata.txt", 0