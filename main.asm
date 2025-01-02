org 100h


call add


mov ah, 0
int 16h
ret
                                                                                                                                  
                                                                                                                                  
                                                                                                                                  
;---------------------------------------------------------------------------------------------------------------------------------
;Functions
;---------------------------------------------------------------------------------------------------------------------------------


proc view
    ;read file
    push offset data_filename
    mov dx, offset data_buffer
    call ReadFileToDX
    
    ;print file content
    mov ah, 9
    int 21h
    
    ret
endp view


proc add
    ;get user input
    mov dx, offset enter_description_msg
    mov ah, 9
    int 21h
    mov dx, offset data_buffer
    mov ah, 0ah
    int 21h
    
    ;write input to file
    mov dx, offset data_buffer+2
    push offset data_filename
    call WriteDxToFile
    
    ret
endp add
    
    



;---------------------------------------------------------------------------------------------------------------------------------
;Variables
;---------------------------------------------------------------------------------------------------------------------------------


enter_description_msg db "Enter password description: $"
enter_password_msg db "Enter password: $"
data_buffer db 100h dup('0')
data_filename db "..\..\Users\Cyber_User\Desktop\Documents\My_Docs\gitHubRepos\PasswordManager\data.txt", 0



;---------------------------------------------------------------------------------------------------------------------------------
;Includes
;---------------------------------------------------------------------------------------------------------------------------------


include stdfiles.inc