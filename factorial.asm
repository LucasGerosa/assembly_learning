%include "utils.asm"

section .bss ;block starting system is used for uninitialized data
	input_buffer1 resb 1 ;will store ASCII for the first number from 0 to 9
	result_buffer resd 1 ;will store the result of the factorial
	output_buffer resb 10 ; will store the result as a string

section .text
    global _start

_start:
	mov ecx, input_buffer1
    call GetNumber

	call factorials
	mov ecx, result_buffer
	call print_int
	call print_new_line
    call exit

factorials:
    movzx eax, byte [input_buffer1]; Move and zero-extend byte from input_buffer1 to eax
    sub eax, 0x30 ; Convert from ASCII to integer
    mov ebx, eax

    loop:
        dec ebx
        cmp ebx, 1
        mul eax
        jg loop
    mov [result_buffer], eax
    ret


print_int:
    push eax
    push ebx
    push ecx
    push edx

    mov ecx, output_buffer + 9 ; Start from the end of the buffer
    xor edx, edx

	print_loop:
		mov eax, [result_buffer]
		mov ebx, 10
		div ebx ; The quotient will be stored in eax, and the remainder will be stored in edx (specifically, dl, as the remainder will be a single digit).
		add dl, '0'
		dec ecx
		mov byte [ecx], dl
		cmp eax, 0
		jne print_loop

		; Print the result
		mov eax, 4
		mov ebx, 1
		sub ecx, output_buffer
		mov edx, ecx
		;neg edx
		add edx, 10
		mov ecx, output_buffer
		int 0x80

		pop edx
		pop ecx
		pop ebx
		pop eax
    ret