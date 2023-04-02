;calculates the power of 2
global _start

section .bss ;block starting symbol, used for variables


section .text
_start:
	mov ebx, 1
	mov ecx, 7
loop:
	add ebx, ebx
	dec ecx ;decrements ecx (subtracts 1 from ecx)
	cmp ecx, 0
	jg loop
	mov eax, 1
	int 0x80