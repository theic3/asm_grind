[bits 32]
section .text
global _start
global _strlen
_start:   
    sub esp, 0x4
    mov DWORD [esp], msg
    call _strlen
    add esp, 0x4
    push eax 

_strlen:
    push ebp 
    mov ebp, esp ; prologue 
    sub esp, 0x8
    mov DWORD [esp+0x4], 0x0
    mov edx, [ebp+0x8] ; move pointer to edx
    mov DWORD [esp], edx
    mov ecx, [esp+0x4]
    jmp _strlen_loop

_strlen_loop:
    add ecx, 1 ; set zero flag
    cmp byte [edx+ecx], 0x0
    jne _strlen_loop

_strlen_exit:
    mov eax, ecx
    mov esp, ebp ; epilogue
    pop ebp
    ret 

section .data  
    msg db "lmaoo", 0h