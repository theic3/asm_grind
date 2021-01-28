[bits 32]
section .text
global _start
global _strlen
_start:   
    sub esp, 0x4 ; create space on stack
    mov DWORD [esp], msg ; move msg to dereferenced esp
    call _strlen
    add esp, 0x4 ; clean up stack (caller)
    jmp _exit

_strlen:
    push ebp ; prologue 
    mov ebp, esp
    sub esp, 0x8 ; create space on the stack
    mov DWORD [esp+0x4], 0x0 ; set counter to 0
    mov edx, [ebp+0x8] ; move pointer to msg to edx
    mov DWORD [esp], edx ; move pointer to msg to dereferenced esp
    mov ecx, [esp+0x4] ; move counter to ecx
    jmp _strlen_loop

_strlen_loop:
    add ecx, 1 ; increment counter
    cmp byte [edx+ecx], 0x0 ; check byte at [(msg*+index)] if its null '\0'
    jne _strlen_loop

_strlen_exit:
    mov eax, ecx ; move the counter to eax (ret val)
    mov esp, ebp ; epilogue
    pop ebp
    ret 

_exit:
    mov eax, 0x1
    int 0x80

section .data  
    msg db "hi_rj!", 0h