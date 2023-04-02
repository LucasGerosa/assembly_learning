global _start

	;In assembly language, a directive is a command or instruction that provides guidance or information to the assembler, the program that translates assembly language code into machine language code. Directives are not executable code, but rather are used to tell the assembler how to process the program.

	;Directives typically begin with a period (.) and are often used to define constants, allocate memory, declare variables, specify sections, and include other files. Directives are essential for creating structured, readable, and maintainable assembly language code, as they allow the programmer to specify information about the program's organization and layout that is not evident from the instructions themselves.

section .data ;section for constants
	msg db "Hello, world", 0x0a ;creates a string of bytes variable "msg"
	;0x0a (0a = hex for 10) codes for the newline character
	len equ $ - msg ;location of after the string minus the starting position of msg
	;$ indicates current position of the code

	;db stands for "define byte" and is used to define one-byte data elements. It can be used to define ASCII characters, for example: db 'A'.
	;dw stands for "define word" and is used to define two-byte data elements. It can be used to define integers, for example: dw 1234.
	;dd stands for "define doubleword" and is used to define four-byte data elements. It can be used to define long integers or memory addresses, for example: dd 0x12345678.

section .text ;directive that specifies the section of the program containing executable code.
_start:
	mov eax, 4 ;sys_write system call
	mov ebx, 1 ;standard output
	mov ecx, msg
	mov edx, len
	int 0x80 ;the 0x denotes a hexadecimal number ;performs a system call

	mov eax, 1 ;sys_write system call
	mov ebx, 0 ;exit status is 0
	int 0x80

