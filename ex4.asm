global _start

section .text
_start:
	mov ebx, 42
	mov eax, 1
	jmp skip ;unconditionally jump to "skip" label
	mov ebx, 13
skip:
	int 0x80