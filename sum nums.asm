section .data
	new_line db 0x0a

section .bss ;block starting system is used for uninitialized data
	input_buffer1 resb 1 ;will store ASCII for the first number from 0 to 9
	input_buffer2 resb 1
	result_buffer resb 1

section .text
    global _start

_start:
    mov ecx, input_buffer1
    call GetNumber
    ;call write

    mov ecx, input_buffer2
    call GetNumber
    ;call write

	call add_nums
	mov ecx, result_buffer
	call write
    call exit

GetNumber:
    ;pusha

	get:
		mov eax, 3
		mov ebx, 0
		mov edx, 1
		int 0x80
		cmp byte [ecx], 0x30
		jl get
		cmp byte [ecx], 0x39
		jg get
		;popa
		;call print_new_line
		ret

write:
    mov eax, 4
    mov ebx, 1 ; Set file descriptor for stdout
    mov edx, 1
    int 0x80
    ret

exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80
    ret

add_nums:
	mov al, [input_buffer1]
    sub al, 0x30
    mov ah, [input_buffer2]
    sub ah, 0x30

    ; Add the two integers
    add al, ah

    ; Convert the sum to its ASCII representation
    add al, 0x30

    ; Store the result in the result_buffer
    mov [result_buffer], al

print_new_line:
	mov eax, 4
	xor ebx, ebx
	mov ecx, new_line ;note: ecx needs to store an address, not a value, or it won't work.
	mov edx, 1
	int 0x80
	ret

