[bits 32]
section .text
global _start
global _strlen
_start:   
    sub esp, 0x4 ; create space on stack
    mov DWORD [esp], msg ; move msg to dereferenced esp
    call _strlen
    jmp _exit

_strlen:
    push ebp ; prologue 
    mov ebp, esp
    mov edx, [ebp+0x8] ; move pointer to msg to edx
    mov ecx, 0x0 ; move counter to ecx
    jmp _strlen_loop

_strlen_loop:
    cmp byte [edx+ecx], 0x0 ; check byte at [(msg*+index)] if its null '\0'
    je _strlen_exit

_inc_counter:
    add ecx, 1
    cmp byte [edx+ecx], 0x0
    jne _strlen_loop

_strlen_exit:
    mov eax, ecx ; move the counter to eax (ret val)
    mov esp, ebp ; epilogue
    pop ebp
    ret 4 ; clean up the stack (callee)

_exit:
    mov eax, 0x1
    mov edi, 0x0
    int 0x80

section .data  
    msg db `wow\0nice`, 0h