[bits 64]
section .text
global _start
global strlen
_start:
    push rbp ; prologue
    mov rbp, rsp
    mov rdi, msg 
    call strlen  
    mov rsp, rbp ; epilogue
    pop rbp
    ret

strlen:
    push rbp ; rbp of _start , pushes saved rbp
    mov rbp, rsp ; makes rbp the top of the stack
    mov rcx, 0x0 ; move 0x0 to rcx (counter)
    jmp strlen_loop

strlen_loop:
    cmp byte [rdi+rcx], 0x0 ; check byte at [(msg*+index)] if its null '\0'
    je strlen_exit ; exit at first null-byte encounter (no off-by-1 or lot)

inc_counter:
    inc rcx ; increment counter
    cmp byte [rdi+rcx], 0x0 ; check byte at [(msg*+index)] if its null '\0'
    jne strlen_loop

strlen_exit:
    mov rax, rcx ; move counter to rax (return value)
    mov rsp, rbp ; epilogue
    pop rbp
    ret

section .data
    msg db `offbyone\0j!`, 0h