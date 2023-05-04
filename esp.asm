global _start

_start:
	sub esp, 5
	mov [esp], byte 'H' ; the same as mov [esp], byte 0x48 ;or mov [esp], byte 72
	mov [esp+1], byte 'e'
	mov [esp+2], byte 'y'
	mov [esp+3], byte '!'
	mov [esp+4], byte 0x0A 

	mov eax, 4
	mov ebx, 1
	mov ecx, esp
	mov edx, 5 ;number of bytes to write
	int 0x80

	mov ebx, 0
	mov eax, 1
	int 0x80