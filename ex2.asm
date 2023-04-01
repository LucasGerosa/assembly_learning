global _start

_start:
    mov eax, 2
    mov ebx, 30
	sub ebx, 10
	mov ecx, 20
	add ebx, ecx
	mul ebx
	mov ebx, eax
	mov eax, 1 ;without this, it outputs "segmentation fault (core dumped)"
    int 0x80