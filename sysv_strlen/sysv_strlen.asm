[bits 64]
section .text
global _start
global strlen
_start:
    push rbp ; prologue
    mov rbp, rsp
    mov rdi, msg 
    call strlen  
    push rax ; push return value
    mov rsp, rbp ; epilogue
    pop rbp
    ret

strlen:
    push rbp ; rbp of _start , pushes saved rbp
    mov rbp, rsp ; makes rbp the top of the stack
    sub rsp, 0x10 ; create space on the stack
    mov rcx, 0x0 ; move 0x0 to rcx (counter)
    jmp strlen_loop

strlen_loop:
    add rcx, 1 ; increment counter
    cmp byte [rdi+rcx], 0x0 ; check byte at [(msg*+index)] if its null '\0'
    jne strlen_loop

strlen_exit:
    mov rax, rcx ; move counter to rax (return value)
    mov rsp, rbp ; epilogue
    pop rbp
    ret

section .data
    msg db "thisiscool", 0h