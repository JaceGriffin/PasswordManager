org 100h


call view


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
    
    ;TD: handle file not found
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
endp view   



;---------------------------------------------------------------------------------------------------------------------------------
;Variables
;---------------------------------------------------------------------------------------------------------------------------------


data_buffer db 100 dup('$')
data_filename db "..\..\Users\Cyber_User\Desktop\Documents\My_Docs\gitHubRepos\PasswordManager\data.txt", 0