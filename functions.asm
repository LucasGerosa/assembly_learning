global _start
section .data
	addr db "yellow" ;addr will point to the first byte of the string
	yellowLen equ $ - addr
	;equ: used to define a symbolic constant with a specific value. When the assembler encounters the EQU directive, it substitutes the constant value for the symbol wherever it appears in the source code

section .text
_start:
	mov [addr], byte 'H' ;puts the bytes for 'H' in the addr location (Hellow)
	mov [addr+5], byte "!"
	mov [addr+6], byte 0x0a
	mov eax, 4
	mov ebx, 1
	mov ecx, addr
	mov edx, yellowLen
	inc edx
	inc edx
	int 0x80


	mov eax, 1
	mov ebx, 0
	int 0x80
