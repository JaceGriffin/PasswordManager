org 100h


call view


mov ah, 0
int 16h
ret
                                                                                                                                  
                                                                                                                                  
                                                                                                                                  
;---------------------------------------------------------------------------------------------------------------------------------
;Functions
;---------------------------------------------------------------------------------------------------------------------------------


proc view
    push offset data_filename
    call ReadFileToDX
    
    ;print file content
    mov ah, 9
    int 21h
endp view



;---------------------------------------------------------------------------------------------------------------------------------
;Variables
;---------------------------------------------------------------------------------------------------------------------------------


enter_description_msg db "Enter password description: $"
enter_password_msg db "Enter password: $"
data_buffer db 100 dup('$')
data_filename db "..\..\Users\Cyber_User\Desktop\Documents\My_Docs\gitHubRepos\PasswordManager\data.txt", 0


include stdfiles.inc