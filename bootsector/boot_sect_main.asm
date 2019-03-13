[org 0x7c00]; tell the assembler that our offset is bootsector code
%include "boot_sect_print.asm"
%include "boot_sect_print_hex.asm"
; data 
HELLO:
    db 'Hello, World',0

GOODBYE:
    db 'Goodbye', 0

; The main routine makes sure that parameters are ready an then calls the function
mov bx,GOODBYE
call print

call print_nl

mov dx, 0x12fe
call print_hex

jmp $

times 510-($-$$) db 0
dw 0xaa55