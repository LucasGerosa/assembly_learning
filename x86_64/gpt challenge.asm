section .data
    new_line db 0x0a

section .bss
    input_buffer1 resb 1
    input_buffer2 resb 1

section .text
    global _start

_start:
    mov rcx, input_buffer1
    call GetNumber
    ;call write
    call print_new_line

    mov rcx, input_buffer2
    call GetNumber
    ;call write

    call exit

GetNumber:
    ;pusha

    get:
        mov rax, 0
        syscall
        cmp byte [rcx], 0x30
        jl get
        cmp byte [rcx], 0x39
        jg get
        ;popa
        ret

write:
    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    syscall
    ret

exit:
    mov rax, 60
    xor rdi, rdi
    syscall
    ret

print_new_line:
    mov rax, 1
    xor rdi, rdi
    lea rsi, [new_line]
    mov rdx, 1
    syscall
    ret