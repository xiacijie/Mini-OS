mov ah, 0x0e ;tty mode

;attempt 1, fails because it tries to print the memory address, not its actual contents
mov al, "1"
int 0x10
mov al, the_secret
int 0x10


;attempt 2 Add the BIOS starting offset 0x7c00 to the memory address of 'X'
mov al,"3"
int 0x10
mov bx, the_secret
add bx, 0x7c00
mov al,[bx]
int 0x10


jmp $ ; infinite loop
the_secret:
    db 'X'

; zero padding and magic bios number
times 510-($-$$) db 0
dw 0xaa55


