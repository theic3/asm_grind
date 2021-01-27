strlen:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-8], 0
.L3:
        mov     rax, QWORD PTR [rbp-24]
        movzx   eax, BYTE PTR [rax]
        test    al, al
        je      .L2
        add     QWORD PTR [rbp-24], 1
        add     QWORD PTR [rbp-8], 1
        jmp     .L3
.L2:
        mov     rax, QWORD PTR [rbp-8]
        pop     rbp
        ret
.LC0:
        .string "Too many arguments\n"
.LC1:
        .string "String length: %ld\n"
.LC2:
        .string "Pass in at least 1 arugment\n"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     DWORD PTR [rbp-20], edi
        mov     QWORD PTR [rbp-32], rsi
        cmp     DWORD PTR [rbp-20], 2
        jle     .L6
        mov     edi, OFFSET FLAT:.LC0
        call    puts
        jmp     .L7
.L6:
        cmp     DWORD PTR [rbp-20], 2
        jne     .L8
        mov     rax, QWORD PTR [rbp-32]
        add     rax, 8
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    strlen
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC1
        mov     eax, 0
        call    printf
        jmp     .L7
.L8:
        mov     edi, OFFSET FLAT:.LC2
        call    puts
.L7:
        mov     eax, 0
        leave
        ret
