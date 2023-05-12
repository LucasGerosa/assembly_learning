global exit
global print_new_line
global GetNumber

section .data
	new_line db 0x0a

exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80
    ret

print_new_line:
	mov eax, 4
	xor ebx, ebx
	mov ecx, new_line ;note: ecx needs to store an address, not a value, or it won't work.
	mov edx, 1
	int 0x80
	ret

GetNumber:
    pusha ;push all registers onto the stack
	get:
		mov eax, 3
		mov ebx, 0
		mov edx, 1
		int 0x80
		cmp byte [ecx], 0x30
		jl get
		cmp byte [ecx], 0x39
		jg get
		popa ;pop all registers off the stack
		;call print_new_line
	ret

