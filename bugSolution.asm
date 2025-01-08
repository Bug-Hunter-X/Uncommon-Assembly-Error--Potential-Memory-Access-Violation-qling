; Corrected version with error handling
section .data
    array dw 10, 20, 30, 40 ; Example array
    array_size equ ($-array)/2 ; Size of array in words

section .text
    global _start

_start:
    mov ebx, array ; Base address of the array
    mov ecx, 2 ; Index into the array (example)

    ; Check array bounds before accessing memory
    cmp ecx, array_size
    jge error_handler ; Handle out-of-bounds index

    mov eax, [ebx + ecx*2] ; Accessing the array element safely

    ; ... further processing of eax ...
    jmp exit_program

error_handler:
    ; Handle error appropriately (e.g., exit with error code)
    mov eax, 1 ; sys_exit
    mov ebx, 1 ; Error code
    int 0x80

exit_program:
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; Exit code 0
    int 0x80