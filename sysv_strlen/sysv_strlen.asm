[bits 64]
section .text
global _start
global strlen
_start:
    push rbp
    mov rbp, rsp
    mov rdi, msg
    call strlen ; push instruction after call (ret addr) & jmp
    push rax
    mov rsp, rbp
    pop rbp
    ret

strlen:
    push rbp ; rbp of _start , pushes saved rbp
    mov rbp, rsp ; makes rbp the top of the stack
    sub rsp, 0x10
    mov rcx, 0x0
    jmp strlen_loop

strlen_loop:
    add rcx, 1
    cmp byte [rdi+rcx], 0x0
    jne strlen_loop

strlen_exit:
    mov rax, rcx
    mov rsp, rbp
    pop rbp
    ret

section .data
    msg db "lmao", 0h