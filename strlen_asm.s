.global main
main:
.intel_syntax noprefix

	push rbp
	mov rbp, rsp
	;sub rsp, 0x20
	mov edi, dword [rbp-0x16]
	mov rsi, dword [rbp-0x24]
	mov rdx, [rbp-0x16]
	cmp rdx, 0x2
	jle call_strlen
	lea rdi, [too_many_args_error]

call_strlen:
	mov cl, [rbp-0x14]
	cmp cl, 0x2
	jne print_error
	mov rax, qword [rbp-0x20]
	add rax, 0x8
	mov rax, qword [rax]
	mov rdi, rax
	call strlen
	mov qword [rbp-0x8], rax
	mov rax, qword [rbp-0x8]
	mov rsi, rax
	lea rdi, [print_results]
	mov eax, 0x0
	call printf
	mov eax, 0x0
	mov rsp, rbp
	pop rbp
	ret
strlen:
	push rbp
	mov rbp, rsp
	mov qword [rbp-0x18], rdi
	mov cl, [rbp-0x8]
	mov cl, 0x0
	mov rax, qword [rbp-0x18]
	mov eax, byte [rax]
	test al, al
	jne increment_result
	mov rax, qword [rbp-0x8]
	pop rbp
	ret
increment_result:
	add cl, 0x1
	mov [rbp-0x18], cl
	add dl, 0x1
	mov [rbp-0x8], dl
print_results:
	.string "String length: %ld\n"
print_error:
	lea rdi, [few_args_error]
	call puts
few_args_error:
	.string "Pass in at least 1 argument\n"
too_many_args_error:
	.string "Too many arguments\n"	
