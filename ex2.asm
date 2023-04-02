global _start

_start:
; 4 general pupose registers: eax, ebx, ecx, and edx
    mov eax, 2 ;eax is a special register bc it is used as the accumulator and has a special role in various system calls.
    mov ebx, 30 ;ebx is a special register stout (standard output) file descriptor.
	sub ebx, 10
	mov ecx, 20
	add ebx, ecx
	mul ebx
	
	mov ebx, eax ;ebx will have a value of 80, representing an unsuccessful exit status
	mov eax, 1 ;without this, it outputs "segmentation fault (core dumped)"
    int 0x80 ; int short for interrupt. If this is called with eax having a value of 1, it executes the system call for exiting the program. Without it, it outputs "segmentation fault (core dumped)"