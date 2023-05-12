%include "utils.asm"

section .bss ;block starting system is used for uninitialized data
	input_buffer1 resd 1 ;will store ASCII for the first number from 0 to 9
	input_buffer2 resd 1
	result_buffer resd 1

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
    ret

write:
    mov eax, 4
    mov ebx, 1 ; Set file descriptor for stdout
    mov edx, 4
    int 0x80
    ret